From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Oct 2016 13:07:01 +0200
Subject: [Buildroot] [PATCH 02/30] toolchain-external: pass CC and
 CFLAGS as arguments
In-Reply-To: <1477255711-28603-3-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
 <1477255711-28603-3-git-send-email-romain.naour@gmail.com>
Message-ID: <d9ace2a7-d062-64a3-fe7d-9afeb4adec42@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-16 22:48, Romain Naour wrote:
> As soon as the external toolchain infrastructure gets introduced in a
> future commit, the TOOLCHAIN_EXTERNAL_CC and TOOLCHAIN_EXTERNAL_CFLAGS
> will be provided by the external toolchain package using
> <external-toolchain-name>_CC and <external-toolchain-name>_CFLAGS.
> 
> This commit prepares the transition to the external toolchain
> infrastructure by passing CC and CFLAGS as function arguments.

 This is exactly the same commit message as the previous commit. However, what
this patch actually does is

1. Pass up CC and CFLAGS one level more
 -> I think this should be squashed with the previous commit.

2. pass LIBS as arguments
 -> This should be a separate commit, with the appropriate commit message.

 But this is not so essential, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 42 +++++++++++++---------
>  1 file changed, 25 insertions(+), 17 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 1f57359..4dde91e 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -630,10 +630,11 @@ endef
>  # Buildroot, Crosstool-NG, CodeSourcery and Linaro
>  # before doing any modification on the below logic.
>  
> +# $1: toolchain LIBS
>  ifeq ($(BR2_STATIC_LIBS),)
>  define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
>  	$(Q)$(call MESSAGE,"Copying external toolchain libraries to target...")
> -	$(Q)for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
> +	$(Q)for libs in $(1); do \
>  		$(call copy_toolchain_lib_root,$$libs); \
>  	done
>  endef
> @@ -662,13 +663,15 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER
>  endef
>  endif
>  
> +# $1: toolchain CC
> +# $2: toolchain CFLAGS
>  define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
> -	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
> -	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> -	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(1))" ; \
> +	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(1) $(2))" ; \
> +	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(1) $(2))" ; \
>  	SUPPORT_LIB_DIR="" ; \
>  	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
> -		LIBSTDCPP_A_LOCATION=$$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
> +		LIBSTDCPP_A_LOCATION=$$(LANG=C $(1) $(2) -print-file-name=libstdc++.a) ; \
>  		if [ -e "$${LIBSTDCPP_A_LOCATION}" ]; then \
>  			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
>  		fi ; \
> @@ -682,24 +685,27 @@ endef
>  # FDPIC is not the primary binary format being used, but the user has
>  # nonetheless requested the installation of the FDPIC libraries to the
>  # target filesystem.
> +# $1: toolchain CC
> +# $2: toolchain CFLAGS
>  ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
>  define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
>  	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to staging...")
> -	$(Q)FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
> -	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> -	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +	$(Q)FDPIC_EXTERNAL_CC=$(dir $(1))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
> +	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(2))" ; \
> +	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(2))" ; \
>  	FDPIC_SUPPORT_LIB_DIR="" ; \
>  	if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
> -	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
> +	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $(2) -print-file-name=libstdc++.a) ; \
>  	        if [ -e "$${FDPIC_LIBSTDCPP_A_LOCATION}" ]; then \
>  	                FDPIC_SUPPORT_LIB_DIR=`readlink -f $${FDPIC_LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
>  	        fi ; \
>  	fi ; \
>  	$(call copy_toolchain_sysroot,$${FDPIC_SYSROOT_DIR},$${FDPIC_SYSROOT_DIR},,$${FDPIC_LIB_DIR},$${FDPIC_SUPPORT_LIB_DIR})
>  endef
> +# $1: toolchain LIBS
>  define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC
>  	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...")
> -	$(Q)for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
> +	$(Q)for libs in $(1); do \
>  		$(call copy_toolchain_lib_root,$$libs); \
>  	done
>  endef
> @@ -711,11 +717,13 @@ endif
>  # to the target filesystem. The flat libraries are found and linked
>  # according to the index in name "libN.so". Index 1 is reserved for
>  # the standard C library. Customer libraries can use 4 and above.
> +# $1: toolchain CC
> +# $2: toolchain CFLAGS
>  ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
>  define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT
>  	$(Q)$(call MESSAGE,"Install external toolchain FLAT libraries to target...")
> -	$(Q)FLAT_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
> -	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -mid-shared-library -print-file-name=libc`; \
> +	$(Q)FLAT_EXTERNAL_CC=$(dir $(1))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
> +	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $(2) -mid-shared-library -print-file-name=libc`; \
>  	if [ -f $${FLAT_LIBC_A_LOCATION} -a ! -h $${FLAT_LIBC_A_LOCATION} ] ; then \
>  	        $(INSTALL) -D $${FLAT_LIBC_A_LOCATION} $(TARGET_DIR)/lib/lib1.so; \
>  	fi
> @@ -782,8 +790,8 @@ TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_BUILD_WRAPPER)
>  
>  define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
>  	$(call TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
> -	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
> -	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC)
> +	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
> +	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
>  endef
> @@ -793,10 +801,10 @@ endef
>  # install-staging step, arbitrarily.
>  define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
>  	$(call TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
> -	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
> +	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS,$(TOOLCHAIN_EXTERNAL_LIBS))
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
> -	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC)
> -	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT)
> +	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_LIBS))
> +	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
>  	$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
>  endef
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
