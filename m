Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC13C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 12:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 496AE61223;
	Fri, 16 Sep 2022 12:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 496AE61223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mc7K8VZlFhgM; Fri, 16 Sep 2022 12:24:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7756561028;
	Fri, 16 Sep 2022 12:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7756561028
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B15CA1C2744
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B53461220
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B53461220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xfaYrltTt2dr for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 12:23:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB66061028
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 12:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB66061028
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B74B183D11; Fri, 16 Sep 2022 12:23:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 14:20:58 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7bce3d6a97393772b4ed9da35fd3991977b7ec19
X-Git-Newrev: 3fa2a869740e365b1800146106f1e6f3d5e902a9
X-Patchwork-Hint: ignore
Message-Id: <20220916122350.B74B183D11@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/opencv4:
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3fa2a869740e365b1800146106f1e6f3d5e902a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Opencv4 library objdetect needs library dnn, otherwise it throws:
```
-- Module opencv_objdetect disabled because opencv_dnn dependency can't be resolved!
```
So let's "select BR2_PACKAGE_OPENCV4_LIB_DNN" if
BR2_PACKAGE_OPENCV4_LIB_OBJDETECT is enabled.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e229943785534e0884c62c7346a8c6df8d565e1e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv4/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 5b07f52ba1..88a7a01151 100644
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
