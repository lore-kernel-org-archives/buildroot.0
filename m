Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84631C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFFA54033F;
	Sun, 13 Feb 2022 11:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7xla6atSCTI; Sun, 13 Feb 2022 11:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1E51401F8;
	Sun, 13 Feb 2022 11:44:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BECCC1BF95F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACC3A814BA
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nWXwN5hxcJn for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:44:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 061DC81499
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:44:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DAF5082745; Sun, 13 Feb 2022 11:36:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:43:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78a3807295f7436297056aab6ff4916bdb0f8289
X-Git-Newrev: 4284eea7c9f66b22a7f87a4edd827692f88afed4
X-Patchwork-Hint: ignore
Message-Id: <20220213113628.DAF5082745@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webp: use configure options for
 jpeg/png/tiff support
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

commit: https://git.buildroot.net/buildroot/commit/?id=4284eea7c9f66b22a7f87a4edd827692f88afed4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Webp nowadays has explicit configure options for jpeg/png/tiff, so use those
to explicitly enable/disable support.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webp/webp.mk | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index e8d204919c..d725b44438 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -13,12 +13,6 @@ WEBP_CPE_ID_VENDOR = webmproject
 WEBP_CPE_ID_PRODUCT = libwebp
 WEBP_INSTALL_STAGING = YES
 
-WEBP_CONF_OPTS += \
-	--with-jpegincludedir=$(STAGING_DIR)/usr/include \
-	--with-jpeglibdir=$(STAGING_DIR)/usr/lib \
-	--with-tiffincludedir=$(STAGING_DIR)/usr/include \
-	--with-tifflibdir=$(STAGING_DIR)/usr/lib
-
 HOST_WEBP_CONF_OPTS += \
 	--enable-libwebpdemux \
 	--enable-libwebpmux \
@@ -47,6 +41,16 @@ else
 WEBP_CONF_OPTS += --disable-gif
 endif
 
+ifeq ($(BR2_PACKAGE_JPEG),y)
+WEBP_DEPENDENCIES += jpeg
+WEBP_CONF_OPTS += \
+	--enable-jpeg \
+	--with-jpegincludedir=$(STAGING_DIR)/usr/include \
+	--with-jpeglibdir=$(STAGING_DIR)/usr/lib
+else
+WEBP_CONF_OPTS += --disable-jpeg
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
 WEBP_DEPENDENCIES += libfreeglut
 WEBP_CONF_OPTS += --enable-gl
@@ -56,13 +60,21 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 WEBP_DEPENDENCIES += libpng
+WEBP_CONF_OPTS += --enable-png
 WEBP_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
 else
-WEBP_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=/bin/false
+WEBP_CONF_OPTS += --disable-png
 endif
 
-WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
-WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
+ifeq ($(BR2_PACKAGE_TIFF),y)
+WEBP_DEPENDENCIES += tiff
+WEBP_CONF_OPTS += \
+	--enable-tiff \
+	--with-tiffincludedir=$(STAGING_DIR)/usr/include \
+	--with-tifflibdir=$(STAGING_DIR)/usr/lib
+else
+WEBP_CONF_OPTS += --disable-tiff
+endif
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
