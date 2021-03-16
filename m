From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 22:04:02 +0100
Subject: [Buildroot] [git commit] package/cog: add config option to expose
 browser remote control on D-Bus system bus
Message-ID: <20210316204241.30A1281447@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c62c8747bffc9089c5a252d1d2471c236548de4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adrian Sweet <asweet@thegoodpenguin.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cog/Config.in | 5 +++++
 package/cog/cog.mk    | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index a9ca7473a9..5f00c5a2dd 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -47,6 +47,11 @@ config BR2_PACKAGE_COG_PLATFORM_DRM
 	  with video drivers that support kernel mode-setting (KMS)
 	  via the DRM user-space API.
 
+config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
+	bool "expose system D-Bus control interface"
+	help
+	  Expose remote control interface on system bus
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
