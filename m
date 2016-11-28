From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 28 Nov 2016 13:41:34 +0000
Subject: [Buildroot] [PATCH v2] jasper: bump version to 2.0.0 (security)
Message-ID: <20161128134134.18599-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixed CVEs:
 - CVE-2016-9387
 - CVE-2016-9388
 - CVE-2016-9389
 - CVE-2016-9390
 - CVE-2016-9391
 - CVE-2016-9392
 - CVE-2016-9393
 - CVE-2016-9394
 - CVE-2016-9395
 - CVE-2016-9396
 - CVE-2016-9397
 - CVE-2016-9398
 - CVE-2016-9399
 - CVE-2016-9557
 - CVE-2016-9560

Changes to jasper.mk:
  - Switched to CMake package infrastructure.
    - --disable-strict hack adapted to CMake infra. Also a comment has
      been added.
    - Xtensa debug hack adapted to CMake infra. Comment adapted as well.
  - Add logic when doing static-only builds. This prevents a final
    link failure which looks like this:

      [...]
      undefined reference to `__fini_array_end'
      undefined reference to `__fini_array_start'
      undefined reference to `__preinit_array_end'
      undefined reference to `__preinit_array_start'
      undefined reference to `__init_array_end'
      undefined reference to `__init_array_start'
      [...]
      libjasper.so.4.0.0: hidden symbol `__fini_array_end' isn't defined

Changes to Config.in:
 - Website URL changed to the real official one. Avoids one redirection.

Changes to patches:
  - Added patch to fix RPATH issue when building for static.
    - This patch has been sent as a pull request:
      https://github.com/mdadams/jasper/pull/95

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Commit message amended:
   - This patch doesn't change the download site.
   - This patch doesn't remove any upstreamed patches.

   These errors in the commit message happened because I cherry-picked
   my patch from the next branch.
---
 ...nly-change-RPATH-when-building-for-shared.patch | 57 ++++++++++++++++++++++
 package/jasper/Config.in                           |  2 +-
 package/jasper/jasper.hash                         |  2 +-
 package/jasper/jasper.mk                           | 20 ++++++--
 4 files changed, 74 insertions(+), 7 deletions(-)
 create mode 100644 package/jasper/0001-CMakeLists.txt-only-change-RPATH-when-building-for-shared.patch

diff --git a/package/jasper/0001-CMakeLists.txt-only-change-RPATH-when-building-for-shared.patch b/package/jasper/0001-CMakeLists.txt-only-change-RPATH-when-building-for-shared.patch
new file mode 100644
index 0000000..e724538
--- /dev/null
+++ b/package/jasper/0001-CMakeLists.txt-only-change-RPATH-when-building-for-shared.patch
@@ -0,0 +1,57 @@
+From ca9db2fa64adbbbff53c994f5f7d783c9ee5bf76 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Mon, 28 Nov 2016 12:49:27 +0000
+Subject: [PATCH] CMakeLists.txt: only change RPATH when building for shared
+
+When doing static-only builds (-DJAS_ENABLE_SHARED=OFF) the install
+process fails due to an invalid RPATH:
+
+...............................................................
+CMake Error at src/appl/cmake_install.cmake:45 (file):
+  file RPATH_CHANGE could not write new RPATH:
+
+    /usr/lib
+
+  to the file:
+
+    /br/output/host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/bin/jasper
+
+  No valid ELF RPATH or RUNPATH entry exists in the file;
+Call Stack (most recent call first):
+  cmake_install.cmake:42 (include)
+...............................................................
+
+RPATH shouldn't be changed when doing static-only builds.
+
+Pull request: https://github.com/mdadams/jasper/pull/95
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bc09d98..302cf2a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -193,6 +193,8 @@ endif()
+ 
+ ################################################################################
+ 
++if (JAS_ENABLE_SHARED)
++
+ # use, i.e. don't skip the full RPATH for the build tree
+ SET(CMAKE_SKIP_BUILD_RPATH  FALSE)
+ 
+@@ -213,6 +215,8 @@ IF("${isSystemDir}" STREQUAL "-1")
+    SET(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
+ ENDIF("${isSystemDir}" STREQUAL "-1")
+ 
++endif (JAS_ENABLE_SHARED)
++
+ ################################################################################
+ 
+ subdirs(src/libjasper src/appl doc)
+-- 
+2.10.1
+
diff --git a/package/jasper/Config.in b/package/jasper/Config.in
index 087b520..0a6fc89 100644
--- a/package/jasper/Config.in
+++ b/package/jasper/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_JASPER
 	help
 	  JPEG-2000 decoder
 
-	  http://www.ece.uvic.ca/~mdadams/jasper/
+	  http://www.ece.uvic.ca/~frodo/jasper/
diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index fdadbb2..a18b97a 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	6c942ae79108cd6a359e5bc34ea03565bd33ac20f6814cb09c4f92298b6b1cb8	jasper-1.900.22.tar.gz
+sha256 7aceb8c7401f1d7e102d14a2cb96d25a46501129a4fbe53f5bf0abc75bf6e5cd  jasper-2.0.0.tar.gz
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index bacb1a6..6093a23 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,18 +4,28 @@
 #
 ################################################################################
 
-JASPER_VERSION = 1.900.22
+JASPER_VERSION = 2.0.0
 JASPER_SITE = http://www.ece.uvic.ca/~frodo/jasper/software
 JASPER_INSTALL_STAGING = YES
 JASPER_DEPENDENCIES = jpeg
 JASPER_LICENSE = JasPer License Version 2.0
 JASPER_LICENSE_FILES = LICENSE
-JASPER_CONF_OPTS = --disable-strict
+
+# The -pedantic-errors gcc option turns -pedantic warnings into errors.
+# Set JAS_ENABLE_STRICT to OFF in order to remove -pedantic-errors.
+JASPER_CONF_OPTS = -DJAS_ENABLE_STRICT=OFF
 
 # Xtensa gcc is unable to generate correct code with -O0 enabled by
-# --enable-debug. Allow package build but disable debug.
+# -DCMAKE_BUILD_TYPE=Debug. Allow package build but disable debug.
 ifeq ($(BR2_xtensa)$(BR2_ENABLE_DEBUG),yy)
-JASPER_CONF_OPTS += --disable-debug
+JASPER_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+endif
+
+# Allow in-source build, otherwise it will just fail.
+JASPER_CONF_OPTS += -DALLOW_IN_SOURCE_BUILD=ON
+
+ifeq ($(BR2_STATIC_LIBS),y)
+JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.10.1
