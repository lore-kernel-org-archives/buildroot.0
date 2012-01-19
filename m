From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Jan 2012 15:22:02 +0100
Subject: [Buildroot] [PATCH 1/2] udev: bump to 177
In-Reply-To: <1326874717-1666-1-git-send-email-yegorslists@googlemail.com>
References: <1326874717-1666-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <201201191522.03177.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 18 January 2012 09:18:36 yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/udev/Config.in |    9 ++++++++-
>  package/udev/S10udev   |    2 +-
>  package/udev/udev.mk   |   15 ++++++++++-----
>  3 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/package/udev/Config.in b/package/udev/Config.in
> index 391c718..e793496 100644
> --- a/package/udev/Config.in
> +++ b/package/udev/Config.in
> @@ -1,6 +1,9 @@
>  config BR2_PACKAGE_UDEV
>  	bool "udev"
>  	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> +	select BR2_PACKAGE_E2FSPROGS
> +	select BR2_PACKAGE_USBUTILS

 Are these dependencies really required now?  They're kind of
silly if you don't have e2fs or USB on your target system...

 If they are required now, can you add a comment about it to the
commit message?

> +	select BR2_PACKAGE_KMOD
>  	help
>  	  Userspace device daemon.
>  
> @@ -8,6 +11,11 @@ config BR2_PACKAGE_UDEV
>  
>  if BR2_PACKAGE_UDEV
>  
> +config BR2_PACKAGE_UDEV_RULES_GEN
> +	bool "enable rules generator"
> +	help
> +	  Enable persistant rules generator
> +

 Also please mention this option in the commit message.

[snip]
> diff --git a/package/udev/udev.mk b/package/udev/udev.mk
> index 1825396..395899a 100644
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
> @@ -12,15 +12,20 @@ UDEV_CONF_OPT =			\
>  	--sbindir=/sbin		\
>  	--with-rootlibdir=/lib	\
>  	--libexecdir=/lib/udev	\
> +	--with-pci-ids-path=$(TARGET_DIR)/usr/share/hwdata/pci.ids	\

> +	--with-usb-ids-path=$(TARGET_DIR)/usr/share/hwdata/usb.ids	\

 I haven't actually ran it, but:

- I have the usb.ids in /usr/share/usb.ids

- I don't get pci.ids (that one should come from pciutils or directly
from http://pciids.sourceforge.net/pci.ids)

- shouldn't the $(TARGET_DIR) be removed?

 Note that these comments have nothing to do with the version bump, so
any changes should either go in a separate patch or be documented in the
commit message (and extent the short message with 'and other fixes').

[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
