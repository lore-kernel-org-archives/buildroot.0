From: Davide Viti <zinosat@tiscali.it>
Date: Mon, 14 Dec 2015 22:44:54 +0100
Subject: [Buildroot] [PATCH v2] mongoose: bump to version 6.1
Message-ID: <1450129494-5625-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - provide only libmongoose.a
 - rework package description

Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
Changes v1 -> v2:
   - Compile only libmongoose.a (suggested by Peter Korsgaard)
   - Remove init scripts
   - Rework package description (Config.in)
   - Make sure the update does not break swupdate which provides its own
     version of mongoose (suggested by Peter Korsgaard)
   
 package/mongoose/Config.in        |  3 ++-
 package/mongoose/S85mongoose      | 41 ---------------------------------------
 package/mongoose/mongoose.hash    |  2 +-
 package/mongoose/mongoose.mk      | 23 +---------------------
 package/mongoose/mongoose.service | 10 ----------
 5 files changed, 4 insertions(+), 75 deletions(-)
 delete mode 100755 package/mongoose/S85mongoose
 delete mode 100644 package/mongoose/mongoose.service

diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
index df706b9..22b385d 100644
--- a/package/mongoose/Config.in
+++ b/package/mongoose/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_MONGOOSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	help
-	  Mongoose is a small and easy to use web server
+	  Mongoose is an embedded networking library, which can turn
+	  anything into a web server
 
 	  https://github.com/cesanta/mongoose
 
diff --git a/package/mongoose/S85mongoose b/package/mongoose/S85mongoose
deleted file mode 100755
index 9f24e06..0000000
--- a/package/mongoose/S85mongoose
+++ /dev/null
@@ -1,41 +0,0 @@
-#!/bin/sh
-#
-# Start/stop the mongoose HTTP server
-#
-
-set -e
-
-PATH=/sbin:/bin:/usr/sbin:/usr/bin
-NAME=mongoose
-DESC="Mongoose HTTP server"
-
-DAEMON=`which mongoose`
-OPTIONS="-document_root /var/www -listening_port 80"
-
-[ -e /etc/default/mongoose ] && . /etc/default/mongoose
-
-case "$1" in
-  start)
-	echo "Starting $DESC:"
-	start-stop-daemon -S -x "$DAEMON" -b -- $OPTIONS
-	echo "$NAME."
-	;;
-  stop)
-	printf "Stopping $DESC: "
-	start-stop-daemon -K -x "$DAEMON"
-	echo "$NAME."
-	;;
-  restart|force-reload)
-	printf "Restarting $DESC: "
-	start-stop-daemon -K -x "$DAEMON"
-	sleep 1
-	start-stop-daemon -S -x "$DAEMON" -b -- $OPTIONS
-	echo "$NAME."
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 5687094..1ed4a78 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	cc2557c7cf9f15e1e691f285a4c6c705cc7e56cb70c64cb49703a428a0677065  mongoose-5.6.tar.gz
+sha256	512b406714d31a178fc41263ca6ecafd0c1e2dd091e9685a7b2462fecdaaea8e  mongoose-6.1.tar.gz
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 14f2aae..6caaf2e 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 5.6
+MONGOOSE_VERSION = 6.1
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPLv2
 MONGOOSE_LICENSE_FILES = LICENSE
@@ -19,31 +19,10 @@ MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
 endif
 
 define MONGOOSE_BUILD_CMDS
-	$(TARGET_CC) $(@D)/examples/web_server/web_server.c $(@D)/mongoose.c \
-		-I$(@D) -o $(@D)/examples/web_server/web_server \
-		$(MONGOOSE_CFLAGS) -pthread
 	$(TARGET_CC) -c $(@D)/mongoose.c $(MONGOOSE_CFLAGS) -o $(@D)/mongoose.o
 	$(TARGET_AR) rcs $(@D)/libmongoose.a $(@D)/mongoose.o
 endef
 
-define MONGOOSE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/examples/web_server/web_server \
-		$(TARGET_DIR)/usr/sbin/mongoose
-endef
-
-define MONGOOSE_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/mongoose/S85mongoose \
-		$(TARGET_DIR)/etc/init.d/S85mongoose
-endef
-
-define MONGOOSE_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/mongoose/mongoose.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/mongoose.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/mongoose.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mongoose.service
-endef
-
 define MONGOOSE_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 644 $(@D)/libmongoose.a \
 		$(STAGING_DIR)/usr/lib/libmongoose.a
diff --git a/package/mongoose/mongoose.service b/package/mongoose/mongoose.service
deleted file mode 100644
index 12a731c..0000000
--- a/package/mongoose/mongoose.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Mongoose HTTP server
-After=network.target
-
-[Service]
-ExecStart=/usr/sbin/mongoose -document_root /var/www -listening_port 80
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
-- 
2.1.4
