From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Oct 2013 00:07:49 +0200
Subject: [Buildroot] [git commit] package/weston: fix configure.ac to check
	for wayland-scanner
Message-ID: <20131011082158.C31A19B9C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af28f7901ea2a80435714e98fb750b4c03570c96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure whines while checking for wayland-scanner.

wayland-scanner is used to generate the protocol parser C files from
the protocol definition XML files.

weston has a hard-dependency on wayland-scanner, so it can regenerate
its shell/mouse/keyboard/... "handlers".

Since we're using a tarball, those protocol files are already generated
and up-to-date, but the check is hard-coded and unconditional. If
wayland-scanner is missing, configure fails.

We could well patch away this check, but we'd have to carry and maintain
it probably for ever.

Better to fix it: add a patch from upstream weston to fix configure
whining.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...02-fix-configure.ac-check-wayland-scanner.patch |   26 ++++++++++++++++++++
 package/weston/weston.mk                           |    4 +++
 2 files changed, 30 insertions(+), 0 deletions(-)

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
index 4b99dce..6b4dece 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -12,6 +12,10 @@ WESTON_LICENSE_FILES = COPYING
 
 WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
 	jpeg mtdev udev cairo
+
+# We touch configure.ac with one of our patches
+WESTON_AUTORECONF = YES
+
 WESTON_CONF_OPT = \
 	--disable-egl \
 	--disable-simple-egl-clients \
