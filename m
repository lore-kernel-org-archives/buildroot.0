Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9703D3B996
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 21:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE3184756;
	Tue,  9 Dec 2025 21:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXu6oneR-ozR; Tue,  9 Dec 2025 21:14:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 699688487A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765314855;
	bh=CTXHX4Rf8vuDj+p31FX7cU9UyANsL++sV4MhDES+PwM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fqzyNSnmNlsejdGbniQamsOYXi7gl3ymwLjdF4uKaj/3tN2tToHfayFWz66PgbQV5
	 MMpI77eeeOzsnW75cWzHZ/HTRWHE6XJCJ5EZIi5pVM66/uqL7Xd3yp6s3wJ8Jr0hXI
	 9j3eu/AxBE1R/2u4ku92z0mCW13c73Fvc4/LdIgAzAG8PEkSanu0rhbmMPo9kXic/F
	 GTt9nGS5cJmZq4t8LLK6R5mkuhdIfP60mdAaJggZVZy2wCEWPKpPx8DuBqlxTEIzMO
	 WeWALy+hKnDLbEd3z7Brz0sqPR8MBl5xO9qhDtu1oJVhxqP9qr5+Np4vVmeHcAhGLw
	 hOexkNUeljDrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 699688487A;
	Tue,  9 Dec 2025 21:14:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 616CD237
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AC01613C3
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYrmoGtFyLjA for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 21:14:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A2946139A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A2946139A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A2946139A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:14:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 15F3EA4C0319;
 Tue,  9 Dec 2025 22:14:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43728)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT527-0000000066R-3pAY;
 Tue, 09 Dec 2025 21:14:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 22:14:07 +0100
Message-ID: <20251209211407.1011552-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765314848;
 bh=gxLRUa+d/UhU5nuODLncRNuT7nFEA/r9l/xrMKk9IA0=;
 h=From:To:Cc:Subject:Date:From;
 b=H1NfA2SxJgjAFbnpWjWYQCA7Q/atcHhm9nQ7i6YqDqrQ9D1FKB2llcLryvrvi3W+K
 cg4RG6b9KPnCGj3G/XPI/E0y+l+AtPutVELE6dTgR/sSviJeCPRYN0cVErtsR270zT
 Gukdj2Atx17/nNlYF8ngSsfun5vR3VnN8KwlEd29BnVZsyxpELNrBefSjXfF4HgyIn
 NFlem3wTPpOoMHzIaaglzurdxcanR1cQYCRe0FthQT0Hh8er/6N4cZRAE87BA/u2oH
 mJBHWTh7ZND59jVWNTakrNYVn+lUvXt7P3L1ZNECSRodGuHvEU9LnoqBXUoOYsDLtH
 7O69+ZOSHNWCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=H1NfA2Sx
Subject: [Buildroot] [PATCH/next v2 1/1] package/libubox: bump version
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump includes patches which add cmake4 compatibility.

json-c is now a mandatory dependency due to upstream commit:
https://git.openwrt.org/?p=project/libubox.git;a=commitdiff;h=b7acc8e6fd5e13611ad90a593e98f9589af4009a

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: json-c is now a mandatory dependency (Julien)

 package/libubox/Config.in     | 3 +++
 package/libubox/libubox.hash  | 2 +-
 package/libubox/libubox.mk    | 4 ++--
 package/libuci/Config.in      | 2 ++
 package/ubus/Config.in        | 2 +-
 package/uhttpd/Config.in      | 2 +-
 package/uqmi/Config.in        | 2 +-
 package/ustream-ssl/Config.in | 4 +++-
 8 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/libubox/Config.in b/package/libubox/Config.in
index 1f0b691e13..09d6336706 100644
--- a/package/libubox/Config.in
+++ b/package/libubox/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBUBOX
 	bool "libubox"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_JSON_C
 	help
 	  This library originates from the OpenWrt project to
 	  handle the configuration file infrastructure, but can
@@ -11,3 +13,4 @@ config BR2_PACKAGE_LIBUBOX
 
 comment "libubox needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
index eb37d33230..127abf432c 100644
--- a/package/libubox/libubox.hash
+++ b/package/libubox/libubox.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  df6e1350fd11016ef30242a279cec195d91e6748c11c40e0991593718c46fa52  libubox-3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a-git4.tar.gz
+sha256  c4432d4f902bd0a2974d3fe76620bbb5e04b9d52e55701829aa12507651bc4d9  libubox-ecddb31dc34d89be5c9dc4595a4c58070eb090e4-git4.tar.gz
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 00ae2b0595..8710720287 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = 3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a
+LIBUBOX_VERSION = ecddb31dc34d89be5c9dc4595a4c58070eb090e4
 LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
 LIBUBOX_SITE_METHOD = git
 LIBUBOX_LICENSE = ISC, BSD-3-Clause
 LIBUBOX_INSTALL_STAGING = YES
-LIBUBOX_DEPENDENCIES = $(if $(BR2_PACKAGE_JSON_C),json-c)
+LIBUBOX_DEPENDENCIES = json-c
 
 ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
 LIBUBOX_DEPENDENCIES += lua
diff --git a/package/libuci/Config.in b/package/libuci/Config.in
index f94d7dc391..25c248751c 100644
--- a/package/libuci/Config.in
+++ b/package/libuci/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBUCI
 	bool "libuci"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libubox -> json-c
 	select BR2_PACKAGE_LIBUBOX
 	help
 	  This library originates from the OpenWrt project to
@@ -14,3 +15,4 @@ config BR2_PACKAGE_LIBUCI
 
 comment "libuci needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/ubus/Config.in b/package/ubus/Config.in
index 391893e808..21b20abaf3 100644
--- a/package/ubus/Config.in
+++ b/package/ubus/Config.in
@@ -4,7 +4,7 @@ comment "ubus needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_UBUS
 	bool "ubus"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libubox -> json-c
 	depends on !BR2_STATIC_LIBS # libubox
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_JSON_C
diff --git a/package/uhttpd/Config.in b/package/uhttpd/Config.in
index eeb169a96d..30101f983d 100644
--- a/package/uhttpd/Config.in
+++ b/package/uhttpd/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_UHTTPD
 	bool "uhttpd"
 	depends on !BR2_STATIC_LIBS # dlopen()
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libubox -> json-c
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_JSON_C
diff --git a/package/uqmi/Config.in b/package/uqmi/Config.in
index 21f0bd9077..5029a06800 100644
--- a/package/uqmi/Config.in
+++ b/package/uqmi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_UQMI
 	bool "uqmi"
-	depends on !BR2_STATIC_LIBS # libubox
+	depends on !BR2_STATIC_LIBS # libubox, libubox -> json-c
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBUBOX
diff --git a/package/ustream-ssl/Config.in b/package/ustream-ssl/Config.in
index 540e43689f..c328a6ea12 100644
--- a/package/ustream-ssl/Config.in
+++ b/package/ustream-ssl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_USTREAM_SSL
 	bool "ustream-ssl"
-	depends on !BR2_STATIC_LIBS #libubox
+	depends on !BR2_STATIC_LIBS # libubox
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libubox -> json-c
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
 	help
@@ -10,3 +11,4 @@ config BR2_PACKAGE_USTREAM_SSL
 
 comment "ustream-ssl needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
