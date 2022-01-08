Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0129C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F11360A71;
	Sat,  8 Jan 2022 18:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ziQhOisVzLq; Sat,  8 Jan 2022 18:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74943607F9;
	Sat,  8 Jan 2022 18:06:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E54091BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 578DA40136
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d3a0Gi7Vv1C6 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:04:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8553540148
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:04:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C27DB82BA3; Sat,  8 Jan 2022 17:58:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 19:04:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 627464367ea7a3ea76a25beebed9a8f069b3cfc0
X-Git-Newrev: 0ba2ee0b7a756c6499febf30f7db0346f2c1e6f2
X-Patchwork-Hint: ignore
Message-Id: <20220108175845.C27DB82BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5base: use the libgbm
 virtual package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ba2ee0b7a756c6499febf30f7db0346f2c1e6f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have a libgbm virtual package, it makes sense to use it to
replace the open-coded list of gbm providers in qt5base. All of
mesa3d, gcnano-binaries, ti-sgx-um and imx-gpu-viv are libgbm
providers now.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ec5264bfc9..4db2294ad3 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -69,19 +69,9 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-kms
 endif
 
-# Uses libgbm from mesa3d
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
-QT5BASE_DEPENDENCIES += mesa3d
-else ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
-QT5BASE_CONFIGURE_OPTS += -gbm
-QT5BASE_DEPENDENCIES += gcnano-binaries
-else ifeq ($(BR2_PACKAGE_TI_SGX_UM),y)
-QT5BASE_CONFIGURE_OPTS += -gbm
-QT5BASE_DEPENDENCIES += ti-sgx-um
-else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
-QT5BASE_CONFIGURE_OPTS += -gbm
-QT5BASE_DEPENDENCIES += imx-gpu-viv
+QT5BASE_DEPENDENCIES += libgbm
 else
 QT5BASE_CONFIGURE_OPTS += -no-gbm
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
