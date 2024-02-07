Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B127CC4829B
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 14:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B1768203B;
	Wed,  7 Feb 2024 14:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hbKqbCmnbTjr; Wed,  7 Feb 2024 14:54:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C8DD8142A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C8DD8142A;
	Wed,  7 Feb 2024 14:54:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D50BA1BF276
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAF7E41E84
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id erbuGp-ZmcxT for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 14:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF60841E77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF60841E77
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 14:54:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78E4A87599; Wed,  7 Feb 2024 14:54:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 15:52:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c721a583790ef9e35e2a974450bdcbc5662621c8
X-Git-Newrev: b553c9123b9fff5e7a97c19668bee20b15c1d736
X-Patchwork-Hint: ignore
Message-Id: <20240207145429.78E4A87599@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4: propagate internal
 dependencies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b553c9123b9fff5e7a97c19668bee20b15c1d736
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e22994378553 (package/opencv4: BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
requires BR2_PACKAGE_OPENCV4_LIB_DNN) forgot to propagate the dependency
to the internal stitching option, and to the contrib options dpm, face,
and xobjdetect, causing unmet dependencies warning (unfortunately, not
errors) such as:

    $ KCONFIG_SEED=0x9F66F854 make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
      Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y]
      Selected by [y]:
      - BR2_PACKAGE_OPENCV4_LIB_STITCHING [=y] && BR2_PACKAGE_OPENCV4 [=y]
      - BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT [=y] && BR2_PACKAGE_OPENCV4_CONTRIB [=y]

Propagate the dependencies.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv4-contrib/Config.in | 18 ++++++++++++++++++
 package/opencv4/Config.in         |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index 851241ce5e..951d5f71ad 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -95,18 +95,30 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DPM
 	bool "dpm"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Deformable Part Model -- Felzenszwalb's Cascade with
 	  deformable parts object recognition code.
 
+comment "dpm needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
+	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE
 	bool "face"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Face Recognition -- Face recognition techniques: Eigen, Fisher
 	  and Local Binary Pattern Histograms LBPH methods.
 
+comment "face needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
+	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FREETYPE
 	bool "freetype"
 	help
@@ -317,12 +329,18 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XIMGPROC
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT
 	bool "xobjdetect"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Boosted 2D Object Detection -- Uses a Waldboost cascade and
 	  local binary patterns computed as integral features for 2D
 	  object detection.
 
+comment "xobjdetect needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
+	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XPHOTO
 	bool "xphoto"
 	select BR2_PACKAGE_OPENCV4_LIB_PHOTO
diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 78ec7c2e41..f1a2d02d50 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -203,6 +203,8 @@ config BR2_PACKAGE_OPENCV4_LIB_SHAPE
 
 config BR2_PACKAGE_OPENCV4_LIB_STITCHING
 	bool "stitching"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # objdetect
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
@@ -211,6 +213,10 @@ config BR2_PACKAGE_OPENCV4_LIB_STITCHING
 	  Include opencv_stitching (images stitching) module into the
 	  OpenCV build.
 
+comment "stitching needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
+
 config BR2_PACKAGE_OPENCV4_LIB_SUPERRES
 	bool "superres"
 	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
