From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 01:10:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  alsa-utils
Message-ID: <20070723081054.1A77CA65F4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 01:10:52 -0700 (Mon, 23 Jul 2007)
New Revision: 19200

Log:
Add alsa-utils package

Added:
   trunk/buildroot/package/alsa-utils/
   trunk/buildroot/package/alsa-utils/Config.in
   trunk/buildroot/package/alsa-utils/alsa-utils.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-23 07:59:56 UTC (rev 19199)
+++ trunk/buildroot/package/Config.in	2007-07-23 08:10:52 UTC (rev 19200)
@@ -247,6 +247,7 @@
 
 if BR2_AUDIO_SUPPORT
 source "package/alsa-lib/Config.in"
+source "package/alsa-utils/Config.in"
 source "package/asterisk/Config.in"
 source "package/aumix/Config.in"
 source "package/libid3tag/Config.in"
@@ -256,6 +257,16 @@
 source "package/mpg123/Config.in"
 endif
 
+menuconfig BR2_VIDEO_SUPPORT
+	bool "Video libraries and applications"
+	default y
+	help
+	  Support for video libraries and applications
+
+if BR2_VIDEO_SUPPORT
+source "package/mplayer/Config.in"
+endif
+
 menuconfig BR2_GRAPHIC_SUPPORT
 	bool "Graphic libraries and applications (graphic/text)"
 	default y

Added: trunk/buildroot/package/alsa-utils/Config.in
===================================================================
--- trunk/buildroot/package/alsa-utils/Config.in	                        (rev 0)
+++ trunk/buildroot/package/alsa-utils/Config.in	2007-07-23 08:10:52 UTC (rev 19200)
@@ -0,0 +1,85 @@
+config BR2_PACKAGE_ALSA_UTILS
+	bool "alsa-utils"
+	default n
+	depends on BR2_PACKAGE_ALSA_LIB
+	depends on BR2_PACKAGE_NCURSES
+	help
+	  This package contains the command line utilities for the ALSA
+	  project.
+
+	  http://www.alsa-project.org/
+
+menu "ALSA utils selection"
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_ALSACONF
+	bool "alsaconf"
+	default n
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_ALSACTL
+	bool "alsactl"
+	default y
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
+	bool "alsamixer"
+	default y
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_AMIDI
+	bool "amidi"
+	default n
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_AMIXER
+	bool "amixer"
+	default n
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_APLAY
+	bool "aplay"
+	default n
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_ARECORD
+	bool "arecord"
+	default n
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_IECSET
+	bool "iecset"
+	default n
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_ACONNECT
+	bool "aconnect"
+	default n
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_APLAYMIDI
+	bool "aplaymidi"
+	default n
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI
+	bool "arecordmidi"
+	default n
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_ASEQDUMP
+	bool "aseqdump"
+	default n
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_ASEQNET
+	bool "aseqnet"
+	default n
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+config BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST
+	bool "speaker-test"
+	default n
+	depends on BR2_PACKAGE_ALSA_UTILS
+
+endmenu

Added: trunk/buildroot/package/alsa-utils/alsa-utils.mk
===================================================================
--- trunk/buildroot/package/alsa-utils/alsa-utils.mk	                        (rev 0)
+++ trunk/buildroot/package/alsa-utils/alsa-utils.mk	2007-07-23 08:10:52 UTC (rev 19200)
@@ -0,0 +1,93 @@
+#############################################################
+#
+# alsa-utils
+#
+#############################################################
+ALSA_UTILS_VER:=1.0.14
+ALSA_UTILS_SOURCE:=alsa-utils-$(ALSA_UTILS_VER).tar.bz2
+ALSA_UTILS_SITE:=ftp://ftp.alsa-project.org/pub/utils
+ALSA_UTILS_DIR:=$(BUILD_DIR)/alsa-utils-$(ALSA_UTILS_VER)
+ALSA_UTILS_CAT:=$(BZCAT)
+ALSA_UTILS_BINARY:=alsactl/alsactl
+ALSA_UTILS_TARGET_BINARY:=usr/sbin/alsactl
+
+$(DL_DIR)/$(ALSA_UTILS_SOURCE):
+	$(WGET) -P $(DL_DIR) $(ALSA_UTILS_SITE)/$(ALSA_UTILS_SOURCE)
+
+$(ALSA_UTILS_DIR)/.unpacked: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
+	$(ALSA_UTILS_CAT) $(DL_DIR)/$(ALSA_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/alsa-utils/ alsa-utils-$(ALSA_UTILS_VER)\*.patch\*
+	$(CONFIG_UPDATE) $(ALSA_UTILS_DIR)
+	@touch $(ALSA_UTILS_DIR)/.unpacked
+
+$(ALSA_UTILS_DIR)/.configured: $(ALSA_UTILS_DIR)/.unpacked
+	(cd $(ALSA_UTILS_DIR); \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+	);
+	@touch $@
+
+$(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY): $(ALSA_UTILS_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(ALSA_UTILS_DIR)
+	@touch -c $@
+
+ALSA_UTILS_TARGETS_ :=
+ALSA_UTILS_TARGETS_y :=
+
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACONF)	+= usr/sbin/alsaconf
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACTL)	+= usr/sbin/alsactl
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER)	+= usr/bin/alsamixer
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIDI)	+= usr/bin/amidi
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIXER)	+= usr/bin/amixer
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_APLAY)	+= usr/bin/aplay
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ARECORD)	+= usr/bin/arecord
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_IECSET)	+= usr/bin/iecset
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ACONNECT)	+= usr/bin/aconnect
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_APLAYMIDI)	+= usr/bin/aplaymidi
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI)	+= usr/bin/arecordmidi
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ASEQDUMP)	+= usr/bin/aseqdump
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ASEQNET)	+= usr/bin/aseqnet
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST)	+= usr/bin/speaker-test
+
+$(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY): $(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY)
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(ALSA_UTILS_DIR) install
+	@mkdir -p $(TARGET_DIR)/usr/bin
+	@mkdir -p $(TARGET_DIR)/usr/sbin
+	for file in $(ALSA_UTILS_TARGETS_y) ; do \
+		cp -dpf $(STAGING_DIR)/$$file $(TARGET_DIR)/$$file; \
+	done
+	@if [ -x "$(TARGET_DIR)/usr/bin/speaker-test" ] ; then \
+		mkdir -p $(TARGET_DIR)/usr/share/alsa/speaker-test; \
+		mkdir -p $(TARGET_DIR)/usr/share/sounds/alsa; \
+		cp -rdpf $(STAGING_DIR)/usr/share/alsa/speaker-test/* $(TARGET_DIR)/usr/share/alsa/speaker-test/; \
+		cp -rdpf $(STAGING_DIR)/usr/share/sounds/alsa/* $(TARGET_DIR)/usr/share/sounds/alsa/; \
+	fi;
+	@touch -c $@
+
+alsa-utils: uclibc alsa-lib ncurses $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
+
+alsa-utils-clean:
+	for file in $(ALSA_UTILS_TARGETS_y) ; do \
+		rm -f $(TARGET_DIR)/$$file; \
+	done
+	for file in $(ALSA_UTILS_TARGETS_) ; do \
+		rm -f $(TARGET_DIR)/$$file; \
+	done
+	-$(MAKE) -C $(ALSA_UTILS_DIR) clean
+
+alsa-utils-dirclean:
+	rm -rf $(ALSA_UTILS_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_ALSA_UTILS)),y)
+TARGETS+=alsa-utils
+endif
