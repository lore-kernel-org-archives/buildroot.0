Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B12C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 11:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FABC60C33;
	Wed, 26 Oct 2022 11:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FABC60C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IiKHZF1tNIxW; Wed, 26 Oct 2022 11:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCAD560D59;
	Wed, 26 Oct 2022 11:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCAD560D59
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0F3D1BF59A
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 11:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B90F402F3
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 11:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B90F402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QMsZ7YyKBuhu for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 11:36:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53D5240242
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 11:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53D5240242
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39DA1870FE; Wed, 26 Oct 2022 11:36:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 13:35:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7983d366849527f7de3478e7dcda7cc1a0ba2e1c
X-Git-Newrev: 4ed7d51d1896144caecfd40cf760cf13bbdb9c9d
X-Patchwork-Hint: ignore
Message-Id: <20221026113607.39DA1870FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: add patch to fix glibc header
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ed7d51d1896144caecfd40cf760cf13bbdb9c9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-fix-machine-names-in-__has_include-.-PR.patch | 124 +++++++++++++++++++++
 ...t-fix-machine-names-in-__has_include-.-PR.patch | 124 +++++++++++++++++++++
 ...t-fix-machine-names-in-__has_include-.-PR.patch | 124 +++++++++++++++++++++
 3 files changed, 372 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
