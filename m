Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2295CAC5A7
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 05:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 266036163A;
	Mon, 22 Sep 2025 05:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYAVHVNRasqN; Mon, 22 Sep 2025 05:25:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20F7D61620
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20F7D61620;
	Mon, 22 Sep 2025 05:25:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DD77E7
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 05:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F6DF8440D
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 05:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTfQVvzNv3Ng for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 05:25:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8A9882496
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8A9882496
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8A9882496
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 05:25:43 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 47BB731E0C4D; Mon, 22 Sep 2025 07:25:40 +0200 (CEST)
Date: Mon, 22 Sep 2025 07:25:40 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aNDd1PYIeu8rK5Yl@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758518740; bh=KgkZSnimUt7v1fKhlm4Yjx3J2JTWQcBHLTjyq8tyu0Y=;
 h=Date:From:To:Subject:From;
 b=IVhNb1GIvphY4Dcaq8FvY17Vlx7gZakNbvQHXFki1v1fdHzKqRWHBXknLzbL3vF7T
 KsOcdJCfM6/wsQozoxndByEP8b8oqQZtT3BGGUXxspaE4JxAx/R3fjxs2RA4fYImUX
 jZ0S42hEeOCTwrcRfv3tpHhJfDTHr8fsfwbcxa05RDFTbRP5Sj+rSdUuEf/ViPNHCH
 n5eqUWuTAF/9F8BGeJWV1PUULDHPbCTkay1SD5sFRPh2iNePPYYKssW0ftov2M8snH
 VLOKgcfKAOODvJW8Gp730FNzVmFYvKopL7U/BPMlWMKCwEm7VTrLxCVXEq9xP59ZuS
 TR3d+TxFCRyCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=IVhNb1GI
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: fix runtime
 problem when libgbm is in use
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When running Qemu X86_64 with libgbm active in the Buildroot config
the Xorg server does not start because of missing libgbm symbol in
the modesetting driver.

Fix this with a small patch against modesettings driver Makefile.am.

We need to add font-util for successful autoreconf.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...02-modesetting-driver-needs-GBM_LIBS.patch | 33 +++++++++++++++++++
 package/x11r7/xserver_xorg-server/Config.in   |  1 +
 .../xserver_xorg-server.mk                    |  2 ++
 3 files changed, 36 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/0002-modesetting-driver-needs-GBM_LIBS.patch

diff --git a/package/x11r7/xserver_xorg-server/0002-modesetting-driver-needs-GBM_LIBS.patch b/package/x11r7/xserver_xorg-server/0002-modesetting-driver-needs-GBM_LIBS.patch
new file mode 100644
index 0000000000..5b9bba270b
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/0002-modesetting-driver-needs-GBM_LIBS.patch
@@ -0,0 +1,33 @@
+From fb22307f7e28127bae19e7e394c7f3784bb8dd97 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sun, 21 Sep 2025 20:49:56 +0200
+Subject: [PATCH 274/274] modesetting driver needs GBM_LIBS
+
+When libgbm.so is around the modesetting driver needs to link against
+the library. Otherwise you get an undefined symbol.
+
+See here for a bug report:
+https://gitlab.freedesktop.org/xorg/xserver/-/issues/1378
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: N/A (closed gitlab)
+---
+ hw/xfree86/drivers/modesetting/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/xfree86/drivers/modesetting/Makefile.am b/hw/xfree86/drivers/modesetting/Makefile.am
+index 961c57408..ac5091be3 100644
+--- a/hw/xfree86/drivers/modesetting/Makefile.am
++++ b/hw/xfree86/drivers/modesetting/Makefile.am
+@@ -41,7 +41,7 @@ AM_CPPFLAGS = \
+ 
+ modesetting_drv_la_LTLIBRARIES = modesetting_drv.la
+ modesetting_drv_la_LDFLAGS = -module -avoid-version
+-modesetting_drv_la_LIBADD = $(UDEV_LIBS) $(DRM_LIBS)
++modesetting_drv_la_LIBADD = $(UDEV_LIBS) $(DRM_LIBS) $(GBM_LIBS)
+ modesetting_drv_ladir = @moduledir@/drivers
+ 
+ modesetting_drv_la_SOURCES = \
+-- 
+2.47.3
+
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 89410f22bb..3ab3de2731 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XFONT_FONT_ALIAS
 	select BR2_PACKAGE_XFONT_FONT_MISC_MISC
 	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 2ce02ade36..168213dd94 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -13,9 +13,11 @@ XSERVER_XORG_SERVER_CPE_ID_VENDOR = x.org
 XSERVER_XORG_SERVER_CPE_ID_PRODUCT = x_server
 XSERVER_XORG_SERVER_SELINUX_MODULES = xdg xserver
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
+XSERVER_XORG_SERVER_AUTORECONF = YES
 
 XSERVER_XORG_SERVER_DEPENDENCIES = \
 	xutil_util-macros \
+	xfont_font-util \
 	xlib_libX11 \
 	xlib_libXau \
 	xlib_libXdmcp \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
