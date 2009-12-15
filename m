From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:54 +0100
Subject: [Buildroot] [PATCH 23/39] libxml2: convert to autotools
	infrastructure for host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a02cf75e19732ee1a5d99498a19ea85cc7bf2750.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml2/libxml2.mk |   52 ++++++-------------------------------------
 1 files changed, 8 insertions(+), 44 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index ceabcd9..a554226 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -20,7 +20,14 @@ LIBXML2_CONF_OPT = --with-gnu-ld --enable-shared \
 		--without-debugging --without-python \
 		--without-threads 
 
+HOST_LIBXML2_DEPENDENCIES = host-pkg-config
+
+HOST_LIBXML2_CONF_OPT = \
+		--enable-shared --without-debugging --without-python \
+		--without-threads
+
 $(eval $(call AUTOTARGETS,package,libxml2))
+$(eval $(call AUTOTARGETS,package,libxml2,host))
 
 $(LIBXML2_HOOK_POST_INSTALL):
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
@@ -31,47 +38,4 @@ $(LIBXML2_HOOK_POST_INSTALL):
 	touch $@
 
 # libxml2 for the host
-LIBXML2_HOST_DIR:=$(BUILD_DIR)/libxml2-$(LIBXML2_VERSION)-host
-LIBXML2_HOST_BINARY:=$(HOST_DIR)/usr/bin/xmllint
-
-$(DL_DIR)/$(LIBXML2_SOURCE):
-	$(call DOWNLOAD,$(LIBXML2_SITE),$(LIBXML2_SOURCE))
-
-$(STAMP_DIR)/host_libxml2_unpacked: $(DL_DIR)/$(LIBXML2_SOURCE)
-	mkdir -p $(LIBXML2_HOST_DIR)
-	$(INFLATE$(suffix $(LIBXML2_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LIBXML2_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_libxml2_configured: $(STAMP_DIR)/host_libxml2_unpacked $(STAMP_DIR)/host_pkgconfig_installed
-	(cd $(LIBXML2_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-		--enable-shared --without-debugging --without-python \
-		--without-threads \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_libxml2_compiled: $(STAMP_DIR)/host_libxml2_configured
-	$(MAKE) -C $(LIBXML2_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_libxml2_installed: $(STAMP_DIR)/host_libxml2_compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(LIBXML2_HOST_DIR) install
-	touch $@
-
-host-libxml2: $(STAMP_DIR)/host_libxml2_installed
-
-host-libxml2-source: libxml2-source
-
-host-libxml2-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_libxml2_,unpacked configured compiled installed)
-	-$(MAKE) -C $(LIBXML2_HOST_DIR) uninstall
-	-$(MAKE) -C $(LIBXML2_HOST_DIR) clean
-
-host-libxml2-dirclean:
-	rm -rf $(LIBXML2_HOST_DIR)
+LIBXML2_HOST_BINARY:=$(HOST_DIR)/usr/bin/xmllint
\ No newline@end of file
-- 
1.6.3.3
