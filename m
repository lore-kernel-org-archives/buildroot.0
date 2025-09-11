Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0A2CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA0584C6B;
	Thu, 11 Sep 2025 20:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lzNAYZnpqZKK; Thu, 11 Sep 2025 20:22:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6161D84C60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6161D84C60;
	Thu, 11 Sep 2025 20:22:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9074C25B
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 823F9415BC
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1oFcU9byuZAm for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4D24415B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4D24415B3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE38B8442C; Thu, 11 Sep 2025 20:22:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:17:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdc7ca446fdf639ae1398318e6cc5788192f0ced
X-Git-Newrev: fbc812a35bce8cf21f942a8e08f245ce4bb56528
X-Patchwork-Hint: ignore
Message-Id: <20250911202207.BE38B8442C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv3: drop optional dependency
 on libgtk2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fbc812a35bce8cf21f942a8e08f245ce4bb56528
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove libgtk2, we need to drop libgtk2 support from
opencv3. gtk3 support remains in place.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout: add legacy handling.]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy           |  7 +++++++
 package/opencv3/Config.in  |  9 ---------
 package/opencv3/opencv3.mk | 14 ++++----------
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d68106d8c1..691e36ccd0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_OPENCV3_WITH_GTK
+	bool "opencv3 gtk support has been removed"
+	select BR2_LEGACY
+	help
+	  Due to the removal of libgtk2, the gtk support of opencv3
+	  has been removed. gtk3 support is still available.
+
 config BR2_PACKAGE_NETSURF_GTK
 	bool "gtk frontend of netsurf has been removed"
 	select BR2_LEGACY
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index a672497108..c4c5d22a54 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -63,15 +63,6 @@ choice
 config BR2_PACKAGE_OPENCV3_GUI_NONE
 	bool "none"
 
-config BR2_PACKAGE_OPENCV3_WITH_GTK
-	bool "gtk2"
-	depends on BR2_PACKAGE_LIBGTK2
-
-comment "gtk2 support needs libgtk2"
-	depends on BR2_USE_MMU # libgtk2 -> glib2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_PACKAGE_LIBGTK2
-
 config BR2_PACKAGE_OPENCV3_WITH_GTK3
 	bool "gtk3"
 	depends on BR2_PACKAGE_LIBGTK3
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 218174c17e..8a862a47b1 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -215,6 +215,7 @@ OPENCV3_CONF_OPTS += \
 	-DWITH_GDAL=OFF \
 	-DWITH_GPHOTO2=OFF \
 	-DWITH_GSTREAMER_0_10=OFF \
+	-DWITH_GTK_2_X=OFF \
 	-DWITH_LAPACK=OFF \
 	-DWITH_MATLAB=OFF \
 	-DWITH_OPENCL=OFF \
@@ -244,18 +245,11 @@ else
 OPENCV3_CONF_OPTS += -DWITH_GSTREAMER=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GTK)$(BR2_PACKAGE_OPENCV3_WITH_GTK3),)
-OPENCV3_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GTK),y)
-OPENCV3_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
-OPENCV3_DEPENDENCIES += libgtk2
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GTK3),y)
-OPENCV3_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
+OPENCV3_CONF_OPTS += -DWITH_GTK=ON
 OPENCV3_DEPENDENCIES += libgtk3
+else
+OPENCV3_CONF_OPTS += -DWITH_GTK=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_JASPER),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
