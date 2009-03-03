From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue,  3 Mar 2009 11:58:23 +0100
Subject: [Buildroot] iproute: fix makefile
In-Reply-To: <1236077910-15674-1-git-send-email-razzor@kopf-tisch.de>
References: <>
 <1236077910-15674-1-git-send-email-razzor@kopf-tisch.de>
Message-ID: <1236077910-15674-2-git-send-email-razzor@kopf-tisch.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- bump version to 2.6.28
- fix download
- change compile ordering (build tc after ip)
- remove both binaries from target when cleaning up
---
 package/iproute2/iproute2.mk |   23 +++++++++++------------
 1 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 3ced612..bfbc0a1 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -3,30 +3,29 @@
 # iproute2
 #
 #############################################################
-IPROUTE2_VERSION:=2.6.18
-IPROUTE2_STAMP:=061002
-IPROUTE2_SOURCE:=iproute2-$(IPROUTE2_VERSION)-$(IPROUTE2_STAMP).tar.gz
+IPROUTE2_VERSION:=2.6.28
+IPROUTE2_SOURCE:=iproute2-$(IPROUTE2_VERSION).tar.bz2
 IPROUTE2_SITE:=http://developer.osdl.org/dev/iproute2/download/
-IPROUTE2_DIR:=$(BUILD_DIR)/iproute2-$(IPROUTE2_VERSION)-$(IPROUTE2_STAMP)
-IPROUTE2_CAT:=$(ZCAT)
+IPROUTE2_DIR:=$(BUILD_DIR)/iproute2-$(IPROUTE2_VERSION)
+IPROUTE2_CAT:=$(BZCAT)
 IPROUTE2_BINARY:=tc/tc
 IPROUTE2_TARGET_BINARY:=sbin/tc
 
 $(DL_DIR)/$(IPROUTE2_SOURCE):
-	$(call DOWNLOAD,$(IPROUTE2_SITE)$(IPROUTE2_SOURCE))
+	$(call DOWNLOAD,$(IPROUTE2_SITE),$(IPROUTE2_SOURCE))
 
 iproute2-source: $(DL_DIR)/$(IPROUTE2_SOURCE)
 
 $(IPROUTE2_DIR)/.unpacked: $(DL_DIR)/$(IPROUTE2_SOURCE)
 	$(IPROUTE2_CAT) $(DL_DIR)/$(IPROUTE2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(IPROUTE2_DIR)/.unpacked
+	touch $@
 
 $(IPROUTE2_DIR)/.configured: $(IPROUTE2_DIR)/.unpacked
 	(cd $(IPROUTE2_DIR); \
 		./configure; \
 		$(SED) '/TC_CONFIG_ATM/s:=.*:=n:' Config; \
 		$(SED) '/^CCOPTS/s:-O2.*:$(TARGET_CFLAGS):' Makefile)
-	touch $(IPROUTE2_DIR)/.configured
+	touch $@
 
 $(IPROUTE2_DIR)/$(IPROUTE2_BINARY): $(IPROUTE2_DIR)/.configured
 	$(MAKE) \
@@ -35,16 +34,16 @@ $(IPROUTE2_DIR)/$(IPROUTE2_BINARY): $(IPROUTE2_DIR)/.configured
 		CC=$(TARGET_CC) \
 		AR=$(TARGET_CROSS)ar \
 		NETEM_DIST="" \
-		SUBDIRS="lib tc ip"
+		SUBDIRS="lib ip tc"
 
 $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY): $(IPROUTE2_DIR)/$(IPROUTE2_BINARY)
-	install -Dc $(IPROUTE2_DIR)/ip/ip $(TARGET_DIR)/sbin/ip
-	install -Dc $(IPROUTE2_DIR)/$(IPROUTE2_BINARY) $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY)
+	$(INSTALL) -m 0755 -s $(IPROUTE2_DIR)/ip/ip $(TARGET_DIR)/sbin/ip
+	$(INSTALL) -m 0755 -s $(IPROUTE2_DIR)/$(IPROUTE2_BINARY) $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY)
 
 iproute2: $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY)
 
 iproute2-clean:
-	rm -f $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/sbin/ip $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY)
 	-$(MAKE) -C $(IPROUTE2_DIR) clean
 
 iproute2-dirclean:
-- 
1.5.4.3
