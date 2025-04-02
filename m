Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E026C3601B
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 19:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A37B6FA2F;
	Wed,  2 Apr 2025 19:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtmDJvGCViMA; Wed,  2 Apr 2025 19:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 576CA6FA28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 576CA6FA28;
	Wed,  2 Apr 2025 19:15:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CC9411F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E86C60606
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lksnr6uDVJok for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 19:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8642161AF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8642161AF9
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73ADB83A96; Wed,  2 Apr 2025 19:15:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Apr 2025 21:14:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6418ecad427f509d71f6d62920b753cf754012a
X-Git-Newrev: 0f4fef076f99fcfc7187223a6bc154d0a751e963
X-Patchwork-Hint: ignore
Message-Id: <20250402191502.73ADB83A96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfreeglut: add upstream security
 fix for CVE-2024-2425{8, 9}
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
Content-Type: multipart/mixed; boundary="===============6738268824520810954=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6738268824520810954==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0f4fef076f99fcfc7187223a6bc154d0a751e963
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2024-24258: freeglut 3.4.0 was discovered to contain a memory leak
via the menuEntry variable in the glutAddSubMenu function.
- CVE-2024-24259: freeglut through 3.4.0 was discovered to contain a
memory leak via the menuEntry variable in the glutAddMenuEntry
function.

https://nvd.nist.gov/vuln/detail/CVE-2024-24258
https://nvd.nist.gov/vuln/detail/CVE-2024-24259

The CVEs are not technically reported for the libfreeglut package
itself (which doesn't have a CPE identifier) but for mupdf.

Note that mudpf provides its own (old) version of freeglut, but our
mupdf package uses the Buildroot-provided freeglut (which now contains
the fix).

It also has to be noted that a more recent release of libfreeglut
exists upstream, and it fixes the same CVEs.  Bumping our package
version however requires more work that can be done separately.
Including this patch first also has the advantage that it can easily
be backported wherever it's needed.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...-Plug-memory-leak-that-happens-upon-error.patch | 54 ++++++++++++++++++++++
 package/mupdf/mupdf.mk                             |  6 +++
 2 files changed, 60 insertions(+)

diff --git a/package/libfreeglut/0001-Plug-memory-leak-that-happens-upon-error.patch b/package/libfreeglut/0001-Plug-memory-leak-that-happens-upon-error.patch
new file mode 100644
index 0000000000..d09e9befb3
--- /dev/null
+++ b/package/libfreeglut/0001-Plug-memory-leak-that-happens-upon-error.patch
@@ -0,0 +1,54 @@
+From 9ad320c1ad1a25558998ddfe47674511567fec57 Mon Sep 17 00:00:00 2001
+From: Sebastian Rasmussen <sebras@gmail.com>
+Date: Mon, 12 Feb 2024 14:46:22 +0800
+Subject: [PATCH] Plug memory leak that happens upon error.
+
+If fgStructure.CurrentMenu is set when glutAddMenuEntry() or
+glutAddSubMenu() is called the allocated menuEntry variable will
+leak. This commit postpones allocating menuEntry until after the
+error checks, thereby plugging the memory leak.
+
+This fixes CVE-2024-24258 and CVE-2024-24259.
+Upstream: https://github.com/freeglut/freeglut/commit/9ad320c1ad1a25558998ddfe47674511567fec57
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+---
+ src/fg_menu.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/fg_menu.c b/src/fg_menu.c
+index 53112dc2..0da88901 100644
+--- a/src/fg_menu.c
++++ b/src/fg_menu.c
+@@ -864,12 +864,12 @@ void FGAPIENTRY glutAddMenuEntry( const char* label, int value )
+ {
+     SFG_MenuEntry* menuEntry;
+     FREEGLUT_EXIT_IF_NOT_INITIALISED ( "glutAddMenuEntry" );
+-    menuEntry = (SFG_MenuEntry *)calloc( sizeof(SFG_MenuEntry), 1 );
+ 
+     freeglut_return_if_fail( fgStructure.CurrentMenu );
+     if (fgState.ActiveMenus)
+         fgError("Menu manipulation not allowed while menus in use.");
+ 
++    menuEntry = (SFG_MenuEntry *)calloc( sizeof(SFG_MenuEntry), 1 );
+     menuEntry->Text = strdup( label );
+     menuEntry->ID   = value;
+ 
+@@ -888,7 +888,6 @@ void FGAPIENTRY glutAddSubMenu( const char *label, int subMenuID )
+     SFG_Menu *subMenu;
+ 
+     FREEGLUT_EXIT_IF_NOT_INITIALISED ( "glutAddSubMenu" );
+-    menuEntry = ( SFG_MenuEntry * )calloc( sizeof( SFG_MenuEntry ), 1 );
+     subMenu = fgMenuByID( subMenuID );
+ 
+     freeglut_return_if_fail( fgStructure.CurrentMenu );
+@@ -897,6 +896,7 @@ void FGAPIENTRY glutAddSubMenu( const char *label, int subMenuID )
+ 
+     freeglut_return_if_fail( subMenu );
+ 
++    menuEntry = ( SFG_MenuEntry * )calloc( sizeof( SFG_MenuEntry ), 1 );
+     menuEntry->Text    = strdup( label );
+     menuEntry->SubMenu = subMenu;
+     menuEntry->ID      = -1;
+-- 
+2.48.1
+
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 9eecb84232..6b666033eb 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -21,6 +21,12 @@ MUPDF_DEPENDENCIES = \
 	lcms2 openjpeg \
 	zlib
 
+# libfreeglut/0001-Plug-memory-leak-that-happens-upon-error.patch
+# Fix is in libfreeglut, but CVE applied to mupdf.
+MUPDF_IGNORE_CVES = \
+	CVE-2024-24258 \
+	CVE-2024-24259
+
 # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
 # with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
 MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \

--===============6738268824520810954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6738268824520810954==--
