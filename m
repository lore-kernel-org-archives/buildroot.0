From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Sep 2015 22:41:01 +0200
Subject: [Buildroot] [PATCH 1/3] Experimental addition of the newlib
 library
In-Reply-To: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
Message-ID: <20150915204101.GC3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris, All,

On 2015-09-13 03:02 -0400, Chris Wardman spake thusly:
> This patch add support for a newlib library build of the gcc toolchain.
> This is designed to build arm-none-eabi- toolchain, and it was tested against an stm32f4discovery board.
> 
> Hopefully this will help people build bare metal code for arm processors

OK, I eventually had a bit of time to gave a cusory glance at the
patch...

> Signed-off-by: Chris Wardman <cjwfirmware@vxmdesign.com>
[--SNIP--]
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 545694f..7f4d74e 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -37,10 +37,16 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
>  endif
>  
>  # Compute GNU_TARGET_NAME
> +ifeq ($(BR2_TOOLCHAIN_NO_VENDOR),y)
> +GNU_TARGET_NAME = $(ARCH)-$(TARGET_OS)-$(LIBC)$(ABI)
> +else
>  GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
> +endif
>  
>  # FLAT binary format needs uclinux
> -ifeq ($(BR2_BINFMT_FLAT),y)
> +ifeq ($(BR2_TOOLCHAIN_USES_NEWLIB),y)
> +TARGET_OS = none

See how you have to set TARGET_OS=none here? With the change above we've
been discussing previously, this would construct a three-part tuple as
(because LIBC is empty, too, below):
    $(ARCH)-none-$(ABI)

which is directly in line with what I previosuly explained. Yeah me! :-)

> +else ifeq ($(BR2_BINFMT_FLAT),y)
>  TARGET_OS = uclinux
>  else
>  TARGET_OS = linux
> @@ -50,6 +56,8 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
>  LIBC = uclibc
>  else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
>  LIBC = musl
> +else ifeq ($(BR2_TOOLCHAIN_USES_NEWLIB),y)
> +LIBC = 

... here.

>  else
>  LIBC = gnu
>  endif
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk

I haven't had a look at the gcc part yet...

[--SNIP--]
> diff --git a/package/newlib/newlib-0001-configure-tooldir-path.patch b/package/newlib/newlib-0001-configure-tooldir-path.patch
> new file mode 100644
> index 0000000..c162678
> --- /dev/null
> +++ b/package/newlib/newlib-0001-configure-tooldir-path.patch
> @@ -0,0 +1,25 @@
> +This patch is required to fix how the newlib headers are installed. 
> +
> +The cross compiler expects headers to be in 
> +.../host/usr/arm-none-eabi/sysroot/usr/include/newlib.h
> +by default newlib installed the headers into 
> +.../host/usr/arm-none-eabi/sysroot/arm-none-eabi/include/newlib.h

Wouldn't that be the case for creating the symlink arm-none-eabi -> . as
we're doing for some external toolchains?

> +${exec_prefix} provides the .../host/usr/arm-none-eabi/sysroot path
> +${target_noncanonical} provides an extra arm-none-eabi/ that must be removed. 
> +
> +Signed-off-by: Chris Wardman <cjwfirmware@vxmdesign.com>
> +
> +
> +diff -uNr newlib-old/configure newlib-new/configure
> +--- newlib-old/configure	2014-07-05 17:09:07.000000000 -0400
> ++++ newlib-new/configure	2014-12-25 00:59:01.727549186 -0500
> +@@ -6985,7 +6985,7 @@
> + 
> + # Some systems (e.g., one of the i386-aix systems the gas testers are
> + # using) don't handle "\$" correctly, so don't use it here.
> +-tooldir='${exec_prefix}'/${target_noncanonical}
> ++tooldir='${exec_prefix}'/usr
> + build_tooldir=${tooldir}

But the patch looks pretty clean...

> + # Create a .gdbinit file which runs the one in srcdir
> diff --git a/package/newlib/newlib.mk b/package/newlib/newlib.mk
> new file mode 100644
> index 0000000..02008e5
> --- /dev/null
> +++ b/package/newlib/newlib.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +#
> +# newlib
> +#
> +################################################################################
> +
> +NEWLIB_VERSION = 2.2.0
> +NEWLIB_SITE = ftp://sourceware.org/pub/newlib
> +NEWLIB_LICENSE = MIT
> +NEWLIB_LICENSE_FILES = COPYRIGHT
> +
> +NEWLIB_DEPENDENCIES = host-gcc-initial
> +NEWLIB_ADD_TOOLCHAIN_DEPENDENCY = NO
> +NEWLIB_INSTALL_STAGING = YES
> +
> +define NEWLIB_CONFIGURE_CMDS
> +	(cd $(@D); \
> +		$(TARGET_MAKE_ENV) \
> +		./configure \
> +			--target=$(GNU_TARGET_NAME) \
> +			--host=$(GNU_HOST_NAME) \
> +			--build=$(GNU_HOST_NAME) \

From what I recall, newlib does not use --build. So you should not have
to specify it. At l;east, it was still the case in newlib-2.2.0,
released 2014-12-18.

> +			--prefix=$(STAGING_DIR) \
> +			--includedir=$(STAGING_DIR)/usr/include \
> +			--oldincludedir=$(STAGING_DIR)/usr/include \
> +			--with-build-sysroot=$(STAGING_DIR) \

I don't think --includedir, --oldincludedir or --with-build-sysroot are
needed.

> +			--enable-newlib-io-long-long \
> +			--enable-newlib-register-fini \
> +			--disable-newlib-supplied-syscalls \

What about --enable-newlib-io-float or --enable-newlib-io-long-double or
--enable-newlib-io-c99-formats?

(I don't really care they be enabled or disabled, just I would not use
the defaults; we prefer to force these kind of things explcitly, rather
than have nasty surprises, especially when a new version changes the
defaults, and especially since a toolchain component is pretty much
critical.)

> +			--disable-nls)
> +
> +endef
> +
> +define NEWLIB_APPLY_PATCHES
> +	$(APPLY_PATCHES) $(@D) package/newlib \*.patch
> +endef
> +
> +define NEWLIB_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define NEWLIB_INSTALL_STAGING_CMDS
> +	mkdir -p $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))

Maybe you can make that an autootols package, since it *is* an autotools
package. It's just that we're redefining the configure command.

But you're also not providing target-install commands, so you may also
want to add:

    NEWLIB_INSTALL_TARGET = NO

And then you can indeed make it an autootls-package. :-)

> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 13e2b15..c11db73 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -94,6 +94,14 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
>  	  This option selects musl as the C library for the
>  	  cross-compilation toolchain.
>  
> +config BR2_TOOLCHAIN_BUILDROOT_NEWLIB
> +       bool "newlib (experimental)"
> +       depends on BR2_arm

Why only arm? newlib has support for other architectures. In fact, I
would gues that all architectures that Buildroot supports are also
supported in newlib.

Note: for glibc and uClibc, we have a choice to select the version. Do
we also want to add such a version selection (especially a custom
version) for newlib, too?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
