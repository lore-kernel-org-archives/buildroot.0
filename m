From: Rahul Jain <Rahul.Jain@imgtec.com>
Date: Thu, 22 Sep 2016 14:55:19 +0530
Subject: [Buildroot] [PATCH v2 2/2] uhttpd: new package
In-Reply-To: <1474536319-12268-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1474536319-12268-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <1474536319-12268-2-git-send-email-Rahul.Jain@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Arnout Vandecappelle <arnout@mind.be> 
Signed-off-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Signed-off-by: Neha Bairathi <Neha.Bairathi@imgtec.com>
Signed-off-by: Abhishek Singh <Abhishek.Singh@imgtec.com>
Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
---
 Changes v1 -> v2:
   - Updated the url in help (Suggested by Arnout)
   - Use http url (Suggested by Arnout)
   - Add hash file (Suggested by Arnout)
   - Improve handling of optional dependency on lua (Suggested by Arnout)
   - Remove unrequired config options (Suggested by Arnout)
   - Explicitly specify the config option when enabling lua, ssl and ubus support (Suggested by Arnout)

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/uhttpd/Config.in   | 18 ++++++++++++++++++
 package/uhttpd/uhttpd.hash |  2 ++
 package/uhttpd/uhttpd.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 60 insertions(+)
 create mode 100644 package/uhttpd/Config.in
 create mode 100644 package/uhttpd/uhttpd.hash
 create mode 100644 package/uhttpd/uhttpd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d85d3db..a424c51 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1159,6 +1159,7 @@ F:	package/gupnp/
 F:	package/gupnp-av/
 
 N:	Rahul Jain <rahul.jain@imgtec.com>
+F:	package/uhttpd
 F:	package/ustream-ssl
 
 N:	Renaud Aubin <root@renaud.io>
diff --git a/package/Config.in b/package/Config.in
index 3421fd1..942cce7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1599,6 +1599,7 @@ endif
 	source "package/tunctl/Config.in"
 	source "package/tvheadend/Config.in"
 	source "package/udpcast/Config.in"
+	source "package/uhttpd/Config.in"
 	source "package/ulogd/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
diff --git a/package/uhttpd/Config.in b/package/uhttpd/Config.in
new file mode 100644
index 0000000..e463b93
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
+	  https://wiki.openwrt.org/doc/howto/http.uhttpd
+
+comment "uhttpd needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
new file mode 100644
index 0000000..59e54ad
--- /dev/null
+++ b/package/uhttpd/uhttpd.hash
@@ -0,0 +1,2 @@
+# No hash for this git snapshot
+none	xxx	uhttpd-59e0c739634f46a164d939e54416287b91ff8a9b.tar.gz
diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
new file mode 100644
index 0000000..b4ef291
--- /dev/null
+++ b/package/uhttpd/uhttpd.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# uhttpd
+#
+################################################################################
+
+UHTTPD_VERSION = 59e0c739634f46a164d939e54416287b91ff8a9b
+UHTTPD_SITE = http://git.openwrt.org/project/uhttpd.git
+UHTTPD_SITE_METHOD = git
+UHTTPD_LICENSE = ISC
+UHTTPD_DEPENDENCIES = libubox json-c
+
+ifeq ($(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION),"5.1")
+ifeq ($(BR2_PACKAGE_LUA),y)
+UHTTPD_DEPENDENCIES += lua
+else ifeq ($(BR2_PACKAGE_LUAJIT),y)
+UHTTPD_DEPENDENCIES += luajit
+endif
+UHTTPD_CONF_OPTS += -DLUA_SUPPORT=ON
+else
+UHTTPD_CONF_OPTS += -DLUA_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_USTREAM_SSL),y)
+UHTTPD_DEPENDENCIES += ustream-ssl
+UHTTPD_CONF_OPTS += -DTLS_SUPPORT=ON
+else
+UHTTPD_CONF_OPTS += -DTLS_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UBUS),y)
+UHTTPD_DEPENDENCIES += ubus
+UHTTPD_CONF_OPTS += -DUBUS_SUPPORT=ON
+else
+UHTTPD_CONF_OPTS += -DUBUS_SUPPORT=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.6.2
