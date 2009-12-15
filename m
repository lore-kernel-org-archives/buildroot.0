From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:48 +0100
Subject: [Buildroot] [PATCH 17/39] pango: convert to autotools
	infrastructure for host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1a929ec24151f8d4b891973afca34e4380fcfac5.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.mk |   56 ++++++++---------------------------------------
 1 files changed, 10 insertions(+), 46 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 6a86013..38e163e 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -40,8 +40,17 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 PANGO_CONF_OPT = --enable-shared --enable-static \
 		--enable-explicit-deps=no --disable-debug
 
+HOST_PANGO_CONF_OPT = \
+		--disable-static \
+		$(if $(BR2_PACKAGE_XORG7),--with-x,--without-x) \
+		--disable-debug \
+
 PANGO_DEPENDENCIES = gettext libintl host-pkg-config host-pango libglib2 cairo
 
+HOST_PANGO_DEPENDENCIES = host-pkg-config host-cairo host-libglib2 host-autoconf host-automake
+
+HOST_PANGO_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
         PANGO_CONF_OPT += --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
@@ -52,6 +61,7 @@ else
 endif
 
 $(eval $(call AUTOTARGETS,package,pango))
+$(eval $(call AUTOTARGETS,package,pango,host))
 
 $(PANGO_HOOK_POST_INSTALL):
 	mkdir -p $(TARGET_DIR)/etc/pango
@@ -59,50 +69,4 @@ $(PANGO_HOOK_POST_INSTALL):
 	$(SED) 's~$(HOST_DIR)~~g' $(TARGET_DIR)/etc/pango/pango.modules
 	touch $@
 
-# pango for the host
-PANGO_HOST_DIR:=$(BUILD_DIR)/pango-$(PANGO_VERSION)-host
 PANGO_HOST_BINARY:=$(HOST_DIR)/usr/bin/pango-querymodules
-
-$(DL_DIR)/$(PANGO_SOURCE):
-	$(call DOWNLOAD,$(PANGO_SITE),$(PANGO_SOURCE))
-
-$(STAMP_DIR)/host_pango_unpacked: $(DL_DIR)/$(PANGO_SOURCE)
-	mkdir -p $(PANGO_HOST_DIR)
-	$(INFLATE$(suffix $(PANGO_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(PANGO_HOST_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(PANGO_HOST_DIR) package/pango/ \*.patch
-	touch $@
-
-$(STAMP_DIR)/host_pango_configured: $(STAMP_DIR)/host_pango_unpacked $(STAMP_DIR)/host_cairo_installed $(STAMP_DIR)/host_libglib2_installed $(STAMP_DIR)/host_autoconf_installed  $(STAMP_DIR)/host_automake_installed
-	(cd $(PANGO_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-		--disable-static \
-		$(if $(BR2_PACKAGE_XORG7),--with-x,--without-x) \
-		--disable-debug \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_pango_compiled: $(STAMP_DIR)/host_pango_configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(PANGO_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_pango_installed: $(STAMP_DIR)/host_pango_compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(PANGO_HOST_DIR) install
-	touch $@
-
-host-pango: $(STAMP_DIR)/host_pango_installed
-
-host-pango-source: pango-source
-
-host-pango-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_pango_,unpacked configured compiled installed)
-	-$(MAKE) -C $(PANGO_HOST_DIR) uninstall
-	-$(MAKE) -C $(PANGO_HOST_DIR) clean
-
-host-pango-dirclean:
-	rm -rf $(PANGO_HOST_DIR)
-- 
1.6.3.3
