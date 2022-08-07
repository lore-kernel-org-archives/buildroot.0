Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E69C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 21:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7606F60BC8;
	Sun,  7 Aug 2022 21:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7606F60BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CqoJxn5sWnjt; Sun,  7 Aug 2022 21:06:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9848F60783;
	Sun,  7 Aug 2022 21:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9848F60783
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5AE1D1BF368
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 21:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FAF0401A4
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 21:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FAF0401A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdhM6r8244Vy for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 21:06:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB3CA40181
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB3CA40181
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 21:06:16 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id tl27so13327176ejc.1
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 14:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=SgksL4tsG3kQ72aW9IgjO87rLEPcPadCqpN0jikbV08=;
 b=KKfvho0Hbh/GMq2MSpEW8euexiDCqxfzBYu0Ac2q8UddNr+iBLr1eIMlBWEtZUta5i
 WesyosoiJu6OUu4pU2CHJFDr33BKKPNzU6FBFoCAuc8DsA42qgOKY/vKSGn8eqr8N/WI
 c8FVaroTkwZ8r870Y1XfDwduKD4JO5D/tq8LEJ3NJON8zrsMrxj+Xw0Owt7fvRq/FPEL
 m1zBoGLJGDkRUNolqS/fkRaDxOxfoQUk1yj0zsYn1kAg0QnJ25vUE+ojuKBsPgOc/cC9
 bY44U4e9Rdy1tmZI9ZqNnQDTZ3ifFvLY5nC1hS50PFR/nc816R6sLfTN2D7rGADM2B35
 4vOQ==
X-Gm-Message-State: ACgBeo2TuVlivz2VN8WBlgDnFdYkImCFDnkpCkojlInUSKfjNcNAYN5N
 y+c/Jjws26IL3npWwAlnxd+/vrCUxY8=
X-Google-Smtp-Source: AA6agR7lxAHgYoLhInVMRa8a/ukbkIE67D4Lr+yhm2GQgAV53UBaULgzl2JYafUjcoMpMjHlyNWQNw==
X-Received: by 2002:a17:906:8441:b0:730:7bd1:17ca with SMTP id
 e1-20020a170906844100b007307bd117camr12011921ejy.229.1659906374256; 
 Sun, 07 Aug 2022 14:06:14 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b0073065747de1sm4156844ejd.51.2022.08.07.14.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 14:06:13 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 23:03:18 +0200
Message-Id: <20220807210317.9415-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=SgksL4tsG3kQ72aW9IgjO87rLEPcPadCqpN0jikbV08=;
 b=P8PmpFtmX5LNjo/KXV06BqpI5pdbBRS6XyjY85INRFPvfLUvDx6ZmJJkQmDVo2NgfN
 unrwwFQfzQKy9lgyM//ec37e4LBHeuS9lD+MsXCxQitgZRVIAjauhRFvTk1CD6r3Q4Zn
 JM2wzn5y2VOCRNmoYIiV7sSHUKBLLvmMKJYS+iBMaGKX6jUsnR888r3GnrqeFyadkjkW
 OYIH01mOMMXCwOfQrqHt4yVf9IyMz4h72QiZpdf7gMUI1UDgA5yWLQDMwsfuBljlWnMZ
 DrqsI9i/dNQ3S0xOpVOLRDncwvGLMj/SH3txGh6qnoWHsE2UwkO7vcR0XSmNJ10O5q9A
 t0pA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=P8PmpFtm
Subject: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: fix build
 failure with u-boot 2022.04
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With U-Boot 2022.04 libuuid is required for building the host tool
mkeficapsule. The lib is included in the util-linux package. Thus the
BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX config is needed.

In addition an U-boot patch is required to fix an issue in U-Boot for
linking the mkeficapsule tool against -luuid and -lgnutls.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053608

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...le-use-pkg-config-to-get-luuid-and-l.patch | 33 +++++++++++++++++++
 configs/kontron_bl_imx8mm_defconfig           |  2 ++
 2 files changed, 35 insertions(+)
 create mode 100644 board/kontron/bl-imx8mm/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch

diff --git a/board/kontron/bl-imx8mm/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch b/board/kontron/bl-imx8mm/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch
new file mode 100644
index 0000000000..9530a45efe
--- /dev/null
+++ b/board/kontron/bl-imx8mm/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch
@@ -0,0 +1,33 @@
+From f3523977e8f5f6b2173708777001332431ebc609 Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Tue, 19 Jul 2022 16:17:09 +0200
+Subject: [PATCH 1/2] tools: mkeficapsule: use pkg-config to get -luuid and -lgnutls
+
+Instead of hardcoding -luuid -lgnutls as the flags needed to build
+mkeficapsule, use pkg-config when available.
+
+We gracefully fallback on the previous behavior of hardcoding -luuid
+-lgnutls if pkg-config is not available or fails with an error.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ tools/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 9f2339666a..9f6b282ad8 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -242,7 +242,8 @@ hostprogs-$(CONFIG_MIPS) += mips-relocs
+ hostprogs-$(CONFIG_ASN1_COMPILER)	+= asn1_compiler
+ HOSTCFLAGS_asn1_compiler.o = -idirafter $(srctree)/include
+ 
+-HOSTLDLIBS_mkeficapsule += -lgnutls -luuid
++HOSTLDLIBS_mkeficapsule += \
++	$(shell pkg-config --libs gnutls uuid 2> /dev/null || echo "-lgnutls -luuid")
+ hostprogs-$(CONFIG_TOOLS_MKEFICAPSULE) += mkeficapsule
+ 
+ # We build some files with extra pedantic flags to try to minimize things
+-- 
+2.30.2
+
diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
index ff376662e9..c747ce02d7 100644
--- a/configs/kontron_bl_imx8mm_defconfig
+++ b/configs/kontron_bl_imx8mm_defconfig
@@ -5,6 +5,7 @@ BR2_ARM_FPU_VFPV3=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
+BR2_GLOBAL_PATCH_DIR="board/kontron/bl-imx8mm/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -48,6 +49,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
 BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
 BR2_TARGET_UBOOT_SPL=y
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
