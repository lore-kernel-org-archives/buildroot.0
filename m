From: Bradford Barr <bradford@density.io>
Date: Tue, 26 Sep 2017 16:35:04 -0400
Subject: [Buildroot] [PATCH 2/2] opencv3: add support for tbb
In-Reply-To: <20170926203504.22326-1-bradford@density.io>
References: <20170926203504.22326-1-bradford@density.io>
Message-ID: <20170926203504.22326-3-bradford@density.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: bradford barr <bradford@density.io>

This patchset adds support for tbb optimizations in opencv3.

Signed-off-by: bradford barr <bradford@density.io>
---
 package/opencv3/Config.in  |  6 ++++++
 package/opencv3/opencv3.mk | 10 ++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 2214ee8..07613e8 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -307,6 +307,12 @@ config BR2_PACKAGE_OPENCV3_WITH_PNG
 	help
 	  Use shared libpng from the target system.
 
+config BR2_PACKAGE_OPENCV3_WITH_TBB
+	bool "tbb support"
+	select BR2_PACKAGE_TBB
+	help
+	  Use build libtbb from OpenCV3.
+
 config BR2_PACKAGE_OPENCV3_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 3a7c3f4..e031d7f 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -133,8 +133,7 @@ OPENCV3_CONF_OPTS += \
 	-DBUILD_WITH_DYNAMIC_IPP=OFF \
 	-DWITH_INTELPERC=OFF \
 	-DWITH_IPP=OFF \
-	-DWITH_IPP_A=OFF \
-	-DWITH_TBB=OFF
+	-DWITH_IPP_A=OFF
 
 # Smartek stuff
 OPENCV3_CONF_OPTS += -DWITH_GIGEAPI=OFF
@@ -288,6 +287,13 @@ OPENCV3_CONF_OPTS += -DWITH_QT=5
 OPENCV3_DEPENDENCIES += qt5base
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_TBB),y)
+OPENCV3_CONF_OPTS += -DWITH_TBB=ON
+OPENCV3_DEPENDENCIES += tbb
+else
+OPENCV3_CONF_OPTS += -DWITH_TBB=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_TIFF),y)
 OPENCV3_CONF_OPTS += -DWITH_TIFF=ON
 OPENCV3_DEPENDENCIES += tiff
-- 
2.9.3
