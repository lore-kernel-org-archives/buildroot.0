From: Alexey Mednyy <swexru@gmail.com>
Date: Sun, 12 Oct 2014 11:29:56 +0400
Subject: [Buildroot] [PATCH 1/1] Bump libubox, libuci to last versions,
	add ubus package
Message-ID: <1413098996-358-1-git-send-email-swexru@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Mednyy <swexru@gmail.com>
---
 package/Config.in                              |  1 +
 package/libubox/libubox.mk                     |  2 +-
 package/libuci/libuci.mk                       |  2 +-
 package/ubus/Config.in                         | 11 ++++++++++
 package/ubus/ubus-01-json-definition-fix.patch | 28 ++++++++++++++++++++++++++
 package/ubus/ubus.mk                           | 26 ++++++++++++++++++++++++
 6 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 package/ubus/Config.in
 create mode 100644 package/ubus/ubus-01-json-definition-fix.patch
 create mode 100644 package/ubus/ubus.mk

diff --git a/package/Config.in b/package/Config.in
index ea89c96..92fc6bb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -872,6 +872,7 @@ menu "Other"
 	source "package/libtasn1/Config.in"
 	source "package/libtpl/Config.in"
 	source "package/libubox/Config.in"
+	source "package/ubus/Config.in"	
 	source "package/libuci/Config.in"
 	source "package/libunwind/Config.in"
 	source "package/liburcu/Config.in"
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 770b55d..7ff3c16 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b
+LIBUBOX_VERSION = 5a0bbefc8fa440446253b171d0ac038d839360e3
 LIBUBOX_SITE = git://nbd.name/luci2/libubox.git
 LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
 LIBUBOX_INSTALL_STAGING = YES
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index ce18a38..9d5c172 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCI_VERSION = ed938cc8e423d4a33b8f31e6e6d1eb0805ae3d10
+LIBUCI_VERSION = e339407372ffc70b1451e4eda218c01aa95a6a7f
 LIBUCI_SITE = git://nbd.name/uci.git
 LIBUCI_LICENSE = LGPLv2.1
 LIBUCI_INSTALL_STAGING = YES
diff --git a/package/ubus/Config.in b/package/ubus/Config.in
new file mode 100644
index 0000000..6a9c73d
--- /dev/null
+++ b/package/ubus/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_UBUS
+	bool "ubus"
+	select BR2_PACKAGE_LIBUBOX
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  OpenWrt micro bus architecture, project
+          provide communication between various 
+          daemons and applications.
+
+comment "ubus needs toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/ubus/ubus-01-json-definition-fix.patch b/package/ubus/ubus-01-json-definition-fix.patch
new file mode 100644
index 0000000..ccef101
--- /dev/null
+++ b/package/ubus/ubus-01-json-definition-fix.patch
@@ -0,0 +1,28 @@
+Fix wrong cmake behavior with json lib search
+
+Signed-off-by: Alexey Mednyy swexru at gmail.com
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cb2f420..679b258 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -25,11 +25,18 @@ TARGET_LINK_LIBRARIES(ubus ubox)
+ ADD_EXECUTABLE(ubusd ubusd.c ubusd_id.c ubusd_obj.c ubusd_proto.c ubusd_event.c)
+ TARGET_LINK_LIBRARIES(ubusd ubox)
+ 
+-find_library(json NAMES json-c json)
++find_library(json NAMES json-c)
+ ADD_EXECUTABLE(cli cli.c)
+ SET_TARGET_PROPERTIES(cli PROPERTIES OUTPUT_NAME ubus)
+ TARGET_LINK_LIBRARIES(cli ubus ubox blobmsg_json ${json})
+ 
++INCLUDE(FindPkgConfig)
++PKG_CHECK_MODULES(JSONC json-c)
++IF(JSONC_FOUND)
++  ADD_DEFINITIONS(-DJSONC)
++  INCLUDE_DIRECTORIES(${JSONC_INCLUDE_DIRS})
++ENDIF()
++
+ ADD_SUBDIRECTORY(lua)
+ ADD_SUBDIRECTORY(examples)
+ 
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
new file mode 100644
index 0000000..9ac45ab
--- /dev/null
+++ b/package/ubus/ubus.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# UBUS
+#
+################################################################################
+
+UBUS_VERSION = 4c4f35cf2230d70b9ddd87638ca911e8a563f2f3
+UBUS_SITE = git://nbd.name/luci2/ubus.git
+UBUS_LICENSE = LGPLv2.1
+UBUS_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_JSON_C),json-c)
+
+ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
+UBUS_DEPENDENCIES += lua
+UBUS_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
+else
+	UBUS_CONF_OPTS += -DBUILD_LUA:BOOL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+	UBUS_DEPENDENCIES += systemd 
+else
+	UBUS_CONF_OPTS += -DENABLE_SYSTEMD:BOOL=OFF
+endif
+
+$(eval $(cmake-package))
-- 
1.9.1
