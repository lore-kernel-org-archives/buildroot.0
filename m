Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6619DCD8C88
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 22:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECE3F428CF;
	Sat,  6 Jun 2026 22:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiNDh3U2WiLe; Sat,  6 Jun 2026 22:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 614F5428A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780786297;
	bh=GaoXy+XLieK9zAGFfsOuZgImamNrwAUxb5LpPf2thi4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Id37oBQLpsDIhtx72edRLci2KJdSojvtfPzUBJnFs2Qe4koFE0Mjk6CuDsag/wpnU
	 s5xPWA7mcPuI4s5iTupFC7iv3+4CiYoCSojX3ucGfQB/SRkzpdk4dqwMs2k68ifYUh
	 smiwJhgQ2MpG5u9dwrWtegP+1oYAR+69Y7hkOrJCcFflvL3aRqamHYQrOTPJZQuaHC
	 M4fcRP9Z++IhtUX54jPwYZno171oEFXdiykuFVB7kATe7js/Bv9U/eeAz0sP6316eX
	 8/uuHcGExyjKMw9RELMxef/cmAOgO9Ffss6OLgd853ycbGkMYawT993huOhcDkB8ZP
	 GbLZyoQEqeSMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 614F5428A7;
	Sat,  6 Jun 2026 22:51:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C38AD2EF
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A78DE42879
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0THWRcJTdtoj for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 22:51:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6084142449
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6084142449
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6084142449
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:30 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso25580915e9.1
 for <buildroot@buildroot.org>; Sat, 06 Jun 2026 15:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780786288; x=1781391088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ypdQVjZfHpKGSuxqxJtUQlHm2mDHc/Ys4/x3XOlJxwI=;
 b=YMStiZkd9J8T26ctSea9EN78ewaGPW9gEb5NE7dbGzhA6zlHJMzS5bhfg8ICaksbM1
 fShOHkumAMl9+dDgcEs1zSp2QEL51fpJ5R3LDUhl8j0sgkRw9Hh5+jtMhDZIxyxjebfI
 OfirOAtxeJZZInxvz/UISdCiZdxCvBw4rvizjH1IP+oQusQA51YxQLkKk6arUcux4BxR
 XEbNyfDz2XPuwIRrR+QwSg+HnFJ0Afy2mZmM8okoh24arDJrIRW9i20Z3wydpoo8tC4R
 sraFDBp6ZSvIe/OXdy4mtF+83OaltOfE6JPLYcNA+71QoD40mFkiXbmHXyXqrZRFQt5H
 wWMw==
X-Gm-Message-State: AOJu0Yw9yed9IcMuN1azc3xFqQUJTnsflJKRYXEQv4UnmaMmMyJdbzLO
 7KV45p2OOFU86W6RvNGl/FBt/TFM/cwOcVDB5bnjVCt0Yj8V+TeaV62pjQ3ln1LSuAc94/6Nii1
 9SLdi
X-Gm-Gg: Acq92OETUBEWSPGOX0ZIADre0ptDsbV/qjw9zZqKwIKmoQJH54Jk12QbANUYXNznn8X
 rNuFuye8+17jWH2KrdwkYn/3YcL3lVT8FzFRPAzpYC0UzFgdk3IrdJ0fF04FJzgPkmc/nHEM4W8
 kFnuCfocHNhkrRHZLpPN/nY4yIoaIMAc2mSlzOWCjvlF73aZOVldJ3Qe9+muE0PUCJoc7/tmQwU
 G2FadBk1Qqdx30rJXNiuyOCg66WB/C4T4ueHj8XKjQ0r30lJ7ii/39F4soooeUFaP4vEwvdJ4DS
 hDHOL0obbw2Nifweoau3Ey6ds6dlUBAHZ4saX+wJnmleiIJ1hTW9gdaujt7wbJvpbHY0AfLbZVk
 nnkt+9vJzDNXB2XqXvpkv97866vQ8iscRGalLPPz6qGbsweLAW0CuzBlnpqQeDch47tRO3pCCAp
 ANz3KagskeulJbtonwr+UM6SIC/6fdM95m4n+gOXfp1GIeM1++FAP/nOLGTUmQyCfvgsLzqBlng
 g7mZQCwfo848x3QInw635HhYUO4ltPoO5Wp
X-Received: by 2002:a05:600c:3492:b0:490:aeae:1eea with SMTP id
 5b1f17b1804b1-490c2597362mr159269485e9.7.1780786288218; 
 Sat, 06 Jun 2026 15:51:28 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm67014650f8f.27.2026.06.06.15.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2026 15:51:27 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 Vivien Didelot <vivien.didelot@gmail.com>
Date: Sun,  7 Jun 2026 00:51:15 +0200
Message-ID: <20260606225120.409046-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606225120.409046-1-romain.naour@smile.fr>
References: <20260606225120.409046-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780786288; x=1781391088; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ypdQVjZfHpKGSuxqxJtUQlHm2mDHc/Ys4/x3XOlJxwI=;
 b=klJwV9c5yIag4X+RYnWMK7iyPPEGE8GeaNgt+MTz044wKjsAFHs2Ba34RobGDyA0jC
 jPVESqB328WRBCeh/XL1viPZ3a1uB/BfKff/0Sa5+WRVwrDZcPiloFFQ09u0nsZiG5NE
 UvBKSYPWZvMDBCxf4paiFIcs2j2P8LRjV+6EM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=klJwV9c5
Subject: [Buildroot] [PATCH 4/7] configs/ts5500_defconfig: remove defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This configuration for the TS-5400 was added back in September
2014 (commit 483e3bef47b3f024e4181403b3665702101c03e1), got some update
in 2018 (commit 6461d76992ec2ceffabd7a5ccb59bb707ea2cb0a) and has not
been updated in any significant way since then.

This defconfig still use a 4.14 kernel that is no longer maintained.

Remove its support.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914087 (ts5500_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Vivien Didelot <vivien.didelot@gmail.com>
---
 .checkpackageignore                           |   1 -
 DEVELOPERS                                    |   4 -
 .../fs-overlay/boot/syslinux/syslinux.cfg     |   9 --
 board/technologic/ts5500/linux-4.14.config    | 111 ------------------
 board/technologic/ts5500/readme.txt           |  52 --------
 configs/ts5500_defconfig                      |  13 --
 6 files changed, 190 deletions(-)
 delete mode 100644 board/technologic/ts5500/fs-overlay/boot/syslinux/syslinux.cfg
 delete mode 100644 board/technologic/ts5500/linux-4.14.config
 delete mode 100644 board/technologic/ts5500/readme.txt
 delete mode 100644 configs/ts5500_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 5fe9b378c8..c5b5dc15fc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -151,7 +151,6 @@ configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
 configs/terasic_de10nano_cyclone5_defconfig lib_defconfig.ForceCheckHash
-configs/ts5500_defconfig lib_defconfig.ForceCheckHash
 configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
 configs/visionfive_defconfig lib_defconfig.ForceCheckHash
 configs/wandboard_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 7c5917d1e8..0af3d3615e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3378,10 +3378,6 @@ F:	support/testing/tests/package/test_zerofree.py
 N:	Vinicius Tinti <viniciustinti@gmail.com>
 F:	package/python-thrift/
 
-N:	Vivien Didelot <vivien.didelot@gmail.com>
-F:	board/technologic/ts5500/
-F:	configs/ts5500_defconfig
-
 N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-firmware-inphi/
diff --git a/board/technologic/ts5500/fs-overlay/boot/syslinux/syslinux.cfg b/board/technologic/ts5500/fs-overlay/boot/syslinux/syslinux.cfg
deleted file mode 100644
index 64f8187733..0000000000
--- a/board/technologic/ts5500/fs-overlay/boot/syslinux/syslinux.cfg
+++ /dev/null
@@ -1,9 +0,0 @@
-SERIAL 1 115200
-CONSOLE 0
-
-DEFAULT linux
-
-LABEL linux
-  SAY Now booting the kernel from SYSLINUX...
-  LINUX /boot/bzImage
-  APPEND console=ttyS1,115200n8 root=/dev/sda1 rootfstype=ext4 rw
diff --git a/board/technologic/ts5500/linux-4.14.config b/board/technologic/ts5500/linux-4.14.config
deleted file mode 100644
index eb81596e25..0000000000
--- a/board/technologic/ts5500/linux-4.14.config
+++ /dev/null
@@ -1,111 +0,0 @@
-# CONFIG_CROSS_MEMORY_ATTACH is not set
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_X86_EXTENDED_PLATFORM is not set
-CONFIG_MELAN=y
-CONFIG_X86_GENERIC=y
-CONFIG_X86_REBOOTFIXUPS=y
-CONFIG_NOHIGHMEM=y
-# CONFIG_COMPACTION is not set
-# CONFIG_BOUNCE is not set
-# CONFIG_RELOCATABLE is not set
-# CONFIG_SUSPEND is not set
-# CONFIG_ACPI is not set
-CONFIG_CPU_IDLE=y
-CONFIG_TS5500=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_BLK_DEV is not set
-CONFIG_BLK_DEV_SD=y
-# CONFIG_SCSI_LOWLEVEL is not set
-CONFIG_ATA=y
-# CONFIG_ATA_VERBOSE_ERROR is not set
-# CONFIG_SATA_PMP is not set
-CONFIG_ATA_GENERIC=y
-CONFIG_PATA_LEGACY=y
-CONFIG_NETDEVICES=y
-# CONFIG_NET_CORE is not set
-# CONFIG_NET_VENDOR_3COM is not set
-# CONFIG_NET_VENDOR_ADAPTEC is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
-# CONFIG_NET_VENDOR_AMD is not set
-# CONFIG_NET_VENDOR_ARC is not set
-# CONFIG_NET_VENDOR_ATHEROS is not set
-# CONFIG_NET_VENDOR_BROADCOM is not set
-# CONFIG_NET_VENDOR_BROCADE is not set
-# CONFIG_NET_VENDOR_CHELSIO is not set
-# CONFIG_NET_VENDOR_CISCO is not set
-CONFIG_NET_TULIP=y
-CONFIG_DM9102=y
-# CONFIG_NET_VENDOR_DLINK is not set
-# CONFIG_NET_VENDOR_EMULEX is not set
-# CONFIG_NET_VENDOR_EXAR is not set
-# CONFIG_NET_VENDOR_HP is not set
-# CONFIG_NET_VENDOR_INTEL is not set
-# CONFIG_NET_VENDOR_MARVELL is not set
-# CONFIG_NET_VENDOR_MELLANOX is not set
-# CONFIG_NET_VENDOR_MICREL is not set
-# CONFIG_NET_VENDOR_MYRI is not set
-# CONFIG_NET_VENDOR_NATSEMI is not set
-# CONFIG_NET_VENDOR_NVIDIA is not set
-# CONFIG_NET_VENDOR_OKI is not set
-# CONFIG_NET_PACKET_ENGINE is not set
-# CONFIG_NET_VENDOR_QLOGIC is not set
-# CONFIG_NET_VENDOR_REALTEK is not set
-# CONFIG_NET_VENDOR_RDC is not set
-# CONFIG_NET_VENDOR_SEEQ is not set
-# CONFIG_NET_VENDOR_SILAN is not set
-# CONFIG_NET_VENDOR_SIS is not set
-# CONFIG_NET_VENDOR_SMSC is not set
-# CONFIG_NET_VENDOR_STMICRO is not set
-# CONFIG_NET_VENDOR_SUN is not set
-# CONFIG_NET_VENDOR_TEHUTI is not set
-# CONFIG_NET_VENDOR_TI is not set
-# CONFIG_NET_VENDOR_VIA is not set
-# CONFIG_NET_VENDOR_WIZNET is not set
-CONFIG_PHYLIB=y
-CONFIG_DAVICOM_PHY=y
-# CONFIG_WLAN is not set
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-CONFIG_SERIAL_8250=y
-# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_GPIOLIB=y
-CONFIG_GPIO_TS5500=y
-CONFIG_SENSORS_MAX197=y
-CONFIG_WATCHDOG=y
-CONFIG_SC520_WDT=y
-CONFIG_USB=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_SERIAL=y
-CONFIG_USB_SERIAL_FTDI_SIO=y
-CONFIG_USB_SERIAL_PL2303=y
-# CONFIG_X86_PLATFORM_DEVICES is not set
-# CONFIG_IOMMU_SUPPORT is not set
-# CONFIG_DMIID is not set
-CONFIG_EXT4_FS=y
-# CONFIG_DNOTIFY is not set
-# CONFIG_INOTIFY_USER is not set
-CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
-# CONFIG_MISC_FILESYSTEMS is not set
-# CONFIG_NETWORK_FILESYSTEMS is not set
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_CODEPAGE_850=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_NLS_ISO8859_15=y
-CONFIG_NLS_UTF8=y
-# CONFIG_VIRTUALIZATION is not set
-CONFIG_XZ_DEC=y
diff --git a/board/technologic/ts5500/readme.txt b/board/technologic/ts5500/readme.txt
deleted file mode 100644
index 1fe384faae..0000000000
--- a/board/technologic/ts5500/readme.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-Technologic Systems TS-5x00 SBCs
-================================
-
-This document explains how to set up a basic Buildroot system for the
-Technologic Systems TS-5x00 serie of x86-based Single Board Computers.
-
-TS-5x00 Single Board Computers are based on the AMD Elan520 processor. For more
-information please have a look at https://docs.embeddedTS.com/Documentation_Home#AMD
-
-The kernel configuration works for any AMD Elan520-based SBCs, but the support
-is enhanced for the TS-5500 and TS-5400 models (on-board devices registration
-and additional sysfs attributes under /sys/devices/platform/).
-
-To build the default configuration you only have to:
-
-    $ make ts5500_defconfig
-    $ make
-
-You will need a Compact Flash card of sufficient size and the first or only
-partition configured as Linux type, with the bootable flag.
-
-You can transfer the system on the partition then optionally resize it with:
-
-    # dd if=output/images/rootfs.ext4 of=/dev/sdX1
-    # resize2fs /dev/sdX1
-
-Or you can just extract the root filesystem to the partition with:
-
-    # mount /dev/sdX1 /mnt
-    # tar -pxf output/images/rootfs.tar -C /mnt
-    # umount /mnt
-
-To install the bootloader, you will need to copy the MBR:
-
-    # cat output/images/syslinux/mbr.bin > /dev/sdX
-
-Then install SYSLINUX in the mounted partition:
-
-    # mount /dev/sdX1 /mnt
-    # output/host/sbin/extlinux --install /mnt/boot/syslinux
-    # umount /mnt
-
-IMPORTANT: In order for the board to boot the Compact Flash with a recent
-config, the BIOS must use Logical Block Addressing (LBA). You can do it by
-choosing "Ide 0: AUTOCONFIG, LBA" under "IDE DRIVE GEOMETRY" in the "Basic CMOS
-Configuration" screen. Also, don't forget to set the 'active' (or 'bootable')
-flag on partition 1. For details about the CMOS setup, please see:
-https://docs.embeddedts.com/TS-5500#System_BIOS_Setup_Screens
-
-Connect a terminal program to the rs232 connector marked "COM2"
-with baudrate set to 115200, insert the Compact Flash card into the socket,
-power up the board, and enjoy.
diff --git a/configs/ts5500_defconfig b/configs/ts5500_defconfig
deleted file mode 100644
index 62d80839b7..0000000000
--- a/configs/ts5500_defconfig
+++ /dev/null
@@ -1,13 +0,0 @@
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
-BR2_ROOTFS_OVERLAY="board/technologic/ts5500/fs-overlay"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/technologic/ts5500/linux-4.14.config"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_SYSLINUX=y
-BR2_TARGET_SYSLINUX_MBR=y
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
