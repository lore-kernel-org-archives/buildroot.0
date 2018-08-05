From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 14:16:14 +0200
Subject: [Buildroot] [git commit] package/opencv3: fix build with gcc bug
 64735
Message-ID: <20180805121020.A03FB8B479@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b734042d9b65b4895b698cec73a0a565cfc3d54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenCV3 allows to disable the usage of std::exception_ptr:
https://github.com/opencv/opencv/issues/11878#issuecomment-402099255

Fixes
http://autobuild.buildroot.net/results/5ca/5ca221792c72c0a19f8b0e8303c0603d28f3c48e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv3/opencv3.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 09455d61b2..ea4d22743f 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -11,13 +11,21 @@ OPENCV3_LICENSE = BSD-3-Clause
 OPENCV3_LICENSE_FILES = LICENSE
 OPENCV3_SUPPORTS_IN_SOURCE_BUILD = NO
 
+OPENCV3_CXXFLAGS = $(TARGET_CXXFLAGS)
+
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-OPENCV3_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+OPENCV3_CXXFLAGS += -latomic
+endif
+
+# Fix c++11 build with missing std::exception_ptr
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
+OPENCV3_CXXFLAGS += -DCV__EXCEPTION_PTR=0
 endif
 
 # OpenCV component options
 OPENCV3_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="$(OPENCV3_CXXFLAGS)" \
 	-DBUILD_DOCS=OFF \
 	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS),ON,OFF) \
 	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV3_BUILD_TESTS),ON,OFF) \
