From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri, 27 Nov 2015 15:37:37 -0200
Subject: [Buildroot] [PATCH] rpi-userland: fix musl compile
Message-ID: <1448645857-14999-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building with musl, the build fails with a conflicting type
qualifier error.

This is because musl defines stdout and stderr as const pointers
and RaspiVidYUV.c adds an extern declaration as normal pointers.

Since this declaration already comes in on the header (stdio.h),
there is no need to add an extern declaration, so removes it.

Fixes:

http://autobuild.buildroot.net/results/27bd6f32cecdb4e7c95247c1feaf2732c1d8e3fa
Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 ...ting-type-qualifiers-errors-when-building.patch | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch

diff --git a/package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch b/package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch
new file mode 100644
index 000000000000..4db60142c6ad
--- /dev/null
+++ b/package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch
@@ -0,0 +1,23 @@
+Fix conflicting type qualifiers errors when building with musl.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ host_applications/linux/apps/raspicam/RaspiVidYUV.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/host_applications/linux/apps/raspicam/RaspiVidYUV.c b/host_applications/linux/apps/raspicam/RaspiVidYUV.c
+index b340d63c913f..13e6a6ccf5bf 100644
+--- a/host_applications/linux/apps/raspicam/RaspiVidYUV.c
++++ b/host_applications/linux/apps/raspicam/RaspiVidYUV.c
+@@ -106,8 +106,6 @@ const int ABORT_INTERVAL = 100; // ms
+ /// Run/record forever
+ #define WAIT_METHOD_FOREVER        4
+ 
+-extern FILE *stderr, *stdout;
+-
+ int mmal_status_to_int(MMAL_STATUS_T status);
+ static void signal_handler(int signal_number);
+ 
+-- 
+1.9.1
+
-- 
1.9.1
