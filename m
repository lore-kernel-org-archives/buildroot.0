From: Alexey Mednyy <swexru@gmail.com>
Date: Tue, 14 Oct 2014 13:46:47 +0400
Subject: [Buildroot] [PATCH 1/1 v3] ubus: new package
Message-ID: <1413280007-16819-1-git-send-email-swexru@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Mednyy <swexru@gmail.com>
---
 package/Config.in                              |  1 +
 package/ubus/Config.in                         | 14 +++++++++++++
 package/ubus/ubus-01-json-definition-fix.patch | 27 +++++++++++++++++++++++++
 package/ubus/ubus.mk                           | 28 ++++++++++++++++++++++++++
 4 files changed, 70 insertions(+)
 create mode 100644 package/ubus/Config.in
 create mode 100644 package/ubus/ubus-01-json-definition-fix.patch
 create mode 100644 package/ubus/ubus.mk

diff --git a/package/Config.in b/package/Config.in
index 19bb9bf..16d4901 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -896,6 +896,7 @@ menu "Other"
 	source "package/startup-notification/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
+	source "package/ubus/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/ubus/Config.in b/package/ubus/Config.in
new file mode 100644
index 0000000..b0f5de9
--- /dev/null
+++ b/package/ubus/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_UBUS
+	bool "ubus"
+	select BR2_PACKAGE_LIBUBOX
+	select BR2_PACKAGE_JSON_C
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  OpenWrt micro bus architecture, project
+	  provide communication between various 
+	  daemons and applications.
+
+	  http://wiki.openwrt.org/doc/techref/ubus
+
+comment "ubus needs toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/ubus/ubus-01-json-definition-fix.patch b/package/ubus/ubus-01-json-definition-fix.patch
new file mode 100644
index 0000000..50f9096
--- /dev/null
+++ b/package/ubus/ubus-01-json-definition-fix.patch
@@ -0,0 +1,27 @@
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cb2f420..86c4c4d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -25,10 +25,20 @@ TARGET_LINK_LIBRARIES(ubus ubox)
+ ADD_EXECUTABLE(ubusd ubusd.c ubusd_id.c ubusd_obj.c ubusd_proto.c ubusd_event.c)
+ TARGET_LINK_LIBRARIES(ubusd ubox)
+ 
+-find_library(json NAMES json-c json)
++
++find_package(PkgConfig)
++PKG_CHECK_MODULES(JSONC json-c)
++IF(JSONC_FOUND)
++  ADD_DEFINITIONS(-DJSONC)
++  INCLUDE_DIRECTORIES(${JSONC_INCLUDE_DIRS})
++ENDIF()
++
+ ADD_EXECUTABLE(cli cli.c)
+ SET_TARGET_PROPERTIES(cli PROPERTIES OUTPUT_NAME ubus)
+-TARGET_LINK_LIBRARIES(cli ubus ubox blobmsg_json ${json})
++TARGET_LINK_LIBRARIES(cli ubus ubox blobmsg_json)
++IF(JSONC_FOUND)
++  TARGET_LINK_LIBRARIES(cli ${JSONC_LIBRARIES})
++ENDIF()
+ 
+ ADD_SUBDIRECTORY(lua)
+ ADD_SUBDIRECTORY(examples)
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
new file mode 100644
index 0000000..652ab48
--- /dev/null
+++ b/package/ubus/ubus.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# UBUS
+#
+################################################################################
+
+UBUS_VERSION = 4c4f35cf2230d70b9ddd87638ca911e8a563f2f3
+UBUS_SITE = git://nbd.name/luci2/ubus.git
+UBUS_LICENSE = LGPLv2.1
+UBUS_DEPENDENCIES = json-c libubox
+
+ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
+UBUS_DEPENDENCIES += lua
+UBUS_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include \
+	-DBUILD_LUA=ON
+else
+UBUS_CONF_OPTS += -DBUILD_LUA=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+UBUS_CONF_OPTS += systemd \
+	-DENABLE_SYSTEMD=ON
+else
+UBUS_CONF_OPTS += -DENABLE_SYSTEMD=OFF
+endif
+
+$(eval $(cmake-package))
-- 
1.9.1
