From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2019 20:51:22 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/clamav: security
 bump to version 0.101.5
Message-ID: <20191122194840.8466B8E7DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dca8e509640a10214dc917f7846af4249955b2b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

- CVE-2019-15961: A Denial-of-Service (DoS) vulnerability may occur when
  scanning a specially crafted email file as a result of excessively long
  scan times.  The issue is resolved by implementing several maximums in
  parsing MIME messages and by optimizing use of memory allocation.

Similar to the 0.102.0 bump, building with the internal libmspack copy is
broken, so instead link against the system one.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/Config.in   | 1 +
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 4 +++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 2017011b67..57338e910f 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CLAMAV
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBMSPACK
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 1246f4febf..84758c5ccb 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 0bf094f0919d158a578421d66bc2569c8c8181233ba162bb51722f98c802bccd  clamav-0.101.4.tar.gz
+sha256 04bc4af7aa61cd4ce419a1cfbf77605ee40128455c7627fe2725dd157392d58c  clamav-0.101.5.tar.gz
 sha256 0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256 d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256 dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 03ce4136a7..5285c7afd2 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.101.4
+CLAMAV_VERSION = 0.101.5
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
@@ -12,6 +12,7 @@ CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 	COPYING.unrar COPYING.zlib
 CLAMAV_DEPENDENCIES = \
 	host-pkgconf \
+	libmspack \
 	libtool \
 	openssl \
 	zlib \
@@ -32,6 +33,7 @@ CLAMAV_CONF_OPTS = \
 	--with-ltdl-include=$(STAGING_DIR)/usr/include \
 	--with-ltdl-lib=$(STAGING_DIR)/usr/lib \
 	--with-openssl=$(STAGING_DIR)/usr \
+	--with-system-libmspack=$(STAGING_DIR)/usr \
 	--with-zlib=$(STAGING_DIR)/usr \
 	--disable-zlib-vcheck \
 	--disable-rpath \
