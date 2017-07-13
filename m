From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 13 Jul 2017 15:04:44 +0200
Subject: [Buildroot] [PATCH v3 2/3] package/physfs: use the 2.0.x stable
	branch
In-Reply-To: <20170713130445.28410-1-romain.naour@gmail.com>
References: <20170713130445.28410-1-romain.naour@gmail.com>
Message-ID: <20170713130445.28410-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 2.1.x version is not released yet and it's still under development
and introduce API changes that may break other packages using the
latest stable version of physfs (2.0.x).

Also, there is an issue (segfault) with physfs 2.1.x while extracting
a zip archive. This issue is fixed in 2.0.x branch but not in 2.1.x
branch since physfs 2.1.x now use minizip which doesn't provide
inflateCopy() used by the bugfix [1].

[1] https://hg.icculus.org/icculus/physfs/rev/090cb9c74b87

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: fix LGPL.txt license path
    update patch to apply properly
---
 .../physfs/0001-Fix-builds-with-modern-GCC.patch   | 38 ----------------------
 package/physfs/0001-Remove-Werror.patch            | 28 ++++++++++++++++
 package/physfs/Config.in                           |  1 +
 package/physfs/physfs.mk                           |  7 ++--
 4 files changed, 34 insertions(+), 40 deletions(-)
 delete mode 100644 package/physfs/0001-Fix-builds-with-modern-GCC.patch
 create mode 100644 package/physfs/0001-Remove-Werror.patch

diff --git a/package/physfs/0001-Fix-builds-with-modern-GCC.patch b/package/physfs/0001-Fix-builds-with-modern-GCC.patch
deleted file mode 100644
index 710b4ff..0000000
--- a/package/physfs/0001-Fix-builds-with-modern-GCC.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 61d3b63abcba8e9615dcb8a3d1fc026bf7f8d5f8 Mon Sep 17 00:00:00 2001
-From: Jacob Burroughs <jburroughs@trustwave.com>
-Date: Thu, 23 Jun 2016 13:03:47 -0500
-Subject: [PATCH] Fix builds with modern GCC
-
-From SuperTux project:
-https://github.com/SuperTux/physfs/commit/61d3b63abcba8e9615dcb8a3d1fc026bf7f8d5f8
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2a371af..94c4844 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -50,7 +50,7 @@ endif()
- # Add some gcc-specific command lines.
- if(CMAKE_COMPILER_IS_GNUCC)
-     # Always build with debug symbols...you can strip it later.
--    add_definitions(-g -pipe -Werror -fsigned-char)
-+    add_definitions(-g -pipe -fsigned-char)
- 
-     # Stupid BeOS generates warnings in the system headers.
-     if(NOT BEOS)
-@@ -304,7 +304,7 @@ if(PHYSFS_BUILD_TEST)
-         if(READLINE_LIBRARY)
-             set(HAVE_SYSTEM_READLINE TRUE)
-             set(TEST_PHYSFS_LIBS ${TEST_PHYSFS_LIBS} ${READLINE_LIBRARY} ${CURSES_LIBRARY})
--            include_directories(${READLINE_H} ${HISTORY_H})
-+            include_directories(SYSTEM ${READLINE_H} ${HISTORY_H})
-             add_definitions(-DPHYSFS_HAVE_READLINE=1)
-         endif()
-     endif()
--- 
-2.9.3
-
diff --git a/package/physfs/0001-Remove-Werror.patch b/package/physfs/0001-Remove-Werror.patch
new file mode 100644
index 0000000..8bbb8cf
--- /dev/null
+++ b/package/physfs/0001-Remove-Werror.patch
@@ -0,0 +1,28 @@
+From 1aafb2a83fc35d11f50ebc21129b195f68b856e8 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Thu, 13 Jul 2017 14:49:27 +0200
+Subject: [PATCH] Remove Werror
+
+This may break the build with new compiler version (gcc 7.x)
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bfc35b1..db2fbf5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -49,7 +49,7 @@ ENDIF(MACOSX)
+ # Add some gcc-specific command lines.
+ IF(CMAKE_COMPILER_IS_GNUCC)
+     # Always build with debug symbols...you can strip it later.
+-    ADD_DEFINITIONS(-g -pipe -Werror -fsigned-char)
++    ADD_DEFINITIONS(-g -pipe -fsigned-char)
+ 
+     # Stupid BeOS generates warnings in the system headers.
+     IF(NOT BEOS)
+-- 
+2.9.4
+
diff --git a/package/physfs/Config.in b/package/physfs/Config.in
index dad3ab4..8b26295 100644
--- a/package/physfs/Config.in
+++ b/package/physfs/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PHYSFS
 	bool "physfs"
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_ZLIB
 	help
 	  PhysicsFS; a portable, flexible file i/o abstraction.
 
diff --git a/package/physfs/physfs.mk b/package/physfs/physfs.mk
index 9193ad5..aef3146 100644
--- a/package/physfs/physfs.mk
+++ b/package/physfs/physfs.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-PHYSFS_VERSION = be27dfd07d97336145e7f49d3fd200a6e902f85e
+# stable-2.0 branch
+PHYSFS_VERSION = 090cb9c74b87198e6d520afca9d649ca0d84669f
 PHYSFS_SITE = https://hg.icculus.org/icculus/physfs
 PHYSFS_SITE_METHOD = hg
 
 PHYSFS_LICENSE = Zlib (physfs), LGPL with exceptions (lzma)
-PHYSFS_LICENSE_FILES = LICENSE.txt src/lzma/LGPL.txt
+PHYSFS_LICENSE_FILES = LICENSE.txt lzma/LGPL.txt
+
+PHYSFS_DEPENDENCIES = zlib
 
 PHYSFS_INSTALL_STAGING = YES
 
-- 
2.9.4
