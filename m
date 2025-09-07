Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE46DCAC582
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 13:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35FD361BB5;
	Sun,  7 Sep 2025 13:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DhOaXkQ5334b; Sun,  7 Sep 2025 13:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FCB461C67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FCB461C67;
	Sun,  7 Sep 2025 13:37:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 234229E4
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1531E40731
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XZqdIM9tqW3 for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 13:37:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA9E8404E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA9E8404E4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA9E8404E4
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3D84B4E40C48
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 11C456061A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D862102F286D; 
 Sun,  7 Sep 2025 15:37:26 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Sep 2025 15:37:14 +0200
Message-ID: <20250907133721.3416326-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250907133721.3416326-1-thomas.petazzoni@bootlin.com>
References: <20250907133721.3416326-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757252246; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=LUcOuKfOVM1ET9JpsRjTaau7sDPABdQw2gdtoIdW0p0=;
 b=uRfPxwMenGvkZ7a2ZHyIUiMbuurBPBCMM9F3GyNV87smp+cRhcpFlSVpAZ13oNVAQrfBX3
 WAibkHkDeWcc2nfueD366JVmpw2gPXNZaw0LBn4f8xITx2irGRHFg8pkmqfkj3ca8HPByR
 gWpdF9eOZGmaKWqityAaJsluzQrq6BRRHWXcMT+hBEJrpzcWVfsW1/U45gBYvyHm0YmWBu
 wVSuJnJGiE00VhiS/MKsWV8HJM1s+7yXq29lUmr+/m3wGBygBZV9GS0h0PcxRKNI0GwmhO
 B55qnm2yUtAqC0+LQ8qabZAJNfnfTxsb97cH4RRlntDgKgOFFsksu4TyYhaXJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=uRfPxwMe
Subject: [Buildroot] [PATCH 3/6] package/belr: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

belr was only needed as a dependency of linphone, as is anyway bundled
in more recent versions of linphone, making a separate package
unnnecessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy       |  8 ++++++++
 DEVELOPERS             |  1 -
 package/Config.in      |  1 -
 package/belr/Config.in | 19 -------------------
 package/belr/belr.hash |  3 ---
 package/belr/belr.mk   | 25 -------------------------
 6 files changed, 8 insertions(+), 49 deletions(-)
 delete mode 100644 package/belr/Config.in
 delete mode 100644 package/belr/belr.hash
 delete mode 100644 package/belr/belr.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index d2f2684673..3e7bd457a6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_BELR
+	bool "belr has been removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as part of the linphone
+	  removal. In addition, newer version of linphone directly
+	  bundle belr making a separate package unnecessary.
+
 config BR2_PACKAGE_BELLE_SIP
 	bool "belle-sip has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 2c188d8dca..6a8acf8589 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1012,7 +1012,6 @@ F:	package/openzwave/
 
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
 F:	package/bearssl/
-F:	package/belr/
 F:	package/boinc/
 F:	package/cairo/
 F:	package/daq3/
diff --git a/package/Config.in b/package/Config.in
index 17cc0288e0..989d7a1efd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2180,7 +2180,6 @@ menu "Other"
 	source "package/basu/Config.in"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
-	source "package/belr/Config.in"
 	source "package/boost/Config.in"
 	source "package/c-capnproto/Config.in"
 	source "package/capnproto/Config.in"
diff --git a/package/belr/Config.in b/package/belr/Config.in
deleted file mode 100644
index f3f742ad28..0000000000
--- a/package/belr/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_BELR
-	bool "belr"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # bctoolbox
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # bctoolbox
-	select BR2_PACKAGE_BCTOOLBOX
-	help
-	  Belr is Belledonne Communications' language recognition
-	  library, written in C++11. It parses text inputs formatted
-	  according to a language defined by an ABNF grammar, such as
-	  the protocols standardized at IETF.
-
-	  https://gitlab.linphone.org/BC/public/belr
-
-comment "belr needs a toolchain w/ threads, C++"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "belr needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/belr/belr.hash b/package/belr/belr.hash
deleted file mode 100644
index 00c733c7df..0000000000
--- a/package/belr/belr.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  6358aa680193d972c831d677da1652c7f57d7e00649b971d4d9fbdebf4331b48  belr-4.4.8.tar.gz
-sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/belr/belr.mk b/package/belr/belr.mk
deleted file mode 100644
index 26b949734f..0000000000
--- a/package/belr/belr.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# belr
-#
-################################################################################
-
-BELR_VERSION = 4.4.8
-BELR_SITE = https://gitlab.linphone.org/BC/public/belr/-/archive/$(BELR_VERSION)
-BELR_LICENSE = GPL-3.0+
-BELR_LICENSE_FILES = LICENSE.txt
-BELR_INSTALL_STAGING = YES
-BELR_DEPENDENCIES = bctoolbox
-BELR_CONF_OPTS = \
-	-DENABLE_STRICT=OFF \
-	-DENABLE_TESTS=OFF \
-	-DENABLE_TOOLS=OFF
-
-ifeq ($(BR2_STATIC_LIBS),y)
-BELR_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
-else
-# cannot build static and shared together
-BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
-endif
-
-$(eval $(cmake-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
