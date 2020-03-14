From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 15:42:27 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/at: fix parallel
 build failure
Message-ID: <20200314145012.8CF0181F05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=314ab1a356b801e71ed7d0c93429fcf224aba065
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add a patch to finally fix parallel build failure. Patch is pending
upstream:
https://salsa.debian.org/debian/at/merge_requests/14

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ed50e4422467066daa95938b78efc1be48aef2e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-Makefile-fix-parallel-build-failure.patch | 41 ++++++++++++++++++++++
 package/at/at.mk                                   |  3 --
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/package/at/0004-Makefile-fix-parallel-build-failure.patch b/package/at/0004-Makefile-fix-parallel-build-failure.patch
new file mode 100644
index 0000000000..6e3dc24ca4
--- /dev/null
+++ b/package/at/0004-Makefile-fix-parallel-build-failure.patch
@@ -0,0 +1,41 @@
+From 3ace0b57e2aacb784c01a3c7694c6c92461937ff Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 20 Feb 2020 22:00:11 +0100
+Subject: [PATCH] Makefile: fix parallel build failure
+
+At the moment parallel build fails due to 2 causes:
+1) parsetime.l tries to include incomplete y.tab.h, since y.tab.h is the
+result of yacc -d parsetime.y
+2) when compiling y.tab.c, y.tab.c itself is not complete, since it is
+the result of yacc -d parsetime.y
+
+So fix it by:
+1) making parsetime.l to wait for y.tab.h to be created by yacc
+2) waiting for y.tab.c and y.tab.h to be created before compile them
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ Makefile.in | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Makefile.in b/Makefile.in
+index 4c11913..57c3a0c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -83,6 +83,8 @@ y.tab.c y.tab.h: parsetime.y
+ lex.yy.c: parsetime.l
+ 	$(LEX) -i parsetime.l
+ 
++parsetime.l: y.tab.h
++
+ atd.service: atd.service.in
+ 	cat $< | sed -e 's![@]sbindir[@]!$(sbindir)!g' | sed -e 's![@]atjobdir[@]!$(atjobdir)!g' > $@
+ 
+@@ -173,3 +175,4 @@ perm.o: perm.c config.h privs.h at.h
+ posixtm.o: posixtm.c posixtm.h
+ daemon.o: daemon.c config.h daemon.h privs.h
+ getloadavg.o: getloadavg.c config.h getloadavg.h
++y.tab.o: y.tab.c y.tab.h
+-- 
+2.20.1
+
diff --git a/package/at/at.mk b/package/at/at.mk
index 36aa8c7a42..8ca38f01f1 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -7,9 +7,6 @@
 AT_VERSION = release/3.1.23
 AT_SITE = https://salsa.debian.org/debian/at.git
 AT_SITE_METHOD = git
-# Tried to add missing deps for parsetime.l but still parallel build fails
-# in some case, so at the moment let's keep MAKE1
-AT_MAKE = $(MAKE1)
 AT_AUTORECONF = YES
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
 AT_LICENSE = GPL-2.0+, GPL-3.0+, ISC
