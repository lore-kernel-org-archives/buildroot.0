From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun, 21 Jun 2020 15:10:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/irrlicht: fix libraries linking
Message-ID: <20200621131038.1031282-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
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
 .../0003-makefile-override-LDFLAGS.patch      | 29 +++++++++++++++++++
 package/irrlicht/irrlicht.mk                  |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 package/irrlicht/0003-makefile-override-LDFLAGS.patch

diff --git a/package/irrlicht/0003-makefile-override-LDFLAGS.patch b/package/irrlicht/0003-makefile-override-LDFLAGS.patch
new file mode 100644
index 0000000000..16c38d5baa
--- /dev/null
+++ b/package/irrlicht/0003-makefile-override-LDFLAGS.patch
@@ -0,0 +1,29 @@
+From f597ac417f0eefab8f388afe617a0d07d08d87bb Mon Sep 17 00:00:00 2001
+From: Bartosz Bilas <b.bilas@grinn-global.com>
+Date: Sun, 21 Jun 2020 12:57:47 +0200
+Subject: [PATCH] makefile: override LDFLAGS
+
+That's needed to fix proper linking to X11 libraries
+within package makefile.
+
+Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
+---
+ source/Irrlicht/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source/Irrlicht/Makefile b/source/Irrlicht/Makefile
+index 9a1bdbc..85eb264 100644
+--- a/source/Irrlicht/Makefile
++++ b/source/Irrlicht/Makefile
+@@ -88,7 +88,7 @@ STATIC_LIB = libIrrlicht.a
+ LIB_PATH = ../../lib/$(SYSTEM)
+ INSTALL_DIR = /usr/local/lib
+ sharedlib install: SHARED_LIB = libIrrlicht.so
+-sharedlib: LDFLAGS += -L/usr/X11R6/lib$(LIBSELECT) -lGL -lXxf86vm
++sharedlib: override LDFLAGS += -L/usr/X11R6/lib$(LIBSELECT) -lGL -lXxf86vm
+ staticlib sharedlib: CXXINCS += -I/usr/X11R6/include
+ 
+ #OSX specific options
+-- 
+2.27.0
+
diff --git a/package/irrlicht/irrlicht.mk b/package/irrlicht/irrlicht.mk
index bd82815cde..e12d802ee7 100644
--- a/package/irrlicht/irrlicht.mk
+++ b/package/irrlicht/irrlicht.mk
@@ -38,12 +38,14 @@ ifeq ($(BR2_STATIC_LIBS),)
 IRRLICHT_CONF_OPTS += sharedlib
 endif
 
+# set correct path for libraries linking
+IRRLICHT_CONF_OPTS += LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib"
 # Irrlicht fail to detect properly the NEON support on aarch64 or ARM with NEON FPU support.
 # While linking an application with libIrrlicht.so, we get an undefined reference to
 # png_init_filter_functions_neon.
 # Some files are missing in the libpng bundled in Irrlicht, in particular arm/arm_init.c,
 # so disable NEON support completely.
-IRRLICHT_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DPNG_ARM_NEON_OPT=0"
+IRRLICHT_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DPNG_ARM_NEON_OPT=0 -I$(STAGING_DIR)/usr/include/X11"
 
 define IRRLICHT_BUILD_CMDS
 	$(TARGET_MAKE_ENV)
-- 
2.27.0
