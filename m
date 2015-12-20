From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Dec 2015 01:04:19 +0100
Subject: [Buildroot] [PATCH] package/v4l2grab: add missing -lrt
Message-ID: <1450569859-11738-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v4l2grab uses clock_gettime which is provided by -lrt, so we must check
and link with it. Add a patch for that.

Also, silence autoreconf when outside a git tree.

Patches sent upstream:
    https://github.com/twam/v4l2grab/pull/9

Fixes:
    http://autobuild.buildroot.org/results/9df/9df2c09963b97524621f8323b279b8a1672d4b6c/
    http://autobuild.buildroot.org/results/448/4484bda010442033d0536a95f45370701c071f92/
    http://autobuild.buildroot.org/results/b1c/b1ca0c984ec51518a4090039a86a1814582c3c2b/
    http://autobuild.buildroot.org/results/bef/befbfb29c33621272c5b3fcfed070bcdd5cb6e69/
    http://autobuild.buildroot.org/results/e2a/e2ab1698f18aecc3dac5dfcb947c157b784bc411/
    http://autobuild.buildroot.org/results/25b/25b8ad5280f89b3e7d807104e43dbe2ed2c99b40/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Volkov Viacheslav <sv99@inbox.ru>
---
 ...ilence-AC_INIT-when-building-outside-a-gi.patch | 49 ++++++++++++++++++++++
 ...heck-for-clock_gettime-and-the-providing-.patch | 39 +++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 package/v4l2grab/0001-configure-silence-AC_INIT-when-building-outside-a-gi.patch
 create mode 100644 package/v4l2grab/0002-configure-check-for-clock_gettime-and-the-providing-.patch

diff --git a/package/v4l2grab/0001-configure-silence-AC_INIT-when-building-outside-a-gi.patch b/package/v4l2grab/0001-configure-silence-AC_INIT-when-building-outside-a-gi.patch
new file mode 100644
index 0000000..944e905
--- /dev/null
+++ b/package/v4l2grab/0001-configure-silence-AC_INIT-when-building-outside-a-gi.patch
@@ -0,0 +1,49 @@
+From bf58805ecfd8276c144ef476f2fb09d81359d62d Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 20 Dec 2015 00:44:18 +0100
+Subject: [PATCH 1/2] configure: silence AC_INIT when building outside a git
+ tree
+
+When autoreconfiguring outside a git tree, there are lots of spurious
+git fatal errors because there is no git tree to work on to retrieve the
+version information:
+
+    fatal: Not a git repository (or any parent up to mount point /home/ymorin/dev)
+    Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
+
+Or, with an older git version:
+    http://autobuild.buildroot.org/results/9df/9df2c09963b97524621f8323b279b8a1672d4b6c/build-end.log
+
+This is rather discouraging for the unsuspecting user, and even seasoned
+developpers would have to look twice before they can conclude that's not
+an actual error.
+
+Since the version srring is not strictly required for autoconf to work
+properly, just consign git's sdterr to oblivion.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+In the Buildroot project, we grab (Aha!) the v4l2grab sources directly
+from a tarball generated on the fly by Github, we don't clone the
+repository. Thus we have this nasty message, like so:
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9d2e616..9e79192 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,7 +1,7 @@
+ #                                               -*- Autoconf -*-
+ # Process this file with autoconf to produce a configure script.
+ 
+-AC_INIT([v4l2grab], [m4_esyscmd_s([git describe --always --tag --dirty])], [Tobias_Mueller at twam.info])
++AC_INIT([v4l2grab], [m4_esyscmd_s([git describe --always --tag --dirty 2>/dev/null])], [Tobias_Mueller at twam.info])
+ 
+ # prepare for automake
+ AM_INIT_AUTOMAKE
+-- 
+1.9.1
+
diff --git a/package/v4l2grab/0002-configure-check-for-clock_gettime-and-the-providing-.patch b/package/v4l2grab/0002-configure-check-for-clock_gettime-and-the-providing-.patch
new file mode 100644
index 0000000..0b3daed
--- /dev/null
+++ b/package/v4l2grab/0002-configure-check-for-clock_gettime-and-the-providing-.patch
@@ -0,0 +1,39 @@
+From 68697adeefd73e28ac3c8cfd86d244a6c496807f Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 20 Dec 2015 00:50:55 +0100
+Subject: [PATCH 2/2] configure: check for clock_gettime and the providing
+ library
+
+clock_gettime is provided by -lrt so we must check for it.
+
+Fixes build issues like observed in Buildroot;
+    http://autobuild.buildroot.org/results/9df/9df2c09963b97524621f8323b279b8a1672d4b6c/build-end.log
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 9e79192..3de9551 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -16,6 +16,8 @@ AC_PROG_CC
+ # Checks for libraries.
+ AC_CHECK_LIB([jpeg], [jpeg_start_compress])
+ AC_CHECK_LIB([v4l2], [v4l2_open])
++AC_SEARCH_LIBS([clock_gettime],[rt],,
++               [AC_MSG_ERROR([no library contains clock_gettime])])
+ 
+ # Checks for header files.
+ AC_CHECK_HEADERS([fcntl.h malloc.h stdlib.h string.h sys/ioctl.h sys/time.h unistd.h])
+@@ -26,5 +28,6 @@ AC_TYPE_SIZE_T
+ # Checks for library functions.
+ AC_FUNC_MALLOC
+ AC_CHECK_FUNCS([getpagesize select strerror])
++AC_CHECK_FUNCS([clock_gettime])
+ 
+ AC_OUTPUT
+-- 
+1.9.1
+
-- 
1.9.1
