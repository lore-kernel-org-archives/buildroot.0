From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Apr 2011 22:20:48 +0200
Subject: [Buildroot] [git commit] procps: bump version, convert to GENTARGETS
Message-ID: <20110406202239.6E390821E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ce6d09bdac0a343c380370bf95761f9640abfeac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/procps/procps.mk |   56 ++++++++++-----------------------------------
 1 files changed, 13 insertions(+), 43 deletions(-)

diff --git a/package/procps/procps.mk b/package/procps/procps.mk
index 3add243..a279987 100644
--- a/package/procps/procps.mk
+++ b/package/procps/procps.mk
@@ -3,51 +3,21 @@
 # procps
 #
 #############################################################
-PROCPS_VERSION:=3.2.7
-PROCPS_SOURCE:=procps-$(PROCPS_VERSION).tar.gz
-PROCPS_SITE:=http://procps.sourceforge.net/
-PROCPS_DIR:=$(BUILD_DIR)/procps-$(PROCPS_VERSION)
-PROCPS_BINARY:=ps/ps
-PROCPS_TARGET_BINARY:=usr/bin/vmstat
 
-$(DL_DIR)/$(PROCPS_SOURCE):
-	$(call DOWNLOAD,$(PROCPS_SITE),$(PROCPS_SOURCE))
+PROCPS_VERSION = 3.2.8
+PROCPS_SITE = http://procps.sourceforge.net/
 
-$(PROCPS_DIR)/.source: $(DL_DIR)/$(PROCPS_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(PROCPS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(PROCPS_DIR) package/procps/ procps\*.patch
-	touch $(PROCPS_DIR)/.source
+PROCPS_DEPENDENCIES = ncurses
 
-$(PROCPS_DIR)/$(PROCPS_BINARY): $(PROCPS_DIR)/.source
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(PROCPS_DIR)
+define PROCPS_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
 
-$(TARGET_DIR)/$(PROCPS_TARGET_BINARY): $(PROCPS_DIR)/$(PROCPS_BINARY)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
-		install='install -D' -C $(PROCPS_DIR) lib64=/lib \
-		ldconfig='/bin/true' install
-	rm -Rf $(TARGET_DIR)/usr/share/man
+define PROCPS_INSTALL_TARGET_CMDS
+	mkdir -p $(addprefix $(TARGET_DIR)/,usr/bin bin sbin) \
+		 $(addprefix $(TARGET_DIR)/usr/share/man/,man1 man5 man8)
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) lib64=lib install=install \
+		ldconfig=true install
+endef
 
-procps: ncurses $(TARGET_DIR)/$(PROCPS_TARGET_BINARY)
-
-procps-source: $(DL_DIR)/$(PROCPS_SOURCE)
-
-procps-clean:
-	for bin in uptime tload free w \
-		   top vmstat watch skill \
-		   snice kill sysctl pmap \
-		   pgrep pkill slabtop; do \
-		rm -f $(TARGET_DIR)/usr/bin/$${bin}; \
-	done
-	rm -f $(TARGET_DIR)/lib/libproc*
-
-procps-dirclean:
-	rm -rf $(PROCPS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PROCPS),y)
-TARGETS+=procps
-endif
+$(eval $(call GENTARGETS,package,procps))
-- 
1.7.3.4
