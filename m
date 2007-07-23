From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 05:03:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsa-utils
Message-ID: <20070723120325.43DBFA6ABD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 05:03:24 -0700 (Mon, 23 Jul 2007)
New Revision: 19224

Log:
cleanup alsa-utils

Modified:
   trunk/buildroot/package/alsa-utils/alsa-utils.mk


Changeset:
Modified: trunk/buildroot/package/alsa-utils/alsa-utils.mk
===================================================================
--- trunk/buildroot/package/alsa-utils/alsa-utils.mk	2007-07-23 12:03:17 UTC (rev 19223)
+++ trunk/buildroot/package/alsa-utils/alsa-utils.mk	2007-07-23 12:03:24 UTC (rev 19224)
@@ -3,10 +3,10 @@
 # alsa-utils
 #
 #############################################################
-ALSA_UTILS_VER:=1.0.14
-ALSA_UTILS_SOURCE:=alsa-utils-$(ALSA_UTILS_VER).tar.bz2
+ALSA_UTILS_VERSION:=1.0.14
+ALSA_UTILS_SOURCE:=alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE:=ftp://ftp.alsa-project.org/pub/utils
-ALSA_UTILS_DIR:=$(BUILD_DIR)/alsa-utils-$(ALSA_UTILS_VER)
+ALSA_UTILS_DIR:=$(BUILD_DIR)/alsa-utils-$(ALSA_UTILS_VERSION)
 ALSA_UTILS_CAT:=$(BZCAT)
 ALSA_UTILS_BINARY:=alsactl/alsactl
 ALSA_UTILS_TARGET_BINARY:=usr/sbin/alsactl
@@ -16,13 +16,14 @@
 
 $(ALSA_UTILS_DIR)/.unpacked: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
 	$(ALSA_UTILS_CAT) $(DL_DIR)/$(ALSA_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/alsa-utils/ alsa-utils-$(ALSA_UTILS_VER)\*.patch\*
+	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/alsa-utils/ alsa-utils-$(ALSA_UTILS_VERSION)\*.patch\*
 	$(CONFIG_UPDATE) $(ALSA_UTILS_DIR)
-	@touch $(ALSA_UTILS_DIR)/.unpacked
+	touch $@
 
 $(ALSA_UTILS_DIR)/.configured: $(ALSA_UTILS_DIR)/.unpacked
 	(cd $(ALSA_UTILS_DIR); \
 		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
@@ -31,11 +32,11 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 	);
-	@touch $@
+	touch $@
 
 $(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY): $(ALSA_UTILS_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(ALSA_UTILS_DIR)
-	@touch -c $@
+	touch -c $@
 
 ALSA_UTILS_TARGETS_ :=
 ALSA_UTILS_TARGETS_y :=
@@ -57,18 +58,18 @@
 
 $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY): $(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(ALSA_UTILS_DIR) install
-	@mkdir -p $(TARGET_DIR)/usr/bin
-	@mkdir -p $(TARGET_DIR)/usr/sbin
+	mkdir -p $(TARGET_DIR)/usr/bin
+	mkdir -p $(TARGET_DIR)/usr/sbin
 	for file in $(ALSA_UTILS_TARGETS_y) ; do \
 		cp -dpf $(STAGING_DIR)/$$file $(TARGET_DIR)/$$file; \
 	done
-	@if [ -x "$(TARGET_DIR)/usr/bin/speaker-test" ] ; then \
+	if [ -x "$(TARGET_DIR)/usr/bin/speaker-test" ] ; then \
 		mkdir -p $(TARGET_DIR)/usr/share/alsa/speaker-test; \
 		mkdir -p $(TARGET_DIR)/usr/share/sounds/alsa; \
 		cp -rdpf $(STAGING_DIR)/usr/share/alsa/speaker-test/* $(TARGET_DIR)/usr/share/alsa/speaker-test/; \
 		cp -rdpf $(STAGING_DIR)/usr/share/sounds/alsa/* $(TARGET_DIR)/usr/share/sounds/alsa/; \
 	fi;
-	@touch -c $@
+	touch -c $@
 
 alsa-utils: uclibc alsa-lib ncurses $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
 
