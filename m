From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 19:40:41 +0200
Subject: [Buildroot] [PATCH 09/20] netkittelnet: convert to generic-package
	infrastructure
In-Reply-To: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f4012b4890c88eb230f1a9c290ab2ce24150e4d9.1344706801.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netkittelnet/netkittelnet.mk    |   80 ++++++++-----------------------
 package/netkittelnet/netkittelnet.patch |    2 +-
 2 files changed, 21 insertions(+), 61 deletions(-)

diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
index 43ba324..b1f8c53 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkittelnet/netkittelnet.mk
@@ -3,69 +3,29 @@
 # netkittelnet
 #
 #############################################################
-NETKITTELNET_VERSION:=0.17
-NETKITTELNET_SOURCE:=netkit-telnet-$(NETKITTELNET_VERSION).tar.gz
-NETKITTELNET_SITE:=ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
-NETKITTELNET_DIR:=$(BUILD_DIR)/netkit-telnet-$(NETKITTELNET_VERSION)
-NETKITTELNET_CAT:=$(ZCAT)
-NETKITTELNET_BINARY:=telnetd/telnetd
-NETKITTELNET_TARGET_BINARY:=usr/sbin/telnetd
+NETKITTELNET_VERSION = 0.17
+NETKITTELNET_SOURCE  = netkit-telnet-$(NETKITTELNET_VERSION).tar.gz
+NETKITTELNET_SITE    = ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
 
-$(DL_DIR)/$(NETKITTELNET_SOURCE):
-	 $(call DOWNLOAD,$(NETKITTELNET_SITE)/$(NETKITTELNET_SOURCE))
-
-netkittelnet-source: $(DL_DIR)/$(NETKITTELNET_SOURCE)
-
-$(NETKITTELNET_DIR)/.unpacked: $(DL_DIR)/$(NETKITTELNET_SOURCE)
-	$(NETKITTELNET_CAT) $(DL_DIR)/$(NETKITTELNET_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+define NETKITTELNET_CONFIGURE_CMDS
 	# use ANSI syntax
-	$(SED) "s/main()/main(void)/;" $(NETKITTELNET_DIR)/configure
+	$(SED) "s/main()/main(void)/;" $(@D)/configure
 	# Disable termcap support
-	$(SED) "s~\(.*termcap\.h.*\)~/* \1 */~;" $(NETKITTELNET_DIR)/telnetd/telnetd.c
-	# don't try to run cross compiled binaries while configuring things
-	support/scripts/apply-patches.sh $(NETKITTELNET_DIR) package/netkittelnet/ netkittelnet\*.patch
-	touch $(NETKITTELNET_DIR)/.unpacked
-
-$(NETKITTELNET_DIR)/.configured: $(NETKITTELNET_DIR)/.unpacked
-	(cd $(NETKITTELNET_DIR); rm -f config.cache; \
-	 PATH=$(TARGET_PATH) CC="$(TARGET_CC)" \
-	./configure --installroot=$(TARGET_DIR) --with-c-compiler="$(TARGET_CC)" \
-	)
-	touch $(NETKITTELNET_DIR)/.configured
-
-$(NETKITTELNET_DIR)/$(NETKITTELNET_BINARY): $(NETKITTELNET_DIR)/.configured
-	$(MAKE) SUB=telnetd CC="$(TARGET_CC)" -C $(NETKITTELNET_DIR)
-	$(STRIPCMD) $(NETKITTELNET_DIR)/$(NETKITTELNET_BINARY)
-
-$(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY): $(NETKITTELNET_DIR)/$(NETKITTELNET_BINARY)
-	# Only install a few selected items...
-	mkdir -p $(TARGET_DIR)/usr/sbin
-	rm -f $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY)
-	cp $(NETKITTELNET_DIR)/$(NETKITTELNET_BINARY) $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY)
+	$(SED) "s~\(.*termcap\.h.*\)~/* \1 */~;" $(@D)/telnetd/telnetd.c
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		./configure \
+		--installroot=$(TARGET_DIR))
+endef
+
+define NETKITTELNET_BUILD_CMDS
+	$(MAKE) SUB=telnetd -C $(@D)
+endef
+
+define NETKITTELNET_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/telnetd/telnetd $(TARGET_DIR)/usr/sbin/telnetd
 	# Enable telnet in inetd
 	$(SED) "s~^#telnet.*~telnet\tstream\ttcp\tnowait\troot\t/usr/sbin/telnetd\t/usr/sbin/telnetd~;" $(TARGET_DIR)/etc/inetd.conf
-	#$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(NETKITTELNET_DIR) install
-	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-	# $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-
-netkittelnet-legal-info:
-	@$(call legal-warning-pkg,netkittelnet,legal-info not yet implemented)
-
-netkittelnet: netkitbase $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY)
+endef
 
-netkittelnet-clean:
-	#$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(NETKITTELNET_DIR) uninstall
-	-rm -f $(TARGET_DIR)/usr/sbin/telnetd
-	-$(MAKE) -C $(NETKITTELNET_DIR) clean
-
-netkittelnet-dirclean:
-	rm -rf $(NETKITTELNET_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_NETKITTELNET),y)
-TARGETS+=netkittelnet
-endif
+$(eval $(generic-package))
diff --git a/package/netkittelnet/netkittelnet.patch b/package/netkittelnet/netkittelnet.patch
index c894c2a..863bbcd 100644
--- a/package/netkittelnet/netkittelnet.patch
+++ b/package/netkittelnet/netkittelnet.patch
@@ -66,7 +66,7 @@
 -cat <<EOF >__conftest.cc
 -#include <stdio.h>
 -#include <termcap.h>
--int main(void) {
+-int main() {
 -    tgetent(NULL, NULL); return 0;
 -}
 -
-- 
1.7.9.5
