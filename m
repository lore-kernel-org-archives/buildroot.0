From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 26 Sep 2014 14:09:14 +0100
Subject: [Buildroot] [PATCH] opencv: highgui module is needed for ts module
Message-ID: <1411736954-35559-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenCV's highgui module needs to be auto-selected when the ts module is
selected, because it depends on it. Otherwise it would fail with an
error like this one:

[ 96%] Building CXX object
modules/ts/CMakeFiles/opencv_ts.dir/src/gpu_perf.cpp.o
In file included from
/home/test/autobuild/instance-1/output/build/opencv-2.4.8/modules/ts/src/gpu_perf.cpp:43:0:
/home/test/autobuild/instance-1/output/build/opencv-2.4.8/modules/ts/include/opencv2/ts/gpu_perf.hpp:47:39:
fatal error: opencv2/highgui/highgui.hpp: No such file or directory
compilation terminated.

Fixes:
  http://autobuild.buildroot.net/results/31b/31b124ff1ec958a621863bfc80323847a6373135/

Issue reported upstream:
  http://code.opencv.org/issues/3923

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/opencv/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 24f540e..d648e5e 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -101,6 +101,7 @@ config BR2_PACKAGE_OPENCV_LIB_SUPERRES
 
 config BR2_PACKAGE_OPENCV_LIB_TS
 	bool "ts (touchscreen)"
+	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	default y
 	help
 	  Include opencv_ts module into the OpenCV build.
-- 
1.7.1
