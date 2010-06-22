From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jun 2010 22:21:05 +0200
Subject: [Buildroot] [PATCH 11/20] make : convert to autotools infrastructure
In-Reply-To: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
References: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d38d45bb1927ac929acf19a7b44435526de7bc77.1277237892.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: cmchao <cmchao@gmail.com>

Changes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 * Target installation is the default
 * No staging installation is the default

Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/make/make.mk |   75 +++++--------------------------------------------
 1 files changed, 8 insertions(+), 67 deletions(-)

diff --git a/package/make/make.mk b/package/make/make.mk
index 0b2657d..12d236a 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -3,73 +3,14 @@
 # make
 #
 #############################################################
-GNUMAKE_VERSION:=3.81
-GNUMAKE_SOURCE:=make-$(GNUMAKE_VERSION).tar.bz2
-GNUMAKE_SITE:=$(BR2_GNU_MIRROR)/make
-GNUMAKE_DIR:=$(BUILD_DIR)/make-$(GNUMAKE_VERSION)
-GNUMAKE_CAT:=$(BZCAT)
-GNUMAKE_BINARY:=make
-GNUMAKE_TARGET_BINARY:=usr/bin/make
+MAKE_VERSION:=3.81
+MAKE_SOURCE:=make-$(MAKE_VERSION).tar.bz2
+MAKE_SITE:=$(BR2_GNU_MIRROR)/make
 
-$(DL_DIR)/$(GNUMAKE_SOURCE):
-	 $(call DOWNLOAD,$(GNUMAKE_SITE),$(GNUMAKE_SOURCE))
+MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
-make-source: $(DL_DIR)/$(GNUMAKE_SOURCE)
+MAKE_CONF_ENV = make_cv_sys_gnu_glob=no \
+		GLOBINC='-I$(@D)/glob' \
+		GLOBLIB=glob/libglob.a
 
-$(GNUMAKE_DIR)/.unpacked: $(DL_DIR)/$(GNUMAKE_SOURCE)
-	$(GNUMAKE_CAT) $(DL_DIR)/$(GNUMAKE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(GNUMAKE_DIR)/config
-	touch $@
-
-$(GNUMAKE_DIR)/.configured: $(GNUMAKE_DIR)/.unpacked
-	(cd $(GNUMAKE_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		make_cv_sys_gnu_glob=no \
-		GLOBINC='-I$(GNUMAKE_DIR)/glob' \
-		GLOBLIB=glob/libglob.a \
-		./configure $(QUIET) \
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
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(GNUMAKE_DIR)/$(GNUMAKE_BINARY): $(GNUMAKE_DIR)/.configured
-	$(MAKE) MAKE=$(HOSTMAKE) -C $(GNUMAKE_DIR)
-
-$(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY): $(GNUMAKE_DIR)/$(GNUMAKE_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GNUMAKE_DIR) install
-	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-
-make: $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY)
-
-make-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GNUMAKE_DIR) uninstall
-	-$(MAKE) -C $(GNUMAKE_DIR) clean
-
-make-dirclean:
-	rm -rf $(GNUMAKE_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MAKE),y)
-TARGETS+=make
-endif
+$(eval $(call AUTOTARGETS,package,make))
-- 
1.7.0.4
