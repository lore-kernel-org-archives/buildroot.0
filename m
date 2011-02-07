From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Feb 2011 20:28:34 +0100
Subject: [Buildroot] [git commit master 1/1] socat: convert to AUTOTARGETS
Message-ID: <20110208074124.06D868F412@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1c25119a9360fe62c60a89c5e1f64d3defb422d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/socat/Config.in |   24 +----------
 package/socat/socat.mk  |  107 ++++-------------------------------------------
 2 files changed, 10 insertions(+), 121 deletions(-)

diff --git a/package/socat/Config.in b/package/socat/Config.in
index 151b74e..ae88be9 100644
--- a/package/socat/Config.in
+++ b/package/socat/Config.in
@@ -1,28 +1,6 @@
-menuconfig BR2_PACKAGE_SOCAT
+config BR2_PACKAGE_SOCAT
 	bool "socat"
 	help
 	  Multipurpose socket relay program.
 
 	  http://www.dest-unreach.org/socat/
-if BR2_PACKAGE_SOCAT
-config BR2_PACKAGE_SOCAT_PREDEF_CRDLY_SHIFT
-	string "CRDLY_SHIFT"
-	default "9"
-	help
-	  Add configure variable
-
-config BR2_PACKAGE_SOCAT_PREDEF_TABDLY_SHIFT
-	string "TABDLY_SHIFT"
-	default "11"
-	help
-	  Add configure variable
-
-config BR2_PACKAGE_SOCAT_PREDEF_CSIZE_SHIFT
-	string "CSIZE_SHIFT"
-	default "4"
-	help
-	  Add configure variable
-
-endif
-
-
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 2b53d88..5714b8f 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,101 +4,12 @@
 #
 #############################################################
 
-#SOCAT_MAJOR_VERSION=1.4
-#SOCAT_MINOR_VERSION=.0.3
-SOCAT_MAJOR_VERSION=2.0.0-b2
-SOCAT_MINOR_VERSION=
-
-# Don't alter below this line unless you (think) you know
-# what you are doing! Danger, Danger!
-
-SOCAT_SOURCE=socat-$(SOCAT_MAJOR_VERSION)$(SOCAT_MINOR_VERSION).tar.bz2
-SOCAT_CAT:=$(BZCAT)
-SOCAT_SITE=http://www.dest-unreach.org/socat/download/
-#SOCAT_DIR=$(BUILD_DIR)/${shell basename $(SOCAT_SOURCE) .tar.bz2}
-SOCAT_DIR=$(BUILD_DIR)/socat-$(SOCAT_MAJOR_VERSION)
-#SOCAT_WORKDIR=$(BUILD_DIR)/socat_workdir
-SOCAT_WORKDIR=$(SOCAT_DIR)
-
-# SOCAT Configure opts taken from Config/config.Linux-2.6.24.h
-CRDLY_SHIFT := $(call qstrip,$(BR2_PACKAGE_SOCAT_PREDEF_CRDLY_SHIFT))
-TABDLY_SHIFT := $(call qstrip,$(BR2_PACKAGE_SOCAT_PREDEF_TABDLY_SHIFT))
-CSIZE_SHIFT := $(call qstrip,$(BR2_PACKAGE_SOCAT_PREDEF_CSIZE_SHIFT))
-
-SOCAT_CONFIGURE_OPTS :=
-ifneq ($(CRDLY_SHIFT),)
-SOCAT_CONFIGURE_OPTS += sc_cv_sys_crdly_shift=$(CRDLY_SHIFT)
-endif
-ifneq ($(TABDLY_SHIFT),)
-SOCAT_CONFIGURE_OPTS += sc_cv_sys_tabdly_shift=$(TABDLY_SHIFT)
-endif
-ifneq ($(CRDLY_SHIFT),)
-SOCAT_CONFIGURE_OPTS += sc_cv_sys_csize_shift=$(CSIZE_SHIFT)
-endif
-
-$(DL_DIR)/$(SOCAT_SOURCE):
-	$(call DOWNLOAD,$(SOCAT_SITE),$(SOCAT_SOURCE))
-
-$(SOCAT_DIR)/.unpacked: $(DL_DIR)/$(SOCAT_SOURCE)
-	$(SOCAT_CAT) $(DL_DIR)/$(SOCAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SOCAT_DIR) package/socat/ socat-$(SOCAT_MAJOR_VERSION)\*.patch
-	touch $(SOCAT_DIR)/.unpacked
-
-$(SOCAT_WORKDIR)/Makefile: $(SOCAT_DIR)/.unpacked
-	rm -f $(SOCAT_WORKDIR)/Makefile
-	mkdir -p $(SOCAT_WORKDIR)
-	(cd $(SOCAT_WORKDIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(SOCAT_CONFIGURE_OPTS) \
-		$(SOCAT_DIR)/configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--disable-termios \
-		$(DISABLE_NLS); \
-	$(SED) 's/#define HAVE_TERMIOS_ISPEED 1/#undef HAVE_TERMIOS_ISPEED/g' config.h; \
-	)
-
-#	cp $(SOCAT_WORKDIR)/Config/config.Linux-2-6*.h $(SOCAT_WORKDIR)/config.h ; \
-
-
-$(SOCAT_WORKDIR)/socat: $(SOCAT_WORKDIR)/Makefile
-	rm -f $@
-	$(MAKE) -C $(SOCAT_WORKDIR)
-
-$(TARGET_DIR)/usr/bin/socat: $(SOCAT_WORKDIR)/socat
-	mkdir -p $(TARGET_DIR)/usr/man/man1
-	$(MAKE) -C $(SOCAT_WORKDIR) install prefix=$(TARGET_DIR)/usr DESTDIR=$(TARGET_DIR)
-	touch $@
-
-socat: $(TARGET_DIR)/usr/bin/socat
-
-socat-source: $(DL_DIR)/$(SOCAT_SOURCE)
-
-socat-clean:
-	-$(MAKE) -C $(SOCAT_WORKDIR) clean
-	rm -f $(TARGET_DIR)/usr/bin/{socat,filan,procan}
-
-socat-dirclean:
-	rm -rf $(SOCAT_DIR) $(SOCAT_WORKDIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_SOCAT),y)
-TARGETS+=socat
-endif
+SOCAT_VERSION = 2.0.0-b2
+SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
+SOCAT_SITE = http://www.dest-unreach.org/socat/download/
+SOCAT_CONF_ENV = sc_cv_termios_ispeed=no \
+		 sc_cv_sys_crdly_shift=9 \
+		 sc_cv_sys_tabdly_shift=11 \
+		 sc_cv_sys_csize_shift=4
+
+$(eval $(call AUTOTARGETS,package,socat))
-- 
1.7.3.4
