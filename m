From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 12 Dec 2018 08:14:52 +0100
Subject: [Buildroot] [PATCH 1/4] netsurf: add optional dependency freetype
Message-ID: <20181212071455.29215-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../netsurf/0002-fix-freetype-detection.patch | 28 +++++++++++++++++++
 package/netsurf/netsurf.mk                    |  7 +++++
 2 files changed, 35 insertions(+)
 create mode 100644 package/netsurf/0002-fix-freetype-detection.patch

diff --git a/package/netsurf/0002-fix-freetype-detection.patch b/package/netsurf/0002-fix-freetype-detection.patch
new file mode 100644
index 000000000..27c0440e1
--- /dev/null
+++ b/package/netsurf/0002-fix-freetype-detection.patch
@@ -0,0 +1,28 @@
+From 85336f2404b9583267019650ea0112ebf1bb571a Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 28 Nov 2018 17:59:44 +0100
+Subject: [PATCH 2/2] fix freetype detection
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
index 3339b35c9..23e4de637 100644
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
-- 
2.17.1
