Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88E2D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 18:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7136D6065F;
	Sun,  7 Dec 2025 18:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fi01h-gVtW2F; Sun,  7 Dec 2025 18:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9030A60684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765132432;
	bh=orITBuuBIAx1Whesz/xBDRLUbm88RGODyiMz8CO1uA0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WQzaJfL+wNOEB0mGKR1OEyL0bc0XoS2FLWr8bHt3/jG84iX8zlboVGJXLCn9Yr+MI
	 sVm67/9fRen9eSP99rVPnRiVq+7nRs52VxCL6IhhcXTHPztP2F00ZgBJYi/RzjhSSA
	 1KjHp3Qr3/pktTu/KZuxTFm7Q7BtiuKPJ5IybAGPn3+6Q5GZsDZKdFnbn7bSWdzfyG
	 MUdwyu/FYXLXnxk5WEkBGNa5wWdV/FB1EVenBbSBM2XLjP1IAJtUazDvBFWkKdYxJA
	 Za7qYlO6o+5jg1R8wNr49lZLUT/y2WB3eWZbW8UjCpzrFYIp3v4jB33eCRHxk2i4g3
	 ZtJ22kfrWPDIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9030A60684;
	Sun,  7 Dec 2025 18:33:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5B57151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ECD460684
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8Gz9E8EhWcc for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 18:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BBA5E6065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBA5E6065F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBA5E6065F
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:33:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1A9EA4C00C6
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 19:33:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46164)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSJZr-000000002bf-0uSU
 for buildroot@buildroot.org; Sun, 07 Dec 2025 18:33:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 19:33:47 +0100
Message-ID: <20251207183347.346971-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765132427;
 bh=bKRTo2Wp3aXkUWcrUXY7EuBHm5XnGxFoCPHVNv4xodI=;
 h=From:To:Subject:Date:From;
 b=irn2TgDBORg5lh0Luq5ZSEgM9UFvA05qapy2UTbPLCiafjvJSkB4XjUpLULWNL06h
 XMQrr7XtIcwGoNI87JL3ffuHMSZS8avH9qS+wpq0p8ent72VNN4Gr3WFkUnULLgGT/
 QikiLIIg7kHnotV/fJj21Qh73YBNmgDaeE696SDUFxfSrtQ8nFfZYkk2QmbsCz96wa
 a0Zjldmsw6FODLdYidCIamCYZ4vY06SNN9vkuPQ0kJd+gsHtH0sA0ViBW+EbPdYusa
 nVlMVebQY+/Z1wX2uqJC3BrEl0bg+JMtGWU9UV6Ly0rmbNj+f+8jwyuOh0z9m+++m+
 0o9s1OXPiXaUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=irn2TgDB
Subject: [Buildroot] [PATCH v2 1/1] package/kbd: fix zlib build,
 add optional dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 930660890bf8b40d9bd55cd9e202e574b53d5d49 bumped kbd to
version 2.9.0 which includes optional support for various compression
libraries. This commit adds the corresponding configure options and a
fix for build errors caused by zlib.

Fixes:
https://autobuild.buildroot.net/results/8ff/8ff6c3d940b68069f748f12646f7516ec86172c1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: updated patch after upstream feedback

 .../kbd/0001-libkbdfile-fix-zlib-build.patch  | 35 +++++++++++++++++++
 package/kbd/kbd.mk                            | 29 +++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 package/kbd/0001-libkbdfile-fix-zlib-build.patch

diff --git a/package/kbd/0001-libkbdfile-fix-zlib-build.patch b/package/kbd/0001-libkbdfile-fix-zlib-build.patch
new file mode 100644
index 0000000000..5e15c2f047
--- /dev/null
+++ b/package/kbd/0001-libkbdfile-fix-zlib-build.patch
@@ -0,0 +1,35 @@
+From 488872421ef38215d2797f78497eb559d8eec32a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@users.noreply.github.com>
+Date: Fri, 5 Dec 2025 16:45:36 +0100
+Subject: [PATCH] libkbdfile: fix zlib build
+
+Upstream: https://github.com/legionus/kbd/pull/150#issuecomment-3616333154
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libkbdfile/elf-note.h | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/libkbdfile/elf-note.h b/src/libkbdfile/elf-note.h
+index a0fd9e2..d3b8d5c 100644
+--- a/src/libkbdfile/elf-note.h
++++ b/src/libkbdfile/elf-note.h
+@@ -26,14 +26,11 @@ int dlsym_many(void **dlp, const char *filename, ...);
+  */
+ #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__),
+ 
+-/* For symbols being dynamically loaded */
+-#define DECLARE_DLSYM(symbol) static typeof(symbol) *sym_##symbol
+-
+ /*
+  * Helper defines, to be done locally before including this header to switch between
+  * implementations
+  */
+-#define DECLARE_SYM(sym__) DECLARE_DLSYM(sym__);
++#define DECLARE_SYM(sym__) static typeof(sym__) *sym_##sym__;
+ 
+ /*
+  * Originally from systemd codebase.
+-- 
+2.47.3
+
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 8008a9b3be..34401075ce 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -13,6 +13,35 @@ KBD_CONF_OPTS = \
 KBD_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+KBD_CONF_OPTS += --with-bzip2
+KBD_DEPENDENCIES += bzip2
+else
+KBD_CONF_OPTS += --without-bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+KBD_CONF_OPTS += --with-lzma
+KBD_DEPENDENCIES += xz
+else
+KBD_CONF_OPTS += --without-lzma
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+KBD_CONF_OPTS += --with-zlib
+KBD_DEPENDENCIES += zlib
+else
+KBD_CONF_OPTS += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+KBD_CONF_OPTS += --with-zstd
+KBD_DEPENDENCIES += zstd
+else
+KBD_CONF_OPTS += --without-zstd
+endif
+
 KBD_LICENSE = GPL-2.0+
 KBD_LICENSE_FILES = COPYING CREDITS
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
