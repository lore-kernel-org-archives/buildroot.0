From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 00:28:43 +0200
Subject: [Buildroot] [PATCH 3/6] qemu: code cleanup - (mostly) wrapping
 lines at 80 characters
In-Reply-To: <1462348079-7631-3-git-send-email-simonn.maes@gmail.com>
References: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
 <1462348079-7631-3-git-send-email-simonn.maes@gmail.com>
Message-ID: <20160704002843.6a616b0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 May 2016 09:47:56 +0200, Simon Maes wrote:

>  config BR2_PACKAGE_QEMU_HAS_EMULS
>  	def_bool y
> -	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
> +	depends on BR2_PACKAGE_QEMU_SYSTEM ||     \
> +			BR2_PACKAGE_QEMU_LINUX_USER ||    \
> +			BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""

We indent continuation lines with just one more tab.

>  if BR2_PACKAGE_QEMU_HAS_EMULS
>  
> @@ -106,7 +108,7 @@ config BR2_PACKAGE_QEMU_FDT
>  	depends on !BR2_STATIC_LIBS # dtc
>  	select BR2_PACKAGE_DTC
>  	help
> -	  Say 'y' here to have QEMU capable of constructing Device Trees,
> +	  Say 'y' to have QEMU capable of constructing Device Trees,

Well, yes, but not super important.

>  	  and passing them to the VMs.
>  
>  comment "FDT support needs a toolchain w/ dynamic library"
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 151060b..1910dbd 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -17,7 +17,8 @@ HOST_QEMU_LICENSE_FILES = COPYING COPYING.LIB
>  #       the non-(L)GPL license texts are specified in the affected
>  #       individual source files.
>  
> -HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-pixman
> +HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 \
> +						 host-pixman

See above.

>  HOST_QEMU_SITE = $(QEMU_SITE)
>  HOST_QEMU_SOURCE = $(QEMU_SOURCE)
>  
> @@ -94,9 +95,15 @@ HOST_QEMU_TARGETS += $(HOST_QEMU_ARCH)-linux-user
>  HOST_QEMU_OPTS += --enable-linux-user
>  
>  # kernel version as major*256 + minor
> -HOST_QEMU_HOST_SYSTEM_VERSION = $(shell uname -r | awk -F. '{ print $$1 * 256 + $$2 }')
> -HOST_QEMU_TARGET_SYSTEM_VERSION = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | awk -F. '{ print $$1 * 256 + $$2 }')
> -HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION) && echo OK)
> +HOST_QEMU_HOST_SYSTEM_VERSION = $(shell uname -r | awk -F. \
> +								'{ print $$1 * 256 + $$2 }')
> +
> +HOST_QEMU_TARGET_SYSTEM_VERSION = $(shell \
> +								echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) \
> +								| awk -F. '{ print $$1 * 256 + $$2 }')
> +
> +HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge \
> +							$(HOST_QEMU_TARGET_SYSTEM_VERSION) && echo OK)

This is actually a lot less readable than it was.

>  ifeq ($(BR_BUILDING),y)
>  ifneq ($(HOST_QEMU_COMPARE_VERSION),OK)
> @@ -120,14 +127,14 @@ endif
>  
>  define HOST_QEMU_CONFIGURE_CMDS
>  	cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure    \
> -		--target-list="$(HOST_QEMU_TARGETS)"    \
> -		--prefix="$(HOST_DIR)/usr"              \
> -		--interp-prefix=$(STAGING_DIR)          \
> -		--cc="$(HOSTCC)"                        \
> -		--host-cc="$(HOSTCC)"                   \
> -		--python=$(HOST_DIR)/usr/bin/python2    \
> -		--extra-cflags="$(HOST_CFLAGS)"         \
> -		--extra-ldflags="$(HOST_LDFLAGS)"       \
> +		--target-list="$(HOST_QEMU_TARGETS)"        \
> +		--prefix="$(HOST_DIR)/usr"                  \
> +		--interp-prefix=$(STAGING_DIR)              \
> +		--cc="$(HOSTCC)"                            \
> +		--host-cc="$(HOSTCC)"                       \
> +		--python=$(HOST_DIR)/usr/bin/python2        \
> +		--extra-cflags="$(HOST_CFLAGS)"             \
> +		--extra-ldflags="$(HOST_LDFLAGS)"           \

Our convention now is to put the \ just one space after the line.

>  define QEMU_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(QEMU_MAKE_ENV) DESTDIR=$(TARGET_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(QEMU_MAKE_ENV) \
> +			DESTDIR=$(TARGET_DIR) install

Only one more tab indentation for the continuation lines.

So, I've marked your patch as Changes Requested in patchwork. Feel free
to submit an updated version that takes into account the comments if
you're interested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
