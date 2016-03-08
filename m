From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Mar 2016 23:35:25 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: add support for the newlib
 library
In-Reply-To: <1442474492-13774-1-git-send-email-cjwfirmware@vxmdesign.com>
References: <1442474492-13774-1-git-send-email-cjwfirmware@vxmdesign.com>
Message-ID: <56DF53AD.9080309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/17/15 09:21, Chris Wardman wrote:
> This patch adds support to build gcc with the newlib library. This library
> will not build against linux, but does enable user to build bare metal images
> and other small kernels for processors.
>
> This has been tested against building arm-buildroot-eabi- and tested against
> an STM32F4Discovery board with an STM32F407 processor.

  I would expect that at least some existing libraries would also compile. I 
tried a few but nothing works...

  As Peter mentioned, all packages, system and filesystems, and probably linux 
as well, should be disabled in the config when newlib is selected. Also the 
kernel headers selection should be removed.

  I've checked with other core developers and there is not a lot of enthusiasmto 
include this (as witnessed by the long delay in reviewing this patch). So you'd 
need to be very active in pushing this to make it feasible.

>
> Signed-off-by: Chris Wardman <cjwfirmware@vxmdesign.com>
> ---
>   package/Makefile.in                                |  6 +++
>   package/gcc/gcc-final/gcc-final.mk                 |  4 ++
>   package/gcc/gcc.mk                                 |  4 ++
>   .../0001-newlib-fix-include-install-location.patch | 40 +++++++++++++++++++
>   package/newlib/Config.in                           |  5 +++
>   package/newlib/newlib.mk                           | 45 ++++++++++++++++++++++
>   toolchain/Config.in                                |  6 +++
>   toolchain/toolchain-buildroot/Config.in            |  9 +++++
>   8 files changed, 119 insertions(+)
>   create mode 100644 package/newlib/0001-newlib-fix-include-install-location.patch
>   create mode 100644 package/newlib/Config.in
>   create mode 100644 package/newlib/newlib.mk
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 545694f..dedc622 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -37,7 +37,11 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
>   endif
>
>   # Compute GNU_TARGET_NAME
> +ifeq ($(BR2_TOOLCHAIN_NO_OS_TUPLE),y)
> +GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(ABI)
> +else
>   GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
> +endif
>
>   # FLAT binary format needs uclinux
>   ifeq ($(BR2_BINFMT_FLAT),y)
> @@ -50,6 +54,8 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
>   LIBC = uclibc
>   else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
>   LIBC = musl
> +else ifeq ($(BR2_TOOLCHAIN_USES_NEWLIB),y)
> +LIBC = newlib
>   else
>   LIBC = gnu
>   endif
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 86b3c78..ba8d644 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -72,6 +72,10 @@ else
>   HOST_GCC_FINAL_CONF_OPTS += --enable-shared
>   endif
>
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_NEWLIB),y)
> +HOST_GCC_FINAL_CONF_OPTS += --with-newlib
> +endif
> +
>   ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
>   HOST_GCC_FINAL_CONF_OPTS += --enable-libgomp
>   else
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 501fcea..26451d4 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -100,6 +100,10 @@ HOST_GCC_COMMON_CONF_OPTS = \
>   HOST_GCC_COMMON_CONF_ENV = \
>   	MAKEINFO=missing
>
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_NEWLIB),y)

  There should be a comment here to explain why this is needed.

> +HOST_GCC_COMMON_CONF_OPTS += --with-gnu-as
> +endif
> +
>   GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
>   GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
>
> diff --git a/package/newlib/0001-newlib-fix-include-install-location.patch b/package/newlib/0001-newlib-fix-include-install-location.patch
> new file mode 100644
> index 0000000..a0b5951
> --- /dev/null
> +++ b/package/newlib/0001-newlib-fix-include-install-location.patch
> @@ -0,0 +1,40 @@
> +Newlib fix for the include install location
> +
> +Newlib normally installs its headers in a directory labled after the target
> +like (/usr/arm-buildroot-eabi/include/), but buildroot already creates a
> +location for the headers that conflicts with newlib's default settings.
> +
> +This patch does a minor correction to the path so the headers are installed in
> +the proper location.
> +
> +It should just modify configure.ac, and then buildroot can run the autoconf
> +tools, but newlib requires a specific version of the autoconf tools to be run.
> +So, this patch modifies both configure and configure.ac since it is a simple
> +change, though it is a slight hack.
> +
> +Signed-off-by: Chris Wardman <cjwfirmware@vxmdesign.com>
> +
> +diff -uNr newlib-old/configure newlib-new/configure
> +--- newlib-old/configure	2014-07-05 17:09:07.000000000 -0400
> ++++ newlib-new/configure	2015-09-16 13:44:08.814638168 -0400
> +@@ -6985,7 +6985,7 @@
> +
> + # Some systems (e.g., one of the i386-aix systems the gas testers are
> + # using) don't handle "\$" correctly, so don't use it here.
> +-tooldir='${exec_prefix}'/${target_noncanonical}
> ++tooldir='${exec_prefix}'
> + build_tooldir=${tooldir}
> +
> + # Create a .gdbinit file which runs the one in srcdir
> +diff -uNr newlib-old/configure.ac newlib-new/configure.ac
> +--- newlib-old/configure.ac	2014-07-05 17:09:07.000000000 -0400
> ++++ newlib-new/configure.ac	2015-09-16 13:44:22.726638079 -0400
> +@@ -2414,7 +2414,7 @@
> +
> + # Some systems (e.g., one of the i386-aix systems the gas testers are
> + # using) don't handle "\$" correctly, so don't use it here.
> +-tooldir='${exec_prefix}'/${target_noncanonical}
> ++tooldir='${exec_prefix}'
> + build_tooldir=${tooldir}
> +
> + # Create a .gdbinit file which runs the one in srcdir
> diff --git a/package/newlib/Config.in b/package/newlib/Config.in
> new file mode 100644
> index 0000000..c801385
> --- /dev/null
> +++ b/package/newlib/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_NEWLIB
> +	bool
> +	depends on BR2_TOOLCHAIN_USES_NEWLIB
> +	default y
> +
> diff --git a/package/newlib/newlib.mk b/package/newlib/newlib.mk
> new file mode 100644
> index 0000000..e3ba4df
> --- /dev/null
> +++ b/package/newlib/newlib.mk
> @@ -0,0 +1,45 @@
> +################################################################################
> +#
> +# newlib
> +#
> +################################################################################
> +
> +NEWLIB_VERSION = 2.2.0-1
> +NEWLIB_SITE = ftp://sourceware.org/pub/newlib
> +NEWLIB_LICENSE = MIT
> +NEWLIB_LICENSE_FILES = COPYRIGHT
> +
> +NEWLIB_DEPENDENCIES = host-gcc-initial
> +NEWLIB_ADD_TOOLCHAIN_DEPENDENCY = NO
> +NEWLIB_INSTALL_STAGING = YES
> +NEWLIB_INSTALL_TARGET = NO
> +################################################################################
> +# So, I've looked into this a bit. The default configure command sets flags
> +# which don't work with gcc initial.

  Which flag in particular? Any flag which is not appropriate should be possible 
to override in NEWLIB_CONF_OPTS.

> +################################################################################
> +
> +define NEWLIB_CONFIGURE_CMDS
> +       (cd $(@D); \
> +	$(TARGET_CONFIGURE_OPTS) \
> +		CFLAGS="" \
> +		CC="" \
> +		LDFLAGS="" \
> +		./configure \
> +			--target=$(GNU_TARGET_NAME) \
> +			--host=$(GNU_HOST_NAME) \
> +			--prefix=/usr \
> +			--includedir=$(STAGING_DIR)/usr/include \
> +			--oldincludedir=$(STAGING_DIR)/usr/include \
> +			--with-build-sysroot=$(STAGING_DIR) \
> +			--enable-newlib-io-long-long \
> +			--enable-newlib-register-fini \
> +			--disable-newlib-supplied-syscalls \
> +			--disable-nls)	
> +endef
> +
> +define NEWLIB_PRE_INSTALL_STAGING_HOOKS
> +	mkdir -p $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib

  Why is this needed? Add a comment if it really is needed.

> +endef
> +
> +$(eval $(autotools-package))
> +

  Spurious empty line.


  Regards,
  Arnout

> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index a851ce4..8b2ab1e 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -28,6 +28,12 @@ config BR2_TOOLCHAIN_USES_MUSL
>   	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>   	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>
> +config BR2_TOOLCHAIN_USES_NEWLIB
> +	bool
> +
> +config BR2_TOOLCHAIN_NO_OS_TUPLE
> +	bool
> +
>   choice
>   	prompt "Toolchain type"
>   	help
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 13e2b15..d88ff5f 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -94,6 +94,14 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
>   	  This option selects musl as the C library for the
>   	  cross-compilation toolchain.
>
> +config BR2_TOOLCHAIN_BUILDROOT_NEWLIB
> +	bool "newlib (experimental)"
> +	depends on BR2_arm
> +	select BR2_TOOLCHAIN_USES_NEWLIB
> +	select BR2_TOOLCHAIN_NO_OS_TUPLE
> +	help
> +	  This will build the newlib library for a toolchain without an OS
> +
>   endchoice
>
>   config BR2_TOOLCHAIN_BUILDROOT_LIBC
> @@ -104,6 +112,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
>   	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>   	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>   	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
> +	default "newlib" if BR2_TOOLCHAIN_BUILDROOT_NEWLIB
>
>   source "package/uclibc/Config.in"
>   source "package/glibc/Config.in"
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
