From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:58 +0100
Subject: [Buildroot] [PATCH 27/39] gob2: convert to autotools infrastructure
	for host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c009e4e3d79bd3e37acfb54afa4cf65e49553f4e.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gob2/gob2.mk |   44 +++-----------------------------------------
 1 files changed, 3 insertions(+), 41 deletions(-)

diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index e640ca9..cdf7961 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -9,48 +9,10 @@ GOB2_SITE = http://ftp.5z.com/pub/gob/
 
 GOB2_DEPENDENCIES = libglib2 flex bison host-pkg-config
 
+HOST_GOB2_DEPENDENCIES = host-libglib2
+
 $(eval $(call AUTOTARGETS,package,gob2))
+$(eval $(call AUTOTARGETS,package,gob2,host))
 
 # gob2 for the host
-GOB2_HOST_DIR:=$(BUILD_DIR)/gob2-$(GOB2_VERSION)-host
 GOB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/gob2
-
-$(DL_DIR)/$(GOB2_SOURCE):
-	$(call DOWNLOAD,$(GOB2_SITE),$(GOB2_SOURCE))
-
-$(STAMP_DIR)/host_gob2_unpacked: $(DL_DIR)/$(GOB2_SOURCE)
-	mkdir -p $(GOB2_HOST_DIR)
-	$(INFLATE$(suffix $(GOB2_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(GOB2_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_gob2_configured: $(STAMP_DIR)/host_gob2_unpacked $(STAMP_DIR)/host_libglib2_installed
-	(cd $(GOB2_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_gob2_compiled: $(STAMP_DIR)/host_gob2_configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(GOB2_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_gob2_installed: $(STAMP_DIR)/host_gob2_compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(GOB2_HOST_DIR) install
-	touch $@
-
-host-gob2: $(STAMP_DIR)/host_gob2_installed
-
-host-gob2-source: gob2-source
-
-host-gob2-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_gob2_,unpacked configured compiled installed)
-	-$(MAKE) -C $(GOB2_HOST_DIR) uninstall
-	-$(MAKE) -C $(GOB2_HOST_DIR) clean
-
-host-gob2-dirclean:
-	rm -rf $(GOB2_HOST_DIR)
-- 
1.6.3.3
