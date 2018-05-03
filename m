From: kaneda at chez.com <kaneda@chez.com>
Date: Thu, 03 May 2018 18:52:05 +0200
Subject: [Buildroot] Fighting with suid bit
Message-ID: <ffeaf5280e229a536de5f81fba84c99b@chez.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

I'm using buildroot to make a lightweight distro dedicated to retro dev 
(https://bitbucket.org/SpritesMind/lilu).
usually, I find my answer on manual, mailing list or google but this 
time, I'm lost :

One of my tools need raw io access to parallel port.
I solved this using the setuid bit but I'm unable to include it on my FS 
distro.

This tool has is own package so here is what I tried

define UCON64_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 4755 $(@D)/src/ucon64 $(TARGET_DIR)/usr/bin
endef

define UCON64_PERMISSIONS
	/usr/bin/ucon64	f 4755 0 0 - - - - -
endef


or throught buildroot config


BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt 
$(BR2_EXTERNAL)/board/neoware/ca21/device_table.txt"

with this device_table.txt :
/usr/bin/ucon64		     	f	4755	0	0	-	-	-	-	-


I wonder if it's because I'm building a LiveCD with initrd

CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y

BR2_TARGET_ROOTFS_ISO9660=y
BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="$(BR2_EXTERNAL)/board/neoware/ca21/syslinux.cfg"
BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
BR2_TARGET_ROOTFS_TAR_GZIP=y
BR2_TARGET_SYSLINUX=y
BR2_TARGET_SYSLINUX_ISOLINUX=y
BR2_TARGET_SYSLINUX_MBR=y



but whatever happens, I have /usr/bin/ucon64 0755 on boot and not 4755, 
which I could fix with chmod but not perfect....

any idea , hint , trick ?
and sorry if it's a basic issue, I'm not a linux guru ;)


Regards
