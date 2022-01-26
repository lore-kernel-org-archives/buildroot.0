Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B907C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F23AC41670;
	Wed, 26 Jan 2022 22:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddR7KSdN68nt; Wed, 26 Jan 2022 22:08:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 058904158E;
	Wed, 26 Jan 2022 22:08:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07D881BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9F9E4158E
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2HwG_8-Qu3S for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:08:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B06354099B
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:08:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3CBC58276A; Wed, 26 Jan 2022 22:01:46 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 23:08:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f92c093c7a39b8e0d6754c452268b0af20ef860b
X-Git-Newrev: f53928c2cb9bcc188a2586fc97535c2238ead50b
X-Patchwork-Hint: ignore
Message-Id: <20220126220146.3CBC58276A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeipmi: bump to version 1.6.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=f53928c2cb9bcc188a2586fc97535c2238ead50b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version) and so autoreconf

https://github.com/chu11/freeipmi-mirror/blob/freeipmi-1-6-9/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeipmi/0001-fix-build-on-musl.patch      | 49 ---------------------
 package/freeipmi/0002-check-for-inb-and-outb.patch | 50 ----------------------
 package/freeipmi/freeipmi.hash                     |  2 +-
 package/freeipmi/freeipmi.mk                       |  4 +-
 4 files changed, 2 insertions(+), 103 deletions(-)

diff --git a/package/freeipmi/0001-fix-build-on-musl.patch b/package/freeipmi/0001-fix-build-on-musl.patch
deleted file mode 100644
index ff7425d221..0000000000
--- a/package/freeipmi/0001-fix-build-on-musl.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 6295c96ae54cb16efe41e53f526a4dc19cd719f2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 30 Oct 2021 00:26:40 +0200
-Subject: [PATCH] fix build on musl
-
-musl doesn't provide getmsg or putmsg even if stropts.h is available
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/freeipmi.git/commit/?id=6295c96ae54cb16efe41e53f526a4dc19cd719f2]
----
- configure.ac                            | 1 +
- libfreeipmi/driver/ipmi-sunbmc-driver.c | 4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 562dd624e..711b27674 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -479,6 +479,7 @@ AC_CHECK_FUNCS([flockfile fputs_unlocked fwrite_unlocked])
- AC_CHECK_FUNCS([iopl])
- AC_CHECK_FUNCS([asprintf])
- AC_CHECK_FUNCS([cbrt])
-+AC_CHECK_FUNCS([getmsg putmsg])
- 
- dnl sighandler_t apparently not defined in Apple/OS X
- AC_CHECK_TYPES([sighandler_t], [], [], [[#include <signal.h>]])
-diff --git a/libfreeipmi/driver/ipmi-sunbmc-driver.c b/libfreeipmi/driver/ipmi-sunbmc-driver.c
-index 05caca8b6..4ae8c5719 100644
---- a/libfreeipmi/driver/ipmi-sunbmc-driver.c
-+++ b/libfreeipmi/driver/ipmi-sunbmc-driver.c
-@@ -423,7 +423,7 @@ _sunbmc_write (ipmi_sunbmc_ctx_t ctx,
-   assert (ctx->io_init);
-   assert (ctx->putmsg_intf);
- 
--#if defined(HAVE_SYS_STROPTS_H)
-+#if defined(HAVE_SYS_STROPTS_H) && defined(HAVE_PUTMSG)
-   memset (&sbuf, '\0', sizeof (struct strbuf));
- 
-   /* Due to API differences, we need to extract the cmd out of the
-@@ -573,7 +573,7 @@ _sunbmc_read (ipmi_sunbmc_ctx_t ctx,
-       return (-1);
-     }
- 
--#if defined(HAVE_SYS_STROPTS_H)
-+#if defined(HAVE_SYS_STROPTS_H) && defined(HAVE_GETMSG)
-   if (getmsg (ctx->device_fd, NULL, &sbuf, &flags) < 0)
-     {
-       SUNBMC_ERRNO_TO_SUNBMC_ERRNUM (ctx, errno);
diff --git a/package/freeipmi/0002-check-for-inb-and-outb.patch b/package/freeipmi/0002-check-for-inb-and-outb.patch
deleted file mode 100644
index 3bc006acc7..0000000000
--- a/package/freeipmi/0002-check-for-inb-and-outb.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 47249279f3ef2c1fcfc312294f1c98c35232aed0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 2 Jan 2022 10:37:00 +0100
-Subject: [PATCH] check for inb and outb
-
-Check for inb and outb before using them to avoid the following build
-failure on uclibc-ng:
-
-/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: ../libfreeipmi/.libs/libfreeipmi.a(libfreeipmi_la-ipmi-kcs-driver.o): in function `_ipmi_kcs_test_if_state':
-/home/buildroot/autobuild/instance-1/output-1/build/freeipmi-1.6.8/libfreeipmi/driver/ipmi-kcs-driver.c:537: undefined reference to `inb'
-
-Fixes:
- - http://autobuild.buildroot.org/results/13f58266f7747c183033c811a4e8ca6fa30b6f4d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/chu11/freeipmi-mirror/pull/50]
----
- configure.ac                         | 2 +-
- libfreeipmi/driver/ipmi-kcs-driver.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 711b27674..bcc4156ff 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -476,7 +476,7 @@ AC_CHECK_FUNCS([memcpy mempcpy memset mlock])
- AC_CHECK_FUNCS([getline getprogname])
- AC_CHECK_FUNCS([strerror strerror_r])
- AC_CHECK_FUNCS([flockfile fputs_unlocked fwrite_unlocked])
--AC_CHECK_FUNCS([iopl])
-+AC_CHECK_FUNCS([inb iopl outb])
- AC_CHECK_FUNCS([asprintf])
- AC_CHECK_FUNCS([cbrt])
- AC_CHECK_FUNCS([getmsg putmsg])
-diff --git a/libfreeipmi/driver/ipmi-kcs-driver.c b/libfreeipmi/driver/ipmi-kcs-driver.c
-index c212887c0..a9d4b2e96 100644
---- a/libfreeipmi/driver/ipmi-kcs-driver.c
-+++ b/libfreeipmi/driver/ipmi-kcs-driver.c
-@@ -162,7 +162,7 @@
- #if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
- # define _INB(port)  inb (port)
- # define _OUTB(data, port)  outb (port, data)
--#elif defined(HAVE_IOPL)
-+#elif defined(HAVE_INB) && defined(HAVE_OUTB)
- # define _INB(port)  inb (port)
- # define _OUTB(data, port)  outb (data, port)
- #else
--- 
-2.33.0
-
diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
index f73b4a25fe..05fb50bd4c 100644
--- a/package/freeipmi/freeipmi.hash
+++ b/package/freeipmi/freeipmi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  4aa46a269ecc1bbff9412451f17b5408f64395e7dc45b713edf5eb5362700a71  freeipmi-1.6.8.tar.gz
+sha256  f25e1c35f3d0f1b5a99cc31ecc2353ca83ed46a15163842fba870127dc9c8206  freeipmi-1.6.9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index b25ef0a4c6..9fb59245b9 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREEIPMI_VERSION = 1.6.8
+FREEIPMI_VERSION = 1.6.9
 FREEIPMI_SITE = https://ftp.gnu.org/gnu/freeipmi
 FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
 FREEIPMI_LICENSE_FILES = \
@@ -14,8 +14,6 @@ FREEIPMI_LICENSE_FILES = \
 	COPYING.sunbmc COPYING.ZRESEARCH
 FREEIPMI_DEPENDENCIES = host-pkgconf
 FREEIPMI_INSTALL_STAGING = YES
-# We're patching configure.ac
-FREEIPMI_AUTORECONF = YES
 # Disable checking for /dev/urandom and /dev/random through AC_CHECK_FILE
 FREEIPMI_CONF_OPTS = --without-random-device
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
