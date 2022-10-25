Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B32DFA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 20:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D95760A9C;
	Tue, 25 Oct 2022 20:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D95760A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6VWic5Tnrqy; Tue, 25 Oct 2022 20:14:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B831B60AEB;
	Tue, 25 Oct 2022 20:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B831B60AEB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CBF11BF3E3
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 624E240102
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 624E240102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ISgq2tMs5IR4 for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 20:14:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B300400CE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B300400CE
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 20:14:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id C34831BF209;
 Tue, 25 Oct 2022 20:14:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 22:13:59 +0200
Message-Id: <20221025201400.3816183-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666728844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2vSLLmjLe0A4CywzdT/Ybt5Dhj4A6aO5OzTs5nLBRKo=;
 b=Ilrlzc7gAElIA5ztsFL9c8Gsf6qjRiKl7tXa9XciZ8MzcwHra5nVjexPzSVDf5fCBzCWBD
 Ft3GnxQI4G13dJ86EPaNIb3Ns8Q5/In9V0gvxLjeqEDBq9CElVOf1NEbRcrCeKcJ3ELEH0
 DpBFy0PMtd3s/OdLK4+V1Wv8swpHPTsKb6Re/4GxRSVqbajDxEuqediiUQRkPngxb7uAYt
 K35hBo6oFV0F43HMIl5UT7A/ev4wXy2pJffHKA45a1mGEkesIV5CprpXx6is44EGRc2z2m
 diXdwuhBnWuuDoNxQswKfofx+p+bB1Qm1jZrQmCsjkfStVZSCp6wWTsmgd5bWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ilrlzc7g
Subject: [Buildroot] [PATCH] package/gcc: add patch to fix glibc header
 conflict
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit backports the patch "fixinc: don't "fix" machine names in
__has_include(...)" from upstream GCC, which is needed to resolve a
header conflict between glibc headers and kernel headers, which has
appeared since we bumped glibc to version 2.36 in commit
80c8c15c8534a24382b900a07082a289a368f736.

The problem comes from the "fixinc" logic used by gcc to fixup some
headers files, generated inside an include-fixed/ folder. This logic
ended up replacing "linux/mount.h" by "__linux__/mount.h" in
__has_include() invocation, like this:

 #ifdef __has_include
 # if __has_include ("__linux__/mount.h")
 #  include "linux/mount.h"
 # endif
 #endif

in
build/host-gcc-final-11.3.0/build/gcc/include-fixed/sys/mount.h. With
this fix in place, this "include-fixed" header is no longer generated,
avoiding the problem.

This issue was visible in two different ways in glibc configurations:

 - As a build failure during the gcc build itself, for architectures
   that support libsanitizer, as libsanitizer includes mount.h, and
   would therefore encounter the header conflict.

 - As a build failure during another user-space package (such as
   sysvinit for example), on architectures when libsanitizer isn't
   used, and therefore for which the gcc build was successful, but the
   header conflict shows up when building some "random" user-space
   package.

The problem is already fixed in GCC 12.2.0, so no patch is
required. The problem did not exist back in GCC 8.4.0, so this version
does not need patching. Consequently, the patch is only needed for GCC
10.4.0, GCC 11.3.0 and the special ARC 2020.09-release version.

Fixes:

  (gcc build issue, on architecture that supports libsanitizer)
  http://autobuild.buildroot.net/results/90fe4c3b8b72a2c28555674383de9bbd9e8ae09a/

  (sysvinit build issue, on architecture that does not support libsanitizer)
  http://autobuild.buildroot.net/results/d7bf5795b7621a92be32f18794e3e67944fb96db/

  (crun)
  http://autobuild.buildroot.net/results/e3e8da4f797dced48aedf8c636db983d36849850/

  (libarchive)
  http://autobuild.buildroot.net/results/9fcbf0c036a97b2e9a4fcc6e173bcfa09e1b3dac/

Thanks a lot to Peter Seiderer for pointing the relevant GCC commit.

Fixes:

  https://bugs.busybox.net/show_bug.cgi?id=15021

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-machine-names-in-__has_include-.-PR.patch | 124 ++++++++++++++++++
 ...-machine-names-in-__has_include-.-PR.patch | 124 ++++++++++++++++++
 ...-machine-names-in-__has_include-.-PR.patch | 124 ++++++++++++++++++
 3 files changed, 372 insertions(+)
 create mode 100644 package/gcc/10.4.0/0006-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
 create mode 100644 package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
 create mode 100644 package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch

diff --git a/package/gcc/10.4.0/0006-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch b/package/gcc/10.4.0/0006-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
new file mode 100644
index 0000000000..8614537794
--- /dev/null
+++ b/package/gcc/10.4.0/0006-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
@@ -0,0 +1,124 @@
+From a6eedb593ca068d0ad8655dbb97fcd6371cba682 Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <xry111@mengyan1223.wang>
+Date: Mon, 28 Jun 2021 13:54:58 +0800
+Subject: [PATCH] fixinc: don't "fix" machine names in __has_include(...)
+ [PR91085]
+
+fixincludes/
+
+	PR other/91085
+	* fixfixes.c (check_has_inc): New static function.
+	  (machine_name_fix): Don't replace header names in
+	  __has_include(...).
+	* inclhack.def (machine_name): Adjust test.
+	* tests/base/testing.h: Update.
+
+Upstream: 6bf383c37e6131a8e247e8a0997d55d65c830b6d
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ fixincludes/fixfixes.c           | 45 ++++++++++++++++++++++++++++++--
+ fixincludes/inclhack.def         |  3 ++-
+ fixincludes/tests/base/testing.h |  2 +-
+ 3 files changed, 46 insertions(+), 4 deletions(-)
+
+diff --git a/fixincludes/fixfixes.c b/fixincludes/fixfixes.c
+index 034e15d9985..3ff87812036 100644
+--- a/fixincludes/fixfixes.c
++++ b/fixincludes/fixfixes.c
+@@ -477,6 +477,39 @@ FIX_PROC_HEAD( char_macro_def_fix )
+   fputs (text, stdout);
+ }
+ 
++/* Check if the pattern at pos is actually in a "__has_include(...)"
++   directive.  Return the pointer to the ')' of this
++   "__has_include(...)" if it is, NULL otherwise.  */
++static const char *
++check_has_inc (const char *begin, const char *pos, const char *end)
++{
++  static const char has_inc[] = "__has_include";
++  const size_t has_inc_len = sizeof (has_inc) - 1;
++  const char *p;
++
++  for (p = memmem (begin, pos - begin, has_inc, has_inc_len);
++       p != NULL;
++       p = memmem (p, pos - p, has_inc, has_inc_len))
++    {
++      p += has_inc_len;
++      while (p < end && ISSPACE (*p))
++        p++;
++
++      /* "__has_include" may appear as "defined(__has_include)",
++         search for the next appearance then.  */
++      if (*p != '(')
++        continue;
++
++      /* To avoid too much complexity, just hope there is never a
++         ')' in a header name.  */
++      p = memchr (p, ')', end - p);
++      if (p == NULL || p > pos)
++        return p;
++    }
++
++  return NULL;
++}
++
+ /* Fix for machine name #ifdefs that are not in the namespace reserved
+    by the C standard.  They won't be defined if compiling with -ansi,
+    and the headers will break.  We go to some trouble to only change
+@@ -524,7 +557,7 @@ FIX_PROC_HEAD( machine_name_fix )
+       /* If the 'name_pat' matches in between base and limit, we have
+          a bogon.  It is not worth the hassle of excluding comments
+          because comments on #if/#ifdef lines are rare, and strings on
+-         such lines are illegal.
++         such lines are only legal in a "__has_include" directive.
+ 
+          REG_NOTBOL means 'base' is not at the beginning of a line, which
+          shouldn't matter since the name_re has no ^ anchor, but let's
+@@ -544,8 +577,16 @@ FIX_PROC_HEAD( machine_name_fix )
+             break;
+ 
+           p = base + match[0].rm_so;
+-          base += match[0].rm_eo;
+ 
++          /* Check if the match is in __has_include(...) (PR 91085). */
++          q = check_has_inc (base, p, limit);
++          if (q) 
++            {
++              base = q + 1;
++              goto again;
++            }
++
++          base += match[0].rm_eo;
+           /* One more test: if on the same line we have the same string
+              with the appropriate underscores, then leave it alone.
+              We want exactly two leading and trailing underscores.  */
+diff --git a/fixincludes/inclhack.def b/fixincludes/inclhack.def
+index f58e7771e1c..71bd717c233 100644
+--- a/fixincludes/inclhack.def
++++ b/fixincludes/inclhack.def
+@@ -3114,7 +3114,8 @@ fix = {
+     c_fix     = machine_name;
+ 
+     test_text = "/* MACH_DIFF: */\n"
+-    "#if defined( i386 ) || defined( sparc ) || defined( vax )"
++    "#if defined( i386 ) || defined( sparc ) || defined( vax ) || "
++    "defined( linux ) || __has_include ( <linux.h> )"
+     "\n/* no uniform test, so be careful  :-) */";
+ };
+ 
+diff --git a/fixincludes/tests/base/testing.h b/fixincludes/tests/base/testing.h
+index cf95321fb86..8b3accaf04e 100644
+--- a/fixincludes/tests/base/testing.h
++++ b/fixincludes/tests/base/testing.h
+@@ -64,7 +64,7 @@ BSD43__IOWR('T', 1) /* Some are multi-line */
+ 
+ #if defined( MACHINE_NAME_CHECK )
+ /* MACH_DIFF: */
+-#if defined( i386 ) || defined( sparc ) || defined( vax )
++#if defined( i386 ) || defined( sparc ) || defined( vax ) || defined( linux ) || __has_include ( <linux.h> )
+ /* no uniform test, so be careful  :-) */
+ #endif  /* MACHINE_NAME_CHECK */
+ 
+-- 
+2.37.3
+
diff --git a/package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch b/package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
new file mode 100644
index 0000000000..4e93f6ab96
--- /dev/null
+++ b/package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
@@ -0,0 +1,124 @@
+From de3f4ee9a5bd2adcb5ff2e1690db2567fda1473c Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <xry111@mengyan1223.wang>
+Date: Mon, 28 Jun 2021 13:54:58 +0800
+Subject: [PATCH] fixinc: don't "fix" machine names in __has_include(...)
+ [PR91085]
+
+fixincludes/
+
+	PR other/91085
+	* fixfixes.c (check_has_inc): New static function.
+	  (machine_name_fix): Don't replace header names in
+	  __has_include(...).
+	* inclhack.def (machine_name): Adjust test.
+	* tests/base/testing.h: Update.
+
+Upstream: 6bf383c37e6131a8e247e8a0997d55d65c830b6d
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ fixincludes/fixfixes.c           | 45 ++++++++++++++++++++++++++++++--
+ fixincludes/inclhack.def         |  3 ++-
+ fixincludes/tests/base/testing.h |  2 +-
+ 3 files changed, 46 insertions(+), 4 deletions(-)
+
+diff --git a/fixincludes/fixfixes.c b/fixincludes/fixfixes.c
+index 5b23a8b640d..404b420f302 100644
+--- a/fixincludes/fixfixes.c
++++ b/fixincludes/fixfixes.c
+@@ -477,6 +477,39 @@ FIX_PROC_HEAD( char_macro_def_fix )
+   fputs (text, stdout);
+ }
+ 
++/* Check if the pattern at pos is actually in a "__has_include(...)"
++   directive.  Return the pointer to the ')' of this
++   "__has_include(...)" if it is, NULL otherwise.  */
++static const char *
++check_has_inc (const char *begin, const char *pos, const char *end)
++{
++  static const char has_inc[] = "__has_include";
++  const size_t has_inc_len = sizeof (has_inc) - 1;
++  const char *p;
++
++  for (p = memmem (begin, pos - begin, has_inc, has_inc_len);
++       p != NULL;
++       p = memmem (p, pos - p, has_inc, has_inc_len))
++    {
++      p += has_inc_len;
++      while (p < end && ISSPACE (*p))
++        p++;
++
++      /* "__has_include" may appear as "defined(__has_include)",
++         search for the next appearance then.  */
++      if (*p != '(')
++        continue;
++
++      /* To avoid too much complexity, just hope there is never a
++         ')' in a header name.  */
++      p = memchr (p, ')', end - p);
++      if (p == NULL || p > pos)
++        return p;
++    }
++
++  return NULL;
++}
++
+ /* Fix for machine name #ifdefs that are not in the namespace reserved
+    by the C standard.  They won't be defined if compiling with -ansi,
+    and the headers will break.  We go to some trouble to only change
+@@ -524,7 +557,7 @@ FIX_PROC_HEAD( machine_name_fix )
+       /* If the 'name_pat' matches in between base and limit, we have
+          a bogon.  It is not worth the hassle of excluding comments
+          because comments on #if/#ifdef lines are rare, and strings on
+-         such lines are illegal.
++         such lines are only legal in a "__has_include" directive.
+ 
+          REG_NOTBOL means 'base' is not at the beginning of a line, which
+          shouldn't matter since the name_re has no ^ anchor, but let's
+@@ -544,8 +577,16 @@ FIX_PROC_HEAD( machine_name_fix )
+             break;
+ 
+           p = base + match[0].rm_so;
+-          base += match[0].rm_eo;
+ 
++          /* Check if the match is in __has_include(...) (PR 91085). */
++          q = check_has_inc (base, p, limit);
++          if (q) 
++            {
++              base = q + 1;
++              goto again;
++            }
++
++          base += match[0].rm_eo;
+           /* One more test: if on the same line we have the same string
+              with the appropriate underscores, then leave it alone.
+              We want exactly two leading and trailing underscores.  */
+diff --git a/fixincludes/inclhack.def b/fixincludes/inclhack.def
+index 066bef99162..b7ad6982e96 100644
+--- a/fixincludes/inclhack.def
++++ b/fixincludes/inclhack.def
+@@ -3154,7 +3154,8 @@ fix = {
+     c_fix     = machine_name;
+ 
+     test_text = "/* MACH_DIFF: */\n"
+-    "#if defined( i386 ) || defined( sparc ) || defined( vax )"
++    "#if defined( i386 ) || defined( sparc ) || defined( vax ) || "
++    "defined( linux ) || __has_include ( <linux.h> )"
+     "\n/* no uniform test, so be careful  :-) */";
+ };
+ 
+diff --git a/fixincludes/tests/base/testing.h b/fixincludes/tests/base/testing.h
+index cf95321fb86..8b3accaf04e 100644
+--- a/fixincludes/tests/base/testing.h
++++ b/fixincludes/tests/base/testing.h
+@@ -64,7 +64,7 @@ BSD43__IOWR('T', 1) /* Some are multi-line */
+ 
+ #if defined( MACHINE_NAME_CHECK )
+ /* MACH_DIFF: */
+-#if defined( i386 ) || defined( sparc ) || defined( vax )
++#if defined( i386 ) || defined( sparc ) || defined( vax ) || defined( linux ) || __has_include ( <linux.h> )
+ /* no uniform test, so be careful  :-) */
+ #endif  /* MACHINE_NAME_CHECK */
+ 
+-- 
+2.37.3
+
diff --git a/package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch b/package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
new file mode 100644
index 0000000000..8b6be49e68
--- /dev/null
+++ b/package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
@@ -0,0 +1,124 @@
+From 65754c50a57e5a891cee75bb744eb93fdb3c443e Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <xry111@mengyan1223.wang>
+Date: Mon, 28 Jun 2021 13:54:58 +0800
+Subject: [PATCH] fixinc: don't "fix" machine names in __has_include(...)
+ [PR91085]
+
+fixincludes/
+
+	PR other/91085
+	* fixfixes.c (check_has_inc): New static function.
+	  (machine_name_fix): Don't replace header names in
+	  __has_include(...).
+	* inclhack.def (machine_name): Adjust test.
+	* tests/base/testing.h: Update.
+
+Upstream: 6bf383c37e6131a8e247e8a0997d55d65c830b6d
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ fixincludes/fixfixes.c           | 45 ++++++++++++++++++++++++++++++--
+ fixincludes/inclhack.def         |  3 ++-
+ fixincludes/tests/base/testing.h |  2 +-
+ 3 files changed, 46 insertions(+), 4 deletions(-)
+
+diff --git a/fixincludes/fixfixes.c b/fixincludes/fixfixes.c
+index 034e15d9985..3ff87812036 100644
+--- a/fixincludes/fixfixes.c
++++ b/fixincludes/fixfixes.c
+@@ -477,6 +477,39 @@ FIX_PROC_HEAD( char_macro_def_fix )
+   fputs (text, stdout);
+ }
+ 
++/* Check if the pattern at pos is actually in a "__has_include(...)"
++   directive.  Return the pointer to the ')' of this
++   "__has_include(...)" if it is, NULL otherwise.  */
++static const char *
++check_has_inc (const char *begin, const char *pos, const char *end)
++{
++  static const char has_inc[] = "__has_include";
++  const size_t has_inc_len = sizeof (has_inc) - 1;
++  const char *p;
++
++  for (p = memmem (begin, pos - begin, has_inc, has_inc_len);
++       p != NULL;
++       p = memmem (p, pos - p, has_inc, has_inc_len))
++    {
++      p += has_inc_len;
++      while (p < end && ISSPACE (*p))
++        p++;
++
++      /* "__has_include" may appear as "defined(__has_include)",
++         search for the next appearance then.  */
++      if (*p != '(')
++        continue;
++
++      /* To avoid too much complexity, just hope there is never a
++         ')' in a header name.  */
++      p = memchr (p, ')', end - p);
++      if (p == NULL || p > pos)
++        return p;
++    }
++
++  return NULL;
++}
++
+ /* Fix for machine name #ifdefs that are not in the namespace reserved
+    by the C standard.  They won't be defined if compiling with -ansi,
+    and the headers will break.  We go to some trouble to only change
+@@ -524,7 +557,7 @@ FIX_PROC_HEAD( machine_name_fix )
+       /* If the 'name_pat' matches in between base and limit, we have
+          a bogon.  It is not worth the hassle of excluding comments
+          because comments on #if/#ifdef lines are rare, and strings on
+-         such lines are illegal.
++         such lines are only legal in a "__has_include" directive.
+ 
+          REG_NOTBOL means 'base' is not at the beginning of a line, which
+          shouldn't matter since the name_re has no ^ anchor, but let's
+@@ -544,8 +577,16 @@ FIX_PROC_HEAD( machine_name_fix )
+             break;
+ 
+           p = base + match[0].rm_so;
+-          base += match[0].rm_eo;
+ 
++          /* Check if the match is in __has_include(...) (PR 91085). */
++          q = check_has_inc (base, p, limit);
++          if (q) 
++            {
++              base = q + 1;
++              goto again;
++            }
++
++          base += match[0].rm_eo;
+           /* One more test: if on the same line we have the same string
+              with the appropriate underscores, then leave it alone.
+              We want exactly two leading and trailing underscores.  */
+diff --git a/fixincludes/inclhack.def b/fixincludes/inclhack.def
+index f58e7771e1c..71bd717c233 100644
+--- a/fixincludes/inclhack.def
++++ b/fixincludes/inclhack.def
+@@ -3114,7 +3114,8 @@ fix = {
+     c_fix     = machine_name;
+ 
+     test_text = "/* MACH_DIFF: */\n"
+-    "#if defined( i386 ) || defined( sparc ) || defined( vax )"
++    "#if defined( i386 ) || defined( sparc ) || defined( vax ) || "
++    "defined( linux ) || __has_include ( <linux.h> )"
+     "\n/* no uniform test, so be careful  :-) */";
+ };
+ 
+diff --git a/fixincludes/tests/base/testing.h b/fixincludes/tests/base/testing.h
+index cf95321fb86..8b3accaf04e 100644
+--- a/fixincludes/tests/base/testing.h
++++ b/fixincludes/tests/base/testing.h
+@@ -64,7 +64,7 @@ BSD43__IOWR('T', 1) /* Some are multi-line */
+ 
+ #if defined( MACHINE_NAME_CHECK )
+ /* MACH_DIFF: */
+-#if defined( i386 ) || defined( sparc ) || defined( vax )
++#if defined( i386 ) || defined( sparc ) || defined( vax ) || defined( linux ) || __has_include ( <linux.h> )
+ /* no uniform test, so be careful  :-) */
+ #endif  /* MACHINE_NAME_CHECK */
+ 
+-- 
+2.37.3
+
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
