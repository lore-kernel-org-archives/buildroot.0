Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE37D58B2B
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 13:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CD1940D32;
	Sun, 15 Mar 2026 13:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4-jPuy7i0kN; Sun, 15 Mar 2026 13:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FEDE40E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773580300;
	bh=flhtfhomOPAQ/nwDPSFt9LcMli63Yr1e/TzlVYMUWfI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mjOYbSh+ha28rtyogn1EtcbfZbbgn1ajye+jWUVUQ7HP1Z5nOEFwYD29sltBRQgI/
	 irJaVy+0rD9i/vobxZ6tn87VQtIgvnHnn+PkJzbE/0o1bHNKZ5LNhafepTKbWSsZFy
	 6gf7n1HWkNntM8zy9exZGwSLJ3K7j5D7TSA7C3DPIDBRpNUxpdaraAzRhmNquDGc4r
	 x12tiJqnV75Rttuyha51wtmmt+HpxptSnjffu0YYwlsfakA86sWN98r77phqQniEhz
	 HuAxog51pQqVKFGgo38c4vU7/o+QT0c7VZFZpgscBE4KCHI0XKG/VwRzPySrwd7ajE
	 LiM3rdTChDegQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FEDE40E68;
	Sun, 15 Mar 2026 13:11:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D4311B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F1BE40E68
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BYcnuiysMgx for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 13:11:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CB6E40D32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB6E40D32
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CB6E40D32
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:11:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5fc.dip0.t-ipconnect.de [84.161.181.252])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 86A33A4C2093
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 14:11:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47170)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1lFL-000000006LA-1T2n
 for buildroot@buildroot.org; Sun, 15 Mar 2026 13:11:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 14:11:06 +0100
Message-ID: <20260315131107.3959487-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315131107.3959487-1-bernd@kuhls.net>
References: <20260315131107.3959487-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773580268;
 bh=+FoKtnhnmKq+FevGb6LKzt8BxwPT31A1MuXKJQrjNTo=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ZKKXPy10FaaBKY/koErtyV9RLx7XHVFUsj4j8gnsnu5CgF3x6YpvwJgMPBZZF+ps7
 3HSHSh6Z/UpE/T7pr990b26Wu5JY5/GeEarAPGr1RgebKw/9zF9ie6N87SQ6dKiw+x
 j+u6jNy2Cz62lSYPOFB/bnmATUaxcm+rd1deRmKw+J9y+Eh75NCP1cPWYtxWmrxIEw
 cfygxHkMcl2PQEw7e7a9vBj09QDwdSKmFegE3kp1XgJf2zVlxkpSN/3glgBkmLvsPk
 7DLIzBuubiJzT+FT6VSnbSxGQEkLen15lmtg7rpeWtYK7HogukgPAsf6EvTokYAXZq
 M7Cz0KrImS/pQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ZKKXPy10
Subject: [Buildroot] [PATCH 2/3] package/kodi: allow build with giflib 6.x
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

These patches fix build errors which would be introduced by the upcoming
bump of giflib to 6.1.2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...rePacker-allow-build-with-giflib-6.x.patch | 71 +++++++++++++++++++
 ...rePacker-allow-build-with-giflib-6.x.patch | 71 +++++++++++++++++++
 2 files changed, 142 insertions(+)
 create mode 100644 package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
 create mode 100644 package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch

diff --git a/package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch b/package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
new file mode 100644
index 0000000000..5a23237375
--- /dev/null
+++ b/package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
@@ -0,0 +1,71 @@
+From 29492cbd20d4c90a9c00a30ab525d4d0e81a968b Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sun, 15 Mar 2026 11:38:16 +0000
+Subject: [PATCH] TexturePacker: allow build with giflib 6.x
+
+Current #if clauses are written with a maximum of giflib 5 written in,
+update the to >= to allow for newer versiosn of the giflib api.
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+
+Upstream: https://github.com/xbmc/xbmc/pull/28016
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../native/TexturePacker/src/decoder/GifHelper.cpp        | 8 ++++----
+ .../depends/native/TexturePacker/src/decoder/GifHelper.h  | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
+index eb513134b3eb8..b216ecbcef7fa 100644
+--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
+@@ -52,7 +52,7 @@ GifHelper::~GifHelper()
+ bool GifHelper::Open(GifFileType*& gif, void *dataPtr, InputFunc readFunc)
+ {
+   int err = 0;
+-#if GIFLIB_MAJOR == 5
++#if GIFLIB_MAJOR >= 5
+   gif = DGifOpen(dataPtr, readFunc, &err);
+ #else
+   gif = DGifOpen(dataPtr, readFunc);
+@@ -73,7 +73,7 @@ void GifHelper::Close(GifFileType* gif)
+ {
+   int err = 0;
+   int reason = 0;
+-#if GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1
++#if (GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1) || GIFLIB_MAJOR >= 6
+   err = DGifCloseFile(gif, &reason);
+ #else
+   err = DGifCloseFile(gif);
+@@ -181,7 +181,7 @@ bool GifHelper::Slurp(GifFileType* gif)
+   if (DGifSlurp(gif) == GIF_ERROR)
+   {
+     int reason = 0;
+-#if GIFLIB_MAJOR == 5
++#if GIFLIB_MAJOR >= 5
+     reason = gif->Error;
+ #else
+     reason = GifLastError();
+@@ -246,7 +246,7 @@ bool GifHelper::GcbToFrame(GifFrame &frame, unsigned int imgIdx)
+ 
+   if (m_gif->ImageCount > 0)
+   {
+-#if GIFLIB_MAJOR == 5
++#if GIFLIB_MAJOR >= 5
+     GraphicsControlBlock gcb;
+     if (DGifSavedExtensionToGCB(m_gif, imgIdx, &gcb))
+     {
+diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
+index 6124b69e46296..ce5dca3394b41 100644
+--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
+@@ -128,7 +128,7 @@ class GifHelper
+   bool PrepareTemplate(GifFrame &frame);
+   void Release();
+ 
+-#if GIFLIB_MAJOR != 5
++#if GIFLIB_MAJOR < 5
+   /*
+   taken from giflib 5.1.0
+   */
diff --git a/package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch b/package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch
new file mode 100644
index 0000000000..5a23237375
--- /dev/null
+++ b/package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch
@@ -0,0 +1,71 @@
+From 29492cbd20d4c90a9c00a30ab525d4d0e81a968b Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sun, 15 Mar 2026 11:38:16 +0000
+Subject: [PATCH] TexturePacker: allow build with giflib 6.x
+
+Current #if clauses are written with a maximum of giflib 5 written in,
+update the to >= to allow for newer versiosn of the giflib api.
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+
+Upstream: https://github.com/xbmc/xbmc/pull/28016
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../native/TexturePacker/src/decoder/GifHelper.cpp        | 8 ++++----
+ .../depends/native/TexturePacker/src/decoder/GifHelper.h  | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
+index eb513134b3eb8..b216ecbcef7fa 100644
+--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
+@@ -52,7 +52,7 @@ GifHelper::~GifHelper()
+ bool GifHelper::Open(GifFileType*& gif, void *dataPtr, InputFunc readFunc)
+ {
+   int err = 0;
+-#if GIFLIB_MAJOR == 5
++#if GIFLIB_MAJOR >= 5
+   gif = DGifOpen(dataPtr, readFunc, &err);
+ #else
+   gif = DGifOpen(dataPtr, readFunc);
+@@ -73,7 +73,7 @@ void GifHelper::Close(GifFileType* gif)
+ {
+   int err = 0;
+   int reason = 0;
+-#if GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1
++#if (GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1) || GIFLIB_MAJOR >= 6
+   err = DGifCloseFile(gif, &reason);
+ #else
+   err = DGifCloseFile(gif);
+@@ -181,7 +181,7 @@ bool GifHelper::Slurp(GifFileType* gif)
+   if (DGifSlurp(gif) == GIF_ERROR)
+   {
+     int reason = 0;
+-#if GIFLIB_MAJOR == 5
++#if GIFLIB_MAJOR >= 5
+     reason = gif->Error;
+ #else
+     reason = GifLastError();
+@@ -246,7 +246,7 @@ bool GifHelper::GcbToFrame(GifFrame &frame, unsigned int imgIdx)
+ 
+   if (m_gif->ImageCount > 0)
+   {
+-#if GIFLIB_MAJOR == 5
++#if GIFLIB_MAJOR >= 5
+     GraphicsControlBlock gcb;
+     if (DGifSavedExtensionToGCB(m_gif, imgIdx, &gcb))
+     {
+diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
+index 6124b69e46296..ce5dca3394b41 100644
+--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
+@@ -128,7 +128,7 @@ class GifHelper
+   bool PrepareTemplate(GifFrame &frame);
+   void Release();
+ 
+-#if GIFLIB_MAJOR != 5
++#if GIFLIB_MAJOR < 5
+   /*
+   taken from giflib 5.1.0
+   */
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
