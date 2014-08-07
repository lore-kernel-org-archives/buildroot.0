From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Aug 2014 22:11:58 +0200
Subject: [Buildroot] [git commit] mongoose: fix build failure
Message-ID: <20140807201250.022D99D3D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=595300f892b4bd3fdf26ea744fe9ac8b70d938db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mongoose.h looks missing because we're not building locally, so add
the appropriate -I flag. Fixes:
http://autobuild.buildroot.net/results/701/701711626548bd166cd5bc5669e4761ffed074d1/

[Thomas: change the solution to use -I$(@D) instead of switching to
the build directory.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mongoose/mongoose.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 4182a30..e0104b4 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -19,7 +19,7 @@ MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
 endif
 
 define MONGOOSE_BUILD_CMDS
-	$(TARGET_CC) $(@D)/examples/server.c $(@D)/mongoose.c \
+	$(TARGET_CC) $(@D)/examples/server.c $(@D)/mongoose.c -I$(@D) \
 		-o $(@D)/examples/server $(MONGOOSE_CFLAGS) -pthread -ldl
 	$(TARGET_CC) -c $(@D)/mongoose.c $(MONGOOSE_CFLAGS) -o $(@D)/mongoose.o
 	$(TARGET_AR) rcs $(@D)/libmongoose.a $(@D)/mongoose.o
