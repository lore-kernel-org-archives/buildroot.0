Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB18C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 02:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7DDA60AD6;
	Fri, 14 Jan 2022 02:46:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u12ASlMfXFgG; Fri, 14 Jan 2022 02:46:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 007D060AA9;
	Fri, 14 Jan 2022 02:46:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FCC51BF3C6
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 02:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CF01415C8
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 02:46:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lcknr73Mm6ue for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 02:46:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEEB5415C6
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 02:46:04 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 s8-20020a0568301e0800b00590a1c8cc08so8616403otr.9
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 18:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4piyR5AALmkIkbzVV0ffKJcg7xLH5/peZjbu2uqI9Dw=;
 b=pvZ5evPNn0Wzc+wmYcgzPbqFuqGd2ZkNLSlmYPzNa6SSEhQCA9gcjppoTUtyTxpESL
 ixqm2Y7ef5P/cTm0KUYgvH/TEsGpxIAbmcEV/mxsE9gltVGncyPe3vPGDLcfQNQPjf76
 FwVhBQBV7It+fDvTyYbnS1yu7pflBT1TdgmpPwmnEps4SwH1MHd250N5crqvXeQ4guWv
 61V5CEl7BAkW0AYfgrOMtcpbwAupfXL48izIfKlwKF2o1J8Ihi2pTwZXaAfd3H8YScmV
 DlkpVieYEVq0xQQE6d4rscZz7mhqGKxwBYCZLl80j8flOj73wRbZIp/xsfve6vtaHQJ9
 u6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4piyR5AALmkIkbzVV0ffKJcg7xLH5/peZjbu2uqI9Dw=;
 b=UtOalYMUnhTxrzpFiUhyKAaV3IvrOjcVVCNubSuWJvyqLESlM8xrEj8ahU5dlAI8IF
 wZk9igwIB++l3JytW8qRdr1rAqBD9Rm0ImhnYFygT2MQKTbKHQ/e5OtULNO2SXOXGrB+
 Bl5Ric2Gem5mviR1al7APl7JyGBTe+vShQJ51/N9uC4vm3GRg7Gm2FQsHGwzzfACgz5U
 Fef+euxR4C3iKP5C3BYsCtHXpBaBCmxIrltj/C5oU0xYuRk2sC5lbzn7GYECXIA7EobH
 goGCIxN0Jpsn6hJm+IP3M+AjmeWIQ9S8wEkUbVliMZY9BuZpIdoiw9iF7ioZeVUtGpRM
 Q5Lw==
X-Gm-Message-State: AOAM530mLFbYgFk26SCb7NDBs+bbJpzQ0/fYsawi+YVaMU8u57BSH4lu
 AzjbjgLtMXe5e8OCm7CkmIeDjeNtG84jqw==
X-Google-Smtp-Source: ABdhPJwp3zIFzNNmagsBCWdwR+pxkPNKqksrWqviBvvkHvWHBhvXTLZqnjB4IX4c+yXiKYb1+nj27w==
X-Received: by 2002:a05:6830:2645:: with SMTP id
 f5mr5269805otu.19.1642128363325; 
 Thu, 13 Jan 2022 18:46:03 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:8fbc:8dd:60c7:a0d])
 by smtp.gmail.com with ESMTPSA id n19sm1121301otq.11.2022.01.13.18.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 18:46:02 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 23:45:55 -0300
Message-Id: <20220114024555.319448-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] configs/imx8mmevk: new defconfig
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
Cc: heiko.thiery@gmail.com, Fabio Estevam <festevam@gmail.com>,
 frieder.schrempf@kontron.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for imx8mmevk_defconfig that allows booting kernel, U-Boot and
TFA from the upstream repositories.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Also use TF-A and U-Boot upstream versions.

 DEVELOPERS                                    |  1 +
 board/freescale/imx8mmevk/genimage.cfg        | 16 ++++++++
 board/freescale/imx8mmevk/readme.txt          |  6 +++
 .../boot/extlinux/extlinux.conf               |  4 ++
 configs/imx8mmevk_defconfig                   | 39 +++++++++++++++++++
 5 files changed, 66 insertions(+)
 create mode 100644 board/freescale/imx8mmevk/genimage.cfg
 create mode 100644 board/freescale/imx8mmevk/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 configs/imx8mmevk_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 12777e8d61..e19072a14e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -839,6 +839,7 @@ F:	configs/imx6ullevk_defconfig
 F:	configs/imx6ulpico_defconfig
 F:	configs/imx7d-sdb_defconfig
 F:	configs/imx7dpico_defconfig
+F:	configs/imx8mmevk_defconfig
 F:	configs/imx8mqevk_defconfig
 F:	configs/mx25pdk_defconfig
 F:	configs/mx51evk_defconfig
diff --git a/board/freescale/imx8mmevk/genimage.cfg b/board/freescale/imx8mmevk/genimage.cfg
new file mode 100644
index 0000000000..3a83aa1f03
--- /dev/null
+++ b/board/freescale/imx8mmevk/genimage.cfg
@@ -0,0 +1,16 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition imx-boot {
+		in-partition-table = "no"
+		image = "flash.bin"
+		offset = 33k
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		offset = 8M
+	}
+}
diff --git a/board/freescale/imx8mmevk/readme.txt b/board/freescale/imx8mmevk/readme.txt
index 7b69405d30..a8e80a48f9 100644
--- a/board/freescale/imx8mmevk/readme.txt
+++ b/board/freescale/imx8mmevk/readme.txt
@@ -10,8 +10,14 @@ Build
 
 First, configure Buildroot for the i.MX8MM EVK board:
 
+If you want to use the NXP kernel:
+
   make freescale_imx8mmevk_defconfig
 
+Or if you want to use a mainline kernel:
+
+  make imx8mmevk_defconfig
+
 Build all components:
 
   make
diff --git a/board/freescale/imx8mmevk/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/imx8mmevk/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..0ba2e4cbfc
--- /dev/null
+++ b/board/freescale/imx8mmevk/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+Label imx8mm-evk-buildroot
+  kernel /boot/Image
+  devicetree /boot/imx8mm-evk.dtb
+  append root=/dev/mmcblk1p1 rootwait rw 
diff --git a/configs/imx8mmevk_defconfig b/configs/imx8mmevk_defconfig
new file mode 100644
index 0000000000..170b8d273b
--- /dev/null
+++ b/configs/imx8mmevk_defconfig
@@ -0,0 +1,39 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_OVERLAY="board/freescale/imx8mmevk/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imx8mmevk/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.14"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="240M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30890000"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
