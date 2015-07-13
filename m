From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jul 2015 18:57:14 +0200
Subject: [Buildroot] [PATCHv3 for next 2/2] toolchain: create symlink to
 'lib' from ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <1424259375-20288-3-git-send-email-patrickdepinguin@gmail.com>
References: <1424259375-20288-1-git-send-email-patrickdepinguin@gmail.com>
 <1424259375-20288-3-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <55A3EDEA.7040308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

 Sorry that it is taking so long to make progress on this, but the external
toolchain stuff is, as you know, horribly demotivating... We've spent quite a
bit of time to understand what this patch does and how it could be done better...

On 02/18/15 12:36, Thomas De Schampheleire wrote:
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
> 
> Fix the problem as follows:
> - create symlink creation helpers in toolchain/helpers.mk
> - for external toolchains, call these helpers based on ARCH_LIB_DIR
> - for internal toolchains, call these helpers based on the existing
>   fixed lib32/lib64 logic, moved from Makefile
> - to fix build order problems, add the correct dependency on
>   $(BUILD_DIR) from $(BUILD_DIR)/.root

 It's not clear to us which build order problems are solved by this, and
especially how these build order problems are introduced by this patch... Could
you explain that a little?

> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
> v3:
> - update commit message wrapping
> - change dependency on $(BUILD_DIR) to a order-only dependency
> v2:
> - fix 'lib32-fp' leftover in toolchain-buildroot
> - silence commands creating symlink with $(Q)
> - fix case where ARCH_LIB_DIR is 'lib'
> 
> Note: the handling in the internal toolchain is a bit awkward because it
> explicitly adds a new target, but I don't see a much better way: it must
> be done _before_ the toolchain is being built. The entire logic cannot
> be done in Makefile as ARCH_LIB_DIR is not available there.
> ---
>  Makefile                                             | 14 +-------------
>  toolchain/helpers.mk                                 | 16 ++++++++++++++++
>  toolchain/toolchain-buildroot/toolchain-buildroot.mk | 11 +++++++++++
>  toolchain/toolchain-external/toolchain-external.mk   | 12 ++++++++++++
>  4 files changed, 40 insertions(+), 13 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 338c992..de202b0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -449,20 +449,10 @@ world: target-post-image
>  $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
>  	@mkdir -p $@
>  
> -# We make a symlink lib32->lib or lib64->lib as appropriate
> -# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
> -ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
> -LIB_SYMLINK = lib64
> -else
> -LIB_SYMLINK = lib32
> -endif

 Yeah, it's good to see this disappear from top-level Makefile!

> -
>  $(STAGING_DIR):
>  	@mkdir -p $(STAGING_DIR)/bin
>  	@mkdir -p $(STAGING_DIR)/lib
> -	@ln -snf lib $(STAGING_DIR)/$(LIB_SYMLINK)
>  	@mkdir -p $(STAGING_DIR)/usr/lib
> -	@ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
>  	@mkdir -p $(STAGING_DIR)/usr/include
>  	@mkdir -p $(STAGING_DIR)/usr/bin
>  	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
> @@ -475,15 +465,13 @@ RSYNC_VCS_EXCLUSIONS = \
>  	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
>  	--exclude CVS
>  
> -$(BUILD_DIR)/.root:
> +$(BUILD_DIR)/.root: | $(BUILD_DIR)
>  	mkdir -p $(TARGET_DIR)
>  	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
>  		--chmod=Du+w --exclude .empty --exclude '*~' \
>  		$(TARGET_SKELETON)/ $(TARGET_DIR)/
>  	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
> -	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
>  	@mkdir -p $(TARGET_DIR)/usr
> -	@ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
>  	touch $@
>  
>  $(TARGET_DIR): $(BUILD_DIR)/.root
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 3121da4..b4879e0 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -1,5 +1,21 @@
>  # This Makefile fragment declares toolchain related helper functions.
>  
> +# Create the necessary symlink from (usr/)lib32|lib64|lib32-fp|... to lib
> +# In general, for external toolchains, the correct link name is $ARCH_LIB_DIR.
> +create_staging_lib_symlink = \
> +	LIB_SYMLINK="$(strip $1)" ; \
> +	if [ "$${LIB_SYMLINK}" != "lib" ]; then \
> +		ln -snf lib $(STAGING_DIR)/$${LIB_SYMLINK} ; \
> +		ln -snf lib $(STAGING_DIR)/usr/$${LIB_SYMLINK} ; \
> +	fi
> +
> +create_target_lib_symlink = \
> +	LIB_SYMLINK="$(strip $1)" ; \
> +	if [ "$${LIB_SYMLINK}" != "lib" ]; then \
> +	    ln -snf lib $(TARGET_DIR)/$${LIB_SYMLINK} ; \
> +	    ln -snf lib $(TARGET_DIR)/usr/$${LIB_SYMLINK} ; \
> +	fi

 These two functions are identical except for the target dir, so create just one
function with the directory as a second parameter.

> +
>  # The copy_toolchain_lib_root function copies a toolchain library and
>  # its symbolic links from the sysroot directory to the target
>  # directory. Note that this function is used both by the external
> diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> index b30cc33..3ccb030 100644
> --- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> +++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> @@ -12,6 +12,17 @@ BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
>  
>  TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
>  
> +ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)

 The comment about MIPS64/n32 should have been retained here.

> +LIB_SYMLINK = lib64
> +else
> +LIB_SYMLINK = lib32
> +endif

 Since now it is something specific to this .mk file, perhaps it should be
prefixed with TOOLCHAIN_BUILDROOT_

> +
> +host-gcc-final: create-lib-symlinks

 This is not just awkward, it also breaks top-level parallel build. At least, if
host-gcc-final really does need this to be done. In top-level parallel build,
the order between the dependencies is not set, so it's possible that the
symlinks are only created after the build of gcc has already started. Of course,
it's vanishingly unlikely that it will not yet have finished by the time the gcc
install step starts... Actually, we wonder if it is really needed before
gcc-final, or even before the libc? Because the way that make evaluates things
in the non-parallel case, this step would have been done before anything else,
even before host-binutils...

 If it really should be done before host-gcc-final, the full solution would be
to add this as a post-install hook to the libc. You could do something like this:

$(call uppercase,$(BR_LIBC))_POST_INSTALL_STAGING_HOOKS += \
	$(call create_staging_lib_symlink,$(LIB_SYMLINK))

Isn't that beautiful :-) This also has the advantage of splitting the staging
and target installs into their appropriate locations.

 Alternatively, you could add a tiny package without source that does this and
add that as a dependency to host-gcc-final.



 Do you still have the energy to make some changes and resubmit?

 Regards,
 Arnout

> +create-lib-symlinks: $(STAGING_DIR) $(TARGET_DIR)
> +	$(call create_staging_lib_symlink,$(LIB_SYMLINK))
> +	$(call create_target_lib_symlink,$(LIB_SYMLINK))
> +
>  TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
>  $(eval $(virtual-package))
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index e05957c..16e398c 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -600,6 +600,16 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
>  	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
>  endef
>  
> +define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
> +	$(Q)ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +	$(call create_staging_lib_symlink,$${ARCH_LIB_DIR})
> +endef
> +
> +define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
> +	$(Q)ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +	$(call create_target_lib_symlink,$${ARCH_LIB_DIR})
> +endef
> +
>  # Special installation target used on the Blackfin architecture when
>  # FDPIC is not the primary binary format being used, but the user has
>  # nonetheless requested the installation of the FDPIC libraries to the
> @@ -699,6 +709,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
>  endef
>  
>  define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
> +	$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
> @@ -708,6 +719,7 @@ endef
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
