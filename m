From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun,  2 Apr 2017 19:54:18 +0200
Subject: [Buildroot] [PATCH] jemalloc: bump version to 4.5.0
Message-ID: <20170402175418.19941-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/jemalloc/0001-Disable-documentation.patch  | 29 +++++++++++++++++++++
 ...001-Fix-LG_QUANTUM-definition-for-sparc64.patch | 30 ----------------------
 package/jemalloc/Config.in                         |  2 +-
 package/jemalloc/jemalloc.hash                     |  2 +-
 package/jemalloc/jemalloc.mk                       | 16 +++++++++---
 5 files changed, 44 insertions(+), 35 deletions(-)
 create mode 100644 package/jemalloc/0001-Disable-documentation.patch
 delete mode 100644 package/jemalloc/0001-Fix-LG_QUANTUM-definition-for-sparc64.patch

diff --git a/package/jemalloc/0001-Disable-documentation.patch b/package/jemalloc/0001-Disable-documentation.patch
new file mode 100644
index 0000000..a5f252c
--- /dev/null
+++ b/package/jemalloc/0001-Disable-documentation.patch
@@ -0,0 +1,29 @@
+From b9113f8dc939dab775dbc64bae03b927f0679467 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Sun, 2 Apr 2017 19:26:04 +0200
+Subject: [PATCH] Disable documentation
+
+As there is no option to disable documentation, update Makefile.in to
+skip it.
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index e49a871..74a7541 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -383,7 +383,7 @@ done
+ 
+ install_doc: install_doc_html install_doc_man
+ 
+-install: install_bin install_include install_lib install_doc
++install: install_bin install_include install_lib
+ 
+ tests_unit: $(TESTS_UNIT:$(srcroot)%.c=$(objroot)%$(EXE))
+ tests_integration: $(TESTS_INTEGRATION:$(srcroot)%.c=$(objroot)%$(EXE))
+-- 
+2.9.3
+
diff --git a/package/jemalloc/0001-Fix-LG_QUANTUM-definition-for-sparc64.patch b/package/jemalloc/0001-Fix-LG_QUANTUM-definition-for-sparc64.patch
deleted file mode 100644
index ef5b857..0000000
--- a/package/jemalloc/0001-Fix-LG_QUANTUM-definition-for-sparc64.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b3211bd6363ee6884c8db64008dc325a9c711bfb Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Thu, 14 Jul 2016 22:44:01 +0200
-Subject: [PATCH] Fix LG_QUANTUM definition for sparc64
-
-GCC 4.9.3 cross-compiled for sparc64 defines __sparc_v9__, not
-__sparc64__ nor __sparcv9. This prevents LG_QUANTUM from being defined
-properly. Adding this new value to the check solves the issue.
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- include/jemalloc/internal/jemalloc_internal.h.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/jemalloc/internal/jemalloc_internal.h.in b/include/jemalloc/internal/jemalloc_internal.h.in
-index 51bf897..ece15b2 100644
---- a/include/jemalloc/internal/jemalloc_internal.h.in
-+++ b/include/jemalloc/internal/jemalloc_internal.h.in
-@@ -234,7 +234,7 @@ typedef unsigned szind_t;
- #  ifdef __alpha__
- #    define LG_QUANTUM		4
- #  endif
--#  if (defined(__sparc64__) || defined(__sparcv9))
-+#  if (defined(__sparc64__) || defined(__sparcv9) || defined(__sparc_v9__))
- #    define LG_QUANTUM		4
- #  endif
- #  if (defined(__amd64__) || defined(__x86_64__) || defined(_M_X64))
--- 
-2.4.11
-
diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index b1b92bb..8586140 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_JEMALLOC
 	  This library providing a malloc(3) implementation that emphasizes
 	  fragmentation avoidance and scalable concurrency support.
 
-	  http://www.canonware.com/jemalloc/
+	  http://jemalloc.net/
 
 comment "jemalloc needs a toolchain w/ dynamic library, threads"
 	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
diff --git a/package/jemalloc/jemalloc.hash b/package/jemalloc/jemalloc.hash
index b6c860b..97ce483 100644
--- a/package/jemalloc/jemalloc.hash
+++ b/package/jemalloc/jemalloc.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 5630650d5c1caab95d2f0898de4fe5ab8519dc680b04963b38bb425ef6a42d57 jemalloc-4.2.1.tar.bz2
+sha256 e885b65b95426945655ee91a30f563c9679770c92946bcdd0795f6b78c06c221  jemalloc-4.5.0.tar.gz
diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index 975d319..a1271f9 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -4,13 +4,21 @@
 #
 ################################################################################
 
-JEMALLOC_VERSION = 4.2.1
-JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
-JEMALLOC_SITE = http://www.canonware.com/download/jemalloc
+JEMALLOC_VERSION = 4.5.0
+JEMALLOC_SITE = $(call github,jemalloc,jemalloc,$(JEMALLOC_VERSION))
 JEMALLOC_LICENSE = BSD-2-Clause
 JEMALLOC_LICENSE_FILES = COPYING
 JEMALLOC_INSTALL_STAGING = YES
 
+# configure is missing but gpm seems not compatible with our autoreconf
+# mechanism so we have to do it manually instead of using
+# JEMALLOC_AUTORECONF = YES
+define JEMALLOC_RUN_AUTOGEN
+        cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+
+JEMALLOC_PRE_CONFIGURE_HOOKS += JEMALLOC_RUN_AUTOGEN
+
 ifeq ($(BR2_PACKAGE_VALGRIND),y)
 JEMALLOC_DEPENDENCIES += valgrind
 JEMALLOC_CONF_OPTS += --enable-valgrind
@@ -20,5 +28,7 @@ endif
 
 HOST_JEMALLOC_CONF_OPTS += --disable-valgrind
 
+HOST_JEMALLOC_PRE_CONFIGURE_HOOKS += JEMALLOC_RUN_AUTOGEN
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.9.3
