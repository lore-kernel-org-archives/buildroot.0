From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 24 Oct 2015 23:00:55 +0200
Subject: [Buildroot] [PATCH v5 15/36] package/efl/libefl: add
	OpenGL/OpenGLES support
In-Reply-To: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445720476-21517-16-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow to enable graphic acceleration using OpenGL or
OpenGLES with efl libraries.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: rename libefl
    improve commit log
---
 package/efl/libefl/Config.in | 26 ++++++++++++++++++++++++++
 package/efl/libefl/libefl.mk | 17 +++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index 8356fa1..a3b6f0e 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -81,6 +81,32 @@ comment "for libecore XCB support disable recommended configurations"
 
 endchoice
 
+if BR2_PACKAGE_LIBEFL_X_XLIB
+
+choice
+	prompt "select libevas OpenGL support"
+
+config BR2_PACKAGE_LIBEFL_X_XLIB_GLX_FULL
+	bool "libevas OpenGL full support"
+	depends on BR2_PACKAGE_HAS_LIBGL
+
+comment "libevas OpenGLES support needs libgl"
+	depends on !BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_LIBEFL_X_XLIB_GLX_ES
+	bool "libevas OpenGLES support"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+
+comment "libevas OpenGLES support needs libgles"
+	depends on !BR2_PACKAGE_HAS_LIBGLES
+
+config BR2_PACKAGE_LIBEFL_X_XLIB_GLX_NONE
+	bool "libevas disable OpenGL support"
+
+endchoice
+
+endif # BR2_PACKAGE_LIBEFL_X_XLIB
+
 endif # BR2_PACKAGE_LIBEFL_X
 
 comment "libevas loaders"
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index 6a1a8ae..e275699 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -176,8 +176,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBEFL_X),y)
 LIBEFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	--with-opengl=none
+	--x-libraries=$(STAGING_DIR)/usr/lib
 
 LIBEFL_DEPENDENCIES += \
 	xlib_libX11 \
@@ -187,6 +186,20 @@ LIBEFL_CONF_OPTS += --with-x=no \
 	--with-x11=none
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB_GLX_FULL),y)
+LIBEFL_CONF_OPTS += --with-opengl=full
+LIBEFL_DEPENDENCIES += libgl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB_GLX_ES),y)
+LIBEFL_CONF_OPTS += --with-opengl=es
+LIBEFL_DEPENDENCIES += libgles
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB_GLX_NONE),y)
+LIBEFL_CONF_OPTS += --with-opengl=none
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB),y)
 LIBEFL_DEPENDENCIES += \
 	xlib_libX11 \
-- 
2.4.3
