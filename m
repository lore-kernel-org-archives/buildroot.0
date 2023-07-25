Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE272C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 17:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C74B607D0;
	Tue, 25 Jul 2023 17:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C74B607D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_0mo2djnQed; Tue, 25 Jul 2023 17:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BA13610B6;
	Tue, 25 Jul 2023 17:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BA13610B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0211BF317
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E2C2610B6
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E2C2610B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIyDkZ1J9oM4 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 17:10:18 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2887607D0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 17:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2887607D0
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-346129c9512so218965ab.1
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 10:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690305017; x=1690909817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7IqRNJJmQASOZa6vjdWRFBVVTe6ylLr5LssIpBclviw=;
 b=E+wUBLTuuHBqQhxCE6y1ze8hh07Xvic23KmI6avaX2EVaS3E6vbv4cKfdWU2VCv7NV
 ZeVtS+LC/ux9ecCPEfssVNPRmmwDbJA7jf8p2hLla2jPU3Fyt44I6YvRPU9oCpppnOU2
 VFZzADuQ5g0lVz6KiOtszVwrIO2zkUNVW+gOIfZNMEE9qUBODh55uRaem49eqWdKKu3X
 bJ8MDzdBwAYFcpRfLWFkzPiPub3bMgvJzPOB4mogPIQlXCL8sP7owxgQbh175aoj+IaG
 ViMmfVe5eEgEfRxvFStgGctz3gK0Nz1O2p5EVC74Gfubd/XxTwwVExVciof8OT+PXrLf
 9jtg==
X-Gm-Message-State: ABy/qLYSy/AqQCqBjP95wou2jeMRVyhB5nZ6Fj74vsiPWqVTqf1Rd3ut
 zJqt+NMaA0pcSzGzuH18Ns6xKcSrp5A=
X-Google-Smtp-Source: APBJJlEVYdcjMpbyXAg7TbcxjUT8AhhABP3iNBi5NzZztSdcldbljDVseC/IVaD4rQDeDB61iocqdg==
X-Received: by 2002:a92:c56d:0:b0:348:d683:36bf with SMTP id
 b13-20020a92c56d000000b00348d68336bfmr1807518ilj.12.1690305017077; 
 Tue, 25 Jul 2023 10:10:17 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 a4-20020a02ac04000000b0042b068d921esm1157254jao.16.2023.07.25.10.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 10:10:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 11:10:08 -0600
Message-Id: <20230725171008.1559503-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690305017; x=1690909817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7IqRNJJmQASOZa6vjdWRFBVVTe6ylLr5LssIpBclviw=;
 b=mkTbG3ZFZ1HPiFg3jcMOZi6g+CYgzCZZ+hwnI9c7zYvzckhU54Knro2B28atnQyRg9
 NrNbBbFAFYefBBZD89kNHMLSj4WnNQ4sAnKByYsLda01ZSFU2d1XTobX1XdaPv2j9nYt
 HRDErzMgAQ4fDLIbiIzS1G/u55WMt3FxCNqbzoVuA0TFonNT+dSgaK/AL3urLB/3kcNF
 zDFpTpCZBH4igQuvL7cpCzBTX7Qf14hXdx99mUkzB5K+M+AfdyrYRLj0NYKOYbhk2Stk
 faISyGBDu+YMzfVpTVUPb8c6T88I8QmozfwAotdzJCoin3zWMxJhCjtAfbAwd6fJfZ2S
 uy0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=mkTbG3ZF
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: drop NEON build fix patch
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is already upstream and no longer applies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...cpp-fails-to-build-NEON-fast-path-se.patch | 328 ------------------
 1 file changed, 328 deletions(-)
 delete mode 100644 package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch

diff --git a/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch b/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
deleted file mode 100644
index ea1676abb6..0000000000
--- a/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
+++ /dev/null
@@ -1,328 +0,0 @@
-From da159b0150cba0e5e5251e4cc6a090440f73cb7c Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Thu, 2 Jun 2022 11:19:06 +0300
-Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
- unused https://bugs.webkit.org/show_bug.cgi?id=241182
-
-Reviewed by NOBODY (OOPS!).
-
-Move the NEON fast path for the SVG lighting filter effects into
-FELightingSoftwareApplier, and arrange to actually use them by
-forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
-
-Some changes were needed to adapt platformApplyNeon() to the current
-state of filters after r286140. This was not detected because the code
-bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
-not get used much these days: CPU(ARM_THUMB2) is more common. It should
-be possible to use the NEON fast paths also in Thumb mode, but that is
-left for a follow-up fix.
-
-* Source/WebCore/Sources.txt:
-* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
-(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
-(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
-(WebCore::FELighting::platformApplyNeonWorker): Deleted.
-(WebCore::FELighting::getPowerCoefficients): Deleted.
-* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
-(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
-(WebCore::FELighting::platformApplyNeon): Deleted.
-* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
-* Source/WebCore/platform/graphics/filters/FELighting.h:
-* Source/WebCore/platform/graphics/filters/PointLightSource.h:
-* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
-* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Upstream status: https://bugs.webkit.org/show_bug.cgi?id=241182]
----
- Source/WebCore/Sources.txt                    |  1 +
- .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
- .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
- .../graphics/filters/DistantLightSource.h     |  4 ++
- .../platform/graphics/filters/FELighting.h    |  7 ---
- .../graphics/filters/PointLightSource.h       |  4 ++
- .../graphics/filters/SpotLightSource.h        |  4 ++
- .../software/FELightingSoftwareApplier.h      | 16 ++++++
- 8 files changed, 58 insertions(+), 36 deletions(-)
-
-diff --git a/Source/WebCore/Sources.txt b/Source/WebCore/Sources.txt
-index 8ce3510fe1a8..efd56bcb8746 100644
---- a/Source/WebCore/Sources.txt
-+++ b/Source/WebCore/Sources.txt
-@@ -2136,6 +2136,7 @@ platform/graphics/WebMResourceClient.cpp
- platform/graphics/WOFFFileFormat.cpp
- platform/graphics/WidthIterator.cpp
- platform/graphics/cpu/arm/filters/FEBlendNeonApplier.cpp
-+platform/graphics/cpu/arm/filters/FELightingNEON.cpp
- platform/graphics/displaylists/DisplayList.cpp
- platform/graphics/displaylists/DisplayListDrawingContext.cpp
- platform/graphics/displaylists/DisplayListItems.cpp
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
-index f6ff8c20a5a8..42a97ffc5372 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
-@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
-     return s_FELightingConstantsForNeon;
- }
- 
--void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
-+void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
- {
-     neonDrawLighting(parameters);
- }
-@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
-     "b .lightStrengthCalculated" NL
- ); // NOLINT
- 
--int FELighting::getPowerCoefficients(float exponent)
-+int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
- {
-     // Calling a powf function from the assembly code would require to save
-     // and reload a lot of NEON registers. Since the base is in range [0..1]
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-index b17c603d40d3..c6d17f573eca 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-@@ -24,14 +24,15 @@
-  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
- 
--#ifndef FELightingNEON_h
--#define FELightingNEON_h
-+#pragma once
- 
- #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
- 
--#include "FELighting.h"
-+#include "FELightingSoftwareApplier.h"
-+#include "ImageBuffer.h"
- #include "PointLightSource.h"
- #include "SpotLightSource.h"
-+#include <wtf/ObjectIdentifier.h>
- #include <wtf/ParallelJobs.h>
- 
- namespace WebCore {
-@@ -93,14 +94,14 @@ extern "C" {
- void neonDrawLighting(FELightingPaintingDataForNeon*);
- }
- 
--inline void FELighting::platformApplyNeon(const LightingData& data, const LightSource::PaintingData& paintingData)
-+inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData& data, const LightSource::PaintingData& paintingData)
- {
--    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
--    FELightingPaintingDataForNeon neonData = {
--        data.pixels->data(),
-+    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
-+    WebCore::FELightingPaintingDataForNeon neonData = {
-+        data.pixels->bytes(),
-         1,
--        data.widthDecreasedByOne - 1,
--        data.heightDecreasedByOne - 1,
-+        data.width - 2,
-+        data.height - 2,
-         0,
-         0,
-         0,
-@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
-     // Set light source arguments.
-     floatArguments.constOne = 1;
- 
--    auto color = m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
-+    auto color = data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
- 
-     floatArguments.colorRed = color.red;
-     floatArguments.colorGreen = color.green;
-     floatArguments.colorBlue = color.blue;
-     floatArguments.padding4 = 0;
- 
--    if (m_lightSource->type() == LS_POINT) {
-+    if (data.lightSource->type() == LS_POINT) {
-         neonData.flags |= FLAG_POINT_LIGHT;
--        PointLightSource& pointLightSource = static_cast<PointLightSource&>(m_lightSource.get());
-+        const auto& pointLightSource = *static_cast<const PointLightSource*>(data.lightSource);
-         floatArguments.lightX = pointLightSource.position().x();
-         floatArguments.lightY = pointLightSource.position().y();
-         floatArguments.lightZ = pointLightSource.position().z();
-         floatArguments.padding2 = 0;
--    } else if (m_lightSource->type() == LS_SPOT) {
-+    } else if (data.lightSource->type() == LS_SPOT) {
-         neonData.flags |= FLAG_SPOT_LIGHT;
--        SpotLightSource& spotLightSource = static_cast<SpotLightSource&>(m_lightSource.get());
-+        const auto& spotLightSource = *static_cast<const SpotLightSource*>(data.lightSource);
-         floatArguments.lightX = spotLightSource.position().x();
-         floatArguments.lightY = spotLightSource.position().y();
-         floatArguments.lightZ = spotLightSource.position().z();
-@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
-         if (spotLightSource.specularExponent() == 1)
-             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
-     } else {
--        ASSERT(m_lightSource->type() == LS_DISTANT);
-+        ASSERT(data.lightSource->type() == LS_DISTANT);
-         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
-         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
-         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
-@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
-     // Set lighting arguments.
-     floatArguments.surfaceScale = data.surfaceScale;
-     floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
--    if (m_lightingType == FELighting::DiffuseLighting)
--        floatArguments.diffuseConstant = m_diffuseConstant;
-+    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
-+        floatArguments.diffuseConstant = data.diffuseConstant;
-     else {
-         neonData.flags |= FLAG_SPECULAR_LIGHT;
--        floatArguments.diffuseConstant = m_specularConstant;
--        neonData.specularExponent = getPowerCoefficients(m_specularExponent);
--        if (m_specularExponent == 1)
-+        floatArguments.diffuseConstant = data.specularConstant;
-+        neonData.specularExponent = getPowerCoefficients(data.specularExponent);
-+        if (data.specularExponent == 1)
-             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
-     }
-     if (floatArguments.diffuseConstant == 1)
-         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
- 
--    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
-+    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
-+    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
-     if (optimalThreadNumber > 1) {
-         // Initialize parallel jobs
--        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
-+        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
- 
-         // Fill the parameter array
-         int job = parallelJobs.numberOfJobs();
-         if (job > 1) {
-             int yStart = 1;
--            int yStep = (data.heightDecreasedByOne - 1) / job;
-+            int yStep = (data.height - 2) / job;
-             for (--job; job >= 0; --job) {
-                 FELightingPaintingDataForNeon& params = parallelJobs.parameter(job);
-                 params = neonData;
-                 params.yStart = yStart;
--                params.pixels += (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;
-+                params.pixels += (yStart - 1) * data.width * 4;
-                 if (job > 0) {
-                     params.absoluteHeight = yStep;
-                     yStart += yStep;
-                 } else
--                    params.absoluteHeight = data.heightDecreasedByOne - yStart;
-+                    params.absoluteHeight = (data.height - 1) - yStart;
-             }
-             parallelJobs.execute();
-             return;
-@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
- } // namespace WebCore
- 
- #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
--
--#endif // FELightingNEON_h
-diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-index 0660143fc1cf..2b1e86d99fa4 100644
---- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-@@ -25,6 +25,10 @@
- #include "LightSource.h"
- #include <wtf/Ref.h>
- 
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
- 
- class DistantLightSource : public LightSource {
-diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
-index 0c073bc13f8c..e0db00545c17 100644
---- a/Source/WebCore/platform/graphics/filters/FELighting.h
-+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
-@@ -35,8 +35,6 @@
- 
- namespace WebCore {
- 
--struct FELightingPaintingDataForNeon;
--
- class FELighting : public FilterEffect {
- public:
-     const Color& lightingColor() const { return m_lightingColor; }
-@@ -67,11 +65,6 @@ protected:
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
-diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-index 126b3b2350f6..d906db21aa9c 100644
---- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-@@ -26,6 +26,10 @@
- #include "LightSource.h"
- #include <wtf/Ref.h>
- 
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
- 
- class PointLightSource : public LightSource {
-diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-index 641b205f986d..64380d9b6eb8 100644
---- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-@@ -26,6 +26,10 @@
- #include "LightSource.h"
- #include <wtf/Ref.h>
- 
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
- 
- class SpotLightSource : public LightSource {
-diff --git a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
-index c974d92115ff..e2896660cfbd 100644
---- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
-+++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
-@@ -36,6 +36,7 @@
- namespace WebCore {
- 
- class FELighting;
-+struct FELightingPaintingDataForNeon;
- 
- class FELightingSoftwareApplier final : public FilterEffectConcreteApplier<FELighting> {
-     WTF_MAKE_FAST_ALLOCATED;
-@@ -132,8 +133,23 @@ private:
- 
-     static void applyPlatformGenericPaint(const LightingData&, const LightSource::PaintingData&, int startY, int endY);
-     static void applyPlatformGenericWorker(ApplyParameters*);
-+
-+#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
-+    static int getPowerCoefficients(float exponent);
-+    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
-+    inline static void applyPlatformNeon(const LightingData&, const LightSource::PaintingData&);
-+
-+    inline static void applyPlatformGeneric(const LightingData& data, const LightSource::PaintingData& paintingData)
-+    {
-+        applyPlatformNeon(data, paintingData);
-+    }
-+#else
-     static void applyPlatformGeneric(const LightingData&, const LightSource::PaintingData&);
-+#endif
-+
-     static void applyPlatform(const LightingData&);
- };
- 
- } // namespace WebCore
-+
-+#include "FELightingNEON.h"
--- 
-2.37.3
-
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
