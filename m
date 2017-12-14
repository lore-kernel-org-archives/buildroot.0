From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 09:56:14 +0100
Subject: [Buildroot] [PATCH] linux-tools: add usbip (USB/IP userspace
 tools)
In-Reply-To: <1512566955-4712-1-git-send-email-julien.boibessot@free.fr>
References: <1512566955-4712-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20171214095614.5e99e0a0@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yann in Cc, as I'd really like to have his feedback on this patch.

Title should be just:

	"linux-tools: add support for usbip"

On Wed,  6 Dec 2017 14:29:15 +0100, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> I did this work before knowing the existence of previous attempts:

Please don't use first person sentences in commit logs.

> * 12/2012: http://lists.busybox.net/pipermail/buildroot/2012-December/064070.html
> * 12/2016: http://buildroot-busybox.2317881.n4.nabble.com/PATCH-usbip-add-a-new-package-td152317.html
> 
> I choosed to duplicate some autostuff infra commands in linux-tools as it was
> more logical to me to include usbip inside linux-tools instead of trying to make
> it a "normal" BR package. Indeed, previous 2016 attempt finally never reached
> BR mainline.
> Since 2012 usbip have moved from an external tool to an inside kernel sources
> one.
> 
> 2 linux patches are added to fix issues encountered while build testing with
> utils/test-pkg. These patches have been sent upstream (linux-usb).
> 
> Config used for test-pkg is:
> 
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_DEFCONFIG="mxs"
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17=y
> BR2_PACKAGE_LINUX_TOOLS_USBIP=y
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28evk"
> 
> (some toolchains needs to select a device tree explicitly)
> 
> Results are the following:
> 
> ./utils/test-pkg -c usbip.config -p linux-tool
>                 armv5-ctng-linux-gnueabi [ 1/47]: SKIPPED
>               armv7-ctng-linux-gnueabihf [ 2/47]: SKIPPED
>                         br-aarch64-glibc [ 3/47]: OK
>                            br-arcle-hs38 [ 4/47]: OK
>                             br-arm-basic [ 5/47]: SKIPPED
>                   br-arm-cortex-a9-glibc [ 6/47]: OK
>                    br-arm-cortex-a9-musl [ 7/47]: OK
>                    br-arm-cortex-m4-full [ 8/47]: SKIPPED
>                              br-arm-full [ 9/47]: SKIPPED
>                     br-arm-full-nothread [10/47]: OK
>                       br-arm-full-static [11/47]: SKIPPED
>                             br-bfin-full [12/47]: SKIPPED
>                    br-i386-pentium4-full [13/47]: SKIPPED
>                 br-i386-pentium-mmx-musl [14/47]: SKIPPED
>                        br-m68k-5208-full [15/47]: SKIPPED
>                       br-m68k-68040-full [16/47]: OK
>                     br-microblazeel-full [17/47]: OK
>                  br-mips32r6-el-hf-glibc [18/47]: OK
>                       br-mips64-n64-full [19/47]: OK
>                  br-mips64r6-el-hf-glibc [20/47]: OK
>                       br-mipsel-o32-full [21/47]: OK
>                           br-nios2-glibc [22/47]: OK
>                       br-openrisc-uclibc [23/47]: OK
>                br-powerpc-603e-basic-cpp [24/47]: SKIPPED
>              br-powerpc64le-power8-glibc [25/47]: OK
>                br-powerpc64-power7-glibc [26/47]: OK
>                   br-powerpc-e500mc-full [27/47]: OK
>                              br-sh4-full [28/47]: OK
>                         br-sparc64-glibc [29/47]: OK
>                          br-sparc-uclibc [30/47]: OK
>                     br-x86-64-core2-full [31/47]: OK
>                           br-x86-64-musl [32/47]: OK
>                           br-xtensa-full [33/47]: OK
>                      i686-ctng-linux-gnu [34/47]: SKIPPED
>                           linaro-aarch64 [35/47]: OK
>                               linaro-arm [36/47]: OK
>              mips64el-ctng_n32-linux-gnu [37/47]: SKIPPED
>              mips64el-ctng_n64-linux-gnu [38/47]: SKIPPED
>         powerpc-ctng_e500v2-linux-gnuspe [39/47]: SKIPPED
>                      sourcery-arm-armv4t [40/47]: SKIPPED
>                             sourcery-arm [41/47]: SKIPPED
>                      sourcery-arm-thumb2 [42/47]: SKIPPED
>                          sourcery-mips64 [43/47]: OK
>                            sourcery-mips [44/47]: OK
>                           sourcery-nios2 [45/47]: OK
>                          sourcery-x86-64 [46/47]: OK
>            x86_64-ctng_locales-linux-gnu [47/47]: SKIPPED
> 47 builds, 19 skipped, 0 build failed, 0 legal-info failed

Does it makes sense to include the test-pkg details in the commit log?
This is a real open question. We don't do it today, but I might see
some value in having it. What do others think ?

> diff --git a/linux/0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional b/linux/0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional

I'm wondering if those two patches should be in linux/ or in
package/linux-tools/. Not sure.

> diff --git a/linux/linux.mk b/linux/linux.mk
> index bd5589b..8877a7b 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -221,6 +221,24 @@ define LINUX_TRY_PATCH_TIMECONST
>  endef
>  LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
>  
> +# Fixes tools/usbip build with recent gcc when -Werror is used
> +# Try a dry-run patch to see if this applies, if it does go ahead
> +define LINUX_TRY_PATCH_USBIP_GCC
> +	@if patch -p1 --dry-run -f -s -d $(@D) <$(LINUX_PKGDIR)/0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional >/dev/null ; then \
> +		$(APPLY_PATCHES) $(@D) $(LINUX_PKGDIR) 0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional ; \
> +	fi
> +endef
> +LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_USBIP_GCC
> +
> +# Fixes tools/usbip build with musl toolchains
> +# Try a dry-run patch to see if this applies, if it does go ahead
> +define LINUX_TRY_PATCH_USBIP_MUSL
> +	@if patch -p1 --dry-run -f -s -d $(@D) <$(LINUX_PKGDIR)/0003-tools-usbip-fixes-build-with-musl-libc-toolchain.patch.conditional >/dev/null ; then \
> +		$(APPLY_PATCHES) $(@D) $(LINUX_PKGDIR) 0003-tools-usbip-fixes-build-with-musl-libc-toolchain.patch.conditional ; \
> +	fi
> +endef
> +LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_USBIP_MUSL

Should we have this logic in linux/linux.mk, or in
package/linux-tools/linux-tool-usbip.mk.in, possibly via some
additional extension of the linux-tools infrastructure to register some
patches to be applied ?

Again, not sure, I'm just thinking out loud.

Since this "let's try to apply a patch, but it fails don't error out"
logic is now duplicated three times, perhaps it calls for a
TRY_APPLY_PATCHES function, or something like that ?

> +config BR2_PACKAGE_LINUX_TOOLS_USBIP
> +	bool "usbip"
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17	# moved out of staging/ dir in kernel 3.17
> +	select BR2_PACKAGE_LINUX_TOOLS
> +	help
> +	  USB/IP protocol allows to pass USB device from server to client over
> +	  the network.
> +	  You need to activate support for it in your kernel configuration.

Listing the actual kernel config options that are needed would be more
useful.

> +	  This (usbip) is the set of userspace tools used to handle connection
> +	  and management.
> +
> +	  You can optionally add hwdata package to your BR config to have
> +	  better runtime experience.

BR -> Buildroot
config -> configuration

"better runtime experience" is somewhat fuzzy. Can we have a better
description ?

> +LINUX_TOOLS += usbip
> +
> +USBIP_DEPENDENCIES = udev
> +USBIP_CONF_OPTS = --with-tcp-wrappers=no
> +
> +define USBIP_BUILD_CMDS
> +	$(Q)if test ! -f $(LINUX_DIR)/tools/usb/usbip/Makefile.am ; then \
> +		echo "Your kernel version is too old and does not have the usbip tool." ; \
> +		echo "At least kernel 3.17 must be used." ; \
> +		exit 1 ; \
> +	fi
> +
> +	cd $(LINUX_DIR)/tools/usb/usbip && PATH=$(BR_PATH) ./autogen.sh

If you autogen, you need to add at least host-autoconf and
host-automake as dependencies.

> +	cd $(LINUX_DIR)/tools/usb/usbip && rm -rf config.cache && \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(TARGET_CONFIGURE_ARGS) \
> +		$(USBIP_CONF_ENV) \
> +		CONFIG_SITE=/dev/null \
> +		./configure \
> +			--target=$(GNU_TARGET_NAME) \
> +			--host=$(GNU_TARGET_NAME) \
> +			--build=$(GNU_HOST_NAME) \
> +			--prefix=/usr \
> +			--exec-prefix=/usr \
> +			--sysconfdir=/etc \
> +			--localstatedir=/var \
> +			--program-prefix="" \
> +			$(QUIET) $(USBIP_CONF_OPTS)

Shouldn't we add a configure step for linux-tools ?

> +
> +	$(TARGET_MAKE_ENV) $(MAKE) $(USBIP_MAKE_OPTS) \
> +		 -C $(LINUX_DIR)/tools/usb/usbip/
> +endef
> +
> +# for libusbip
> +define USBIP_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb/usbip \
> +		$(USBIP_MAKE_OPTS) \
> +		DESTDIR=$(STAGING_DIR) \
> +		install
> +endef
> +
> +define USBIP_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb/usbip \
> +		$(USBIP_MAKE_OPTS) \
> +		DESTDIR=$(TARGET_DIR) \
> +		install
> +endef

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
