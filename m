Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18FDEC873A
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9924483F05;
	Thu,  7 Sep 2023 15:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9924483F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWr3gwu-6Mzl; Thu,  7 Sep 2023 15:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C89F1813EF;
	Thu,  7 Sep 2023 15:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C89F1813EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32A641BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 313AF41DC4
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 313AF41DC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfMPjlXRNqDP for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9A2141E62
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9A2141E62
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C762186A21; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 11:56:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6b2a5049ecd9b4c6ba500d9c4793e68e86c36f8
X-Git-Newrev: 1c27f3a12d77bc3cef97123148ff13929d13d73e
X-Patchwork-Hint: ignore
Message-Id: <20230907145134.C762186A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6base: add vulkan option
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c27f3a12d77bc3cef97123148ff13929d13d73e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in  | 10 ++++++++++
 package/qt6/qt6base/qt6base.mk |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index f9fb2a2ad0..98a7520486 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -43,6 +43,16 @@ config BR2_PACKAGE_QT6BASE_GUI
 
 if BR2_PACKAGE_QT6BASE_GUI
 
+config BR2_PACKAGE_QT6BASE_VULKAN
+	bool "Vulkan support"
+	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	depends on !BR2_STATIC_LIBS # vulkan-loader
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_HEADERS
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  This option enables Vulkan support.
+
 config BR2_PACKAGE_QT6BASE_LINUXFB
 	bool "linuxfb support"
 
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 4a01bb17b2..c32089f551 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -127,6 +127,13 @@ QT6BASE_CONF_OPTS += \
 	-DFEATURE_vulkan=OFF
 QT6BASE_DEPENDENCIES += freetype
 
+ifeq ($(BR2_PACKAGE_QT6BASE_VULKAN),y)
+QT6BASE_DEPENDENCIES   += vulkan-headers vulkan-loader
+QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=ON
+else
+QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_LINUXFB),y)
 QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
