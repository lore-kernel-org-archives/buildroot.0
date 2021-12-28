Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C113C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 15:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11A7960AF7;
	Tue, 28 Dec 2021 15:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 40eF7DLA9S_G; Tue, 28 Dec 2021 15:34:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F1B860AF1;
	Tue, 28 Dec 2021 15:34:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D4CD1BF2BD
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 15:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C8E540325
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 15:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GHzmJNjuIGP0 for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 15:34:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 375E0402FE
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 15:34:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id l4so11853872wmq.3
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 07:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MEvfhvfLFTUy/nFJODsHeMVUAdbzCTDppUTP8QmGBgw=;
 b=fxHB08QAvlF4H2pzRSCu4FKx/Z0l8AWfQXGbGqqv7Fwnd+y+gHzoeSyDCH/QBPzM4Q
 T+B3r3JB1LxKsqxYAR5EMcUOCQJjf4Vbkrjm8TrKdBr4uw28Hgc85LTipCVXIfYwS7vM
 o96VFe+Dy24bqTopkrOdkmvokWSqbosqSzlVUPGXTWCoiyZ0KaR7EmnHdL1wcY4rqjRl
 L+Agl0UoF/27Q29SgcBMkNgCQvobq2FHIKb7o5xX2kMiUpIP01/cmM8RG9R72Ooi2A+n
 XiMT/nF8JHlZqssqyMwqYXM1GfKTOSuNT/nJ2r2QLINdbkva93aqjWHagFSTUiUjEmsp
 +/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MEvfhvfLFTUy/nFJODsHeMVUAdbzCTDppUTP8QmGBgw=;
 b=eN3g4Em7Sd0ZZQF6th9LxTEny96AYfF1a12JPQ10w3ZaEUysStRrQxY8O2Sumiz7WP
 KNSSrTO4toaxIFpMt1F3G5rwwFbgyonKeF7FXf/RG3YT9DtDwOkIZG0Cfg5TT2S80cZg
 Nmdcv6QmimH6Z/IcZSsxE1j1ABi4j2K8ofS6MI2HoxpUCEClgmfECXeLixjGlW7L95im
 +Rx9FAWzxgHAyWA9ViKZeSTgtO4a7rjeABPcXvy8KJEzG1dpFL0V8NBgTNRsvICUoyMD
 JDf92T6GhruV6UtfnBP5Emd6rYazRP3MgM7ppMFUQq82aJ7Tl92Gvq1qH0G5+I4sW3tW
 k4sw==
X-Gm-Message-State: AOAM531UJcrWHX+9lg0Xki7HxmIg97BCNxXoJPf40KSUbm1oMVg+QLxW
 4x9ua1EDFRf+ABAAX+utax3VWkefFHDfPA==
X-Google-Smtp-Source: ABdhPJwDAL57uRBeOwlrAPRzvq4xfR3eRnDMmwwTV2BboyF2eVdXessZNqxoZyRJyN8nBtOETzV/fQ==
X-Received: by 2002:a05:600c:1e24:: with SMTP id
 ay36mr18056722wmb.84.1640705691313; 
 Tue, 28 Dec 2021 07:34:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id p13sm17233573wrr.37.2021.12.28.07.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 07:34:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 16:33:44 +0100
Message-Id: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/mbedtls3: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mbedtls 3.x is incompatible with mbedtls 2.x:
https://github.com/ARMmbed/mbedtls/blob/development/docs/3.0-migration-guide.md

mbedtls3 was created from mbedtls package with the following changes:
 - license file is now LICENSE
 - zlib compression is not available anymore
 - config.h renamed to mbedtls_config.h

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/mbedtls3/Config.in     | 21 ++++++++++++
 package/mbedtls3/mbedtls3.hash |  4 +++
 package/mbedtls3/mbedtls3.mk   | 61 ++++++++++++++++++++++++++++++++++
 5 files changed, 88 insertions(+)
 create mode 100644 package/mbedtls3/Config.in
 create mode 100644 package/mbedtls3/mbedtls3.hash
 create mode 100644 package/mbedtls3/mbedtls3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 29390b0cc1..5604a1dd56 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -900,6 +900,7 @@ F:	package/libupnp/
 F:	package/libv4l/
 F:	package/libxslt/
 F:	package/mbedtls/
+F:	package/mbedtls3/
 F:	package/minissdpd/
 F:	package/minizip/
 F:	package/mongodb/
diff --git a/package/Config.in b/package/Config.in
index 2635cc4b3c..422eff525d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1419,6 +1419,7 @@ menu "Crypto"
 	source "package/libuecc/Config.in"
 	source "package/libxcrypt/Config.in"
 	source "package/mbedtls/Config.in"
+	source "package/mbedtls3/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
 	source "package/pkcs11-helper/Config.in"
diff --git a/package/mbedtls3/Config.in b/package/mbedtls3/Config.in
new file mode 100644
index 0000000000..83981bdf23
--- /dev/null
+++ b/package/mbedtls3/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_MBEDTLS3
+	bool "mbedtls3"
+	depends on !BR2_PACKAGE_MBEDTLS
+	help
+	  mbed TLS (formerly known as PolarSSL) makes it trivially easy
+	  for developers to include cryptographic and SSL/TLS
+	  capabilities in their (embedded) products, facilitating this
+	  functionality with a minimal coding footprint.
+
+	  https://tls.mbed.org/
+
+if BR2_PACKAGE_MBEDTLS3
+
+config BR2_PACKAGE_MBEDTLS3_PROGRAMS
+	bool "mbedtls programs"
+	depends on BR2_USE_MMU # fork()
+	help
+	  This option enables the installation and the build of
+	  mbed TLS companion programs.
+
+endif
diff --git a/package/mbedtls3/mbedtls3.hash b/package/mbedtls3/mbedtls3.hash
new file mode 100644
index 0000000000..6da1030bff
--- /dev/null
+++ b/package/mbedtls3/mbedtls3.hash
@@ -0,0 +1,4 @@
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v3.1.0:
+sha256  b02df6f68dd1537e115a8497d5c173dc71edc55ad084756e57a30f951b725acd  mbedtls3-3.1.0.tar.gz
+# Locally calculated
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/mbedtls3/mbedtls3.mk b/package/mbedtls3/mbedtls3.mk
new file mode 100644
index 0000000000..c49b92aa9e
--- /dev/null
+++ b/package/mbedtls3/mbedtls3.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# mbedtls3
+#
+################################################################################
+
+MBEDTLS3_VERSION = 3.1.0
+MBEDTLS3_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS3_VERSION))
+MBEDTLS3_CONF_OPTS = \
+	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS3_PROGRAMS),ON,OFF) \
+	-DENABLE_TESTING=OFF
+MBEDTLS3_INSTALL_STAGING = YES
+MBEDTLS3_LICENSE = Apache-2.0
+MBEDTLS3_LICENSE_FILES = LICENSE
+MBEDTLS3_CPE_ID_VENDOR = arm
+MBEDTLS3_CPE_ID_PRODUCT = mbed_tls
+
+# This is mandatory for hiawatha
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+define MBEDTLS3_ENABLE_THREADING
+	$(SED) "s://#define MBEDTLS_THREADING_C:#define MBEDTLS_THREADING_C:" \
+		$(@D)/include/mbedtls/mbedtls_config.h
+	$(SED) "s://#define MBEDTLS_THREADING_PTHREAD:#define MBEDTLS_THREADING_PTHREAD:" \
+		$(@D)/include/mbedtls/mbedtls_config.h
+endef
+MBEDTLS3_POST_PATCH_HOOKS += MBEDTLS3_ENABLE_THREADING
+ifeq ($(BR2_STATIC_LIBS),y)
+MBEDTLS3_CONF_OPTS += -DLINK_WITH_PTHREAD=ON
+endif
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+MBEDTLS3_CONF_OPTS += \
+	-DUSE_SHARED_MBEDTLS_LIBRARY=OFF -DUSE_STATIC_MBEDTLS_LIBRARY=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+MBEDTLS3_CONF_OPTS += \
+	-DUSE_SHARED_MBEDTLS_LIBRARY=ON -DUSE_STATIC_MBEDTLS_LIBRARY=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+MBEDTLS3_CONF_OPTS += \
+	-DUSE_SHARED_MBEDTLS_LIBRARY=ON -DUSE_STATIC_MBEDTLS_LIBRARY=OFF
+endif
+
+define MBEDTLS3_DISABLE_ASM
+	$(SED) '/^#define MBEDTLS_AESNI_C/d' \
+		$(@D)/include/mbedtls/mbedtls_config.h
+	$(SED) '/^#define MBEDTLS_HAVE_ASM/d' \
+		$(@D)/include/mbedtls/mbedtls_config.h
+	$(SED) '/^#define MBEDTLS_PADLOCK_C/d' \
+		$(@D)/include/mbedtls/mbedtls_config.h
+endef
+
+# ARM in thumb mode breaks debugging with asm optimizations
+# Microblaze asm optimizations are broken in general
+# MIPS R6 asm is not yet supported
+ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),yy)
+MBEDTLS3_POST_CONFIGURE_HOOKS += MBEDTLS3_DISABLE_ASM
+else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
+MBEDTLS3_POST_CONFIGURE_HOOKS += MBEDTLS3_DISABLE_ASM
+endif
+
+$(eval $(cmake-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
