From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2009 11:55:15 +0200
Subject: [Buildroot] [PATCH 4/4] xorg: add a new cross-compile fix for libXt
	1.0.6
In-Reply-To: <cover.1248774911.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248774911.git.thomas.petazzoni@free-electrons.com>
Message-ID: <90a459ce4d27fc6a2527ae29f0a07f24f0993a02.1248774911.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cross-compile fix included in mainline of libXt between 1.0.5 and
1.0.6 is not sufficient. It allows to pass a different compiler for
the host tools, but still uses the TARGET_CFLAGS/TARGET_LDFLAGS to
compile the host tools, which obviously isn't correct.

The new patch allows to use the CFLAGS_FOR_BUILD/LDFLAGS_FOR_BUILD
variables as the CFLAGS/LDFLAGS to build the host tools.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xlib_libXt-1.0.6-cross-compile-fix.patch       |   28 ++++++++++++++++++++
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    3 +-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 package/x11r7/xlib_libXt/xlib_libXt-1.0.6-cross-compile-fix.patch

diff --git a/package/x11r7/xlib_libXt/xlib_libXt-1.0.6-cross-compile-fix.patch b/package/x11r7/xlib_libXt/xlib_libXt-1.0.6-cross-compile-fix.patch
new file mode 100644
index 0000000..f02edcb
--- /dev/null
+++ b/package/x11r7/xlib_libXt/xlib_libXt-1.0.6-cross-compile-fix.patch
@@ -0,0 +1,28 @@
+diff --git a/configure.ac b/configure.ac
+index 043ab5f..cb00a41 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -48,6 +48,10 @@ if test x"$CC_FOR_BUILD" = x; then
+ 	fi
+ fi
+ AC_SUBST([CC_FOR_BUILD])
++CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
++AC_SUBST(CFLAGS_FOR_BUILD)
++LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
++AC_SUBST(LDFLAGS_FOR_BUILD)
+ 
+ PKG_CHECK_MODULES(XT, sm x11 xproto kbproto)
+ 
+diff --git a/util/Makefile.am b/util/Makefile.am
+index 0d3ff01..37b78d2 100644
+--- a/util/Makefile.am
++++ b/util/Makefile.am
+@@ -5,6 +5,8 @@ noinst_PROGRAMS = makestrs
+ endif
+ 
+ CC = @CC_FOR_BUILD@
++CFLAGS = @CFLAGS_FOR_BUILD@
++LDFLAGS = @LDFLAGS_FOR_BUILD@
+ 
+ EXTRA_DIST = \
+ 	Shell.ht \
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 13e43c1..2fcf889 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -7,7 +7,8 @@
 XLIB_LIBXT_VERSION = 1.0.6
 XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
 XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXT_AUTORECONF = NO
+XLIB_LIBXT_AUTORECONF = YES
+XLIB_LIBXT_LIBTOOL_PATCH = NO
 XLIB_LIBXT_INSTALL_STAGING = YES
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb
 XLIB_LIBXT_CONF_ENV = CC_FOR_BUILD="/usr/bin/gcc -I$(STAGING_DIR)/usr/include"
-- 
1.6.0.4
