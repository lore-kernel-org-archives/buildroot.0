Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84183C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 11:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ABF960BD6;
	Tue, 22 Apr 2025 11:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWPvgm-2dUJr; Tue, 22 Apr 2025 11:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0665760D65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0665760D65;
	Tue, 22 Apr 2025 11:20:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC28F68
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDC36817B0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOVOmUDoOFRe for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 11:20:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.9;
 helo=smtp-bc09.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90C418179C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90C418179C
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch
 [45.157.188.9])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90C418179C
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:20:09 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10:40ca:feff:fe05:0])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Zhfhj4Y9YzSWN;
 Tue, 22 Apr 2025 13:12:21 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4Zhfhh71fzzBV2; Tue, 22 Apr 2025 13:12:20 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Tue, 22 Apr 2025 13:12:06 +0200
MIME-Version: 1.0
Message-Id: <20250422-libcamera-pre-linux-6-4-v2-1-5c06ba2426ab@cherry.de>
X-B4-Tracking: v=1; b=H4sIAIV5B2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMj3ZzMpOTE3NSiRN2ColQgL6+0QtdM10TX3MLQ2NQk2SgxLdlSCag
 bKJuWWQE2OTq2thYAXo33UWkAAAA=
X-Change-ID: 20250422-libcamera-pre-linux-6-4-781354c2afc9
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH v2] package/libcamera: fix crash on Rockchip
 with kernels before 6.4
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

From: Quentin Schulz <quentin.schulz@cherry.de>

libcamera migrated to use an ioctl for detecting frame sizes which is
only available in kernels 6.4 and later. If it doesn't exist, default
frame sizes are used. However the min and max resolutions supported by
the pipeline weren't initialized for kernels where that ioctl isn't
available and ended up creating invalid configuration that later
crashed.

The introducing commit was part of the v0.4.0 release.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- update patch with merged commit
- split into its own one-patch series
- Link to v1: https://lore.kernel.org/buildroot/e15073e3-c1db-480e-87d6-ea152c1e9392@cherry.de/
---
 ...amera-rkisp1-Eliminate-hard-coded-resizer.patch | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/package/libcamera/0001-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch b/package/libcamera/0001-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch
new file mode 100644
index 0000000000000000000000000000000000000000..062736be7707ea1b387a989f69f4da6f2f1b1924
--- /dev/null
+++ b/package/libcamera/0001-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch
@@ -0,0 +1,113 @@
+From 6e24360d3fc91cbeecb4f5cf432cd194bc098618 Mon Sep 17 00:00:00 2001
+From: Quentin Schulz <quentin.schulz@cherry.de>
+Date: Thu, 3 Apr 2025 20:09:00 +0200
+Subject: [PATCH] Revert "libcamera: rkisp1: Eliminate hard-coded resizer
+ limits"
+
+This reverts commit e85c7ddd38ce8456ab01c2a73baf9e788f6a462e.
+
+Linux kernel predating 6.4 (specifically commit 7cfb35d3a800 ("media:
+rkisp1: Implement ENUM_FRAMESIZES") do not have the ioctl in rkisp1
+driver required to dynamically query the resizer limits.
+
+Because of that, maxResolution and minResolution are both {0, 0}
+(default value for Size objects) which means filterSensorResolution()
+will create an entry for the sensor in sensorSizesMap_ but because the
+sensor resolution cannot fit inside the min and max resolution of the
+rkisp1, no size is put into this entry in sensorSizesMap_.
+On the next call to filterSensorResolution(),
+sensorSizesMap_.find(sensor) will return the entry but when attempting
+to call back() on iter->second, it'll trigger an assert because the size
+array is empty.
+
+Linux kernel 6.1 is supported until December 2027, so it seems premature
+to get rid of those hard-coded resizer limits before this happens.
+
+Let's restore the hard-coded resizer limits as fallbacks, actual limits
+are still queried from the driver on recent enough kernels.
+
+Fixes: 761545407c76 ("pipeline: rkisp1: Filter out sensor sizes not supported by the pipeline")
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+Upstream: https://git.libcamera.org/libcamera/libcamera.git/commit/?id=6e24360d3fc91cbeecb4f5cf432cd194bc098618
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+---
+ src/libcamera/pipeline/rkisp1/rkisp1_path.cpp | 21 +++++++++++++------
+ src/libcamera/pipeline/rkisp1/rkisp1_path.h   |  3 ++-
+ 2 files changed, 17 insertions(+), 7 deletions(-)
+
+diff --git a/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp b/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp
+index eee5b09e..64018dc5 100644
+--- a/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp
++++ b/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp
+@@ -54,8 +54,11 @@ const std::map<PixelFormat, uint32_t> formatToMediaBus = {
+ 
+ } /* namespace */
+ 
+-RkISP1Path::RkISP1Path(const char *name, const Span<const PixelFormat> &formats)
+-	: name_(name), running_(false), formats_(formats), link_(nullptr)
++RkISP1Path::RkISP1Path(const char *name, const Span<const PixelFormat> &formats,
++		       const Size &minResolution, const Size &maxResolution)
++	: name_(name), running_(false), formats_(formats),
++	  minResolution_(minResolution), maxResolution_(maxResolution),
++	  link_(nullptr)
+ {
+ }
+ 
+@@ -517,10 +520,12 @@ void RkISP1Path::stop()
+ }
+ 
+ /*
+- * \todo Remove the hardcoded formats once all users will have migrated to a
+- * recent enough kernel.
++ * \todo Remove the hardcoded resolutions and formats once kernels older than
++ * v6.4 will stop receiving LTS support (scheduled for December 2027 for v6.1).
+  */
+ namespace {
++constexpr Size RKISP1_RSZ_MP_SRC_MIN{ 32, 16 };
++constexpr Size RKISP1_RSZ_MP_SRC_MAX{ 4416, 3312 };
+ constexpr std::array<PixelFormat, 18> RKISP1_RSZ_MP_FORMATS{
+ 	formats::YUYV,
+ 	formats::NV16,
+@@ -542,6 +547,8 @@ constexpr std::array<PixelFormat, 18> RKISP1_RSZ_MP_FORMATS{
+ 	formats::SRGGB12,
+ };
+ 
++constexpr Size RKISP1_RSZ_SP_SRC_MIN{ 32, 16 };
++constexpr Size RKISP1_RSZ_SP_SRC_MAX{ 1920, 1920 };
+ constexpr std::array<PixelFormat, 8> RKISP1_RSZ_SP_FORMATS{
+ 	formats::YUYV,
+ 	formats::NV16,
+@@ -555,12 +562,14 @@ constexpr std::array<PixelFormat, 8> RKISP1_RSZ_SP_FORMATS{
+ } /* namespace */
+ 
+ RkISP1MainPath::RkISP1MainPath()
+-	: RkISP1Path("main", RKISP1_RSZ_MP_FORMATS)
++	: RkISP1Path("main", RKISP1_RSZ_MP_FORMATS,
++		     RKISP1_RSZ_MP_SRC_MIN, RKISP1_RSZ_MP_SRC_MAX)
+ {
+ }
+ 
+ RkISP1SelfPath::RkISP1SelfPath()
+-	: RkISP1Path("self", RKISP1_RSZ_SP_FORMATS)
++	: RkISP1Path("self", RKISP1_RSZ_SP_FORMATS,
++		     RKISP1_RSZ_SP_SRC_MIN, RKISP1_RSZ_SP_SRC_MAX)
+ {
+ }
+ 
+diff --git a/src/libcamera/pipeline/rkisp1/rkisp1_path.h b/src/libcamera/pipeline/rkisp1/rkisp1_path.h
+index 2a1ef0ab..430181d3 100644
+--- a/src/libcamera/pipeline/rkisp1/rkisp1_path.h
++++ b/src/libcamera/pipeline/rkisp1/rkisp1_path.h
+@@ -34,7 +34,8 @@ struct V4L2SubdeviceFormat;
+ class RkISP1Path
+ {
+ public:
+-	RkISP1Path(const char *name, const Span<const PixelFormat> &formats);
++	RkISP1Path(const char *name, const Span<const PixelFormat> &formats,
++		   const Size &minResolution, const Size &maxResolution);
+ 
+ 	bool init(MediaDevice *media);
+ 

---
base-commit: 3ffdcc5b9db2a703259f900fdc8251c4e0d14dfb
change-id: 20250422-libcamera-pre-linux-6-4-781354c2afc9

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
