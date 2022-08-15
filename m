Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC92BC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 12:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 546C581BA8;
	Mon, 15 Aug 2022 12:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 546C581BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LItaP7B4brNW; Mon, 15 Aug 2022 12:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 722A781AEA;
	Mon, 15 Aug 2022 12:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 722A781AEA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C63141BF3B9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A23CF40AF0
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A23CF40AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7iBMLeknjNki for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 12:34:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B57C40AEE
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B57C40AEE
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EB5EC8760E; Mon, 15 Aug 2022 12:19:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 14:29:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0d3c25cc8017e92dbdedf1a1dde6f4dc4408332
X-Git-Newrev: e229943785534e0884c62c7346a8c6df8d565e1e
X-Patchwork-Hint: ignore
Message-Id: <20220815121940.EB5EC8760E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4:
 BR2_PACKAGE_OPENCV4_LIB_OBJDETECT requires BR2_PACKAGE_OPENCV4_LIB_DNN
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

commit: https://git.buildroot.net/buildroot/commit/?id=e229943785534e0884c62c7346a8c6df8d565e1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Opencv4 library objdetect needs library dnn, otherwise it throws:
```
-- Module opencv_objdetect disabled because opencv_dnn dependency can't be resolved!
```
So let's "select BR2_PACKAGE_OPENCV4_LIB_DNN" if
BR2_PACKAGE_OPENCV4_LIB_OBJDETECT is enabled.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv4/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index eee0f999b9..286a7ebf9d 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -153,14 +153,21 @@ config BR2_PACKAGE_OPENCV4_LIB_ML
 
 config BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	bool "objdetect"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # dnn support
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # dnn support
 	# opencv_core dependency is already enabled
 	select BR2_PACKAGE_OPENCV4_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV4_LIB_DNN
 	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV4_LIB_ML
 	help
 	  Include opencv_objdetect (object detection) module into the
 	  OpenCV build.
 
+comment "objdetect needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
+
 config BR2_PACKAGE_OPENCV4_LIB_PHOTO
 	bool "photo"
 	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
