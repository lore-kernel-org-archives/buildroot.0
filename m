From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] autoconf: convert to autotools
	infrastructure for host package
Message-ID: <20091216153047.15FFB77738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=67cd864711372ba136016209ebf54684b674e8e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autoconf/autoconf.mk |   51 +++++-------------------------------------
 1 files changed, 6 insertions(+), 45 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 931d551..a94f23e 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -16,53 +16,14 @@ AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 
 AUTOCONF_DEPENDENCIES = microperl host-m4
 
-$(eval $(call AUTOTARGETS,package,autoconf))
+HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
+                    	 ac_cv_prog_gnu_m4_gnu=no
+
+HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
 
-# autoconf for the host
-AUTOCONF_HOST_DIR:=$(BUILD_DIR)/autoconf-$(AUTOCONF_VERSION)-host
+$(eval $(call AUTOTARGETS,package,autoconf))
+$(eval $(call AUTOTARGETS,package,autoconf,host))
 
 # variables used by other packages
 AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
 AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" $(HOST_DIR)/usr/bin/autoreconf -v -f -i -I "$(ACLOCAL_DIR)"
-
-$(DL_DIR)/$(AUTOCONF_SOURCE):
-	$(call DOWNLOAD,$(AUTOCONF_SITE),$(AUTOCONF_SOURCE))
-
-$(STAMP_DIR)/host_autoconf_unpacked: $(DL_DIR)/$(AUTOCONF_SOURCE)
-	mkdir -p $(AUTOCONF_HOST_DIR)
-	$(INFLATE$(suffix $(AUTOCONF_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(AUTOCONF_HOST_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(AUTOCONF_HOST_DIR) package/autoconf/ \*.patch
-	touch $@
-
-$(STAMP_DIR)/host_autoconf_configured: $(STAMP_DIR)/host_autoconf_unpacked $(STAMP_DIR)/host_m4_installed  $(STAMP_DIR)/host_libtool_installed
-	(cd $(AUTOCONF_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
-		ac_cv_prog_gnu_m4_gnu=no \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-		--disable-static \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_autoconf_compiled: $(STAMP_DIR)/host_autoconf_configured
-	$(MAKE) -C $(AUTOCONF_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_autoconf_installed: $(STAMP_DIR)/host_autoconf_compiled
-	$(MAKE) -C $(AUTOCONF_HOST_DIR) install
-	touch $@
-
-host-autoconf: $(STAMP_DIR)/host_autoconf_installed
-
-host-autoconf-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_autoconf_,unpacked configured compiled installed)
-	-$(MAKE) -C $(AUTOCONF_HOST_DIR) uninstall
-	-$(MAKE) -C $(AUTOCONF_HOST_DIR) clean
-
-host-autoconf-dirclean:
-	rm -rf $(AUTOCONF_HOST_DIR)
-- 
1.6.3.3
