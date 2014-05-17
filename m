From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 18:53:30 +0200
Subject: [Buildroot] [PATCH] xlib_libXpm: fix build on noMMU architectures
Message-ID: <1400345610-11771-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to libXpm to fix build on noMMU architectures.

Fixes:

  http://autobuild.buildroot.org/results/c57/c571b0a9d9f36a445ea36a4bd609154f9a9bddd5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xlib_libXpm/xlib_libXpm-01-fork-check.patch     | 21 +++++++++++++++++++++
 package/x11r7/xlib_libXpm/xlib_libXpm.mk            |  2 ++
 2 files changed, 23 insertions(+)
 create mode 100644 package/x11r7/xlib_libXpm/xlib_libXpm-01-fork-check.patch

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm-01-fork-check.patch b/package/x11r7/xlib_libXpm/xlib_libXpm-01-fork-check.patch
new file mode 100644
index 0000000..fb4fb7d
--- /dev/null
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm-01-fork-check.patch
@@ -0,0 +1,21 @@
+Allow usage when fork() is not available
+
+When fork() is not available, we need to define NO_ZPIPE so that
+libXpm doesn't try to fork/exec to use a pipe to uncompress compressed
+.xpm files. There is obviously a loss of functionality, but loading
+uncompressed .xpm files should continue to work.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,6 +22,7 @@
+ 
+ # Checks for library functions
+ AC_CHECK_FUNCS([strlcat])
++AC_CHECK_FUNC([fork],[], AC_DEFINE(NO_ZPIPE))
+ 
+ # Obtain compiler/linker options for dependencies
+ PKG_CHECK_MODULES(XPM, xproto x11)
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 86f331b..766724f 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -10,6 +10,8 @@ XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
 XLIB_LIBXPM_LICENSE_FILES = COPYING
 XLIB_LIBXPM_INSTALL_STAGING = YES
+# we patch configure.ac
+XLIB_LIBXPM_AUTORECONF = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto \
 	host-gettext
 
-- 
1.9.3
