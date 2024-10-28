Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1744FD5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F07380D84;
	Mon, 28 Oct 2024 21:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMxtiOMEMOl8; Mon, 28 Oct 2024 21:31:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C11780D73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C11780D73;
	Mon, 28 Oct 2024 21:31:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F59C4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30ED880D73
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtlqTPP0urLL for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16F9280C8C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16F9280C8C
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:31:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0504F844CA; Mon, 28 Oct 2024 21:31:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 22:31:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f34e78818c9bc28a7a0e590bb73d72e616919f4
X-Git-Newrev: 3c2f3c9039deb7e285e76391fdb28258c7312f9b
X-Patchwork-Hint: ignore
Message-Id: <20241028213152.0504F844CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/procps-ng: fix ncurses.h include
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c2f3c9039deb7e285e76391fdb28258c7312f9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/7f1/7f1e0b3d99db07ea46c9cd1f51b320b461623c8d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/procps-ng/0002-fix-ncurses-h-include.patch | 55 ++++++++++++++++++++++
 package/procps-ng/procps-ng.mk                     |  1 +
 2 files changed, 56 insertions(+)

diff --git a/package/procps-ng/0002-fix-ncurses-h-include.patch b/package/procps-ng/0002-fix-ncurses-h-include.patch
new file mode 100644
index 0000000000..619126b863
--- /dev/null
+++ b/package/procps-ng/0002-fix-ncurses-h-include.patch
@@ -0,0 +1,55 @@
+From 263fe04f9ed6f3f40fdb7ce249221e03dc926c9b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 24 Jul 2024 09:51:00 +0200
+Subject: [PATCH] fix ncurses.h include
+
+Commit 58559a5b64a3634460536d6397ca382a54b599f0 was not backported from
+3.3.17 to 4.0.0 resulting in the following build failure when ncursesw
+headers are not installed in ../usr/include/ncursesw/..:
+
+src/watch.c:56:11: fatal error: ncursesw/ncurses.h: No such file or directory
+   56 | # include <ncursesw/ncurses.h>
+      |           ^~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b7573be2e78f3d224f48cb3f52087e3d227d58e3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+Upstream: https://gitlab.com/procps-ng/procps/-/commit/263fe04f9ed6f3f40fdb7ce249221e03dc926c9b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: backported to version 4.0.4]
+---
+ configure.ac | 2 +-
+ src/watch.c  | 5 ++++-
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d433901f..38350aaf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -64,7 +64,7 @@ PROCPS_PROG_PO4A
+ 
+ # Checks for header files.
+ AC_HEADER_MAJOR
+-AC_CHECK_HEADERS([arpa/inet.h fcntl.h float.h langinfo.h libintl.h limits.h locale.h stdint.h stdio_ext.h stdlib.h string.h sys/file.h sys/ioctl.h sys/param.h sys/time.h termios.h unistd.h utmp.h utmpx.h values.h wchar.h wctype.h])
++AC_CHECK_HEADERS([arpa/inet.h fcntl.h float.h langinfo.h libintl.h limits.h locale.h ncursesw/ncurses.h stdint.h stdio_ext.h stdlib.h string.h sys/file.h sys/ioctl.h sys/param.h sys/time.h termios.h unistd.h utmp.h utmpx.h values.h wchar.h wctype.h])
+ 
+ # Checks for typedefs, structures, and compiler characteristics.
+ AC_CHECK_HEADER_STDBOOL
+diff --git a/src/watch.c b/src/watch.c
+index ef638e00..7ec634b6 100644
+--- a/src/watch.c
++++ b/src/watch.c
+@@ -53,6 +53,8 @@
+ # define _XOPEN_SOURCE_EXTENDED 1
+ # include <wchar.h>
+ # include <wctype.h>
++#endif
++#ifdef HAVE_NCURSESW_NCURSES_H
+ # include <ncursesw/ncurses.h>
+ #else
+ # include <ncurses.h>
+-- 
+GitLab
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 1002d6340f..4ac82cf6f9 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -15,6 +15,7 @@ PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
 # Applying 0001-build-sys-Add-systemd-elogind-to-w.patch touches Makefile.am
+# Applying 0002-fix-ncurses-h-include.patch touches configure.ac
 PROCPS_NG_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
