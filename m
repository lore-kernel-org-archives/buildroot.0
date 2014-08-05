From: Davide Viti <zinosat@tiscali.it>
Date: Tue,  5 Aug 2014 22:47:07 +0200
Subject: [Buildroot] [PATCH v2 1/2] mongoose: bump to version 5.4
Message-ID: <1407271628-5996-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid compilation of the server via the upstream Makefile which
unconditionally uses -lssl

The -lssl flag is appended to MONGOOSE_CFLAGS whenever 
BR2_PACKAGE_OPENSSL=y gets set.


Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
Changes v1 -> v2:
 - Expand commit log

 package/mongoose/mongoose.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index ee93846..4182a30 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 5.3
+MONGOOSE_VERSION = 5.4
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPLv2
 MONGOOSE_LICENSE_FILES = LICENSE
@@ -19,8 +19,8 @@ MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
 endif
 
 define MONGOOSE_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)/examples \
-		CFLAGS_EXTRA="$(MONGOOSE_CFLAGS)" server
+	$(TARGET_CC) $(@D)/examples/server.c $(@D)/mongoose.c \
+		-o $(@D)/examples/server $(MONGOOSE_CFLAGS) -pthread -ldl
 	$(TARGET_CC) -c $(@D)/mongoose.c $(MONGOOSE_CFLAGS) -o $(@D)/mongoose.o
 	$(TARGET_AR) rcs $(@D)/libmongoose.a $(@D)/mongoose.o
 endef
-- 
1.7.10.4
