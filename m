From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 13 Jun 2007 03:07:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  aumix
Message-ID: <20070613100719.3501248025@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-06-13 03:07:16 -0700 (Wed, 13 Jun 2007)
New Revision: 18812

Log:
aumix package

Added:
   trunk/buildroot/package/aumix/
   trunk/buildroot/package/aumix/Config.in
   trunk/buildroot/package/aumix/aumix.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-06-13 09:24:50 UTC (rev 18811)
+++ trunk/buildroot/package/Config.in	2007-06-13 10:07:16 UTC (rev 18812)
@@ -240,6 +240,7 @@
 
 if BR2_AUDIO_SUPPORT
 source "package/asterisk/Config.in"
+source "package/aumix/Config.in"
 source "package/libid3tag/Config.in"
 source "package/libmad/Config.in"
 source "package/libsndfile/Config.in"

Added: trunk/buildroot/package/aumix/Config.in
===================================================================
--- trunk/buildroot/package/aumix/Config.in	                        (rev 0)
+++ trunk/buildroot/package/aumix/Config.in	2007-06-13 10:07:16 UTC (rev 18812)
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_AUMIX
+	bool "aumix"
+	default n
+	select BR2_PACKAGE_NCURSES
+	help
+	  aumix is a small, easy-to-use program to control the mixer
+	  of your sound card. It runs in text mode using the ncurses
+	  library, or from the command line (non-interactively).
+	  It can read default settings from a file, and it can also
+	  automatically save and restore the mixer settings at shutdown
+	  and boot.
+
+	  http://jpj.net/~trevor/aumix.html

Added: trunk/buildroot/package/aumix/aumix.mk
===================================================================
--- trunk/buildroot/package/aumix/aumix.mk	                        (rev 0)
+++ trunk/buildroot/package/aumix/aumix.mk	2007-06-13 10:07:16 UTC (rev 18812)
@@ -0,0 +1,65 @@
+#############################################################
+#
+# aumix
+#
+#############################################################
+
+AUMIX_VERSION=2.8
+AUMIX_SOURCE=aumix-$(AUMIX_VERSION).tar.bz2
+AUMIX_SITE=http://jpj.net/~trevor/aumix
+AUMIX_DIR=$(BUILD_DIR)/aumix-$(AUMIX_VERSION)
+AUMIX_CAT:=$(BZCAT)
+
+$(DL_DIR)/$(AUMIX_SOURCE):
+	$(WGET) -P $(DL_DIR) $(AUMIX_SITE)/$(AUMIX_SOURCE)
+
+$(AUMIX_DIR)/.unpacked: $(DL_DIR)/$(AUMIX_SOURCE)
+	$(AUMIX_CAT) $(DL_DIR)/$(AUMIX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(AUMIX_DIR)/.unpacked
+
+$(AUMIX_DIR)/.configured: $(AUMIX_DIR)/.unpacked
+	(cd $(AUMIX_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--libdir=$(STAGING_DIR)/lib \
+		--includedir=$(STAGING_DIR)/include \
+		--without-gtk \
+		--without-gtk1 \
+		--without-alsa \
+		--without-gpm \
+		--without-sysmouse \
+		$(DISABLE_NLS) \
+	);
+	touch $(AUMIX_DIR)/.configured
+
+$(AUMIX_DIR)/src/aumix: $(AUMIX_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(AUMIX_DIR)
+
+$(AUMIX_DIR)/.installed: $(AUMIX_DIR)/src/aumix
+	$(MAKE) -C $(AUMIX_DIR) DESTDIR=$(TARGET_DIR) install
+	touch $(AUMIX_DIR)/.installed
+
+aumix: uclibc ncurses $(AUMIX_DIR)/.installed
+
+aumix-source: $(DL_DIR)/$(AUMIX_SOURCE)
+
+aumix-clean:
+	-$(MAKE) -C $(AUMIX_DIR) clean
+
+aumix-dirclean:
+	rm -rf $(AUMIX_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_AUMIX)),y)
+TARGETS+=aumix
+endif
