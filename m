Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E47C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D918360B8A;
	Wed, 20 Jul 2022 21:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D918360B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HyKw_IRPNyET; Wed, 20 Jul 2022 21:52:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0D5E60E52;
	Wed, 20 Jul 2022 21:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0D5E60E52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14FFA1BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E18078139D
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E18078139D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nXfv5Vh-KZGa for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:52:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F17588137B
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F17588137B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1A27184110; Wed, 20 Jul 2022 21:38:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 23:51:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25eea4424f12f7cb1f7da04f802478f503b0ae19
X-Git-Newrev: 8d6e07e525617ee0c4ccc4f07345b1b1a70526f7
X-Patchwork-Hint: ignore
Message-Id: <20220720213853.1A27184110@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc, localedef}: bump to version
 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d6e07e525617ee0c4ccc4f07345b1b1a70526f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contains various fixes some of which may effect pthread fork handling.

Add patch reverting a commit breaking builds.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x-Implement-a-useful-version-of-_startup_.patch | 132 +++++++++++++++++++++
 package/glibc/glibc.hash                           |   2 +-
 package/glibc/glibc.mk                             |   2 +-
 package/localedef/localedef.mk                     |   2 +-
 4 files changed, 135 insertions(+), 3 deletions(-)

diff --git a/package/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch b/package/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
new file mode 100644
index 0000000000..549650aca1
--- /dev/null
+++ b/package/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
@@ -0,0 +1,132 @@
+From dfda505870f94a7ac8063eb47f622ddc65665ff1 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 14 Jun 2022 19:42:43 -0600
+Subject: [PATCH] Revert "Linux: Implement a useful version of _startup_fatal"
+
+Fixes:
+csu/libc-tls.c:202: undefined reference to `_startup_fatal_not_constant'
+
+This reverts commit 2d05ba7f8ef979947e910a37ae8115a816eb4d08.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---
+ sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------
+ sysdeps/unix/sysv/linux/startup.h      | 39 --------------------------
+ 3 files changed, 19 insertions(+), 65 deletions(-)
+ delete mode 100644 sysdeps/unix/sysv/linux/ia64/startup.h
+ delete mode 100644 sysdeps/unix/sysv/linux/startup.h
+
+diff --git a/sysdeps/unix/sysv/linux/i386/startup.h b/sysdeps/unix/sysv/linux/i386/startup.h
+index 213805d7d2..67c9310f3a 100644
+--- a/sysdeps/unix/sysv/linux/i386/startup.h
++++ b/sysdeps/unix/sysv/linux/i386/startup.h
+@@ -1,5 +1,5 @@
+ /* Linux/i386 definitions of functions used by static libc main startup.
+-   Copyright (C) 2022 Free Software Foundation, Inc.
++   Copyright (C) 2017-2022 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -16,7 +16,22 @@
+    License along with the GNU C Library; if not, see
+    <https://www.gnu.org/licenses/>.  */
+ 
+-/* Can't use "call *%gs:SYSINFO_OFFSET" during startup.  */
+-#define I386_USE_SYSENTER 0
++#if BUILD_PIE_DEFAULT
++/* Can't use "call *%gs:SYSINFO_OFFSET" during statup in static PIE.  */
++# define I386_USE_SYSENTER 0
+ 
+-#include_next <startup.h>
++# include <sysdep.h>
++# include <abort-instr.h>
++
++__attribute__ ((__noreturn__))
++static inline void
++_startup_fatal (const char *message __attribute__ ((unused)))
++{
++  /* This is only called very early during startup in static PIE.
++     FIXME: How can it be improved?  */
++  ABORT_INSTRUCTION;
++  __builtin_unreachable ();
++}
++#else
++# include_next <startup.h>
++#endif
+diff --git a/sysdeps/unix/sysv/linux/ia64/startup.h b/sysdeps/unix/sysv/linux/ia64/startup.h
+deleted file mode 100644
+index 77f29f15a2..0000000000
+--- a/sysdeps/unix/sysv/linux/ia64/startup.h
++++ /dev/null
+@@ -1,22 +0,0 @@
+-/* Linux/ia64 definitions of functions used by static libc main startup.
+-   Copyright (C) 2022 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <https://www.gnu.org/licenses/>.  */
+-
+-/* This code is used before the TCB is set up.  */
+-#define IA64_USE_NEW_STUB 0
+-
+-#include_next <startup.h>
+diff --git a/sysdeps/unix/sysv/linux/startup.h b/sysdeps/unix/sysv/linux/startup.h
+deleted file mode 100644
+index 39859b404a..0000000000
+--- a/sysdeps/unix/sysv/linux/startup.h
++++ /dev/null
+@@ -1,39 +0,0 @@
+-/* Linux definitions of functions used by static libc main startup.
+-   Copyright (C) 2017-2022 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <https://www.gnu.org/licenses/>.  */
+-
+-#ifdef SHARED
+-# include_next <startup.h>
+-#else
+-# include <sysdep.h>
+-
+-/* Avoid a run-time invocation of strlen.  */
+-#define _startup_fatal(message)                                         \
+-  do                                                                    \
+-    {                                                                   \
+-      size_t __message_length = __builtin_strlen (message);             \
+-      if (! __builtin_constant_p (__message_length))                    \
+-        {                                                               \
+-          extern void _startup_fatal_not_constant (void);               \
+-          _startup_fatal_not_constant ();                               \
+-        }                                                               \
+-      INTERNAL_SYSCALL_CALL (write, STDERR_FILENO, (message),           \
+-                             __message_length);                         \
+-      INTERNAL_SYSCALL_CALL (exit_group, 127);                          \
+-    }                                                                   \
+-  while (0)
+-#endif  /* !SHARED */
+-- 
+2.25.1
+
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index e0bbf341eb..016467cd81 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  fc3c1d25640fd4cd09fbf7e17eafcc7943731e901cc0a3686503ae8adfb11d31  glibc-2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0.tar.gz
+sha256  f339586a104a8e12ff44d38fb24574d2abe694ddba322404f8bc1a50f4343228  glibc-2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f3a08fbf24..5af539ca62 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
+GLIBC_VERSION = 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 061b7c7fc2..ae4cc55f30 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
+LOCALEDEF_VERSION = 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
