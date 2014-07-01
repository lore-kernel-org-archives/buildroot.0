From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  1 Jul 2014 06:36:56 +0300
Subject: [Buildroot] [PATCH] libnss: don't use target CFLAGS with host
	toolchain
Message-ID: <5585048eb205b5d13b8ddc27a12a329aaa956408.1404185816.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The OPTIMIZER variable is used to construct CFLAGS for host toolchain.
This breaks the build since we set it to TARGET_CFLAGS, and these may not be
supported by host toolchain. Augment the cross-compile patch to handle
OPTIMIZER so that we can initialize it to TARGET_OPTIMIZER, and override it
when used with host toolchain.

Fixes:
http://autobuild.buildroot.net/results/3f1/3f1afc1b58cb6fe53c438b55f169e2a78238806d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnss/libnss-0001-cross-compile.patch | 26 +++++++++++++++++++++++---
 package/libnss/libnss.mk                       |  3 ++-
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss-0001-cross-compile.patch b/package/libnss/libnss-0001-cross-compile.patch
index 3259116f130a..31de71bc5add 100644
--- a/package/libnss/libnss-0001-cross-compile.patch
+++ b/package/libnss/libnss-0001-cross-compile.patch
@@ -4,11 +4,12 @@ compiled code so we cannot define it on the command line without breaking
 the host tools build.
 
 [Gustavo: update for nss 3.16.1]
+[baruch: add OPTIMIZER handling]
 Signed-off-by: Will Newton <will.newton@imgtec.com>
 
-diff -Nura nss-3.16.1.orig/nss/coreconf/Linux.mk nss-3.16.1/nss/coreconf/Linux.mk
---- nss-3.16.1.orig/nss/coreconf/Linux.mk	2014-06-18 10:34:30.503996123 -0300
-+++ nss-3.16.1/nss/coreconf/Linux.mk	2014-06-18 10:35:02.233068390 -0300
+diff -Nuar nss-3.16.1-orig/nss/coreconf/Linux.mk nss-3.16.1/nss/coreconf/Linux.mk
+--- nss-3.16.1-orig/nss/coreconf/Linux.mk	2014-05-02 06:27:18.000000000 +0300
++++ nss-3.16.1/nss/coreconf/Linux.mk	2014-07-01 02:38:18.701480512 +0300
 @@ -16,9 +16,13 @@
  	IMPL_STRATEGY = _PTH
  endif
@@ -26,3 +27,22 @@ diff -Nura nss-3.16.1.orig/nss/coreconf/Linux.mk nss-3.16.1/nss/coreconf/Linux.m
  
  DEFAULT_COMPILER = gcc
  
+@@ -125,6 +129,7 @@
+ endif
+ endif
+ 
++OPTIMIZER = $(TARGET_OPTIMIZER)
+ 
+ ifeq ($(USE_PTHREADS),1)
+ OS_PTHREAD = -lpthread 
+diff -Nuar nss-3.16.1-orig/nss/coreconf/nsinstall/Makefile nss-3.16.1/nss/coreconf/nsinstall/Makefile
+--- nss-3.16.1-orig/nss/coreconf/nsinstall/Makefile	2014-05-02 06:27:18.000000000 +0300
++++ nss-3.16.1/nss/coreconf/nsinstall/Makefile	2014-07-01 02:38:48.102185011 +0300
+@@ -31,6 +31,7 @@
+ 
+ ifdef NATIVE_FLAGS
+ OS_CFLAGS=$(NATIVE_FLAGS)
++OPTIMIZER=
+ endif
+ 
+ include $(DEPTH)/coreconf/rules.mk
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 47b78df72cea..1f0ea53a49ad 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -47,7 +47,8 @@ define LIBNSS_BUILD_CMDS
 			SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 			DIST=$(@D)/$(LIBNSS_DISTDIR) \
 			CHECKLOC= \
-			$(LIBNSS_BUILD_VARS) OPTIMIZER="$(TARGET_CFLAGS)"
+			$(LIBNSS_BUILD_VARS) TARGET_OPTIMIZER="$(TARGET_CFLAGS)" \
+			NATIVE_FLAGS="$(HOST_CFLAGS)"
 endef
 
 define LIBNSS_INSTALL_STAGING_CMDS
-- 
2.0.0
