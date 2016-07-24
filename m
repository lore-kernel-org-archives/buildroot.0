From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 15:03:31 +0200
Subject: [Buildroot] [git commit] package/sdl2_ttf: x-includes and
	x-libraries must be set for cross-compiling
Message-ID: <20160724130410.5713E819C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ccc5b717e2db1df7c1c98071ffc62a8c0aa0c45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If those flags are not explicitly passed, the sdl2_ttf configure script
will include -I/usr/include and -L/usr/lib in the compile flags, which
are obviously unsafe for cross-compilation.

"checking for X... libraries /usr/lib, headers /usr/include"

Fixes:

  http://autobuild.buildroot.net/results/f968fb31e9882cc856296a7c729d93e345e9e861

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - don't pass an argument to --with-x
 - use --without-x instead of --with-x=no]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl2_ttf/sdl2_ttf.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 71c5bc7..6834d16 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -14,4 +14,17 @@ SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
 SDL2_TTF_CONF_ENV = \
 	FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
+# x-includes and x-libraries must be set for cross-compiling
+# By default x_includes and x_libraries contains unsafe paths.
+# (/usr/include and /usr/lib)
+ifeq ($(BR2_PACKAGE_SDL2_X11),y)
+SDL2_TTF_CONF_OPTS += \
+	--with-x \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+else
+SDL2_TTF_CONF_OPTS += \
+	--without-x
+endif
+
 $(eval $(autotools-package))
