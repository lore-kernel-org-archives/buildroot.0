From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 31 Oct 2019 11:23:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/domoticz: fix build with RELRO
Message-ID: <20191031102306.15433-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/5c1ca3083ad672401d1e050c6c3a07b8c33b851d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...xt-Add-USE_PRECOMPILED_HEADER-option.patch | 35 +++++++++++++++++++
 package/domoticz/domoticz.mk                  |  3 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/domoticz/0003-CMakeLists.txt-Add-USE_PRECOMPILED_HEADER-option.patch

diff --git a/package/domoticz/0003-CMakeLists.txt-Add-USE_PRECOMPILED_HEADER-option.patch b/package/domoticz/0003-CMakeLists.txt-Add-USE_PRECOMPILED_HEADER-option.patch
new file mode 100644
index 0000000000..831e4816e1
--- /dev/null
+++ b/package/domoticz/0003-CMakeLists.txt-Add-USE_PRECOMPILED_HEADER-option.patch
@@ -0,0 +1,35 @@
+From e2dfb2ece19748ba99ec8199fc902c0c9daff325 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 30 Oct 2019 18:55:48 +0100
+Subject: [PATCH] CMakeLists.txt: Add USE_PRECOMPILED_HEADER option
+
+Add USE_PRECOMPILED_HEADER to allow the user to disable precompiled
+header feature. Thanks to this, domoticz will be able to be built with
+RELRO on buildroot
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5c1ca3083ad672401d1e050c6c3a07b8c33b851d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/domoticz/domoticz/commit/e2dfb2ece19748ba99ec8199fc902c0c9daff325]
+---
+ CMakeLists.txt | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cb6150ce4c..bd48872214 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -744,7 +744,10 @@ else()
+   target_link_libraries(domoticz -lrt -lresolv ${EXECINFO_LIBRARIES})
+ ENDIF()
+ 
+-ADD_PRECOMPILED_HEADER(domoticz "main/stdafx.h")
++option(USE_PRECOMPILED_HEADER "Use precompiled header feature to speed up build time " YES)
++if(USE_PRECOMPILED_HEADER)
++  ADD_PRECOMPILED_HEADER(domoticz "main/stdafx.h")
++ENDIF(USE_PRECOMPILED_HEADER)
+ 
+ IF(CMAKE_COMPILER_IS_GNUCXX)
+   option(USE_STATIC_LIBSTDCXX "Build with static libgcc/libstdc++ libraries" YES)
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index c0568c61c6..d8ccfeee5a 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -31,6 +31,9 @@ DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_SQLITE=OFF \
 	-DUSE_BUILTIN_MQTT=OFF
 
+# Disable precompiled header feature to fix build with RELRO
+DOMOTICZ_CONF_OPTS += -DUSE_PRECOMPILED_HEADER=OFF
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 DOMOTICZ_DEPENDENCIES += libusb
 endif
-- 
2.23.0
