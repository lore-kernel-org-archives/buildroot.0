Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFD5C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79BC26117A;
	Tue, 21 Feb 2023 01:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79BC26117A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x1ScIASlH2ZJ; Tue, 21 Feb 2023 01:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B72A4612A5;
	Tue, 21 Feb 2023 01:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B72A4612A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6503B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 135C941805
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 135C941805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mC_WjK1XhKTg for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 843E04182A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 843E04182A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F6B286496; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 18:10:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: df4f7f8e85274d5bde29171203c7eb95f4903765
X-Git-Newrev: 5945a71d87c988cb6b864600dd8dbecae0ef30fd
X-Patchwork-Hint: ignore
Message-Id: <20230220205302.7F6B286496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wlroots: add XWayland
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=5945a71d87c988cb6b864600dd8dbecae0ef30fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The new option enables the XWayland support, so X11 application can be
running on a wlroots based compositor. Also, do not enable the XWayland
support if the X11 backend is active, as it is unrelated to it.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wlroots/Config.in  | 19 +++++++++++++++++++
 package/wlroots/wlroots.mk |  6 +++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 84a4ef846e..b2d3f3c3b1 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -41,4 +41,23 @@ config BR2_PACKAGE_WLROOTS_X11
 	help
 	  Support Wayland sessions nested inside a X11 window
 
+config BR2_PACKAGE_WLROOTS_XWAYLAND
+	bool "XWayland support"
+	depends on BR2_PACKAGE_XORG7 # libxcb, xcb-util-wm, xwayland
+	depends on BR2_USE_MMU # xwayland
+	depends on !BR2_STATIC_LIBS # xwayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # xwayland
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_WM
+	select BR2_PACKAGE_XWAYLAND
+	help
+	  Support for running X11 applications under wayland
+
+comment "XWayland support needs X.org enabled"
+	depends on !BR2_PACKAGE_XORG7
+
+comment "XWayland support needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
 endif
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 4f14d20b11..5b930a51be 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -30,8 +30,12 @@ WLROOTS_BACKENDS = libinput drm
 
 ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
 WLROOTS_BACKENDS += x11
-WLROOTS_CONF_OPTS += -Dxwayland=enabled
 WLROOTS_DEPENDENCIES += libxcb xcb-util-wm xcb-util-renderutil xlib_libX11
+endif
+
+ifeq ($(BR2_PACKAGE_WLROOTS_XWAYLAND),y)
+WLROOTS_CONF_OPTS += -Dxwayland=enabled
+WLROOTS_DEPENDENCIES += libxcb xcb-util-wm xwayland
 else
 WLROOTS_CONF_OPTS += -Dxwayland=disabled
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
