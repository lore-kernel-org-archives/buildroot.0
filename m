Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C817D10C07
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1246C81353;
	Sat, 26 Oct 2024 21:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNuuTAjdsWm8; Sat, 26 Oct 2024 21:23:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DF2081378
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DF2081378;
	Sat, 26 Oct 2024 21:23:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E5F15C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F39B881378
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SQj8qOPHEXB for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:23:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D527B81353
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D527B81353
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D527B81353
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:23:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 03C81A4C07A4;
 Sat, 26 Oct 2024 23:23:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46538)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4oFZ-000000008Co-17Fu;
 Sat, 26 Oct 2024 21:23:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 26 Oct 2024 23:23:09 +0200
Message-Id: <20241026212309.2693492-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729977790;
 bh=dSHs0HDbSFOPuIdWJ/jJJqD8yoYil/a6htOwDImIgeE=;
 h=From:To:Cc:Subject:Date:From;
 b=ux1hcgUB6Ai32r1JC5lAnNgaeHa5thL4LNhAmnhLR/wxHHJOgCTaHqJd04Dt6uhLl
 4esUgkb4K79Y/y26a81OtNavv+JcZ7fedx0jTXpgmAYQfTUS8CVSFGdUFbVWk02OJj
 HJSWa+8MTI4IDcmsKOMcRBJ5JpvtMRG+W+4zCBHmWOBBR1Q/CwYE6qcEoNaC+0OuaG
 p5cmezMJQxtjWdECqWHreMoP3JVJBqt/lgjVVVMATm2Vk1o94GAnv7l3ECEYus5GF6
 Rs2PWWtIJ5o2rBLe7ZbmnJDpnwWdF/Fc8qHqJyX8RwQeF34vf7NKjy4Cmqn1yRiFDn
 YymIKxUstmTrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=ux1hcgUB
Subject: [Buildroot] [PATCH 1/1] package/procps-ng: Fix ncurses.h include
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

Fixes:
http://autobuild.buildroot.net/results/7f1/7f1e0b3d99db07ea46c9cd1f51b320b461623c8d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0002-fix-ncurses-h-include.patch          | 55 +++++++++++++++++++
 package/procps-ng/procps-ng.mk                |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 package/procps-ng/0002-fix-ncurses-h-include.patch

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
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
