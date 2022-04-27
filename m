Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88984C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4452B82ED2;
	Wed, 27 Apr 2022 19:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHk-Yt5vAzDi; Wed, 27 Apr 2022 19:01:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A10982883;
	Wed, 27 Apr 2022 19:01:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B9411BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 424656100E
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UlkPvpupzCGL for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FCE061010
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BC69784601; Wed, 27 Apr 2022 18:47:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 20:50:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c932b7bb9092d6004837a38c6e3562c1b10bba23
X-Git-Newrev: e47efc9b90e8ecfe5b0b21f967001748fc111fbc
X-Patchwork-Hint: ignore
Message-Id: <20220427184726.BC69784601@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=e47efc9b90e8ecfe5b0b21f967001748fc111fbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure:

/nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(syslog.os): in function `openlog':
syslog.c:(.text+0x6b8): multiple definition of `openlog'; /tmp/ccvRnqfT.o:/nvmedata/autobuild/instance-15/output-1/build/ltp-testsuite-20220121/testcases/kernel/fs/fs-bench/random-access.c:14: first defined here

Fixes:
 - http://autobuild.buildroot.org/results/bfd0d906a05564a4f323db604f3b908abf552b20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...s-kernel-fs-declare-int-openlog-as-static.patch | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch b/package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch
new file mode 100644
index 0000000000..ae10bfcfdd
--- /dev/null
+++ b/package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch
@@ -0,0 +1,77 @@
+From 002ca0320cd2c5e1515bf202f470d4becdf01532 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 24 Apr 2022 21:56:36 +0200
+Subject: [PATCH] testcases/kernel/fs: declare int openlog as static
+
+Declare int openlog as static to avoid the following build failure when
+building statically (e.g. on buildroot):
+
+/nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(syslog.os): in function `openlog':
+syslog.c:(.text+0x6b8): multiple definition of `openlog'; /tmp/ccvRnqfT.o:/nvmedata/autobuild/instance-15/output-1/build/ltp-testsuite-20220121/testcases/kernel/fs/fs-bench/random-access.c:14: first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bfd0d906a05564a4f323db604f3b908abf552b20
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+[Retrieved from:
+https://github.com/linux-test-project/ltp/commit/002ca0320cd2c5e1515bf202f470d4becdf01532]
+---
+ testcases/kernel/fs/fs-bench/random-access-del-create.c | 2 --
+ testcases/kernel/fs/fs-bench/random-access.c            | 2 +-
+ testcases/kernel/fs/fs-bench/random-del-create.c        | 2 +-
+ testcases/kernel/fs/scsi/ltpfs/main.c                   | 2 +-
+ 4 files changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/testcases/kernel/fs/fs-bench/random-access-del-create.c b/testcases/kernel/fs/fs-bench/random-access-del-create.c
+index 1f62a76b5e..1878fd78b5 100644
+--- a/testcases/kernel/fs/fs-bench/random-access-del-create.c
++++ b/testcases/kernel/fs/fs-bench/random-access-del-create.c
+@@ -11,8 +11,6 @@
+ #define FAIL 0
+ #define SUCCESS 1
+ 
+-int openlog[2] = { 0, 0 };
+-
+ #define MAXNUM 0x100000
+ 
+ #define  MAXERROR 1024
+diff --git a/testcases/kernel/fs/fs-bench/random-access.c b/testcases/kernel/fs/fs-bench/random-access.c
+index cf41d6e81c..c2f32b86e7 100644
+--- a/testcases/kernel/fs/fs-bench/random-access.c
++++ b/testcases/kernel/fs/fs-bench/random-access.c
+@@ -11,7 +11,7 @@
+ #define FAIL 0
+ #define SUCCESS 1
+ 
+-int openlog[2] = { 0, 0 };
++static int openlog[2] = { 0, 0 };
+ 
+ #define MAXNUM 0x100000
+ 
+diff --git a/testcases/kernel/fs/fs-bench/random-del-create.c b/testcases/kernel/fs/fs-bench/random-del-create.c
+index 0a86f976f3..345031f283 100644
+--- a/testcases/kernel/fs/fs-bench/random-del-create.c
++++ b/testcases/kernel/fs/fs-bench/random-del-create.c
+@@ -11,7 +11,7 @@
+ #define FAIL 0
+ #define SUCCESS 1
+ 
+-int openlog[2] = { 0, 0 };
++static int openlog[2] = { 0, 0 };
+ 
+ #define MAXNUM 0x100000
+ 
+diff --git a/testcases/kernel/fs/scsi/ltpfs/main.c b/testcases/kernel/fs/scsi/ltpfs/main.c
+index 2c67c7a478..90a5531ac3 100644
+--- a/testcases/kernel/fs/scsi/ltpfs/main.c
++++ b/testcases/kernel/fs/scsi/ltpfs/main.c
+@@ -38,7 +38,7 @@ int startc = 0;
+ int showchar[] = { 124, 47, 45, 92, 124, 47, 45, 92 };
+ 
+ int nullFileHandle;
+-int openlog[2] = { 0, 0 };
++static int openlog[2] = { 0, 0 };
+ 
+ int cFileCount, dFileCount, errorCount;
+ static int disk_space_pool = 0;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
