Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AE4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:34:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A756361AE2
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A756361AE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75D2440412;
	Tue, 16 Nov 2021 20:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GeW84rUfWBgP; Tue, 16 Nov 2021 20:34:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DC4440445;
	Tue, 16 Nov 2021 20:34:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 082BA1BF3D1
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E40A280F41
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kTXmRUlYoPp for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3753680F0D
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8E4E28D362; Tue, 16 Nov 2021 20:28:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 16 Nov 2021 20:59:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7eff63bc802e5c9c7cfa1cc2a0711241585f76f
X-Git-Newrev: b86d9c661d76044f4fc74ca2e879c6c532aebf17
X-Patchwork-Hint: ignore
Message-Id: <20211116202859.8E4E28D362@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: gdb-11.1 compile for uclibc
 (ADDR_NO_RANDOMIZE related)
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
Content-Type: multipart/mixed; boundary="===============4690338301073054553=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4690338301073054553==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b86d9c661d76044f4fc74ca2e879c6c532aebf17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add upstream patch ([1]) to fix the ADDR_NO_RANDOMIZE compile failure
  introduced with commit [2] (see [3] for details)

Fixes:

  ../../gdbserver/../gdb/nat/linux-personality.c: In constructor ‘maybe_disable_address_space_randomization::maybe_disable_address_space_randomization(int)’:
  ../../gdbserver/../gdb/nat/linux-personality.c:36:48: error: ‘ADDR_NO_RANDOMIZE’ was not declared in this scope
     36 |       if (errno == 0 && !(m_personality_orig & ADDR_NO_RANDOMIZE))
        |                                                ^~~~~~~~~~~~~~~~~
  ../../gdbserver/../gdb/nat/linux-personality.c:42:37: error: ‘ADDR_NO_RANDOMIZE’ was not declared in this scope
     42 |     && !(personality (0xffffffff) & ADDR_NO_RANDOMIZE)))
        |                                     ^~~~~~~~~~~~~~~~~

[1] https://sourceware.org/git/?p=binutils-gdb.git;h=0b03c6f03d51f441d999e0cee92f81af543d9373
[2] https://sourceware.org/git/?p=binutils-gdb.git;h=4655f8509fd44e6efabefa373650d9982ff37fd6
[3] https://sourceware.org/bugzilla/show_bug.cgi?id=28555

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gdb/11.1/0008-Fix-build-on-rhES5.patch | 194 +++++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/package/gdb/11.1/0008-Fix-build-on-rhES5.patch b/package/gdb/11.1/0008-Fix-build-on-rhES5.patch
new file mode 100644
index 0000000000..2d4e30ffe1
--- /dev/null
+++ b/package/gdb/11.1/0008-Fix-build-on-rhES5.patch
@@ -0,0 +1,194 @@
+From db3aaeda1d6b156100d969edb8c0e674bca6b201 Mon Sep 17 00:00:00 2001
+From: Tom Tromey <tromey@adacore.com>
+Date: Wed, 12 May 2021 12:39:22 -0600
+Subject: [PATCH] Fix build on rhES5
+
+The rhES5 build failed due to an upstream import a while back.  The
+bug here is that, while the 'personality' function exists,
+ADDR_NO_RANDOMIZE is only defined in <linux/personality.h>, not
+<sys/personality.h>.
+
+However, <linux/personality.h> does not declare the 'personality'
+function, and <sys/personality.h> and <linux/personality.h> cannot
+both be included.
+
+This patch restores one of the removed configure checks and updates
+the code to check it.
+
+We had this as a local patch at AdaCore, because it seemed like there
+was no interest upstream.  However, now it turns out that this fixes
+PR build/28555, so I'm sending it now.
+
+[Upstream: https://sourceware.org/git?p=binutils-gdb.git;h=0b03c6f03d51f441d999e0cee92f81af543d9373]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ gdb/config.in               |  4 ++++
+ gdb/configure               | 16 ++++++++++++++++
+ gdb/nat/linux-personality.c |  4 ++++
+ gdbserver/config.in         |  4 ++++
+ gdbserver/configure         | 16 ++++++++++++++++
+ gdbsupport/common.m4        |  5 +++++
+ gdbsupport/config.in        |  4 ++++
+ gdbsupport/configure        | 16 ++++++++++++++++
+ 8 files changed, 69 insertions(+)
+
+diff --git a/gdb/config.in b/gdb/config.in
+index 2c30504..776bee9 100644
+--- a/gdb/config.in
++++ b/gdb/config.in
+@@ -96,6 +96,10 @@
+ /* define if the compiler supports basic C++11 syntax */
+ #undef HAVE_CXX11
+ 
++/* Define to 1 if you have the declaration of `ADDR_NO_RANDOMIZE', and to 0 if
++   you don't. */
++#undef HAVE_DECL_ADDR_NO_RANDOMIZE
++
+ /* Define to 1 if you have the declaration of `asprintf', and to 0 if you
+    don't. */
+ #undef HAVE_DECL_ASPRINTF
+diff --git a/gdb/configure b/gdb/configure
+index 5d89635..27e3194 100755
+--- a/gdb/configure
++++ b/gdb/configure
+@@ -13838,6 +13838,22 @@ fi
+ done
+ 
+ 
++  # This is needed for RHEL 5 and uclibc-ng < 1.0.39.
++  # These did not define ADDR_NO_RANDOMIZE in sys/personality.h,
++  # only in linux/personality.h.
++  ac_fn_c_check_decl "$LINENO" "ADDR_NO_RANDOMIZE" "ac_cv_have_decl_ADDR_NO_RANDOMIZE" "#include <sys/personality.h>
++"
++if test "x$ac_cv_have_decl_ADDR_NO_RANDOMIZE" = xyes; then :
++  ac_have_decl=1
++else
++  ac_have_decl=0
++fi
++
++cat >>confdefs.h <<_ACEOF
++#define HAVE_DECL_ADDR_NO_RANDOMIZE $ac_have_decl
++_ACEOF
++
++
+   ac_fn_c_check_decl "$LINENO" "strstr" "ac_cv_have_decl_strstr" "$ac_includes_default"
+ if test "x$ac_cv_have_decl_strstr" = xyes; then :
+   ac_have_decl=1
+diff --git a/gdb/nat/linux-personality.c b/gdb/nat/linux-personality.c
+index 9ce345b..27999fd 100644
+--- a/gdb/nat/linux-personality.c
++++ b/gdb/nat/linux-personality.c
+@@ -22,6 +22,10 @@
+ 
+ #include <sys/personality.h>
+ 
++# if !HAVE_DECL_ADDR_NO_RANDOMIZE
++#  define ADDR_NO_RANDOMIZE 0x0040000
++# endif /* ! HAVE_DECL_ADDR_NO_RANDOMIZE */
++
+ /* See comment on nat/linux-personality.h.  */
+ 
+ maybe_disable_address_space_randomization::
+diff --git a/gdbserver/config.in b/gdbserver/config.in
+index cf06c56..c9258b3 100644
+--- a/gdbserver/config.in
++++ b/gdbserver/config.in
+@@ -31,6 +31,10 @@
+ /* define if the compiler supports basic C++11 syntax */
+ #undef HAVE_CXX11
+ 
++/* Define to 1 if you have the declaration of `ADDR_NO_RANDOMIZE', and to 0 if
++   you don't. */
++#undef HAVE_DECL_ADDR_NO_RANDOMIZE
++
+ /* Define to 1 if you have the declaration of `asprintf', and to 0 if you
+    don't. */
+ #undef HAVE_DECL_ASPRINTF
+diff --git a/gdbserver/configure b/gdbserver/configure
+index b227167..d399d71 100755
+--- a/gdbserver/configure
++++ b/gdbserver/configure
+@@ -7131,6 +7131,22 @@ fi
+ done
+ 
+ 
++  # This is needed for RHEL 5 and uclibc-ng < 1.0.39.
++  # These did not define ADDR_NO_RANDOMIZE in sys/personality.h,
++  # only in linux/personality.h.
++  ac_fn_c_check_decl "$LINENO" "ADDR_NO_RANDOMIZE" "ac_cv_have_decl_ADDR_NO_RANDOMIZE" "#include <sys/personality.h>
++"
++if test "x$ac_cv_have_decl_ADDR_NO_RANDOMIZE" = xyes; then :
++  ac_have_decl=1
++else
++  ac_have_decl=0
++fi
++
++cat >>confdefs.h <<_ACEOF
++#define HAVE_DECL_ADDR_NO_RANDOMIZE $ac_have_decl
++_ACEOF
++
++
+   ac_fn_c_check_decl "$LINENO" "strstr" "ac_cv_have_decl_strstr" "$ac_includes_default"
+ if test "x$ac_cv_have_decl_strstr" = xyes; then :
+   ac_have_decl=1
+diff --git a/gdbsupport/common.m4 b/gdbsupport/common.m4
+index 901c454..56a355e 100644
+--- a/gdbsupport/common.m4
++++ b/gdbsupport/common.m4
+@@ -55,6 +55,11 @@ AC_DEFUN([GDB_AC_COMMON], [
+ 		  ptrace64 sbrk setns sigaltstack sigprocmask \
+ 		  setpgid setpgrp getrusage getauxval sigtimedwait])
+ 
++  # This is needed for RHEL 5 and uclibc-ng < 1.0.39.
++  # These did not define ADDR_NO_RANDOMIZE in sys/personality.h,
++  # only in linux/personality.h.
++  AC_CHECK_DECLS([ADDR_NO_RANDOMIZE],,, [#include <sys/personality.h>])
++
+   AC_CHECK_DECLS([strstr])
+ 
+   # ----------------------- #
+diff --git a/gdbsupport/config.in b/gdbsupport/config.in
+index f46e261..6945a62 100644
+--- a/gdbsupport/config.in
++++ b/gdbsupport/config.in
+@@ -28,6 +28,10 @@
+ /* define if the compiler supports basic C++11 syntax */
+ #undef HAVE_CXX11
+ 
++/* Define to 1 if you have the declaration of `ADDR_NO_RANDOMIZE', and to 0 if
++   you don't. */
++#undef HAVE_DECL_ADDR_NO_RANDOMIZE
++
+ /* Define to 1 if you have the declaration of `asprintf', and to 0 if you
+    don't. */
+ #undef HAVE_DECL_ASPRINTF
+diff --git a/gdbsupport/configure b/gdbsupport/configure
+index a9dd02c..243a03f 100755
+--- a/gdbsupport/configure
++++ b/gdbsupport/configure
+@@ -8144,6 +8144,22 @@ fi
+ done
+ 
+ 
++  # This is needed for RHEL 5 and uclibc-ng < 1.0.39.
++  # These did not define ADDR_NO_RANDOMIZE in sys/personality.h,
++  # only in linux/personality.h.
++  ac_fn_c_check_decl "$LINENO" "ADDR_NO_RANDOMIZE" "ac_cv_have_decl_ADDR_NO_RANDOMIZE" "#include <sys/personality.h>
++"
++if test "x$ac_cv_have_decl_ADDR_NO_RANDOMIZE" = xyes; then :
++  ac_have_decl=1
++else
++  ac_have_decl=0
++fi
++
++cat >>confdefs.h <<_ACEOF
++#define HAVE_DECL_ADDR_NO_RANDOMIZE $ac_have_decl
++_ACEOF
++
++
+   ac_fn_c_check_decl "$LINENO" "strstr" "ac_cv_have_decl_strstr" "$ac_includes_default"
+ if test "x$ac_cv_have_decl_strstr" = xyes; then :
+   ac_have_decl=1
+-- 
+2.33.1
+

--===============4690338301073054553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4690338301073054553==--
