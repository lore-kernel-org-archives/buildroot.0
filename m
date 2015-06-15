From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Jun 2015 20:31:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
	mesa3d-headers}: bump version to 10.6.0
Message-ID: <1434393117-14293-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mesa3d 10.6 adds optional support for SHA-1:
http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?id=a24bdce46f95cbe9efd3b26f157d1eb36584861f

Adding "--without-sha1" will cause this failure during configure:

configure: error: Illegal value for --with-sha1: no

so I did not add the else-clause when no SHA-1 provider is enabled.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk |    2 +-
 package/mesa3d/mesa3d.hash               |    4 ++--
 package/mesa3d/mesa3d.mk                 |   12 +++++++++++-
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 0979406..07340f7 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 10.5.7
+MESA3D_HEADERS_VERSION = 10.6.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index b026245..456348f 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/mesa-announce/2015-June/000157.html
-sha256	04d06890cd69af8089d6ca76f40e46dcf9cacfe4a9788b32be620574d4638818	mesa-10.5.7.tar.xz
+# From http://lists.freedesktop.org/archives/mesa-announce/2015-June/000158.html
+sha256	f37e2633978deed02ff0522abc36c709586e2b555fd439a82ab71dce2c866c76	mesa-10.6.0.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2a7e48c..92df3db 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 10.5.7
+MESA3D_VERSION = 10.6.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -20,6 +20,16 @@ MESA3D_DEPENDENCIES = \
 	expat \
 	libdrm
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MESA3D_DEPENDENCIES += openssl
+MESA3D_CONF_OPTS += --with-sha1=libcrypto
+else
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+MESA3D_DEPENDENCIES += libgcrypt
+MESA3D_CONF_OPTS += --with-sha1=libgcrypt
+endif
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_DEPENDENCIES += \
 	xproto_xf86driproto \
-- 
1.7.10.4
