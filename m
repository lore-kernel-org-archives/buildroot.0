From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Sep 2014 15:02:36 +0200
Subject: [Buildroot] [git commit] gst1-plugins-good: gstv4l2allocator:
	O_CLOEXEC needs _GNU_SOURCE
Message-ID: <20140915130926.5065F9D697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=117e864a53834c5e0bcdb9e764fcd45119f373f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/ee9/ee985d94da6a7115b6e62cf407e3c6a90eb3e4bf/

On some systems (E.G. uClibc and older Glibc versions), O_CLOEXEC is only
defined when _GNU_SOURCE is specified, so do so.

Patch submitted upstream: https://bugzilla.gnome.org/show_bug.cgi?id=736670

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...v4l2allocator-O_CLOEXEC-needs-_GNU_SOURCE.patch |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good-01-gstv4l2allocator-O_CLOEXEC-needs-_GNU_SOURCE.patch b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good-01-gstv4l2allocator-O_CLOEXEC-needs-_GNU_SOURCE.patch
new file mode 100644
index 0000000..cf133e0
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good-01-gstv4l2allocator-O_CLOEXEC-needs-_GNU_SOURCE.patch
@@ -0,0 +1,34 @@
+From c1ccd15d95f4a649dc192c96005409693eb31d2c Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 15 Sep 2014 14:51:24 +0200
+Subject: [PATCH] gstv4l2allocator: O_CLOEXEC needs _GNU_SOURCE
+
+Similar to 94f3d6fc / bz 709423
+
+On some systems (E.G. uClibc and older Glibc versions), O_CLOEXEC is only
+defined when _GNU_SOURCE is specified, so do so.
+
+Upstream bugzilla: https://bugzilla.gnome.org/show_bug.cgi?id=736670
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ sys/v4l2/gstv4l2allocator.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/sys/v4l2/gstv4l2allocator.c b/sys/v4l2/gstv4l2allocator.c
+index 2bc51c4..a5c9626 100644
+--- a/sys/v4l2/gstv4l2allocator.c
++++ b/sys/v4l2/gstv4l2allocator.c
+@@ -21,6 +21,10 @@
+ 
+ #include "config.h"
+ 
++#ifndef _GNU_SOURCE
++# define _GNU_SOURCE            /* O_CLOEXEC */
++#endif
++
+ #include "ext/videodev2.h"
+ #include "gstv4l2allocator.h"
+ #include "v4l2_calls.h"
+-- 
+2.1.0
+
