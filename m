From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Nov 2007 01:43:37 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  speex
Message-ID: <20071129094337.2F46CA611A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-29 01:43:36 -0800 (Thu, 29 Nov 2007)
New Revision: 20579

Log:
Add speex vocoder package

Added:
   trunk/buildroot/package/speex/
   trunk/buildroot/package/speex/Config.in
   trunk/buildroot/package/speex/speex.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-11-29 09:42:06 UTC (rev 20578)
+++ trunk/buildroot/package/Config.in	2007-11-29 09:43:36 UTC (rev 20579)
@@ -281,6 +281,7 @@
 source "package/libvorbis/Config.in"
 source "package/madplay/Config.in"
 source "package/mpg123/Config.in"
+source "package/speex/Config.in"
 endif
 
 menuconfig BR2_GRAPHIC_SUPPORT

Added: trunk/buildroot/package/speex/Config.in
===================================================================
--- trunk/buildroot/package/speex/Config.in	                        (rev 0)
+++ trunk/buildroot/package/speex/Config.in	2007-11-29 09:43:36 UTC (rev 20579)
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_SPEEX
+	bool "speex"
+	default n
+	help
+	  Speex is an Open Source/Free Software patent-free
+	  audio compression format designed for speech.
+	  It can be used for Voice over IP
+
+	  http://www.speex.org/
+
+config BR2_PACKAGE_SPEEX_ARM5E
+	bool "Support ARM5E instruction set"
+	default y
+	depends on BR2_PACKAGE_SPEEX && BR2_arm
+	help
+	  Use the additional instructions available in the ARM5E 
+	  or later cores.

Added: trunk/buildroot/package/speex/speex.mk
===================================================================
--- trunk/buildroot/package/speex/speex.mk	                        (rev 0)
+++ trunk/buildroot/package/speex/speex.mk	2007-11-29 09:43:36 UTC (rev 20579)
@@ -0,0 +1,104 @@
+#############################################################
+#
+# speex
+#
+#############################################################
+
+SPEEX_VERSION=1.2beta2
+
+# Don't alter below this line unless you (think) you know
+# what you are doing! Danger, Danger!
+
+SPEEX_SOURCE=speex-$(SPEEX_VERSION).tar.gz
+SPEEX_CAT:=$(ZCAT)
+SPEEX_SITE=http://downloads.us.xiph.org/releases/speex
+SPEEX_DIR=$(BUILD_DIR)/speex-$(SPEEX_VERSION)
+
+ifeq ($(BR2_PACKAGE_SPEEX_ARM5E),y)
+SPEEX_FOR_ARM5E:=--enable-arm5e-asm
+endif
+
+$(DL_DIR)/$(SPEEX_SOURCE):
+	$(WGET) -P $(DL_DIR) $(SPEEX_SITE)/$(SPEEX_SOURCE)
+
+$(SPEEX_DIR)/.unpacked: $(DL_DIR)/$(SPEEX_SOURCE)
+	$(SPEEX_CAT) $(DL_DIR)/$(SPEEX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(SPEEX_DIR)/.unpacked
+
+$(SPEEX_DIR)/Makefile: $(SPEEX_DIR)/.unpacked
+	rm -f $(SPEEX_DIR)/Makefile
+	mkdir -p $(SPEEX_DIR)
+	(cd $(SPEEX_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(SPEEX_DIR)/configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--includedir=/usr/include \
+		--enable-shared \
+		--enable-fixed-point \
+		$(SPEEX_FOR_ARM5E) \
+		$(DISABLE_NLS); \
+	)
+	$(SED) "s,^OGG_CFLAGS.*,OGG_CFLAGS= -I$(STAGING_DIR)/usr/include,g" $(SPEEX_DIR)/Makefile
+	$(SED) "s,^OGG_LIBS.*,OGG_LIBS= -L$(STAGING_DIR)/usr/lib -logg,g" $(SPEEX_DIR)/Makefile
+	$(SED) "s,^OGG_CFLAGS.*,OGG_CFLAGS= -I$(STAGING_DIR)/usr/include,g" $(SPEEX_DIR)/libspeex/Makefile
+	$(SED) "s,^OGG_LIBS.*,OGG_LIBS= -L$(STAGING_DIR)/usr/lib -logg,g" $(SPEEX_DIR)/libspeex/Makefile
+	$(SED) "s,-I/usr/include,,g" $(SPEEX_DIR)/libspeex/Makefile
+	$(SED) "s,^OGG_CFLAGS.*,OGG_CFLAGS= -I$(STAGING_DIR)/usr/include,g" $(SPEEX_DIR)/src/Makefile
+	$(SED) "s,^OGG_LIBS.*,OGG_LIBS= -L$(STAGING_DIR)/usr/lib -logg,g" $(SPEEX_DIR)/src/Makefile
+	$(SED) "s,-I/usr/include,,g" $(SPEEX_DIR)/src/Makefile
+	$(SED) "s,^OGG_CFLAGS.*,OGG_CFLAGS= -I$(STAGING_DIR)/usr/include,g" $(SPEEX_DIR)/include/Makefile
+	$(SED) "s,^OGG_LIBS.*,OGG_LIBS= -L$(STAGING_DIR)/usr/lib -logg,g" $(SPEEX_DIR)/include/Makefile
+	$(SED) "s,-I/usr/include,,g" $(SPEEX_DIR)/include/Makefile
+	$(SED) "s,^OGG_CFLAGS.*,OGG_CFLAGS= -I$(STAGING_DIR)/usr/include,g" $(SPEEX_DIR)/include/speex/Makefile
+	$(SED) "s,^OGG_LIBS.*,OGG_LIBS= -L$(STAGING_DIR)/usr/lib -logg,g" $(SPEEX_DIR)/include/speex/Makefile
+	$(SED) "s,-I/usr/include,,g" $(SPEEX_DIR)/include/speex/Makefile
+	$(SED) "s,^OGG_CFLAGS.*,OGG_CFLAGS= -I$(STAGING_DIR)/usr/include,g" $(SPEEX_DIR)/doc/Makefile
+	$(SED) "s,^OGG_LIBS.*,OGG_LIBS= -L$(STAGING_DIR)/usr/lib -logg,g" $(SPEEX_DIR)/doc/Makefile
+	$(SED) "s,-I/usr/include,,g" $(SPEEX_DIR)/doc/Makefile
+
+
+
+$(SPEEX_DIR)/speex: $(SPEEX_DIR)/Makefile
+	rm -f $@
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(SPEEX_DIR)
+
+$(SPEEX_DIR)/.installed: $(SPEEX_DIR)/speex
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SPEEX_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libspeex.la
+	touch $@
+
+$(TARGET_DIR)/usr/bin/speexdec: $(SPEEX_DIR)/.installed
+	cp -dpf $(STAGING_DIR)/usr/bin/speexdec $(TARGET_DIR)/usr/bin/speexdec
+
+$(TARGET_DIR)/usr/bin/speexenc: $(TARGET_DIR)/usr/bin/speexdec
+	cp -dpf $(STAGING_DIR)/usr/bin/speexenc $(TARGET_DIR)/usr/bin/speexenc
+
+$(TARGET_DIR)/usr/lib/libspeex.so: $(TARGET_DIR)/usr/bin/speexenc
+	cp -dpf $(STAGING_DIR)/usr/lib/libspeex.so* $(TARGET_DIR)/usr/lib
+
+speex-bins:	
+
+speex: uclibc libogg $(TARGET_DIR)/usr/lib/libspeex.so
+
+speex-source: $(DL_DIR)/$(SPEEX_SOURCE)
+
+speex-clean:
+	@if [ -d $(SPEEX_DIR)/Makefile ]; then \
+		$(MAKE) -C $(SPEEX_DIR) clean; \
+	fi
+
+speex-dirclean:
+	rm -rf $(SPEEX_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_SPEEX)),y)
+TARGETS+=speex
+endif
