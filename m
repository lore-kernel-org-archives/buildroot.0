Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF29C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 14:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3226881EED;
	Wed,  7 Feb 2024 14:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OuukYgz0zD5q; Wed,  7 Feb 2024 14:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E742081428
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E742081428;
	Wed,  7 Feb 2024 14:54:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5A91BF276
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 555AF41E84
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id paIHfzpiJlOI for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 14:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D04041E6B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D04041E6B
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 14:54:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 846BB8759B; Wed,  7 Feb 2024 14:54:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 15:53:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b553c9123b9fff5e7a97c19668bee20b15c1d736
X-Git-Newrev: a2e01b23fc441a4be4416e68d91e331e00db3bbd
X-Patchwork-Hint: ignore
Message-Id: <20240207145429.846BB8759B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv-contrib: propagate opencv4
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2e01b23fc441a4be4416e68d91e331e00db3bbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
