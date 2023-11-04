Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF31C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF60060D4D;
	Sat,  4 Nov 2023 21:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF60060D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yYH_5QibHN2J; Sat,  4 Nov 2023 21:29:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0B1660BAF;
	Sat,  4 Nov 2023 21:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0B1660BAF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70AD91BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43A4640360
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43A4640360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kdpRyyUGQRXJ for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:29:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B76AF40273
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B76AF40273
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A36178644B; Sat,  4 Nov 2023 21:29:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 22:29:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b66e581eb17605fc8cc3d9e90c03000a717b2f57
X-Git-Newrev: bfa3cd74d017ba47b91729f131daf5d5993c5265
X-Patchwork-Hint: ignore
Message-Id: <20231104212932.A36178644B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memcached: fix uclibc-ng build
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfa3cd74d017ba47b91729f131daf5d5993c5265
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc-ng build failure raised since bump to version
1.6.21 in commit 6ce55ab0ed3b7125cd11ecfe8c18aaf156b5f060 and
https://github.com/memcached/memcached/commit/875371a75cbf1f92350de2d1fa0fae4a35ed572b:

/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: memcached-thread.o: in function `thread_setname':
thread.c:(.text+0xea2): undefined reference to `pthread_setname_np'

Fixes:
 - http://autobuild.buildroot.org/results/e856d381f5ec7d2727f21c8bd46dacb456984416

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../memcached/0002-fix-build-on-uclibc-ng.patch    | 64 ++++++++++++++++++++++
 package/memcached/memcached.mk                     |  2 +
 2 files changed, 66 insertions(+)

diff --git a/package/memcached/0002-fix-build-on-uclibc-ng.patch b/package/memcached/0002-fix-build-on-uclibc-ng.patch
new file mode 100644
index 0000000000..a5af7a2adb
--- /dev/null
+++ b/package/memcached/0002-fix-build-on-uclibc-ng.patch
@@ -0,0 +1,64 @@
+From c84e5e55e0e9e793849f721d30979242ed6a6ee3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 1 Oct 2023 14:12:38 +0200
+Subject: [PATCH] fix build on uclibc-ng
+
+Fix the following build failure with uclibc-ng raised since version
+1.6.18 and
+https://github.com/memcached/memcached/commit/875371a75cbf1f92350de2d1fa0fae4a35ed572b:
+
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: memcached-thread.o: in function `thread_setname':
+thread.c:(.text+0xea2): undefined reference to `pthread_setname_np'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e856d381f5ec7d2727f21c8bd46dacb456984416
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: unsent yet (waiting feedback on first patch)
+---
+ configure.ac | 1 +
+ extstore.c   | 2 +-
+ thread.c     | 2 +-
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d94f6fb..5ec5088 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -686,6 +686,7 @@ AC_CHECK_FUNCS(clock_gettime)
+ AC_CHECK_FUNCS(preadv)
+ AC_CHECK_FUNCS(pread)
+ AC_CHECK_FUNCS(eventfd)
++AC_CHECK_FUNCS([pthread_setname_np],[AC_DEFINE(HAVE_PTHREAD_SETNAME_NP, 1, [Define to 1 if support pthread_setname_np])])
+ AC_CHECK_FUNCS([accept4], [AC_DEFINE(HAVE_ACCEPT4, 1, [Define to 1 if support accept4])])
+ AC_CHECK_FUNCS([getopt_long], [AC_DEFINE(HAVE_GETOPT_LONG, 1, [Define to 1 if support getopt_long])])
+ 
+diff --git a/extstore.c b/extstore.c
+index b079465..f6a6180 100644
+--- a/extstore.c
++++ b/extstore.c
+@@ -119,7 +119,7 @@ struct store_engine {
+ #define THR_NAME_MAXLEN 16
+ static void thread_setname(pthread_t thread, const char *name) {
+ assert(strlen(name) < THR_NAME_MAXLEN);
+-#if defined(__linux__)
++#if defined(__linux__) && defined(HAVE_PTHREAD_SETNAME_NP)
+ pthread_setname_np(thread, name);
+ #endif
+ }
+diff --git a/thread.c b/thread.c
+index ee120fa..76651c2 100644
+--- a/thread.c
++++ b/thread.c
+@@ -635,7 +635,7 @@ static void thread_libevent_process(evutil_socket_t fd, short which, void *arg)
+ #define THR_NAME_MAXLEN 16
+ void thread_setname(pthread_t thread, const char *name) {
+ assert(strlen(name) < THR_NAME_MAXLEN);
+-#if defined(__linux__)
++#if defined(__linux__) && defined(HAVE_PTHREAD_SETNAME_NP)
+ pthread_setname_np(thread, name);
+ #endif
+ }
+-- 
+2.40.1
+
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 2ebc672d1c..a1a5eac049 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -13,6 +13,8 @@ MEMCACHED_LICENSE = BSD-3-Clause
 MEMCACHED_LICENSE_FILES = COPYING
 MEMCACHED_CPE_ID_VENDOR = memcached
 MEMCACHED_SELINUX_MODULES = memcached
+# We're patching configure.ac
+MEMCACHED_AUTORECONF = YES
 
 ifeq ($(BR2_ENDIAN),"BIG")
 MEMCACHED_CONF_ENV += ac_cv_c_endian=big
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
