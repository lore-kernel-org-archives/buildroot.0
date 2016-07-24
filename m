From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 14:40:40 +0200
Subject: [Buildroot] [PATCH 1/2 v3] odroid-scripts: New Package.
In-Reply-To: <20160724055602.7159-1-daggs@gmx.com>
References: <20160724055602.7159-1-daggs@gmx.com>
Message-ID: <20160724144040.52d51f5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 08:56:01 +0300, Dagg Stompler wrote:
> v2 -> v3:
>  - update repo rev to a252de04562dcf8d8a4918a544b45a9e3d46d2fb.
>  - update hash
> 
> v1 -> v2:
>  - fix hash type in hash file.

The changelog should not be part of the commit log.

> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---

It should be here.

>  configs/odroidc2_defconfig                 |  1 +
>  package/Config.in                          |  1 +
>  package/odroid-scripts/Config.in           |  7 +++++++
>  package/odroid-scripts/S50odroidc2_fb      | 20 +++++++++++++++++++
>  package/odroid-scripts/odroid-scripts.hash |  2 ++
>  package/odroid-scripts/odroid-scripts.mk   | 32 ++++++++++++++++++++++++++++++
>  6 files changed, 63 insertions(+)
>  create mode 100644 package/odroid-scripts/Config.in
>  create mode 100644 package/odroid-scripts/S50odroidc2_fb
>  create mode 100644 package/odroid-scripts/odroid-scripts.hash
>  create mode 100644 package/odroid-scripts/odroid-scripts.mk
> 
> diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
> index 43c2787..45ede62 100644
> --- a/configs/odroidc2_defconfig
> +++ b/configs/odroidc2_defconfig
> @@ -6,6 +6,7 @@ BR2_TARGET_GENERIC_HOSTNAME="odroidc2"
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"
> +BR2_PACKAGE_ODROID_SCRIPTS=y

This should be part of a separate commit.


> +ODROID_SCRIPTS_VERSION = a252de04562dcf8d8a4918a544b45a9e3d46d2fb
> +ODROID_SCRIPTS_SITE = $(call github,mdrjr,c2_bootini,$(ODROID_SCRIPTS_VERSION))

This repository contains the boot.ini for which you add a copy in
Buildroot (see our discussion from yesterday). Why don't we use this
one? It seems to be pretty much the same.

> +ODROID_SCRIPTS_LICENSE = unclear
> +
> +ifeq ($(BR2_PACKAGE_EUDEV),y)

BR2_PACKAGE_HAS_UDEV

so that it also works with systemd

> +	ODROID_SCRIPTS_INSTALL_UDEV_RULES = $(INSTALL) -D -m 0644 $(@D)/10-odroid.rules $(TARGET_DIR)/etc/udev/rules.d/10-odroid.rules

Please use:

define ODROID_SCRIPTS_INSTALL_UDEV_RULES
	$(INSTALL) -D -m 0644 $(@D)/10-odroid.rules $(TARGET_DIR)/etc/udev/rules.d/10-odroid.rules
endef

> +else
> +	ODROID_SCRIPTS_INSTALL_UDEV_RULES =

Not needed, by default variables are empty.

> +endif
> +
> +define ODROID_SCRIPTS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/c2_init.sh $(TARGET_DIR)/usr/sbin/odroidc2_init_fb.sh
> +	$(ODROID_SCRIPTS_INSTALL_UDEV_RULES)
> +endef
> +
> +define ODROID_SCRIPTS_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 $(@D)/amlogic.service $(TARGET_DIR)/usr/lib/systemd/system/odroidc2_fb.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -fs ../../../../usr/lib/systemd/system/odroidc2_fb.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/odroidc2_fb.service
> +endef
> +
> +define ODROID_SCRIPTS_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/odroid-scripts/S50odroidc2_fb $(TARGET_DIR)/etc/init.d/S50odroidc2_fb
> +endef

Other than that, looks good. Can you respin a new version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
