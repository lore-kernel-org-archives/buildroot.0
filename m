From: Charles Manning <cdhmanning@gmail.com>
Date: Thu, 13 Dec 2012 11:03:16 +1300
Subject: [Buildroot] [PATCH] Add package for mongoose web server
Message-ID: <1355349796-4165-1-git-send-email-cdhmanning@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
---
 package/Config.in                             |    1 +
 package/mongoose/Config.in                    |   13 ++++++
 package/mongoose/mongoose-3.3-init-file.patch |   44 ++++++++++++++++++++
 package/mongoose/mongoose-3.3-no-auth.patch   |   55 +++++++++++++++++++++++++
 package/mongoose/mongoose.mk                  |   38 +++++++++++++++++
 5 files changed, 151 insertions(+), 0 deletions(-)
 create mode 100644 package/mongoose/Config.in
 create mode 100644 package/mongoose/mongoose-3.3-init-file.patch
 create mode 100644 package/mongoose/mongoose-3.3-no-auth.patch
 create mode 100644 package/mongoose/mongoose.mk

diff --git a/package/Config.in b/package/Config.in
index 5ba1f05..a3d2590 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -603,6 +603,7 @@ source "package/linphone/Config.in"
 source "package/lrzsz/Config.in"
 source "package/macchanger/Config.in"
 source "package/mii-diag/Config.in"
+source "package/mongoose/Config.in"
 source "package/mrouted/Config.in"
 source "package/msmtp/Config.in"
 source "package/mutt/Config.in"
diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
new file mode 100644
index 0000000..39806f9
--- /dev/null
+++ b/package/mongoose/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MONGOOSE
+	bool "mongoose wen server"
+	help
+	  Mongoose small web server
+
+	  https://github.com/valenok/mongoose
+
+config BR2_PACKAGE_MONGOOSE_NO_PUT_AUTH
+	bool "Disable PUT authorization"
+	depends on BR2_PACKAGE_MONGOOSE
+	default n
+	help
+	  Sometimes you don't need PUT authorization.
diff --git a/package/mongoose/mongoose-3.3-init-file.patch b/package/mongoose/mongoose-3.3-init-file.patch
new file mode 100644
index 0000000..b62e4ca
--- /dev/null
+++ b/package/mongoose/mongoose-3.3-init-file.patch
@@ -0,0 +1,44 @@
+--- /dev/null	2012-12-10 08:42:11.241266044 +1300
++++ files/mongoose.init	2010-07-28 09:01:23.000000000 +1200
+@@ -0,0 +1,41 @@
++#!/bin/sh
++#
++# Start/stop the mongoose HTTP server
++#
++
++set -e
++
++PATH=/sbin:/bin:/usr/sbin:/usr/bin
++NAME=mongoose
++DESC="Mongoose HTTP server"
++
++DAEMON=`which mongoose`
++OPTIONS="-max_threads 3 -root /var/www  -ports 80"
++
++[ -e /etc/default/mongoose ] && . /etc/default/mongoose
++
++case "$1" in
++  start)
++	echo "Starting $DESC:"
++	start-stop-daemon -S -x "$DAEMON" -b -- $OPTIONS
++	echo "$NAME."
++	;;
++  stop)
++	echo -n "Stopping $DESC: "
++	start-stop-daemon -K -x "$DAEMON"
++	echo "$NAME."
++	;;
++  restart|force-reload)
++	echo -n "Restarting $DESC: "
++	start-stop-daemon -K -x "$DAEMON"
++	start-stop-daemon -S -x "$DAEMON" -b -- $OPTIONS
++	echo "$NAME."
++	;;
++  *)
++	N=/etc/init.d/$NAME
++	echo "Usage: $N {start|stop|restart|force-reload}" >&2
++	exit 1
++	;;
++esac
++
++exit 0
diff --git a/package/mongoose/mongoose-3.3-no-auth.patch b/package/mongoose/mongoose-3.3-no-auth.patch
new file mode 100644
index 0000000..a470f5e
--- /dev/null
+++ b/package/mongoose/mongoose-3.3-no-auth.patch
@@ -0,0 +1,55 @@
+From db714636f86d79be33ffe8f2408c8731b5969208 Mon Sep 17 00:00:00 2001
+From: Charles Manning <cdhmanning@gmail.com>
+Date: Mon, 10 Dec 2012 10:14:20 +1300
+Subject: [PATCH] Add NO_PUT_AUTH option to allow put with not authorization
+
+Sometimes you really don't want the security.
+
+Signed-off-by: Charles Manning <cdhmanning@gmail.com>
+---
+ Makefile   |    2 +-
+ mongoose.c |    8 +++++++-
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 14f986a..ae4755b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -17,7 +17,7 @@ all:
+ # -DSSL_LIB=\"libssl.so.<version>\"   - use system versioned SSL shared object
+ # -DCRYPTO_LIB=\"libcrypto.so.<version>\" - use system versioned CRYPTO so
+ # -DUSE_LUA               - embed Lua in Mongoose (+100kb)
+-
++# -DNO_PUT_AUTH           - disable authorization for PUT/DELETE
+ 
+ ##########################################################################
+ ###                 UNIX build: linux, bsd, mac, rtems
+diff --git a/mongoose.c b/mongoose.c
+index 2b5e586..327b419 100644
+--- a/mongoose.c
++++ b/mongoose.c
+@@ -64,6 +64,12 @@
+ #include <stddef.h>
+ #include <stdio.h>
+ 
++#ifdef NO_PUT_AUTH
++static int put_authorization_required = 0;
++#else
++static int put_authorization_required = 1;
++#endif
++
+ #if defined(_WIN32) && !defined(__SYMBIAN32__) // Windows specific
+ #define _WIN32_WINNT 0x0400 // To make it link in VS2005
+ #include <windows.h>
+@@ -4182,7 +4188,7 @@ static void handle_request(struct mg_connection *conn) {
+     send_options(conn);
+   } else if (conn->ctx->config[DOCUMENT_ROOT] == NULL) {
+     send_http_error(conn, 404, "Not Found", "Not Found");
+-  } else if ((!strcmp(ri->request_method, "PUT") ||
++  } else if (put_authorization_required && (!strcmp(ri->request_method, "PUT") ||
+         !strcmp(ri->request_method, "DELETE")) &&
+       (conn->ctx->config[PUT_DELETE_PASSWORDS_FILE] == NULL ||
+        is_authorized_for_put(conn) != 1)) {
+-- 
+1.7.1
+
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
new file mode 100644
index 0000000..ef06f41
--- /dev/null
+++ b/package/mongoose/mongoose.mk
@@ -0,0 +1,38 @@
+# Package for mongoose web server.
+# This has been patched with an extension to allow PUT with no authorization.
+#
+MONGOOSE_VERSION = 3.3
+MONGOOSE_SITE = http://github.com/valenok/mongoose/tarball/master
+MONGOOSE_LICENSE = MIT
+MONGOOSE_LICENSE_FILES = COPYING
+MONGOOSE_INSTALL_STAGING = YES
+MONGOOSE_INSTALL_TARGET = YES
+
+MONGOOSE_OPTIONAL_DEFINES = -DNO_SSL
+ifeq ($(BR2_PACKAGE_MONGOOSE_NO_PUT_AUTH),y)
+MONGOOSE_OPTIONAL_DEFINES += -DNO_PUT_AUTH
+endif
+
+define MONGOOSE_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$TARGETLD)" -C $(@D) linux COPT="$(MONGOOSE_OPTIONAL_DEFINES)"
+endef
+
+define MONGOOSE_INSTALL_STAGING_CMDS
+	$(INSTALL) -d $(STAGING_DIR)/sbin
+	$(INSTALL) -d $(STAGING_DIR)/etc
+	$(INSTALL) -d $(STAGING_DIR)/etc/init.d
+	$(INSTALL) -D -m 755 $(@D)/mongoose $(STAGING_DIR)/sbin/mongoose
+	$(INSTALL) -D -m 755 $(@D)/mongoose.init $(STAGING_DIR)/etc/init.d/mongoose
+endef
+
+define MONGOOSE_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)/sbin
+	$(INSTALL) -d $(TARGET_DIR)/etc
+	$(INSTALL) -d $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -D -m 755 $(@D)/mongoose $(TARGET_DIR)/sbin/mongoose
+	$(INSTALL) -D -m 755 $(@D)/mongoose.init $(TARGET_DIR)/etc/init.d/mongoose
+endef
+
+
+$(eval $(generic-package))
+
-- 
1.7.1
