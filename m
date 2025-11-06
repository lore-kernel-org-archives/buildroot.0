Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EE8CCFA05
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 20:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99BB2607F8;
	Thu,  6 Nov 2025 20:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3dAw-6j7Ivg; Thu,  6 Nov 2025 20:46:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DEAB607FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DEAB607FC;
	Thu,  6 Nov 2025 20:46:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B858961
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DC1D40805
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8eQ_uGaxonm for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 20:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43C204084F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43C204084F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43C204084F
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:46:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D5AD6A4C1F34;
 Thu,  6 Nov 2025 21:45:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46844)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vH6rG-0000000007X-24aI;
 Thu, 06 Nov 2025 20:45:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Nov 2025 21:45:12 +0100
Message-ID: <20251106204522.3273683-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106204522.3273683-1-bernd@kuhls.net>
References: <20251106204522.3273683-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762461926;
 bh=REpnWJSRymx4n4gk5NSDj5pDW7PEaJvmDUNJ+hhZhwY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=xcN8taVPYOeZqlfI3jHlJgXXKVrs9gWS4GQQ6PTKMAY+Tt8NIVEL2FEjD+txRD0cf
 Gyxn7sn4SxK5wiC9CtJNWolbkWrfmKUt5llv1yNktOmejw7KQouY6XSAeeWumpVarO
 Kgaueere7vuAOm6Pv9V+67BjSrr0cRWNIxMCWjqMgq30FSPkmFzcmeeC7I1+dBKc4W
 9kFiP8yNQzBTrteHyA+rwGfz8L7dIb9x/y91s8g2S3Gaf2gPmKcCatuO7yNRQY6aj3
 SIrAWbztd5CEAwHEu1gVO5naachJOL16awBaDJK9/panws7to2IShQtlCx1/Fwy0sb
 5F5fZEVGUc0zQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=xcN8taVP
Subject: [Buildroot] [PATCH v3 05/14] package/belr: remove package
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

belr was only needed as a dependency of linphone, as is anyway bundled
in more recent versions of linphone, making a separate package
unnnecessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
index db63ed2aab..8f3099d89a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
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
index cb48886d08..b9e7a32ea5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1019,7 +1019,6 @@ F:	package/openzwave/
 
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
 F:	package/bearssl/
-F:	package/belr/
 F:	package/boinc/
 F:	package/cairo/
 F:	package/daq3/
diff --git a/package/Config.in b/package/Config.in
index 9d80df3797..456c922413 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2167,7 +2167,6 @@ menu "Other"
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
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
