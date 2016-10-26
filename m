From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 22:36:41 +0200
Subject: [Buildroot] [git commit] package/xdriver_xf86-input-mouse: fix
	install paths
Message-ID: <20161026203713.738197FD9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3065189a0a64cd3382a67115b2119d773e02e697
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Get rid of the borked sdkdir variable.

Fixes (partially):
    https://bugs.busybox.net/show_bug.cgi?id=8696

Reported-by: buildroot at netsolux.ch
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot at netsolux.ch
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-build-get-rid-of-sdkdir.patch             | 81 ++++++++++++++++++++++
 .../xdriver_xf86-input-mouse.mk                    |  1 +
 2 files changed, 82 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch b/package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch
new file mode 100644
index 0000000..d5f97f9
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch
@@ -0,0 +1,81 @@
+From aef3d9bca4d77db833f71d50b1c84b16c69d7deb Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 23 Oct 2016 22:53:21 +0200
+Subject: [PATCH] build: get rid of sdkdir
+
+Use of sdkdir causes problems during cross-compilation, where the full
+path is then appended to the DESTDIR, leading to host paths being
+appended in the target:
+    https://bugs.busybox.net/show_bug.cgi?id=8696
+
+Other drivers (e.g. keyboard) got rid of sdkdir. Do the same.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ Makefile.am         |  3 ---
+ configure.ac        | 10 ----------
+ include/Makefile.am |  4 +++-
+ xorg-mouse.pc.in    |  3 +--
+ 4 files changed, 4 insertions(+), 16 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 7142485..efe66cb 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -34,9 +34,6 @@ ChangeLog:
+ 
+ dist-hook: ChangeLog INSTALL
+ 
+-# Provide an sdk location that is writable by this module
+-DISTCHECK_CONFIGURE_FLAGS = --with-sdkdir='$${includedir}/xorg'
+-
+ if LINT
+ # Check source code with tools like lint & sparse
+ lint:
+diff --git a/configure.ac b/configure.ac
+index 15d9047..515681d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -60,16 +60,6 @@ AC_ARG_WITH(xorg-module-dir,
+ inputdir=${moduledir}/input
+ AC_SUBST(inputdir)
+ 
+-# X Server SDK location is required to install xf86-mouse-properties.h
+-# This location is also relayed in the xorg-mouse.pc file
+-sdkdir=`$PKG_CONFIG --variable=sdkdir xorg-server`
+-
+-# Workaround overriding sdkdir to be able to create a tarball when user has no
+-# write permission in sdkdir. See DISTCHECK_CONFIGURE_FLAGS in Makefile.am
+-AC_ARG_WITH([sdkdir], [], [sdkdir="$withval"])
+-AC_SUBST([sdkdir])
+-
+-
+ # Work out which OS mouse driver we need to build
+ case $host_os in
+   linux*)
+diff --git a/include/Makefile.am b/include/Makefile.am
+index 27ce0fb..2b85e4e 100644
+--- a/include/Makefile.am
++++ b/include/Makefile.am
+@@ -1 +1,3 @@
+-sdk_HEADERS = xf86-mouse-properties.h
++# Location formerly known as 'sdkdir'
++xorgincludedir = $(includedir)/xorg
++xorginclude_HEADERS = xf86-mouse-properties.h
+diff --git a/xorg-mouse.pc.in b/xorg-mouse.pc.in
+index 57df596..8355e61 100644
+--- a/xorg-mouse.pc.in
++++ b/xorg-mouse.pc.in
+@@ -1,6 +1,7 @@ prefix=@prefix@
+-sdkdir=@sdkdir@
++prefix=@prefix@
++includedir=@includedir@
+ 
+ Name: xorg-mouse
+ Description: X.Org mouse input driver for non-evdev OS'es
+ Version: @PACKAGE_VERSION@
+-Cflags: -I${sdkdir}
++Cflags: -I${includedir}/xorg
+-- 
+2.7.4
+
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 0e19467..e1bd81a 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -10,5 +10,6 @@ XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_INPUT_MOUSE_LICENSE = MIT
 XDRIVER_XF86_INPUT_MOUSE_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+XDRIVER_XF86_INPUT_MOUSE_AUTORECONF = YES
 
 $(eval $(autotools-package))
