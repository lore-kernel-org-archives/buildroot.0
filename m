Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1911EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD20418C1;
	Sat, 23 Apr 2022 16:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KXfDur4n4wA8; Sat, 23 Apr 2022 16:33:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69A37417CA;
	Sat, 23 Apr 2022 16:33:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 746AB1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F97A4060F
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLdin7umKmrp for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:32:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6B4E4048A
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:32:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4F3207FB06; Sat, 23 Apr 2022 16:22:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 18:15:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26470f64109326037f521e2cfa2c2a3c0fe5cedb
X-Git-Newrev: cc10bd5777af492b786c7d6c7fc917b855c6b7d8
X-Patchwork-Hint: ignore
Message-Id: <20220423162249.4F3207FB06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4: fix uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc10bd5777af492b786c7d6c7fc917b855c6b7d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add BR2_PACKAGE_OPENCV4_LIB_DNN to fix the following uclibc build
failure raised since bump to version 4.5.5 in commit
b6922313937712a89841b58d3b355edd53754bca and
https://github.com/opencv/opencv/commit/1feb3838b51c0b27b0f3e64f02358ff5ef3111b8:

/home/giuliobenetti/autobuild/run/instance-3/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp: In member function 'float cv::dnn::RoundFunctor::calculate(float) const':
/home/giuliobenetti/autobuild/run/instance-3/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp:1260:43: error: 'fegetround' is not a member of 'std'
 1260 |         int old_rounding_direction = std::fegetround();
      |                                           ^~~~~~~~~~
/home/peko/autobuild/instance-0/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp:1261:14: error: 'fesetround' is not a member of 'std'
 1261 |         std::fesetround(FE_TONEAREST);
      |              ^~~~~~~~~~
/home/peko/autobuild/instance-0/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp:1261:25: error: 'FE_TONEAREST' was not declared in this scope
 1261 |         std::fesetround(FE_TONEAREST);
      |                         ^~~~~~~~~~~~

Indeed, uclibc pretends to implement fenv but it raises build failures
on numerous architectures (or1k, sh4, xtensa, mipsel, arm, arc, riscv64,
etc.)

Fixes:
 - http://autobuild.buildroot.org/results/a6dd3c10acfbf6bc1af867d770cf0ce926c6ce84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/opencv4/Config.in  | 11 +++++++++++
 package/opencv4/opencv4.mk |  1 +
 2 files changed, 12 insertions(+)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 23d34a9d22..a61a106952 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -30,6 +30,17 @@ config BR2_PACKAGE_OPENCV4_LIB_CALIB3D
 	  Include opencv_calib3d (camera calibration and 3d
 	  reconstruction) module into the OpenCV build.
 
+config BR2_PACKAGE_OPENCV4_LIB_DNN
+	bool "dnn"
+	# dnn needs fenv.h which is not provided by uclibc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	help
+	  Include opencv_dnn (Deep Neural Networks) module into the
+	  OpenCV build.
+
+comment "dnn needs a glibc or musl toolchain"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
+
 config BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
 	bool "features2d"
 	select BR2_PACKAGE_OPENCV4_LIB_FLANN
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 0563026b18..84e0487dc4 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -92,6 +92,7 @@ OPENCV4_CONF_OPTS += \
 	-DBUILD_opencv_apps=OFF \
 	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV4_LIB_CALIB3D),ON,OFF) \
 	-DBUILD_opencv_core=ON \
+	-DBUILD_opencv_dnn=$(if $(BR2_PACKAGE_OPENCV4_LIB_DNN),ON,OFF) \
 	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV4_LIB_FEATURES2D),ON,OFF) \
 	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV4_LIB_FLANN),ON,OFF) \
 	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI),ON,OFF) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
