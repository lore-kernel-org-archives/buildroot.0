Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919E6CAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 13:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FEA24018A;
	Fri,  3 Oct 2025 13:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zF_y12aBHOMU; Fri,  3 Oct 2025 13:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A340404A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A340404A5;
	Fri,  3 Oct 2025 13:56:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E15313D
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 13:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BC2261209
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 13:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7t7SgD_3xAP8 for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 13:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 139E461233
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 139E461233
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 139E461233
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 13:56:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc8f.dip0.t-ipconnect.de [79.214.204.143])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48C68A4C5D14;
 Fri,  3 Oct 2025 15:55:35 +0200 (CEST)
Received: from [192.168.1.144] (port=42458 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4gFy-000000005ND-1qVj;
 Fri, 03 Oct 2025 13:55:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Oct 2025 15:55:29 +0200
Message-ID: <20251003135530.371676-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251003135530.371676-1-bernd@kuhls.net>
References: <20251003135530.371676-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759499736;
 bh=meRPXjIMNXalAZ3oT2gSZv85GRNuTdQAjn5FVrxDfcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=U2V31+/cEoKxUoeG7penHc9Qt2ZCXP87StloHDVQ6Y+Wej+EDSOwQDqSEMSKl102f
 dZmCmsJ0RTe8Xhk4LXmIaZHemnbd74XVzEFhvJKOqW3gpa2V008FQvLwbpM2HFgBlv
 zFdbi7GFkP7cNzvwLXqJEeLLZY3rafa0l1eRS4wp02B/rR3c/DMTptmfjZmiPQ/yzp
 LVAhVQhDLd0hSCyy96kvnJnisG7uoTmRIscyveLabTl0uRBjWCAQSZXCEtqFfPC6A9
 +VrsSspMDxQffJIJXUtDIirJp8u4sz+2hJhGuyTgkb1cQsxz+kb2dgd9dsWgC8Kom7
 ykGl/lqFMtyLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=U2V31+/c
Subject: [Buildroot] [PATCH 2/3] package/libjwt: remove package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
Waldemar agreed to remove the libjwt package:
https://patchwork.ozlabs.org/comment/3570243/

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
index 277d2b8b2a..adbcf0eaa3 100644
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
 config BR2_TARGET_ROOTFS_AXFS
 	bool "AXFS root filesystem has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 3e8bfd69d6..c2c867263a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3401,7 +3401,6 @@ F:	configs/stm32f746_disco_sd_defconfig
 F:	package/asterisk/
 F:	package/evilwm/
 F:	package/fbv/
-F:	package/libjwt/
 F:	package/mksh/
 F:	package/ruby/
 F:	package/uclibc/
diff --git a/package/Config.in b/package/Config.in
index 65e358e1e9..a88f254be5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1925,7 +1925,6 @@ menu "JSON/XML"
 	source "package/libbson/Config.in"
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
