From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 24 Oct 2015 23:00:58 +0200
Subject: [Buildroot] [PATCH v5 18/36] package/efl/libefl: add sdl2 support
In-Reply-To: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445720476-21517-19-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SDL support can't be used with OpenGLES.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v5: new patch added since sdl2 package is new available
---
 package/efl/libefl/Config.in |  7 +++++++
 package/efl/libefl/libefl.mk | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index a3b6f0e..44860a2 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -42,6 +42,12 @@ comment "libecore video support"
 config BR2_PACKAGE_LIBEFL_FB
 	bool "libecore framebuffer support"
 
+config BR2_PACKAGE_LIBEFL_SDL2
+	bool "libevas SDL2 support"
+	# SDL support is not available with OpenGLES.
+	depends on !BR2_PACKAGE_LIBEFL_X_XLIB_GLX_ES
+	select BR2_PACKAGE_SDL2
+
 config BR2_PACKAGE_LIBEFL_X
 	bool "libecore X support"
 	depends on BR2_PACKAGE_XORG7
@@ -89,6 +95,7 @@ choice
 config BR2_PACKAGE_LIBEFL_X_XLIB_GLX_FULL
 	bool "libevas OpenGL full support"
 	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_LIBEFL_SDL2 # evas depends on libglu header in evas_engine.c
 
 comment "libevas OpenGLES support needs libgl"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index c26c9c5..8ddca64 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -180,6 +180,17 @@ else
 LIBEFL_CONF_OPTS += --enable-fb=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEFL_SDL2),y)
+LIBEFL_CONF_OPTS += --enable-sdl=yes
+LIBEFL_DEPENDENCIES += sdl2
+else
+LIBEFL_CONF_OPTS += --enable-sdl=no
+endif
+
+ifeq ($(BR2_PACKAGE_EFL_X_XLIB_GLX_FULL)$(BR2_PACKAGE_EFL_SDL2),yy)
+EFL_DEPENDENCIES += libglu
+endif
+
 # --enable-xinput22 is recommended
 ifeq ($(BR2_PACKAGE_LIBEFL_X),y)
 LIBEFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
-- 
2.4.3
