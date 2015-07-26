From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:29 +0200
Subject: [Buildroot] [RFC 19/37] package/efl: add OpenGL/OpenGLES support
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-20-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/Config.in | 26 ++++++++++++++++++++++++++
 package/efl/efl.mk    | 17 +++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 99e7c07..95fdc3c 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -81,6 +81,32 @@ comment "for libecore XCB support disable recommanded configurations"
 
 endchoice
 
+if BR2_PACKAGE_EFL_X_XLIB
+
+choice
+	prompt "select libevas OpenGL support"
+
+config BR2_PACKAGE_EFL_X_XLIB_GLX_FULL
+	bool "libevas OpenGL full support"
+	depends on BR2_PACKAGE_HAS_LIBGL
+
+comment "libevas OpenGLES support needs libgl"
+	depends on !BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_EFL_X_XLIB_GLX_ES
+	bool "libevas OpenGLES support"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+
+comment "libevas OpenGLES support needs libgles"
+	depends on !BR2_PACKAGE_HAS_LIBGLES
+
+config BR2_PACKAGE_EFL_X_XLIB_GLX_NONE
+	bool "libevas disable OpenGL support"
+
+endchoice
+
+endif # BR2_PACKAGE_EFL_X_XLIB
+
 endif # BR2_PACKAGE_EFL_X
 
 comment "libevas loaders"
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index f283108..a8e3b84 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -167,8 +167,7 @@ endif
 ifeq ($(BR2_PACKAGE_EFL_X),y)
 EFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	--with-opengl=none
+	--x-libraries=$(STAGING_DIR)/usr/lib
 
 EFL_DEPENDENCIES += \
 	xlib_libX11 \
@@ -178,6 +177,20 @@ EFL_CONF_OPTS += --with-x=no \
 	--with-x11=none
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_X_XLIB_GLX_FULL),y)
+EFL_CONF_OPTS += --with-opengl=full
+EFL_DEPENDENCIES += libgl
+endif
+
+ifeq ($(BR2_PACKAGE_EFL_X_XLIB_GLX_ES),y)
+EFL_CONF_OPTS += --with-opengl=es
+EFL_DEPENDENCIES += libgles
+endif
+
+ifeq ($(BR2_PACKAGE_EFL_X_XLIB_GLX_NONE),y)
+EFL_CONF_OPTS += --with-opengl=none
+endif
+
 ifeq ($(BR2_PACKAGE_EFL_X_XLIB),y)
 EFL_DEPENDENCIES += \
 	xlib_libX11 \
-- 
2.4.3
