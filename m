From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 14:50:10 +0200
Subject: [Buildroot] [git commit] package/minizip: bump to version 2.10.0
Message-ID: <20200714125030.ABF4886E5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3ddbd177bb99ee6d9f21f205fd1f61296caebb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Add zstd optional dependency, available since version 2.10.0 and
  https://github.com/nmoinvaz/minizip/commit/1f4758bd7f979a56b33667fbbcdb0305e8b4173f
- Use the new MZ_LIBBSD option available since version 2.10.0 and
  https://github.com/nmoinvaz/minizip/commit/29fcb4768050fbbf02d572a24a4e2ad29d51b60d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eLists.txt-use-pkg-config-to-find-openssl.patch | 44 ----------------------
 package/minizip/minizip.hash                       |  2 +-
 package/minizip/minizip.mk                         | 17 ++++++++-
 3 files changed, 16 insertions(+), 47 deletions(-)

diff --git a/package/minizip/0001-CMakeLists.txt-use-pkg-config-to-find-openssl.patch b/package/minizip/0001-CMakeLists.txt-use-pkg-config-to-find-openssl.patch
deleted file mode 100644
index 8b44a17712..0000000000
--- a/package/minizip/0001-CMakeLists.txt-use-pkg-config-to-find-openssl.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1fdf5da78369305164313610dbb1ec868233ba08 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 14 Jun 2020 14:04:03 +0200
-Subject: [PATCH] CMakeLists.txt: use pkg-config to find openssl
-
-Use pkg-config to find openssl libraries otherwise minizip will fail to
-retrieve openssl static dependencies such as -latomic and build of
-test_cmd will fail on:
-
-[100%] Linking C executable test_cmd
-/home/test/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/test/autobuild/run/instance-3/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(bio_lib.o): in function `BIO_free':
-bio_lib.c:(.text+0x510): undefined reference to `__atomic_fetch_sub_4'
-
-Fixes:
- - http://autobuild.buildroot.org/results/b54b625751a45d3b449fffcdfaa06fb9209b4652
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/nmoinvaz/minizip/pull/499]
----
- CMakeLists.txt | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b789f62..7a81e32 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -140,7 +140,13 @@ endif()
- 
- # Check to see if openssl installation is present
- if(MZ_OPENSSL)
--    find_package(OpenSSL)
-+    find_package(PkgConfig)
-+    if(PKGCONFIG_FOUND)
-+        pkg_check_modules(OPENSSL openssl)
-+    endif()
-+    if(NOT OPENSSL_FOUND)
-+        find_package(OpenSSL)
-+    endif()
-     if (OPENSSL_FOUND)
-         message(STATUS "Using OpenSSL ${OPENSSL_VERSION}")
- 
--- 
-2.26.2
-
diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 0fed09735a..74799b9d58 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8425399277d9d5e39454e655cfd3eb004607960c8358a3e732f5e741a6b5df0a  minizip-2.9.2.tar.gz
+sha256  4c7f236268fef57ce5dcbd9645235a22890d62480a592e1b0515ecff93f9989b  minizip-2.10.0.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 313fe87a49..3fafab5f94 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 2.9.2
+MINIZIP_VERSION = 2.10.0
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = \
 	host-pkgconf \
-	$(if $(BR2_PACKAGE_LIBBSD),libbsd) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 MINIZIP_INSTALL_STAGING = YES
 MINIZIP_CONF_OPTS = \
@@ -24,6 +23,13 @@ else
 MINIZIP_CONF_OPTS += -DMZ_BZIP2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBSD),y)
+MINIZIP_DEPENDENCIES += libbsd
+MINIZIP_CONF_OPTS += -DMZ_LIBBSD=ON
+else
+MINIZIP_CONF_OPTS += -DMZ_LIBBSD=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MINIZIP_DEPENDENCIES += openssl
 MINIZIP_CONF_OPTS += -DMZ_OPENSSL=ON
@@ -38,4 +44,11 @@ else
 MINIZIP_CONF_OPTS += -DMZ_ZLIB=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+MINIZIP_DEPENDENCIES += zstd
+MINIZIP_CONF_OPTS += -DMZ_ZSTD=ON
+else
+MINIZIP_CONF_OPTS += -DMZ_ZSTD=OFF
+endif
+
 $(eval $(cmake-package))
