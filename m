Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8586C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5729C404F3;
	Mon, 14 Feb 2022 20:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jv3rGwxjy0SB; Mon, 14 Feb 2022 20:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3668140368;
	Mon, 14 Feb 2022 20:42:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 312941BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FEFC8186E
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a9SN7Kb18mWH for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:42:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 512B081858
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:42:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 22FEA82BDB; Mon, 14 Feb 2022 20:35:07 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 21:38:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33ea4d7887b15ccb3e11d1390c697eee531af565
X-Git-Newrev: d661740201405970f65c16c39a79f4148705af30
X-Patchwork-Hint: ignore
Message-Id: <20220214203507.22FEA82BDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libusb: add -latomic to
 libusb-1.0.pc if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=d661740201405970f65c16c39a79f4148705af30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libusb unconditionally uses atomic since version 1.0.25 and
https://github.com/libusb/libusb/commit/1a08aa84d96397a3840a75abe66051f5360c2c84
resulting in the following build failure with pcsc-lite or openocd since
commit aad609936fc83acfe1eac6ffc86d29ac35dcf54e:

checking for libusb_init... configure: error: libusb not found, use ./configure LIBUSB_LIBS=...

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.so: undefined reference to `__atomic_fetch_add_4'
collect2: error: ld returned 1 exit status

Fixes:
 - http://autobuild.buildroot.org/results/4a27a769bb3cdf78643c3049b87d792178d6512c
 - http://autobuild.buildroot.org/results/b59b30cbe0e27399db5c7586f369104e68a1589a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-configure.ac-link-with-latomic-if-needed.patch | 39 ++++++++++++++++++++++
 package/libusb/libusb.mk                           |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch b/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch
new file mode 100644
index 0000000000..5f6c88e57d
--- /dev/null
+++ b/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch
@@ -0,0 +1,39 @@
+From 0b857081d687f7ee41483a3d7e9846af44a5ba7d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 7 Feb 2022 11:55:54 +0100
+Subject: [PATCH] configure.ac: link with -latomic if needed
+
+libusb unconditionally uses atomic_fetch_add since version 1.0.25 and
+https://github.com/libusb/libusb/commit/1a08aa84d96397a3840a75abe66051f5360c2c84
+https://github.com/libusb/libusb/commit/eed8a371ea53939096ba94d44001e0637d042572
+but some architectures (e.g. sparc) needs to link with -latomic to be
+able to use it. So check if -latomic is needed and update libusb-1.0.pc
+accordingly to avoid the following build failure with openocd:
+
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.so: undefined reference to `__atomic_fetch_add_4'
+collect2: error: ld returned 1 exit status
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4a27a769bb3cdf78643c3049b87d792178d6512c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/libusb/libusb/pull/1064]
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index f6cf2f9..002bcf6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -152,6 +152,7 @@ if test "x$platform" = xposix; then
+ 	AC_SEARCH_LIBS([pthread_create], [pthread],
+ 		[test "x$ac_cv_search_pthread_create" != "xnone required" && AC_SUBST(THREAD_LIBS, [-lpthread])],
+ 		[], [])
++	AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
+ elif test "x$platform" = xwindows; then
+ 	AC_DEFINE([PLATFORM_WINDOWS], [1], [Define to 1 if compiling for a Windows platform.])
+ else
+-- 
+2.34.1
+
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 1e82cb9a85..aa306e295d 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -13,6 +13,8 @@ LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_CPE_ID_VENDOR = libusb
 LIBUSB_DEPENDENCIES = host-pkgconf
 LIBUSB_INSTALL_STAGING = YES
+# We're patching configure.ac
+LIBUSB_AUTORECONF = YES
 
 # Avoid the discovery of udev for the host variant
 HOST_LIBUSB_CONF_OPTS = --disable-udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
