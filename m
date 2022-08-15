Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB47C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 12:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D717760F76;
	Mon, 15 Aug 2022 12:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D717760F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2vwzhvgCBk1; Mon, 15 Aug 2022 12:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFF1B60D62;
	Mon, 15 Aug 2022 12:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFF1B60D62
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6871BF3B9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B27360D62
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B27360D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jWW3A7ssupF5 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 12:34:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 361C860590
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 361C860590
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E198887626; Mon, 15 Aug 2022 12:19:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 14:28:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dcaa20ca4adea12c9d5fbc6af5793f08fe81634
X-Git-Newrev: b0d3c25cc8017e92dbdedf1a1dde6f4dc4408332
X-Patchwork-Hint: ignore
Message-Id: <20220815121940.E198887626@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4:
 BR2_PACKAGE_OPENCV4_LIB_DNN requires protobuf
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0d3c25cc8017e92dbdedf1a1dde6f4dc4408332
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Opencv4 requires protobuf library otherwise it disables DNN:
```
if(NOT HAVE_PROTOBUF)
  ocv_module_disable(opencv_dnn)
endif()
```
https://github.com/opencv/opencv/blob/4.x/modules/dnn/CMakeLists.txt#L5-L7
So let's "select BR2_PACKAGE_OPENCV4_WITH_PROTOBUF" if
BR2_PACKAGE_OPENCV4_LIB_DNN is enabled.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv4/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index a61a106952..eee0f999b9 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -34,11 +34,14 @@ config BR2_PACKAGE_OPENCV4_LIB_DNN
 	bool "dnn"
 	# dnn needs fenv.h which is not provided by uclibc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	select BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
 	help
 	  Include opencv_dnn (Deep Neural Networks) module into the
 	  OpenCV build.
 
 comment "dnn needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
