From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 23:58:32 +0100
Subject: [Buildroot] [git commit] package/libevas-generic-loaders: add
	libraw dependency
Message-ID: <20151217230816.53108803E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25ef28b14a8e7b8c332ebfeb77f71056801d7214
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libraw it's one of the "highly recommended" dependecies
according to the README [1].

[1] https://git.enlightenment.org/core/evas_generic_loaders.git/tree/README?id=v1.15.0#n31

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevas-generic-loaders/Config.in                  | 10 ++++++++++
 package/libevas-generic-loaders/libevas-generic-loaders.mk |  9 +++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
index 65ced8a..1d5b717 100644
--- a/package/libevas-generic-loaders/Config.in
+++ b/package/libevas-generic-loaders/Config.in
@@ -11,6 +11,16 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 
 if BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 
+config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_LIBRAW
+	bool "libraw loader"
+	depends on BR2_INSTALL_LIBSTDCPP # libraw
+	select BR2_PACKAGE_LIBRAW
+	help
+	  This option enables the Evas generic Libraw loader
+
+comment "libraw loader needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 	bool "SVG loader"
 	depends on BR2_USE_MMU # librsvg -> glib2
diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
index 47dfa9a..2c1c1cd 100644
--- a/package/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -14,15 +14,20 @@ LIBEVAS_GENERIC_LOADERS_INSTALL_STAGING = YES
 
 LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = host-pkgconf libefl zlib
 
-# For now, we only support the SVG loader
 # poppler >= 0.32 is not supported by the current version of
 # libevas-generic-loaders.
 LIBEVAS_GENERIC_LOADERS_CONF_OPTS += \
 	--disable-poppler \
 	--disable-spectre \
-	--disable-libraw \
 	--disable-gstreamer
 
+ifeq ($(BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_LIBRAW),y)
+LIBEVAS_GENERIC_LOADERS_DEPENDENCIES += libraw
+LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --enable-libraw
+else
+LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --disable-libraw
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG),y)
 LIBEVAS_GENERIC_LOADERS_DEPENDENCIES += librsvg cairo
 LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --enable-svg
