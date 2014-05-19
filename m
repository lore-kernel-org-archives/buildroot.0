From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 19 May 2014 20:49:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkit: Fix OpenGL-related
	dependencies
Message-ID: <1400525369-32257-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes
http://autobuild.buildroot.net/results/27a/27a674c6a19a729fae5cc33de0360b2a061930c1/

This patch indeed fixes two problems based on the autobuilder-defconfig used.

1) Add missing dependencies when opengl is detected by webkit to satisfy autobuilder:

checking which GPU acceleration backend to use... opengl
checking for XCOMPOSITE... yes
checking for XDAMAGE... no
configure: error: Package requirements (xdamage) were not met:

2) ... but opengl should not have been detected with the used defconfig:
$ grep MESA .config
BR2_PACKAGE_MESA3D=y

which will lead to a link error although webkit configure found all dependencies:

/home/br2/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/4.7.3/../../../../mips-linux-gnu/bin/ld: cannot find -lGL

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/webkit/webkit.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 21b535f..c693de7 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -48,4 +48,11 @@ WEBKIT_CONF_OPT += \
 WEBKIT_CONF_OPT += --with-target=x11
 WEBKIT_DEPENDENCIES += xlib_libXt
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+WEBKIT_CONF_OPT += --with-acceleration-backend=opengl
+WEBKIT_DEPENDENCIES += xlib_libXcomposite xlib_libXdamage
+else
+WEBKIT_CONF_OPT += --with-acceleration-backend=none
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
