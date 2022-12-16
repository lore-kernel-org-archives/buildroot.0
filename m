Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C88C4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 08:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A370404CA;
	Fri, 16 Dec 2022 08:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A370404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tkpCgDhbS5rs; Fri, 16 Dec 2022 08:05:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2786D4047C;
	Fri, 16 Dec 2022 08:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2786D4047C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 096E01BF3B5
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 08:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4A04402BA
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 08:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4A04402BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-JwL2YE0qjC for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 08:04:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27F9B40296
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27F9B40296
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 08:04:45 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id m18so4333604eji.5
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 00:04:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0XKzUBseUcmMEYOuKSCEHvTSWrsaxdSsp7xj/+zg3Ak=;
 b=hHXiy0WQ4Nu86fIsreWA/AlU78AMiGpfFGyxY+g7KhS4OVhCCMiH1nEleAEDGW+8mr
 tC8Cl8tnza9L54qq6jiQZGrhMz7wrkfNijFmXZzQFokgsPZokTnZnxBBlLqh7uaMVyq6
 +6v5W1yXu/2FZF/uYqETducnWPdVYeptOPDUNNT8BEBvJfmx2nMN/gXUeThhswNb0kdV
 GGTm8cYVRb1mQlD/qkOrjraz7gEt4VGRoiTG3zy+yres2xXC66QpRKen3/CeiPJMffrk
 8KWTnKJcOeLsB9vTf+0szz4kcrnIlmxjRqpNV1rwgcCyggfZNx/iIk9q2s48Nor+5nmE
 X+fw==
X-Gm-Message-State: ANoB5plHjSH15bNiI6br/LjK46I3owRuIHPwZZAeNVV0o/Ck1OMSqHGP
 uiwBDK36gHIzjkpYpw/I40iKdfyPoYjnF02G49M=
X-Google-Smtp-Source: AA0mqf5hExMUu6IEGazOtt/iopnKC4BXnr400aJX+/C13nqA9xyOpKIgUZTrU5CzH1iGBhBL11tlfQ==
X-Received: by 2002:a17:906:f856:b0:7c0:b0f9:e360 with SMTP id
 ks22-20020a170906f85600b007c0b0f9e360mr25720787ejb.16.1671177883069; 
 Fri, 16 Dec 2022 00:04:43 -0800 (PST)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 o8-20020aa7dd48000000b0046a0096bfdfsm571762edw.52.2022.12.16.00.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 00:04:42 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 16 Dec 2022 09:04:32 +0100
Message-Id: <20221216080433.1997432-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216080433.1997432-1-angelo@amarulasolutions.com>
References: <20221216080433.1997432-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0XKzUBseUcmMEYOuKSCEHvTSWrsaxdSsp7xj/+zg3Ak=;
 b=XfKYy6hvU9P5xgKxjpE1vVHz2f9OMa9MQT5Y96Q0GGIPlWZF94xfBP5cwgmw/fg6iH
 rQiPJOANEJolCPizGYGyUtdD9mHCVkoLjUr/3mYitJuBo7/LmlVl2Xj93Nd267fFOnWa
 cUzdr2i+YY1ZyiwPETHX2fZgj1Qb6hN7AaHkc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XfKYy6hv
Subject: [Buildroot] [PATCH v6 2/3] configs/lichee_rv: new defconfig
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
Cc: indrek.kruusa@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Lichee RV - Nezha CM is a compute module with modular design, equipped
with Allwinner D1 chip (based on T-Head XuanTie C906 core), 512MB DDR3
RAM.
Board support is based on the nezha defconfig already available in
buildroot.

https://wiki.sipeed.com/hardware/en/lichee/RV/RV.html
https://linux-sunxi.org/Sipeed_Lichee_RV

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Reviewed-by: Indrek Kruusa <indrek.kruusa@gmail.com>
Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>
---
v6:
* Added me to the developers file
v5:
* Fixing typos in readme (Indrek Kruusa)
v4:
* bump to latest kernel/uboot/opensbi as for the nezha defconfig
 DEVELOPERS                                    |  2 ++
 board/sipeed/lichee_rv/genimage.cfg           | 19 +++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |  4 +++
 board/sipeed/lichee_rv/readme.txt             | 26 +++++++++++++++
 configs/sipeed_lichee_rv_defconfig            | 33 +++++++++++++++++++
 5 files changed, 84 insertions(+)
 create mode 100644 board/sipeed/lichee_rv/genimage.cfg
 create mode 100644 board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/sipeed/lichee_rv/readme.txt
 create mode 100644 configs/sipeed_lichee_rv_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index b52a065dbc..2f27ddb110 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -157,6 +157,8 @@ N:	Andrey Yurovsky <yurovsky@gmail.com>
 F:	package/rauc/
 
 N:	Angelo Compagnucci <angelo.compagnucci@gmail.com>
+F:	board/sipeed/lichee_rv/
+F:	configs/sipeed_lichee_rv*
 F:	package/apparmor/
 F:	package/corkscrew/
 F:	package/cups/
diff --git a/board/sipeed/lichee_rv/genimage.cfg b/board/sipeed/lichee_rv/genimage.cfg
new file mode 100644
index 0000000000..d5df41203d
--- /dev/null
+++ b/board/sipeed/lichee_rv/genimage.cfg
@@ -0,0 +1,19 @@
+# Minimal SD card image for the sipeed Lichee RV
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		bootable = "true"
+		offset = 1M
+	}
+}
diff --git a/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf b/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..91b2298628
--- /dev/null
+++ b/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /boot/Image
+  # use devicetree from u-boot
+  append console=ttyS0,115200 root=/dev/mmcblk0p1 ro rootwait
diff --git a/board/sipeed/lichee_rv/readme.txt b/board/sipeed/lichee_rv/readme.txt
new file mode 100644
index 0000000000..24e8141851
--- /dev/null
+++ b/board/sipeed/lichee_rv/readme.txt
@@ -0,0 +1,26 @@
+Lichee RV
+===============
+
+Lichee RV - Nezha CM is a compute module with modular design, equipped
+with Allwinner D1 chip (based on T-Head XuanTie C906 core), 512MB DDR3 RAM.
+It can boot from TF card or SD-NAND, uses two sets of M.2 b key 67 pin
+connectors to route all IO, making it convient for wide use and easy to replace.
+
+How to build
+============
+
+$ make sipeed_lichee_rv_defconfig
+$ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Connect a TTL UART to the debug connector, insert the microSD card and
+plug in a USB-C cable to the PWR connector to boot the system.
diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
new file mode 100644
index 0000000000..f9782f870b
--- /dev/null
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -0,0 +1,33 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/lichee_rv/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67838d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="nezha"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-lichee-rv"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.1"
+BR2_TARGET_OPENSBI_PLAT="generic"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528ae9bc6c55edd3ffe642734b4132a8246ea777.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="lichee_rv_dock"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
