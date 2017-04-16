From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 16 Apr 2017 22:48:26 +0200
Subject: [Buildroot] [PATCH] package/aubio: bump to version 0.4.5
Message-ID: <20170416204826.26661-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since aubio 4.4.4, the libsamplerate support require fftw
single precision mode.

Add a new option BR2_PACKAGE_AUBIO_LIBSAMPLERATE to enable
libsamplerate support only if BR2_PACKAGE_FFTW_PRECISION_SINGLE
is set.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/aubio/Config.in  | 14 ++++++++++++++
 package/aubio/aubio.hash |  4 ++--
 package/aubio/aubio.mk   |  4 ++--
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/package/aubio/Config.in b/package/aubio/Config.in
index c4c60db..85f5d9a 100644
--- a/package/aubio/Config.in
+++ b/package/aubio/Config.in
@@ -17,5 +17,19 @@ config BR2_PACKAGE_AUBIO
 
 	  https://aubio.org
 
+if BR2_PACKAGE_AUBIO
+
+config BR2_PACKAGE_AUBIO_LIBSAMPLERATE
+	bool "Enable libsamplerate support"
+	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE
+	help
+	  Aubio require fftw single precision mode with libsamplerate
+	  (libsamplerate only supports float).
+
+comment "aubio w/ libsamplerate needs fftw in single precision"
+	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
+
+endif
+
 comment "aubio needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/aubio/aubio.hash b/package/aubio/aubio.hash
index e447847..b4233ae 100644
--- a/package/aubio/aubio.hash
+++ b/package/aubio/aubio.hash
@@ -1,2 +1,2 @@
-# From https://aubio.org/pub/aubio-0.4.3.tar.bz2.sha256
-sha256 b62cdb073c0c64ae301917fa162969d42cba45e478bdf1e74490bd87e9cceaab  aubio-0.4.3.tar.bz2
+# From https://aubio.org/pub/aubio-0.4.5.tar.bz2.sha256
+sha256 70c2804e6f4fbf0ebc0fb9ac8cc9d465ef4a4d438311c074c9a7364e98827af6  aubio-0.4.5.tar.bz2
diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index f8be19f..e58efa3 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUBIO_VERSION = 0.4.3
+AUBIO_VERSION = 0.4.5
 AUBIO_SITE = https://aubio.org/pub
 AUBIO_SOURCE = aubio-$(AUBIO_VERSION).tar.bz2
 AUBIO_LICENSE = GPL-3.0+
@@ -26,7 +26,7 @@ else
 AUBIO_CONF_OPTS += --disable-sndfile
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+ifeq ($(BR2_PACKAGE_AUBIO_LIBSAMPLERATE),y)
 AUBIO_DEPENDENCIES += libsamplerate
 AUBIO_CONF_OPTS += --enable-samplerate
 else
-- 
2.9.3
