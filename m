From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 May 2014 14:38:10 +0200
Subject: [Buildroot] [git commit] mongoose: provide libmongoose.a static
	library
Message-ID: <20140601083246.836CC9CE5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66d364f4f21924af7f5273fea7b96293a1a463a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package provides a webserver and, eventually, a library: this is
what Centos, among other distros, is doing.

[Peter: correct install -D invocation]
Signed-off-by: Davide Viti <d.viti@infosolution.it>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/Config.in   |    2 +-
 package/mongoose/mongoose.mk |   13 ++++++++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
index 2526112..8060942 100644
--- a/package/mongoose/Config.in
+++ b/package/mongoose/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_MONGOOSE
 	help
 	  Mongoose is a small and easy to use web server
 
-	  https://github.com/valenok/mongoose
+	  https://github.com/cesanta/mongoose
 
 comment "mongoose needs a toolchain w/ threads, largefile"
 	depends on BR2_USE_MMU
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 75a4d3f..ee93846 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -8,6 +8,7 @@ MONGOOSE_VERSION = 5.3
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPLv2
 MONGOOSE_LICENSE_FILES = LICENSE
+MONGOOSE_INSTALL_STAGING = YES
 
 MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS)
 
@@ -20,12 +21,22 @@ endif
 define MONGOOSE_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)/examples \
 		CFLAGS_EXTRA="$(MONGOOSE_CFLAGS)" server
+	$(TARGET_CC) -c $(@D)/mongoose.c $(MONGOOSE_CFLAGS) -o $(@D)/mongoose.o
+	$(TARGET_AR) rcs $(@D)/libmongoose.a $(@D)/mongoose.o
 endef
 
 define MONGOOSE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/examples/server $(TARGET_DIR)/usr/sbin/mongoose
+	$(INSTALL) -D -m 755 $(@D)/examples/server \
+		$(TARGET_DIR)/usr/sbin/mongoose
 	$(INSTALL) -D -m 755 package/mongoose/S85mongoose \
 		$(TARGET_DIR)/etc/init.d/S85mongoose
 endef
 
+define MONGOOSE_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 644 $(@D)/libmongoose.a \
+		$(STAGING_DIR)/usr/lib/libmongoose.a
+	$(INSTALL) -D -m 644 $(@D)/mongoose.h \
+		$(STAGING_DIR)/usr/include/mongoose.h
+endef
+
 $(eval $(generic-package))
