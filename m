From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Apr 2019 10:48:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/xserver_xorg-server: fix build
 without glx
Message-ID: <20190419084836.21364-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/397f8098c57fc6c88aa12dc8d35ebb1b933d52ef

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nd-Makefile.am-fix-build-without-glx.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/1.20.4/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch

diff --git a/package/x11r7/xserver_xorg-server/1.20.4/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch b/package/x11r7/xserver_xorg-server/1.20.4/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
new file mode 100644
index 0000000000..5f19a26d14
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/1.20.4/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
@@ -0,0 +1,45 @@
+From b1d2a82d644518c1a75775244ac63be738aaf062 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 19 Apr 2019 10:19:50 +0200
+Subject: [PATCH] hw/xwayland/Makefile.am: fix build without glx
+
+Commit d8ec33fe0542141aed1d9016d2ecaf52da944b4b added libglxvnd.la to
+Xwayland_LDFLAGS but GLX can be disabled through --disable-glx.
+In this case, build fails on:
+
+make[3]: *** No rule to make target '../../glx/libglxvnd.la', needed by 'Xwayland'.  Stop.
+make[3]: *** Waiting for unfinished jobs....
+
+Fixes:
+ - http://autobuild.buildroot.org/results/397f8098c57fc6c88aa12dc8d35ebb1b933d52ef
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/xorg/xserver/merge_requests/173]
+---
+ hw/xwayland/Makefile.am | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/hw/xwayland/Makefile.am b/hw/xwayland/Makefile.am
+index bc1cb8506..502879e2a 100644
+--- a/hw/xwayland/Makefile.am
++++ b/hw/xwayland/Makefile.am
+@@ -21,10 +21,14 @@ Xwayland_SOURCES =				\
+ 	$(top_srcdir)/Xi/stubs.c		\
+ 	$(top_srcdir)/mi/miinitext.c
+ 
++if GLX
++GLXVND_LIB = $(top_builddir)/glx/libglxvnd.la
++endif
++
+ Xwayland_LDADD =				\
+ 	$(glamor_lib)				\
+ 	$(XWAYLAND_LIBS)			\
+-	$(top_builddir)/glx/libglxvnd.la	\
++	$(GLXVND_LIB)				\
+ 	$(XWAYLAND_SYS_LIBS)			\
+ 	$(top_builddir)/Xext/libXvidmode.la	\
+ 	$(XSERVER_SYS_LIBS)
+-- 
+2.20.1
+
-- 
2.20.1
