Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EF8C3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 09:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BD6640438;
	Thu, 11 Jul 2024 09:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lmwds8dlvxx8; Thu, 11 Jul 2024 09:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8F63405C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8F63405C7;
	Thu, 11 Jul 2024 09:12:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02D021BF574
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3708416A4
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEAuBNJUcJD7 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 09:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 778E2413DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 778E2413DD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 778E2413DD
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 09:12:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4257C240007;
 Thu, 11 Jul 2024 09:12:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 11:12:06 +0200
Message-Id: <20240711091206.2551882-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720689136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4FQjDu7SIprlPPviPBDz5YPi2YyXytG3xVNR+QAFUY0=;
 b=YnG6A4D8LbLHyA4p8SLvFw++OCl61y7YCOGhqNt1fK6ugsYjLLjgGsMpSRFchYFXB3d5IA
 H0dDVmVgIK32XAWcX3qS15mXyDnv6JA2ZSBV8t+X91r7FUbk+lmUzGfwfGV3MUW/a9fkLY
 7J6V1RckmM2XjpgAt9vvL8BLw/zm8q5JMbLQL36hKxwLjm7jsxE7Xa219ysg8gVbev5bGg
 IiwhNMxkAgZqUFHWiiKSSNwOMb/Wb7ustsGUCG+t+6UfZD79/0DSBOQ7p4wu0uo9ct8Iq/
 tZUiVVFqcpmyD4aBH09Y4nagkxhecPqyKpwsDja2FEkWV/u11HKFuteiAbrVOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YnG6A4D8
Subject: [Buildroot] [PATCH] package/gcnano-binaries: Add STM32MP2 support
 and bump to 6.4.15
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Jens Kleintje <scooby22@web.de>,
 thomas.petazzoni@bootlin.com, Romain Gantois <romain.gantois@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Gantois <romain.gantois@bootlin.com>

Add initial support for STM32MP257 GPU drivers.

gcnano-binaries will be configured for STM32MP1 platforms on ARM 32-bits
and STM32MP2 on ARM 64-bits.

Update to the latest version of the gcnano-binaries blobs, which are
compatible with the last v6.1-stm32mp-r2 kernel from the
STMicroelectronics BSP.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/gcnano-binaries/Config.in            |  6 +++---
 package/gcnano-binaries/gcnano-binaries.hash |  2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 20 +++++++++++++++-----
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/package/gcnano-binaries/Config.in b/package/gcnano-binaries/Config.in
index 89f909f2c3..f01468f09f 100644
--- a/package/gcnano-binaries/Config.in
+++ b/package/gcnano-binaries/Config.in
@@ -1,15 +1,15 @@
 comment "gcnano-binaries needs a Linux kernel to be built"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on !BR2_LINUX_KERNEL
 
 comment "gcnano-binaries needs a glibc toolchain w/ threads, dynamic library"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GCNANO_BINARIES
 	bool "gcnano-binaries"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
index 3192b0d854..d3c64d44a3 100644
--- a/package/gcnano-binaries/gcnano-binaries.hash
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8bb1f6ee633f3c30e16b33ff6913286edf31f77b69105a14d147509beba3ea94  gcnano-binaries-5d02efd5cb4cfa85307633891f3cf87550a8bc1d.tar.gz
+sha256  4c7454ac44c9e3ead20a978a5c009e8489fa90ce5cf291be31016a7f497bea26  gcnano-binaries-bbaae49a0e4859ed53f898a250269c8a237261bc.tar.gz
 sha256  29c78804b097b5cfee0e802bef9f60348a635640eadd8a91b7ce82ddf17fbf5a  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index c3aa5d48d2..03912ea585 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -4,11 +4,20 @@
 #
 ################################################################################
 
-GCNANO_BINARIES_LIB_VERSION = 6.4.13
+GCNANO_BINARIES_LIB_VERSION = 6.4.15
 GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION)
-GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION)-20230517
-GCNANO_BINARIES_VERSION = 5d02efd5cb4cfa85307633891f3cf87550a8bc1d
+
 GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
+GCNANO_BINARIES_VERSION = bbaae49a0e4859ed53f898a250269c8a237261bc
+ifeq ($(BR2_arm),y)
+GCNANO_BINARIES_USERLAND_VERSION = stm32mp1-$(GCNANO_BINARIES_LIB_VERSION)-20240206
+GCNANO_BINARIES_ARCH_TYPE = arm
+GCNANO_BINARIES_SOC_PLATFORM = st-mp1
+else
+GCNANO_BINARIES_USERLAND_VERSION = stm32mp2-$(GCNANO_BINARIES_LIB_VERSION)-20240517
+GCNANO_BINARIES_ARCH_TYPE = arm64
+GCNANO_BINARIES_SOC_PLATFORM = st-mp2
+endif
 
 GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
 GCNANO_BINARIES_LICENSE_FILES = EULA
@@ -38,8 +47,9 @@ GCNANO_BINARIES_POST_EXTRACT_HOOKS += GCNANO_BINARIES_EXTRACT_HELPER
 GCNANO_BINARIES_MODULE_SUBDIRS = gcnano-driver-stm32mp
 
 GCNANO_BINARIES_MODULE_MAKE_OPTS = \
+	ARCH_TYPE=$(GCNANO_BINARIES_ARCH_TYPE) \
 	KERNEL_DIR=$(LINUX_DIR) \
-	SOC_PLATFORM=st-mp1 \
+	SOC_PLATFORM=$(GCNANO_BINARIES_SOC_PLATFORM) \
 	AQROOT=$(@D)/gcnano-driver-stm32mp \
 	DEBUG=0
 
@@ -58,7 +68,7 @@ define GCNANO_BINARIES_INSTALL
 	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
 	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
 	for file in *.pc ; do \
-		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|22.0.3|" $$file > $$file.temp ; \
+		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|23.0.3|" $$file > $$file.temp ; \
 		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
 	done
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
