Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBD3C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0A6E4183C;
	Thu,  3 Nov 2022 22:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0A6E4183C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jl1Lqi5w6NYS; Thu,  3 Nov 2022 22:03:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57D354184D;
	Thu,  3 Nov 2022 22:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57D354184D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 445731BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D02181EDD
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D02181EDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeKKt1txJ-CD for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:03:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D1CD81EDC
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D1CD81EDC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BB9687C81; Thu,  3 Nov 2022 22:03:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 23:03:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a95fcbebf5955de48dd7f57dfc27708739968da
X-Git-Newrev: 82480ee22bdfae6f7d399975722b5c125749d8c7
X-Patchwork-Hint: ignore
Message-Id: <20221103220343.7BB9687C81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipmitool: fix static build with
 readline
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

commit: https://git.buildroot.net/buildroot/commit/?id=82480ee22bdfae6f7d399975722b5c125749d8c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure with readline raised since bump
to version 1.8.19 in commit 8317065ecb4979fe43c466f7e5a7f6dc281bd10d and
https://github.com/ipmitool/ipmitool/commit/63dd71c39c9bf522ad3a785dd001737a285458eb:

configure:15125: /tmp/instance-0/output-1/host/bin/armeb-buildroot-linux-musleabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O0 -g0  -static -Wall -Wextra -std=gnu11 -pedantic -Wformat -Wformat-nonliteral -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lreadline   -lcrypto >&5
/tmp/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/11.3.0/../../../../armeb-buildroot-linux-musleabi/bin/ld: /tmp/instance-0/output-1/host/armeb-buildroot-linux-musleabi/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
display.c:(.text+0x80fc): undefined reference to `tputs'

Fixes:
 - http://autobuild.buildroot.org/results/dabc6a4f49d464c129ac6bc3710011678142fcbe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-configure.ac-fix-readline-static-build.patch | 49 ++++++++++++++++++++++
 package/ipmitool/ipmitool.mk                       |  2 +-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/package/ipmitool/0001-configure.ac-fix-readline-static-build.patch b/package/ipmitool/0001-configure.ac-fix-readline-static-build.patch
new file mode 100644
index 0000000000..e3d4349502
--- /dev/null
+++ b/package/ipmitool/0001-configure.ac-fix-readline-static-build.patch
@@ -0,0 +1,49 @@
+From 9836e2211ba8b3035a1d390bbf6a0eebe4c2439d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 3 Nov 2022 17:19:09 +0100
+Subject: [PATCH] configure.ac: fix readline static build
+
+Use pkg-config to retrieve readline dependencies such as ncurses to
+avoid the following static build when readline is built with ncurses
+support (which is raised since version 1.8.19 and
+https://github.com/ipmitool/ipmitool/commit/63dd71c39c9bf522ad3a785dd001737a285458eb):
+
+** Unable to build Solaris 9 x86 IPMI interface support!
+checking for library containing readline... no
+configure: error: ** Unable to find readline required by ipmishell.
+
+[...]
+
+configure:15125: /tmp/instance-0/output-1/host/bin/armeb-buildroot-linux-musleabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O0 -g0  -static -Wall -Wextra -std=gnu11 -pedantic -Wformat -Wformat-nonliteral -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lreadline   -lcrypto >&5
+/tmp/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/11.3.0/../../../../armeb-buildroot-linux-musleabi/bin/ld: /tmp/instance-0/output-1/host/armeb-buildroot-linux-musleabi/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
+display.c:(.text+0x80fc): undefined reference to `tputs'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dabc6a4f49d464c129ac6bc3710011678142fcbe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ipmitool/ipmitool/pull/374]
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d6ba62b..4ee1be8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -624,7 +624,11 @@ AC_ARG_ENABLE([ipmishell],
+ 
+ dnl check for readline library to enable ipmi shell
+ if test "x$xenable_ipmishell" = "xyes"; then
+-	AC_SEARCH_LIBS([readline], [readline edit], [have_readline=yes])
++	PKG_PROG_PKG_CONFIG
++	PKG_CHECK_MODULES([READLINE], [readline],
++		[LIBS="$LIBS $READLINE_LIBS" have_readline=yes],
++		[AC_SEARCH_LIBS([readline], [readline edit], [have_readline=yes])]
++	)
+ 	if test "x$have_readline" != "xyes"; then
+ 		AC_MSG_ERROR([** Unable to find readline required by ipmishell.])
+ 		xenable_ipmishell=no
+-- 
+2.35.1
+
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 0b8befffcd..ebd8f9b337 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -34,7 +34,7 @@ IPMITOOL_CONF_OPTS += --disable-intf-usb
 endif
 
 ifeq ($(BR2_PACKAGE_IPMITOOL_IPMISHELL),y)
-IPMITOOL_DEPENDENCIES += readline
+IPMITOOL_DEPENDENCIES += host-pkgconf readline
 IPMITOOL_CONF_OPTS += --enable-ipmishell
 else
 IPMITOOL_CONF_OPTS += --disable-ipmishell
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
