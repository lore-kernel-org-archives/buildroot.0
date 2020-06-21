From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun, 21 Jun 2020 15:10:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/irrlicht: add patch to fix linking
 warning
In-Reply-To: <20200621131038.1031282-1-b.bilas@grinn-global.com>
References: <20200621131038.1031282-1-b.bilas@grinn-global.com>
Message-ID: <20200621131038.1031282-2-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

irrlicht uses the old path to X11R6 that's not available in Buildroot
in addition causes warning: library search path "/usr/X11R6/lib"
is unsafe for cross-compilation.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 ...obsolete-X11R6-lib-include-directori.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/irrlicht/0004-makefile-remove-obsolete-X11R6-lib-include-directori.patch

diff --git a/package/irrlicht/0004-makefile-remove-obsolete-X11R6-lib-include-directori.patch b/package/irrlicht/0004-makefile-remove-obsolete-X11R6-lib-include-directori.patch
new file mode 100644
index 0000000000..e2d3d4be77
--- /dev/null
+++ b/package/irrlicht/0004-makefile-remove-obsolete-X11R6-lib-include-directori.patch
@@ -0,0 +1,32 @@
+From 60c23c894ddf219b25b3437284c9a572f128b0fe Mon Sep 17 00:00:00 2001
+From: Bartosz Bilas <b.bilas@grinn-global.com>
+Date: Sun, 21 Jun 2020 14:34:50 +0200
+Subject: [PATCH] makefile: remove obsolete X11R6 lib/include directories
+
+Remove this obsolete path that's not used in buildroot and causes
+the following warning:
+
+/home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: warning: library search path "/usr/X11R6/lib" is unsafe for cross-compilation
+
+Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
+---
+ source/Irrlicht/Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/source/Irrlicht/Makefile b/source/Irrlicht/Makefile
+index fed6c7e..b323237 100644
+--- a/source/Irrlicht/Makefile
++++ b/source/Irrlicht/Makefile
+@@ -88,8 +88,7 @@ STATIC_LIB = libIrrlicht.a
+ LIB_PATH = ../../lib/$(SYSTEM)
+ INSTALL_DIR = /usr/local/lib
+ sharedlib install: SHARED_LIB = libIrrlicht.so
+-sharedlib: override LDFLAGS += -L/usr/X11R6/lib$(LIBSELECT) -lGL -lXxf86vm
+-staticlib sharedlib: CXXINCS += -I/usr/X11R6/include
++sharedlib: override LDFLAGS += -lGL -lXxf86vm
+ 
+ #OSX specific options
+ staticlib_osx sharedlib_osx install_osx: SYSTEM = MacOSX
+-- 
+2.27.0
+
-- 
2.27.0
