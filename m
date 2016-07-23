From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Jul 2016 12:19:42 +0200
Subject: [Buildroot] [PATCH] package/sdl2_ttf: x-includes and x-libraries
	must be set for cross-compiling
Message-ID: <1469269182-16000-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If those flags are not explicitly passed, the sdl2_ttf configure script
will include -I/usr/include and -L/usr/lib in the compile flags, which
are obviously unsafe for cross-compilation.

"checking for X... libraries /usr/lib, headers /usr/include"

Fixes:
http://autobuild.buildroot.net/results/f96/f968fb31e9882cc856296a7c729d93e345e9e861

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/sdl2_ttf/sdl2_ttf.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 71c5bc7..e1674a1 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -14,4 +14,15 @@ SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
 SDL2_TTF_CONF_ENV = \
 	FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
+# x-includes and x-libraries must be set for cross-compiling
+# By default x_includes and x_libraries contains unsafe paths.
+# (/usr/include and /usr/lib)
+ifeq ($(BR2_PACKAGE_SDL2_X11),y)
+SDL2_TTF_CONF_OPTS += --with-x=$(STAGING_DIR) \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+else
+SDL2_TTF_CONF_OPTS += --with-x=no
+endif
+
 $(eval $(autotools-package))
-- 
2.5.5
