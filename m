Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E621C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 13:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF136408E4;
	Thu, 15 Aug 2024 13:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zNqSiQPqpqE; Thu, 15 Aug 2024 13:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 970ED407DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 970ED407DD;
	Thu, 15 Aug 2024 13:07:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6970E1BF2A2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56F7B60765
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8Xch1-k4aFv for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 13:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F38316070D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F38316070D
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F38316070D
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 13:07:24 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1seaCF-000cEQ-MB; Thu, 15 Aug 2024 15:07:19 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id baad1ea4;
 Thu, 15 Aug 2024 13:07:18 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 16:07:16 +0300
Message-ID: <20240815130718.1550384-1-aperez@igalia.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oLF7RlFBS7ZAe6NyiWfzQU0p95QFuYmm858TlpEIF8E=; b=LWjHVJNrFDHRS36qw7eaqiocLB
 0ysLtRPAJJQQ1VU52hXUCb90YlbSrJlwyvNJZolm62jM85CEcq65whPffUA8/jfWLpmi4C0vCBlvo
 iWn8+XS8HEVL2n7xGgMiPAfmgOCp9gMkvG+vBMLl6eXK6mt21kQd4Z9Bxx7CcjpOJFPa4ZBPulsus
 lDuH7gYjGaaiyagDh84Z8TAEU46GIukdJVOCK1RLAoZoaoiA9Bvk9W0+4wioh3XfctHIpniBSimHK
 vfm3BKtqEzgRLaIatyBLNXzdbESpn9gA1j8R04BWPgAp28AAder0AOElxgW6gvclqf1uZTZlHKCpJ
 s3DZKFOQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=LWjHVJNr
Subject: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: add patch with
 missing EGL cast
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

Import a patch that has been accepted upstream and fixes build failures
caused by a missing explicit cast to EGLNativeWindowType.

Fixes: http://autobuild.buildroot.net/results/92c5cc3134e92c263a0cbb4c05ef8956569e434b/
Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...st-to-EGLNativeWindowType-explicitly.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch

diff --git a/package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch b/package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch
new file mode 100644
index 0000000000..eae0d22e30
--- /dev/null
+++ b/package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch
@@ -0,0 +1,36 @@
+From e56a2597eb66c2221b004aa3356b06c1b071b5b5 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Wed, 14 Aug 2024 00:51:26 +0300
+Subject: [PATCH] Cast to EGLNativeWindowType explicitly
+
+In order to avoid off build failures due to mismatching (but
+compatible) declarations of wl_egl_window and EGLNativeWindowType,
+add an explicit cast to EGLNativeWindowType inside the
+TargetWayland::nativeWindow() function.
+
+Solves the following build issue found by the Buildroot autobuilders:
+
+  http://autobuild.buildroot.net/results/92c5cc3134e92c263a0cbb4c05ef8956569e434b/
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream: https://github.com/Igalia/WPEBackend-fdo/commit/e56a2597eb66c2221b004aa3356b06c1b071b5b5
+---
+ src/egl-client-wayland.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/egl-client-wayland.cpp b/src/egl-client-wayland.cpp
+index 10e02f0..22bb212 100644
+--- a/src/egl-client-wayland.cpp
++++ b/src/egl-client-wayland.cpp
+@@ -63,7 +63,7 @@ TargetWayland::~TargetWayland()
+ 
+ EGLNativeWindowType TargetWayland::nativeWindow() const
+ {
+-    return m_egl.window;
++    return (EGLNativeWindowType) m_egl.window;
+ }
+ 
+ void TargetWayland::resize(uint32_t width, uint32_t height)
+-- 
+2.46.0
+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
