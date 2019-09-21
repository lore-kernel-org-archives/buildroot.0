From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Sep 2019 22:56:48 +0200
Subject: [Buildroot] [git commit] package/libspatialindex: bump to version
 1.9.0
Message-ID: <20190921205152.5B5D18F073@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ab4e71a4027370c49a31220bbf2c8a51a1a5f1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to github to get latest version
- Switch to cmake to be able to disable tests as they fail to build with
  /home/fabrice/buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: warning: libspatialindex.so.5, needed by ../../.libs/libspatialindex_c.so, not found (try using -rpath or -rpath-link)
  /home/fabrice/buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: ../../.libs/libspatialindex_c.so: undefined reference to `Tools::NotSupportedException::NotSupportedException(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)'
- Add C++11 dependency for shared_ptr
- Drop patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure.ac-do-not-force-O2.patch        | 30 ----------------------
 package/libspatialindex/Config.in                  |  5 ++--
 package/libspatialindex/libspatialindex.hash       |  9 ++++---
 package/libspatialindex/libspatialindex.mk         | 14 +++++-----
 4 files changed, 15 insertions(+), 43 deletions(-)

diff --git a/package/libspatialindex/0001-configure.ac-do-not-force-O2.patch b/package/libspatialindex/0001-configure.ac-do-not-force-O2.patch
deleted file mode 100644
index c078e713ec..0000000000
--- a/package/libspatialindex/0001-configure.ac-do-not-force-O2.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7472764fe19cb3eea77f21cc2859859b8ac62085 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 14 Aug 2017 23:36:36 +0200
-Subject: [PATCH] configure.ac: do not force -O2
-
-The user may want to provide its own set of optimization flags, and
-therefore forcing -O2 should not be done.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Submitted-upstream: https://github.com/libspatialindex/libspatialindex/pull/101
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index dc5e49f..2e2aa68 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -53,7 +53,7 @@ if test "x$enable_debug" = "xyes"; then
- 	CXXFLAGS="$CXXFLAGS -g -DDEBUG"
- 	AC_MSG_RESULT(checking wether debug information is enabled... yes)
- else
--	CXXFLAGS="$CXXFLAGS -O2 -DNDEBUG"
-+	CXXFLAGS="$CXXFLAGS -DNDEBUG"
- 	AC_MSG_RESULT(checking wether debug information is enabled... no)
- fi
- 
--- 
-2.9.4
-
diff --git a/package/libspatialindex/Config.in b/package/libspatialindex/Config.in
index 0d066f6417..e9d925dc00 100644
--- a/package/libspatialindex/Config.in
+++ b/package/libspatialindex/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSPATIALINDEX
 	bool "libspatialindex"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	help
 	  The purpose of libspatialindex is to provide:
 
@@ -26,5 +27,5 @@ config BR2_PACKAGE_LIBSPATIALINDEX
 
 	  https://libspatialindex.github.io
 
-comment "libspatialindex needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libspatialindex needs a toolchain w/ C++, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/libspatialindex/libspatialindex.hash b/package/libspatialindex/libspatialindex.hash
index 3aa636d353..4eda28237d 100644
--- a/package/libspatialindex/libspatialindex.hash
+++ b/package/libspatialindex/libspatialindex.hash
@@ -1,4 +1,5 @@
-# From http://download.osgeo.org/libspatialindex/spatialindex-src-1.8.5.tar.bz2.md5
-md5 3303c47fd85aa17e64ef52ebec212762 spatialindex-src-1.8.5.tar.bz2
-# Locally computed
-sha256 31ec0a9305c3bd6b4ad60a5261cba5402366dd7d1969a8846099717778e9a50a spatialindex-src-1.8.5.tar.bz2
+# From https://github.com/libspatialindex/libspatialindex/releases/download/1.9.0/spatialindex-src-1.9.0.tar.bz2.sha512sum
+sha512 dbf9601c878f245899d7336347674e96e8eeb715ec33a36ade44f3cc821c1dca7995cb09197a382bfd97da75c38f37b04f4d8f81ffbf38fef65fff82c5d1d2f3 spatialindex-src-1.9.0.tar.bz2
+
+# Hash for license file
+sha256 b63ebfaca9d7ce582580f3e11acabc9d2e37c46ce234533f7fa8a6c7278898a0 COPYING
diff --git a/package/libspatialindex/libspatialindex.mk b/package/libspatialindex/libspatialindex.mk
index 8dd85e2700..57088a2e12 100644
--- a/package/libspatialindex/libspatialindex.mk
+++ b/package/libspatialindex/libspatialindex.mk
@@ -4,21 +4,21 @@
 #
 ################################################################################
 
-LIBSPATIALINDEX_VERSION = 1.8.5
-LIBSPATIALINDEX_SITE = http://download.osgeo.org/libspatialindex
+LIBSPATIALINDEX_VERSION = 1.9.0
+LIBSPATIALINDEX_SITE = \
+	https://github.com/libspatialindex/libspatialindex/releases/download/$(LIBSPATIALINDEX_VERSION)
 LIBSPATIALINDEX_SOURCE = spatialindex-src-$(LIBSPATIALINDEX_VERSION).tar.bz2
 LIBSPATIALINDEX_INSTALL_STAGING = YES
 LIBSPATIALINDEX_LICENSE = MIT
 LIBSPATIALINDEX_LICENSE_FILES = COPYING
 
-# 0001-configure.ac-do-not-force-O2.patch
-LIBSPATIALINDEX_AUTORECONF = YES
-
 LIBSPATIALINDEX_CXXFLAGS = $(TARGET_CXXFLAGS)
-LIBSPATIALINDEX_CONF_ENV = CXXFLAGS="$(LIBSPATIALINDEX_CXXFLAGS)"
+LIBSPATIALINDEX_CONF_OPTS = \
+	-DSIDX_BUILD_TESTS=OFF \
+	-DCMAKE_CXX_FLAGS="$(LIBSPATIALINDEX_CXXFLAGS)"
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 LIBSPATIALINDEX_CXXFLAGS += -O0
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
