Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492BEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 016AC60C08;
	Thu, 30 Dec 2021 16:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0WvJsnz4rGH; Thu, 30 Dec 2021 16:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58BD1606F5;
	Thu, 30 Dec 2021 16:02:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC161BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 866F360759
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P27WvnUWr2dT for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:01:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95C0960675
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:01:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 74A9B82DD7; Thu, 30 Dec 2021 15:55:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 16:59:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf13b5b301536ee1edb6ed2710affb3c2afa1460
X-Git-Newrev: 6b2f00c9430a35e13d6cc44e5ca2625d3301e0c2
X-Patchwork-Hint: ignore
Message-Id: <20211230155508.74A9B82DD7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: add option to
 disable Gen8 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b2f00c9430a35e13d6cc44e5ca2625d3301e0c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add option to disable code for Intel Gen8 GPUs, reduces size of
iHD_drv_video.so from 36M to 33M.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-mediadriver/Config.in            | 10 ++++++++++
 package/intel-mediadriver/intel-mediadriver.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
index 2d5adbcf59..c29c2fb6ab 100644
--- a/package/intel-mediadriver/Config.in
+++ b/package/intel-mediadriver/Config.in
@@ -18,6 +18,16 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
 
 	  https://github.com/intel/media-driver
 
+if BR2_PACKAGE_INTEL_MEDIADRIVER
+
+config BR2_PACKAGE_INTEL_MEDIADRIVER_GEN8
+	bool "Gen8 support"
+	default y
+	help
+	  Enable support for Gen8 GPUs (Coffee Lake)
+
+endif # BR2_PACKAGE_INTEL_MEDIADRIVER
+
 comment "intel-mediadriver needs a toolchain w/ dynamic library, C++, NPTL"
 	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 6cadc3612c..fd3b22a851 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -32,4 +32,10 @@ INTEL_MEDIADRIVER_CONF_OPTS = \
 	-DMEDIA_RUN_TEST_SUITE=OFF \
 	-DMEDIA_BUILD_HARDENING=OFF
 
+ifeq ($(BR2_PACKAGE_INTEL_MEDIADRIVER_GEN8),y)
+INTEL_MEDIADRIVER_CONF_OPTS += -DGEN8=ON
+else
+INTEL_MEDIADRIVER_CONF_OPTS += -DGEN8=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
