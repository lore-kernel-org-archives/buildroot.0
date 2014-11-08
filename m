From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Nov 2014 00:07:37 +0100
Subject: [Buildroot] [git commit] mongoose: bump to version 5.5
Message-ID: <20141108230843.205E1B3814@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2f8c60e847f7b7a3c1274f757d3ac17797edf9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- examples/server was renamed examples/web_server
 - patch was submitted and included upstream so we can drop it

Signed-off-by: Davide Viti <zinosat@tiscali.it>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ongoose-0001-largefile-conditional-define.patch |   22 --------------------
 package/mongoose/mongoose.mk                       |    9 ++++---
 2 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/package/mongoose/mongoose-0001-largefile-conditional-define.patch b/package/mongoose/mongoose-0001-largefile-conditional-define.patch
deleted file mode 100644
index b1d759a..0000000
--- a/package/mongoose/mongoose-0001-largefile-conditional-define.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Avoid the following warning, due to duplicate definition of
-"_LARGEFILE_SOURCE"
-
-mongoose.c:52:0: warning: "_LARGEFILE_SOURCE" redefined [enabled by default]
- #define _LARGEFILE_SOURCE       // Enable fseeko() and ftello() functions
- ^
-<command-line>:0:0: note: this is the location of the previous definition
-
-Signed-off-by: Davide Viti <zinosat@tiscali.it>
-
---- mongoose-5.4/mongoose.c~	2014-07-28 13:19:00.000000000 +0200
-+++ mongoose-5.4/mongoose.c	2014-08-04 23:10:59.164092500 +0200
-@@ -49,7 +49,9 @@
- #define _XOPEN_SOURCE 600       // For flockfile() on Linux
- #define __STDC_FORMAT_MACROS    // <inttypes.h> wants this for C++
- #define __STDC_LIMIT_MACROS     // C++ wants that for INT64_MAX
-+#ifndef _LARGEFILE_SOURCE
- #define _LARGEFILE_SOURCE       // Enable fseeko() and ftello() functions
-+#endif
- #define _FILE_OFFSET_BITS 64    // Enable 64-bit file offsets
- 
- #ifdef _MSC_VER
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index e0104b4..35e4b43 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 5.4
+MONGOOSE_VERSION = 5.5
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPLv2
 MONGOOSE_LICENSE_FILES = LICENSE
@@ -19,14 +19,15 @@ MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
 endif
 
 define MONGOOSE_BUILD_CMDS
-	$(TARGET_CC) $(@D)/examples/server.c $(@D)/mongoose.c -I$(@D) \
-		-o $(@D)/examples/server $(MONGOOSE_CFLAGS) -pthread -ldl
+	$(TARGET_CC) $(@D)/examples/web_server/web_server.c $(@D)/mongoose.c \
+		-I$(@D) -o $(@D)/examples/web_server/web_server \
+		$(MONGOOSE_CFLAGS) -pthread -ldl
 	$(TARGET_CC) -c $(@D)/mongoose.c $(MONGOOSE_CFLAGS) -o $(@D)/mongoose.o
 	$(TARGET_AR) rcs $(@D)/libmongoose.a $(@D)/mongoose.o
 endef
 
 define MONGOOSE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/examples/server \
+	$(INSTALL) -D -m 755 $(@D)/examples/web_server/web_server \
 		$(TARGET_DIR)/usr/sbin/mongoose
 	$(INSTALL) -D -m 755 package/mongoose/S85mongoose \
 		$(TARGET_DIR)/etc/init.d/S85mongoose
