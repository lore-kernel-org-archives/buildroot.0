From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 19:30:30 +0100
Subject: [Buildroot] [git commit] rpi-userland: fix musl compile
Message-ID: <20151127185004.2BA23818A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=044a0f2919911b00bb38d4f1c2e486799cd4d670
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building with musl, the build fails with a conflicting type
qualifier error.

This is because musl defines stdout and stderr as const pointers
and RaspiVidYUV.c adds an extern declaration as normal pointers.

Since this declaration already comes in on the header (stdio.h),
there is no need to add an extern declaration, so removes it.

Fixes:

http://autobuild.buildroot.net/results/27bd6f32cecdb4e7c95247c1feaf2732c1d8e3fa

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ting-type-qualifiers-errors-when-building.patch |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch b/package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch
new file mode 100644
index 0000000..4db6014
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
