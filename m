From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 26 May 2013 12:12:22 -0500
Subject: [Buildroot] [PATCH v8 09/10] libopenmax: Add libopenmax virtual
	package
In-Reply-To: <1369588343-13950-1-git-send-email-spenser@gillilanding.com>
References: <1369588343-13950-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1369588343-13950-10-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this adds the libopenmax virtual package for hardware based video acceleration

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/bellagio/Config.in   |    1 +
 package/opengl/Config.in                |    3 +++
 package/opengl/libopenmax/libopenmax.mk |   24 ++++++++++++++++++++++++
 package/rpi-userland/Config.in          |    1 +
 4 files changed, 29 insertions(+)
 create mode 100644 package/opengl/libopenmax/libopenmax.mk

diff --git a/package/multimedia/bellagio/Config.in b/package/multimedia/bellagio/Config.in
index 4be3aee..3292ef5 100644
--- a/package/multimedia/bellagio/Config.in
+++ b/package/multimedia/bellagio/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BELLAGIO
 	bool "bellagio"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HAS_OPENMAX
 	help
 	  Bellagio is an opensource implementation of the
 	  OpenMAX IL API.
diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index 81616f9..1636807 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -6,3 +6,6 @@ config BR2_PACKAGE_HAS_OPENGL_ES
 
 config BR2_PACKAGE_HAS_OPENVG
 	bool
+
+config BR2_PACKAGE_HAS_OPENMAX
+	bool
diff --git a/package/opengl/libopenmax/libopenmax.mk b/package/opengl/libopenmax/libopenmax.mk
new file mode 100644
index 0000000..dc29370
--- /dev/null
+++ b/package/opengl/libopenmax/libopenmax.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# Virtual package for libopenmax
+#
+#############################################################
+
+LIBOPENMAX_SOURCE =
+
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+LIBOPENMAX_DEPENDENCIES += rpi-userland
+endif
+
+ifeq ($(BR2_PACKAGE_BELLAGIO),y)
+LIBOPENMAX_DEPENDENCIES += bellagio
+endif
+
+ifeq ($(LIBOPENMAX_DEPENDENCIES),y)
+define LIBOPENMAX_CONFIGURE_CMDS
+	echo "No libopenmax implementation selected. Configuration error."
+	exit 1
+endef
+endif
+
+$(eval $(generic-package))
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 2c35fb7..da5726f 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_RPI_USERLAND
 	select BR2_PACKAGE_HAS_OPENGL_EGL
 	select BR2_PACKAGE_HAS_OPENGL_ES
 	select BR2_PACKAGE_HAS_OPENVG
+	select BR2_PACKAGE_HAS_OPENMAX
 	help
 	  Raspberry Pi Userland contains the necessary library to use the
 	  VideoCore driver.
-- 
1.7.9.5
