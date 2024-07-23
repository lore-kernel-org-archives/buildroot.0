Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AE0C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 14:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46DBB4024C;
	Tue, 23 Jul 2024 14:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvmrWDY9wn0d; Tue, 23 Jul 2024 14:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D368E4030A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D368E4030A;
	Tue, 23 Jul 2024 14:45:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B29331BF4E5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 14:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F5814027F
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 14:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqVFXXq6D4_q for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 14:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F4F240112
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F4F240112
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 14:43:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89683873A9; Tue, 23 Jul 2024 14:43:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 16:42:22 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1d91c6fda4e4cc6aef3d2983c74cb65b80949f8e
X-Git-Newrev: ecd49f45520dd92a05ed29e06f2d688110252a22
X-Patchwork-Hint: ignore
Message-Id: <20240723144349.89683873A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/wpewebkit: add
 backported patch to fix NEON build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ecd49f45520dd92a05ed29e06f2d688110252a22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Import a patch that has been backported by upstream to the 2.44 release
branch that fixes the build when the target is an ARM processor that
supports NEON instructions.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8502ac71aad426792aa51923ef0f14b83c4bf2c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-ARM-specific-declarations-in-FELighting.patch | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
