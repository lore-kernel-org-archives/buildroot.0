From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Mar 2014 23:59:58 +0200
Subject: [Buildroot] [PATCH 2/6] package/libgl: introduce as a new virtual
	package for full-openGL providers
In-Reply-To: <cover.1396302677.git.yann.morin.1998@free.fr>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
Message-ID: <7046edcc3e6f686e94e8a5854085daa8de17afbc.1396302677.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, on mesa3d is such a full-openGL provider.

But it is easy to see a few more cropping at the door:
  - NVidia's binary blob
  - ATI's fglrx binary blob

Having this virtual full-openGL package will help when those are getting in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 package/opengl/Config.in       |  1 +
 package/opengl/libgl/Config.in |  6 ++++++
 package/opengl/libgl/libgl.mk  | 16 ++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/opengl/libgl/Config.in
 create mode 100644 package/opengl/libgl/libgl.mk

diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index ed81835..20ee28b 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -1,3 +1,4 @@
+source "package/opengl/libgl/Config.in"
 source "package/opengl/libegl/Config.in"
 source "package/opengl/libgles/Config.in"
 source "package/opengl/libopenvg/Config.in"
diff --git a/package/opengl/libgl/Config.in b/package/opengl/libgl/Config.in
new file mode 100644
index 0000000..5eb277a
--- /dev/null
+++ b/package/opengl/libgl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_OPENGL
+	bool
+
+config BR2_PACKAGE_PROVIDES_OPENGL
+	depends on BR2_PACKAGE_HAS_OPENGL
+	string
diff --git a/package/opengl/libgl/libgl.mk b/package/opengl/libgl/libgl.mk
new file mode 100644
index 0000000..cf9daa5
--- /dev/null
+++ b/package/opengl/libgl/libgl.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libgl
+#
+################################################################################
+
+LIBGL_SOURCE =
+LIBGL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL))
+
+ifeq ($(BR2_PACKAGE_HAS_OPENGL),y)
+ifeq ($(LIBGL_DEPENDENCIES),)
+$(error No libGL implementation selected. Configuration error.)
+endif
+endif
+
+$(eval $(generic-package))
-- 
1.8.3.2
