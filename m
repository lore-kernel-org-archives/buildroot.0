From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 21:32:16 +0100
Subject: [Buildroot] [git commit] package/netsurf: add optional dependency
 on freetype
Message-ID: <20181216204426.AC7938B49B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03bb034d892ced328dd30194b4aa8754b88460e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsurf/0002-fix-freetype-detection.patch | 32 +++++++++++++++++++++++
 package/netsurf/netsurf.mk                        |  7 +++++
 2 files changed, 39 insertions(+)

diff --git a/package/netsurf/0002-fix-freetype-detection.patch b/package/netsurf/0002-fix-freetype-detection.patch
new file mode 100644
index 0000000000..27e3a6a1d5
--- /dev/null
+++ b/package/netsurf/0002-fix-freetype-detection.patch
@@ -0,0 +1,32 @@
+From 85336f2404b9583267019650ea0112ebf1bb571a Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 28 Nov 2018 17:59:44 +0100
+Subject: [PATCH] fix freetype detection
+
+Using freetype-config doesn't work well, because it's going to use the
+system freetype-config instead of the one installed in the
+cross-compilation sysroot. So, let's use pkg-config instead.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ netsurf/frontends/framebuffer/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/netsurf/frontends/framebuffer/Makefile b/netsurf/frontends/framebuffer/Makefile
+index bdedd90..249c7c4 100644
+--- a/netsurf/frontends/framebuffer/Makefile
++++ b/netsurf/frontends/framebuffer/Makefile
+@@ -35,8 +35,8 @@ LDFLAGS += -Wl,--no-whole-archive
+ 
+ # freetype is optional but does not use pkg-config
+ ifeq ($(NETSURF_FB_FONTLIB),freetype)
+-  CFLAGS += -DFB_USE_FREETYPE $(shell freetype-config --cflags)
+-  LDFLAGS += $(shell freetype-config --libs)
++  CFLAGS += -DFB_USE_FREETYPE $(shell $(PKG_CONFIG) --cflags freetype2)
++  LDFLAGS += $(shell $(PKG_CONFIG) --libs freetype2)
+ endif
+ 
+ 
+-- 
+2.17.1
+
diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 3339b35c91..23e4de6377 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -27,6 +27,12 @@ endif
 ifeq ($(BR2_PACKAGE_NETSURF_SDL),y)
 NETSURF_DEPENDENCIES += sdl host-libpng
 NETSURF_FRONTEND = framebuffer
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+NETSURF_DEPENDENCIES += freetype
+define NETSURF_FONTLIB_CONFIGURE_CMDS
+	echo "override NETSURF_FB_FONTLIB := freetype"  >> $(@D)/netsurf/Makefile.config
+endef
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
@@ -41,6 +47,7 @@ define NETSURF_CONFIGURE_CMDS
 	echo "override NETSURF_USE_DUKTAPE := NO"       >  $(@D)/netsurf/Makefile.config
 	$(NETSURF_ICONV_CONFIGURE_CMDS)
 	$(NETSURF_SVG_CONFIGURE_CMDS)
+	$(NETSURF_FONTLIB_CONFIGURE_CMDS)
 endef
 
 NETSURF_MAKE_OPTS = \
