Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D5ACCFA13
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 20:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51833607EA;
	Thu,  6 Nov 2025 20:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QUKXsMjcFyh8; Thu,  6 Nov 2025 20:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DA41607FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DA41607FC;
	Thu,  6 Nov 2025 20:45:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A86C93E
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4B1984357
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZ4dfISE8Zfp for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 20:45:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4487842CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4487842CE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4487842CE
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:45:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76617A4C1F0B;
 Thu,  6 Nov 2025 21:45:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46844)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vH6rG-0000000007X-0Fvy;
 Thu, 06 Nov 2025 20:45:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Nov 2025 21:45:09 +0100
Message-ID: <20251106204522.3273683-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106204522.3273683-1-bernd@kuhls.net>
References: <20251106204522.3273683-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762461926;
 bh=Kp00lBJv9bqMlpgchp0BABO4zARuhnVFvrO4hG9lsv0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZWyZRsK4aTsdawqdeCcUc29xdm7WcRzSSR0iceTJjeZDEatI4QblvGEYHmXHf0/lA
 7d3arBzXv5j25hzy4Ui4QTejiTgcAKMRDiWg59m1uluKilkUACAdRgTXRHEfnwCdnc
 /AcuAOMMFVDb8FfIw2m1Lyswd9nkiecfIP4mkHF/CFKMzcKfezZw0UQGXqZ/teDVax
 Ol62GOvqF93X7q5ulMBTJrTwK5hmhSrtB8QQAiaofSHaet9Bpk212Km5Dq8hhCr/yD
 syYhmFNVbx1QquKhXrQzNiyuXhPyOBFNVNxoWwMQ/dvvdp12ige66WLyUPsGbJ4cJl
 Wl3SIBaynPoiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ZWyZRsK4
Subject: [Buildroot] [PATCH v3 02/14] package/libjwt: remove package
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

In commit 770f9154978c40ce5b7718174108b37c5310869d, libjwt was bumped
from 1.17.2 to 3.2.0, which is a big bump. And the libjwt website
states "Version 3 of LibJWT is a complete overhaul of the code. Please
see documentation for usage."

And indeed, this version bump breaks the build of Asterisk. Therefore
asterisk uses its bundled version of libjwt now and this package can be
removed as no other package depends on it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy           |  8 ++++++++
 DEVELOPERS                 |  1 -
 package/Config.in          |  1 -
 package/libjwt/Config.in   | 10 ----------
 package/libjwt/libjwt.hash |  3 ---
 package/libjwt/libjwt.mk   | 19 -------------------
 6 files changed, 8 insertions(+), 34 deletions(-)
 delete mode 100644 package/libjwt/Config.in
 delete mode 100644 package/libjwt/libjwt.hash
 delete mode 100644 package/libjwt/libjwt.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 26391bec23..5aa271183e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LIBJWT
+	bool "libjwt has been removed"
+	select BR2_LEGACY
+	help
+	  The only dependee of libjwt, asterisk, is incompatible with
+	  version 3 so the version bundled with asterisk is used and
+	  this package can be removed.
+
 config BR2_PACKAGE_RAMSPEED
 	bool "ramspeed has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index b14c6e3875..f9cf31f7e2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3420,7 +3420,6 @@ F:	configs/stm32f746_disco_sd_defconfig
 F:	package/asterisk/
 F:	package/evilwm/
 F:	package/fbv/
-F:	package/libjwt/
 F:	package/libpam-pkcs11/
 F:	package/mksh/
 F:	package/ruby/
diff --git a/package/Config.in b/package/Config.in
index 930f368058..07244a86e2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1927,7 +1927,6 @@ menu "JSON/XML"
 	source "package/jsoncpp/Config.in"
 	source "package/libfastjson/Config.in"
 	source "package/libjson/Config.in"
-	source "package/libjwt/Config.in"
 	source "package/libroxml/Config.in"
 	source "package/libucl/Config.in"
 	source "package/libxml2/Config.in"
diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
deleted file mode 100644
index 47eb0882a3..0000000000
--- a/package/libjwt/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_LIBJWT
-	bool "libjwt"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
-	select BR2_PACKAGE_JANSSON
-	help
-	  JSON Web Tokens are an open, industry standard RFC 7519
-	  method for representing claims securely between two parties.
-
-	  https://github.com/benmcollins/libjwt
diff --git a/package/libjwt/libjwt.hash b/package/libjwt/libjwt.hash
deleted file mode 100644
index 8e59d2284b..0000000000
--- a/package/libjwt/libjwt.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  17ee4e25adfbb91003946af967ff04068a5c93d6b51ad7ad892f1441736b71b9  libjwt-3.2.0.tar.xz
-sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSE
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
deleted file mode 100644
index d20067de24..0000000000
--- a/package/libjwt/libjwt.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# libjwt
-#
-################################################################################
-
-LIBJWT_VERSION = 3.2.0
-LIBJWT_SITE = https://github.com/benmcollins/libjwt/releases/download/v$(LIBJWT_VERSION)
-LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.xz
-LIBJWT_DEPENDENCIES = host-pkgconf jansson openssl
-LIBJWT_INSTALL_STAGING = YES
-LIBJWT_LICENSE = MPL-2.0
-LIBJWT_LICENSE_FILES = LICENSE
-LIBJWT_CPE_ID_VENDOR = bencollins
-LIBJWT_CPE_ID_PRODUCT = jwt_c_library
-
-LIBJWT_CONF_OPTS += -DWITH_TESTS=OFF -DWITH_GNUTLS=OFF
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
