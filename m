Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D67BCCFA13
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 20:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A52286083E;
	Thu,  6 Nov 2025 20:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oc9odzFRCSdT; Thu,  6 Nov 2025 20:46:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED7E260825
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED7E260825;
	Thu,  6 Nov 2025 20:46:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CA7193E
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A19984533
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oq36viv0juBF for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 20:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 354F884514
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 354F884514
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 354F884514
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:46:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 407CBA4C1F55;
 Thu,  6 Nov 2025 21:45:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46844)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vH6rG-0000000007X-3hgj;
 Thu, 06 Nov 2025 20:45:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Nov 2025 21:45:14 +0100
Message-ID: <20251106204522.3273683-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106204522.3273683-1-bernd@kuhls.net>
References: <20251106204522.3273683-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762461927;
 bh=hvZWF/YxHayRUSwpxaTH5GkXh5kds+jf4cKTo/chdNQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bZMzUdmBErcXCZZ4z0Bw2jBPHsiJ83GWXWpMeo1MkFo1i//FK5w5Gfa7+OXm9kXu8
 qGuDhbx6eXeh73Xbqy+gu686D3qSGIXEl0WFbow3k6ANWGG+o5YeO1fH7vfBPscDeq
 KAbbH37yYz12M4l9qTbP/TZV0M5l8cY5TbeOr9odutMimdcIqL8Y90dJBf39F/GoWR
 rjEPaN8KbvX7ZNZ8ZUZAfDy67Gr7yKzFWEZs9v5emdAtGcyg13NO8rfDz9/dehGHho
 PJ7KHFPIHVRAhPV12erdxwOOSgLL+YlE5kSCBMupH6w5GM+Fo32916A/ctNmWDiMAj
 ruH1D7sFsTuAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=bZMzUdmB
Subject: [Buildroot] [PATCH v3 07/14] package/ortp: remove package
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Carsten Schoenert <c.schoenert@gmail.com>, Lionel Orry <lionel.orry@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

ortp was only needed as a dependency of linphone, as is anyway bundled
in more recent versions of linphone, making a separate package
unnnecessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
index 4744df6573..15811cea16 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
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
index 09475970f9..2f60388b9b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2129,7 +2129,6 @@ menu "Networking"
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
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
