From: Martin Banky <martin.banky@gmail.com>
Date: Tue,  5 Oct 2010 01:22:41 -0700
Subject: [Buildroot] [PATCH 08/10] alsa-utils: convert to autotargets and
	bump to 1.0.23
In-Reply-To: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286266963-23413-8-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/multimedia/alsa-utils/alsa-utils.mk |   96 ++++++---------------------
 1 files changed, 20 insertions(+), 76 deletions(-)

diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 3d1b0ef..9bac6b8 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -3,52 +3,23 @@
 # alsa-utils
 #
 #############################################################
-ALSA_UTILS_VERSION:=1.0.22
-ALSA_UTILS_SOURCE:=alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
-ALSA_UTILS_SITE:=ftp://ftp.alsa-project.org/pub/utils
-ALSA_UTILS_DIR:=$(BUILD_DIR)/alsa-utils-$(ALSA_UTILS_VERSION)
-ALSA_UTILS_CAT:=$(BZCAT)
-ALSA_UTILS_BINARY:=alsactl/alsactl
-ALSA_UTILS_TARGET_BINARY:=usr/sbin/alsactl
+ALSA_UTILS_VERSION = 1.0.23
+ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
+ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
+ALSA_UTILS_INSTALL_STAGING = YES
+ALSA_UTILS_DEPENDENCIES = alsa-lib \
+		$(if $(BR2_PACKAGE_NCURSES),ncurses) \
+		$(if $(BR2_PACKAGE_LIBINTL),libintl) \
+		$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-ALSA_UTILS_CONFIGURE_OPTS =
-ifneq ($(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER),y)
-ALSA_UTILS_CONFIGURE_OPTS += --disable-alsamixer --disable-alsatest
-endif
-
-$(DL_DIR)/$(ALSA_UTILS_SOURCE):
-	$(call DOWNLOAD,$(ALSA_UTILS_SITE),$(ALSA_UTILS_SOURCE))
-
-$(ALSA_UTILS_DIR)/.unpacked: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
-	$(ALSA_UTILS_CAT) $(DL_DIR)/$(ALSA_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/multimedia/alsa-utils/ alsa-utils-$(ALSA_UTILS_VERSION)\*.patch
-	$(CONFIG_UPDATE) $(ALSA_UTILS_DIR)
-	touch $@
+ALSA_UTILS_CONF_ENV = ac_cv_prog_ncurses5_config=$(STAGING_DIR)/bin/ncurses5-config
 
-$(ALSA_UTILS_DIR)/.configured: $(ALSA_UTILS_DIR)/.unpacked
-	(cd $(ALSA_UTILS_DIR); rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		ac_cv_prog_ncurses5_config=$(STAGING_DIR)/bin/ncurses5-config \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(ALSA_UTILS_CONFIGURE_OPTS) \
-		--disable-xmlto \
-		--with-curses=ncurses \
-	)
-	touch $@
+ALSA_UTILS_CONF_OPT = --disable-xmlto \
+		--with-curses=ncurses
 
-$(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY): $(ALSA_UTILS_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" -C $(ALSA_UTILS_DIR)
-	touch -c $@
-
-ALSA_UTILS_TARGETS_ :=
-ALSA_UTILS_TARGETS_y :=
+ifneq ($(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER),y)
+ALSA_UTILS__CONF_OPT += --disable-alsamixer --disable-alsatest
+endif
 
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACONF) += usr/sbin/alsaconf
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACTL) += usr/sbin/alsactl
@@ -65,13 +36,10 @@ ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ASEQDUMP) += usr/bin/aseqdump
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ASEQNET) += usr/bin/aseqnet
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST) += usr/bin/speaker-test
 
-$(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY): $(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(ALSA_UTILS_DIR) install
-	mkdir -p $(TARGET_DIR)/usr/bin
-	mkdir -p $(TARGET_DIR)/usr/sbin
-	for file in $(ALSA_UTILS_TARGETS_y); do \
-		cp -dpf $(STAGING_DIR)/$$file $(TARGET_DIR)/$$file; \
-	done
+define ALSA_UTILS_INSTALL_TARGET_CMDS
+	test -z "$(ALSA_UTILS_INSTALL_FILES_y)" || \
+		install -D -m 755 $(addprefix $(STAGING_DIR)/,$(ALSA_UTILS_TARGETS_y)) \
+		$(TARGET_DIR)/usr/bin/
 	if [ -x "$(TARGET_DIR)/usr/bin/speaker-test" ]; then \
 		mkdir -p $(TARGET_DIR)/usr/share/alsa/speaker-test; \
 		mkdir -p $(TARGET_DIR)/usr/share/sounds/alsa; \
@@ -83,30 +51,6 @@ $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY): $(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY
 		rm -rf $(TARGET_DIR)/usr/share/alsa/; \
 		cp -rdpf $(STAGING_DIR)/usr/share/alsa/ $(TARGET_DIR)/usr/share/alsa/; \
 	fi
-	touch -c $@
-
-alsa-utils: alsa-lib $(if $(BR2_PACKAGE_NCURSES),ncurses) $(if $(BR2_PACKAGE_LIBINTL),libintl) $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
+endef
 
-alsa-utils-unpacked: $(ALSA_UTILS_DIR)/.unpacked
-
-alsa-utils-source: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
-
-alsa-utils-clean:
-	for file in $(ALSA_UTILS_TARGETS_y); do \
-		rm -f $(TARGET_DIR)/$$file; \
-	done
-	for file in $(ALSA_UTILS_TARGETS_); do \
-		rm -f $(TARGET_DIR)/$$file; \
-	done
-	-$(MAKE) -C $(ALSA_UTILS_DIR) clean
-
-alsa-utils-dirclean:
-	rm -rf $(ALSA_UTILS_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_ALSA_UTILS),y)
-TARGETS+=alsa-utils
-endif
+$(eval $(call AUTOTARGETS,package/multimedia,alsa-utils))
-- 
1.7.3.1
