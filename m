Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D17C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEA52402B1;
	Sat, 23 Jul 2022 16:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEA52402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJ3UIG_CYuOQ; Sat, 23 Jul 2022 16:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 669C141669;
	Sat, 23 Jul 2022 16:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 669C141669
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DAE201BF271
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B58CC60BFB
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B58CC60BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBNTeuomL5ml for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:09:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5C9B60B83
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5C9B60B83
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:09:04 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id b21so5435091qte.12
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i7GvTJ0oFXOSLYZK2xvpwgF8CveM7qrf0BvzXaXrUME=;
 b=oUPhnr67SokxRRml0areu4D80cR/69Eb4B0bsojGCE/ElKiI1O7XrECRXf+vsAlbLj
 dr+xL8mBbQAtK8XOFLUXx/hCoQ8L5/k3TpSjqUYd3Rs8KPF1jhJT6qBEr+ZJXR7mO+Nd
 wmfd01mYKfXmSfxZ9BGH2GYEp8h3M54eb9KBfwIVZCn8ZHKnHIjw12PU/6doWwHhECJZ
 tfDPaFu1F6loo47/DcKmRCbFWL1mGVO6LH15VeFhdPduNlGEF/soh7F1MfSGRFvm0ioj
 Fy/wfwKv+l/MeQEz7tc5esnUuQLL41V0hs9u8uGgtvkBp/OlHLhGNW1EpCA48l9D9JRx
 W5nw==
X-Gm-Message-State: AJIora9NN+2tWrMjd1dNq5V/Zoxx41+mMT5TSHl4K9pCb1Po6eaj4mOz
 eMO9cX2OiKoOKK1A4ph2Raaynd7AiunSzQ==
X-Google-Smtp-Source: AGRyM1tj32lxLj7OoqQKYxw/E4malSHvcoN2NSfAEt/6PbI+D3CMHHRQehcxWyiQ6t6Exc8QaVHPBw==
X-Received: by 2002:a05:622a:2cc:b0:31f:523:c318 with SMTP id
 a12-20020a05622a02cc00b0031f0523c318mr4386062qtx.286.1658592543276; 
 Sat, 23 Jul 2022 09:09:03 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188]) by smtp.gmail.com with ESMTPSA id
 cm20-20020a05622a251400b00304fc3d144esm4761172qtb.1.2022.07.23.09.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 09:09:02 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 12:09:01 -0400
Message-Id: <20220723160901.272373-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i7GvTJ0oFXOSLYZK2xvpwgF8CveM7qrf0BvzXaXrUME=;
 b=auHpHi22BHnatUe8gRNqA8vwsLfiZLhph3tQ/82cL+6lJDlpJ9ZtK997omLHNcZ4Mm
 TwPIZD9mxQTCgX7iXiSGMPujqQkh+ro6AJdWX1fjwU99V8ZG75Db1IUMLSiemAxopo7z
 lkm+JilSlBBBw6GpiVVvjNCGEvT+9Z7Why2cmBlex3oG333szaTjhx/deMlaeMOtAWj2
 gaCdHNmy1yG8xc2sypN2RULT08OAps3vlnNjauNWbRX9dXYJ2NiHuwXJv+qnROfLXFzi
 nBCPb1Y1uYJ6SlSSc37PJbC92Znzm06+/Za5M6NK9kTQrAWuR14ksO3jGQxrcadZKotK
 Azaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=auHpHi22
Subject: [Buildroot] [PATCH v1] configs/imxrt1050-evk: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: maeva.manuel@oss.nxp.com,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, festevam@gmail.com,
 stephane.viau@oss.nxp.com, Jesse Taube <Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The imxrt1050-evk is a development board from NXP.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS                                  |  6 ++++
 board/freescale/imxrt1050evk/genimage.cfg   | 34 ++++++++++++++++++
 board/freescale/imxrt1050evk/post-build.sh  |  4 +++
 board/freescale/imxrt1050evk/readme.txt     | 23 ++++++++++++
 board/freescale/imxrt1050evk/uboot.fragment |  2 ++
 configs/imxrt1050-evk_defconfig             | 40 +++++++++++++++++++++
 6 files changed, 109 insertions(+)
 create mode 100644 board/freescale/imxrt1050evk/genimage.cfg
 create mode 100755 board/freescale/imxrt1050evk/post-build.sh
 create mode 100644 board/freescale/imxrt1050evk/readme.txt
 create mode 100644 board/freescale/imxrt1050evk/uboot.fragment
 create mode 100644 configs/imxrt1050-evk_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 0afd697b6c..206bac99e0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1096,9 +1096,11 @@ F:	package/webp/
 F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
+F:	board/freescale/imxrt1050evk/*
 F:	board/olimex/a*
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
+F:	configs/imxrt1050-evk_defconfig
 F:	configs/olimex_a*
 F:	package/at/
 F:	package/binutils/
@@ -1421,6 +1423,10 @@ F:	package/wmctrl/
 F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
+N:	Jesse Taube <Mr.Bossman075@gmail.com>
+F:	board/freescale/imxrt1050evk/*
+F:	configs/imxrt1050-evk_defconfig
+
 N:	Jianhui Zhao <zhaojh329@gmail.com>
 F:	package/libuhttpd/
 F:	package/libuwsc/
diff --git a/board/freescale/imxrt1050evk/genimage.cfg b/board/freescale/imxrt1050evk/genimage.cfg
new file mode 100644
index 0000000000..e9f224516f
--- /dev/null
+++ b/board/freescale/imxrt1050evk/genimage.cfg
@@ -0,0 +1,34 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"uImage",
+			"imxrt1050-evk.dtb",
+		}
+	}
+	size = 6M
+}
+
+image sdcard.img {
+	hdimage {}
+	partition SPL {
+		in-partition-table = "no"
+		image = "SPL"
+		offset = 1K
+		size = 127K
+	}
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.img"
+		offset = 128K
+		size = 512K
+	}
+	partition boot {
+		partition-type = 0xc
+		bootable = "true"
+		image = "boot.vfat"
+	}
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/freescale/imxrt1050evk/post-build.sh b/board/freescale/imxrt1050evk/post-build.sh
new file mode 100755
index 0000000000..47557566f9
--- /dev/null
+++ b/board/freescale/imxrt1050evk/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+rm output/images/uImage
+mkimage -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n "Linux kernel" -d output/images/Image output/images/uImage
+./support/scripts/genimage.sh $2 $3
diff --git a/board/freescale/imxrt1050evk/readme.txt b/board/freescale/imxrt1050evk/readme.txt
new file mode 100644
index 0000000000..d9c183a38f
--- /dev/null
+++ b/board/freescale/imxrt1050evk/readme.txt
@@ -0,0 +1,23 @@
+NXP i.MXRT1050 EVK board
+---------------------
+
+To build a minimal support for this board:
+
+$ make imxrt1050-evk_defconfig
+$ make
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be flashed into the SD card:
+
+$ sudo dd status=progress oflag=sync bs=4k if=output/images/sdcard.img of=/dev/<sd-card-device>; sync
+
+Jumper settings:
+
+   SW7: 1 0 1 0
+
+Where 0 means bottom position and 1 means top position (from the
+switch label numbers reference).
+
+Connect the USB cable between the EVK and the PC for the console.
+
+Insert the micro SD card in the board, power it up and U-Boot messages should come up.
diff --git a/board/freescale/imxrt1050evk/uboot.fragment b/board/freescale/imxrt1050evk/uboot.fragment
new file mode 100644
index 0000000000..1c5bb6af35
--- /dev/null
+++ b/board/freescale/imxrt1050evk/uboot.fragment
@@ -0,0 +1,2 @@
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 uImage;bootm 0x80000000 - 0x80800000"
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
new file mode 100644
index 0000000000..03a47c1fd6
--- /dev/null
+++ b/configs/imxrt1050-evk_defconfig
@@ -0,0 +1,40 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_m7=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imxrt1050evk/post-build.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19-rc5"
+BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
+BR2_LINUX_KERNEL_IMAGE_NAME="Image"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_LABEL="root"
+BR2_TARGET_ROOTFS_EXT2_SIZE="3M"
+
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+
+# Required tools to create the SD card image
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MKPASSWD=y
+
+# Misc
+BR2_BINUTILS_VERSION_2_36_X=y
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
