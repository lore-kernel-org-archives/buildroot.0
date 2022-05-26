Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC20C433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D0A6142A;
	Thu, 26 May 2022 08:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vMbOdjL1hmGK; Thu, 26 May 2022 08:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D955A61311;
	Thu, 26 May 2022 08:47:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 560CE1BF3D9
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46732408AB
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vt-UUWjUqlTR for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:46:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2610640598
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7B2D78652D; Thu, 26 May 2022 08:35:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 10:33:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c2dd57638b07645ac9143609cce51921e0ffffea
X-Git-Newrev: 7604702d44c3a76b961fd46169e37e508cf107da
X-Patchwork-Hint: ignore
Message-Id: <20220526083517.7B2D78652D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/opencv4: fix
 uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=7604702d44c3a76b961fd46169e37e508cf107da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit cc10bd5777af492b786c7d6c7fc917b855c6b7d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv4/Config.in  | 11 +++++++++++
 package/opencv4/opencv4.mk |  1 +
 2 files changed, 12 insertions(+)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 31c32385da..d7a391a40a 100644
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
index e75f7144de..619bfd9dbc 100644
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
