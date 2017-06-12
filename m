From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Jun 2017 00:08:35 +0200
Subject: [Buildroot] [PATCH] gcc: add option to build and install gcc's
	libssp
In-Reply-To: <AM3PR05MB433082E20B48215DFA88130C9CD0@AM3PR05MB433.eurprd05.prod.outlook.com>
References: <AM3PR05MB433082E20B48215DFA88130C9CD0@AM3PR05MB433.eurprd05.prod.outlook.com>
Message-ID: <5c2a90b2-8989-fb5d-aed4-f06d3fd3ef43@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Guy,

On 12-06-17 10:23, Guy Benyei wrote:
> When stack smashing protection is not provided by the C library, libssp
> provides the functionality needed to support the -fstack-protector flag.

 I have a few details that can be improved below. However, I still wonder
whether this feature is useful at all.

 The new symbol will only appear in two cases:

- with uClibc, if BR2_TOOLCHAIN_BUILDROOT_USE_SSP is not selected;
- with musl, for i386 and powerpc (because it is broken on musl).

 In the uClibc case, I really see no reason to prefer the gcc version instead of
the uClibc version. So that basically leaves just the musl case. Is that the
situation you are trying to fix? If that is it, I think it's better not to have
a config options at all, but just enable the gcc thing if musl && (i386 || powerpc).

 Or is there another reason why you need this?

[snip]
> +config BR2_TOOLCHAIN_INSTALL_LIBSSP
> +	bool "Enable stack protection support using libssp"
> +	depends on !BR2_LIBC_HAS_SSP
> +	select BR2_TOOLCHAIN_HAS_SSP
> +	help
> +	  Enable stack smashing protection support using GCCs
> +	  -fstack-protector option by installing libssp. This
> +	  option should be used only when the C library doesn't
> +	  support stack smashing protection.

 Since now this option only appears when the C library doesn't support ssp, this
second sentence is redundant.

> +
> +	  See http://wiki.osdev.org/Stack_Smashing_Protector#libssp
> +	  for details.
> +
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index e8d2e18..67106ed 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -147,6 +147,17 @@ endef
>  
>  HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBATOMIC
>  
> +define HOST_GCC_FINAL_INSTALL_LIBSSP
> +	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libssp* \
> +		$(STAGING_DIR)/lib/
> +	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libssp* \
> +		$(TARGET_DIR)/lib/
> +endef

 This is the third post-install-hook that is used only to install in /lib, so
perhaps it's time to refactor that into HOST_GCC_FINAL_LIBS and a loop like for
/usr/lib. But that can be done in a follow-up patch.

> +
> +ifeq ($(BR2_TOOLCHAIN_INSTALL_LIBSSP),y)
> +HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBSSP
> +endif
> +
>  # Handle the installation of libraries in /usr/lib
>  HOST_GCC_FINAL_USR_LIBS =
>  
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index b52f945..4691846 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -90,7 +90,6 @@ HOST_GCC_COMMON_CONF_OPTS = \
>  	--with-sysroot=$(STAGING_DIR) \
>  	--disable-__cxa_atexit \
>  	--with-gnu-ld \
> -	--disable-libssp \
>  	--disable-multilib \
>  	--with-gmp=$(HOST_DIR)/usr \
>  	--with-mpc=$(HOST_DIR)/usr \
> @@ -110,6 +109,11 @@ GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
>  HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
>  HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
>  
> +# don't build libssp if it's not explicitly required
> +ifneq ($(BR2_TOOLCHAIN_INSTALL_LIBSSP),y)
> +HOST_GCC_COMMON_CONF_OPTS += --disable-libssp

 Please also add an explicit --enable. That also allows you to use positive
logic for the condition.

> +endif
> +
>  # libitm needs sparc V9+
>  ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
>  HOST_GCC_COMMON_CONF_OPTS += --disable-libitm
> @@ -286,7 +290,7 @@ endif # !BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS
>  # available or not in the C library is not working properly for
>  # uClibc, so let's be explicit as well.
>  HOST_GCC_COMMON_MAKE_OPTS = \
> -	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
> +	gcc_cv_libc_provides_ssp=$(if $(BR2_LIBC_HAS_SSP),yes,no)
>  
>  ifeq ($(BR2_CCACHE),y)
>  HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 115388e..d5494b7 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_GLIBC
>  	bool
>  	default y
>  	select BR2_PACKAGE_LINUX_HEADERS
> +	select BR2_LIBC_HAS_SSP
>  	select BR2_TOOLCHAIN_HAS_SSP

 Instead of having both here, move the "select BR2_TOOLCHAIN_HAS_SSP" to the
definition of BR2_LIBC_HAS_SSP.

>  
>  choice
> diff --git a/package/musl/Config.in b/package/musl/Config.in
> index bedc50c..6b3d542 100644
> --- a/package/musl/Config.in
> +++ b/package/musl/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_MUSL
>  	depends on BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_PACKAGE_LINUX_HEADERS
>  	# SSP broken on i386/ppc: http://www.openwall.com/lists/musl/2016/12/04/2
> -	select BR2_TOOLCHAIN_HAS_SSP if !(BR2_i386 || BR2_powerpc)
> +	select BR2_LIBC_HAS_SSP if !(BR2_i386 || BR2_powerpc)
> +	select BR2_TOOLCHAIN_HAS_SSP if BR2_LIBC_HAS_SSP
>  	# Compatibility headers: cdefs.h, queue.h
>  	select BR2_PACKAGE_MUSL_COMPAT_HEADERS
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index b0b0b01..b87125c 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -71,6 +71,7 @@ config BR2_PTHREAD_DEBUG
>  
>  config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
>  	bool "Enable stack protection support"
> +	select BR2_LIBC_HAS_SSP
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	help
>  	  Enable stack smashing protection support using GCCs
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index d670f44..3ffb5fb 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -45,6 +45,9 @@ config BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
>  	bool
>  
> +config BR2_LIBC_HAS_SSP
> +	bool

 i.e. here.

 Regards,
 Arnout

> +
>  config BR2_TOOLCHAIN_HAS_SSP
>  	bool
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
