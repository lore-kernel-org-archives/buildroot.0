Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A7BC3DA41
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6157160A55;
	Mon,  8 Jul 2024 20:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dc4SkAJ5Rezs; Mon,  8 Jul 2024 20:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 282A260A63
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 282A260A63;
	Mon,  8 Jul 2024 20:20:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 115181BF97C
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CEB4608F3
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSmxEL5m8yBx for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4100D608E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4100D608E0
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E1297FCE7; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:14:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2be1f2004ed11010c489e03b4230ac298ecc240e
X-Git-Newrev: f7ea606b47935a85f1c8c1599e42bb6169bd8127
X-Patchwork-Hint: ignore
Message-Id: <20240708202013.3E1297FCE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongrel2: update the patches to be
 applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7ea606b47935a85f1c8c1599e42bb6169bd8127
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, mongrel2 fails to build with output:

    Applying 0001-Do-not-run-tests.patch using patch:
    patching file Makefile
    Hunk #1 FAILED at 16.
    1 out of 1 hunk FAILED -- saving rejects to file Makefile.rej
    patching file tools/m2sh/Makefile
    Hunk #1 FAILED at 9.
    1 out of 1 hunk FAILED -- saving rejects to file tools/m2sh/Makefile.rej

    Applying 0003-fix-build-with-gcc-4.8.patch using patch:
    patching file Makefile
    patching file tools/m2sh/Makefile
    Hunk #1 FAILED at 10.
    1 out of 2 hunks FAILED -- saving rejects to file tools/m2sh/Makefile.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 package/mongrel2/0001-Do-not-run-tests.patch       | 16 +++++++++-------
 package/mongrel2/0003-fix-build-with-gcc-4.8.patch | 10 ++++++----
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9e9c493711..423046b80e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1026,7 +1026,6 @@ package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch
 package/mongodb/0002-src-mongo-db-exec-plan_stats.h-fix-build-with-gcc-11.patch lib_patch.Upstream
 package/mongrel2/0001-Do-not-run-tests.patch lib_patch.Upstream
 package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch lib_patch.Upstream
-package/mongrel2/0003-fix-build-with-gcc-4.8.patch lib_patch.Upstream
 package/monit/0001-no-force-static.patch lib_patch.Upstream
 package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch lib_patch.Upstream
 package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch lib_patch.Upstream
diff --git a/package/mongrel2/0001-Do-not-run-tests.patch b/package/mongrel2/0001-Do-not-run-tests.patch
index 4a75a470b4..3b72aef3c5 100644
--- a/package/mongrel2/0001-Do-not-run-tests.patch
+++ b/package/mongrel2/0001-Do-not-run-tests.patch
@@ -7,6 +7,8 @@ This patch is specific to cross-compiled environments and avoids running
 the tests on the host. It is not meant to be applied upstream.
 
 Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Makefile            | 2 +-
  tools/m2sh/Makefile | 2 +-
@@ -16,22 +18,22 @@ diff --git a/Makefile b/Makefile
 index 7dc4089..ca72630 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -16,7 +16,7 @@ TEST_SRC=$(wildcard tests/*_tests.c)
+@@ -18,7 +18,7 @@
  TESTS=$(patsubst %.c,%,${TEST_SRC})
- MAKEOPTS=OPTFLAGS="${NOEXTCFLAGS} ${OPTFLAGS}" OPTLIBS="${OPTLIBS}" LIBS="${LIBS}" DESTDIR="${DESTDIR}" PREFIX="${PREFIX}"
+ MAKEOPTS=OPTFLAGS="${CFLAGS} ${NOEXTCFLAGS} ${OPTFLAGS}" LDFLAGS="${LDFLAGS}" LIBS="${LIBS}" DESTDIR="${DESTDIR}" PREFIX="${PREFIX}"
  
 -all: bin/mongrel2 tests m2sh procer
 +all: bin/mongrel2 m2sh procer filters config_modules
  
- dev: CFLAGS=-g -Wall -Isrc -Wall -Wextra $(OPTFLAGS) -D_FILE_OFFSET_BITS=64
- dev: all
+ ${OBJECTS_NOEXT}: CFLAGS += ${NOEXTCFLAGS}
+ ${OBJECTS}: | builddirs
 diff --git a/tools/m2sh/Makefile b/tools/m2sh/Makefile
 index b50d8a0..334e4da 100644
 --- a/tools/m2sh/Makefile
 +++ b/tools/m2sh/Makefile
-@@ -9,7 +9,7 @@ TESTS=$(patsubst %.c,%,${TEST_SRC})
- LIB_SRC=$(filter-out src/m2sh.c,${SOURCES})
- LIB_OBJ=$(filter-out src/m2sh.o,${OBJECTS})
+@@ -12,7 +12,7 @@
+ 
+ $(RAGEL_OBJECTS): CFLAGS += -Wno-unused-const-variable -Wimplicit-fallthrough=0 -Wno-unused-parameter
  
 -all: ../lemon/lemon tests build/m2sh
 +all: ../lemon/lemon build/m2sh
diff --git a/package/mongrel2/0003-fix-build-with-gcc-4.8.patch b/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
index eebfce0487..996cd3246b 100644
--- a/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
+++ b/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
@@ -15,7 +15,9 @@ Fixes:
  - http://autobuild.buildroot.org/results/de324b733e09057c87352220069fe65f6e535eb8
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mongrel2/mongrel2/pull/354]
+Upstream: https://github.com/mongrel2/mongrel2/pull/354
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Makefile            | 1 -
  tools/m2sh/Makefile | 4 ++--
@@ -37,16 +39,16 @@ diff --git a/tools/m2sh/Makefile b/tools/m2sh/Makefile
 index 83e7ae4..86364af 100644
 --- a/tools/m2sh/Makefile
 +++ b/tools/m2sh/Makefile
-@@ -10,7 +10,7 @@ LIB_SRC=$(filter-out src/m2sh.c,${SOURCES})
+@@ -10,7 +10,7 @@
  LIB_OBJ=$(filter-out src/m2sh.o,${OBJECTS})
  RAGEL_OBJECTS=src/lexer.o src/cli.o
  
 -$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-const-variable -Wimplicit-fallthrough=0 -Wno-unused-parameter
 +$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-parameter
  
- all: ../lemon/lemon tests build/m2sh
+ all: ../lemon/lemon build/m2sh
  
-@@ -20,7 +20,7 @@ dev: all
+@@ -20,7 +20,7 @@
  install: build/m2sh
  	install build/m2sh ${DESTDIR}${PREFIX}/bin
  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
