From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Oct 2013 00:09:52 +0200
Subject: [Buildroot] [PATCH 06/11] package/weston: fix configure.ac to check
	for wayland-scanner
In-Reply-To: <cover.1381269937.git.yann.morin.1998@free.fr>
References: <cover.1381269937.git.yann.morin.1998@free.fr>
Message-ID: <301b21c6f968c2964560af77536057f6c90ebc95.1381269937.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

configure whines while checking for wayland-scanner.

wayland-scanner is used to generate the protocol parser C files from
the protocol definition XML files.

weston has a hard-dependency on wayland-scanner, so it can regenerate
its shell/mouse/keyboard/... "handlers".

Since we're using a tarball, those protocol files are already generated
and up-to-date, but the check is hard-coded and unconditional. If
wayland-scanner is missing, configure fails.

wayland-scanner is provided by wayland, so we'd have to have a
host-wayland if we want wayland scanner.

We could well patch away this check, but we'd have to carry and maintain
it probably for ever.

Better to fix it, and introduce a host-wayland. Make weston depend on
host-wayland. Add a patch from upstream weston to fix configure whining.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/wayland/wayland.mk                         |  1 +
 ...02-fix-configure.ac-check-wayland-scanner.patch | 26 ++++++++++++++++++++++
 package/weston/weston.mk                           |  8 +++++--
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 package/weston/weston-0002-fix-configure.ac-check-wayland-scanner.patch

diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 0810536..093be90 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -28,3 +28,4 @@ endef
 WAYLAND_POST_CONFIGURE_HOOKS += WAYLAND_BUILD_SCANNER
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/weston/weston-0002-fix-configure.ac-check-wayland-scanner.patch b/package/weston/weston-0002-fix-configure.ac-check-wayland-scanner.patch
new file mode 100644
index 0000000..ca7368f
--- /dev/null
+++ b/package/weston/weston-0002-fix-configure.ac-check-wayland-scanner.patch
@@ -0,0 +1,26 @@
+commit 9f43cb48aac9d27aa49fe955104f5cfd204703ed
+Author: Quentin Glidic <sardemff7+git@sardemff7.net>
+Date:   Sat Aug 24 20:36:10 2013 +0200
+
+    autotools: Fix AC_PATH_PROG call
+    
+    Signed-off-by: Quentin Glidic <sardemff7+git@sardemff7.net>
+    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/configure.ac b/configure.ac
+index 0129157..43e5e5c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -424,8 +424,10 @@ if test "x$have_lcms" = xyes; then
+ fi
+ AM_CONDITIONAL(HAVE_LCMS, [test "x$have_lcms" = xyes])
+ 
+-AC_PATH_PROG([wayland_scanner], [wayland-scanner],
+-	     [AC_MSG_ERROR("wayland-scanner is needed to compile weston")])
++AC_PATH_PROG([wayland_scanner], [wayland-scanner])
++if test x$wayland_scanner = x; then
++	AC_MSG_ERROR([wayland-scanner is needed to compile weston])
++fi
+ 
+ AC_CONFIG_FILES([Makefile
+ 		 shared/Makefile
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 990fb04..8b719b8 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -10,8 +10,12 @@ WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
-WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
-	jpeg mtdev udev cairo
+WESTON_DEPENDENCIES = host-pkgconf host-wayland wayland libxkbcommon pixman \
+	libpng jpeg mtdev udev cairo
+
+# We touch configure.ac with one of our patches
+WESTON_AUTORECONF = YES
+
 WESTON_CONF_OPT = \
 	--disable-egl \
 	--disable-xwayland \
-- 
1.8.1.2
