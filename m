From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Apr 2017 19:44:21 +0200
Subject: [Buildroot] [git commit] jemalloc: bump version to 4.5.0
Message-ID: <20170407174449.5D8AF81F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e06eaa8db5e12cc5f8362da4aef8309ea6e682f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
[Thomas: use release tarball, which avoids the need for autoreconf.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jemalloc/0001-Disable-documentation.patch  | 29 +++++++++++++++++++++
 ...001-Fix-LG_QUANTUM-definition-for-sparc64.patch | 30 ----------------------
 package/jemalloc/Config.in                         |  2 +-
 package/jemalloc/jemalloc.hash                     |  2 +-
 package/jemalloc/jemalloc.mk                       |  4 +--
 5 files changed, 33 insertions(+), 34 deletions(-)

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
index b6c860b..65dbecc 100644
--- a/package/jemalloc/jemalloc.hash
+++ b/package/jemalloc/jemalloc.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 5630650d5c1caab95d2f0898de4fe5ab8519dc680b04963b38bb425ef6a42d57 jemalloc-4.2.1.tar.bz2
+sha256 9409d85664b4f135b77518b0b118c549009dc10f6cba14557d170476611f6780  jemalloc-4.5.0.tar.bz2
diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index 975d319..17a3c9a 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-JEMALLOC_VERSION = 4.2.1
+JEMALLOC_VERSION = 4.5.0
 JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
-JEMALLOC_SITE = http://www.canonware.com/download/jemalloc
+JEMALLOC_SITE = https://github.com/jemalloc/jemalloc/releases/download/$(JEMALLOC_VERSION)
 JEMALLOC_LICENSE = BSD-2-Clause
 JEMALLOC_LICENSE_FILES = COPYING
 JEMALLOC_INSTALL_STAGING = YES
