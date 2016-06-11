From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 11 Jun 2016 16:47:41 +0200
Subject: [Buildroot] [PATCH 2/4] package/efl: bump to 1.17.1
In-Reply-To: <1465656463-8556-1-git-send-email-romain.naour@gmail.com>
References: <1465656463-8556-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1465656463-8556-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the comment about Lua support which doesn't build with Lua 5.1+.
Update the untested configuration warning option.

Backport an upstream patch to fix the Ector library build:
http://lists.busybox.net/pipermail/buildroot/2016-June/163606.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...uplicated-use-of-the-variable-in-multiple.patch | 77 ++++++++++++++++++++++
 package/efl/Config.in                              |  2 +-
 package/efl/efl.hash                               |  4 +-
 package/efl/efl.mk                                 |  8 +--
 4 files changed, 84 insertions(+), 7 deletions(-)
 create mode 100644 package/efl/0001-build-fix-duplicated-use-of-the-variable-in-multiple.patch

diff --git a/package/efl/0001-build-fix-duplicated-use-of-the-variable-in-multiple.patch b/package/efl/0001-build-fix-duplicated-use-of-the-variable-in-multiple.patch
new file mode 100644
index 0000000..2a04eac
--- /dev/null
+++ b/package/efl/0001-build-fix-duplicated-use-of-the-variable-in-multiple.patch
@@ -0,0 +1,77 @@
+From c69a215612b333406d0dc05cd1867b1116498586 Mon Sep 17 00:00:00 2001
+From: Vincent Torri <vincent dot torri@gmail dot com>
+Date: Thu, 18 Feb 2016 13:25:21 -0800
+Subject: [PATCH] build: fix duplicated use of the variable in multiple
+ Makefile_*.am.
+
+GL_SHADERS_GEN is defined in the Makefile.am of Ector and Evas. As these
+Mafile_*.am are included in the same Makefile.am, there is a warning with
+multiple defined triggered by automake. So this patch rename these 2 variables
+
+Test Plan: autogen.sH
+
+Reviewers: jpeg, cedric
+
+Differential Revision: https://phab.enlightenment.org/D3711
+
+Signed-off-by: Cedric BAIL <cedric@osg.samsung.com>
+[Backport from upstream to 1.17.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/Makefile_Ector.am | 6 +++---
+ src/Makefile_Evas.am  | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/Makefile_Ector.am b/src/Makefile_Ector.am
+index bbe1763..f1a8178 100644
+--- a/src/Makefile_Ector.am
++++ b/src/Makefile_Ector.am
+@@ -133,13 +133,13 @@ lib/ector/gl/ector_gl_private.h \
+ lib/ector/gl/shader/ector_gl_shaders.x \
+ lib/ector/gl/ector_gl_shader.c
+ 
+-GL_SHADERS_GEN = \
++ECTOR_GL_SHADERS_GEN = \
+ lib/ector/gl/shader/gen_shaders.sh \
+ lib/ector/gl/shader/fragment.glsl \
+ lib/ector/gl/shader/vertex.glsl \
+ lib/ector/gl/shader/include.glsl
+ 
+-lib/ector/gl/shader/ector_gl_shaders.x: $(GL_SHADERS_GEN)
++lib/ector/gl/shader/ector_gl_shaders.x: $(ECTOR_GL_SHADERS_GEN)
+ 	@echo "  SHADERS  $@"
+ 	@bash $(srcdir)/lib/ector/gl/shader/gen_shaders.sh
+ 
+@@ -201,4 +201,4 @@ static_libs/freetype/sw_ft_stroker.h \
+ static_libs/freetype/sw_ft_types.h \
+ static_libs/draw/draw.h \
+ static_libs/draw/draw_private.h \
+-$(GL_SHADERS_GEN)
++$(ECTOR_GL_SHADERS_GEN)
+diff --git a/src/Makefile_Evas.am b/src/Makefile_Evas.am
+index 6491bc5..a8f380a 100644
+--- a/src/Makefile_Evas.am
++++ b/src/Makefile_Evas.am
+@@ -730,16 +730,16 @@ modules/evas/engines/gl_common/evas_gl_3d.c \
+ modules/evas/engines/gl_common/evas_gl_3d_renderer.c \
+ modules/evas/engines/gl_common/evas_gl_3d_shader.c
+ 
+-GL_SHADERS_GEN = \
++EVAS_GL_SHADERS_GEN = \
+ modules/evas/engines/gl_common/shader/gen_shaders.sh \
+ modules/evas/engines/gl_common/shader/fragment.glsl \
+ modules/evas/engines/gl_common/shader/vertex.glsl \
+ modules/evas/engines/gl_common/shader/include.glsl \
+ $(NULL)
+ 
+-EXTRA_DIST += $(GL_SHADERS_GEN)
++EXTRA_DIST += $(EVAS_GL_SHADERS_GEN)
+ 
+-modules/evas/engines/gl_common/shader/evas_gl_shaders.x: $(GL_SHADERS_GEN)
++modules/evas/engines/gl_common/shader/evas_gl_shaders.x: $(EVAS_GL_SHADERS_GEN)
+ 	@echo "  SHADERS  $@"
+ 	@bash $(srcdir)/modules/evas/engines/gl_common/shader/gen_shaders.sh
+ 
+-- 
+2.5.5
+
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 4e37850..7fc26e4 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_EFL
 	select BR2_PACKAGE_LIBCURL # Ecore_con_url, runtime dependency
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
 	# https://phab.enlightenment.org/T2728
-	select BR2_PACKAGE_LUAJIT # Lua support broken with 5.2+
+	select BR2_PACKAGE_LUAJIT # Lua support broken
 	select BR2_PACKAGE_UTIL_LINUX
 	# libblkid is part of required tools, see EFL's README.
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 6673bb5..5c09898 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.15.3.tar.xz.sha256
-sha256	3bac40e6294288034bd7f8902088bf1169cf376f6fd25b7a49854ab561630642	efl-1.15.3.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.17.1.tar.xz.sha256
+sha256	1a4355a7e981469afa7c87a9772b94640610b1e5947b7ec085859dc7375ca834	efl-1.17.1.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 916999d..4ba1672 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.15.3
+EFL_VERSION = 1.17.1
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
@@ -23,7 +23,7 @@ EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
 	jpeg luajit udev util-linux zlib
 
 # Regenerate the autotools:
-#  - to fix an issue in eldbus-codegen: https://phab.enlightenment.org/T2718
+#  - to fix an issue with GL_SHADERS_GEN: https://phab.enlightenment.org/D3711
 EFL_AUTORECONF = YES
 EFL_GETTEXTIZE = YES
 
@@ -47,7 +47,7 @@ EFL_CONF_OPTS = \
 
 # Disable untested configuration warning.
 ifeq ($(BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG),)
-EFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
+EFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-abb
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
@@ -273,6 +273,6 @@ HOST_EFL_CONF_OPTS += \
 	--with-glib=yes \
 	--with-opengl=none \
 	--with-x11=none \
-	--enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
+	--enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-abb
 
 $(eval $(host-autotools-package))
-- 
2.5.5
