From: Romain Naour <romain.naour@openwide.fr>
Date: Tue,  8 Sep 2015 23:19:54 +0200
Subject: [Buildroot] [PACH v2 20/38] package/efl: add OpenGL/OpenGLES support
In-Reply-To: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
References: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1441747212-27421-21-git-send-email-romain.naour@openwide.fr>
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
index 47f511f..b8c64ab 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -80,6 +80,32 @@ comment "for libecore XCB support disable recommanded configurations"
 
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
index 07d9eed..39d4cfc 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -172,8 +172,7 @@ endif
 ifeq ($(BR2_PACKAGE_EFL_X),y)
 EFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	--with-opengl=none
+	--x-libraries=$(STAGING_DIR)/usr/lib
 
 EFL_DEPENDENCIES += \
 	xlib_libX11 \
@@ -183,6 +182,20 @@ EFL_CONF_OPTS += --with-x=no \
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
