Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1080C2D0D1
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73D1460A9A;
	Mon, 24 Jun 2024 20:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyYRRRTjOZCw; Mon, 24 Jun 2024 20:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7603560A78
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7603560A78;
	Mon, 24 Jun 2024 20:01:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55A2B1BF95D
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41F7E408E3
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0xJ2UqS7wra for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:01:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3EAD408E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3EAD408E0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3EAD408E0
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:01:02 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sLps1-0072p6-UG; Mon, 24 Jun 2024 22:00:58 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id cf72b584;
 Mon, 24 Jun 2024 20:00:56 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 23:00:53 +0300
Message-ID: <20240624200056.440154-1-aperez@igalia.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wlSxVbo3ck5sKKgvNyu4gtcCnmsIqNhJ9LfSdy4Uaag=; b=cUKm4T4ZThw1QTLryWv2PeHTSP
 I3pOGEujiecqYHZx1FR2K0A75YfffcpbgUEtjqmola8tkbk2KlCbMShiSbRZH9hr2QOQ+wqBMZ9ME
 N7MgBTp7OVP2IYlGaeZDnTRyFtGvRAGnnS54PvmFKAOAF/+qUw8HArgzjz5Xnn7YA89/Kwjg0KZir
 Bx5erlE8rOtGMKsOuUH6K4n1jcV2tuqH6Mg8W4eUEoay4FyIam684X00xSZnrr0mRBp5ghFo32mv1
 jjHPjdEHv7MGGH74wXuTZr8VWwi4c+c8UCveYdE58Nt3eJJSwPQYm8b5E/bswWMdA7mIQ5FjCWcVV
 EkJ6fsEQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=cUKm4T4Z
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add backported patch to
 fix NEON build
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

Import a patch that has been backported by upstream to the 2.44 release
branch that fixes the build when the target is an ARM processor that
supports NEON instructions.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...-specific-declarations-in-FELighting.patch | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 package/wpewebkit/0001-Remove-ARM-specific-declarations-in-FELighting.patch

diff --git a/package/wpewebkit/0001-Remove-ARM-specific-declarations-in-FELighting.patch b/package/wpewebkit/0001-Remove-ARM-specific-declarations-in-FELighting.patch
new file mode 100644
index 0000000000..9e2bc86fef
--- /dev/null
+++ b/package/wpewebkit/0001-Remove-ARM-specific-declarations-in-FELighting.patch
@@ -0,0 +1,68 @@
+From 8863ceb3c8486f31e1ccfcd2c7c602fad9feac52 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Mon, 27 May 2024 02:09:58 +0300
+Subject: [PATCH] Cherry-pick 279334@main (36d1b5d7c0ef). <bug>
+
+    Remove ARM-specific declarations in FELighting.h unneeded after 272873@main
+
+    Unreviewed build fix.
+
+    * Source/WebCore/platform/graphics/filters/FELighting.h: Remove unneeded
+      declarations for the getPowerCoefficients() and platformApplyNeon()
+      functions, which are now defined elsewhere; and were causing a build
+      failure due to usage of the protected LightingData type.
+    * Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp:
+      (WebCore::FELightingNeonParallelApplier::applyPlatformParallel const):
+      Add missing LightType:: namespace to uses of LS_POINT and LS_SPOT.
+
+    Canonical link: https://commits.webkit.org/279334@main
+
+Canonical link: https://commits.webkit.org/274313.261@webkitglib/2.44
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream: https://github.com/WebKit/WebKit/commit/8863ceb3c8486f31e1ccfcd2c7c602fad9feac52
+---
+ .../cpu/arm/filters/FELightingNeonParallelApplier.cpp        | 4 ++--
+ Source/WebCore/platform/graphics/filters/FELighting.h        | 5 -----
+ 2 files changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
+index 04d855fa6d71..5f4250d87b61 100644
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
+@@ -542,14 +542,14 @@ void FELightingNeonParallelApplier::applyPlatformParallel(const LightingData& da
+     floatArguments.colorBlue = color.blue;
+     floatArguments.padding4 = 0;
+ 
+-    if (data.lightSource->type() == LS_POINT) {
++    if (data.lightSource->type() == LightType::LS_POINT) {
+         neonData.flags |= FLAG_POINT_LIGHT;
+         auto& pointLightSource = downcast<PointLightSource>(*data.lightSource);
+         floatArguments.lightX = pointLightSource.position().x();
+         floatArguments.lightY = pointLightSource.position().y();
+         floatArguments.lightZ = pointLightSource.position().z();
+         floatArguments.padding2 = 0;
+-    } else if (data.lightSource->type() == LS_SPOT) {
++    } else if (data.lightSource->type() == LightType::LS_SPOT) {
+         neonData.flags |= FLAG_SPOT_LIGHT;
+         auto& spotLightSource = downcast<SpotLightSource>(*data.lightSource);
+         floatArguments.lightX = spotLightSource.position().x();
+diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
+index 4efab920b1c3..dcd80b6f42b7 100644
+--- a/Source/WebCore/platform/graphics/filters/FELighting.h
++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
+@@ -68,11 +68,6 @@ protected:
+ 
+     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
+ 
+-#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
+-    static int getPowerCoefficients(float exponent);
+-    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
+-#endif
+-
+     Color m_lightingColor;
+     float m_surfaceScale;
+     float m_diffuseConstant;
+-- 
+2.45.2
+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
