From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri,  4 Dec 2009 00:02:01 +0100
Subject: [Buildroot] [PATCH 1/3] libvorbis: split tremor into its own package
Message-ID: <1259881323-4308-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit splits the Tremor fixed-point implementation
out of the libvorbis package and creates a new package
called 'tremor' for it.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/multimedia/Config.in              |    1 +
 package/multimedia/libvorbis/Config.in    |    7 ---
 package/multimedia/libvorbis/libvorbis.mk |   75 +----------------------------
 package/multimedia/tremor/Config.in       |    7 +++
 package/multimedia/tremor/tremor.mk       |   31 ++++++++++++
 5 files changed, 41 insertions(+), 80 deletions(-)
 create mode 100644 package/multimedia/tremor/Config.in
 create mode 100644 package/multimedia/tremor/tremor.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 49932d0..98cf9d1 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -24,5 +24,6 @@ source "package/multimedia/speex/Config.in"
 source "package/multimedia/swfdec/Config.in"
 source "package/multimedia/festival/Config.in"
 source "package/multimedia/taglib/Config.in"
+source "package/multimedia/tremor/Config.in"
 source "package/multimedia/vlc/Config.in"
 endmenu
diff --git a/package/multimedia/libvorbis/Config.in b/package/multimedia/libvorbis/Config.in
index 28a6a2e..e322dd2 100644
--- a/package/multimedia/libvorbis/Config.in
+++ b/package/multimedia/libvorbis/Config.in
@@ -12,10 +12,3 @@ config BR2_PACKAGE_LIBVORBIS
 	  representations such as MPEG-4 (AAC), and similar to, but higher
 	  performance than MPEG-1/2 audio layer 3, MPEG-4 audio (TwinVQ),
 	  WMA and PAC.
-
-config BR2_PACKAGE_LIBVORBIS_TREMOR
-	bool "use fixed point implementation (tremor)"
-	default y if BR2_SOFT_FLOAT
-	depends on BR2_PACKAGE_LIBVORBIS
-	help
-	  Use the Tremor fixed point implementation
diff --git a/package/multimedia/libvorbis/libvorbis.mk b/package/multimedia/libvorbis/libvorbis.mk
index 6c5dc7b..3cabd5e 100644
--- a/package/multimedia/libvorbis/libvorbis.mk
+++ b/package/multimedia/libvorbis/libvorbis.mk
@@ -4,8 +4,6 @@
 #
 #############################################################
 
-ifneq ($(BR2_PACKAGE_LIBVORBIS_TREMOR),y)
-
 LIBVORBIS_VERSION = 1.2.3
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/$(LIBVORBIS-SOURCE)
@@ -19,81 +17,12 @@ LIBVORBIS_DEPENDENCIES = host-pkgconfig libogg
 
 $(eval $(call AUTOTARGETS,package/multimedia,libvorbis))
 
-else
-
-############################################################
-#
-# Tremor (Integer decoder for Vorbis)
-#
-############################################################
-
-TREMOR_TRUNK:=http://svn.xiph.org/trunk/Tremor/
-TREMOR_VERSION:=16259
-TREMOR_NAME:=Tremor-svn-r$(TREMOR_VERSION)
-TREMOR_DIR:=$(BUILD_DIR)/$(TREMOR_NAME)
-TREMOR_SOURCE:=$(TREMOR_NAME).tar.bz2
-TREMOR_CAT=$(BZCAT)
-
-$(DL_DIR)/$(TREMOR_SOURCE):
-	$(SVN_CO) -r $(TREMOR_VERSION) $(TREMOR_TRUNK) $(TREMOR_DIR)
-	tar -cv -C $(BUILD_DIR) $(TREMOR_NAME) | bzip2 - -c > $@
-
-$(TREMOR_DIR)/.source: $(DL_DIR)/$(TREMOR_SOURCE)
-	$(TREMOR_CAT) $(DL_DIR)/$(TREMOR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(TREMOR_DIR)/.configured: $(TREMOR_DIR)/.source
-	(cd $(TREMOR_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		./autogen.sh \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--enable-shared \
-		--enable-static \
-		--disable-oggtest \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(TREMOR_DIR)/.libs: $(TREMOR_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(TREMOR_DIR)
-	touch $@
-
-$(STAGING_DIR)/usr/lib/tremor.so: $(TREMOR_DIR)/.libs
-	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(TREMOR_DIR) install
-	touch $@
-
-$(TARGET_DIR)/usr/lib/tremor.so: $(STAGING_DIR)/usr/lib/tremor.so
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(TREMOR_DIR) \
-		$(if $(BR2_STRIP_none),install,install-strip)
-	touch $@
-
-$(TARGET_DIR)/usr/lib/tremor.a: $(TARGET_DIR)/usr/lib/tremor.so
-	cp -dpf $(TREMOR_DIR)/lib/tremor.a $(TARGET_DIR)/usr/lib/
-	touch $@
-
-tremor libvorbis: host-pkgconfig host-autoconf host-automake libogg $(TARGET_DIR)/usr/lib/tremor.so
-
-tremor-source libvorbis-source: $(DL_DIR)/$(TREMOR_SOURCE)
-
-tremor-clean libvorbis-clean:
-	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(TREMOR_DIR) uninstall
-	-$(MAKE) -C $(TREMOR_DIR) clean
-
-tremor-dirclean libvorbis-dirclean:
-	rm -rf $(TREMOR_DIR)
-
 
 ############################################################
 #
 # Toplevel Makefile options
 #
 ############################################################
-TARGETS+=tremor
-
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+TARGETS+=libvorbis
 endif
diff --git a/package/multimedia/tremor/Config.in b/package/multimedia/tremor/Config.in
new file mode 100644
index 0000000..2e58e09
--- /dev/null
+++ b/package/multimedia/tremor/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_TREMOR
+	bool "tremor (fixed point vorbis decoder)"
+	help
+	  Tremor is a fixed point implementation of an Ogg Vorbis
+          decoder. It provides a decoding API similar to libvorbis,
+          but gives much better performance on systems without a
+          floating-point unit.
diff --git a/package/multimedia/tremor/tremor.mk b/package/multimedia/tremor/tremor.mk
new file mode 100644
index 0000000..b493375
--- /dev/null
+++ b/package/multimedia/tremor/tremor.mk
@@ -0,0 +1,31 @@
+############################################################
+#
+# Tremor (Integer decoder for Vorbis)
+#
+############################################################
+
+TREMOR_TRUNK:=http://svn.xiph.org/trunk/Tremor/
+TREMOR_VERSION:=16259
+TREMOR_NAME:=Tremor-svn-r$(TREMOR_VERSION)
+TREMOR_DIR:=$(BUILD_DIR)/$(TREMOR_NAME)
+TREMOR_SOURCE:=$(TREMOR_NAME).tar.bz2
+TREMOR_CAT=$(BZCAT)
+TREMOR_AUTORECONF = YES
+TREMOR_INSTALL_STAGING = YES
+TREMOR_INSTALL_TARGET = YES
+
+$(DL_DIR)/$(TREMOR_SOURCE):
+	$(SVN_CO) -r $(TREMOR_VERSION) $(TREMOR_TRUNK) $(TREMOR_DIR)
+	tar -cv -C $(BUILD_DIR) $(TREMOR_NAME) | bzip2 - -c > $@
+
+$(eval $(call AUTOTARGETS,package/multimedia,tremor))
+
+
+############################################################
+#
+# Toplevel Makefile options
+#
+############################################################
+ifeq ($(BR2_PACKAGE_TREMOR),y)
+TARGETS+=tremor
+endif
-- 
1.6.5.3
