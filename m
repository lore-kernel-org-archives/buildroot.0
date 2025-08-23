Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438D8CA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 18:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A254414FF;
	Sat, 23 Aug 2025 18:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m97rfjEU8imv; Sat, 23 Aug 2025 18:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D3E9412BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D3E9412BD;
	Sat, 23 Aug 2025 18:51:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7EA371E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C953861370
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYGfu6UISXS5 for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 18:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBD156136A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBD156136A
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:51:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E75668775D; Sat, 23 Aug 2025 18:51:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 20:19:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da3996a39d3330722a8458c296c5bccfdd6a0adc
X-Git-Newrev: 7acaff2d9b6abab0d422c608547a26310a64034d
X-Patchwork-Hint: ignore
Message-Id: <20250823185136.E75668775D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl: fix build with GCC 15.x with
 X.org support enabled
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0972406956920501596=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0972406956920501596==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7acaff2d9b6abab0d422c608547a26310a64034d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_SDL=y
 BR2_PACKAGE_SDL_X11=y
 BR2_PACKAGE_XORG7=y
 # BR2_TARGET_ROOTFS_TAR is not set

the build fails with:

./src/video/Xext/Xv/Xv.c:78:5: error: initialization of ‘int (*)(Display *, XEvent *, xEvent *)’ {aka ‘int (*)(Display *, XEvent *, struct _xEvent *)’} from incompatible pointer type ‘int (*)(void)’ [-Wincompatible-pointer-types]

and a number of similar errors in the X.org code.

We fix this by backporting an upstream commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...function-declarations-without-a-prototype.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/sdl/0003-Xext-Fix-function-declarations-without-a-prototype.patch b/package/sdl/0003-Xext-Fix-function-declarations-without-a-prototype.patch
new file mode 100644
index 0000000000..cccc0464bb
--- /dev/null
+++ b/package/sdl/0003-Xext-Fix-function-declarations-without-a-prototype.patch
@@ -0,0 +1,66 @@
+From 6fb5aadafc9d99c25fb4f1a37d225d5b79bc92e9 Mon Sep 17 00:00:00 2001
+From: orbea <orbea@riseup.net>
+Date: Sat, 15 Oct 2022 15:10:48 -0700
+Subject: [PATCH] Xext: Fix function declarations without a prototype
+
+This is not supported with the upcoming clang 16.
+
+error: a function declaration without a prototype is deprecated in all versions of C and is treated as a zero-parameter prototype in C2x, conflicting with a subsequent definition [-Werror,-Wdeprecated-non-prototype]
+
+reference: https://archives.gentoo.org/gentoo-dev/message/dd9f2d3082b8b6f8dfbccb0639e6e240
+
+Upstream: e738cfffced8a006094d55337d917386582ada47
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/video/Xext/XME/xme.c           | 2 +-
+ src/video/Xext/Xinerama/Xinerama.c | 3 ++-
+ src/video/Xext/Xv/Xv.c             | 6 +++---
+ 3 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/video/Xext/XME/xme.c b/src/video/Xext/XME/xme.c
+index 2cead35a..bb8d04d4 100644
+--- a/src/video/Xext/XME/xme.c
++++ b/src/video/Xext/XME/xme.c
+@@ -206,7 +206,7 @@ static char *xigmisc_extension_name = XIGMISC_PROTOCOL_NAME;
+ /*
+  * find_display - locate the display info block
+  */
+-static int XiGMiscCloseDisplay();
++static int XiGMiscCloseDisplay(Display*, XExtCodes*);
+ 
+ static XExtensionHooks xigmisc_extension_hooks = {
+     NULL,                               /* create_gc */
+diff --git a/src/video/Xext/Xinerama/Xinerama.c b/src/video/Xext/Xinerama/Xinerama.c
+index 4ff42ebf..57f64b9c 100644
+--- a/src/video/Xext/Xinerama/Xinerama.c
++++ b/src/video/Xext/Xinerama/Xinerama.c
+@@ -50,7 +50,8 @@ static /* const */ char *panoramiX_extension_name = PANORAMIX_PROTOCOL_NAME;
+ #define PanoramiXSimpleCheckExtension(dpy,i) \
+   XextSimpleCheckExtension (dpy, i, panoramiX_extension_name)
+ 
+-static int close_display();
++static int close_display(Display*, XExtCodes*);
++
+ static /* const */ XExtensionHooks panoramiX_extension_hooks = {
+     NULL,				/* create_gc */
+     NULL,				/* copy_gc */
+diff --git a/src/video/Xext/Xv/Xv.c b/src/video/Xext/Xv/Xv.c
+index 7147b9e8..c254a1dc 100644
+--- a/src/video/Xext/Xv/Xv.c
++++ b/src/video/Xext/Xv/Xv.c
+@@ -63,9 +63,9 @@ static char *xv_extension_name = XvName;
+ #define XvCheckExtension(dpy, i, val) \
+   XextCheckExtension(dpy, i, xv_extension_name, val)
+ 
+-static char *xv_error_string();
+-static int xv_close_display();
+-static Bool xv_wire_to_event();
++static char *xv_error_string(Display*, int, XExtCodes*, char*, int);
++static int xv_close_display(Display*, XExtCodes*);
++static Bool xv_wire_to_event(Display*, XEvent*, xEvent*);
+ 
+ static XExtensionHooks xv_extension_hooks = {
+     NULL,                               /* create_gc */
+-- 
+2.50.1
+

--===============0972406956920501596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0972406956920501596==--
