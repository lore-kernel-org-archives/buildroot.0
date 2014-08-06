From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Wed, 6 Aug 2014 17:53:18 +0530
Subject: [Buildroot] [PATCH] libiqrf: use lpthread option while linking
Message-ID: <1407327799-2598-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Link libiqrf against libpthread.
Use -lpthread argument while linking.

nostartfiles option is added to remove linking error -
undefined reference to 'main'

Fixes:
http://autobuild.buildroot.net/results/9e1/9e1ad254e6d3a223078c99bf731bcc63096f2ca3//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 .../libiqrf/libiqrf-0001-link-with-pthread.patch   |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/libiqrf/libiqrf-0001-link-with-pthread.patch

diff --git a/package/libiqrf/libiqrf-0001-link-with-pthread.patch b/package/libiqrf/libiqrf-0001-link-with-pthread.patch
new file mode 100644
index 0000000..b823fd0
--- /dev/null
+++ b/package/libiqrf/libiqrf-0001-link-with-pthread.patch
@@ -0,0 +1,25 @@
+Link libiqrf against libpthread.
+Use -lpthread argument while linking.
+
+nostartfiles option is used to remove linking error -
+undefined reference to 'main' 
+
+Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
+---
+diff -Nurp libiqrf-v0.1.2_orig/src/CMakeLists.txt libiqrf-v0.1.2/src/CMakeLists.txt
+--- libiqrf-v0.1.2_orig/src/CMakeLists.txt	2014-08-06 17:12:50.552749306 +0530
++++ libiqrf-v0.1.2/src/CMakeLists.txt	2014-08-06 17:15:36.288742360 +0530
+@@ -16,10 +16,12 @@ set (iqrf_sources
+ 	usb.c
+ )
+ 
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -lpthread -nostartfiles")
++
+ include_directories ("${LIBUSB_1_INCLUDE_DIRS}")
+ 
+ add_library(iqrf SHARED ${iqrf_sources} ${iqrf_headers})
+-target_link_libraries(iqrf ${LIBUSB_1_LIBRARIES})
++target_link_libraries(iqrf ${LIBUSB_1_LIBRARIES} ${CMAKE_CXX_FLAGS})
+ 
+ set_target_properties(iqrf PROPERTIES
+ 	VERSION "${iqrf_version_major}.${iqrf_version_minor}"
-- 
1.7.9.5
