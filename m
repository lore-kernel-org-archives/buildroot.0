From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 21:16:54 +0100
Subject: [Buildroot] [git commit] ubus: new package
Message-ID: <20151222203030.C2612826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=245330d6679098428863998cbbd9b3f58cd844d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 .../0001-Install-server-and-client-examples.patch  | 23 +++++++++++++
 package/ubus/Config.in                             | 28 +++++++++++++++
 package/ubus/ubus.hash                             |  2 ++
 package/ubus/ubus.mk                               | 40 ++++++++++++++++++++++
 5 files changed, 94 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f619aa0..59a9136 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -446,6 +446,7 @@ endif
 	source "package/ti-utils/Config.in"
 	source "package/triggerhappy/Config.in"
 	source "package/uboot-tools/Config.in"
+	source "package/ubus/Config.in"
 	source "package/udev/Config.in"
 	source "package/udisks/Config.in"
 	source "package/usb_modeswitch/Config.in"
diff --git a/package/ubus/0001-Install-server-and-client-examples.patch b/package/ubus/0001-Install-server-and-client-examples.patch
new file mode 100644
index 0000000..0ee4d3e
--- /dev/null
+++ b/package/ubus/0001-Install-server-and-client-examples.patch
@@ -0,0 +1,23 @@
+Install server and client examples
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ examples/CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
+index 0279f6e66b50..2f8f4e026e20 100644
+--- a/examples/CMakeLists.txt
++++ b/examples/CMakeLists.txt
+@@ -9,4 +9,8 @@ IF (BUILD_EXAMPLES)
+ 
+ 	ADD_EXECUTABLE(client client.c count.c)
+ 	TARGET_LINK_LIBRARIES(client ubus ubox)
++
++	INSTALL(TARGETS server client
++	        RUNTIME DESTINATION sbin
++	)
+ ENDIF()
+-- 
+1.9.1
+
diff --git a/package/ubus/Config.in b/package/ubus/Config.in
new file mode 100644
index 0000000..8567321
--- /dev/null
+++ b/package/ubus/Config.in
@@ -0,0 +1,28 @@
+comment "ubus needs a toolchain w/ dynamic library"
+        depends on BR2_STATIC_LIBS
+
+config BR2_PACKAGE_UBUS
+	bool "ubus"
+	select BR2_PACKAGE_LIBUBOX
+	select BR2_PACKAGE_JSON_C
+	depends on !BR2_STATIC_LIBS # libubox
+	help
+	  IPC/RPC bus that allows communication between processes.
+
+	  It consists of few parts including a daemon (ubusd), a library
+	  (libubus) and a command line interface (ubus). Although created
+	  for the OpenWRT project, it can be used as a general IPC/RPC
+	  mechanism in other projects.
+
+	  * Select BR2_PACKAGE_LUA_5_1 if you want to have Lua support.
+
+	  https://wiki.openwrt.org/doc/techref/ubus
+
+if BR2_PACKAGE_UBUS
+
+config BR2_PACKAGE_UBUS_EXAMPLES
+	bool "build and install ubus examples"
+	help
+	  Build and install client and server ubus examples.
+
+endif
diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
new file mode 100644
index 0000000..af9b652
--- /dev/null
+++ b/package/ubus/ubus.hash
@@ -0,0 +1,2 @@
+# No hash for this git snapshot
+none  xxx  ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63.tar.gz
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
new file mode 100644
index 0000000..cd66b86
--- /dev/null
+++ b/package/ubus/ubus.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# ubus
+#
+################################################################################
+
+UBUS_VERSION = 259450f414d8c9ee41896e8e6d6bc57ec00e2b63
+UBUS_SITE = git://git.openwrt.org/project/ubus.git
+
+UBUS_LICENSE = LGPLv2.1
+UBUS_LICENSE_FILES = ubusd_acl.h
+
+UBUS_INSTALL_STAGING = YES
+
+UBUS_DEPENDENCIES = json-c libubox
+
+# package only compiles with Lua 5.1
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+UBUS_DEPENDENCIES += lua
+UBUS_CONF_OPTS += -DBUILD_LUA=ON \
+	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include \
+	-DLUAPATH=/usr/lib/lua/$(LUAINTERPRETER_ABIVER)
+else
+UBUS_CONF_OPTS += -DBUILD_LUA=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+UBUS_DEPENDENCIES += systemd
+UBUS_CONF_OPTS += -DENABLE_SYSTEMD=ON
+else
+UBUS_CONF_OPTS += -DENABLE_SYSTEMD=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UBUS_EXAMPLES),y)
+UBUS_CONF_OPTS += -DBUILD_EXAMPLES=ON
+else
+UBUS_CONF_OPTS += -DBUILD_EXAMPLES=OFF
+endif
+
+$(eval $(cmake-package))
