Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5AAC433FE
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE636165D;
	Fri, 27 May 2022 09:40:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPCxMnBZOpXi; Fri, 27 May 2022 09:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7896161652;
	Fri, 27 May 2022 09:39:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91C661BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BDBC61652
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 92pdTnsOPNSU for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE94B61643
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CF40B8662D; Fri, 27 May 2022 09:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 11:29:13 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ae4774654e46a81b6699d2e3e5130e667549978a
X-Git-Newrev: 3ef9c6ee6fe9afd4802192e84e4b1ae54272221b
X-Patchwork-Hint: ignore
Message-Id: <20220527092724.CF40B8662D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ltp-testsuite:
 fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ef9c6ee6fe9afd4802192e84e4b1ae54272221b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following static build failure:

/nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(syslog.os): in function `openlog':
syslog.c:(.text+0x6b8): multiple definition of `openlog'; /tmp/ccvRnqfT.o:/nvmedata/autobuild/instance-15/output-1/build/ltp-testsuite-20220121/testcases/kernel/fs/fs-bench/random-access.c:14: first defined here

Fixes:
 - http://autobuild.buildroot.org/results/bfd0d906a05564a4f323db604f3b908abf552b20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e47efc9b90e8ecfe5b0b21f967001748fc111fbc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
