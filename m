From: Rahul Jain <Rahul.Jain@imgtec.com>
Date: Fri, 16 Sep 2016 14:46:27 +0530
Subject: [Buildroot] [PATCH 4/4] uhttpd: new package
In-Reply-To: <1474017387-3985-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1474017387-3985-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <1474017387-3985-4-git-send-email-Rahul.Jain@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Signed-off-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Signed-off-by: Neha Bairathi <Neha.Bairathi@imgtec.com>
Signed-off-by: Abhishek Singh <Abhishek.Singh@imgtec.com>
Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
---
 package/Config.in        |  1 +
 package/uhttpd/Config.in | 18 ++++++++++++++++++
 package/uhttpd/uhttpd.mk | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 package/uhttpd/Config.in
 create mode 100644 package/uhttpd/uhttpd.mk

diff --git a/package/Config.in b/package/Config.in
index 6437f35..43a8c8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1596,6 +1596,7 @@ endif
 	source "package/tunctl/Config.in"
 	source "package/tvheadend/Config.in"
 	source "package/udpcast/Config.in"
+	source "package/uhttpd/Config.in"
 	source "package/ulogd/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
diff --git a/package/uhttpd/Config.in b/package/uhttpd/Config.in
new file mode 100644
index 0000000..ec105ee
--- /dev/null
+++ b/package/uhttpd/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_UHTTPD
+	bool "uhttpd"
+	depends on !BR2_STATIC_LIBS # dlopen()
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBUBOX
+	select BR2_PACKAGE_JSON_C
+	help
+	  uHTTPd is a tiny single threaded HTTP server with TLS, CGI and Lua
+	  support. It is intended as a drop-in replacement for the Busybox
+	  HTTP daemon.
+
+	  https://git.openwrt.org/?p=project/uhttpd.git;a=summary
+
+comment "uhttpd needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
new file mode 100644
index 0000000..d336ff1
--- /dev/null
+++ b/package/uhttpd/uhttpd.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# uhttpd
+#
+################################################################################
+
+UHTTPD_VERSION = 59e0c739634f46a164d939e54416287b91ff8a9b
+UHTTPD_SITE = git://git.openwrt.org/project/uhttpd.git
+UHTTPD_LICENSE = ISC
+UHTTPD_DEPENDENCIES = libubox json-c
+
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+UHTTPD_DEPENDENCIES += lua
+UHTTPD_CONF_OPTS += -DLUAPATH=/usr/lib/lua/$(LUAINTERPRETER_ABIVER) \
+	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
+else
+UHTTPD_CONF_OPTS += -DLUA_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_USTREAM_SSL),y)
+UHTTPD_DEPENDENCIES += ustream-ssl
+else
+UHTTPD_CONF_OPTS += -DTLS_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UBUS),y)
+UHTTPD_DEPENDENCIES += ubus
+else
+UHTTPD_CONF_OPTS += -DUBUS_SUPPORT=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.6.2
