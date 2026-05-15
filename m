Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE65CCD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 990E741DD4;
	Fri, 15 May 2026 17:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDk8_OFO13Zh; Fri, 15 May 2026 17:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A912841DDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867228;
	bh=Mgo/rRARKl8Buy4e7TklrHEF3BqA3asoIaOFhGfBdAQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l1HRPi8+Ux1dNG0RLzyttmi7LOC4QhDTPFPKOVw5lMJPRuaofdNVe1ZrKX9UHHnB/
	 LvJudPygmWX10IfVQiYQEeSQ8+B9wtSm5sxcRnLFBeSYE0q17rJqYeWuNCzFS1GhIT
	 +VkScuizbnmShVCFfcO1L2IjAldKOXbU58+rfPkBJZn4/3XJxdPCqTHwLY4y8PpBcj
	 8SlrS6CHD9AqoNgdI90GEkkMxUFPIwDFGf2ZheA++h7tYOFok+U52uHZRSFgZHl4TQ
	 MFaOr2aJsz+orvQdzPqnEqylj9ri8kMw724LsxC6++ALV2o505HH3iu5uEngq+vfJ2
	 I5+KHTQdescJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A912841DDB;
	Fri, 15 May 2026 17:47:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0390645B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C17B341DA7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SaV14fMcdIx for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 730D441D58
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 730D441D58
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1E32863D7; Fri, 15 May 2026 17:46:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:19:28 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: c7e20789e8e302de7b0bff3f670032fcb21370c5
X-Git-Newrev: dd1ddca614246ca31cc4755632d538f41dc2682c
X-Patchwork-Hint: ignore
Message-Id: <20260515174639.B1E32863D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/make: fix build
 with musl and gcc-15.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd1ddca614246ca31cc4755632d538f41dc2682c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Patch the parts of Make that use code invalid in C23.  It wasn't
included when compiling with glibc but failed to build with musl.

Fixes #176.  See also https://savannah.gnu.org/bugs/index.php?68302

Signed-off-by: Daniel Houck <Software@DRHouck.me>
[Marcus: link to savannah bug report also in the patchfile]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit dff61f65ec655513cec87133c7b3fc1ecd95649c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-fix-compilation-on-musl-with-gcc15.patch  | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/package/make/0001-fix-compilation-on-musl-with-gcc15.patch b/package/make/0001-fix-compilation-on-musl-with-gcc15.patch
new file mode 100644
index 0000000000..fb51682f58
--- /dev/null
+++ b/package/make/0001-fix-compilation-on-musl-with-gcc15.patch
@@ -0,0 +1,68 @@
+From 31bc8976fb7bfdde8b9293e6a4eb2becb29a73bc Mon Sep 17 00:00:00 2001
+From: Bobby Bingham <koorogi@koorogi.info>
+Date: Wed, 2 Jul 2025 18:09:28 -0500
+Subject: [PATCH] fix compilation on musl with gcc15
+
+Patch originally from https://codeberg.org/gentoo/gentoo/raw/branch/master/dev-build/make/files/make-4.4.1-c23.patch
+
+This addresses the same issues as, but is not quite identical to, the
+patch linked to as upstream.  Upstream has not acknowledged its patch in
+any way.
+
+Upstream bug report: https://savannah.gnu.org/bugs/index.php?68302
+
+Signed-off-by: Daniel Houck <Software@DRHouck.me>
+Upstream: https://lists.gnu.org/archive/html/bug-make/2025-03/msg00032.html
+---
+ lib/fnmatch.c | 2 +-
+ src/getopt.c  | 2 +-
+ src/getopt.h  | 7 -------
+ 3 files changed, 2 insertions(+), 9 deletions(-)
+
+diff --git a/lib/fnmatch.c b/lib/fnmatch.c
+index 01da376..9b54022 100644
+--- a/lib/fnmatch.c
++++ b/lib/fnmatch.c
+@@ -121,7 +121,7 @@ USA.  */
+    whose names are inconsistent.  */
+ 
+ # if !defined _LIBC && !defined getenv
+-extern char *getenv ();
++extern char *getenv (const char*);
+ # endif
+ 
+ # ifndef errno
+diff --git a/src/getopt.c b/src/getopt.c
+index 7a792de..9b56abe 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -202,7 +202,7 @@ static char *posixly_correct;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char*);
+ #endif
+ 
+ static char *
+diff --git a/src/getopt.h b/src/getopt.h
+index df18cee..a6cc621 100644
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -96,14 +96,7 @@ struct option
+ #define optional_argument	2
+ 
+ #if defined (__STDC__) && __STDC__
+-#ifdef __GNU_LIBRARY__
+-/* Many other libraries have conflicting prototypes for getopt, with
+-   differences in the consts, in stdlib.h.  To avoid compilation
+-   errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *shortopts);
+-#else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
+-#endif /* __GNU_LIBRARY__ */
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,
+ 		        const struct option *longopts, int *longind);
+ extern int getopt_long_only (int argc, char *const *argv,
+-- 
+2.50.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
