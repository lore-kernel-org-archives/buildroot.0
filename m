Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD4FC3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2A1370A20;
	Mon, 19 May 2025 10:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C9Q5IPZHj_lL; Mon, 19 May 2025 10:56:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3B6670A34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3B6670A34;
	Mon, 19 May 2025 10:56:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E07CE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A3FD41277
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7y8vfLLRLTMh for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E494A40EC8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E494A40EC8
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFA1A8348A; Mon, 19 May 2025 10:39:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Apr 2025 23:36:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f78280bf262ceb1c1abbdade9de77fcc4add74ae
X-Git-Newrev: d12d1a7f5ec00ef0f42855bb6edd04e8a95edce8
X-Patchwork-Hint: ignore
Message-Id: <20250519103956.DFA1A8348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcamera: fix crash
 on Rockchip with kernels before 6.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d12d1a7f5ec00ef0f42855bb6edd04e8a95edce8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libcamera migrated to use an ioctl for detecting frame sizes which is
only available in kernels 6.4 and later. If it doesn't exist, default
frame sizes are used. However the min and max resolutions supported by
the pipeline weren't initialized for kernels where that ioctl isn't
available and ended up creating invalid configuration that later
crashed.

The introducing commit was part of the v0.4.0 release.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...amera-rkisp1-Eliminate-hard-coded-resizer.patch | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/package/libcamera/0002-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch b/package/libcamera/0002-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch
new file mode 100644
index 0000000000..062736be77
--- /dev/null
+++ b/package/libcamera/0002-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
