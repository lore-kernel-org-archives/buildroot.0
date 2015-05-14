From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 May 2015 00:52:10 +0200
Subject: [Buildroot] [git commit] mongoose: fix static build issue
Message-ID: <20150514230014.90A367F954@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e67d499f14efd24dd3179ddc40f15aadb4d200a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/372/372515ba0a09a23237ae34024658f21c2625d6e7/

Disable the shared library support in mongoose, as the only thing it does is
including dlfcn.h - So it is useless.  Also remove the unneeded -ldl from
the web server linker flags.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index e31b099..6797e58 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -10,7 +10,7 @@ MONGOOSE_LICENSE = GPLv2
 MONGOOSE_LICENSE_FILES = LICENSE
 MONGOOSE_INSTALL_STAGING = YES
 
-MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS)
+MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -DMONGOOSE_NO_DL
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
@@ -21,7 +21,7 @@ endif
 define MONGOOSE_BUILD_CMDS
 	$(TARGET_CC) $(@D)/examples/web_server/web_server.c $(@D)/mongoose.c \
 		-I$(@D) -o $(@D)/examples/web_server/web_server \
-		$(MONGOOSE_CFLAGS) -pthread -ldl
+		$(MONGOOSE_CFLAGS) -pthread
 	$(TARGET_CC) -c $(@D)/mongoose.c $(MONGOOSE_CFLAGS) -o $(@D)/mongoose.o
 	$(TARGET_AR) rcs $(@D)/libmongoose.a $(@D)/mongoose.o
 endef
