Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F00FE9A04B
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 19:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D777960774;
	Wed, 18 Feb 2026 19:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahHeShY9UwFS; Wed, 18 Feb 2026 19:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCCD660AB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771444713;
	bh=ge7yiI93ZmZcAKJsvQW/GkPzEIPtmYTZ0kfOSZlEaY4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Byp/IQ5g46AI4w/32O/HD1lM8JMa/0+VTMT1AaCKVJ6y74yzOqkmeYj0Zf86Tol8o
	 GKQvDmIyOfnOyrdzCQ2mkwxChFXt1PCXcQQVVIxlpUGoHM74/X2yLOKGC+Eyvnp1Dv
	 geaw1GT1cCN6iWiYwk4zE8tfmkTC+O6NSLZ03fTWM4tyN6BeS6MQCQmRPhziBKg4Xe
	 joX+8WnHo4qycvr3KhwyCKMvcI2Q8kfS8KYdja2PIep6rc3j7fYSumedVKSaQIbaPb
	 rBkI2h9Xs/5ahYbL37AtL1ma/4r4ApS7yNZ/VZx1T2c1b+EYa6wLnd7BX/pLKoVXud
	 z/iMk9ph5iBPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCCD660AB6;
	Wed, 18 Feb 2026 19:58:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72A33183
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 640F440737
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cf3o52z_yl5p for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 19:58:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB53140899
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB53140899
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB53140899
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:58:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5ce.dip0.t-ipconnect.de [79.214.197.206])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3AD10A4C09DB;
 Wed, 18 Feb 2026 20:58:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52694)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vsnge-000000004a7-0EfO;
 Wed, 18 Feb 2026 19:58:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 18 Feb 2026 20:58:12 +0100
Message-ID: <20260218195812.2983207-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218195812.2983207-1-bernd@kuhls.net>
References: <20260218195812.2983207-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771444696;
 bh=IA6P5QoJ1PZU6wVVzyxUtQszm2DAjAHQ/1TorciPKUo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Epc+CZZzxqKrDjnsTbtyvnltBzWsYsnvFWXnkQx7rIEvDg0TRgbu03iE4b/UC1wrH
 3u3y/io5ly7XWXpoShnqELoEybNLIAGKGIyPhBz1Cx3VV3FsstFCyuX3vPZG1xjo4Z
 Mkk4/Df7qOlCr5IOW7p755VKCecZWXScP8nz5P8MrIEwoDXG/ZocMcEBy90djV183K
 1OCzH7N0jtOap9gzmH1sWlt356aQ1YmaOv1GUOWQg8eKHxe24sgokkYt2w1gWhK62n
 wkZ3GLxF5QJxatIVWnoKQnmFT7UeuiTp9h1e0DPz1Wk0iXkegyf+SgLrRUUIHK8dG3
 mTHZI0y0AyTNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Epc+CZZz
Subject: [Buildroot] [PATCH 2/2] package/wpewebkit: security bump to version
 2.50.5
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

From: Adrian Perez de Castro <aperez@igalia.com>

This updates WPE WebKit to the 2.50 stable series.
WPE WebKit 2.50 highlights and 2.50.[1-5] release notes:

- https://wpewebkit.org/release/wpewebkit-2.50.0.html
- https://wpewebkit.org/release/wpewebkit-2.50.1.html
- https://wpewebkit.org/release/wpewebkit-2.50.2.html
- https://wpewebkit.org/release/wpewebkit-2.50.3.html
- https://wpewebkit.org/release/wpewebkit-2.50.4.html
- https://wpewebkit.org/release/wpewebkit-2.50.5.html

Fixes the following security issues:

- From https://wpewebkit.org/security/WSA-2025-0007.html
  CVE-2025-43343

- From https://wpewebkit.org/security/WSA-2025-0006.html
  CVE-2025-43272, CVE-2025-43342, CVE-2025-43356, CVE-2025-43368

- From https://wpewebkit.org/security/WSA-2025-0005.html
  CVE-2025-31273, CVE-2025-31278, CVE-2025-43211, CVE-2025-43212,
  CVE-2025-43216, CVE-2025-43227, CVE-2025-43228, CVE-2025-43240,
  CVE-2025-43265, CVE-2025-6558

Removed patch 0001 which is included in this release.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Bernd: bumped to 2.50.5, removed two patches originally added by Adrian
 which were added to upstream version 2.50.2]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...d-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch | 44 -------------------
 package/wpewebkit/wpewebkit.hash              |  8 ++--
 package/wpewebkit/wpewebkit.mk                |  2 +-
 3 files changed, 5 insertions(+), 49 deletions(-)
 delete mode 100644 package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch

diff --git a/package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch b/package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch
deleted file mode 100644
index 8432543e07..0000000000
--- a/package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 94acd1ce0ff2860b19f22ab2d386d7711c9699b7 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Tue, 8 Jul 2025 21:46:44 +0300
-Subject: [PATCH] [WPE] Fix the build with USE_SKIA_OPENTYPE_SVG=ON and
- USE_SYSPROF_CAPTURE=OFF
-
-Unreviewed build fix.
-
-When backporting 287859@main the #include for the needed Skia header
-slipped inside an USE(SYSPROF_CAPTURE) guard. This moves the guards
-and #include statements to their correct places.
-
-* Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp:
-
-Canonical link: https://commits.webkit.org/290945.273@webkitglib/2.48
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-Upstream: https://github.com/WebKit/WebKit/commit/943d05f0c9b03c053a456c90c2a8817c1f679711
----
- Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp b/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp
-index a06e33fd04f8..5fb245ce0b66 100644
---- a/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp
-+++ b/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp
-@@ -43,11 +43,12 @@
- #include <skia/core/SkGraphics.h>
- #endif
- 
--#if USE(SYSPROF_CAPTURE)
--#include <wtf/SystemTracing.h>
- #if USE(SKIA_OPENTYPE_SVG)
- #include <skia/modules/svg/SkSVGOpenTypeSVGDecoder.h>
- #endif
-+
-+#if USE(SYSPROF_CAPTURE)
-+#include <wtf/SystemTracing.h>
- #endif
- 
- namespace WebKit {
--- 
-2.50.1
-
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 332fd9deaa..60a51c3e49 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.48.3.tar.xz.sums
-md5  2d3b7fa3c62886546f918fcc289cabbe  wpewebkit-2.48.3.tar.xz
-sha1  8a90b9ff8809c99c306defc1a08e50a31a09c590  wpewebkit-2.48.3.tar.xz
-sha256  807571f07e87823b8fb79564692c9b1ef81ee62edbf51345a15bd0e7e1f2e07b  wpewebkit-2.48.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.50.5.tar.xz.sums
+md5  1d81485379005cca0236a278706f194f  wpewebkit-2.50.5.tar.xz
+sha1  dd56b76eff8ba157a0291c0b61220666eed59313  wpewebkit-2.50.5.tar.xz
+sha256  de4bfd20bfc921cdfc77e839ee4da84e2674bcb58b2f916172978d62fa115fc2  wpewebkit-2.50.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 31aba2a0b9..03deb6e991 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-WPEWEBKIT_VERSION = 2.48.3
+WPEWEBKIT_VERSION = 2.50.5
 WPEWEBKIT_SITE = https://wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
