From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Nov 2013 23:21:47 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad: workaround directfb
	example build issue
Message-ID: <20131117222202.5721D9BCC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64dbd7d0364fc53c13ff87196cfef41a5f672484
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/ea8/ea84eb03ea4a5974cd25b2d1e15ab76bfd3e81dd/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-bad-fix-dfb-example.patch         |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad-fix-dfb-example.patch b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad-fix-dfb-example.patch
new file mode 100644
index 0000000..b1f06ff
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad-fix-dfb-example.patch
@@ -0,0 +1,33 @@
+[PATCH] work around dfb-example build issue
+
+directfb.h defines a number of macros which conflicts with gst/gst.h:
+
+In file included from ../sysroot/usr/include/gstreamer-1.0/gst/gst.h:50:0,
+                 from dfb-example.c:4:
+../sysroot/usr/include/gstreamer-1.0/gst/gstinfo.h:295:69: error: expected ???)??? before ???__attribute__???
+../sysroot/usr/include/gstreamer-1.0/gst/gstinfo.h:295:69: error: expected ???,??? or ???;??? before ???)??? token
+
+As mentioned in the upstream bug report:
+
+https://bugzilla.gnome.org/show_bug.cgi?id=685609
+
+A workaround is to simply swap the include order around.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ ext/directfb/dfb-example.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: gst1-plugins-bad-1.2.1/ext/directfb/dfb-example.c
+===================================================================
+--- gst1-plugins-bad-1.2.1.orig/ext/directfb/dfb-example.c
++++ gst1-plugins-bad-1.2.1/ext/directfb/dfb-example.c
+@@ -1,7 +1,7 @@
+ 
+-#include <directfb.h>
+ #include <stdio.h>
+ #include <gst/gst.h>
++#include <directfb.h>
+ 
+ static IDirectFB *dfb = NULL;
+ static IDirectFBSurface *primary = NULL;
