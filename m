From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] dbus-glib: convert to autotools
	infrastructure for host package
Message-ID: <20091216153054.E7EFC77738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=258440a2609ea2b53046d2429779d13c68ca85d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus-glib/dbus-glib.mk |   50 +++++----------------------------------
 1 files changed, 7 insertions(+), 43 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index c6cebe6..0bf2b3f 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -25,53 +25,17 @@ DBUS_GLIB_CONF_OPT = --localstatedir=/var \
 
 DBUS_GLIB_DEPENDENCIES = host-pkg-config dbus host-dbus host-dbus-glib libglib2 expat
 
-$(eval $(call AUTOTARGETS,package,dbus-glib))
-
-# dbus-glib for the host
-DBUS_GLIB_HOST_DIR:=$(BUILD_DIR)/dbus-glib-$(DBUS_GLIB_VERSION)-host
-DBUS_GLIB_HOST_BINARY:=$(HOST_DIR)/usr/bin/dbus-binding-tool
+HOST_DBUS_GLIB_DEPENDENCIES = host-dbus host-exapt host-libglib2
 
-$(DL_DIR)/$(DBUS_GLIB_SOURCE):
-	$(call DOWNLOAD,$(DBUS_GLIB_SITE),$(DBUS_GLIB_SOURCE))
-
-$(STAMP_DIR)/host_dbusglib_unpacked: $(DL_DIR)/$(DBUS_GLIB_SOURCE)
-	mkdir -p $(DBUS_GLIB_HOST_DIR)
-	$(INFLATE$(suffix $(DBUS_GLIB_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(DBUS_GLIB_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_dbusglib_configured: $(STAMP_DIR)/host_dbusglib_unpacked $(STAMP_DIR)/host_dbus_installed $(STAMP_DIR)/host_expat_installed $(STAMP_DIR)/host_libglib2_installed
-	(cd $(DBUS_GLIB_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
+HOST_DBUS_GLIB_CONF_OPT = \
 		--disable-tests \
 		--disable-xml-docs \
 		--disable-bash-completion \
 		--disable-doxygen-docs \
-		--enable-asserts=yes \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_dbusglib_compiled: $(STAMP_DIR)/host_dbusglib_configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(DBUS_GLIB_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_dbusglib_installed: $(STAMP_DIR)/host_dbusglib_compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(DBUS_GLIB_HOST_DIR) install
-	touch $@
-
-host-dbus-glib: $(STAMP_DIR)/host_dbusglib_installed
-
-host-dbus-glib-source: dbus-glib-source
+		--enable-asserts=yes
 
-host-dbus-glib-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_dbusglib_,unpacked configured compiled installed)
-	-$(MAKE) -C $(DBUS_GLIB_HOST_DIR) uninstall
-	-$(MAKE) -C $(DBUS_GLIB_HOST_DIR) clean
+$(eval $(call AUTOTARGETS,package,dbus-glib))
+$(eval $(call AUTOTARGETS,package,dbus-glib,host))
 
-host-dbus-glib-dirclean:
-	rm -rf $(DBUS_GLIB_HOST_DIR)
+# dbus-glib for the host
+DBUS_GLIB_HOST_BINARY:=$(HOST_DIR)/usr/bin/dbus-binding-tool
-- 
1.6.3.3
