From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Dec 2009 22:17:12 +0100
Subject: [Buildroot] [git commit master] mpg123: convert to
	Makefile.autotools.in format
Message-ID: <20091217211833.31C26777FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ec6ef827d6c3fdf50854a22c213cc1aac4c4eef8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                             |    2 +-
 package/multimedia/mpg123/mpg123.mk |   72 ++++-------------------------------
 2 files changed, 9 insertions(+), 65 deletions(-)

diff --git a/CHANGES b/CHANGES
index f8fd9d0..fb880f5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
 	directfb, gst-plugins-bad, hal, iw, libfuse, libpcap, lighttpd,
-	mesa, mtd-utils, pcre, qt, sshfs, tremor, usbutils
+	mesa, mpg123, mtd-utils, pcre, qt, sshfs, tremor, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 774ca77..25d5dd2 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -3,73 +3,17 @@
 # mpg123
 #
 #############################################################
-MPG123_VERSION=0.66
-MPG123_SOURCE=mpg123-$(MPG123_VERSION).tar.bz2
-MPG123_CAT:=$(BZCAT)
-MPG123_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
-MPG123_DIR:=$(BUILD_DIR)/mpg123-$(MPG123_VERSION)
-MPG123_BIN:=src/mpg123
-MPG123_TARGET_BIN:=usr/bin/mpg123
+MPG123_VERSION = 0.66
+MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
+MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
+
+MPG123_CONF_OPT = --program-prefix='' --with-cpu=generic_nofpu
 
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-MPG123_USE_ALSA:=--with-audio=alsa
-MPG123_ALSA_DEP:=alsa-lib
+MPG123_CONF_OPT += --with-audio=alsa
+MPG123_DEPENDENCIES += alsa-lib
 endif
 
-$(DL_DIR)/$(MPG123_SOURCE):
-	$(call DOWNLOAD,$(MPG123_SITE),$(MPG123_SOURCE))
-
-$(MPG123_DIR)/.unpacked: $(DL_DIR)/$(MPG123_SOURCE)
-	$(MPG123_CAT) $(DL_DIR)/$(MPG123_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MPG123_DIR) package/multimedia/mpg123/ mpg123-$(MPG123_VERSION)\*.patch
-	$(CONFIG_UPDATE) $(MPG123_DIR)/build
-	touch $@
-
-$(MPG123_DIR)/.configured: $(MPG123_DIR)/.unpacked
-	(cd $(MPG123_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		./configure $(QUIET) \
-		--target=$(REAL_GNU_TARGET_NAME) \
-		--host=$(REAL_GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--with-cpu=generic_nofpu \
-		$(MPG123_USE_ALSA) \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(MPG123_DIR)/$(MPG123_BIN): $(MPG123_DIR)/.configured
-	$(MAKE) -C $(MPG123_DIR)
-
-$(TARGET_DIR)/$(MPG123_TARGET_BIN): $(MPG123_DIR)/$(MPG123_BIN)
-	$(INSTALL) -D $(MPG123_DIR)/$(MPG123_BIN) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
-
-mpg123: $(MPG123_ALSA_DEP) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
-
-mpg123-unpacked: $(MPG123_DIR)/.unpacked
-
-mpg123-clean:
-	-$(MAKE) -C $(MPG123_DIR) clean
-
-mpg123-dirclean:
-	rm -rf $(MPG123_DIR) $(MPG123_DIR)
-
-mpg123-source: $(DL_DIR)/$(MPG123_SOURCE)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MPG123),y)
-TARGETS+=mpg123
-endif
+$(eval $(call AUTOTARGETS,package/multimedia,mpg123))
-- 
1.6.3.3
