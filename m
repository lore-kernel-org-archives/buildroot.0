From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 13:53:25 +0200
Subject: [Buildroot] [git commit] mongoose: bump to version 5.3
Message-ID: <20140601083245.E4F209CE5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=926affb40dba28696ef4a62aced946269c1f1a62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mongoose has changed quite drastically in the last months.
Here is a list of changes which had to be applied:

 - Bump version from 3.7 to 5.3
 - use tarball download via github helper iso git clone
 - need largefile support
 - compilation takes place into "examples"
 - weberver source is now "server.c"
 - adapt to new command line options
 - SSL support now controlled via NS_ENABLE_SSL

[Peter: extend commit text, use CFLAGS_EXTRA, only build server]
Signed-off-by: Davide Viti <zinosat@tiscali.it>
Cc: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/Config.in   |    5 +++--
 package/mongoose/S85mongoose |    2 +-
 package/mongoose/mongoose.mk |   17 +++++++----------
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
index 35723de..2526112 100644
--- a/package/mongoose/Config.in
+++ b/package/mongoose/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MONGOOSE
 	bool "mongoose"
+	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	help
@@ -7,6 +8,6 @@ config BR2_PACKAGE_MONGOOSE
 
 	  https://github.com/valenok/mongoose
 
-comment "mongoose needs a toolchain w/ threads"
+comment "mongoose needs a toolchain w/ threads, largefile"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
diff --git a/package/mongoose/S85mongoose b/package/mongoose/S85mongoose
index dc042d0..98e537f 100755
--- a/package/mongoose/S85mongoose
+++ b/package/mongoose/S85mongoose
@@ -10,7 +10,7 @@ NAME=mongoose
 DESC="Mongoose HTTP server"
 
 DAEMON=`which mongoose`
-OPTIONS="-num_threads 3 -document_root /var/www -listening_ports 80"
+OPTIONS="-document_root /var/www -listening_port 80"
 
 [ -e /etc/default/mongoose ] && . /etc/default/mongoose
 
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index d928dd8..75a4d3f 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 3.7
-MONGOOSE_SOURCE = mongoose-$(MONGOOSE_VERSION).tgz
-MONGOOSE_SITE = https://mongoose.googlecode.com/files
-MONGOOSE_LICENSE = MIT
+MONGOOSE_VERSION = 5.3
+MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
+MONGOOSE_LICENSE = GPLv2
 MONGOOSE_LICENSE_FILES = LICENSE
 
 MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS)
@@ -15,18 +14,16 @@ MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS)
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
 # directly linked
-MONGOOSE_CFLAGS += -DNO_SSL_DL -lssl -lcrypto -lz
-else
-MONGOOSE_CFLAGS += -DNO_SSL
+MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
 endif
 
 define MONGOOSE_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) \
-		linux COPT="$(MONGOOSE_CFLAGS)"
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)/examples \
+		CFLAGS_EXTRA="$(MONGOOSE_CFLAGS)" server
 endef
 
 define MONGOOSE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/mongoose $(TARGET_DIR)/usr/sbin/mongoose
+	$(INSTALL) -D -m 755 $(@D)/examples/server $(TARGET_DIR)/usr/sbin/mongoose
 	$(INSTALL) -D -m 755 package/mongoose/S85mongoose \
 		$(TARGET_DIR)/etc/init.d/S85mongoose
 endef
