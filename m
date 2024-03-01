Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A65FC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 10:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BB38606DF;
	Fri,  1 Mar 2024 10:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erBZiSo8riAA; Fri,  1 Mar 2024 10:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 674BD60847
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 674BD60847;
	Fri,  1 Mar 2024 10:11:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF8BC1BF32C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCE3382326
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-91MFhpKI1C for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 10:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB6F821FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DB6F821FE
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 10:11:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E83B87E7F; Fri,  1 Mar 2024 10:11:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 11:04:31 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 1978740480bee016ae9da6daa8db060774d5b41b
X-Git-Newrev: ac116e1c88f056941443bcad69babf3e5d26c908
X-Patchwork-Hint: ignore
Message-Id: <20240301101129.0E83B87E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/opencv-contrib:
 propagate opencv4 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac116e1c88f056941443bcad69babf3e5d26c908
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit a7736afacaef (package/opencv4-contrib: properly note dependencies
between modules) forgot to propagate the dependencies of selected
symbols, causing unmet dependencies warnings (unfortunately, not
errors), such as:

    $ KCONFIG_SEED=0x9F66F854 make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_DNN
      Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y]
      Selected by [y]:
      - BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT [=y] && BR2_PACKAGE_OPENCV4_CONTRIB [=y]

Propagate the dependencies and add associated comments.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a2e01b23fc441a4be4416e68d91e331e00db3bbd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv4-contrib/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index 951d5f71ad..261d414869 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -74,19 +74,31 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DATASETS
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
 	bool "dnn_objdetect"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 dnn
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 dnn
 	select BR2_PACKAGE_OPENCV4_LIB_DNN
 	help
 	  Object Detection using CNNs -- Implements compact CNN Model
 	  for object detection. Trained using Caffe but uses
 	  opencv_dnn module.
 
+comment "dnn_objdetect needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
 	bool "dnn_superres"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 dnn
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 dnn
 	select BR2_PACKAGE_OPENCV4_LIB_DNN
 	help
 	  Superresolution using CNNs -- Contains four trained
 	  convolutional neural networks to upscale images.
 
+comment "dnn_superres needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
 	bool "dnns_easily_fooled"
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
