Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43520C021AF
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 20:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 010D881E8E;
	Sat, 14 Sep 2024 20:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b06V7Eux2z15; Sat, 14 Sep 2024 20:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E69BA81E94
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E69BA81E94;
	Sat, 14 Sep 2024 20:02:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F32E1BF86D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EBA081E94
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQGPMT41xxoK for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 20:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9610C81E8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9610C81E8E
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9610C81E8E
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:02:45 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1spYyf-00DoX7-LD; Sat, 14 Sep 2024 22:02:41 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 3f370859;
 Sat, 14 Sep 2024 20:02:40 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:02:38 +0300
Message-ID: <20240914200240.4156241-1-aperez@igalia.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S22R/S++EjYJlp/PdeOqqoDKbTAxpAZZasCw70fRJBQ=; b=UiO09jN3jf7Q1RoyQaQwYMil0o
 ziZy9v9WLDPd+UYFBUuKsE85KBAhCqEc/LFKH7C8okNXoFiXpzYQ/gOiCxoYvqWpmFs7Q2TRua/6G
 rJ7NelOQDM/afhO6ukmZCABpeka96gZ5mQcTEiEarWDFvpVeLA9Ave+nNODpZi54OqpwXCWciC2Zx
 xeYIfIUEY5EimbdS2s81cyMXEVj25ibWzc/7QtamKVXgJBtiBWS49LNxAwXEZbNZi90igx1Q1Tmym
 9eyGV2cB4WhDgMV+EV12vSa7TMHWTpBHlJJL+HM+EtlJNKa4wf5yViW+Vh5n4GfKW+xyfCu16L1cZ
 q4uRcVrA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=UiO09jN3
Subject: [Buildroot] [PATCH] package/wpewebkit: security bump to version
 2.44.4
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

Fixes security issues CVE-2024-40776, CVE-2024-40779, CVE-2024-40780,
CVE-2024-40782, CVE-2024-40789, and CVE-2024-4558. Security advisory:

  https://wpewebkit.org/security/WSA-2024-0004.html

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.44.3.html
  https://wpewebkit.org/release/wpewebkit-2.44.4.html

Patch "0001-Remove-ARM-specific-declarations-in-FELighting.patch" has
been included as part of the fixes in version 2.44.3 and is therefore
removed.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...-specific-declarations-in-FELighting.patch | 68 -------------------
 package/wpewebkit/wpewebkit.hash              |  8 +--
 package/wpewebkit/wpewebkit.mk                |  2 +-
 3 files changed, 5 insertions(+), 73 deletions(-)
 delete mode 100644 package/wpewebkit/0001-Remove-ARM-specific-declarations-in-FELighting.patch

diff --git a/package/wpewebkit/0001-Remove-ARM-specific-declarations-in-FELighting.patch b/package/wpewebkit/0001-Remove-ARM-specific-declarations-in-FELighting.patch
deleted file mode 100644
index 9e2bc86fef..0000000000
--- a/package/wpewebkit/0001-Remove-ARM-specific-declarations-in-FELighting.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 8863ceb3c8486f31e1ccfcd2c7c602fad9feac52 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Mon, 27 May 2024 02:09:58 +0300
-Subject: [PATCH] Cherry-pick 279334@main (36d1b5d7c0ef). <bug>
-
-    Remove ARM-specific declarations in FELighting.h unneeded after 272873@main
-
-    Unreviewed build fix.
-
-    * Source/WebCore/platform/graphics/filters/FELighting.h: Remove unneeded
-      declarations for the getPowerCoefficients() and platformApplyNeon()
-      functions, which are now defined elsewhere; and were causing a build
-      failure due to usage of the protected LightingData type.
-    * Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp:
-      (WebCore::FELightingNeonParallelApplier::applyPlatformParallel const):
-      Add missing LightType:: namespace to uses of LS_POINT and LS_SPOT.
-
-    Canonical link: https://commits.webkit.org/279334@main
-
-Canonical link: https://commits.webkit.org/274313.261@webkitglib/2.44
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-Upstream: https://github.com/WebKit/WebKit/commit/8863ceb3c8486f31e1ccfcd2c7c602fad9feac52
----
- .../cpu/arm/filters/FELightingNeonParallelApplier.cpp        | 4 ++--
- Source/WebCore/platform/graphics/filters/FELighting.h        | 5 -----
- 2 files changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
-index 04d855fa6d71..5f4250d87b61 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
-@@ -542,14 +542,14 @@ void FELightingNeonParallelApplier::applyPlatformParallel(const LightingData& da
-     floatArguments.colorBlue = color.blue;
-     floatArguments.padding4 = 0;
- 
--    if (data.lightSource->type() == LS_POINT) {
-+    if (data.lightSource->type() == LightType::LS_POINT) {
-         neonData.flags |= FLAG_POINT_LIGHT;
-         auto& pointLightSource = downcast<PointLightSource>(*data.lightSource);
-         floatArguments.lightX = pointLightSource.position().x();
-         floatArguments.lightY = pointLightSource.position().y();
-         floatArguments.lightZ = pointLightSource.position().z();
-         floatArguments.padding2 = 0;
--    } else if (data.lightSource->type() == LS_SPOT) {
-+    } else if (data.lightSource->type() == LightType::LS_SPOT) {
-         neonData.flags |= FLAG_SPOT_LIGHT;
-         auto& spotLightSource = downcast<SpotLightSource>(*data.lightSource);
-         floatArguments.lightX = spotLightSource.position().x();
-diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
-index 4efab920b1c3..dcd80b6f42b7 100644
---- a/Source/WebCore/platform/graphics/filters/FELighting.h
-+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
-@@ -68,11 +68,6 @@ protected:
- 
-     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
- 
--#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
--    static int getPowerCoefficients(float exponent);
--    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
--#endif
--
-     Color m_lightingColor;
-     float m_surfaceScale;
-     float m_diffuseConstant;
--- 
-2.45.2
-
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 790adbb0d4..7a7cef15a5 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.44.2.tar.xz.sums
-md5  0e2a6d05b000e79c51c537ab3261b171  wpewebkit-2.44.2.tar.xz
-sha1  5bded217fab25aea776e41158fcdbd72d69a612e  wpewebkit-2.44.2.tar.xz
-sha256  2a3d23cb4fb071ca0db3a09c5a85f27b8bcc6094a2026d3b7407bed4f99218f7  wpewebkit-2.44.2.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.44.4.tar.xz.sums
+md5  4d91f3ff629c9356dcff866b68a4646f  wpewebkit-2.44.4.tar.xz
+sha1  ef1ea0484e9ec17a362afe9a709fe0754f05cc14  wpewebkit-2.44.4.tar.xz
+sha256  cd6042c63a6f883cc1586e5cea94e846aaaee6a864c14988e8af4ef4f362ba3b  wpewebkit-2.44.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index d71ade577d..9f8a791b5a 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-WPEWEBKIT_VERSION = 2.44.2
+WPEWEBKIT_VERSION = 2.44.4
 WPEWEBKIT_SITE = https://wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
