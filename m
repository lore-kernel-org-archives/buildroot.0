Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03CBD3ABEF
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 21:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28ACF407D8;
	Sun,  7 Dec 2025 21:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6BCeCHFFoE8; Sun,  7 Dec 2025 21:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAD2540572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765142877;
	bh=7WCmCHr0NM/GgZDwS4ztajsbaHRFnIPujnEDNtXnIwc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pXAjjdYqdLRjLhtr3eta4B6mWu5BNTyhqYeviC+wOH/3IUcJyEBVfWW/4f82oVdYK
	 64IO9pWQphsiAMFWKMiGuNnTTYgwVizkQFFo4VCbwostWOhySb9JpW6fO+lOFmMORB
	 eVQN15fXkNGgBD7W3cl77PMAlfkKmMSYcQDzQhYXYMJdMwlKER73ow3cOVHNMgPTXU
	 9VJs1ugutlpLkIgDwBSXg62wj0Qq3iuJHFAH2BLoi/LohiZoZB+v1lxfjhM8osYm4O
	 SY5DELGSs6EdL/21qklLNdjff7AFXIxcmbwMkMRjvRq8Buf6S1LnO2L0uR0tZuItdT
	 JycAKLJSrhCoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAD2540572;
	Sun,  7 Dec 2025 21:27:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19BA02CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17FAD40516
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygcAnBjC2QxZ for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B331040572
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B331040572
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE64086896; Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 21:45:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa7fac09854b753cbce26298dd07622e65b1c4f0
X-Git-Newrev: 899703cb37a5e844118a83bff41a43b9c86de1f8
X-Patchwork-Hint: ignore
Message-Id: <20251207212751.AE64086896@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: fix build on Sparc64 due
 to glibc 2.42 bump
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=899703cb37a5e844118a83bff41a43b9c86de1f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we bumped to glibc 2.42, the build of Python 3 is failing on
Sparc64 due to the removal of the "struct termio" definition from
glibc. Since this only affects a small number of termio operations, we
simply drop support for them, since they basically can't be used
anymore (and we don't really care that much about those specific
operations that only exist on Sparc64).

Fixes:

  https://autobuild.buildroot.net/results/28fee0f8368ae3dc1d607ebad4881b736e360f07/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...gure.ac-detect-unusable-termio-operations.patch | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch b/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
new file mode 100644
index 0000000000..1a11caeb49
--- /dev/null
+++ b/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
@@ -0,0 +1,99 @@
+From 2d336d1fedb692350a1e4f131246f60a1195cd93 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 7 Dec 2025 13:57:06 +0100
+Subject: [PATCH] configure.ac: detect unusable termio operations
+
+Some termio operations are not actually usable on some
+architectures. For example, the TCGETA, TCSETA, TCSETAF and TCSETAW
+are defined with a reference to "struct termio" on alpha, hppa and
+sparc64, but "struct termio" is no longer defined since glibc 2.42,
+causing a build failure.
+
+Instead of using those operations as soon as they are defined, this
+commit checks more carefully that they are actually usable. This is
+done using a new m4 macro PY_CHECK_IOCTL.
+
+Upstream: https://github.com/python/cpython/pull/142380
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Modules/termios.c |  8 ++++----
+ configure.ac      | 26 ++++++++++++++++++++++++++
+ 2 files changed, 30 insertions(+), 4 deletions(-)
+
+diff --git a/Modules/termios.c b/Modules/termios.c
+index f2c5a4bafa7..dbfe922d1e8 100644
+--- a/Modules/termios.c
++++ b/Modules/termios.c
+@@ -1115,7 +1115,7 @@ static struct constant {
+ #ifdef TCFLSH
+     {"TCFLSH", TCFLSH},
+ #endif
+-#ifdef TCGETA
++#if defined(HAVE_TCGETA)
+     {"TCGETA", TCGETA},
+ #endif
+ #ifdef TCGETS
+@@ -1127,13 +1127,13 @@ static struct constant {
+ #ifdef TCSBRKP
+     {"TCSBRKP", TCSBRKP},
+ #endif
+-#ifdef TCSETA
++#if defined(HAVE_TCSETA)
+     {"TCSETA", TCSETA},
+ #endif
+-#ifdef TCSETAF
++#if defined(HAVE_TCSETAF)
+     {"TCSETAF", TCSETAF},
+ #endif
+-#ifdef TCSETAW
++#if defined(HAVE_TCSETAW)
+     {"TCSETAW", TCSETAW},
+ #endif
+ #ifdef TCSETS
+diff --git a/configure.ac b/configure.ac
+index 34e4d5dd244..646aa24ecf3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -101,6 +101,26 @@ AC_DEFUN([PY_STDLIB_MOD_SET_NA], [
+     AS_VAR_SET([py_cv_module_]mod, [n/a])])
+ ])
+ 
++dnl PY_CHECK_IOCTL(IOCTL_SYMBOL)
++AC_DEFUN([PY_CHECK_IOCTL],
++[
++  AC_MSG_CHECKING([for $1])
++  AC_COMPILE_IFELSE(
++    [AC_LANG_PROGRAM(
++       [[#include <sys/ioctl.h>]],
++       [[
++         /* Test whether $1 is declared */
++         long val = $1;
++         return 0;
++       ]]
++     )],
++    [AC_MSG_RESULT([yes])
++     AC_DEFINE([HAVE_$1], [1],
++               [Define this if $1 termio operation is usable])],
++    [AC_MSG_RESULT([no])]
++  )
++])
++
+ AC_SUBST([BASECPPFLAGS])
+ if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
+     # If we're building out-of-tree, we need to make sure the following
+@@ -7955,6 +7975,12 @@ AC_ARG_ENABLE(idle3,
+ 	AS_HELP_STRING([--disable-idle3], [disable idle3 IDE]),
+ 	[ IDLE="${enableval}" ], [ IDLE=yes ])
+ 
++# ioctls used by Modules/termios.c but not usable on all platforms
++PY_CHECK_IOCTL([TCGETA])
++PY_CHECK_IOCTL([TCSETA])
++PY_CHECK_IOCTL([TCSETAF])
++PY_CHECK_IOCTL([TCSETAW])
++
+ # generate output files
+ AC_CONFIG_FILES(m4_normalize([
+   Makefile.pre
+-- 
+2.51.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
