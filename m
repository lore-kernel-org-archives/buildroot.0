Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D22CC71157
	for <buildroot@archiver.kernel.org>; Sat, 21 Jun 2025 17:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB96E417C1;
	Sat, 21 Jun 2025 17:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Arcc9Zz0uZXo; Sat, 21 Jun 2025 17:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA31E4178E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA31E4178E;
	Sat, 21 Jun 2025 17:31:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B1EB154
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 17:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C88341754
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 17:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id molUBSRayn1N for <buildroot@buildroot.org>;
 Sat, 21 Jun 2025 17:31:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 293D240E54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 293D240E54
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 293D240E54
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 17:31:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b017.dip0.t-ipconnect.de [84.161.176.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36A50A4C0A6E;
 Sat, 21 Jun 2025 19:31:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51366)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uT23q-000000007x7-0i4i;
 Sat, 21 Jun 2025 17:31:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 21 Jun 2025 19:31:24 +0200
Message-Id: <20250621173125.4042686-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750527086;
 bh=IFHW3eo4q+CbCR6ha7T2q4dC4bd1+J0wKgvGut+dWsI=;
 h=From:To:Cc:Subject:Date:From;
 b=JCC3ppvSyenuz8ScBd8PgQFmHUaXW93CSBS9DGRVPVzywSRCtoKaMFBPt/POMuUAm
 iAPPKcx66FUV/u+FUlm+fVZWn71HjC0KT4kvkDb1CBeqbVdqOx5KNWsPkirW75G2mz
 w5QSG2D3epuFK7zzPXxMt0xx8cVszXLWFYnKJuC2BqoW/nmBckfqRL7X+7dN6sLUvu
 S0QtUoAuk9GRXo8SsuaRmxuMHPpBTX45UA7Cb8e0h4UIpmBzly1R5oPvXB7sWP2ibi
 lwmpcJpxOwxYwQYPa2F7vKa87Ckrhw2+K/HYDpXANPjitMfdD0v4TrJXEYpEL3NN1A
 8pDa1pg0OcpIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=JCC3ppvS
Subject: [Buildroot] [PATCH 1/2] package/libcamera: bump version to 0.5.1
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

Removed patches which are included in this release.

Release notes: https://git.linuxtv.org/libcamera.git/tag/?h=v0.5.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...omatically-build-documentation-if-sp.patch |  51 --------
 ...-rkisp1-Eliminate-hard-coded-resizer.patch | 113 ------------------
 package/libcamera/libcamera.hash              |   3 +-
 package/libcamera/libcamera.mk                |   2 +-
 4 files changed, 3 insertions(+), 166 deletions(-)
 delete mode 100644 package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
 delete mode 100644 package/libcamera/0002-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch

diff --git a/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch b/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
deleted file mode 100644
index c75ff1ce9d..0000000000
--- a/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ae2b6cb3cac6a38a6c96625915cea4b9cf3fc180 Mon Sep 17 00:00:00 2001
-From: Quentin Schulz <quentin.schulz@cherry.de>
-Date: Fri, 4 Apr 2025 18:12:35 +0200
-Subject: [PATCH] meson: Do not automatically build documentation if
- sphinx-build-3 is found
-
-Commit aba567338b25 ("Documentation: Move all dependencies into
-features") did an incomplete migration of the documentation boolean
-option into a documentation feature.
-
-If sphinx-build-3 binary is found on the host system, the documentation
-is built, regardless of the value of the feature option.
-
-This makes sure that sphinx-build-3 presence is only checked if the
-documentation feature is not disabled (which is the default, as it's
-"auto" by default).
-
-This is essential for reproducibility for build systems where
-sphinx-build-3 may or may not be present when libcamera is built, and
-also to declutter the generated package if documentation isn't desired.
-
-Fixes: aba567338b25 ("Documentation: Move all dependencies into features")
-Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
-Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
-Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
-Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
-Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-Upstream: https://git.libcamera.org/libcamera/libcamera.git/commit/?id=ae2b6cb3cac6a38a6c96625915cea4b9cf3fc180
-Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
----
- Documentation/meson.build | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/Documentation/meson.build b/Documentation/meson.build
-index 6158320e..0fc5909d 100644
---- a/Documentation/meson.build
-+++ b/Documentation/meson.build
-@@ -116,10 +116,8 @@ endif
- # Sphinx
- #
- 
--sphinx = find_program('sphinx-build-3', required : false)
--if not sphinx.found()
--    sphinx = find_program('sphinx-build', required : get_option('documentation'))
--endif
-+sphinx = find_program('sphinx-build-3', 'sphinx-build',
-+                      required : get_option('documentation'))
- 
- if sphinx.found()
-     docs_sources = [
diff --git a/package/libcamera/0002-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch b/package/libcamera/0002-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch
deleted file mode 100644
index 062736be77..0000000000
--- a/package/libcamera/0002-Revert-libcamera-rkisp1-Eliminate-hard-coded-resizer.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 6e24360d3fc91cbeecb4f5cf432cd194bc098618 Mon Sep 17 00:00:00 2001
-From: Quentin Schulz <quentin.schulz@cherry.de>
-Date: Thu, 3 Apr 2025 20:09:00 +0200
-Subject: [PATCH] Revert "libcamera: rkisp1: Eliminate hard-coded resizer
- limits"
-
-This reverts commit e85c7ddd38ce8456ab01c2a73baf9e788f6a462e.
-
-Linux kernel predating 6.4 (specifically commit 7cfb35d3a800 ("media:
-rkisp1: Implement ENUM_FRAMESIZES") do not have the ioctl in rkisp1
-driver required to dynamically query the resizer limits.
-
-Because of that, maxResolution and minResolution are both {0, 0}
-(default value for Size objects) which means filterSensorResolution()
-will create an entry for the sensor in sensorSizesMap_ but because the
-sensor resolution cannot fit inside the min and max resolution of the
-rkisp1, no size is put into this entry in sensorSizesMap_.
-On the next call to filterSensorResolution(),
-sensorSizesMap_.find(sensor) will return the entry but when attempting
-to call back() on iter->second, it'll trigger an assert because the size
-array is empty.
-
-Linux kernel 6.1 is supported until December 2027, so it seems premature
-to get rid of those hard-coded resizer limits before this happens.
-
-Let's restore the hard-coded resizer limits as fallbacks, actual limits
-are still queried from the driver on recent enough kernels.
-
-Fixes: 761545407c76 ("pipeline: rkisp1: Filter out sensor sizes not supported by the pipeline")
-Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
-Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
-Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-Upstream: https://git.libcamera.org/libcamera/libcamera.git/commit/?id=6e24360d3fc91cbeecb4f5cf432cd194bc098618
-Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
----
- src/libcamera/pipeline/rkisp1/rkisp1_path.cpp | 21 +++++++++++++------
- src/libcamera/pipeline/rkisp1/rkisp1_path.h   |  3 ++-
- 2 files changed, 17 insertions(+), 7 deletions(-)
-
-diff --git a/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp b/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp
-index eee5b09e..64018dc5 100644
---- a/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp
-+++ b/src/libcamera/pipeline/rkisp1/rkisp1_path.cpp
-@@ -54,8 +54,11 @@ const std::map<PixelFormat, uint32_t> formatToMediaBus = {
- 
- } /* namespace */
- 
--RkISP1Path::RkISP1Path(const char *name, const Span<const PixelFormat> &formats)
--	: name_(name), running_(false), formats_(formats), link_(nullptr)
-+RkISP1Path::RkISP1Path(const char *name, const Span<const PixelFormat> &formats,
-+		       const Size &minResolution, const Size &maxResolution)
-+	: name_(name), running_(false), formats_(formats),
-+	  minResolution_(minResolution), maxResolution_(maxResolution),
-+	  link_(nullptr)
- {
- }
- 
-@@ -517,10 +520,12 @@ void RkISP1Path::stop()
- }
- 
- /*
-- * \todo Remove the hardcoded formats once all users will have migrated to a
-- * recent enough kernel.
-+ * \todo Remove the hardcoded resolutions and formats once kernels older than
-+ * v6.4 will stop receiving LTS support (scheduled for December 2027 for v6.1).
-  */
- namespace {
-+constexpr Size RKISP1_RSZ_MP_SRC_MIN{ 32, 16 };
-+constexpr Size RKISP1_RSZ_MP_SRC_MAX{ 4416, 3312 };
- constexpr std::array<PixelFormat, 18> RKISP1_RSZ_MP_FORMATS{
- 	formats::YUYV,
- 	formats::NV16,
-@@ -542,6 +547,8 @@ constexpr std::array<PixelFormat, 18> RKISP1_RSZ_MP_FORMATS{
- 	formats::SRGGB12,
- };
- 
-+constexpr Size RKISP1_RSZ_SP_SRC_MIN{ 32, 16 };
-+constexpr Size RKISP1_RSZ_SP_SRC_MAX{ 1920, 1920 };
- constexpr std::array<PixelFormat, 8> RKISP1_RSZ_SP_FORMATS{
- 	formats::YUYV,
- 	formats::NV16,
-@@ -555,12 +562,14 @@ constexpr std::array<PixelFormat, 8> RKISP1_RSZ_SP_FORMATS{
- } /* namespace */
- 
- RkISP1MainPath::RkISP1MainPath()
--	: RkISP1Path("main", RKISP1_RSZ_MP_FORMATS)
-+	: RkISP1Path("main", RKISP1_RSZ_MP_FORMATS,
-+		     RKISP1_RSZ_MP_SRC_MIN, RKISP1_RSZ_MP_SRC_MAX)
- {
- }
- 
- RkISP1SelfPath::RkISP1SelfPath()
--	: RkISP1Path("self", RKISP1_RSZ_SP_FORMATS)
-+	: RkISP1Path("self", RKISP1_RSZ_SP_FORMATS,
-+		     RKISP1_RSZ_SP_SRC_MIN, RKISP1_RSZ_SP_SRC_MAX)
- {
- }
- 
-diff --git a/src/libcamera/pipeline/rkisp1/rkisp1_path.h b/src/libcamera/pipeline/rkisp1/rkisp1_path.h
-index 2a1ef0ab..430181d3 100644
---- a/src/libcamera/pipeline/rkisp1/rkisp1_path.h
-+++ b/src/libcamera/pipeline/rkisp1/rkisp1_path.h
-@@ -34,7 +34,8 @@ struct V4L2SubdeviceFormat;
- class RkISP1Path
- {
- public:
--	RkISP1Path(const char *name, const Span<const PixelFormat> &formats);
-+	RkISP1Path(const char *name, const Span<const PixelFormat> &formats,
-+		   const Size &minResolution, const Size &maxResolution);
- 
- 	bool init(MediaDevice *media);
- 
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 9f897e023f..bbec9c517d 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,5 @@
-sha256  cea3b5eebc01aa97930ae64989447ca00bad42ff1e0ce71d90d337650dd9e374  libcamera-v0.5.0-git4.tar.gz
+# Locally computed
+sha256  ee2c7086b3c08133bba44856fb9b2ffd1132532150d14da7daecd99ab8a566c2  libcamera-v0.5.1-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 1cd7a22952..a2ff3284d7 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.5.0
+LIBCAMERA_VERSION = v0.5.1
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
