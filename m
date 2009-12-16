From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] dbus: convert to autotools
	infrastructure for host package
Message-ID: <20091216153051.BC99077738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=368519f649d49f39f1e4aabe146181ccaf193c04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/dbus.mk |   72 +++++++++++++------------------------------------
 1 files changed, 19 insertions(+), 53 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 2780df6..ae65b7d 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -49,41 +49,8 @@ else
 DBUS_CONF_OPT += --without-x
 endif
 
-$(eval $(call AUTOTARGETS,package,dbus))
-
-# fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
-$(DBUS_HOOK_POST_BUILD): $(DBUS_TARGET_BUILD)
-	rm -rf $(TARGET_DIR)/var/lib/dbus
-	touch $@
-
-$(DBUS_HOOK_POST_INSTALL): $(DBUS_TARGET_INSTALL_TARGET)
-	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
-	rm -rf $(TARGET_DIR)/var/lib/dbus
-	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
-	$(INSTALL) -m 0755 package/dbus/S30dbus $(TARGET_DIR)/etc/init.d
-	touch $@
-
-# dbus for the host
-DBUS_HOST_DIR:=$(BUILD_DIR)/dbus-$(DBUS_VERSION)-host
-DBUS_HOST_INTROSPECT:=$(DBUS_HOST_DIR)/introspect.xml
-
-$(DL_DIR)/$(DBUS_SOURCE):
-	$(call DOWNLOAD,$(DBUS_SITE),$(DBUS_SOURCE))
-
-$(STAMP_DIR)/host_dbus_unpacked: $(DL_DIR)/$(DBUS_SOURCE)
-	mkdir -p $(DBUS_HOST_DIR)
-	$(INFLATE$(suffix $(DBUS_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(DBUS_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_dbus_configured: $(STAMP_DIR)/host_dbus_unpacked $(STAMP_DIR)/host_expat_installed $(STAMP_DIR)/host_pkgconfig_installed
-	(cd $(DBUS_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
+HOST_DBUS_DEPENDENCIES = host-pkg-config host-expat
+HOST_DBUS_CONF_OPT = \
 		--with-dbus-user=dbus \
 		--disable-tests \
 		--disable-asserts \
@@ -94,28 +61,27 @@ $(STAMP_DIR)/host_dbus_configured: $(STAMP_DIR)/host_dbus_unpacked $(STAMP_DIR)/
 		--disable-static \
 		--enable-dnotify \
 		--without-x \
-		--with-xml=expat \
-	)
-	touch $@
+		--with-xml=expat
 
-$(STAMP_DIR)/host_dbus_compiled: $(STAMP_DIR)/host_dbus_configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(DBUS_HOST_DIR)
-	touch $@
+# dbus for the host
+DBUS_HOST_INTROSPECT:=$(DBUS_HOST_DIR)/introspect.xml
 
-$(STAMP_DIR)/host_dbus_installed: $(STAMP_DIR)/host_dbus_compiled
-	$(MAKE) -C $(DBUS_HOST_DIR) install
+HOST_DBUS_GEN_INTROSPECT = \
 	$(HOST_DIR)/usr/bin/dbus-daemon --introspect > $(DBUS_HOST_INTROSPECT)
-	touch $@
 
-host-dbus: $(STAMP_DIR)/host_dbus_installed
+HOST_DBUS_POST_INSTALL_HOOKS += HOST_DBUS_GEN_INTROSPECT
 
-host-dbus-source: dbus-source
+$(eval $(call AUTOTARGETS,package,dbus))
+$(eval $(call AUTOTARGETS,package,dbus,host))
 
-host-dbus-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_dbus_,unpacked configured compiled installed)
-	rm -f $(DBUS_HOST_INTROSPECT)
-	-$(MAKE) -C $(DBUS_HOST_DIR) uninstall
-	-$(MAKE) -C $(DBUS_HOST_DIR) clean
+# fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
+$(DBUS_HOOK_POST_BUILD): $(DBUS_TARGET_BUILD)
+	rm -rf $(TARGET_DIR)/var/lib/dbus
+	touch $@
 
-host-dbus-dirclean:
-	rm -rf $(DBUS_HOST_DIR)
+$(DBUS_HOOK_POST_INSTALL): $(DBUS_TARGET_INSTALL_TARGET)
+	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
+	rm -rf $(TARGET_DIR)/var/lib/dbus
+	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
+	$(INSTALL) -m 0755 package/dbus/S30dbus $(TARGET_DIR)/etc/init.d
+	touch $@
-- 
1.6.3.3
