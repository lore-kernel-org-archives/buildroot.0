Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6FDC54E68
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 422EB41528;
	Sat, 16 Mar 2024 22:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJnA9Hz3GKYR; Sat, 16 Mar 2024 22:35:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E46E8417AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E46E8417AA;
	Sat, 16 Mar 2024 22:34:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F187D1BF3D5
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCE4E81EF3
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M7HBx977VZAf for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78A8E81F05
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78A8E81F05
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:34:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6640B825BA; Sat, 16 Mar 2024 22:34:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 23:29:44 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 05d22772de38b4d6a92212dd9ecd2440525d7dfd
X-Git-Newrev: 4bad2fb2aa03cd7b0f77f10dfbbf223c55efb76d
X-Patchwork-Hint: ignore
Message-Id: <20240316223440.6640B825BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/wpewebkit: update
 ARM NEON patch for 2.42.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=4bad2fb2aa03cd7b0f77f10dfbbf223c55efb76d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Update patch to compile correctly with newer versions of GCC, which
has gotten stricter about the placement of the alignas() attribute.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[yann.morin.1998@free.fr: update .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9a7a7f3d1392d34a14acc7739525dc7fc13920d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |   1 -
 ...NEON.cpp-fails-to-build-NEON-fast-path-se.patch | 105 +++++++++++----------
 2 files changed, 57 insertions(+), 49 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index aca0984b8e..5e36db5950 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1442,7 +1442,6 @@ package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patc
 package/woff2/0001-CMake-Handle-multiple-libraries-being-returned-for-B.patch Upstream
 package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch Upstream
 package/wpa_supplicant/ifupdown.sh Shellcheck
-package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch Upstream
 package/x11r7/xapp_luit/0001-posix-openpt.patch Upstream
 package/x11r7/xapp_xdm/S99xdm Indent Variables
 package/x11r7/xcursor-transparent-theme/0001-fix-symlink.patch Upstream
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
