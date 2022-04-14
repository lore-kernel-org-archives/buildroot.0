Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AC4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B27641922;
	Thu, 14 Apr 2022 20:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ABGwVjVwR0iH; Thu, 14 Apr 2022 20:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2D4941920;
	Thu, 14 Apr 2022 20:19:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F14B31BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE70741920
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gs8_Elw6-MvV for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:18:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A0714191F
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:18:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1ECC3838CD; Thu, 14 Apr 2022 20:09:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 22:18:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2087051d3724c66064c1df8d379727b0b4d30a92
X-Git-Newrev: e2df7d28c2e3572e2b61b6823606f84f052fa833
X-Patchwork-Hint: ignore
Message-Id: <20220414200909.1ECC3838CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kompexsqlite: security bump to
 version 1.12.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2df7d28c2e3572e2b61b6823606f84f052fa833
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site to get latest version
- Switch to generic-package and drop patches as upstream doesn't provide
  autotools support
- License is MIT since version 1.12.15
- This bump will fix the following build failure with BR2_OPTIMIZE_FAST:

src/sqlite3.c: In function 'sqlite3IsNaN':
src/sqlite3.c:21797:3: error: #error SQLite will not work correctly with the -ffast-math option of GCC.
21797 | # error SQLite will not work correctly with the -ffast-math option of GCC.
      |   ^~~~~

- This bump will also fix security issues by bumping sqlite to 3.36.0
- Update indentation in hash file (two spaces)

http://sqlitewrapper.kompex-online.com/index.php?content=changelog

Fixes:
 - http://autobuild.buildroot.org/results/63e07345b97faa6d6239933f1790c6f2e02da77f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...kefile-use-autoconf-CXX-for-proper-builds.patch | 27 ------------
 .../0002-append-to-cflags-and-cxxflags.patch       | 49 ----------------------
 package/kompexsqlite/kompexsqlite.hash             |  5 ++-
 package/kompexsqlite/kompexsqlite.mk               | 45 +++++++++++++++++---
 4 files changed, 42 insertions(+), 84 deletions(-)

diff --git a/package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch b/package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch
deleted file mode 100644
index 408c100d71..0000000000
--- a/package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 769693d9ddf63b04dd4aad6cad080f3cee3f997e Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 11 Jun 2015 14:08:38 -0300
-Subject: [PATCH] Makefile: use autoconf CXX for proper builds
-
-Status: applied upstream.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- Makefile.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.in b/Makefile.in
-index 91fb8b2..fe862cd 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -23,6 +23,7 @@ mandir = $(prefix)/share/man/man3
- headerdir = $(prefix)/include/kompex
- 
- CC = @CC@
-+CXX = @CXX@
- CFLAGS = @CFLAGS@
- CPPFLAGS = $(CFLAGS) @CPPFLAGS@
- LDFLAGS = @LDFLAGS@
--- 
-2.3.6
-
diff --git a/package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch b/package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch
deleted file mode 100644
index abd0dc0fdd..0000000000
--- a/package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 3eb064ffa9b43fb5f245b8abda48a1c152a6f2d7 Mon Sep 17 00:00:00 2001
-From: me <noemail@nowhere.com>
-Date: Thu, 20 Nov 2014 14:37:34 -0700
-Subject: [PATCH] Append to CFLAGS and CXXFLAGS as setup by ./configure.  This
- can allow users to Customize the SQLite build process with compile time
- #defines rather than altering the sources.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: 3eb064ffa9b43fb5f245b8abda48a1c152a6f2d7
-
- Makefile-shared.mk | 4 ++--
- Makefile-static.mk | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile-shared.mk b/Makefile-shared.mk
-index b2a4920..d15ce3c 100644
---- a/Makefile-shared.mk
-+++ b/Makefile-shared.mk
-@@ -12,10 +12,10 @@ OBJS= \
- 	${objsdir}/sqlite3.o
- 
- # C Compiler Flags
--CFLAGS= -fPIC -MMD -MP
-+CFLAGS+= -fPIC -MMD -MP
- 
- # CC Compiler Flags
--CPPFLAGS= -DKOMPEX_SQLITEWRAPPER_EXPORT -DKOMPEX_SQLITEWRAPPER_DYN -fPIC -MMD -MP -I${includedir}
-+CPPFLAGS+= -DKOMPEX_SQLITEWRAPPER_EXPORT -DKOMPEX_SQLITEWRAPPER_DYN -fPIC -MMD -MP -I${includedir}
- 
- # Link Libraries and Options
- LDLIBSOPTIONS= -shared -fPIC
-diff --git a/Makefile-static.mk b/Makefile-static.mk
-index 429a4ff..0678681 100644
---- a/Makefile-static.mk
-+++ b/Makefile-static.mk
-@@ -12,10 +12,10 @@ OBJS= \
- 	${objsdir}/sqlite3.o
- 
- # C Compiler Flags
--CFLAGS= -MMD -MP
-+CFLAGS+= -MMD -MP
- 
- # CC Compiler Flags
--CPPFLAGS= -I${includedir} -MMD -MP
-+CPPFLAGS+= -I${includedir} -MMD -MP
- 
- # Link Libraries and Options
- LDLIBSOPTIONS=
diff --git a/package/kompexsqlite/kompexsqlite.hash b/package/kompexsqlite/kompexsqlite.hash
index 8869e9b7d9..aa0f269570 100644
--- a/package/kompexsqlite/kompexsqlite.hash
+++ b/package/kompexsqlite/kompexsqlite.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256	73bec94fe5dd3a24bd8668b3a131a84dbe39a992579eebab1236aa0e73b2c9cc	kompexsqlite-1.10.12-1.tar.gz
-sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	LICENSE.txt
+sha256  81773ddb156fed51ef43a5f562e3b47761c4c33de9197bf0c3e7099b08579e2a  download.php?dl=KompexSQLiteWrapper-Source_1.12.15.tar.gz
+sha256  65fd20aeb67892740a710a09d788acfda8747741e746395739412919f84b5f9f  inc/KompexSQLiteDatabase.h
+sha256  001f26c0b2ca407a9a5d3f5e0690d7e576687b23110e18d2a08014dd774eb71c  inc/sqlite3.h
diff --git a/package/kompexsqlite/kompexsqlite.mk b/package/kompexsqlite/kompexsqlite.mk
index a40088fa2d..6a619de0ef 100644
--- a/package/kompexsqlite/kompexsqlite.mk
+++ b/package/kompexsqlite/kompexsqlite.mk
@@ -4,11 +4,44 @@
 #
 ################################################################################
 
-KOMPEXSQLITE_VERSION = 1.10.12-1
-KOMPEXSQLITE_SITE = \
-	$(call github,Aethelflaed,kompex-sqlite-wrapper,v$(KOMPEXSQLITE_VERSION))
+KOMPEXSQLITE_VERSION = 1.12.15
+KOMPEXSQLITE_SOURCE = download.php?dl=KompexSQLiteWrapper-Source_$(KOMPEXSQLITE_VERSION).tar.gz
+KOMPEXSQLITE_SITE = http://sqlitewrapper.kompex-online.com/counter
 KOMPEXSQLITE_INSTALL_STAGING = YES
-KOMPEXSQLITE_LICENSE = LGPL-3.0+ (wrapper), Public Domain (bundled sqlite)
-KOMPEXSQLITE_LICENSE_FILES = LICENSE.txt
+KOMPEXSQLITE_LICENSE = MIT (wrapper), Public Domain (bundled sqlite)
+KOMPEXSQLITE_LICENSE_FILES = inc/KompexSQLiteDatabase.h inc/sqlite3.h
 
-$(eval $(autotools-package))
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+KOMPEXSQLITE_CONFS += ReleaseStaticLib
+define KOMPEXSQLITE_INSTALL_STATIC_LIB
+	$(INSTALL) -D -m 0644 $(@D)/lib/release/KompexSQLiteWrapper_Static.a \
+		$(STAGING_DIR)/usr/lib/libkompex-sqlite-wrapper.a
+endef
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+KOMPEXSQLITE_CONFS += ReleaseDynamicLib
+define KOMPEXSQLITE_INSTALL_SHARED_LIB
+	$(INSTALL) -D -m 0755 $(@D)/lib/release/KompexSQLiteWrapper.so \
+		$(1)/usr/lib/libkompex-sqlite-wrapper.so
+endef
+endif
+
+define KOMPEXSQLITE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		ALLCONFS="$(KOMPEXSQLITE_CONFS)" \
+		-C "$(@D)/Kompex SQLite Wrapper" all
+endef
+
+define KOMPEXSQLITE_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/kompex
+	$(INSTALL) -m 644 $(@D)/inc/* $(STAGING_DIR)/usr/include/kompex
+	$(KOMPEXSQLITE_INSTALL_STATIC_LIB)
+	$(call KOMPEXSQLITE_INSTALL_SHARED_LIB,$(STAGING_DIR))
+endef
+
+define KOMPEXSQLITE_INSTALL_TARGET_CMDS
+	$(call KOMPEXSQLITE_INSTALL_SHARED_LIB,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
