From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Thu,  9 Aug 2007 10:17:07 +0200
Subject: [Buildroot] [PATCH 1/1] dropbear: bump version to 0.50 and remove
	urandom config option
Message-ID: <11866474272144-git-send-email-hcegtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps the dropbear version number to 0.50 (from 0.49). It also
removes the menu option for configuring to use /dev/urandom as source for
entropy. /dev/urandom is the default source in dropbear 0.50.

Also minor cleanups in the makefile.

Signed-off-by: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
---
 package/dropbear/Config.in   |   14 --------------
 package/dropbear/dropbear.mk |   32 ++++++++------------------------
 2 files changed, 8 insertions(+), 38 deletions(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 8e39166..d76bb29 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -5,17 +5,3 @@ config BR2_PACKAGE_DROPBEAR
 	  A small SSH 2 server designed for small memory environments.
 
 	  http://matt.ucc.asn.au/dropbear/dropbear.html
-
-config BR2_PACKAGE_DROPBEAR_URANDOM
-	bool "Use /dev/urandom (low entropy systems only)?"
-	default n
-	depends on BR2_PACKAGE_DROPBEAR
-	help
-	  By default, dropbear uses the much more secure /dev/random.  If you
-	  are using a system lacking usable entropy sources, this could cause
-	  the dropbear ssh daemon to block forever waiting for entropy that
-	  will never arrive.  By making dropbear use /dev/urandom, you can
-	  prevent Dropbear from blocking while waiting on the random device.
-	  This could however significantly reduce the security of your ssh
-	  connections.  Make sure you know what you are doing if you enable
-	  this option -- most people should answer N.
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 9f42040..9b87a02 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -3,7 +3,7 @@
 # dropbear
 #
 #############################################################
-DROPBEAR_VERSION:=0.49
+DROPBEAR_VERSION:=0.50
 DROPBEAR_SOURCE:=dropbear-$(DROPBEAR_VERSION).tar.gz
 DROPBEAR_SITE:=http://matt.ucc.asn.au/dropbear/releases/
 DROPBEAR_DIR:=$(BUILD_DIR)/dropbear-$(DROPBEAR_VERSION)
@@ -21,7 +21,7 @@ $(DROPBEAR_DIR)/.unpacked: $(DL_DIR)/$(DROPBEAR_SOURCE)
 	toolchain/patch-kernel.sh $(DROPBEAR_DIR) package/dropbear/ dropbear\*.patch
 	$(SED) 's,^/\* #define DROPBEAR_MULTI.*,#define DROPBEAR_MULTI,g' $(DROPBEAR_DIR)/options.h
 	$(CONFIG_UPDATE) $(DROPBEAR_DIR)
-	touch $(DROPBEAR_DIR)/.unpacked
+	touch $@
 
 $(DROPBEAR_DIR)/.configured: $(DROPBEAR_DIR)/.unpacked
 	(cd $(DROPBEAR_DIR); rm -rf config.cache; \
@@ -33,24 +33,12 @@ $(DROPBEAR_DIR)/.configured: $(DROPBEAR_DIR)/.unpacked
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
 		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
 		$(DISABLE_NLS) \
 		--with-shared \
 	);
-ifeq ($(strip $(BR2_PACKAGE_DROPBEAR_URANDOM)),y)
-	$(SED) 's,^#define DROPBEAR_RANDOM_DEV.*,#define DROPBEAR_RANDOM_DEV \"/dev/urandom\",' \
-		$(DROPBEAR_DIR)/options.h
-endif
-	touch $(DROPBEAR_DIR)/.configured
+	touch $@
 
 $(DROPBEAR_DIR)/$(DROPBEAR_BINARY): $(DROPBEAR_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) LD=$(TARGET_CC) \
@@ -58,21 +46,17 @@ $(DROPBEAR_DIR)/$(DROPBEAR_BINARY): $(DROPBEAR_DIR)/.configured
 		MULTI=1 SCPPROGRESS=1 -C $(DROPBEAR_DIR)
 
 $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY): $(DROPBEAR_DIR)/$(DROPBEAR_BINARY)
-	#$(MAKE) DESTDIR=$(TARGET_DIR) $(TARGET_CONFIGURE_OPTS) \
-	#	LD=$(TARGET_CC) -C $(DROPBEAR_DIR) install
-	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-	#	$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-	install -d -m 755 $(TARGET_DIR)/usr/sbin
-	install -d -m 755 $(TARGET_DIR)/usr/bin
-	install -m 755 $(DROPBEAR_DIR)/$(DROPBEAR_BINARY) \
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/sbin
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 755 $(DROPBEAR_DIR)/$(DROPBEAR_BINARY) \
 		$(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
-	$(STRIP) $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/scp
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/ssh
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dbclient
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearkey
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearconvert
-	cp $(DROPBEAR_DIR)/S50dropbear $(TARGET_DIR)/etc/init.d/
+	cp -dpf $(DROPBEAR_DIR)/S50dropbear $(TARGET_DIR)/etc/init.d/
 	chmod a+x $(TARGET_DIR)/etc/init.d/S50dropbear
 
 dropbear: uclibc zlib $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
-- 
1.5.2.3
