From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 15 May 2013 16:59:37 -0500
Subject: [Buildroot] [PATCH v6 09/10] libopenmax: Add libopenmax virtual
	package
In-Reply-To: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
References: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368655178-19176-10-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this adds the libopenmax virtual package for hardware based video acceleration

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/opengl/Config.in                |    3 +++
 package/opengl/libopenmax/libopenmax.mk |   24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 package/opengl/libopenmax/libopenmax.mk

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
-- 
1.7.9.5
