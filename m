Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93574C369A1
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 16:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AE24608D5;
	Fri,  4 Apr 2025 16:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKcQEQwiCryU; Fri,  4 Apr 2025 16:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D2DE608B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D2DE608B1;
	Fri,  4 Apr 2025 16:48:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83C711C7
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7545642021
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FE9JwSplzg5p for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 16:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.13;
 helo=smtp-190d.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A70B41E92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A70B41E92
Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch
 [185.125.25.13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A70B41E92
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:12 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZTl0V1yR3zxQ2;
 Fri,  4 Apr 2025 18:48:10 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZTl0T5mK3zhkc; Fri,  4 Apr 2025 18:48:09 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 04 Apr 2025 18:47:34 +0200
MIME-Version: 1.0
Message-Id: <20250404-libcamera-0-5-0-v1-3-e2ca9d029aeb@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
In-Reply-To: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 3/9] package/libcamera: fix crash on Rockchip
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
 ...amera-rkisp1-Eliminate-hard-coded-resizer.patch | 110 +++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/package/libcamera/0001-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch b/package/libcamera/0001-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch
new file mode 100644
index 0000000000000000000000000000000000000000..7013ae30c7dace1ad43d236a204f0096d8cec3a5
--- /dev/null
+++ b/package/libcamera/0001-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch
@@ -0,0 +1,110 @@
+From 3aa2a8f15f619df7c12339464fb6e5aca7af4de7 Mon Sep 17 00:00:00 2001
+From: Quentin Schulz <quentin.schulz@cherry.de>
+Date: Thu, 3 Apr 2025 17:19:23 +0200
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
+Let's keep the hard-coded resizer limits by default, they can still be
+queried if necessary.
+
+Fixes: 761545407c76 ("pipeline: rkisp1: Filter out sensor sizes not supported by the pipeline")
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+Upstream: https://lists.libcamera.org/pipermail/libcamera-devel/2025-April/049691.html
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+---
+ src/libcamera/pipeline/rkisp1/rkisp1_path.cpp | 21 +++++++++++++------
+ src/libcamera/pipeline/rkisp1/rkisp1_path.h   |  3 ++-
+ 2 files changed, 17 insertions(+), 7 deletions(-)
+
+diff --git a/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp b/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp
+index eee5b09e..d43f31e1 100644
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
++ * \todo Remove the hardcoded resolutions and formats once all users will have
++ * migrated to a recent enough kernel.
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

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
