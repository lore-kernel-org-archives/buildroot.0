From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 09:28:03 +0200
Subject: [Buildroot] [PATCH] xserver_xorg-server: add upstream patches to
	fix build issue
Message-ID: <1343114883-32445-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following build issue with gcc 4.6:

  LINK  Xfbdev
.../host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.1/../../../../arm-none-linux-gnueabi/bin/ld: ../../../os/.libs/libos.a(backtrace.o): undefined reference to symbol 'dladdr@@GLIBC_2.4'
.../host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.1/../../../../arm-none-linux-gnueabi/bin/ld: note: 'dladdr@@GLIBC_2.4' is defined in DSO .../host/usr/arm-unknown-linux-gnueabi/sysroot/lib/libdl.so.2 so try adding it to the linker command line
.../host/usr/arm-unknown-linux-gnueabi/sysroot/lib/libdl.so.2: could not read symbols: Invalid operation

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...server-01-add-dlopen-libs-flags-to-kdrive.patch |   25 ++++++
 ...server-02-supply-dl-code-with-dlopen-libs.patch |   87 ++++++++++++++++++++
 .../xserver_xorg-server/xserver_xorg-server.mk     |    1 +
 3 files changed, 113 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-01-add-dlopen-libs-flags-to-kdrive.patch
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-02-supply-dl-code-with-dlopen-libs.patch

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-01-add-dlopen-libs-flags-to-kdrive.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-01-add-dlopen-libs-flags-to-kdrive.patch
new file mode 100644
index 0000000..53304be
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-01-add-dlopen-libs-flags-to-kdrive.patch
@@ -0,0 +1,25 @@
+From 8613e4b0eb04150b1e377871f02b164be5d001e9 Mon Sep 17 00:00:00 2001
+From: Mikhail Gusarov <dottedmag@dottedmag.net>
+Date: Wed, 28 Oct 2009 18:44:27 +0000
+Subject: Add missing DLOPEN_LIBS to kdrive compilation flags
+
+Xfbdev failed to build due to dladdr being used by xorg_backtrace.
+Explicitly add DLOPEN_LIBS to KDRIVE_LIBS as there does not
+seem to be a better place for it.
+
+Signed-off-by: Mikhail Gusarov <dottedmag@dottedmag.net>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+---
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -1982,7 +1982,7 @@
+     KDRIVE_LOCAL_LIBS="$MAIN_LIB $DIX_LIB $KDRIVE_LIB $KDRIVE_STUB_LIB $CONFIG_LIB"
+     KDRIVE_LOCAL_LIBS="$KDRIVE_LOCAL_LIBS $FB_LIB $MI_LIB $KDRIVE_PURE_LIBS"
+     KDRIVE_LOCAL_LIBS="$KDRIVE_LOCAL_LIBS $KDRIVE_OS_LIB $OS_LIB"
+-    KDRIVE_LIBS="$TSLIB_LIBS $KDRIVE_LOCAL_LIBS $XSERVER_SYS_LIBS $GLX_SYS_LIBS"
++    KDRIVE_LIBS="$TSLIB_LIBS $KDRIVE_LOCAL_LIBS $XSERVER_SYS_LIBS $GLX_SYS_LIBS $DLOPEN_LIBS"
+ 
+     AC_SUBST([XEPHYR_LIBS])
+     AC_SUBST([XEPHYR_INCS])
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-02-supply-dl-code-with-dlopen-libs.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-02-supply-dl-code-with-dlopen-libs.patch
new file mode 100644
index 0000000..63d723b
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-02-supply-dl-code-with-dlopen-libs.patch
@@ -0,0 +1,87 @@
+From d30637339963950910e5f5fb755b8465ac7dddb4 Mon Sep 17 00:00:00 2001
+From: Mikhail Gusarov <dottedmag@dottedmag.net>
+Date: Thu, 29 Oct 2009 18:46:22 +0000
+Subject: Supply all code using dl*() with DLOPEN_LIBS
+
+Previously DLOPEN_LIBS was managed in top-level configure.ac.
+Instead bundle it with the code using dl*() functions to
+avoid breakages in uncommon configurations.
+
+Signed-off-by: Mikhail Gusarov <dottedmag@dottedmag.net>
+Reviewed-by: Dan Nicholson <dbn.lists@gmail.com>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+---
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -196,6 +196,7 @@
+ dnl has it in libc), or if libdl is needed to get it.
+ AC_CHECK_FUNC([dlopen], [],
+ 	AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
++AC_SUBST(DLOPEN_LIBS)
+ 
+ dnl Checks for library functions.
+ AC_FUNC_VPRINTF
+@@ -927,7 +928,7 @@
+ 	AC_SUBST(XLIB_CFLAGS)
+ 	AC_DEFINE(GLXEXT, 1, [Build GLX extension])
+ 	GLX_LIBS='$(top_builddir)/glx/libglx.la'
+-	GLX_SYS_LIBS="$GLX_SYS_LIBS $DLOPEN_LIBS"
++	GLX_SYS_LIBS="$GLX_SYS_LIBS"
+ else
+         GLX=no
+ fi
+@@ -1483,7 +1484,7 @@
+ 	AC_CHECK_FUNCS([pci_device_vgaarb_init])
+ 	LIBS=$SAVE_LIBS
+ 	CFLAGS=$SAVE_CFLAGS
+-	XORG_SYS_LIBS="$XORG_SYS_LIBS $PCIACCESS_LIBS $DLOPEN_LIBS $GLX_SYS_LIBS $SELINUX_LIB"
++	XORG_SYS_LIBS="$XORG_SYS_LIBS $PCIACCESS_LIBS $GLX_SYS_LIBS $SELINUX_LIB"
+ 	XORG_CFLAGS="$XORG_CFLAGS $PCIACCESS_CFLAGS"
+ 
+ 	case $host_os in
+Index: b/glx/Makefile.am
+===================================================================
+--- a/glx/Makefile.am
++++ b/glx/Makefile.am
+@@ -58,6 +58,8 @@
+ libglxdri_la_SOURCES += glxdri2.c
+ endif
+ 
++libglxdri_la_LIBADD = $(DLOPEN_LIBS)
++
+ libglx_la_SOURCES = \
+ 	$(indirect_sources) \
+ 	$(glapi_sources) \
+@@ -95,3 +97,5 @@
+         swap_interval.c \
+         unpack.h \
+         xfont.c
++
++libglx_la_LIBADD = $(DLOPEN_LIBS)
+Index: b/hw/xfree86/loader/Makefile.am
+===================================================================
+--- a/hw/xfree86/loader/Makefile.am
++++ b/hw/xfree86/loader/Makefile.am
+@@ -21,6 +21,7 @@
+         dlloader.c \
+ 	os.c \
+ 	sdksyms.c
++libloader_la_LIBADD = $(DLOPEN_LIBS)
+ 
+ CLEANFILES = sdksyms.c sdksyms.dep
+ 
+Index: b/os/Makefile.am
+===================================================================
+--- a/os/Makefile.am
++++ b/os/Makefile.am
+@@ -26,6 +26,8 @@
+ 	xprintf.c	\
+ 	$(XORG_SRCS)
+ 
++libos_la_LIBADD = $(DLOPEN_LIBS)
++
+ if SECURE_RPC
+ libos_la_SOURCES += $(SECURERPC_SRCS)
+ endif
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index f221632..5913f79 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -10,6 +10,7 @@ XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserv
 XSERVER_XORG_SERVER_MAKE = $(MAKE1) # make install fails with parallel make
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
+XSERVER_XORG_SERVER_AUTORECONF = YES
 
 XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xutil_util-macros 		\
-- 
1.7.9.5
