From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Apr 2014 01:15:41 +0200
Subject: [Buildroot] [PATCH v2 09/24] opencv: sort and reorder CMake
	configuration flags
In-Reply-To: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398208556-4195-10-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To make easier future package update.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- new patch (split suggested by Yann)
---
 package/opencv/opencv.mk | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index a4d2ee0..ae89577 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -10,25 +10,36 @@ OPENCV_INSTALL_STAGING = YES
 OPENCV_LICENSE = BSD-3c
 OPENCV_LICENSE_FILES = doc/license.txt
 
+# OpenCV component options
 OPENCV_CONF_OPT += \
 	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release)   \
-	-DBUILD_WITH_STATIC_CRT=OFF                                  \
-	-DBUILD_DOCS=OFF                                             \
-	-DBUILD_EXAMPLES=OFF                                         \
-	-DBUILD_PACKAGE=OFF                                          \
-	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
+	-DBUILD_WITH_DEBUG_INFO=OFF \
+	-DBUILD_DOCS=OFF            \
+	-DBUILD_EXAMPLES=OFF        \
 	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
-	-DBUILD_WITH_DEBUG_INFO=OFF             \
+	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF)
+
+# OpenCV build options
+OPENCV_CONF_OPT += \
+	-DBUILD_WITH_STATIC_CRT=OFF      \
+	-DENABLE_FAST_MATH=ON            \
+	-DENABLE_NOISY_WARNINGS=OFF      \
+	-DENABLE_OMIT_FRAME_POINTER=ON   \
+	-DENABLE_PRECOMPILED_HEADERS=OFF \
+	-DENABLE_PROFILING=OFF           \
+	-DOPENCV_CAN_BREAK_BINARY_COMPATIBILITY=ON
+
+# OpenCV link options
+OPENCV_CONF_OPT += \
 	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
 	-DCMAKE_SKIP_RPATH=OFF                  \
-	-DCMAKE_USE_RELATIVE_PATHS=OFF          \
-	-DENABLE_FAST_MATH=ON                   \
-	-DENABLE_NOISY_WARNINGS=OFF             \
-	-DENABLE_OMIT_FRAME_POINTER=ON          \
-	-DENABLE_PRECOMPILED_HEADERS=OFF        \
-	-DENABLE_PROFILING=OFF                  \
-	-DENABLE_SOLUTION_FOLDERS=OFF           \
-	-DOPENCV_CAN_BREAK_BINARY_COMPATIBILITY=ON
+	-DCMAKE_USE_RELATIVE_PATHS=OFF
+
+# OpenCV packaging options:
+OPENCV_CONF_OPT += \
+	-DBUILD_PACKAGE=OFF           \
+	-DENABLE_SOLUTION_FOLDERS=OFF \
+	-DINSTALL_CREATE_DISTRIB=OFF
 
 # OpenCV module selection
 OPENCV_CONF_OPT += \
-- 
1.9.2
