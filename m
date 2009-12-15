From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:47 +0100
Subject: [Buildroot] [PATCH 16/39] libtool: convert to autotools
	infrastructure for host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <54ac0a4fb1995db36c08e1735432538e4026775c.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtool/libtool.mk |   51 ++++++-------------------------------------
 1 files changed, 7 insertions(+), 44 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 14d0835..bbabbb0 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -11,54 +11,17 @@ ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
 LIBTOOL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 endif
 
-$(eval $(call AUTOTARGETS,package,libtool))
-
-# libtool for the host
-LIBTOOL_HOST_DIR:=$(BUILD_DIR)/libtool-$(LIBTOOL_VERSION)-host
-
-# variables used by other packages
-LIBTOOL:=$(HOST_DIR)/usr/bin/libtool
-
-$(DL_DIR)/$(LIBTOOL_SOURCE):
-	$(call DOWNLOAD,$(LIBTOOL_SITE),$(LIBTOOL_SOURCE))
-
-$(STAMP_DIR)/host_libtool_unpacked: $(DL_DIR)/$(LIBTOOL_SOURCE)
-	mkdir -p $(LIBTOOL_HOST_DIR)
-	$(INFLATE$(suffix $(LIBTOOL_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LIBTOOL_HOST_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBTOOL_HOST_DIR) package/libtool/ \*.patch
-	touch $@
-
-$(STAMP_DIR)/host_libtool_configured: $(STAMP_DIR)/host_libtool_unpacked
-	(cd $(LIBTOOL_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-		--disable-static \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_libtool_compiled: $(STAMP_DIR)/host_libtool_configured
-	$(MAKE) -C $(LIBTOOL_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_libtool_installed: $(STAMP_DIR)/host_libtool_compiled
-	$(MAKE) -C $(LIBTOOL_HOST_DIR) install
+define HOST_LIBTOOL_CUSTOM_INSTALL
 	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/libtool.m4 \
 		$(STAGING_DIR)/usr/share/aclocal/libtool.m4
 	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/ltdl.m4 \
 		$(STAGING_DIR)/usr/share/aclocal/ltdl.m4
-	touch $@
+endef
 
-host-libtool: $(STAMP_DIR)/host_libtool_installed
+HOST_LIBTOOL_POST_INSTALL_HOOKS += HOST_LIBTOOL_CUSTOM_INSTALL
 
-host-libtool-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_libtool_,unpacked configured compiled installed)
-	-$(MAKE) -C $(LIBTOOL_HOST_DIR) uninstall
-	-$(MAKE) -C $(LIBTOOL_HOST_DIR) clean
+$(eval $(call AUTOTARGETS,package,libtool))
+$(eval $(call AUTOTARGETS,package,libtool,host))
 
-host-libtool-dirclean:
-	rm -rf $(LIBTOOL_HOST_DIR)
+# variables used by other packages
+LIBTOOL:=$(HOST_DIR)/usr/bin/libtool
-- 
1.6.3.3
