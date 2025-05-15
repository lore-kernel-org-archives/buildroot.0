Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF34C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86B9F424E1;
	Fri, 16 May 2025 11:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjmGyHO0zhFY; Fri, 16 May 2025 11:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9801D424C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9801D424C3;
	Fri, 16 May 2025 11:23:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AFDE185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B241813D0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVs1AtEkOs3I for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C3CD83AB4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C3CD83AB4
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80F0C82929; Fri, 16 May 2025 11:21:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 17:06:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7e2b4f4d4170beb41f58dc4fdad3602c0d97bb9e
X-Git-Newrev: 869469e9534fa6715ed0d8bf3764f0df882f05c8
X-Patchwork-Hint: ignore
Message-Id: <20250516112155.80F0C82929@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cpio: fix build
 with GCC 15
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

commit: https://git.buildroot.net/buildroot/commit/?id=869469e9534fa6715ed0d8bf3764f0df882f05c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

On systems running GCC 15, host-cpio will fail to build with errors like

  copyout.c:646:12: error: too many arguments to function 'xstat'; expected 0, have 2

and

  main.c:407:13: error: assignment to 'int (*)(void)' from incompatible pointer type 'int (*)(const char * restrict,  struct stat * restrict)' [-Wincompatible-pointer-types]

This was reported[1] and fixed upstream, but there is no new release
yet. Import the upstream patch for now.

Fixes:
https://autobuild.buildroot.org/results/a10c5f2b0f9cb05b2550fe97f1133deaaac97277/
(and many more)

[1] https://lists.gnu.org/archive/html/bug-cpio/2025-05/msg00000.html

Signed-off-by: Florian Larysch <fl@n621.de>
[Julien:
 - add missing "Signed-off-by:" in patch to fix check-package error
 - change "Upstream:" link to use the commitdiff in patch
 - add "Fixes:" in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e3cae9e1ca4765da825c9ee94760e12f5c6c142a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cpio/0001-Fix-c23-conformity.patch | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/cpio/0001-Fix-c23-conformity.patch b/package/cpio/0001-Fix-c23-conformity.patch
new file mode 100644
index 0000000000..9421f28507
--- /dev/null
+++ b/package/cpio/0001-Fix-c23-conformity.patch
@@ -0,0 +1,48 @@
+From f42137f5ab9cf07d1e62edc05e0212688d3ebaa2 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Tue, 6 May 2025 21:02:43 +0300
+Subject: [PATCH] Fix c23 conformity
+
+Upstream: https://git.savannah.gnu.org/gitweb/?p=cpio.git;a=commitdiff;h=f42137f5ab9cf07d1e62edc05e0212688d3ebaa2
+Signed-off-by: Sergey Poznyakoff <gray@gnu.org>
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ src/extern.h | 4 ++--
+ src/global.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/extern.h b/src/extern.h
+index bf3d5b3..455119b 100644
+--- a/src/extern.h
++++ b/src/extern.h
+@@ -96,8 +96,8 @@ extern char input_is_special;
+ extern char output_is_special;
+ extern char input_is_seekable;
+ extern char output_is_seekable;
+-extern int (*xstat) ();
+-extern void (*copy_function) ();
++extern int (*xstat) (const char *, struct stat *);
++extern void (*copy_function) (void);
+ extern char *change_directory_option;
+ 
+ #define STRINGIFY_BIGINT(i, b) umaxtostr (i, b)
+diff --git a/src/global.c b/src/global.c
+index 66686f2..5c6ab16 100644
+--- a/src/global.c
++++ b/src/global.c
+@@ -184,10 +184,10 @@ bool to_stdout_option = false;
+ 
+ /* A pointer to either lstat or stat, depending on whether
+    dereferencing of symlinks is done for input files.  */
+-int (*xstat) ();
++int (*xstat) (const char *, struct stat *);
+ 
+ /* Which copy operation to perform. (-i, -o, -p) */
+-void (*copy_function) () = 0;
++void (*copy_function) (void) = 0;
+ 
+ char *change_directory_option;
+ 
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
