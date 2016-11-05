From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 14:16:29 +0100
Subject: [Buildroot] [git commit branch/next] uhttpd: new package
Message-ID: <20161105223210.393667FFDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dde8a7610092608fefc55e2024a71e8cb769fbc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Signed-off-by: Neha Bairathi <Neha.Bairathi@imgtec.com>
Signed-off-by: Abhishek Singh <Abhishek.Singh@imgtec.com>
Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
[Thomas: remove luajit support, as it doesn't build.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |  1 +
 package/uhttpd/Config.in   | 18 ++++++++++++++++++
 package/uhttpd/uhttpd.hash |  2 ++
 package/uhttpd/uhttpd.mk   | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 56 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a24110e..0d449dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1616,6 +1616,7 @@ endif
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
index 0000000..be0d7d6
--- /dev/null
+++ b/package/uhttpd/uhttpd.mk
@@ -0,0 +1,35 @@
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
+UHTTPD_LICENSE_FILES = uhttpd.h
+UHTTPD_DEPENDENCIES = libubox json-c
+
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+UHTTPD_DEPENDENCIES += lua
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
