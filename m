Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B90C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 07:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1612260DCB;
	Mon, 16 Sep 2024 07:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEx6pf2rgp4o; Mon, 16 Sep 2024 07:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D79E06088B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D79E06088B;
	Mon, 16 Sep 2024 07:14:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95C011BF2B5
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 07:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90DAC40109
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 07:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WANQVKeS2q3 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 07:14:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD92B40105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD92B40105
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD92B40105
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 07:14:55 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sq5wf-00ELTs-8H; Mon, 16 Sep 2024 09:14:49 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id e7e09687;
 Mon, 16 Sep 2024 07:14:47 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 10:14:46 +0300
Message-ID: <20240916071447.801674-1-aperez@igalia.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dp3nWOVivzpw5U0aXIUHU7OeIEBCZ9KjnzO23v2Okhw=; b=gosB5rUZNnEZ3XkbW+Z2pf6Gqx
 AqyPjUpjkk07AGfcxFrcK0e+npM2SrkmsCpazC/0i24RQ3Cb9JahgiIZOxznKEZc/MQfLpJ8Rad5N
 z+xVZzCTRNirNW241vM6H9b5MjYpovWYYq0HAxBzxuvijSR0gIk3CTdU0SqrzqHSHjYwjnKzZT0Xe
 8z943U5NPbn8pJOdXFzHsxIddPqHW4xXZTQoGEZyGXTO8IM/p7pOpvXSBzSv+RreGrdcNNl+MDRte
 N756agNu7K7Iy+eAPJbLUZw0F4I/FUqiunXQIKoVY/e+oJj/vjRaHmEd6aYFFFjWT0WxrnyqvZ3wT
 ru7ltatQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=gosB5rUZ
Subject: [Buildroot] [PATCH] package/wpebackend-fdo: bump version to 1.14.3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bugfix release which plugs a couple of small leaks, and
includes patch "0001-Cast-to-EGLNativeWindowType-explicitly.patch",
which can now be removed. Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.14.3.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...st-to-EGLNativeWindowType-explicitly.patch | 36 -------------------
 package/wpebackend-fdo/wpebackend-fdo.hash    |  7 ++--
 package/wpebackend-fdo/wpebackend-fdo.mk      |  2 +-
 3 files changed, 5 insertions(+), 40 deletions(-)
 delete mode 100644 package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch

diff --git a/package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch b/package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch
deleted file mode 100644
index eae0d22e30..0000000000
--- a/package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From e56a2597eb66c2221b004aa3356b06c1b071b5b5 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Wed, 14 Aug 2024 00:51:26 +0300
-Subject: [PATCH] Cast to EGLNativeWindowType explicitly
-
-In order to avoid off build failures due to mismatching (but
-compatible) declarations of wl_egl_window and EGLNativeWindowType,
-add an explicit cast to EGLNativeWindowType inside the
-TargetWayland::nativeWindow() function.
-
-Solves the following build issue found by the Buildroot autobuilders:
-
-  http://autobuild.buildroot.net/results/92c5cc3134e92c263a0cbb4c05ef8956569e434b/
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-Upstream: https://github.com/Igalia/WPEBackend-fdo/commit/e56a2597eb66c2221b004aa3356b06c1b071b5b5
----
- src/egl-client-wayland.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/egl-client-wayland.cpp b/src/egl-client-wayland.cpp
-index 10e02f0..22bb212 100644
---- a/src/egl-client-wayland.cpp
-+++ b/src/egl-client-wayland.cpp
-@@ -63,7 +63,7 @@ TargetWayland::~TargetWayland()
- 
- EGLNativeWindowType TargetWayland::nativeWindow() const
- {
--    return m_egl.window;
-+    return (EGLNativeWindowType) m_egl.window;
- }
- 
- void TargetWayland::resize(uint32_t width, uint32_t height)
--- 
-2.46.0
-
diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 26ba121727..5055998ab7 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,6 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.2.tar.xz.sums
-sha1  f453f8d77e93f4ac6ac81c1874d4d6bdcb45c253  wpebackend-fdo-1.14.2.tar.xz
-sha256  93c9766ae9864eeaeaee2b0a74f22cbca08df42c1a1bdb55b086f2528e380d38  wpebackend-fdo-1.14.2.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.3.tar.xz.sums
+md5  ab73398b1e35495977e50bee103969d2  wpebackend-fdo-1.14.3.tar.xz
+sha1  2d2945df15cc1efa957657fa727f3bc4c6f580bb  wpebackend-fdo-1.14.3.tar.xz
+sha256  10121842595a850291db3e82f3db0b9984df079022d386ce42c2b8508159dc6c  wpebackend-fdo-1.14.3.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 7ef347b622..dbabacf498 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.14.2
+WPEBACKEND_FDO_VERSION = 1.14.3
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
