Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09C7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5841B4030F;
	Mon, 14 Feb 2022 20:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vMEUJVNLL6Mw; Mon, 14 Feb 2022 20:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93179402E2;
	Mon, 14 Feb 2022 20:49:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 747F91BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62311401B2
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XI-1HvXxQSGg for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:49:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B1C440131
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:49:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1403582AD1; Mon, 14 Feb 2022 20:41:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 21:43:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8679f6a7e7c0e6245ebdea47ea2257bfaccc7d37
X-Git-Newrev: a738ecbce4979db46bcb8b960531f573e08c0e32
X-Patchwork-Hint: ignore
Message-Id: <20220214204133.1403582AD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongrel2: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=a738ecbce4979db46bcb8b960531f573e08c0e32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 1.13.0 in
commit b0a7bffad9e041d9920171802621b67903f9389e:

arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough=0'

Fixes:
 - http://autobuild.buildroot.org/results/de324b733e09057c87352220069fe65f6e535eb8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mongrel2/0003-fix-build-with-gcc-4.8.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/mongrel2/0003-fix-build-with-gcc-4.8.patch b/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..eebfce0487
--- /dev/null
+++ b/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,60 @@
+From cc2dd3995dc9a9e6f0e705e11e791f3f3c7d7326 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 18 Jan 2022 22:41:36 +0100
+Subject: [PATCH] fix build with gcc 4.8
+
+Drop "-Wno-unused-const-variable -Wimplicit-fallthrough=0" as
+"-Wno-implicit-fallthrough -Wno-unused-const-variable" is already set in
+CFLAGS. This will avoid the following build failure with gcc 4.8 raised
+since version 1.13.0 and
+https://github.com/mongrel2/mongrel2/commit/725209578599bd7784753d86aee34f6441ff78a5:
+
+arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough=0'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/de324b733e09057c87352220069fe65f6e535eb8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/mongrel2/mongrel2/pull/354]
+---
+ Makefile            | 1 -
+ tools/m2sh/Makefile | 4 ++--
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index f6627ed..fb8d028 100644
+--- a/Makefile
++++ b/Makefile
+@@ -22,7 +22,6 @@ all: bin/mongrel2 tests m2sh procer
+ 
+ ${OBJECTS_NOEXT}: CFLAGS += ${NOEXTCFLAGS}
+ ${OBJECTS}: | builddirs
+-$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-const-variable -Wimplicit-fallthrough=0
+ 
+ .PHONY: builddirs
+ builddirs:
+diff --git a/tools/m2sh/Makefile b/tools/m2sh/Makefile
+index 83e7ae4..86364af 100644
+--- a/tools/m2sh/Makefile
++++ b/tools/m2sh/Makefile
+@@ -10,7 +10,7 @@ LIB_SRC=$(filter-out src/m2sh.c,${SOURCES})
+ LIB_OBJ=$(filter-out src/m2sh.o,${OBJECTS})
+ RAGEL_OBJECTS=src/lexer.o src/cli.o
+ 
+-$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-const-variable -Wimplicit-fallthrough=0 -Wno-unused-parameter
++$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-parameter
+ 
+ all: ../lemon/lemon tests build/m2sh
+ 
+@@ -20,7 +20,7 @@ dev: all
+ install: build/m2sh
+ 	install build/m2sh ${DESTDIR}${PREFIX}/bin
+ 
+-src/parser.o: CFLAGS += -Wno-unused-const-variable -Wno-unused-parameter
++src/parser.o: CFLAGS += -Wno-unused-parameter
+ 
+ build/libm2sh.a: ${LIB_OBJ}
+ 	mkdir -p build
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
