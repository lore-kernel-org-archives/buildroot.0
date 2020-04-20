From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 20 Apr 2020 20:14:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libzip: bump version to 1.6.1
Message-ID: <20200420181430.45762-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use new upstream URL libzip.org.

Add optional dependency to liblzma introduced with version 1.6.0:
https://libzip.org/news/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libzip/Config.in   |  2 +-
 package/libzip/libzip.hash |  4 ++--
 package/libzip/libzip.mk   | 11 +++++++++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/libzip/Config.in b/package/libzip/Config.in
index c6ddabe6b5..a603d9abf1 100644
--- a/package/libzip/Config.in
+++ b/package/libzip/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LIBZIP
 	  This package also contains zipcmp, ziptorrent and zipmerge
 	  utilities.
 
-	  http://www.nih.at/libzip/
+	  https://libzip.org/
 
 comment "libzip needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index eb11b526fb..676cdce7f3 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	b3de4d4bd49a01e0cab3507fc163f88e1651695b6b9cb25ad174dbe319d4a3b4  libzip-1.5.2.tar.xz
-sha256  04464e729973cf58189051e7a3e8bca2acce9a1058c735e9e2eb1fdbe0fbbf50  LICENSE
+sha256 705dac7a671b3f440181481e607b0908129a9cf1ddfcba75d66436c0e7d33641  libzip-1.6.1.tar.xz
+sha256 af6d9141427cf40b7d1fa6d7f5473b06a7faa9f9b0a2ea588eb6ba7b2e1c8a9e  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index a312dd90df..f021e06b66 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.5.2
-LIBZIP_SITE = http://www.nih.at/libzip
+LIBZIP_VERSION = 1.6.1
+LIBZIP_SITE = https://libzip.org/download
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
 LIBZIP_LICENSE_FILES = LICENSE
@@ -38,5 +38,12 @@ LIBZIP_DEPENDENCIES += musl-fts
 LIBZIP_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+LIBZIP_DEPENDENCIES += xz
+LIBZIP_CONF_OPTS += -DENABLE_LZMA=ON
+else
+LIBZIP_CONF_OPTS += -DENABLE_LZMA=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.26.1
