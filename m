From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 11:29:49 +0100
Subject: [Buildroot] [git commit] gst1-plugins-good: bump version
Message-ID: <20131111110425.EE0189B9A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14ee08f3e3c98a074ccd8cbc971d633c61110ab7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release. Patch is now upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...v4lbufferpool-O_CLOEXEC-needs-_GNU_SOURCE.patch |   46 --------------------
 .../gst1-plugins-good/gst1-plugins-good.mk         |    2 +-
 2 files changed, 1 insertions(+), 47 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good-gstv4lbufferpool-O_CLOEXEC-needs-_GNU_SOURCE.patch b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good-gstv4lbufferpool-O_CLOEXEC-needs-_GNU_SOURCE.patch
deleted file mode 100644
index 7dd7917..0000000
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good-gstv4lbufferpool-O_CLOEXEC-needs-_GNU_SOURCE.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4f305f30c9917f7a6ea7332a798401f2a5abe981 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Fri, 4 Oct 2013 13:34:09 +0200
-Subject: [PATCH] gstv4l2bufferpool: O_CLOEXEC needs _GNU_SOURCE
-
-[Submitted upstream: https://bugzilla.gnome.org/show_bug.cgi?id=709423]
-
-On some systems (E.G. uClibc and older Glibc versions), O_CLOEXEC is only
-defined when _GNU_SOURCE is specified, so do so.
-
-_GNU_SOURCE needs to be defined before any system headers are included,
-so move the fcntl.h section up.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- sys/v4l2/gstv4l2bufferpool.c |   10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
-index 00c6086..f5396d9 100644
---- a/sys/v4l2/gstv4l2bufferpool.c
-+++ b/sys/v4l2/gstv4l2bufferpool.c
-@@ -26,13 +26,17 @@
- #  include <config.h>
- #endif
- 
--#include <sys/mman.h>
--#include <string.h>
--#include <unistd.h>
- #if HAVE_DECL_V4L2_MEMORY_DMABUF
-+#ifndef _GNU_SOURCE
-+# define _GNU_SOURCE            /* O_CLOEXEC */
-+#endif
- #include <fcntl.h>
- #endif
- 
-+#include <sys/mman.h>
-+#include <string.h>
-+#include <unistd.h>
-+
- #include "gst/video/video.h"
- #include "gst/video/gstvideometa.h"
- #include "gst/video/gstvideopool.h"
--- 
-1.7.10.4
-
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index de8ad91..982b2b3 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.2.0
+GST1_PLUGINS_GOOD_VERSION = 1.2.1
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
