Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5375BCEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 18:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1FE782349;
	Mon, 17 Nov 2025 18:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBT6JsRV61re; Mon, 17 Nov 2025 18:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E96C81CE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E96C81CE7;
	Mon, 17 Nov 2025 18:59:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C2C5D5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 18:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D6C160E89
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 18:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bskSjC_cK67W for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 18:59:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1876F60C17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1876F60C17
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1876F60C17
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 18:59:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ABDCCA4C6DE0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:58:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vL4Qw-000000006Zh-1JkD
 for buildroot@buildroot.org; Mon, 17 Nov 2025 18:58:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 19:58:36 +0100
Message-ID: <20251117185838.4083475-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763405918;
 bh=pbcRkGNbnr0LK6TvQBKJEfJ63MYxap0JOPDMcZOphS8=;
 h=From:To:Subject:Date:From;
 b=nbYjyTel4jTRe9L7BzEgC58fjHzC6QeiTcUSsKPkvaFefRm9/NOba8fDeeAS7FCzk
 2aPDRHYa3J2R0O0kbUBYxXQWqsN9MwoEva/CTG+1yXYYzog1nrp2y+f/SzEBkmFxkV
 3AN/UxzvFJKYTgoIS8xabxS/Zxif59HrRdP9iiWUK7VbnvC9qDJ0cz2/n2ig0n/izY
 E4Qd2N7BX9QCh0WQWSSwWe0PpbjjReNp0WPRg1wajRfr3Q3S+xasPdQO8A5oSEggJp
 +IFCeOQmlcdjzaNPHG1ErkQ0yW5kME0V9wdxGeQr8OVao5Uig2pjoFNJcNlf8P2tQw
 23rdkoTzD214w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=nbYjyTel
Subject: [Buildroot] [PATCH 1/3] package/libfreeglut: bump version to 3.8.0
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

Changelog: https://github.com/freeglut/freeglut/blob/v3.8.0/ChangeLog

Removed all patches, they are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...formDestroyContext-prototype-for-C23.patch | 31 -------------------
 ...e-are-aware-there-are-newer-versions.patch | 26 ----------------
 package/libfreeglut/libfreeglut.hash          |  2 +-
 package/libfreeglut/libfreeglut.mk            |  2 +-
 4 files changed, 2 insertions(+), 59 deletions(-)
 delete mode 100644 package/libfreeglut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch
 delete mode 100644 package/libfreeglut/0002-Let-cmake-know-we-are-aware-there-are-newer-versions.patch

diff --git a/package/libfreeglut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch b/package/libfreeglut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch
deleted file mode 100644
index c3aadb87de..0000000000
--- a/package/libfreeglut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6d0178a1c43f94b046e4d5f3dfa7185a398706ae Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Sun, 17 Nov 2024 01:14:26 +0000
-Subject: [PATCH] egl: fix fgPlatformDestroyContext prototype for C23
-
-C23 removes unprototyped functions, so this conflicted with the definition
-in fg_init_x11.c.
-
-Bug: https://github.com/freeglut/freeglut/issues/186
-
-Upstream: 800772e993a3ceffa01ccf3fca449d3279cde338
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/egl/fg_init_egl.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/egl/fg_init_egl.h b/src/egl/fg_init_egl.h
-index 592c5221..8753dc0b 100644
---- a/src/egl/fg_init_egl.h
-+++ b/src/egl/fg_init_egl.h
-@@ -28,6 +28,6 @@
- 
- extern void fghPlatformInitializeEGL();
- extern void fghPlatformCloseDisplayEGL();
--extern void fgPlatformDestroyContext();
-+extern void fgPlatformDestroyContext ( SFG_PlatformDisplay pDisplay, SFG_WindowContextType MContext );
- 
- #endif
--- 
-2.50.1
-
diff --git a/package/libfreeglut/0002-Let-cmake-know-we-are-aware-there-are-newer-versions.patch b/package/libfreeglut/0002-Let-cmake-know-we-are-aware-there-are-newer-versions.patch
deleted file mode 100644
index 45f2fcf541..0000000000
--- a/package/libfreeglut/0002-Let-cmake-know-we-are-aware-there-are-newer-versions.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 2294389397912c9a6505a88221abb7dca0a4fb79 Mon Sep 17 00:00:00 2001
-From: John Tsiombikas <nuclear@member.fsf.org>
-Date: Thu, 20 Mar 2025 09:28:29 +0200
-Subject: [PATCH] Let cmake know we are aware there are newer versions and we
- don't care
-
-Closes issue #207
-
-Upstream: https://github.com/freeglut/freeglut/commit/2294389397912c9a6505a88221abb7dca0a4fb79
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd: rebased for version 3.6.0]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 791771e7..e5903ef4 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--CMAKE_MINIMUM_REQUIRED(VERSION 3.1 FATAL_ERROR)
-+CMAKE_MINIMUM_REQUIRED(VERSION 3.1...3.5 FATAL_ERROR)
- PROJECT(freeglut LANGUAGES C)
- 
- if (POLICY CMP0072)
diff --git a/package/libfreeglut/libfreeglut.hash b/package/libfreeglut/libfreeglut.hash
index 233fa55457..1697fb1bdc 100644
--- a/package/libfreeglut/libfreeglut.hash
+++ b/package/libfreeglut/libfreeglut.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9c3d4d6516fbfa0280edc93c77698fb7303e443c1aaaf37d269e3288a6c3ea52  freeglut-3.6.0.tar.gz
+sha256  674dcaff25010e09e450aec458b8870d9e98c46f99538db457ab659b321d9989  freeglut-3.8.0.tar.gz
 sha256  b6593d5ec4c113a274abb85b10e8615895cb0ddb89f7912af5fe5aa8df38a275  COPYING
diff --git a/package/libfreeglut/libfreeglut.mk b/package/libfreeglut/libfreeglut.mk
index bcca8b4abe..cf8af6f0f8 100644
--- a/package/libfreeglut/libfreeglut.mk
+++ b/package/libfreeglut/libfreeglut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFREEGLUT_VERSION = 3.6.0
+LIBFREEGLUT_VERSION = 3.8.0
 LIBFREEGLUT_SOURCE = freeglut-$(LIBFREEGLUT_VERSION).tar.gz
 LIBFREEGLUT_SITE = https://github.com/FreeGLUTProject/freeglut/releases/download/v$(LIBFREEGLUT_VERSION)
 LIBFREEGLUT_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
