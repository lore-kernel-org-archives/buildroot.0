Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED738CFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 11:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACB8D60738;
	Sun, 30 Nov 2025 11:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5-HMSaIyXtR; Sun, 30 Nov 2025 11:24:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C67F26074D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C67F26074D;
	Sun, 30 Nov 2025 11:24:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24465219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 11:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1969F6074D
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 11:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmpdlG6zPXAp for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 11:24:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE8D160738
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE8D160738
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE8D160738
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 11:24:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b593.dip0.t-ipconnect.de [84.161.181.147])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CA999A4C73DD
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 12:24:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38332)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPfXG-000000006pv-1nyH
 for buildroot@buildroot.org; Sun, 30 Nov 2025 11:24:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Nov 2025 12:24:10 +0100
Message-ID: <20251130112410.1143522-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764501850;
 bh=wysWQsxqnitf17KbHQxnIL4GiY++Rblxc4+6yehafv8=;
 h=From:To:Subject:Date:From;
 b=dHuIQ9jomUD8g1CTagiAaHlQF8qdqVOoyaErDx/Wa0HjfiM0/BCi/cNB3v71oPDf9
 8QxDVrtLRb4A0mzDWqCE9ESKzwNxiCEUVa2U3eQUKI/sn814Ixt0USqBj1goMzUE+8
 d3jyJtwkxhGK5Mk9MTaU7rwtc6Tt9lYsko4EXJ0Vrbg8RVf5OXpJxnMX58ZaRkMbpl
 gyfLM3YAniDtA77a8dV07rFCGwBAoPtWb4acp7Oly4ugXbnk+exjMXicIbMKK+tVk2
 dYn2vEM4B/a//JV3u4It9v7t0+8OQqbD73t0rs0mGSFE+o+imd/Q3mnuE+zWetOKPk
 Wy5/rTB5CEGmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=dHuIQ9jo
Subject: [Buildroot] [PATCH 1/1] package/kbd: fix zlib build,
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
Without this patch the build error would only occur if zlib was built
before kbd, a simple "make kbd" succeeded with the defconfig used here.

 .../kbd/0001-libkbdfile-fix-zlib-build.patch  | 49 +++++++++++++++++++
 package/kbd/kbd.mk                            | 29 +++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 package/kbd/0001-libkbdfile-fix-zlib-build.patch

diff --git a/package/kbd/0001-libkbdfile-fix-zlib-build.patch b/package/kbd/0001-libkbdfile-fix-zlib-build.patch
new file mode 100644
index 0000000000..2660f80a11
--- /dev/null
+++ b/package/kbd/0001-libkbdfile-fix-zlib-build.patch
@@ -0,0 +1,49 @@
+From a2a08fdf4a4adf00a26666198483e7f2797b1a26 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 30 Nov 2025 12:09:02 +0100
+Subject: [PATCH] libkbdfile: fix zlib build
+
+Buildroot autobuilders fail to build kbd since version 2.9.0:
+https://autobuild.buildroot.net/results/8ff/8ff6c3d940b68069f748f12646f7516ec86172c1/build-end.log
+
+kbdfile-zlib.c: In function 'dlopen_note':
+elf-note.h:27:30: error: 'sym_gzopen' undeclared (first use in this function); did you mean 'sym_gzopen64'?
+   27 | #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__),
+
+kbdfile-zlib.c: In function 'kbdfile_decompressor_zlib':
+kbdfile-zlib.c:61:15: error: implicit declaration of function 'sym_gzopen'; did you mean 'sym_gzopen64'?
+ [-Wimplicit-function-declaration]
+   61 |         gzf = sym_gzopen(file->pathname, "rb");
+
+Upstream: https://github.com/legionus/kbd/pull/150
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libkbdfile/kbdfile-zlib.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libkbdfile/kbdfile-zlib.c b/src/libkbdfile/kbdfile-zlib.c
+index f495003..4b9a0de 100644
+--- a/src/libkbdfile/kbdfile-zlib.c
++++ b/src/libkbdfile/kbdfile-zlib.c
+@@ -16,7 +16,7 @@
+ 
+ #define DL_SYMBOL_TABLE(M)	\
+ 	M(gzclose)		\
+-	M(gzopen)		\
++	M(gzopen64)		\
+ 	M(gzerror)		\
+ 	M(gzread)
+ 
+@@ -58,7 +58,7 @@ FILE *kbdfile_decompressor_zlib(struct kbdfile *file)
+ 		goto cleanup;
+ 	}
+ 
+-	gzf = sym_gzopen(file->pathname, "rb");
++	gzf = sym_gzopen64(file->pathname, "rb");
+ 	if (!gzf) {
+ 		ERR(file->ctx, "zlib: unable to open archive: %s",
+ 		    kbd_strerror(errno, errbuf, sizeof(errbuf)));
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
