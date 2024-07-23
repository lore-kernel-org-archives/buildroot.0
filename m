Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C88C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 13:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3908540386;
	Tue, 23 Jul 2024 13:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1tHAQkwlTsB; Tue, 23 Jul 2024 13:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDEEA40AE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDEEA40AE5;
	Tue, 23 Jul 2024 13:30:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EFAB1BF2F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AF44812D4
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lgOknHLuwfm for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 13:30:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0BB9A812D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BB9A812D3
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BB9A812D3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:30:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4279c924ca7so40315015e9.2
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 06:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721741406; x=1722346206;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bC80E9yl0Ym7fhiXS8R8FY/Ju8Wubdw/Q/baQP36dW4=;
 b=UaLp1jYZs5NOjgt5RHbaBw9HnVR7GOC7EMFGWP8f7a38hXLOkqnJ7rwuuMn2jnYx7w
 UxSBjOa44Ulpr1enrKqp3tKqZXQfsTtBCG8JL3AdYcyf78QLjOzQ0jvR76iVhdwHKAnh
 nl749xmB64kdWBobYAC5xkGDJLA+rCiOZU0TGlTgFk2DATRVSNqcSJ0bofF0pi2mMdaQ
 amCJOoNPx/JlUBQ59A31ersghGz+nrUSog2y7j/6kcK+q2zWwdJPhJOttGPWokCBtKhR
 ANmvMVG0xK/dfDq/Cpx+QtyO/WnnCGnFRi5qGgvHtjUjbK4x7kYYUnP+txcFzSsoFdT1
 3TXA==
X-Gm-Message-State: AOJu0Yy5fCJDgjvUozYkeTRRiBgz0hQNXcbHMpEcFQRndFZ3c+fcvy37
 owNM/wtNKG1vn8s/cVxML9eo6Srp0OmZs8bSmDie0hmgITdUq5+YTU2QCQ==
X-Google-Smtp-Source: AGHT+IHkgQxP/BQYoo//NMy/mWrmz4rEB5Of9vWq4YploBqSxZMDY77l0U9Ru5wdEdeeUqJqmx8vow==
X-Received: by 2002:a05:600c:500f:b0:426:6326:4cec with SMTP id
 5b1f17b1804b1-427df7a7828mr65979805e9.29.1721741405772; 
 Tue, 23 Jul 2024 06:30:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878684757sm11637562f8f.10.2024.07.23.06.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 06:30:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 15:30:04 +0200
Message-ID: <20240723133004.652232-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721741406; x=1722346206; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bC80E9yl0Ym7fhiXS8R8FY/Ju8Wubdw/Q/baQP36dW4=;
 b=UrSZbC9HetP+mssLmoEAHSTJuggCIpkkDUwhBAwiOaglLtOuI8SIZKt+S+Ra9on9hl
 oKmNzoB2qi8MIsHfX1erYIqRLdzJWPkWFu51u57Q35n29Lup6Mmbtync+t+WtKTb0dRa
 x4cFBv3ngS5VSeVoIywc6WAIdI8rIae/R+KY1RUbECSV/NHrWyPTJ3BKRXak8MV3+7bO
 tsWjj5+5NI3ZUBWC4Eb1Au0HeesjLRP9wa+tY9bRFhF3vHBXiLdsvHeEyRZ1BWp+Dkni
 hpCa23As/+G3iG960IVvdYYjU7qLAAG7Z1rOH/jMj15AOTn0T095ndp9yesiw4aiGfQT
 oGbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UrSZbC9H
Subject: [Buildroot] [PATCH 1/1] package/rtty: bump to version 8.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- This bump will fix the following build failure with musl >= 1.2.5
  thanks to
  https://github.com/zhaojh329/rtty/commit/eb6394c3d83a21a8825e47b40659cfe0ead33b6f:

  /home/autobuild/autobuild/instance-22/output-1/build/rtty-8.1.0/src/file.c: In function 'start_upload_file':
  /home/autobuild/autobuild/instance-22/output-1/build/rtty-8.1.0/src/file.c:156:24: error: implicit declaration of function 'basename' [-Werror=implicit-function-declaration]
    156 |     const char *name = basename(path);
        |                        ^~~~~~~~

https://github.com/zhaojh329/rtty/releases/tag/v8.1.2
https://github.com/zhaojh329/rtty/releases/tag/v8.1.1

Fixes:
 - http://autobuild.buildroot.org/results/382405b421a8ea7b5b3beb553f47fa20427fa3c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...keLists.txt-prefer-pkg_check_modules.patch | 40 -------------------
 package/rtty/rtty.hash                        |  2 +-
 package/rtty/rtty.mk                          |  2 +-
 4 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index baa4d20d73..6fd873a3c8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1211,7 +1211,6 @@ package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.p
 package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch lib_patch.Upstream
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch lib_patch.Upstream
 package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch lib_patch.Upstream
-package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch lib_patch.Upstream
 package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
 package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch b/package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch
deleted file mode 100644
index 3714050445..0000000000
--- a/package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 565c003ac412c9b0fa39d208d4a911f4300477c3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 26 Feb 2023 20:39:11 +0100
-Subject: [PATCH] CMakeLists.txt: prefer pkg_check_modules
-
-Prefer pkg_check_modules over find_package to avoid the following static
-build failure with openssl and -latomic:
-
-/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-8/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_cert.o): in function `ssl_cert_free':
-ssl_cert.c:(.text+0x53c): undefined reference to `__atomic_fetch_sub_4'
-
-Fixes:
- - http://autobuild.buildroot.org/results/f606bb15bf4f88ba29ef0795413e13acc9cd0976
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/zhaojh329/ssl/pull/4]
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/ssl/CMakeLists.txt b/src/ssl/CMakeLists.txt
-index 4868bf7..36488c7 100644
---- a/src/ssl/CMakeLists.txt
-+++ b/src/ssl/CMakeLists.txt
-@@ -14,10 +14,10 @@ endif()
- 
- find_package(PkgConfig QUIET)
- 
--find_package(OpenSSL)
-+pkg_check_modules(OPENSSL openssl)
- 
- if (NOT OPENSSL_FOUND)
--    pkg_check_modules(OPENSSL openssl)
-+    find_package(OpenSSL)
- endif()
- 
- find_package(WolfSSL)
--- 
-2.39.1
-
diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index a6ccb5c2e6..004314eea1 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  e634939bae62bf3d52ceebae5df00179629d214634b93464eeb2294406512b30  rtty-8.1.0.tar.gz
+sha256  522b0fc5e032c3b84ac707abce8ac4ff5609900011f8f300ce4f4246abac0acc  rtty-8.1.2.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index b2fac14432..618971c9a3 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTTY_VERSION = 8.1.0
+RTTY_VERSION = 8.1.2
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
