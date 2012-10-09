From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Oct 2012 09:35:47 +0200
Subject: [Buildroot] [git commit] netkittelnet: convert to generic-package
	infrastructure
Message-ID: <20121009073904.C68909980B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3501735f64414eea0e29d59aaa6f2f8ce5395eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add netkitbase dependency]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netkittelnet/netkittelnet.mk    |   82 ++++++++----------------------
 package/netkittelnet/netkittelnet.patch |    2 +-
 2 files changed, 23 insertions(+), 61 deletions(-)

diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
index 43ba324..7bcfaf8 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkittelnet/netkittelnet.mk
@@ -3,69 +3,31 @@
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
+NETKITTELNET_LICENSE = BSD-4c
+NETKITTELNET_DEPENDENCIES = netkitbase
 
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
