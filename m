Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7223DCAC582
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 13:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 441CD61CAD;
	Sun,  7 Sep 2025 13:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJWzf_A7B9ao; Sun,  7 Sep 2025 13:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CC1F61CA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CC1F61CA8;
	Sun,  7 Sep 2025 13:37:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2220D9E4
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 141348475A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqxA0mkegU22 for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 13:37:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BEA818330B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEA818330B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEA818330B
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2161C4E40C4A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F066A6061A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 75D97102F1D00; 
 Sun,  7 Sep 2025 15:37:28 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Sep 2025 15:37:16 +0200
Message-ID: <20250907133721.3416326-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250907133721.3416326-1-thomas.petazzoni@bootlin.com>
References: <20250907133721.3416326-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757252248; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=QpwDdSh1hmdPCV8b32yboO8tMTgnJgAa8AC0yA07alM=;
 b=RA3qRS9BgH3sFwmSYeZteQZDr94k6jPyuAvwxQLXlL6WYg13PKb4YovwEVmnPn8hS9iUiF
 qhOiSmfpatTysZ+VKtknHPIgPN5mA7QqRNyKXlij4eHDKIWdNpviLGCNViMTdJofRS0Hfs
 6zGocld5/tWoaAyOanbDAWudeWg6CJZ+BS0UlZX9rZgO/mqDTyi84P1akEcPWpiv3Vg6iN
 8XXfVETqtWtOAQbG7kNEqDroppwY4ll8qsJYpezcCOy0Yui4qhNhiK5lk2bi/Cy4qGG3Og
 6BE3SzYgYTOcbo62WYrrZPvCqvholzEzRqddDAIgQtJf6I4QjUqeIolbw8bR6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=RA3qRS9B
Subject: [Buildroot] [PATCH 5/6] package/ortp: remove package
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

ortp was only needed as a dependency of linphone, as is anyway bundled
in more recent versions of linphone, making a separate package
unnnecessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy       |  8 ++++++++
 package/Config.in      |  1 -
 package/ortp/Config.in | 16 ----------------
 package/ortp/ortp.hash |  3 ---
 package/ortp/ortp.mk   | 25 -------------------------
 5 files changed, 8 insertions(+), 45 deletions(-)
 delete mode 100644 package/ortp/Config.in
 delete mode 100644 package/ortp/ortp.hash
 delete mode 100644 package/ortp/ortp.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 0f3120e27b..3b2b59ae97 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_ORTP
+	bool "ortp has been removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as part of the linphone
+	  removal. In addition, newer version of linphone directly
+	  bundle ortp making a separate package unnecessary.
+
 config BR2_PACKAGE_MEDIASTREAMER
 	bool "mediastreamer has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 2e841c12b6..eaff3447d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2142,7 +2142,6 @@ menu "Networking"
 	source "package/openmpi/Config.in"
 	source "package/openpgm/Config.in"
 	source "package/openzwave/Config.in"
-	source "package/ortp/Config.in"
 	source "package/paho-mqtt-c/Config.in"
 	source "package/paho-mqtt-cpp/Config.in"
 	source "package/pistache/Config.in"
diff --git a/package/ortp/Config.in b/package/ortp/Config.in
deleted file mode 100644
index e296e82f7a..0000000000
--- a/package/ortp/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_ORTP
-	bool "oRTP"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # bctoolbox
-	select BR2_PACKAGE_BCTOOLBOX
-	help
-	  oRTP, a Real-time Transport Protocol (RTP,RFC3550) library
-
-	  https://www.linphone.org/technical-corner/ortp
-
-comment "ortp needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "ortp needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/ortp/ortp.hash b/package/ortp/ortp.hash
deleted file mode 100644
index 7853c63143..0000000000
--- a/package/ortp/ortp.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  9b1d43f676a35920e2837abc0eb4d600d4d3e47d2621fa3b0897777cf587ee8d  ortp-4.4.8.tar.gz
-sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
deleted file mode 100644
index 67bef9aebb..0000000000
--- a/package/ortp/ortp.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# ortp
-#
-################################################################################
-
-ORTP_VERSION = 4.4.8
-ORTP_SITE = https://gitlab.linphone.org/BC/public/ortp/-/archive/$(ORTP_VERSION)
-ORTP_LICENSE = GPL-3.0+
-ORTP_LICENSE_FILES = LICENSE.txt
-ORTP_INSTALL_STAGING = YES
-ORTP_DEPENDENCIES = bctoolbox
-ORTP_CONF_OPTS = \
-	-DENABLE_DOC=OFF \
-	-DENABLE_STRICT=OFF
-
-ifeq ($(BR2_STATIC_LIBS),y)
-ORTP_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-ORTP_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-ORTP_CONF_OPTS += -DENABLE_STATIC=OFF -DENABLE_SHARED=ON
-endif
-
-$(eval $(cmake-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
