From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 17 Sep 2018 23:12:18 +0200
Subject: [Buildroot] [PATCH 1/2] at: change upstream site, bump version
In-Reply-To: <20180917211219.17868-1-giulio.benetti@micronovasrl.com>
References: <20180917211219.17868-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180917211219.17868-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Minicom is now available on a git repository at:
https://salsa.debian.org/debian/at
Main changes 3.1.16 -> 3.1.23:
- add support for SELinux, multiple files
- improve atd.service, see bug report 892819
- fix various bugs and warnings
- finalized script to release software

So:
- change AT_SITE_METHOD to git pointing to release/3.1.23
- update tarball sha256 in hash file

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...-Makefile-fix-parallel-build-failure.patch | 33 +++++++++++++++++++
 package/at/at.hash                            |  4 +--
 package/at/at.mk                              |  9 ++---
 3 files changed, 40 insertions(+), 6 deletions(-)
 create mode 100644 package/at/0007-Makefile-fix-parallel-build-failure.patch

diff --git a/package/at/0007-Makefile-fix-parallel-build-failure.patch b/package/at/0007-Makefile-fix-parallel-build-failure.patch
new file mode 100644
index 0000000000..145e8fa8c9
--- /dev/null
+++ b/package/at/0007-Makefile-fix-parallel-build-failure.patch
@@ -0,0 +1,33 @@
+From 5b98a3166ddc03dbe040bef2de464166a5b7ab78 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Tue, 4 Sep 2018 15:21:26 +0200
+Subject: [PATCH] Makefile: fix parallel build failure
+
+When issuing make -j build fails reporting:
+parsetime.l:5:10: fatal error: y.tab.h: No such file or directory
+This is because parsetime.l is compiled without waiting for y.tab.h file
+to be created.
+
+Add parsetime.l dependency to y.tab.h in Makefile.in
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ Makefile.in | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile.in b/Makefile.in
+index 4c11913..18ecc23 100644
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
+-- 
+2.17.1
+
diff --git a/package/at/at.hash b/package/at/at.hash
index 22c732cc7e..e6eb26d818 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,2 +1,2 @@
-# From: http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at/at_3.1.16-1.dsc
-sha256 cb9af59c6a54edce9536ba629841055409d1f89d8ae26494727a97141fb4d5c1  at_3.1.16.orig.tar.gz
+# Locally calculated
+sha256 f5c7c8226fab0bc4e2d16a55e04d4026f3452db51fc5cbcc4bb5a3c79a79f7ef  at-release_3.1.23.tar.gz
diff --git a/package/at/at.mk b/package/at/at.mk
index 058ebac5c8..1d42b27b03 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-AT_VERSION = 3.1.16
-AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
-AT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at
-# missing deps for parsetime.l
+AT_VERSION = release/3.1.23
+AT_SITE = https://salsa.debian.org/debian/at.git
+AT_SITE_METHOD = git
+# added missing deps for parsetime.l but still parallel build fails in some
+# case, so at the moment let's keep MAKE1
 AT_MAKE = $(MAKE1)
 AT_AUTORECONF = YES
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
-- 
2.17.1
