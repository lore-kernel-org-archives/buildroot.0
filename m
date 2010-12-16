From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 Dec 2010 15:26:51 +0100
Subject: [Buildroot] [PATCH 45/55] Create menu entry to select device
	creation method
In-Reply-To: <d166de76db4ed6fb2616a4dcc262694139b072e9.1291582352.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 5 Dec 2010 21:53:16 +0100")
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<d166de76db4ed6fb2616a4dcc262694139b072e9.1291582352.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r5dhhjys.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Yegor Yefremov <yegor_sub1@visionsystems.de>
 Thomas> Four methods for the creation of device files in /dev are now
 Thomas> proposed:

 Thomas>  - static method uses device table as before
 Thomas>  - devtmpfs method enables this feature in kernel
 Thomas>  - mdev method adds mdev starting script to the file system
 Thomas>     and selects mdev itself for installation
 Thomas>  - udev method selects udev for installation

 Thomas> All dynamic methods are based on devtmpfs, so one doesn't need to care
 Thomas> about /dev folder.

 Thomas>  config BR2_ROOTFS_DEVICE_TABLE
 Thomas> -       string "Path to the device table"
 Thomas> -       default "target/generic/device_table.txt"
 Thomas> -       help
 Thomas> -         Specify the location of a device table, that will be passed
 Thomas> -         to the makedevs utility to create all the special device
 Thomas> -         files in the target filesystem.
 Thomas> +	string "Path to the device table"
 Thomas> +	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
 Thomas> +	default "target/generic/device_table.txt"
 Thomas> +	help
 Thomas> +	  Specify the location of a device table, that will be passed
 Thomas> +	  to the makedevs utility to create all the special device
 Thomas> +	  files in the target filesystem.
 
Like mentioned before, I think we should still use a (smaller)
device_table.txt for stuff using devtmpfs for busybox/passwd/shadow
permissions.

Devtmpfs also gets mounted on top of the rootfs, so it shadows the
content of /dev, which means we'll have to add a:

null::sysinit:/bin/mkdir -p /dev/pts

To the inittab, or devpts stuff like dropbear will fail.

 Thomas> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
 Thomas> index b7f4740..d4b04a9 100644
 Thomas> --- a/package/busybox/busybox.mk
 Thomas> +++ b/package/busybox/busybox.mk
 Thomas> @@ -20,6 +20,19 @@ ifndef BUSYBOX_CONFIG_FILE
 Thomas>  	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 Thomas>  endif
 
 Thomas> +# If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
 Thomas> +ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
 Thomas> +define BUSYBOX_INSTALL_MDEV_SCRIPT
 Thomas> +	install -m 0755 package/busybox/S10mdev $(TARGET_DIR)/etc/init.d
 Thomas> +endef
 Thomas> +define BUSYBOX_SET_MDEV
 Thomas> +	$(call KCONFIG_ENABLE_OPT,CONFIG_MDEV,$(BUSYBOX_BUILD_CONFIG))
 Thomas> +	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MDEV_CONF,$(BUSYBOX_BUILD_CONFIG))
 Thomas> +	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MDEV_EXEC,$(BUSYBOX_BUILD_CONFIG))
 Thomas> +	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MDEV_LOAD_FIRMWARE,$(BUSYBOX_BUILD_CONFIG))

I would prefer to keep these overrides to a strict minimum - As an
example, I've used mdev in the past without firmware and exec support.

-- 
Bye, Peter Korsgaard
