Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CECC48297
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 14:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7536940144;
	Mon, 12 Feb 2024 14:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5d4Q_bLP09u; Mon, 12 Feb 2024 14:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75EBF401A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75EBF401A4;
	Mon, 12 Feb 2024 14:32:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B92AA1BF28F
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 14:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2667415B7
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 14:32:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoaEfFn_4EOO for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 14:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA0D341559
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA0D341559
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA0D341559
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 14:32:28 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rZXM9-00GWZJ-1U; Mon, 12 Feb 2024 15:32:25 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id e3fdf137;
 Mon, 12 Feb 2024 14:32:23 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 16:32:19 +0200
Message-ID: <20240212143222.1555220-3-aperez@igalia.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240212143222.1555220-1-aperez@igalia.com>
References: <20240212143222.1555220-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DW8cKlzLmKJZ0UPmv7BNToCyp7tvSaV1WOqVW2vfvYw=; b=CURC4OreUOE6ziAAHgxAwSTfKm
 KLyYevYuVOvzdOcZY8987oXWv8opM1/qx8OWn/VmcIN1fr84Uhr4gvJAumYk/bJ4hY47OQ7J+7kOQ
 UVk7sV+qks3H9/VzoZUxc4fy/hLjAWhPZbtjTb/Uikp+QJfNUIszrbsv5oMXcv6ft7k4xXxLlzP1F
 uaVHB9Zn28Kplce3U3nJQJyLuW9AaCvJwmnB8SdW/T/zEqHx+WgjpKvzI0z5q+1Ejs+rSdgQjxDlF
 1k1dEfPGnKlOwq2PM/d8QZOhyj8LZNtrFx3juh/Rtj2azl126ssYtd9nytZaa0QpqFZ+p0UACZWTs
 1t7fIACA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=CURC4Ore
Subject: [Buildroot] [PATCH 2/2] package/wpewebkit: update ARM NEON patch
 for 2.42.x
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

Update patch to compile correctly with newer versions of GCC, which
has gotten stricter about the placement of the alignas() attribute.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...cpp-fails-to-build-NEON-fast-path-se.patch | 105 ++++++++++--------
 1 file changed, 57 insertions(+), 48 deletions(-)

diff --git a/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch b/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
index ea1676abb6..17d4957657 100644
--- a/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
+++ b/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
@@ -1,4 +1,4 @@
-From da159b0150cba0e5e5251e4cc6a090440f73cb7c Mon Sep 17 00:00:00 2001
+From 5ba2d275457c4fdf1efdcca8351792400bda5679 Mon Sep 17 00:00:00 2001
 From: Adrian Perez de Castro <aperez@igalia.com>
 Date: Thu, 2 Jun 2022 11:19:06 +0300
 Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
@@ -33,38 +33,47 @@ left for a follow-up fix.
 * Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
 
 Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Upstream status: https://bugs.webkit.org/show_bug.cgi?id=241182]
+Upstream: https://bugs.webkit.org/show_bug.cgi?id=241182
 ---
  Source/WebCore/Sources.txt                    |  1 +
- .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
+ .../cpu/arm/filters/FELightingNEON.cpp        |  6 +--
  .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
  .../graphics/filters/DistantLightSource.h     |  4 ++
  .../platform/graphics/filters/FELighting.h    |  7 ---
  .../graphics/filters/PointLightSource.h       |  4 ++
  .../graphics/filters/SpotLightSource.h        |  4 ++
  .../software/FELightingSoftwareApplier.h      | 16 ++++++
- 8 files changed, 58 insertions(+), 36 deletions(-)
+ 8 files changed, 59 insertions(+), 37 deletions(-)
 
 diff --git a/Source/WebCore/Sources.txt b/Source/WebCore/Sources.txt
-index 8ce3510fe1a8..efd56bcb8746 100644
+index 9ca28a7b2bc0..ed2c7f9f41ee 100644
 --- a/Source/WebCore/Sources.txt
 +++ b/Source/WebCore/Sources.txt
-@@ -2136,6 +2136,7 @@ platform/graphics/WebMResourceClient.cpp
- platform/graphics/WOFFFileFormat.cpp
- platform/graphics/WidthIterator.cpp
+@@ -2303,6 +2303,7 @@ platform/graphics/controls/MeterPart.cpp
+ platform/graphics/controls/ProgressBarPart.cpp
+ platform/graphics/controls/SliderTrackPart.cpp
  platform/graphics/cpu/arm/filters/FEBlendNeonApplier.cpp
 +platform/graphics/cpu/arm/filters/FELightingNEON.cpp
  platform/graphics/displaylists/DisplayList.cpp
  platform/graphics/displaylists/DisplayListDrawingContext.cpp
  platform/graphics/displaylists/DisplayListItems.cpp
 diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
-index f6ff8c20a5a8..42a97ffc5372 100644
+index f6ff8c20a5a8..dced3d55eb4e 100644
 --- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
 +++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
+@@ -35,7 +35,7 @@ namespace WebCore {
+ //   ALPHAX_Q ALPHAY_Q REMAPX_D REMAPY_D
+
+
+-static alignas(16) short s_FELightingConstantsForNeon[] = {
++alignas(16) static short s_FELightingConstantsForNeon[] = {
+     // Alpha coefficients.
+     -2, 1, 0, -1, 2, 1, 0, -1,
+     0, -1, -2, -1, 0, 1, 2, 1,
 @@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
      return s_FELightingConstantsForNeon;
  }
- 
+
 -void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
 +void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
  {
@@ -73,26 +82,26 @@ index f6ff8c20a5a8..42a97ffc5372 100644
 @@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
      "b .lightStrengthCalculated" NL
  ); // NOLINT
- 
+
 -int FELighting::getPowerCoefficients(float exponent)
 +int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
  {
      // Calling a powf function from the assembly code would require to save
      // and reload a lot of NEON registers. Since the base is in range [0..1]
 diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-index b17c603d40d3..c6d17f573eca 100644
+index b17c603d40d3..fd23e31cce29 100644
 --- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
 +++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
 @@ -24,14 +24,15 @@
   * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
   */
- 
+
 -#ifndef FELightingNEON_h
 -#define FELightingNEON_h
 +#pragma once
- 
+
  #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
- 
+
 -#include "FELighting.h"
 +#include "FELightingSoftwareApplier.h"
 +#include "ImageBuffer.h"
@@ -100,19 +109,19 @@ index b17c603d40d3..c6d17f573eca 100644
  #include "SpotLightSource.h"
 +#include <wtf/ObjectIdentifier.h>
  #include <wtf/ParallelJobs.h>
- 
+
  namespace WebCore {
 @@ -93,14 +94,14 @@ extern "C" {
  void neonDrawLighting(FELightingPaintingDataForNeon*);
  }
- 
+
 -inline void FELighting::platformApplyNeon(const LightingData& data, const LightSource::PaintingData& paintingData)
 +inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData& data, const LightSource::PaintingData& paintingData)
  {
 -    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
 -    FELightingPaintingDataForNeon neonData = {
 -        data.pixels->data(),
-+    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
++    alignas(16) WebCore::FELightingFloatArgumentsForNeon floatArguments;
 +    WebCore::FELightingPaintingDataForNeon neonData = {
 +        data.pixels->bytes(),
          1,
@@ -126,15 +135,15 @@ index b17c603d40d3..c6d17f573eca 100644
 @@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
      // Set light source arguments.
      floatArguments.constOne = 1;
- 
+
 -    auto color = m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
 +    auto color = data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
- 
+
      floatArguments.colorRed = color.red;
      floatArguments.colorGreen = color.green;
      floatArguments.colorBlue = color.blue;
      floatArguments.padding4 = 0;
- 
+
 -    if (m_lightSource->type() == LS_POINT) {
 +    if (data.lightSource->type() == LS_POINT) {
          neonData.flags |= FLAG_POINT_LIGHT;
@@ -181,7 +190,7 @@ index b17c603d40d3..c6d17f573eca 100644
      }
      if (floatArguments.diffuseConstant == 1)
          neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
- 
+
 -    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
 +    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
 +    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
@@ -189,7 +198,7 @@ index b17c603d40d3..c6d17f573eca 100644
          // Initialize parallel jobs
 -        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
 +        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
- 
+
          // Fill the parameter array
          int job = parallelJobs.numberOfJobs();
          if (job > 1) {
@@ -213,42 +222,42 @@ index b17c603d40d3..c6d17f573eca 100644
              return;
 @@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
  } // namespace WebCore
- 
+
  #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
 -
 -#endif // FELightingNEON_h
 diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-index 0660143fc1cf..2b1e86d99fa4 100644
+index 70f583b36e2c..7d5d27e5ccf8 100644
 --- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-@@ -25,6 +25,10 @@
- #include "LightSource.h"
+@@ -26,6 +26,10 @@
+ #include <wtf/ArgumentCoder.h>
  #include <wtf/Ref.h>
- 
+
 +namespace WTF {
 +class TextStream;
 +} // namespace WTF
 +
  namespace WebCore {
- 
+
  class DistantLightSource : public LightSource {
 diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
-index 0c073bc13f8c..e0db00545c17 100644
+index 179edf6dba24..694d712d56fd 100644
 --- a/Source/WebCore/platform/graphics/filters/FELighting.h
 +++ b/Source/WebCore/platform/graphics/filters/FELighting.h
 @@ -35,8 +35,6 @@
- 
+
  namespace WebCore {
- 
+
 -struct FELightingPaintingDataForNeon;
 -
  class FELighting : public FilterEffect {
  public:
-     const Color& lightingColor() const { return m_lightingColor; }
-@@ -67,11 +65,6 @@ protected:
- 
+     bool operator==(const FELighting&) const;
+@@ -68,11 +66,6 @@ protected:
+
      std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
- 
+
 -#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
 -    static int getPowerCoefficients(float exponent);
 -    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
@@ -258,34 +267,34 @@ index 0c073bc13f8c..e0db00545c17 100644
      float m_surfaceScale;
      float m_diffuseConstant;
 diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-index 126b3b2350f6..d906db21aa9c 100644
+index a8cfdab895a9..34f867bba237 100644
 --- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
 @@ -26,6 +26,10 @@
  #include "LightSource.h"
  #include <wtf/Ref.h>
- 
+
 +namespace WTF {
 +class TextStream;
 +} // namespace WTF
 +
  namespace WebCore {
- 
+
  class PointLightSource : public LightSource {
 diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-index 641b205f986d..64380d9b6eb8 100644
+index 6404467a5b6f..5cac38f22362 100644
 --- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 @@ -26,6 +26,10 @@
  #include "LightSource.h"
  #include <wtf/Ref.h>
- 
+
 +namespace WTF {
 +class TextStream;
 +} // namespace WTF
 +
  namespace WebCore {
- 
+
  class SpotLightSource : public LightSource {
 diff --git a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
 index c974d92115ff..e2896660cfbd 100644
@@ -293,14 +302,14 @@ index c974d92115ff..e2896660cfbd 100644
 +++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
 @@ -36,6 +36,7 @@
  namespace WebCore {
- 
+
  class FELighting;
 +struct FELightingPaintingDataForNeon;
- 
+
  class FELightingSoftwareApplier final : public FilterEffectConcreteApplier<FELighting> {
      WTF_MAKE_FAST_ALLOCATED;
 @@ -132,8 +133,23 @@ private:
- 
+
      static void applyPlatformGenericPaint(const LightingData&, const LightSource::PaintingData&, int startY, int endY);
      static void applyPlatformGenericWorker(ApplyParameters*);
 +
@@ -319,10 +328,10 @@ index c974d92115ff..e2896660cfbd 100644
 +
      static void applyPlatform(const LightingData&);
  };
- 
+
  } // namespace WebCore
 +
 +#include "FELightingNEON.h"
--- 
-2.37.3
+--
+2.43.1
 
-- 
2.43.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
