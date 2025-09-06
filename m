Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00107CA1002
	for <buildroot@archiver.kernel.org>; Sat,  6 Sep 2025 17:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EAE5412A3;
	Sat,  6 Sep 2025 17:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aR56-jwnoi7t; Sat,  6 Sep 2025 17:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 988CC412F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 988CC412F1;
	Sat,  6 Sep 2025 17:02:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E449CA
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 17:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B32561029
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 17:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUhmrSr-gliU for <buildroot@buildroot.org>;
 Sat,  6 Sep 2025 17:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53CA960DFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53CA960DFA
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 17:02:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42CE3835F5; Sat,  6 Sep 2025 17:02:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Sep 2025 18:57:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70cefcac9e83128275d044f07df049dc42b0c97c
X-Git-Newrev: d7233ae04854727730340f9b34ad85161e17f97a
X-Patchwork-Hint: ignore
Message-Id: <20250906170220.42CE3835F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iozone: Fix parallel build problem
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d7233ae04854727730340f9b34ad85161e17f97a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apply a patch from meta-openembedded fixing a cross-build issue [1].

[1] https://github.com/openembedded/meta-openembedded/blob/walnascar/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774405 (TestIozone)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-remove-libasync.o-and-libbif.o-from-deps.patch | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch b/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch
new file mode 100644
index 0000000000..ea4c9c97b3
--- /dev/null
+++ b/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch
@@ -0,0 +1,114 @@
+From 34c25d67c33050f42f0f243c0fb6674c28ff44b5 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sat, 6 Sep 2025 00:31:48 +0200
+Subject: [PATCH] remove libasync.o and libbif.o from deps
+
+there are no implicit rules to build them and they get wrong CFLAGS
+when compiled with implicit rule.
+
+They are built as part of iozone_linux.o target anyway
+
+Only fixed linux targets for now
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream: Pending
+[Romain:
+  rebase on 3.508
+  convert to git format
+]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+Patch from Yocto:
+https://github.com/openembedded/meta-openembedded/blob/walnascar/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch
+---
+ src/current/makefile | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/current/makefile b/src/current/makefile
+index bd66a4e..ba5759f 100755
+--- a/src/current/makefile
++++ b/src/current/makefile
+@@ -171,7 +171,7 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
+ #
+-linux:	iozone_linux.o libasync.o libbif.o fileop_linux.o pit_server.o
++linux:	iozone_linux.o fileop_linux.o pit_server.o
+ 	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux.o libasync.o libbif.o \
+ 		-lpthread -lrt -o iozone
+ 	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
+@@ -198,7 +198,7 @@ linux-noth: iozone_linux-noth.o libbif.o fileop_linux.o pit_server.o
+ #
+ # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
+ #
+-linux-powerpc: iozone_linux-powerpc.o  libbif.o libasync.o fileop_linux-ppc.o pit_server.o
++linux-powerpc: iozone_linux-powerpc.o fileop_linux-ppc.o pit_server.o
+ 	$(CC) -O3 $(LDFLAGS) iozone_linux-powerpc.o libasync.o \
+ 		libbif.o -lpthread  -lrt -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-ppc.o -o fileop
+@@ -206,7 +206,7 @@ linux-powerpc: iozone_linux-powerpc.o  libbif.o libasync.o fileop_linux-ppc.o pi
+ #
+ # GNU 'C' compiler Linux build for sparc chip with threads, largefiles, async I/O 
+ #
+-linux-sparc: iozone_linux-sparc.o  libbif.o libasync.o fileop_linux.o pit_server.o
++linux-sparc: iozone_linux-sparc.o fileop_linux.o pit_server.o
+ 	$(CC) -O3 $(LDFLAGS) iozone_linux-sparc.o libasync.o libbif.o \
+ 		-lpthread -lrt -o iozone
+ 	$(CC) -O3 -Dlinux fileop_linux.o -o fileop
+@@ -215,7 +215,7 @@ linux-sparc: iozone_linux-sparc.o  libbif.o libasync.o fileop_linux.o pit_server
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
+ #
+-linux-ia64:	iozone_linux-ia64.o  libbif.o libasync.o fileop_linux-ia64.o pit_server.o
++linux-ia64:	iozone_linux-ia64.o fileop_linux-ia64.o pit_server.o
+ 	$(CC) -O3 $(LDFLAGS) iozone_linux-ia64.o libbif.o libasync.o \
+ 		-lrt -lpthread -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-ia64.o -o fileop
+@@ -224,7 +224,7 @@ linux-ia64:	iozone_linux-ia64.o  libbif.o libasync.o fileop_linux-ia64.o pit_ser
+ #
+ # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
+ #
+-linux-powerpc64: iozone_linux-powerpc64.o  libbif.o libasync.o fileop_linux-ppc64.o pit_server-linux-powerpc64.o
++linux-powerpc64: iozone_linux-powerpc64.o fileop_linux-ppc64.o pit_server-linux-powerpc64.o
+ 	$(CC) -O3 -Dunix -DHAVE_ANSIC_C -DSHARED_MEM -DASYNC_IO \
+ 		-D_LARGEFILE64_SOURCE -Dlinux \
+ 		iozone_linux-powerpc64.o libasync.o libbif.o -lpthread \
+@@ -235,7 +235,7 @@ linux-powerpc64: iozone_linux-powerpc64.o  libbif.o libasync.o fileop_linux-ppc6
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O
+ #
+-linux-arm:	iozone_linux-arm.o  libbif.o libasync.o fileop_linux-arm.o pit_server.o
++linux-arm:	iozone_linux-arm.o fileop_linux-arm.o pit_server.o
+ 	$(CC) -O3 $(LDFLAGS) iozone_linux-arm.o libbif.o libasync.o \
+ 		-lrt -lpthread -o iozone
+ 	$(CC) -O3 -Dlinux fileop_linux-arm.o -o fileop
+@@ -267,7 +267,7 @@ endif
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
+ #
+-linux-AMD64:	iozone_linux-AMD64.o  libbif.o libasync.o fileop_linux-AMD64.o pit_server.o
++linux-AMD64:	iozone_linux-AMD64.o fileop_linux-AMD64.o pit_server.o
+ 	$(CC)  -O3 $(LDFLAGS) iozone_linux-AMD64.o libbif.o libasync.o \
+ 		-lrt -lpthread -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-AMD64.o -o fileop
+@@ -276,7 +276,7 @@ linux-AMD64:	iozone_linux-AMD64.o  libbif.o libasync.o fileop_linux-AMD64.o pit_
+ #
+ # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
+ #
+-linux-S390:	iozone_linux-s390.o libbif.o libasync.o fileop_linux-s390.o pit_server.o
++linux-S390:	iozone_linux-s390.o fileop_linux-s390.o pit_server.o
+ 	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390.o \
+ 		libbif.o libasync.o -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-s390.o -o fileop
+@@ -285,7 +285,7 @@ linux-S390:	iozone_linux-s390.o libbif.o libasync.o fileop_linux-s390.o pit_serv
+ #
+ # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
+ #
+-linux-S390X:	iozone_linux-s390x.o libbif.o libasync.o fileop_linux-s390x.o pit_server.o
++linux-S390X:	iozone_linux-s390x.o fileop_linux-s390x.o pit_server.o
+ 	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390x.o \
+ 		libbif.o libasync.o -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-s390x.o -o fileop
+-- 
+2.51.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
