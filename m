From: Adrian Sweet <asweet@thegoodpenguin.co.uk>
Date: Tue, 16 Mar 2021 09:47:27 +0000
Subject: [Buildroot] [PATCH v2 1/1] Added config option to expose browser
 remote control on the D-Bus system bus
Message-ID: <20210316094727.1881200-1-asweet@thegoodpenguin.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrian Sweet <asweet@thegoodpenguin.co.uk>
---
 package/cog/Config.in | 5 +++++
 package/cog/cog.mk    | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index a9ca7473a9..534d3adebc 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -47,6 +47,11 @@ config BR2_PACKAGE_COG_PLATFORM_DRM
 	  with video drivers that support kernel mode-setting (KMS)
 	  via the DRM user-space API.
 
+config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
+       bool "Use D-Bus system bus"
+       help
+         Expose remote control interface on system bus
+
 comment "DRM platform needs mesa3d w/ EGL driver and GBM"
 	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
 
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index c7fc5e6fee..86bdf935d2 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -31,4 +31,10 @@ else
 COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_COG_USE_SYSTEM_DBUS),y)
+COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=ON
+else
+COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.25.1
