From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 27 Dec 2014 17:15:48 +0100
Subject: [Buildroot] [PATCH] package/libiio: do not force shared object build
Message-ID: <1419696948-31721-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libiio correctly builds as a static library, there is no obvious reason
to force the shared object build.

So, let the CMake BUILD_SHARED_LIBS variable handles the type of library
built.

This libiio patch has already been submitted upstream:
  https://github.com/analogdevicesinc/libiio/pull/6

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...UILD_SHARED_LIBS-drive-the-type-of-librar.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/libiio/0001-cmake-let-BUILD_SHARED_LIBS-drive-the-type-of-librar.patch

diff --git a/package/libiio/0001-cmake-let-BUILD_SHARED_LIBS-drive-the-type-of-librar.patch b/package/libiio/0001-cmake-let-BUILD_SHARED_LIBS-drive-the-type-of-librar.patch
new file mode 100644
index 0000000..9ee0299
--- /dev/null
+++ b/package/libiio/0001-cmake-let-BUILD_SHARED_LIBS-drive-the-type-of-librar.patch
@@ -0,0 +1,29 @@
+From 4d036f3708f1f427bf91c5925394d39ef76ad96a Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 27 Dec 2014 16:36:50 +0100
+Subject: [PATCH] cmake: let BUILD_SHARED_LIBS drive the type of library built
+
+Do not force the type of library because some architectures (such as
+BlackFin from AnalogDevice) do not support shared object.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cd82a96..393fee3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -115,7 +115,7 @@ install(FILES ${LIBIIO_PC} DESTINATION "${INSTALL_PKGCONFIG_DIR}")
+ #set(SETUP_PY ${CMAKE_CURRENT_SOURCE_DIR}/bindings/python/setup.py)
+ #configure_file(python/setup.py.in ${SETUP_PY} @ONLY)
+ 
+-add_library(iio SHARED ${LIBIIO_CFILES} ${LIBIIO_HEADERS})
++add_library(iio ${LIBIIO_CFILES} ${LIBIIO_HEADERS})
+ set_target_properties(iio PROPERTIES VERSION ${VERSION} SOVERSION ${LIBIIO_VERSION_MAJOR})
+ target_link_libraries(iio LINK_PRIVATE ${LIBS_TO_LINK})
+ 
+-- 
+2.2.1
+
-- 
2.2.1
