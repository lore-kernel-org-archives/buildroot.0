Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F716C6FD18
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 21:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A7D607E3;
	Sun, 23 Apr 2023 21:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1A7D607E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id frwPkNnQFesk; Sun, 23 Apr 2023 21:30:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29CF9607F5;
	Sun, 23 Apr 2023 21:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29CF9607F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4B671C2B11
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 21:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B4DD607F5
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 21:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B4DD607F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LbHN0Jj1UPYL for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 21:30:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8109E607E3
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8109E607E3
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 21:30:06 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pqhHW-00AYYB-HZ; Sun, 23 Apr 2023 23:30:02 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 59073c25;
 Sun, 23 Apr 2023 21:30:01 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 00:30:01 +0300
Message-Id: <20230423213001.2961215-1-aperez@igalia.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kGN6n8IIhL2Nbbi6PcZ1FGPtZiNv11Svq3HUahjKBcs=; b=EU9AiEF3D4LX8iqL9eqtFIwtdA
 8FzwsoZuVTyjLOQ7jXub6kU2JCcwr1txMoQuCSRCNFk4WKwpSQAecNTsIEDJ5ZXYuUn3oUqO7DxMW
 aXT+hnIKIOvWkjuhqFZctueRA1hmnDzG6InUwPtybb78DtAd6rfeIE0SuRv/EG/Gl+KGYO0ZMHRN2
 QsfrPkeIQKwkZVgOYMSTOV9Pi0oYFHHJctMeCUKfGKXHg3BpAelhbCowydPPrHe2u2p1IgEW9M/wi
 WHEgiwMW69rvEiwxI6KxhwxNs7LMzs2syeJA+53D4zp13J5ePduDUVRGOfT2j8vP9oMuh56Cy8T6o
 OyE+Emtg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=EU9AiEF3
Subject: [Buildroot] [PATCH] package/webkitgtk: import ARM NEON and build
 fix patch
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

Import the same patch already in use by wpewebkit to fix the build on
ARM NEON targets, and also a new one proposed upstream to fix the build
with OpenGL ES header from some GPU drivers.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...cpp-fails-to-build-NEON-fast-path-se.patch | 328 ++++++++++++++++++
 ...nsGLOpenGLES.cpp-uses-GLES3-symbols-.patch | 110 ++++++
 2 files changed, 438 insertions(+)
 create mode 100644 package/webkitgtk/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
 create mode 100644 package/webkitgtk/0002-WPE-GTK-ExtensionsGLOpenGLES.cpp-uses-GLES3-symbols-.patch

diff --git a/package/webkitgtk/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch b/package/webkitgtk/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
new file mode 100644
index 0000000000..a851a2d3d5
--- /dev/null
+++ b/package/webkitgtk/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
@@ -0,0 +1,328 @@
+From da159b0150cba0e5e5251e4cc6a090440f73cb7c Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Thu, 2 Jun 2022 11:19:06 +0300
+Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
+ unused https://bugs.webkit.org/show_bug.cgi?id=241182
+
+Reviewed by NOBODY (OOPS!).
+
+Move the NEON fast path for the SVG lighting filter effects into
+FELightingSoftwareApplier, and arrange to actually use them by
+forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
+
+Some changes were needed to adapt platformApplyNeon() to the current
+state of filters after r286140. This was not detected because the code
+bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
+not get used much these days: CPU(ARM_THUMB2) is more common. It should
+be possible to use the NEON fast paths also in Thumb mode, but that is
+left for a follow-up fix.
+
+* Source/WebCore/Sources.txt:
+* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
+(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
+(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
+(WebCore::FELighting::platformApplyNeonWorker): Deleted.
+(WebCore::FELighting::getPowerCoefficients): Deleted.
+* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
+(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
+(WebCore::FELighting::platformApplyNeon): Deleted.
+* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
+* Source/WebCore/platform/graphics/filters/FELighting.h:
+* Source/WebCore/platform/graphics/filters/PointLightSource.h:
+* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
+* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream: https://bugs.webkit.org/show_bug.cgi?id=241182
+---
+ Source/WebCore/Sources.txt                    |  1 +
+ .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
+ .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
+ .../graphics/filters/DistantLightSource.h     |  4 ++
+ .../platform/graphics/filters/FELighting.h    |  7 ---
+ .../graphics/filters/PointLightSource.h       |  4 ++
+ .../graphics/filters/SpotLightSource.h        |  4 ++
+ .../software/FELightingSoftwareApplier.h      | 16 ++++++
+ 8 files changed, 58 insertions(+), 36 deletions(-)
+
+diff --git a/Source/WebCore/Sources.txt b/Source/WebCore/Sources.txt
+index 8ce3510fe1a8..efd56bcb8746 100644
+--- a/Source/WebCore/Sources.txt
++++ b/Source/WebCore/Sources.txt
+@@ -2136,6 +2136,7 @@ platform/graphics/WebMResourceClient.cpp
+ platform/graphics/WOFFFileFormat.cpp
+ platform/graphics/WidthIterator.cpp
+ platform/graphics/cpu/arm/filters/FEBlendNeonApplier.cpp
++platform/graphics/cpu/arm/filters/FELightingNEON.cpp
+ platform/graphics/displaylists/DisplayList.cpp
+ platform/graphics/displaylists/DisplayListDrawingContext.cpp
+ platform/graphics/displaylists/DisplayListItems.cpp
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
+index f6ff8c20a5a8..42a97ffc5372 100644
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
+@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
+     return s_FELightingConstantsForNeon;
+ }
+ 
+-void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
++void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
+ {
+     neonDrawLighting(parameters);
+ }
+@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
+     "b .lightStrengthCalculated" NL
+ ); // NOLINT
+ 
+-int FELighting::getPowerCoefficients(float exponent)
++int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
+ {
+     // Calling a powf function from the assembly code would require to save
+     // and reload a lot of NEON registers. Since the base is in range [0..1]
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
+index b17c603d40d3..c6d17f573eca 100644
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
+@@ -24,14 +24,15 @@
+  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#ifndef FELightingNEON_h
+-#define FELightingNEON_h
++#pragma once
+ 
+ #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
+ 
+-#include "FELighting.h"
++#include "FELightingSoftwareApplier.h"
++#include "ImageBuffer.h"
+ #include "PointLightSource.h"
+ #include "SpotLightSource.h"
++#include <wtf/ObjectIdentifier.h>
+ #include <wtf/ParallelJobs.h>
+ 
+ namespace WebCore {
+@@ -93,14 +94,14 @@ extern "C" {
+ void neonDrawLighting(FELightingPaintingDataForNeon*);
+ }
+ 
+-inline void FELighting::platformApplyNeon(const LightingData& data, const LightSource::PaintingData& paintingData)
++inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData& data, const LightSource::PaintingData& paintingData)
+ {
+-    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
+-    FELightingPaintingDataForNeon neonData = {
+-        data.pixels->data(),
++    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
++    WebCore::FELightingPaintingDataForNeon neonData = {
++        data.pixels->bytes(),
+         1,
+-        data.widthDecreasedByOne - 1,
+-        data.heightDecreasedByOne - 1,
++        data.width - 2,
++        data.height - 2,
+         0,
+         0,
+         0,
+@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
+     // Set light source arguments.
+     floatArguments.constOne = 1;
+ 
+-    auto color = m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
++    auto color = data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
+ 
+     floatArguments.colorRed = color.red;
+     floatArguments.colorGreen = color.green;
+     floatArguments.colorBlue = color.blue;
+     floatArguments.padding4 = 0;
+ 
+-    if (m_lightSource->type() == LS_POINT) {
++    if (data.lightSource->type() == LS_POINT) {
+         neonData.flags |= FLAG_POINT_LIGHT;
+-        PointLightSource& pointLightSource = static_cast<PointLightSource&>(m_lightSource.get());
++        const auto& pointLightSource = *static_cast<const PointLightSource*>(data.lightSource);
+         floatArguments.lightX = pointLightSource.position().x();
+         floatArguments.lightY = pointLightSource.position().y();
+         floatArguments.lightZ = pointLightSource.position().z();
+         floatArguments.padding2 = 0;
+-    } else if (m_lightSource->type() == LS_SPOT) {
++    } else if (data.lightSource->type() == LS_SPOT) {
+         neonData.flags |= FLAG_SPOT_LIGHT;
+-        SpotLightSource& spotLightSource = static_cast<SpotLightSource&>(m_lightSource.get());
++        const auto& spotLightSource = *static_cast<const SpotLightSource*>(data.lightSource);
+         floatArguments.lightX = spotLightSource.position().x();
+         floatArguments.lightY = spotLightSource.position().y();
+         floatArguments.lightZ = spotLightSource.position().z();
+@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
+         if (spotLightSource.specularExponent() == 1)
+             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
+     } else {
+-        ASSERT(m_lightSource->type() == LS_DISTANT);
++        ASSERT(data.lightSource->type() == LS_DISTANT);
+         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
+         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
+         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
+@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
+     // Set lighting arguments.
+     floatArguments.surfaceScale = data.surfaceScale;
+     floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
+-    if (m_lightingType == FELighting::DiffuseLighting)
+-        floatArguments.diffuseConstant = m_diffuseConstant;
++    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
++        floatArguments.diffuseConstant = data.diffuseConstant;
+     else {
+         neonData.flags |= FLAG_SPECULAR_LIGHT;
+-        floatArguments.diffuseConstant = m_specularConstant;
+-        neonData.specularExponent = getPowerCoefficients(m_specularExponent);
+-        if (m_specularExponent == 1)
++        floatArguments.diffuseConstant = data.specularConstant;
++        neonData.specularExponent = getPowerCoefficients(data.specularExponent);
++        if (data.specularExponent == 1)
+             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
+     }
+     if (floatArguments.diffuseConstant == 1)
+         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
+ 
+-    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
++    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
++    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
+     if (optimalThreadNumber > 1) {
+         // Initialize parallel jobs
+-        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
++        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
+ 
+         // Fill the parameter array
+         int job = parallelJobs.numberOfJobs();
+         if (job > 1) {
+             int yStart = 1;
+-            int yStep = (data.heightDecreasedByOne - 1) / job;
++            int yStep = (data.height - 2) / job;
+             for (--job; job >= 0; --job) {
+                 FELightingPaintingDataForNeon& params = parallelJobs.parameter(job);
+                 params = neonData;
+                 params.yStart = yStart;
+-                params.pixels += (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;
++                params.pixels += (yStart - 1) * data.width * 4;
+                 if (job > 0) {
+                     params.absoluteHeight = yStep;
+                     yStart += yStep;
+                 } else
+-                    params.absoluteHeight = data.heightDecreasedByOne - yStart;
++                    params.absoluteHeight = (data.height - 1) - yStart;
+             }
+             parallelJobs.execute();
+             return;
+@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
+ } // namespace WebCore
+ 
+ #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
+-
+-#endif // FELightingNEON_h
+diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
+index 0660143fc1cf..2b1e86d99fa4 100644
+--- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
++++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
+@@ -25,6 +25,10 @@
+ #include "LightSource.h"
+ #include <wtf/Ref.h>
+ 
++namespace WTF {
++class TextStream;
++} // namespace WTF
++
+ namespace WebCore {
+ 
+ class DistantLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
+index 0c073bc13f8c..e0db00545c17 100644
+--- a/Source/WebCore/platform/graphics/filters/FELighting.h
++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
+@@ -35,8 +35,6 @@
+ 
+ namespace WebCore {
+ 
+-struct FELightingPaintingDataForNeon;
+-
+ class FELighting : public FilterEffect {
+ public:
+     const Color& lightingColor() const { return m_lightingColor; }
+@@ -67,11 +65,6 @@ protected:
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
+diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
+index 126b3b2350f6..d906db21aa9c 100644
+--- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
++++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
+@@ -26,6 +26,10 @@
+ #include "LightSource.h"
+ #include <wtf/Ref.h>
+ 
++namespace WTF {
++class TextStream;
++} // namespace WTF
++
+ namespace WebCore {
+ 
+ class PointLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
+index 641b205f986d..64380d9b6eb8 100644
+--- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
++++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
+@@ -26,6 +26,10 @@
+ #include "LightSource.h"
+ #include <wtf/Ref.h>
+ 
++namespace WTF {
++class TextStream;
++} // namespace WTF
++
+ namespace WebCore {
+ 
+ class SpotLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
+index c974d92115ff..e2896660cfbd 100644
+--- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
++++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
+@@ -36,6 +36,7 @@
+ namespace WebCore {
+ 
+ class FELighting;
++struct FELightingPaintingDataForNeon;
+ 
+ class FELightingSoftwareApplier final : public FilterEffectConcreteApplier<FELighting> {
+     WTF_MAKE_FAST_ALLOCATED;
+@@ -132,8 +133,23 @@ private:
+ 
+     static void applyPlatformGenericPaint(const LightingData&, const LightSource::PaintingData&, int startY, int endY);
+     static void applyPlatformGenericWorker(ApplyParameters*);
++
++#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
++    static int getPowerCoefficients(float exponent);
++    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
++    inline static void applyPlatformNeon(const LightingData&, const LightSource::PaintingData&);
++
++    inline static void applyPlatformGeneric(const LightingData& data, const LightSource::PaintingData& paintingData)
++    {
++        applyPlatformNeon(data, paintingData);
++    }
++#else
+     static void applyPlatformGeneric(const LightingData&, const LightSource::PaintingData&);
++#endif
++
+     static void applyPlatform(const LightingData&);
+ };
+ 
+ } // namespace WebCore
++
++#include "FELightingNEON.h"
+-- 
+2.37.3
+
diff --git a/package/webkitgtk/0002-WPE-GTK-ExtensionsGLOpenGLES.cpp-uses-GLES3-symbols-.patch b/package/webkitgtk/0002-WPE-GTK-ExtensionsGLOpenGLES.cpp-uses-GLES3-symbols-.patch
new file mode 100644
index 0000000000..5ec595bbaf
--- /dev/null
+++ b/package/webkitgtk/0002-WPE-GTK-ExtensionsGLOpenGLES.cpp-uses-GLES3-symbols-.patch
@@ -0,0 +1,110 @@
+From 5a2536dee79f6bdb6a75b40f9a33f7c1ba6dda85 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Sun, 23 Apr 2023 23:44:51 +0300
+Subject: [PATCH] [WPE][GTK] ExtensionsGLOpenGLES.cpp uses GLES3 symbols
+ unconditionally in 2.38.x https://bugs.webkit.org/show_bug.cgi?id=255847
+
+Reviewed by NOBODY (OOPS!).
+
+EGLNativeWindowType can be aliased to a different type depending on the
+EGL implementation headers, and static_cast (or reinterpret_cast) may
+not always work. This is similar to 194561@main, but with the conversion
+being done in the opposite direction, therefore we apply the same
+solution using a C style cast expression, which works in all cases.
+
+For the build failures related to the usage of OpenGL ES 3 symbols, add
+the needed HAVE(OPENGL_3_ES) guards and avoid using GL_MAJOR_VERSION
+and instead parse the GL_VERSION string in a way similar as in the
+GLContext::version() function.
+
+* Source/WebCore/platform/graphics/egl/GLContextEGL.cpp:
+(WebCore::GLContextEGL::createWindowContext): Use a plain C cast expression.
+* Source/WebCore/platform/graphics/opengl/ExtensionsGLOpenGLES.cpp:
+(WebCore::ExtensionsGLOpenGLES::platformSupportsExtension): Apply
+HAVE(OPENGL_3_ES) guards, avoid using GL_MAJOR_VERSION.
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream: https://github.com/WebKit/WebKit/pull/13084
+---
+ .../platform/graphics/egl/GLContextEGL.cpp    |  5 +++-
+ .../graphics/opengl/ExtensionsGLOpenGLES.cpp  | 28 ++++++++++++++++---
+ 2 files changed, 28 insertions(+), 5 deletions(-)
+
+diff --git a/Source/WebCore/platform/graphics/egl/GLContextEGL.cpp b/Source/WebCore/platform/graphics/egl/GLContextEGL.cpp
+index 262b2fb90237..2b76c2974394 100644
+--- a/Source/WebCore/platform/graphics/egl/GLContextEGL.cpp
++++ b/Source/WebCore/platform/graphics/egl/GLContextEGL.cpp
+@@ -195,7 +195,10 @@ std::unique_ptr<GLContextEGL> GLContextEGL::createWindowContext(GLNativeWindowTy
+ 
+     if (surface == EGL_NO_SURFACE) {
+         RELEASE_LOG_INFO(Compositing, "Cannot create EGL window surface: %s. Retrying with fallback.", lastErrorString());
+-        surface = eglCreateWindowSurface(display, config, static_cast<EGLNativeWindowType>(window), nullptr);
++        // EGLNativeWindowType changes depending on the EGL implementation, reinterpret_cast
++        // would work for pointers, and static_cast for numeric types only; so use a plain
++        // C cast expression which works in all possible cases.
++        surface = eglCreateWindowSurface(display, config, (EGLNativeWindowType) window, nullptr);
+     }
+ 
+     if (surface == EGL_NO_SURFACE) {
+diff --git a/Source/WebCore/platform/graphics/opengl/ExtensionsGLOpenGLES.cpp b/Source/WebCore/platform/graphics/opengl/ExtensionsGLOpenGLES.cpp
+index 027da1081f5f..813a6f9be33a 100644
+--- a/Source/WebCore/platform/graphics/opengl/ExtensionsGLOpenGLES.cpp
++++ b/Source/WebCore/platform/graphics/opengl/ExtensionsGLOpenGLES.cpp
+@@ -40,6 +40,8 @@
+ #include <EGL/egl.h>
+ #endif
+ 
++#include <wtf/text/StringToIntegerConversion.h>
++
+ namespace WebCore {
+ 
+ ExtensionsGLOpenGLES::ExtensionsGLOpenGLES(GraphicsContextGLOpenGL* context, bool useIndexedGetString)
+@@ -253,23 +255,41 @@ void ExtensionsGLOpenGLES::vertexAttribDivisorANGLE(GCGLuint index, GCGLuint div
+ bool ExtensionsGLOpenGLES::platformSupportsExtension(const String& name)
+ {
+     if (name == "GL_ANGLE_instanced_arrays"_s) {
++#if HAVE(OPENGL_ES_3)
+         auto majorVersion = []() {
++            // Loosely inspired by GLContext::version()
+             GLint version = 0;
+-            ::glGetIntegerv(GL_MAJOR_VERSION, &version);
+-            return version;
+-        };
++            auto versionString = String::fromLatin1(reinterpret_cast<const char*>(::glGetString(GL_VERSION)));
++            Vector<String> versionStringComponents = versionString.split(' ');
+ 
++            Vector<String> versionDigits;
++            if (versionStringComponents[0] == "OpenGL"_s) {
++                // If the version string starts with "OpenGL" it can be GLES 1 or 2. In GLES1 version string starts
++                // with "OpenGL ES-<profile> major.minor" and in GLES2 with "OpenGL ES major.minor". Version is the
++                // third component in both cases.
++                versionDigits = versionStringComponents[2].split('.');
++            } else {
++                // Version is the first component. The version number is always "major.minor" or
++                // "major.minor.release". Ignore the release number.
++                versionDigits = versionStringComponents[0].split('.');
++            }
++            return parseIntegerAllowingTrailingJunk<GLint>(versionDigits[0]).value_or(0);
++        };
++#endif
+         if (m_availableExtensions.contains(name)) {
+             m_glVertexAttribDivisorANGLE = reinterpret_cast<PFNGLVERTEXATTRIBDIVISORANGLEPROC>(eglGetProcAddress("glVertexAttribDivisorANGLE"));
+             m_glDrawArraysInstancedANGLE = reinterpret_cast<PFNGLDRAWARRAYSINSTANCEDANGLEPROC >(eglGetProcAddress("glDrawArraysInstancedANGLE"));
+             m_glDrawElementsInstancedANGLE = reinterpret_cast<PFNGLDRAWELEMENTSINSTANCEDANGLEPROC >(eglGetProcAddress("glDrawElementsInstancedANGLE"));
+             m_supportsANGLEinstancedArrays = true;
+-        } else if (majorVersion() >= 3 || (m_availableExtensions.contains("GL_EXT_instanced_arrays"_s) && m_availableExtensions.contains("GL_EXT_draw_instanced"_s))) {
++        }
++#if HAVE(OPENGL_ES_3)
++        else if (majorVersion() >= 3 || (m_availableExtensions.contains("GL_EXT_instanced_arrays"_s) && m_availableExtensions.contains("GL_EXT_draw_instanced"_s))) {
+             m_glVertexAttribDivisorANGLE = ::glVertexAttribDivisor;
+             m_glDrawArraysInstancedANGLE = ::glDrawArraysInstanced;
+             m_glDrawElementsInstancedANGLE = ::glDrawElementsInstanced;
+             m_supportsANGLEinstancedArrays = true;
+         }
++#endif
+         return m_supportsANGLEinstancedArrays;
+     }
+     
+-- 
+2.40.0
+
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
