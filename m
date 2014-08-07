From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Aug 2014 14:20:16 -0300
Subject: [Buildroot] [PATCH] mongoose: fix build failure
Message-ID: <1407432016-17434-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mongoose.h looks missing because we're not building locally, so switch
to the build dir. Fixes:
http://autobuild.buildroot.net/results/701/701711626548bd166cd5bc5669e4761ffed074d1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mongoose/mongoose.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 4182a30..5f53721 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -19,6 +19,7 @@ MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
 endif
 
 define MONGOOSE_BUILD_CMDS
+	cd $(@D) ; \
 	$(TARGET_CC) $(@D)/examples/server.c $(@D)/mongoose.c \
 		-o $(@D)/examples/server $(MONGOOSE_CFLAGS) -pthread -ldl
 	$(TARGET_CC) -c $(@D)/mongoose.c $(MONGOOSE_CFLAGS) -o $(@D)/mongoose.o
-- 
1.8.5.5
