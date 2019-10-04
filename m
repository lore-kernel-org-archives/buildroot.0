From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  4 Oct 2019 15:04:24 +0200
Subject: [Buildroot] [PATCH 2/2] package/clamav: bump version to 0.102.0
In-Reply-To: <20191004130424.27715-1-bernd.kuhls@t-online.de>
References: <20191004130424.27715-1-bernd.kuhls@t-online.de>
Message-ID: <20191004130424.27715-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://blog.clamav.net/2019/10/clamav-01020-has-been-released.html

Added dependencies to libcurl and libmspack.

Although it is technically possible to build this package without
libcurl is makes no sense because only libclamav would be built by
passing the new configure option --enable-libclamav-only but this would
disable most of the package rendering the scan for viruses impossible.
Therefore we decided to make libcurl a mandatory dependency.

libmspack was added as dependency to avoid building the internally
provided code for this package, we prefer to provide needed libraries
ourselves. Linking against internally-built libmspack is broken anyway
but we do not bother to this the problem, use system libmspack instead.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/Config.in   |  2 ++
 package/clamav/clamav.hash |  2 +-
 package/clamav/clamav.mk   | 13 +++++--------
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 2017011b67..b3f09aebda 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_CLAMAV
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBMSPACK
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 1246f4febf..aaebfd104c 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 0bf094f0919d158a578421d66bc2569c8c8181233ba162bb51722f98c802bccd  clamav-0.101.4.tar.gz
+sha256 48fe188c46c793c2d0cb5c81c106e4690251aff6dc8aa6575dc688343291bee1  clamav-0.102.0.tar.gz
 sha256 0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256 d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256 dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 03ce4136a7..6500826339 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.101.4
+CLAMAV_VERSION = 0.102.0
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
@@ -12,6 +12,8 @@ CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 	COPYING.unrar COPYING.zlib
 CLAMAV_DEPENDENCIES = \
 	host-pkgconf \
+	libcurl \
+	libmspack \
 	libtool \
 	openssl \
 	zlib \
@@ -31,7 +33,9 @@ CLAMAV_CONF_OPTS = \
 	--with-dbdir=/var/lib/clamav \
 	--with-ltdl-include=$(STAGING_DIR)/usr/include \
 	--with-ltdl-lib=$(STAGING_DIR)/usr/lib \
+	--with-libcurl=$(STAGING_DIR)/usr \
 	--with-openssl=$(STAGING_DIR)/usr \
+	--with-system-libmspack=$(STAGING_DIR)/usr \
 	--with-zlib=$(STAGING_DIR)/usr \
 	--disable-zlib-vcheck \
 	--disable-rpath \
@@ -66,13 +70,6 @@ else
 CLAMAV_CONF_OPTS += --disable-xml
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-CLAMAV_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
-CLAMAV_DEPENDENCIES += libcurl
-else
-CLAMAV_CONF_OPTS += --without-libcurl
-endif
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 CLAMAV_CONF_OPTS += --with-iconv
 CLAMAV_DEPENDENCIES += libiconv
-- 
2.20.1
