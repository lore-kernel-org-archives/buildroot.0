Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E31D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B329960A4C;
	Sun,  7 Dec 2025 14:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHS6tE5BreKo; Sun,  7 Dec 2025 14:12:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83D09607AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765116771;
	bh=atSEC9oirXV57mKU4UquhRp6WUOTe5tV5NIozzgqk+E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=lpUDhu00IywmQ/zcBoUUKcZz9DNXhbI5l1Wi1BHJOfBoN3DJB522L5+dw9+Iwcelx
	 uXvVd7qzssKAut1InXQXyaZzE2R8rMiAeJdoaNxS5u14UykvpKAwsYCT2YLR31+UJs
	 oPc32WuhYqqLJsnu9PTfbfs3dW/+fcb6dSOD5i9pDjsWSGsqF+U/DJ6k9akWW9+HhN
	 uB9g8WCc8hsWzduYjMvHYo6AJXajSXGMcvGlGoSwbWNiu2QNzs7jSob5q5NzIMYcBb
	 jCTAhphXcVn8xOfdw6RFfYV+5aXs+UmXuUmJ7Yk3U2SgJLRT9jPirFVD6RQ+FodHJs
	 C+48EMeo1qvZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83D09607AA;
	Sun,  7 Dec 2025 14:12:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74E40E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 533BD607AA
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uiQZada2Mntq for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:12:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34B6E606EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34B6E606EA
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34B6E606EA
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:12:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 28FF61A1FEC;
 Sun,  7 Dec 2025 14:12:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F1C7E606D3;
 Sun,  7 Dec 2025 14:12:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C249E102F2368; Sun,  7 Dec 2025 15:12:42 +0100 (CET)
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:12:39 +0100
Message-ID: <20251207141240.2863318-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765116764; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=in1LzWJiiVFq2kX8WqJ2kwc6VHLStvf5P5kRRk8lcQ4=;
 b=xnC9wfeK3XzgPJWZ/XxE7TlXZ/EfU7t6zkLE+Z7IShzPdz8DyUtSX9PGwiEhvtsFYgyr0V
 Ui+2tS4iKsQcP4lKOWC4ZuXM1+FzASDKJjOX8Xv7Jljsh8/ZhnQ0LzmHols5EZJllxlsYF
 Mvq5hAIx6Z0Wc94ZPVVuslxIzTX7rxq/INE8e+IcP3Ulzhifv3cvK0i8Jhmeu2HVFYvlHq
 MZr8VjD3PRgHsheqyv+HRmlt8clHMljsr9GYdSbB5RK2P/L74h5HblaflRP5jH0QmxDXQb
 Z6oUQMivs5cAaynsAV4LFXTBDv8trGIlB016IqG7AyRPhgs+8+5hl1uRfZcUGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xnC9wfeK
Subject: [Buildroot] [PATCH v2] package/python3: fix build on Sparc64 due to
 glibc 2.42 bump
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since we bumped to glibc 2.42, the build of Python 3 is failing on
Sparc64 due to the removal of the "struct termio" definition from
glibc. Since this only affects a small number of termio operations, we
simply drop support for them, since they basically can't be used
anymore (and we don't really care that much about those specific
operations that only exist on Sparc64).

Fixes:

  https://autobuild.buildroot.net/results/28fee0f8368ae3dc1d607ebad4881b736e360f07/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
v1 -> v2: improved patch based on upstream feedback
---
 ...ac-detect-unusable-termio-operations.patch | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 package/python3/0009-configure.ac-detect-unusable-termio-operations.patch

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
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
