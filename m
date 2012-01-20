From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Jan 2012 23:44:35 +0100
Subject: [Buildroot] [PATCH v2 2/2] udev: bump to 177
In-Reply-To: <1327055414-22482-3-git-send-email-yegorslists@googlemail.com>
References: <1327055414-22482-1-git-send-email-yegorslists@googlemail.com>
 <1327055414-22482-3-git-send-email-yegorslists@googlemail.com>
Message-ID: <201201202344.36161.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Silly me, I hadn't noticed that you had sent a new patch and I replied to
your original reaction...  I'll repeat the comments from my previous mail
here so it's all in one place.  Sorry for the noise.  There are also some
new comments below.  If you've read my previous mail and just want to see
the new things: I've marked them with a *.

 Since things are getting a bit complex, I'll update and send the v3 patch
myself.  Yegor, feel free to review it, ignore it or take it over again.


On Friday 20 January 2012 11:30:14 yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Changes:
> - Linux kernel requirement: 2.6.34 and above (devtmpfs is mandatory)
 * Maybe add this requirement to the udev help text.

> - usbutils, hwdata are now mandatory, so that
> usb.ids and pci.ids paths are provided by default
 * Actually it's not.  The paths aren't verified at compile time, and a
missing file is handled gracefully.  So we can compile in the path to the
hwdata even if it is missing.

> - persistant rules generator is disabled by default, so option
> is introduced to enable this option if desired
> - new dependencies: kmod and e2fsprogs
 e2fsprogs -> util-linux

> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/udev/Config.in |   15 ++++++++++-----
>  package/udev/S10udev   |    2 +-
>  package/udev/udev.mk   |   16 ++++++++++------
>  3 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/package/udev/Config.in b/package/udev/Config.in
> index 391c718..8588aa0 100644
> --- a/package/udev/Config.in
> +++ b/package/udev/Config.in
> @@ -1,6 +1,10 @@
>  config BR2_PACKAGE_UDEV
>  	bool "udev"
>  	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> +	select BR2_PACKAGE_E2FSPROGS
 UTIL_LINUX and UTIL_LINUX_BLKID instead of E2FSPROGS

 Because of UTIL_LINUX, there is also a dependency on LARGEFILE and WCHAR.

> +	select BR2_PACKAGE_USBUTILS
> +	select BR2_PACKAGE_HWDATA
 USBUTILS and HWDATA are optional (like they were).

> +	select BR2_PACKAGE_KMOD
>  	help
>  	  Userspace device daemon.
>  
> @@ -8,19 +12,20 @@ config BR2_PACKAGE_UDEV
>  
>  if BR2_PACKAGE_UDEV
>  
> +config BR2_PACKAGE_UDEV_RULES_GEN
> +	bool "enable rules generator"
> +	help
> +	  Enable persistant rules generator
> +
>  config BR2_PACKAGE_UDEV_ALL_EXTRAS
>  	bool "enable all extras"
>  	depends on BR2_LARGEFILE # acl
>  	depends on BR2_USE_WCHAR # libglib2
>  	select BR2_PACKAGE_ACL
> -	select BR2_PACKAGE_LIBUSB
> -	select BR2_PACKAGE_LIBUSB_COMPAT
 These are indeed redundant.

> -	select BR2_PACKAGE_USBUTILS
> -	select BR2_PACKAGE_HWDATA
 These should stay in the extras.

>  	select BR2_PACKAGE_LIBGLIB2
>  	help
>  	  Enable all extras with external dependencies like
> -	  libacl, libusb, libusb-compat, usbutils, hwdata
> +	  libacl and libglib2
>  
>  comment "udev extras requires a toolchain with LARGEFILE + WCHAR support"
>  	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
> diff --git a/package/udev/S10udev b/package/udev/S10udev
> index 29eb107..928c7b6 100755
> --- a/package/udev/S10udev
> +++ b/package/udev/S10udev
> @@ -17,7 +17,7 @@
>  #
>  
>  # Check for missing binaries
> -UDEV_BIN=/sbin/udevd
> +UDEV_BIN=/lib/udev/udev/udevd
 It makes more sense to put it in /lib/udev/ than /lib/udev/udev/

>  test -x $UDEV_BIN || exit 5
>  
>  # Check for config file and read it
> diff --git a/package/udev/udev.mk b/package/udev/udev.mk
> index 1825396..03d1d22 100644
> --- a/package/udev/udev.mk
> +++ b/package/udev/udev.mk
> @@ -3,7 +3,7 @@
>  # udev
>  #
>  #############################################################
> -UDEV_VERSION = 173
> +UDEV_VERSION = 177
>  UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
>  UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
>  UDEV_INSTALL_STAGING = YES
> @@ -12,19 +12,23 @@ UDEV_CONF_OPT =			\
>  	--sbindir=/sbin		\
>  	--with-rootlibdir=/lib	\
>  	--libexecdir=/lib/udev	\
> +	--with-usb-ids-path=$(TARGET_DIR)/usr/share/hwdata/usb.ids	\
> +	--with-pci-ids-path=$(TARGET_DIR)/usr/share/hwdata/pci.ids	\
 Should be without $(TARGET_DIR), otherwise the path to the buildroot
environment is linked into the udevd executable.

 * I just noticed an annoying thing: the hwdata package installs it in
/usr/share/hwdata/usb.ids, while usbutils puts it in /usr/share/usb.ids.
Totally unrelated to udev, though :-)

> +	--with-firmware-path=/lib/firmware				\
>  	--disable-introspection
>  
> -UDEV_DEPENDENCIES = host-gperf host-pkg-config
> +UDEV_DEPENDENCIES = host-gperf host-pkg-config e2fsprogs kmod usbutils hwdata
> +
> +ifeq ($(BR2_PACKAGE_UDEV_RULES_GEN),y)
> +UDEV_CONF_OPT += --enable-rule_generator
> +endif
>  
>  ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
> -UDEV_DEPENDENCIES += libusb libusb-compat acl usbutils hwdata libglib2
> +UDEV_DEPENDENCIES += acl libglib2
 Dependencies should stay as original, except the redundant libusb*

>  UDEV_CONF_OPT +=							\
> -	--with-pci-ids-path=$(TARGET_DIR)/usr/share/hwdata/pci.ids	\
> -	--with-usb-ids-path=$(TARGET_DIR)/usr/share/hwdata/usb.ids	\
>  	--enable-udev_acl
>  else
>  UDEV_CONF_OPT +=		\
> -	--disable-hwdb		\
>  	--disable-gudev
>  endif


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
