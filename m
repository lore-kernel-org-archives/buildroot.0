Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C753C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7D7429BB;
	Fri,  7 Jan 2022 21:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xg8SKg7_DL4M; Fri,  7 Jan 2022 21:09:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 818314290F;
	Fri,  7 Jan 2022 21:09:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 866B61BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 738F5424B3
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahe7aSsO38_e for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:09:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 392D0424B6
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:09:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6FED48349E; Fri,  7 Jan 2022 21:03:06 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 22:09:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abb9e8dae230dcd1024aacf53a41eed0efb06187
X-Git-Newrev: b7fcfb71d7a2256a34554866e2b456a710b8ad0f
X-Patchwork-Hint: ignore
Message-Id: <20220107210306.6FED48349E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtorrent: disable execinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7fcfb71d7a2256a34554866e2b456a710b8ad0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable execinfo to avoid the following build failure raised since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: main.o: in function `do_panic(int)':
/home/giuliobenetti/autobuild/run/instance-0/output-1/build/rtorrent-0.9.8/src/main.cc:606: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/10fc9016013931c58238240216c5950b23b56b30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ded--disable-execinfo-option-to-configure.patch | 34 ++++++++++++++++++++++
 package/rtorrent/rtorrent.mk                       |  3 ++
 2 files changed, 37 insertions(+)

diff --git a/package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch b/package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch
new file mode 100644
index 0000000000..4ff4182b61
--- /dev/null
+++ b/package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch
@@ -0,0 +1,34 @@
+From 582e4e40256b43d3e5322168f1e1ed71ca70ab64 Mon Sep 17 00:00:00 2001
+From: rakshasa <sundell.software@gmail.com>
+Date: Wed, 16 Jun 2021 23:29:01 +0900
+Subject: [PATCH] Added '--disable-execinfo' option to configure.
+
+[Retrieved (and backported) from:
+https://github.com/rakshasa/rtorrent/commit/582e4e40256b43d3e5322168f1e1ed71ca70ab64]
+Signed-off-by: Fabrice Fontaine <Fontaine.fabrice@gmail.com>
+---
+ configure.ac | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e3e7d3f1..0f45bc6a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,7 +27,15 @@ TORRENT_WITHOUT_VARIABLE_FDSET
+ 
+ AC_SYS_LARGEFILE
+ 
+-TORRENT_CHECK_EXECINFO
++AC_ARG_ENABLE(execinfo,
++  AC_HELP_STRING([--disable-execinfo], [disable libexecinfo [[default=enable]]]),
++  [
++    if test "$enableval" = "yes"; then
++      TORRENT_CHECK_EXECINFO
++    fi
++  ],[
++    TORRENT_CHECK_EXECINFO
++  ])
+ 
+ TORRENT_ENABLE_ARCH
+ TORRENT_WITH_SYSROOT
+ 
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index bc3afe8064..210b1d34dc 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -9,5 +9,8 @@ RTORRENT_SITE = http://rtorrent.net/downloads
 RTORRENT_DEPENDENCIES = host-pkgconf libcurl libtorrent ncurses
 RTORRENT_LICENSE = GPL-2.0
 RTORRENT_LICENSE_FILES = COPYING
+# We're patching configure.ac
+RTORRENT_AUTORECONF = YES
+RTORRENT_CONF_OPTS = --disable-execinfo
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
