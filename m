From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 24 Feb 2014 10:50:03 +0100
Subject: [Buildroot] [PATCH 1/2] infra: improve dependency check in virtual
	packages.
In-Reply-To: <1393235404-2693-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1393235404-2693-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1393235404-2693-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current version of dependency check for virtual package <foo>
defines FOO_CONFIGURE_CMDS to print an error message if the
dependencies are not met.

This patch updates all the virtual packages to use the GNU Make control
function $(error text...) instead.

This makes the error happen at the beginning of the build, with a clearer
message.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/luainterpreter/luainterpreter.mk |    6 ++++++
 package/opengl/libegl/libegl.mk          |    7 +++----
 package/opengl/libgles/libgles.mk        |    7 +++----
 package/opengl/libopenmax/libopenmax.mk  |    7 +++----
 package/opengl/libopenvg/libopenvg.mk    |    7 +++----
 package/powervr/powervr.mk               |    7 +++----
 6 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index c37d621..5443477 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -9,4 +9,10 @@ LUAINTERPRETER_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LUA_INTERPRET
 
 LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
 
+ifeq ($(BR2_PACKAGE_HAS_LUA_INTERPRETER),y)
+ifeq ($(LUAINTERPRETER_DEPENDENCIES),)
+$(error No lua interpreter implementation selected. Configuration error.)
+endif
+endif
+
 $(eval $(generic-package))
diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
index b2b74f1..3311e50 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/libegl/libegl.mk
@@ -7,11 +7,10 @@
 LIBEGL_SOURCE =
 LIBEGL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_EGL))
 
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL),y)
 ifeq ($(LIBEGL_DEPENDENCIES),)
-define LIBEGL_CONFIGURE_CMDS
-	echo "No libEGL implementation selected. Configuration error."
-	exit 1
-endef
+$(error No libEGL implementation selected. Configuration error.)
+endif
 endif
 
 $(eval $(generic-package))
diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
index 0dcbaa7..7a07e37 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -7,11 +7,10 @@
 LIBGLES_SOURCE =
 LIBGLES_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_ES))
 
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_ES),y)
 ifeq ($(LIBGLES_DEPENDENCIES),)
-define LIBGLES_CONFIGURE_CMDS
-	echo "No libGLES implementation selected. Configuration error."
-	exit 1
-endef
+$(error No libGLES implementation selected. Configuration error.)
+endif
 endif
 
 $(eval $(generic-package))
diff --git a/package/opengl/libopenmax/libopenmax.mk b/package/opengl/libopenmax/libopenmax.mk
index c4f1f71..a2bd23d 100644
--- a/package/opengl/libopenmax/libopenmax.mk
+++ b/package/opengl/libopenmax/libopenmax.mk
@@ -7,11 +7,10 @@
 LIBOPENMAX_SOURCE =
 LIBOPENMAX_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENMAX))
 
+ifeq ($(BR2_PACKAGE_HAS_OPENMAX),y)
 ifeq ($(LIBOPENMAX_DEPENDENCIES),)
-define LIBOPENMAX_CONFIGURE_CMDS
-	echo "No libopenmax implementation selected. Configuration error."
-	exit 1
-endef
+$(error No libopenmax implementation selected. Configuration error.)
+endif
 endif
 
 $(eval $(generic-package))
diff --git a/package/opengl/libopenvg/libopenvg.mk b/package/opengl/libopenvg/libopenvg.mk
index ffd9d68..f81db5e 100644
--- a/package/opengl/libopenvg/libopenvg.mk
+++ b/package/opengl/libopenvg/libopenvg.mk
@@ -7,11 +7,10 @@
 LIBOPENVG_SOURCE =
 LIBOPENVG_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENVG))
 
+ifeq ($(BR2_PACKAGE_HAS_OPENVG),y)
 ifeq ($(LIBOPENVG_DEPENDENCIES),)
-define LIBOPENVG_CONFIGURE_CMDS
-	echo "No libOpenVG implementation selected. Configuration error."
-	exit 1
-endef
+$(error No libOpenVG implementation selected. Configuration error.)
+endif
 endif
 
 $(eval $(generic-package))
diff --git a/package/powervr/powervr.mk b/package/powervr/powervr.mk
index 1f43505..b36eb16 100644
--- a/package/powervr/powervr.mk
+++ b/package/powervr/powervr.mk
@@ -7,11 +7,10 @@
 POWERVR_SOURCE =
 POWERVR_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_POWERVR))
 
+ifeq ($(BR2_PACKAGE_HAS_POWERVR),y)
 ifeq ($(POWERVR_DEPENDENCIES),)
-define POWERVR_CONFIGURE_CMDS
-	echo "No PowerVR implementation selected. Configuration error."
-	exit 1
-endef
+$(error No PowerVR implementation selected. Configuration error.)
+endif
 endif
 
 $(eval $(generic-package))
-- 
1.7.9.5
