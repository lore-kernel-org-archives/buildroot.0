Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AFBC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 14:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E899040B0C;
	Tue,  7 Jun 2022 14:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjDdN45qlkoY; Tue,  7 Jun 2022 14:07:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6134240AFE;
	Tue,  7 Jun 2022 14:07:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 299A11BF397
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CD43610C4
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jE7L9nReoy1 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 14:05:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB06B613FA
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 14:05:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6198886749; Tue,  7 Jun 2022 13:54:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 16:04:25 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: cc6b902095c5ea847265dc408265ed87a7a05dd4
X-Git-Newrev: c557229451a3999e984dbf55a029f9a4cbf43424
X-Patchwork-Hint: ignore
Message-Id: <20220607135403.6198886749@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/memcached: fix
 uclibc build on aarch64
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

commit: https://git.buildroot.net/buildroot/commit/?id=c557229451a3999e984dbf55a029f9a4cbf43424
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following uclibc build failure on aarch64:

crc32c.c:277:10: fatal error: sys/auxv.h: No such file or directory
  277 | #include <sys/auxv.h>
      |          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/08591fbf9677ff126492c50c15170c641bcab56a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 97b533c3c2571eccf501de05b270ff5eec711f0d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memcached/0002-check-for-sys-auxv.h.patch | 50 +++++++++++++++++++++++
 package/memcached/memcached.mk                    |  2 +
 2 files changed, 52 insertions(+)

diff --git a/package/memcached/0002-check-for-sys-auxv.h.patch b/package/memcached/0002-check-for-sys-auxv.h.patch
new file mode 100644
index 0000000000..49b12ef7d7
--- /dev/null
+++ b/package/memcached/0002-check-for-sys-auxv.h.patch
@@ -0,0 +1,50 @@
+From 58b6de2135c10b64918f25c48f69f144d08a9c0d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 3 Jun 2022 19:10:15 +0200
+Subject: [PATCH 2/2] check for sys/auxv.h
+
+Check for sys/auxv.h to avoid the following uclibc build failure on
+aarch64:
+
+crc32c.c:277:10: fatal error: sys/auxv.h: No such file or directory
+  277 | #include <sys/auxv.h>
+      |          ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/08591fbf9677ff126492c50c15170c641bcab56a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ configure.ac | 1 +
+ crc32c.c     | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0985f07..3337fe7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -516,6 +516,7 @@ AH_BOTTOM([#ifdef HAVE_INTTYPES_H
+ #include <inttypes.h>
+ #endif
+ ])
++AC_CHECK_HEADERS([sys/auxv.h])
+ 
+ dnl **********************************************************************
+ dnl Figure out if this system has the stupid sasl_callback_ft
+diff --git a/crc32c.c b/crc32c.c
+index 26df879..05e61ff 100644
+--- a/crc32c.c
++++ b/crc32c.c
+@@ -273,7 +273,7 @@ void crc32c_init(void) {
+     }
+ }
+ 
+-#elif defined(__aarch64__) && defined(__linux__)
++#elif defined(__aarch64__) && defined(__linux__) && defined(HAVE_SYS_AUX_H)
+ #include <sys/auxv.h>
+ 
+ #if defined(HWCAP_CRC32)
+-- 
+2.35.1
+
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 8f3506f9d4..842c0b42fa 100644
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
