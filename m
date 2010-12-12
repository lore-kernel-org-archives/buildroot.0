From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 22:54:00 +0100
Subject: [Buildroot] [PATCH 14/19] alsa-utils: convert to autotargets and
	bump to 1.0.23
In-Reply-To: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b2db2b281805e4b65934c67126980de64b374ac1.1292190675.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Martin Banky <martin.banky@gmail.com>

[ Thomas: remove all patches, since they have been merged. Implement
  the target uninstallation step, fix many issues. ]

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...tils-1.0.18-check-if-__use_bsd-is-defined.patch |   13 ---
 .../alsa-utils-1.0.18-fix-intl-support.patch       |   11 --
 .../alsa-utils-1.0.18-fix_sysv_legacy.patch        |   20 ----
 .../alsa-utils/alsa-utils-1.0.18-remove_man.patch  |   11 --
 package/multimedia/alsa-utils/alsa-utils.mk        |   99 +++++---------------
 5 files changed, 24 insertions(+), 130 deletions(-)
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-check-if-__use_bsd-is-defined.patch
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-fix-intl-support.patch
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-fix_sysv_legacy.patch
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-remove_man.patch

diff --git a/package/multimedia/alsa-utils/alsa-utils-1.0.18-check-if-__use_bsd-is-defined.patch b/package/multimedia/alsa-utils/alsa-utils-1.0.18-check-if-__use_bsd-is-defined.patch
deleted file mode 100644
index f0d3209..0000000
--- a/package/multimedia/alsa-utils/alsa-utils-1.0.18-check-if-__use_bsd-is-defined.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: alsa-utils-1.0.18/alsactl/init_sysdeps.c
-===================================================================
---- alsa-utils-1.0.18.orig/alsactl/init_sysdeps.c	2008-12-01 08:27:16.000000000 +0100
-+++ alsa-utils-1.0.18/alsactl/init_sysdeps.c	2008-12-01 08:27:22.000000000 +0100
-@@ -17,7 +17,7 @@
-  *
-  */
- 
--#ifdef __GLIBC__
-+#if defined(__GLIBC__) && !defined(__USE_BSD)
- static size_t strlcpy(char *dst, const char *src, size_t size)
- {
- 	size_t bytes = 0;
diff --git a/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix-intl-support.patch b/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix-intl-support.patch
deleted file mode 100644
index 317c472..0000000
--- a/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix-intl-support.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/seq/aseqnet/Makefile.in
-+++ b/seq/aseqnet/Makefile.in
-@@ -252,7 +252,7 @@ clean-binPROGRAMS:
- 	-test -z "$(bin_PROGRAMS)" || rm -f $(bin_PROGRAMS)
- aseqnet$(EXEEXT): $(aseqnet_OBJECTS) $(aseqnet_DEPENDENCIES) 
- 	@rm -f aseqnet$(EXEEXT)
--	$(LINK) $(aseqnet_LDFLAGS) $(aseqnet_OBJECTS) $(aseqnet_LDADD) $(LIBS)
-+	$(LINK) $(aseqnet_LDFLAGS) $(aseqnet_OBJECTS) $(aseqnet_LDADD) $(LIBS) $(INTLLIBS)
- 
- mostlyclean-compile:
- 	-rm -f *.$(OBJEXT)
diff --git a/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix_sysv_legacy.patch b/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix_sysv_legacy.patch
deleted file mode 100644
index c6135b4..0000000
--- a/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix_sysv_legacy.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- a/alsactl/init_parse.c	2009-01-15 10:44:48.000000000 +0000
-+++ b/alsactl/init_parse.c	2009-01-15 10:46:41.000000000 +0000
-@@ -381,7 +381,7 @@ static int set_ctl_value(struct space *s
- 				snd_ctl_elem_value_set_integer(space->ctl_value, idx, val);
- 			} else if (items > 2 && value[items-2] == 'd' && value[items-1] == 'B') {
- 				val = strtol(value, NULL, 0) * 100;
--				if ((pos2 = index(value, '.')) != NULL) {
-+				if ((pos2 = strchr(value, '.')) != NULL) {
- 					if (isdigit(*(pos2-1)) && isdigit(*(pos2-2))) {
- 						if (val < 0)
- 							val -= strtol(pos2 + 1, NULL, 0);
-@@ -1253,7 +1253,7 @@ static char *new_root_dir(const char *fi
- 
- 	res = strdup(filename);
- 	if (res) {
--		tmp = rindex(res, '/');
-+		tmp = strrchr(res, '/');
- 		if (tmp)
- 			*tmp = '\0';
- 	}
diff --git a/package/multimedia/alsa-utils/alsa-utils-1.0.18-remove_man.patch b/package/multimedia/alsa-utils/alsa-utils-1.0.18-remove_man.patch
deleted file mode 100644
index a7d4679..0000000
--- a/package/multimedia/alsa-utils/alsa-utils-1.0.18-remove_man.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/alsactl/Makefile.in	2009-01-15 10:59:38.000000000 +0000
-+++ b/alsactl/Makefile.in	2009-01-15 10:59:34.000000000 +0000
-@@ -204,7 +204,7 @@ sharedstatedir = @sharedstatedir@
- sysconfdir = @sysconfdir@
- target_alias = @target_alias@
- SUBDIRS = init
--man_MANS = alsactl.1 alsactl_init.7
-+man_MANS = alsactl.1
- EXTRA_DIST = alsactl.1 alsactl_init.xml
- alsactl_SOURCES = alsactl.c state.c utils.c init_parse.c
- noinst_HEADERS = alsactl.h list.h init_sysdeps.c init_utils_string.c init_utils_run.c init_sysfs.c
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 3d1b0ef..bcaf95b 100644
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
+	$(if $(BR2_PACKAGE_NCURSES),ncurses)
 
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
+ALSA_UTILS_CONF_ENV = \
+	ac_cv_prog_ncurses5_config=$(STAGING_DIR)/bin/ncurses5-config
 
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
+ALSA_UTILS_CONF_OPT = \
+	--disable-xmlto \
+	--with-curses=ncurses
 
-$(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY): $(ALSA_UTILS_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" -C $(ALSA_UTILS_DIR)
-	touch -c $@
-
-ALSA_UTILS_TARGETS_ :=
-ALSA_UTILS_TARGETS_y :=
+ifneq ($(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER),y)
+ALSA_UTILS_CONF_OPT += --disable-alsamixer --disable-alsatest
+endif
 
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACONF) += usr/sbin/alsaconf
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACTL) += usr/sbin/alsactl
@@ -64,14 +35,12 @@ ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI) += usr/bin/arecordmidi
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ASEQDUMP) += usr/bin/aseqdump
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ASEQNET) += usr/bin/aseqnet
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST) += usr/bin/speaker-test
+ALSA_UTILS_TARGETS_ += $(ALSA_UTILS_TARGETS_y)
 
-$(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY): $(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(ALSA_UTILS_DIR) install
-	mkdir -p $(TARGET_DIR)/usr/bin
-	mkdir -p $(TARGET_DIR)/usr/sbin
-	for file in $(ALSA_UTILS_TARGETS_y); do \
-		cp -dpf $(STAGING_DIR)/$$file $(TARGET_DIR)/$$file; \
-	done
+define ALSA_UTILS_INSTALL_TARGET_CMDS
+	test -z "$(ALSA_UTILS_TARGETS_y)" || \
+		install -D -m 755 $(addprefix $(STAGING_DIR)/,$(ALSA_UTILS_TARGETS_y)) \
+		$(TARGET_DIR)/usr/bin/
 	if [ -x "$(TARGET_DIR)/usr/bin/speaker-test" ]; then \
 		mkdir -p $(TARGET_DIR)/usr/share/alsa/speaker-test; \
 		mkdir -p $(TARGET_DIR)/usr/share/sounds/alsa; \
@@ -83,30 +52,10 @@ $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY): $(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY
 		rm -rf $(TARGET_DIR)/usr/share/alsa/; \
 		cp -rdpf $(STAGING_DIR)/usr/share/alsa/ $(TARGET_DIR)/usr/share/alsa/; \
 	fi
-	touch -c $@
-
-alsa-utils: alsa-lib $(if $(BR2_PACKAGE_NCURSES),ncurses) $(if $(BR2_PACKAGE_LIBINTL),libintl) $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
+endef
 
-alsa-utils-unpacked: $(ALSA_UTILS_DIR)/.unpacked
+define ALSA_UTILS_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR),$(ALSA_UTILS_TARGET_))
+endef
 
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
1.7.0.4
