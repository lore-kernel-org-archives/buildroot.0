From: Romain Naour <romain.naour@smile.fr>
Date: Mon,  6 May 2019 11:54:44 +0200
Subject: [Buildroot] [PATCH v3 2/9] package/mesa3d: rename OSMesa option
In-Reply-To: <20190506095451.26522-1-romain.naour@smile.fr>
References: <20190506095451.26522-1-romain.naour@smile.fr>
Message-ID: <20190506095451.26522-2-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option is renamed in order to match the naming used by the
meson buildsystem.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy                     | 7 +++++++
 package/mesa3d-demos/mesa3d-demos.mk | 2 +-
 package/mesa3d/Config.in             | 8 ++++----
 package/mesa3d/mesa3d.mk             | 2 +-
 package/wine/wine.mk                 | 2 +-
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a32cbcb6f2..f0dfa90e5a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.05"
 
+config BR2_PACKAGE_MESA3D_OSMESA
+	bool "mesa OSMesa option renamed"
+	select BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
+	help
+	  The option was renamed in order to match the naming used
+	  by the meson buildsystem.
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
 	bool "compositor moved to gst1-plugins-base"
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR
diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index ddff9b9ed9..e9aa44dc2e 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -61,7 +61,7 @@ ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
 MESA3D_DEMOS_DEPENDENCIES += libfreeglut
 MESA3D_DEMOS_CONF_OPTS += --with-glut=$(STAGING_DIR)/usr
 # osmesa support depends on glut
-ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_CLASSIC),y)
 MESA3D_DEMOS_CONF_OPTS += --enable-osmesa
 else
 MESA3D_DEMOS_CONF_OPTS += --disable-osmesa
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 3f44e94229..bd05116aca 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -265,11 +265,11 @@ comment "intel vulkan depends on X.org and needs a glibc toolchain w/ headers >=
 
 comment "Off-screen Rendering"
 
-config BR2_PACKAGE_MESA3D_OSMESA
-	bool "OSMesa library"
+config BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
+	bool "OSMesa (classic) library"
 	help
-	  The OSMesa API provides functions for making off-screen
-	  renderings.
+	  The OSMesa classic API provides functions for
+	  making off-screen renderings.
 
 if BR2_PACKAGE_MESA3D_DRIVER
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 576e8f0a2d..fde74dfd65 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -156,7 +156,7 @@ endif
 
 # APIs
 
-ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_CLASSIC),y)
 MESA3D_CONF_OPTS += --enable-osmesa
 else
 MESA3D_CONF_OPTS += --disable-osmesa
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 78fa860ecf..a09fcdff23 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -195,7 +195,7 @@ else
 WINE_CONF_OPTS += --without-ldap
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_CLASSIC),y)
 WINE_CONF_OPTS += --with-osmesa
 WINE_DEPENDENCIES += mesa3d
 else
-- 
2.20.1
