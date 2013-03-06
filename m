From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Mar 2013 21:22:47 +0100
Subject: [Buildroot] [PATCH 05/34] package: create virtual package for
	libGLES, libOpenVG and libEGL
In-Reply-To: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362601396-32250-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those acceleration libraries typically have multiple implementations:
some are free (Mesa), some are proprietary (generally SoC specific).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                     |    1 +
 package/opengl/Config.in              |    8 ++++++++
 package/opengl/libegl/libegl.mk       |   16 ++++++++++++++++
 package/opengl/libgles/libgles.mk     |   16 ++++++++++++++++
 package/opengl/libopenvg/libopenvg.mk |   16 ++++++++++++++++
 package/opengl/opengl.mk              |    1 +
 6 files changed, 58 insertions(+)
 create mode 100644 package/opengl/Config.in
 create mode 100644 package/opengl/libegl/libegl.mk
 create mode 100644 package/opengl/libgles/libgles.mk
 create mode 100644 package/opengl/libopenvg/libopenvg.mk
 create mode 100644 package/opengl/opengl.mk

diff --git a/package/Config.in b/package/Config.in
index 3706763..22e64f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -435,6 +435,7 @@ source "package/librsvg/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
 source "package/opencv/Config.in"
+source "package/opengl/Config.in"
 source "package/pango/Config.in"
 source "package/pixman/Config.in"
 source "package/tiff/Config.in"
diff --git a/package/opengl/Config.in b/package/opengl/Config.in
new file mode 100644
index 0000000..81616f9
--- /dev/null
+++ b/package/opengl/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HAS_OPENGL_EGL
+	bool
+
+config BR2_PACKAGE_HAS_OPENGL_ES
+	bool
+
+config BR2_PACKAGE_HAS_OPENVG
+	bool
diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
new file mode 100644
index 0000000..56cc8ac
--- /dev/null
+++ b/package/opengl/libegl/libegl.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# Virtual package for libEGL
+#
+#############################################################
+
+LIBEGL_SOURCE =
+
+ifeq ($(LIBEGL_DEPENDENCIES),y)
+define LIBEGL_CONFIGURE_CMDS
+	echo "No libEGL implementation selected. Configuration error."
+	exit 1
+endef
+endif
+
+$(eval $(generic-package))
diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
new file mode 100644
index 0000000..753f53e
--- /dev/null
+++ b/package/opengl/libgles/libgles.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# Virtual package for libGLES
+#
+#############################################################
+
+LIBGLES_SOURCE =
+
+ifeq ($(LIBGLES_DEPENDENCIES),y)
+define LIBGLES_CONFIGURE_CMDS
+	echo "No libGLES implementation selected. Configuration error."
+	exit 1
+endef
+endif
+
+$(eval $(generic-package))
diff --git a/package/opengl/libopenvg/libopenvg.mk b/package/opengl/libopenvg/libopenvg.mk
new file mode 100644
index 0000000..2fcc99f
--- /dev/null
+++ b/package/opengl/libopenvg/libopenvg.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# Virtual package for libOpenVG
+#
+#############################################################
+
+LIBOPENVG_SOURCE =
+
+ifeq ($(LIBOPENVG_DEPENDENCIES),y)
+define LIBOPENVG_CONFIGURE_CMDS
+	echo "No libOpenVG implementation selected. Configuration error."
+	exit 1
+endef
+endif
+
+$(eval $(generic-package))
diff --git a/package/opengl/opengl.mk b/package/opengl/opengl.mk
new file mode 100644
index 0000000..68df3b1
--- /dev/null
+++ b/package/opengl/opengl.mk
@@ -0,0 +1 @@
+include package/opengl/*/*.mk
-- 
1.7.9.5
