From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 22:57:49 +0100
Subject: [Buildroot] [PATCH] toolchain: create symlink to 'lib' from
 ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <1445245676-21017-1-git-send-email-patrickdepinguin@gmail.com>
References: <1445245676-21017-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <564A515D.1030800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

On 19-10-15 11:07, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Currently, following symbolic links are created in both target and
> staging directories:
> - lib(32|64) --> lib
> - usr/lib(32|64) --> lib
> 
> The decision for lib32 or lib64 is based on the target architecture
> configuration in buildroot (BR2_ARCH_IS_64).
> 
> In at least one case this is not correct: when building for a Cavium Octeon
> III processor using the toolchain from the Cavium Networks SDK, and
> specifying -march=octeon3 in BR2_TARGET_OPTIMIZATION, libraries are expected
> in directory 'lib32-fp' rather than 'lib32' (likewise for lib64-fp).
> 
> More generally, for external toolchains, the correct symbolic link is
> from (usr/)${ARCH_LIB_DIR} to lib. For internal toolchains, current
> toolchains always use either lib32 or lib64.

 Sorry, it's not OK (yet). The reason we add the lib32 and lib64 symlinks for
the internal toolchain as well is because there are some slightly broken
packages that expect these directories to exist. With this patch, the symlink is
no longer created for some external toolchains, e.g. musl. Unfortunately, I'm
not sure which packages are problematic. A quick search through the archives
points at libatomic_ops as a candidate.

 So I think the solution is to keep on creating the symlink like is done now,
and just check if ${ARCH_LIB_DIR} exists for the external toolchains.


 Some minor coding style comments below (some of them probably not relevant
anymore).

> 
> Fix the problem as follows:
> - create a symlink creation helper in toolchain/helpers.mk
> - for external toolchains, call these helpers based on ARCH_LIB_DIR
> - for internal toolchains, call these helpers based on the existing
>   fixed lib32/lib64 logic, moved from Makefile into gcc-initial.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[snip]
> diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
> index c0b5eaf..bd40c7f 100644
> --- a/package/gcc/gcc-initial/gcc-initial.mk
> +++ b/package/gcc/gcc-initial/gcc-initial.mk
> @@ -63,4 +63,21 @@ HOST_GCC_INITIAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_A
>  HOST_GCC_INITIAL_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
>  HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
>  
> +# The creation of lib32/lib64 symlinks into target and staging directories
> +# needs to be done before the C library is installed. Hooking into the libc
> +# hooks directly is tricky because there are multiple C libraries supported.
> +# Instead, hook into the install step of host-gcc-initial.
> +#
> +# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
> +ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
> +HOST_GCC_INITIAL_LIB_SYMLINK = lib64
> +else
> +HOST_GCC_INITIAL_LIB_SYMLINK = lib32
> +endif
> +define HOST_GCC_INITIAL_CREATE_STAGING_TARGET_SYMLINK
> +	$(Q)$(call create_lib_symlinks,$(HOST_GCC_INITIAL_LIB_SYMLINK),$(STAGING_DIR))
> +	$(Q)$(call create_lib_symlinks,$(HOST_GCC_INITIAL_LIB_SYMLINK),$(TARGET_DIR))

 It's simpler and clearer IMHO to create the symlinks here directly (it's just
two ln -s calls after all).

> +endef
> +HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_INITIAL_CREATE_STAGING_TARGET_SYMLINK
> +
>  $(eval $(host-autotools-package))
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index 920d3b4..a255c5c 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -38,8 +38,6 @@ define SKELETON_INSTALL_TARGET_CMDS
>  		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>  		$(SKELETON_PATH)/ $(TARGET_DIR)/
>  	$(SKELETON_USR_SYMLINKS_OR_DIRS)
> -	ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
> -	ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
>  	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
>  		$(TARGET_DIR_WARNING_FILE)
>  endef
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 1452ec6..ed89043 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -1,5 +1,18 @@
>  # This Makefile fragment declares toolchain related helper functions.
>  
> +# Create the necessary symlink from (usr/)lib32|lib64|lib32-fp|... to lib
> +# In general, for external toolchains, the correct link name is $ARCH_LIB_DIR.
> +# $1: link name
> +# $2: destination directory (TARGET_DIR / STAGING_DIR)
> +create_lib_symlinks = \
> +	LIB_SYMLINK="$(strip $1)" ; \
> +	DESTDIR="$(strip $2)" ; \
> +	if [ "$${LIB_SYMLINK}" != "lib" ]; then \
> +		mkdir -p "$${DESTDIR}/usr" ; \
> +		ln -snf lib "$${DESTDIR}/$${LIB_SYMLINK}" ; \
> +		ln -snf lib "$${DESTDIR}/usr/$${LIB_SYMLINK}" ; \
> +	fi
> +
>  # The copy_toolchain_lib_root function copies a toolchain library and
>  # its symbolic links from the sysroot directory to the target
>  # directory. Note that this function is used both by the external
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 4e12a1c..2a224de 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -655,6 +655,16 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
>  	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
>  endef
>  
> +define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
> +	$(Q)ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \

 If gcc doesn't call create_lib_symlinks anymore, this can be part of that function.


 Regards,
 Arnout

> +	$(call create_lib_symlinks,$${ARCH_LIB_DIR},$(STAGING_DIR))
> +endef
> +
> +define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
> +	$(Q)ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +	$(call create_lib_symlinks,$${ARCH_LIB_DIR},$(TARGET_DIR))
> +endef
> +
>  # Special installation target used on the Blackfin architecture when
>  # FDPIC is not the primary binary format being used, but the user has
>  # nonetheless requested the installation of the FDPIC libraries to the
> @@ -769,6 +779,7 @@ endef
>  TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_BUILD_WRAPPER)
>  
>  define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
> +	$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
> @@ -778,6 +789,7 @@ endef
>  # and the target directory, we do everything within the
>  # install-staging step, arbitrarily.
>  define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
> +	$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
