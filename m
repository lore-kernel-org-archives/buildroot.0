From: Davide Viti <zinosat@tiscali.it>
Date: Sat,  5 Dec 2015 21:35:45 +0100
Subject: [Buildroot] [PATCH 1/1] mongoose: bump to version 6.1
Message-ID: <1449347746-13496-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - the example does not accept optional parameters anymore
 - listening port is now forced to 8000

Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
 package/mongoose/S85mongoose      |  2 +-
 package/mongoose/mongoose.hash    |  2 +-
 package/mongoose/mongoose.mk      | 10 ++++++----
 package/mongoose/mongoose.service |  2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/mongoose/S85mongoose b/package/mongoose/S85mongoose
index 9f24e06..932d713 100755
--- a/package/mongoose/S85mongoose
+++ b/package/mongoose/S85mongoose
@@ -10,7 +10,7 @@ NAME=mongoose
 DESC="Mongoose HTTP server"
 
 DAEMON=`which mongoose`
-OPTIONS="-document_root /var/www -listening_port 80"
+OPTIONS=""
 
 [ -e /etc/default/mongoose ] && . /etc/default/mongoose
 
diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 5687094..1ed4a78 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	cc2557c7cf9f15e1e691f285a4c6c705cc7e56cb70c64cb49703a428a0677065  mongoose-5.6.tar.gz
+sha256	512b406714d31a178fc41263ca6ecafd0c1e2dd091e9685a7b2462fecdaaea8e  mongoose-6.1.tar.gz
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 14f2aae..a689c9d 100644
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
@@ -18,16 +18,18 @@ MONGOOSE_DEPENDENCIES += openssl
 MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
 endif
 
+MONGOOSE_WEBSERVER = $(@D)/examples/simplest_web_server
 define MONGOOSE_BUILD_CMDS
-	$(TARGET_CC) $(@D)/examples/web_server/web_server.c $(@D)/mongoose.c \
-		-I$(@D) -o $(@D)/examples/web_server/web_server \
+	$(TARGET_CC) \
+		$(MONGOOSE_WEBSERVER)/simplest_web_server.c $(@D)/mongoose.c \
+		-I$(@D) -o $(MONGOOSE_WEBSERVER)/simplest_web_server \
 		$(MONGOOSE_CFLAGS) -pthread
 	$(TARGET_CC) -c $(@D)/mongoose.c $(MONGOOSE_CFLAGS) -o $(@D)/mongoose.o
 	$(TARGET_AR) rcs $(@D)/libmongoose.a $(@D)/mongoose.o
 endef
 
 define MONGOOSE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/examples/web_server/web_server \
+	$(INSTALL) -D -m 755 $(MONGOOSE_WEBSERVER)/simplest_web_server \
 		$(TARGET_DIR)/usr/sbin/mongoose
 endef
 
diff --git a/package/mongoose/mongoose.service b/package/mongoose/mongoose.service
index 12a731c..ebec9a0 100644
--- a/package/mongoose/mongoose.service
+++ b/package/mongoose/mongoose.service
@@ -3,7 +3,7 @@ Description=Mongoose HTTP server
 After=network.target
 
 [Service]
-ExecStart=/usr/sbin/mongoose -document_root /var/www -listening_port 80
+ExecStart=/usr/sbin/mongoose
 Restart=always
 
 [Install]
-- 
2.1.4
