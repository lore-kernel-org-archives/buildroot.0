Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE63CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 904DF8135B;
	Sat,  8 Jan 2022 18:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ieo2IsqINkpJ; Sat,  8 Jan 2022 18:28:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5C2B81350;
	Sat,  8 Jan 2022 18:28:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01CE81BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E41E860A73
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YhXV3iE1YFk4 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:27:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A21760A71
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:27:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5A82E82D32; Sat,  8 Jan 2022 18:21:46 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 19:27:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4afa6fd8c1457dce95b830da3ad3b0d255ca1d09
X-Git-Newrev: e070d606675ce3750496128b50227673d5a47944
X-Patchwork-Hint: ignore
Message-Id: <20220108182146.5A82E82D32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5: enable eglfs_kms integration
 plugin for rockchip-mali
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

commit: https://git.buildroot.net/buildroot/commit/?id=e070d606675ce3750496128b50227673d5a47944
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to be able to use OpenGL with QT5 with a Rockchip Mali
Bifrost GPU, a device integration provider has to be selected. We are
interested in the KMS integration that works well with Mali Bifrost,
make sure it gets build when using rockchip-mali-bifrost as OpenGL
provider.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 4db2294ad3..bcdf036f00 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -264,6 +264,9 @@ QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
 else ifeq ($(BR2_PACKAGE_SUNXI_MALI_UTGARD),y)
 # use mali backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_mali
+else ifeq ($(BR2_PACKAGE_ROCKCHIP_MALI),y)
+# use kms backend
+QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_kms
 endif
 
 ifneq ($(QT5BASE_CONFIG_FILE),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
