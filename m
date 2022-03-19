Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C9BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 17:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53BD5409F4;
	Sat, 19 Mar 2022 17:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rHXCf2WAJUh1; Sat, 19 Mar 2022 17:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62CB0409F0;
	Sat, 19 Mar 2022 17:55:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BB091BF834
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 17:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1582340140
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 17:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2yBFFMp9NZI for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 17:55:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D521E40102
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 17:55:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 43AD982B4F; Sat, 19 Mar 2022 17:46:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 19 Mar 2022 18:54:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00c51867756180883e197b676723feb14c7934a2
X-Git-Newrev: 1bb495e8caa3f15bab8ddb059f07d6ad56634f42
X-Patchwork-Hint: ignore
Message-Id: <20220319174615.43AD982B4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xscreensaver: add gl dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=1bb495e8caa3f15bab8ddb059f07d6ad56634f42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without gl raised since bump to version
6.03 in commit cbcbd66b0f241184288232972d9cd9d03c9f0ce1:

       Note: The OpenGL 3D library is not being used.

             Those demos which use 3D will not be built or installed.
             That is most of them.

make: *** [package/pkg-generic.mk:282: /home/peko/autobuild/instance-0/output-1/build/xscreensaver-6.03/.stamp_configured] Error 1

A patch was sent to Jamie Zawinski to fix this failure and he replied:

"Why would you do that? I pretty much consider that an unsupported
configuration, since that's more than half of the savers at this point."

I told him that some embedded devices don't have gl and he replied:

"Such as? Just about every modern "embedded device" I'm aware of is more
performant than the desktop computers on which I developed many of those
GL hacks..."

So just add a dependency on gl.

Fixes:
 - http://autobuild.buildroot.org/results/b76743a48d75b5b7539712318fa0b2937a157f88

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: keep --with-gl=yes]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xscreensaver/Config.in       |  7 ++++---
 package/xscreensaver/xscreensaver.mk | 12 ++++--------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 48eefdfa70..ba259274d1 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XSCREENSAVER
 	bool "xscreensaver"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HAS_LIBGL # libglu
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2 -> pango
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf, libgtk2 -> glib2
 	depends on BR2_USE_WCHAR # gdk-pixbuf, libgtk2 -> glib2
@@ -9,7 +10,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_GDK_PIXBUF_XLIB
-	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBGLU
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_JPEG
@@ -28,10 +29,10 @@ config BR2_PACKAGE_XSCREENSAVER
 
 	  http://www.jwz.org/xscreensaver/
 
-comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9"
+comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9, OpenGL backend"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_USE_WCHAR
+		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 0a91d22d14..6cc7e8febe 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -17,6 +17,8 @@ XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
 	gdk-pixbuf-xlib \
 	jpeg \
+	libgl \
+	libglu \
 	libgtk2 \
 	libxml2 \
 	xlib_libX11 \
@@ -30,14 +32,8 @@ XSCREENSAVER_DEPENDENCIES = \
 # compiler/linker
 XSCREENSAVER_CONF_OPTS = \
 	--includedir=$(STAGING_DIR)/usr/include \
-	--libdir=$(STAGING_DIR)/usr/lib
-
-ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-XSCREENSAVER_CONF_OPTS += --with-gl=yes
-XSCREENSAVER_DEPENDENCIES += libgl libglu
-else
-XSCREENSAVER_CONF_OPTS += --with-gl=no
-endif
+	--libdir=$(STAGING_DIR)/usr/lib \
+	--with-gl=yes
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 XSCREENSAVER_CONF_OPTS += --with-png=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
