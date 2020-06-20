From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Jun 2020 22:29:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-cpp: drop dynamic library
 dependency
Message-ID: <20200620202934.1181500-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...FindMahoMqttC.cmake-fix-static-build.patch | 35 +++++++++++++++++++
 package/paho-mqtt-cpp/Config.in               |  6 ++--
 package/paho-mqtt-cpp/paho-mqtt-cpp.mk        | 14 ++++++++
 3 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 package/paho-mqtt-cpp/0001-cmake-FindMahoMqttC.cmake-fix-static-build.patch

diff --git a/package/paho-mqtt-cpp/0001-cmake-FindMahoMqttC.cmake-fix-static-build.patch b/package/paho-mqtt-cpp/0001-cmake-FindMahoMqttC.cmake-fix-static-build.patch
new file mode 100644
index 0000000000..934dca219e
--- /dev/null
+++ b/package/paho-mqtt-cpp/0001-cmake-FindMahoMqttC.cmake-fix-static-build.patch
@@ -0,0 +1,35 @@
+From 8aeafa1c2ec90b0e95ba5944266eda115457e10d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 15 Jun 2020 13:40:22 +0200
+Subject: [PATCH] cmake/FindMahoMqttC.cmake: fix static build
+
+Static libraries of paho-mqtt-c are not suffixed with -static since
+version 1.3.2 and
+https://github.com/eclipse/paho.mqtt.c/commit/8cc51c78b76a1eabd1df3124b0887ce8b01070ff
+
+See: https://github.com/eclipse/paho.mqtt.c/pull/704
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/eclipse/paho.mqtt.cpp/pull/275]
+---
+ cmake/FindPahoMqttC.cmake | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/cmake/FindPahoMqttC.cmake b/cmake/FindPahoMqttC.cmake
+index 53f15a3..0ec95bd 100644
+--- a/cmake/FindPahoMqttC.cmake
++++ b/cmake/FindPahoMqttC.cmake
+@@ -5,10 +5,6 @@ if(PAHO_WITH_SSL)
+ else()
+     set(_PAHO_MQTT_C_LIB_NAME paho-mqtt3a)
+ endif()
+-# add suffix when using static Paho MQTT C library variant
+-if(PAHO_BUILD_STATIC)
+-    set(_PAHO_MQTT_C_LIB_NAME ${_PAHO_MQTT_C_LIB_NAME}-static)
+-endif()
+ 
+ find_library(PAHO_MQTT_C_LIBRARIES NAMES ${_PAHO_MQTT_C_LIB_NAME})
+ unset(_PAHO_MQTT_C_LIB_NAME)
+-- 
+2.26.2
+
diff --git a/package/paho-mqtt-cpp/Config.in b/package/paho-mqtt-cpp/Config.in
index dfeb5545f0..a46c1256e8 100644
--- a/package/paho-mqtt-cpp/Config.in
+++ b/package/paho-mqtt-cpp/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PAHO_MQTT_CPP
 	bool "paho-mqtt-cpp"
-	depends on !BR2_STATIC_LIBS  # dlopen()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -10,9 +9,8 @@ config BR2_PACKAGE_PAHO_MQTT_CPP
 
 	  https://eclipse.org/paho/clients/cpp/
 
-comment "paho-mqtt-cpp needs a toolchain w/ threads, C++, dynamic library support"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+comment "paho-mqtt-cpp needs a toolchain w/ threads, C++"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 comment "paho-mqtt-cpp needs a toolchain not affected by GCC bug 64735"
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
index 2cb65d9840..bf1c4a27b7 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
@@ -22,4 +22,18 @@ else
 PAHO_MQTT_CPP_CONF_OPTS += -DPAHO_WITH_SSL=FALSE
 endif
 
+ifeq ($(BR2_SHARED_LIBS),y)
+PAHO_MQTT_CPP_CONF_OPTS += \
+	-DPAHO_BUILD_SHARED=TRUE \
+	-DPAHO_BUILD_STATIC=FALSE
+else ifeq ($(BR2_STATIC_LIBS),y)
+PAHO_MQTT_CPP_CONF_OPTS += \
+	-DPAHO_BUILD_SHARED=FALSE \
+	-DPAHO_BUILD_STATIC=TRUE
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+PAHO_MQTT_CPP_CONF_OPTS += \
+	-DPAHO_BUILD_SHARED=TRUE \
+	-DPAHO_BUILD_STATIC=TRUE
+endif
+
 $(eval $(cmake-package))
-- 
2.26.2
