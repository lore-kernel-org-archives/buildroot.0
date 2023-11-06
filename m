Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ADAC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD8706123B;
	Mon,  6 Nov 2023 19:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD8706123B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yy9UO5gLkF3V; Mon,  6 Nov 2023 19:33:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8CB661208;
	Mon,  6 Nov 2023 19:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8CB661208
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25B051BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09F8C41597
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09F8C41597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GlwlaOv02gV1 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:33:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8E9F400C5
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8E9F400C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 975D986922; Mon,  6 Nov 2023 19:33:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 20:31:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5891e0f6d3187ae33b3d187b72a64e496eb22720
X-Git-Newrev: 26d41be6b8d63281122b0f60375393c307703578
X-Patchwork-Hint: ignore
Message-Id: <20231106193309.975D986922@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpam-tacplus: fix
 --disable-werror
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=26d41be6b8d63281122b0f60375393c307703578
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-Werror is unconditionally set since version 1.6.2 and
https://github.com/kravietz/pam_tacplus/commit/649e6f2efb2f3278c55d4c9704bb48cb9f74cb73
resulting in the following build failure since bump to version 1.7.0 in
commit 160f0e4b5f161d1966a70ad36679a9f5e9dfa9d3:

In file included from /home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
                 from /home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/stdlib.h:26,
                 from ./lib/stdlib.h:36,
                 from ./libtac/include/libtac.h:35,
                 from support.h:25,
                 from support.c:28:
/home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:413:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
  413 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
      |    ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/9b5ece5d01eac8a760ed9ca331a902d1c47387a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libpam-tacplus/0002-fix-disable-werror.patch   | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/libpam-tacplus/0002-fix-disable-werror.patch b/package/libpam-tacplus/0002-fix-disable-werror.patch
new file mode 100644
index 0000000000..0f42fafc64
--- /dev/null
+++ b/package/libpam-tacplus/0002-fix-disable-werror.patch
@@ -0,0 +1,62 @@
+From d6c6f043a08483b32bddcbc8cadec1d8edbe092d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 6 Nov 2023 18:09:20 +0100
+Subject: [PATCH] fix --disable-werror
+
+-Werror is unconditionally set since version 1.6.2 and
+https://github.com/kravietz/pam_tacplus/commit/649e6f2efb2f3278c55d4c9704bb48cb9f74cb73
+resulting in the following build failure:
+
+In file included from /home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
+                 from /home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/stdlib.h:26,
+                 from ./lib/stdlib.h:36,
+                 from ./libtac/include/libtac.h:35,
+                 from support.h:25,
+                 from support.c:28:
+/home/thomas/autobuild/instance-0/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:413:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
+  413 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
+      |    ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9b5ece5d01eac8a760ed9ca331a902d1c47387a7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/kravietz/pam_tacplus/pull/204
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 2 +-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 04417e7..1255a9b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -9,7 +9,11 @@
+ ACLOCAL_AMFLAGS = -I config -I m4
+ SUBDIRS = lib
+ AUTOMAKE_OPTIONS = subdir-objects
+-AM_CFLAGS = -Wall -Wextra -Werror
++AM_CFLAGS = -Wall -Wextra
++
++if ENABLE_WERROR
++AM_CFLAGS += -Werror
++endif
+ 
+ bin_PROGRAMS = tacc
+ tacc_SOURCES = tacc.c
+diff --git a/configure.ac b/configure.ac
+index 6914561..5cadca2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -16,7 +16,7 @@ See the included file: LICENSE for copyright information.
+ ])
+ AC_INIT([pam_tacplus],[1.7.0],[https://github.com/kravietz/pam_tacplus/issues/],[pam_tacplus],[https://github.com/kravietz/pam_tacplus/])
+ AC_CONFIG_AUX_DIR(config)
+-AM_INIT_AUTOMAKE([foreign -Wall -Werror])
++AM_INIT_AUTOMAKE([foreign -Wall])
+ AC_CONFIG_SRCDIR([pam_tacplus.c])
+ AC_CONFIG_HEADERS([config.h])
+ AC_CONFIG_MACRO_DIR([config])
+-- 
+2.42.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
