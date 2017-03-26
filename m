From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 22:37:35 +0200
Subject: [Buildroot] [git commit] package/physfs: new package
Message-ID: <20170326203857.CDC7582258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba2850edcc88c318d1f92edb7f76e54cecc3ec6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch from SuperTux project:
https://github.com/SuperTux/physfs/commit/61d3b63abcba8e9615dcb8a3d1fc026bf7f8d5f8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../physfs/0001-Fix-builds-with-modern-GCC.patch   | 38 ++++++++++++++++++++++
 package/physfs/Config.in                           | 10 ++++++
 package/physfs/physfs.mk                           | 30 +++++++++++++++++
 5 files changed, 80 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a4e2e9e..215a3b4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1323,6 +1323,7 @@ F:	package/linux-syscall-support/
 F:	package/lugaru/
 F:	package/mcelog/
 F:	package/openpowerlink/
+F:	package/physfs/
 F:	package/stress-ng/
 F:	package/terminology/
 F:	package/upower/
diff --git a/package/Config.in b/package/Config.in
index 51c7264..9a78e0a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -986,6 +986,7 @@ menu "Filesystem"
 	source "package/libnfs/Config.in"
 	source "package/libsysfs/Config.in"
 	source "package/lockdev/Config.in"
+	source "package/physfs/Config.in"
 endmenu
 
 menu "Graphics"
diff --git a/package/physfs/0001-Fix-builds-with-modern-GCC.patch b/package/physfs/0001-Fix-builds-with-modern-GCC.patch
new file mode 100644
index 0000000..710b4ff
--- /dev/null
+++ b/package/physfs/0001-Fix-builds-with-modern-GCC.patch
@@ -0,0 +1,38 @@
+From 61d3b63abcba8e9615dcb8a3d1fc026bf7f8d5f8 Mon Sep 17 00:00:00 2001
+From: Jacob Burroughs <jburroughs@trustwave.com>
+Date: Thu, 23 Jun 2016 13:03:47 -0500
+Subject: [PATCH] Fix builds with modern GCC
+
+From SuperTux project:
+https://github.com/SuperTux/physfs/commit/61d3b63abcba8e9615dcb8a3d1fc026bf7f8d5f8
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2a371af..94c4844 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -50,7 +50,7 @@ endif()
+ # Add some gcc-specific command lines.
+ if(CMAKE_COMPILER_IS_GNUCC)
+     # Always build with debug symbols...you can strip it later.
+-    add_definitions(-g -pipe -Werror -fsigned-char)
++    add_definitions(-g -pipe -fsigned-char)
+ 
+     # Stupid BeOS generates warnings in the system headers.
+     if(NOT BEOS)
+@@ -304,7 +304,7 @@ if(PHYSFS_BUILD_TEST)
+         if(READLINE_LIBRARY)
+             set(HAVE_SYSTEM_READLINE TRUE)
+             set(TEST_PHYSFS_LIBS ${TEST_PHYSFS_LIBS} ${READLINE_LIBRARY} ${CURSES_LIBRARY})
+-            include_directories(${READLINE_H} ${HISTORY_H})
++            include_directories(SYSTEM ${READLINE_H} ${HISTORY_H})
+             add_definitions(-DPHYSFS_HAVE_READLINE=1)
+         endif()
+     endif()
+-- 
+2.9.3
+
diff --git a/package/physfs/Config.in b/package/physfs/Config.in
new file mode 100644
index 0000000..dad3ab4
--- /dev/null
+++ b/package/physfs/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PHYSFS
+	bool "physfs"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  PhysicsFS; a portable, flexible file i/o abstraction.
+
+	  http://icculus.org/physfs
+
+comment "physfs needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/physfs/physfs.mk b/package/physfs/physfs.mk
new file mode 100644
index 0000000..c88d7cf
--- /dev/null
+++ b/package/physfs/physfs.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# physfs
+#
+################################################################################
+
+PHYSFS_VERSION = be27dfd07d97336145e7f49d3fd200a6e902f85e
+PHYSFS_SITE = https://hg.icculus.org/icculus/physfs
+PHYSFS_SITE_METHOD = hg
+
+PHYSFS_LICENSE = zlib license (physfs), LGPL with exceptions (lzma)
+PHYSFS_LICENSE_FILES = LICENSE.txt src/lzma/LGPL.txt
+
+PHYSFS_INSTALL_STAGING = YES
+
+PHYSFS_CONF_OPTS = -DPHYSFS_BUILD_TEST=OFF
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+PHYSFS_CONF_OPTS += -DPHYSFS_BUILD_SHARED=ON
+else
+PHYSFS_CONF_OPTS += -DPHYSFS_BUILD_SHARED=OFF
+endif
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+PHYSFS_CONF_OPTS += -DPHYSFS_BUILD_STATIC=ON
+else
+PHYSFS_CONF_OPTS += -DPHYSFS_BUILD_STATIC=OFF
+endif
+
+$(eval $(cmake-package))
