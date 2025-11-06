Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAE0CCFA13
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 20:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DC1640833;
	Thu,  6 Nov 2025 20:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5idEbKx2UljM; Thu,  6 Nov 2025 20:46:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95DF940835
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95DF940835;
	Thu,  6 Nov 2025 20:46:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E95F961
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34F3784358
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zI1evqm91g3 for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 20:46:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24FA384357
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24FA384357
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24FA384357
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:46:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BA7C4A4C1F2B;
 Thu,  6 Nov 2025 21:45:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46844)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vH6rG-0000000007X-1WCL;
 Thu, 06 Nov 2025 20:45:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Nov 2025 21:45:11 +0100
Message-ID: <20251106204522.3273683-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106204522.3273683-1-bernd@kuhls.net>
References: <20251106204522.3273683-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762461926;
 bh=JIFUPZOyVn5g7Z4iNAca5gah38THZ4SPF3bUTGXmSK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=whya+TnKgs7YKYPXKsGx3vTy/5hOEjqI2QBXtitn90AoEgX86fQ0yPL1tcf9J5BqI
 YzJCFYNq38+rg2e5FzEEgUkriEf1aF83vsuIn6aDaan5vPvfM3VTPxS3dxUqWl3/bp
 p+WnN8treImaYX8nPzDUArhmlzGjmGSxuNmChNExhQfKV7iB8W9sZhQXR8cKvaP+TU
 0Lhlhqv0sg1AA4l9I0oDm2gyP6Nu5Vcl7EqKlU34Yu522iYUccuZ6mZKZEkatI8+O0
 I8KQd8WnlxG04bd15annMcszRvWBsFEfAbyOdIKb85aSju4EnALmbMnc/B9+3i0Imf
 MqIBDuSpQQQig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=whya+TnK
Subject: [Buildroot] [PATCH v3 04/14] package/belle-sip: remove package
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

belle-sip was only needed as a dependency of linphone, as is anyway
bundled in more recent versions of linphone, making a separate package
unnnecessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                 |  8 +++++++
 DEVELOPERS                       |  1 -
 package/Config.in                |  1 -
 package/belle-sip/Config.in      | 22 ------------------
 package/belle-sip/belle-sip.hash |  3 ---
 package/belle-sip/belle-sip.mk   | 40 --------------------------------
 6 files changed, 8 insertions(+), 67 deletions(-)
 delete mode 100644 package/belle-sip/Config.in
 delete mode 100644 package/belle-sip/belle-sip.hash
 delete mode 100644 package/belle-sip/belle-sip.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index b33798e7ed..db63ed2aab 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_BELLE_SIP
+	bool "belle-sip has been removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as part of the linphone
+	  removal. In addition, newer version of linphone directly
+	  bundle belle-sip making a separate package unnecessary.
+
 config BR2_PACKAGE_LINPHONE
 	bool "linphone has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f9cf31f7e2..cb48886d08 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1019,7 +1019,6 @@ F:	package/openzwave/
 
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
 F:	package/bearssl/
-F:	package/belle-sip/
 F:	package/belr/
 F:	package/boinc/
 F:	package/cairo/
diff --git a/package/Config.in b/package/Config.in
index f7f5755315..9d80df3797 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2010,7 +2010,6 @@ menu "Networking"
 	source "package/azmq/Config.in"
 	source "package/azure-iot-sdk-c/Config.in"
 	source "package/batman-adv/Config.in"
-	source "package/belle-sip/Config.in"
 	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/cni-plugins/Config.in"
diff --git a/package/belle-sip/Config.in b/package/belle-sip/Config.in
deleted file mode 100644
index 8e4de366e4..0000000000
--- a/package/belle-sip/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-config BR2_PACKAGE_BELLE_SIP
-	bool "belle-sip"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS # dlfcn.h
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # bctoolbox
-	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_BCTOOLBOX
-	# needs crypto support in bctoolbox
-	select BR2_PACKAGE_MBEDTLS
-	help
-	  Belle-sip is a modern library implementing SIP (RFC 3261)
-	  transport, transaction and dialog layers.
-
-	  http://www.linphone.org/technical-corner/belle-sip
-
-comment "belle-sip needs a toolchain w/ threads, C++, dynamic library, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-
-comment "belle-sip needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/belle-sip/belle-sip.hash b/package/belle-sip/belle-sip.hash
deleted file mode 100644
index 670ce0062e..0000000000
--- a/package/belle-sip/belle-sip.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  eabba615c97080572c1b9d3c76f8f9cf6a7432eedf37482672e5fa178a688f72  belle-sip-4.4.8.tar.gz
-sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
deleted file mode 100644
index b4de3612ce..0000000000
--- a/package/belle-sip/belle-sip.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-################################################################################
-#
-# belle-sip
-#
-################################################################################
-
-BELLE_SIP_VERSION = 4.4.8
-BELLE_SIP_SITE = \
-	https://gitlab.linphone.org/BC/public/belle-sip/-/archive/$(BELLE_SIP_VERSION)
-BELLE_SIP_LICENSE = GPL-3.0+
-BELLE_SIP_LICENSE_FILES = LICENSE.txt
-BELLE_SIP_CPE_ID_VENDOR = linphone
-BELLE_SIP_INSTALL_STAGING = YES
-BELLE_SIP_DEPENDENCIES = \
-	bctoolbox \
-	$(if $(BR2_PACKAGE_ZLIB),zlib)
-BELLE_SIP_CONF_OPTS = \
-	-DENABLE_STRICT=OFF \
-	-DENABLE_TESTS=OFF
-
-ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
-BELLE_SIP_CONF_OPTS += -DENABLE_MDNS=ON
-BELLE_SIP_DEPENDENCIES += avahi
-else
-BELLE_SIP_CONF_OPTS += -DENABLE_MDNS=OFF
-endif
-
-ifeq ($(BR2_STATIC_LIBS),y)
-BELLE_SIP_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-BELLE_SIP_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-BELLE_SIP_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
-endif
-
-BELLE_SIP_CFLAGS = $(TARGET_CFLAGS)
-
-BELLE_SIP_CONF_OPTS += -DCMAKE_C_FLAGS="$(BELLE_SIP_CFLAGS)"
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
