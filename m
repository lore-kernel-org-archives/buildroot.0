From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Sep 2014 21:14:40 +0200
Subject: [Buildroot] [git commit] opencv: highgui module is needed for ts
	module
Message-ID: <20140926191637.532009D797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3fe0fe73d840af1d9f557ddace43397642d6645
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
