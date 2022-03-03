Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F99C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Mar 2022 22:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A2B9415D5;
	Thu,  3 Mar 2022 22:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIriTTYJM0Xc; Thu,  3 Mar 2022 22:10:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1916415C4;
	Thu,  3 Mar 2022 22:10:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 511DE1BF383
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 22:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FD28607C7
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 22:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UAE_VltmR5TF for <buildroot@lists.busybox.net>;
 Thu,  3 Mar 2022 22:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89C5A60644
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 22:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C157F81D5C; Thu,  3 Mar 2022 22:02:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Mar 2022 23:08:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 559df4ef2888efda8a0142a9b61a1206e6ab0fff
X-Git-Newrev: 35f02050be12b86cdd2220e09c72fd2586346068
X-Patchwork-Hint: ignore
Message-Id: <20220303220221.C157F81D5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xscreensaver: add gdk-pixbuf-xlib
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

commit: https://git.buildroot.net/buildroot/commit/?id=35f02050be12b86cdd2220e09c72fd2586346068
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdk-pixbuf-xlib dependency is needed since bump of gdk-pixbuf to version
2.42.2 in commit a7b51ed3013c919b293deb95299e33363fb9df70 to avoid the
following "hidden" warnings:

   Warning: GTK version 2.24.33 was found, but at least one supporting
            library (gdk-pixbuf-xlib-2.0) was not, so GTK can't be used.
            Perhaps some of the development packages are not installed?

   Warning: The GTK libraries do not seem to be available; the
            `xscreensaver-demo' program requires them.

   Warning: The GDK-Pixbuf library was not found.

            The PNG library is being used instead.

            Some of the demos will not use images as much as they could.
            You should consider installing GDK-Pixbuf and re-running
            configure.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xscreensaver/Config.in       | 1 +
 package/xscreensaver/xscreensaver.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 787c3130ae..10b2b7012c 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_GDK_PIXBUF_XLIB
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index f73a75bf14..46dedc3211 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -15,6 +15,7 @@ XSCREENSAVER_SELINUX_MODULES = xdg xscreensaver xserver
 
 XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
+	gdk-pixbuf-xlib \
 	jpeg \
 	libgtk2 \
 	libxml2 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
