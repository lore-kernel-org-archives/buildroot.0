Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D58CC25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 22:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08C316F90D;
	Thu,  4 Aug 2022 22:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08C316F90D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i8bwqGxjHeCB; Thu,  4 Aug 2022 22:16:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C7486F909;
	Thu,  4 Aug 2022 22:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C7486F909
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9511BF302
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 22:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58B766F909
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 22:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58B766F909
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rndlchez5fnP for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 22:16:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48F1E6F906
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48F1E6F906
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 22:16:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 4A650240006;
 Thu,  4 Aug 2022 22:16:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri,  5 Aug 2022 00:15:59 +0200
Message-Id: <20220804221559.46394-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220804221559.46394-1-thomas.petazzoni@bootlin.com>
References: <20220804221559.46394-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659651371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CHJQ+ZhjwaDxBItIaoilXuhsd/lHqWRRYkei3i0VUTw=;
 b=DIsYn4yXQvrlEvgAa5VeGC0U2hbVm3VpLYUWznycPikyhtUmnHnryoQNLjzc0BCA5NxeJe
 MPCaTuzzsYOpQVZgTMftCbImAKYWpvGn0xMpnr1sBxuUL7D21SmN97NQLZ5Ki/x40AEXSN
 2JOMzrHvUsdyG9AGeNQK9H8+g8bjXMOyGgya6uTWwfNsTIu7wmoaf8+onnUCUkGDlkTA4P
 +NKLUkoyKtxW981dayVsgaEhLfzxkU483IQt72YFLpPtILAFdjSd1aTkdZNvyPu1amCi+i
 QnQXSpBW92RZbBHxvAzLTiPnc3oOqvbApt+qqFq1SaZljVhyYg0W3I+NShIv9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DIsYn4yX
Subject: [Buildroot] [PATCH 3/3] package/sdl2: rework KMS/DRM video driver
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
Cc: Michael Fischer <mf@go-sys.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The KMS/DRM video driver of SDL2 can currently only be enabled when
mesa3d is the OpenGL provider, as the option has a dependency on
BR2_PACKAGE_MESA3D_GBM. Now that we have a libgbm virtual package and
BR2_PACKAGE_HAS_LIBGBM, we can do better.

However, this has uncovered a number of additional related issues that
are resolved at the same time. Here are some details:

 * the 'depends on BR2_PACKAGE_LIBDRM' is changed to a select, as we
   normally do for library dependencies. Due to this, we inherit a
   BR2_TOOLCHAIN_HAS_THREADS dependency.

 * the 'depends on BR2_PACKAGE_MESA3D_GBM' is changed to 'depends on
   BR2_PACKAGE_HAS_LIBGBM', and the 'mesa3d' dependency is changed to
   'libgbm'.

 * the KMS/DRM video driver in SDL2 needs EGL (hence the additional
   'depends on BR2_PACKAGE_HAS_LIBEGL' and the libegbl dependency is
   added in the .mk file). But in turn, EGL support is only checked
   when either OpenGL or OpenGLES support is enabled in SDL2, which is
   why we add logic to select the appropriate options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2/Config.in | 17 ++++++++++-------
 package/sdl2/sdl2.mk   |  2 +-
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index 2ad45e4d00..bce7d4e272 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -31,14 +31,17 @@ comment "X11 video driver needs X.org"
 
 config BR2_PACKAGE_SDL2_KMSDRM
 	bool "KMS/DRM video driver"
-	depends on BR2_PACKAGE_LIBDRM
-	depends on BR2_PACKAGE_MESA3D_GBM
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_SDL2_OPENGL || BR2_PACKAGE_SDL2_OPENGLES
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBDRM
 
-comment "KMS/DRM video driver needs libdrm"
-	depends on !BR2_PACKAGE_LIBDRM
-
-comment "KMS/DRM video driver needs mesa3d w/ GBM"
-	depends on !BR2_PACKAGE_MESA3D_GBM
+comment "KMS/DRM video driver needs a GBM provider, OpenGL or OpenGLES support, toolchain w/threads"
+	depends on !BR2_PACKAGE_HAS_LIBGBM || \
+		!(BR2_PACKAGE_SDL2_OPENGL || BR2_PACKAGE_SDL2_OPENGLES) || \
+		BR2_PACKAGE_HAS_LIBEGL || \
+		BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_SDL2_OPENGL
 	bool "OpenGL (GLX)"
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index c5e7968cec..b5e09b6078 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -169,7 +169,7 @@ SDL2_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_SDL2_KMSDRM),y)
-SDL2_DEPENDENCIES += libdrm mesa3d
+SDL2_DEPENDENCIES += libdrm libgbm libegl
 SDL2_CONF_OPTS += --enable-video-kmsdrm
 else
 SDL2_CONF_OPTS += --disable-video-kmsdrm
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
