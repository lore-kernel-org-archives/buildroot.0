From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:44 +0100
Subject: [Buildroot] [PATCH 13/39] automake: convert to autotools
	infrastructure for host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <adaf0c909cc002e2ddeedc618d0d0e1e93e1ff07.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/automake/automake.mk |   47 ++---------------------------------------
 1 files changed, 3 insertions(+), 44 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 82ae9be..65db386 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -13,53 +13,12 @@ endif
 
 AUTOMAKE_DEPENDENCIES = autoconf microperl
 
-$(eval $(call AUTOTARGETS,package,automake))
+HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
-# automake for the host
-AUTOMAKE_HOST_DIR:=$(BUILD_DIR)/automake-$(AUTOMAKE_VERSION)-host
+$(eval $(call AUTOTARGETS,package,automake))
+$(eval $(call AUTOTARGETS,package,automake,host))
 
 # variables used by other packages
 AUTOMAKE:=$(HOST_DIR)/usr/bin/automake
 ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
 ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
-
-$(DL_DIR)/$(AUTOMAKE_SOURCE):
-	$(call DOWNLOAD,$(AUTOMAKE_SITE),$(AUTOMAKE_SOURCE))
-
-$(STAMP_DIR)/host_automake_unpacked: $(DL_DIR)/$(AUTOMAKE_SOURCE)
-	mkdir -p $(AUTOMAKE_HOST_DIR)
-	$(INFLATE$(suffix $(AUTOMAKE_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(AUTOMAKE_HOST_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(AUTOMAKE_HOST_DIR) package/automake/ \*.patch
-	touch $@
-
-$(STAMP_DIR)/host_automake_configured: $(STAMP_DIR)/host_automake_unpacked $(STAMP_DIR)/host_autoconf_installed
-	(cd $(AUTOMAKE_HOST_DIR); rm -rf config.cache; \
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
-$(STAMP_DIR)/host_automake_compiled: $(STAMP_DIR)/host_automake_configured
-	$(MAKE) -C $(AUTOMAKE_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_automake_installed: $(STAMP_DIR)/host_automake_compiled
-	$(MAKE) -C $(AUTOMAKE_HOST_DIR) install
-	mkdir -p $(STAGING_DIR)/usr/share/aclocal
-	touch $@
-
-host-automake: $(STAMP_DIR)/host_automake_installed
-
-host-automake-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_automake_,unpacked configured compiled installed)
-	-$(MAKE) -C $(AUTOMAKE_HOST_DIR) uninstall
-	-$(MAKE) -C $(AUTOMAKE_HOST_DIR) clean
-
-host-automake-dirclean:
-	rm -rf $(AUTOMAKE_HOST_DIR)
-- 
1.6.3.3
