From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 May 2013 22:59:23 +0200
Subject: [Buildroot] [git commit] mongoose: add optional openssl support
Message-ID: <20130502210337.E41C1999CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a859f06eedc2fb2214a805374ace10cc05996bff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mongoose/mongoose.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 4f7df17..ac03bb6 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -10,7 +10,15 @@ MONGOOSE_SITE = https://mongoose.googlecode.com/files
 MONGOOSE_LICENSE = MIT
 MONGOOSE_LICENSE_FILES = COPYING
 
-MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -DNO_SSL
+MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MONGOOSE_DEPENDENCIES += openssl
+# directly linked
+MONGOOSE_CFLAGS += -DNO_SSL_DL -lssl -lcrypto -lz
+else
+MONGOOSE_CFLAGS += -DNO_SSL
+endif
 
 define MONGOOSE_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) \
