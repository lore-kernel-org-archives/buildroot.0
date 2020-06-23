From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Tue, 23 Jun 2020 20:20:08 +0200
Subject: [Buildroot] [PATCH v3] package/irrlicht: add patch to fix libraries
 linking
Message-ID: <20200623182008.312994-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fix the irrlicht makefile which contains the paths
that point to the host system libraries that are not used and
are not available in Buildroot what's unsafe for cross-compilation.
In addition it fixes linking to the X11 libraries and the following errors:

/home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so: undefined reference to `XSetSelectionOwner'
/home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so: undefined reference to `glXGetProcAddress'
/home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so: undefined reference to `glXMakeCurrent'
/home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so: undefined reference to `XF86VidModeSetViewPort'
/home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so: undefined reference to `XF86VidModeSwitchToMode'
/home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so: undefined reference to `glClearDepth'
/home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so: undefined reference to `XGetVisualInfo'
/home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so: undefined reference to `XGrabKeyboard'
/home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so: undefined reference to `glMatrixMode'

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
Changes v2 -> v3:
 - skipped overriding LDFLAGS variable in package makefile
 - skipped including extra $(STAGING_DIR)/usr/include path into CPPFLAGS
 - combined two patches into one

Changes v1 -> v2:
 - patches merged into one
 - explained commit log
 
IMPORTANT NOTE:
 Irrlicht uses CRLF line endings so the patches must be fixed when
 applying because patchwork drops all the CR and keeps on LF.

 ...e-LDFLAGS-and-remove-obsolete-X11R6-.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/irrlicht/0003-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch

diff --git a/package/irrlicht/0003-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch b/package/irrlicht/0003-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch
new file mode 100644
index 0000000000..51b98a4e8a
--- /dev/null
+++ b/package/irrlicht/0003-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch
@@ -0,0 +1,36 @@
+From 0ecb59c4dc575bb902c1955d8762f91ff79290a4 Mon Sep 17 00:00:00 2001
+From: Bartosz Bilas <b.bilas@grinn-global.com>
+Date: Tue, 23 Jun 2020 19:36:27 +0200
+Subject: [PATCH] makefile: override LDFLAGS and remove obsolete X11R6
+ lib/include directories
+
+Add "override" keyword to LDFLAGS variable in order to link libraries
+using buildroot cross-compiler correctly and remove those non-supported
+paths to lib/includes that are not used and not available in buildroot
+and in addition point to the host system libraries in a result
+cause the following warning:
+
+/home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: warning: library search path "/usr/X11R6/lib" is unsafe for cross-compilation
+
+Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
+---
+ source/Irrlicht/Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/source/Irrlicht/Makefile b/source/Irrlicht/Makefile
+index 1a8277e..b323237 100644
+--- a/source/Irrlicht/Makefile
++++ b/source/Irrlicht/Makefile
+@@ -88,8 +88,7 @@ STATIC_LIB = libIrrlicht.a
+ LIB_PATH = ../../lib/$(SYSTEM)
+ INSTALL_DIR = /usr/local/lib
+ sharedlib install: SHARED_LIB = libIrrlicht.so
+-sharedlib: LDFLAGS += -L/usr/X11R6/lib$(LIBSELECT) -lGL -lXxf86vm
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
