From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:59 +0100
Subject: [Buildroot] [PATCH 28/39] libgtk2: convert to autotools
	infrastructure for host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3fb725c5b13801fdce3a9b7fada98abd1a1a9d8f.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/libgtk2.mk |   55 ++++++-------------------------------------
 1 files changed, 8 insertions(+), 47 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index a61fde7..626b2da 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -119,33 +119,8 @@ else
 LIBGTK2_CONF_OPT += --disable-cups
 endif
 
-$(eval $(call AUTOTARGETS,package,libgtk2))
-
-$(LIBGTK2_HOOK_POST_INSTALL):
-	$(INSTALL) -m 755 package/libgtk2/S26libgtk2 $(TARGET_DIR)/etc/init.d/
-	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo $(TARGET_DIR)/usr/bin/gtk-demo
-	touch $@
-
-# libgtk2 for the host
-LIBGTK2_HOST_DIR:=$(BUILD_DIR)/libgtk2-$(LIBGTK2_VERSION)-host
-
-$(DL_DIR)/$(LIBGTK2_SOURCE):
-	$(call DOWNLOAD,$(LIBGTK2_SITE),$(LIBGTK2_SOURCE))
-
-$(STAMP_DIR)/host_libgtk2_unpacked: $(DL_DIR)/$(LIBGTK2_SOURCE)
-	mkdir -p $(LIBGTK2_HOST_DIR)
-	$(INFLATE$(suffix $(LIBGTK2_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LIBGTK2_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_libgtk2_configured: $(STAMP_DIR)/host_libgtk2_unpacked $(STAMP_DIR)/host_cairo_installed $(STAMP_DIR)/host_libglib2_installed $(STAMP_DIR)/host_pango_installed $(STAMP_DIR)/host_atk_installed
-	(cd $(LIBGTK2_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
+HOST_LIBGTK2_DEPENDENCIES = host-cairo host-libglib2 host-pango host-atk
+HOST_LIBGTK2_CONF_OPT = \
 		--disable-static \
 		--disable-glibtest \
 		--without-libtiff \
@@ -153,26 +128,12 @@ $(STAMP_DIR)/host_libgtk2_configured: $(STAMP_DIR)/host_libgtk2_unpacked $(STAMP
 		--with-x \
 		--with-gdktarget=x11 \
 		--disable-cups \
-		--disable-debug \
-	)
-	touch $@
+		--disable-debug
 
-$(STAMP_DIR)/host_libgtk2_compiled: $(STAMP_DIR)/host_libgtk2_configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(LIBGTK2_HOST_DIR)
-	touch $@
+$(eval $(call AUTOTARGETS,package,libgtk2))
+$(eval $(call AUTOTARGETS,package,libgtk2,host))
 
-$(STAMP_DIR)/host_libgtk2_installed: $(STAMP_DIR)/host_libgtk2_compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(LIBGTK2_HOST_DIR) install
+$(LIBGTK2_HOOK_POST_INSTALL):
+	$(INSTALL) -m 755 package/libgtk2/S26libgtk2 $(TARGET_DIR)/etc/init.d/
+	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo $(TARGET_DIR)/usr/bin/gtk-demo
 	touch $@
-
-host-libgtk2: $(STAMP_DIR)/host_libgtk2_installed
-
-host-libgtk2-source: libgtk2-source
-
-host-libgtk2-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_libgtk2_,unpacked configured compiled installed)
-	-$(MAKE) -C $(LIBGTK2_HOST_DIR) uninstall
-	-$(MAKE) -C $(LIBGTK2_HOST_DIR) clean
-
-host-libgtk2-dirclean:
-	rm -rf $(LIBGTK2_HOST_DIR)
-- 
1.6.3.3
