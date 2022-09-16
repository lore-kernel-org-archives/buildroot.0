Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4D6ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 12:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 631C061232;
	Fri, 16 Sep 2022 12:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 631C061232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLBbii_blgGk; Fri, 16 Sep 2022 12:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82E8161223;
	Fri, 16 Sep 2022 12:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82E8161223
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AFC51BF2E5
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A43DA61028
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A43DA61028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bUqpMwrhjSi7 for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 12:23:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFD4961006
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 12:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFD4961006
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AD94E83D10; Fri, 16 Sep 2022 12:23:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 14:20:46 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6d29c8aeb185a37ec41da356e07af5520b0e8cb5
X-Git-Newrev: 7bce3d6a97393772b4ed9da35fd3991977b7ec19
X-Patchwork-Hint: ignore
Message-Id: <20220916122350.AD94E83D10@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/opencv4:
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7bce3d6a97393772b4ed9da35fd3991977b7ec19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit b0d3c25cc8017e92dbdedf1a1dde6f4dc4408332)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv4/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index d7a391a40a..5b07f52ba1 100644
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
