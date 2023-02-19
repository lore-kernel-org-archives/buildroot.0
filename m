Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FE8C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 469A370188;
	Tue, 21 Feb 2023 02:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 469A370188
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uPhONIFqTR4y; Tue, 21 Feb 2023 02:05:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7838F70224;
	Tue, 21 Feb 2023 02:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7838F70224
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FB411BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52CFF6FE60
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52CFF6FE60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DDGKmcqzvHpN for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7642170048
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7642170048
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 749448648F; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 18:00:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 05c3177493aa8447d5cb568c8c13e0c09eded18b
X-Git-Newrev: df4f7f8e85274d5bde29171203c7eb95f4903765
X-Patchwork-Hint: ignore
Message-Id: <20230220205302.749448648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/weston: add xwayland
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=df4f7f8e85274d5bde29171203c7eb95f4903765
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

If the XWayland support is enabled then build the corresponding XServer.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/Config.in | 10 +++++++++-
 package/weston/weston.mk |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 3b4e932b7d..09119edaaa 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -109,16 +109,24 @@ comment "X11 (nested) compositor needs X.org enabled"
 
 config BR2_PACKAGE_WESTON_XWAYLAND
 	bool "XWayland support"
-	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_LIBEPOXY
+	depends on BR2_PACKAGE_XORG7 # xwayland
+	depends on BR2_USE_MMU # xwayland
+	depends on !BR2_STATIC_LIBS # xwayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # xwayland
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XWAYLAND
 
 comment "XWayland support needs libepoxy and X.org enabled"
 	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
 
+comment "XWayland support needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
 # Weston needs at least one shell; this can be one of the bundled ones,
 # below, of from a third-party package, which should then select this.
 config BR2_PACKAGE_WESTON_HAS_SHELL
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 5e71473640..01f84178b2 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -123,7 +123,7 @@ WESTON_CONF_OPTS += -Dbackend-default=$(call qstrip,$(BR2_PACKAGE_WESTON_DEFAULT
 
 ifeq ($(BR2_PACKAGE_WESTON_XWAYLAND),y)
 WESTON_CONF_OPTS += -Dxwayland=true
-WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor
+WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor xwayland
 else
 WESTON_CONF_OPTS += -Dxwayland=false
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
