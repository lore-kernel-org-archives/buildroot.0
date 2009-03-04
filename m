From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Mar 2009 20:16:22 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iproute2
Message-ID: <20090304201622.301B97626E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-04 20:16:21 +0000 (Wed, 04 Mar 2009)
New Revision: 25529

Log:
iproute: fix makefile

Patch by Olaf Rempel <razzor@kopf-tisch.de>.

- bump version to 2.6.28
- fix download
- change compile ordering (build tc after ip)
- remove both binaries from target when cleaning up

[Peter: fixed target install strip]

Modified:
   trunk/buildroot/package/iproute2/iproute2.mk


Changeset:
Modified: trunk/buildroot/package/iproute2/iproute2.mk
===================================================================
--- trunk/buildroot/package/iproute2/iproute2.mk	2009-03-04 17:56:00 UTC (rev 25528)
+++ trunk/buildroot/package/iproute2/iproute2.mk	2009-03-04 20:16:21 UTC (rev 25529)
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
@@ -35,16 +34,18 @@
 		CC=$(TARGET_CC) \
 		AR=$(TARGET_CROSS)ar \
 		NETEM_DIST="" \
-		SUBDIRS="lib tc ip"
+		SUBDIRS="lib ip tc"
 
 $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY): $(IPROUTE2_DIR)/$(IPROUTE2_BINARY)
-	install -Dc $(IPROUTE2_DIR)/ip/ip $(TARGET_DIR)/sbin/ip
-	install -Dc $(IPROUTE2_DIR)/$(IPROUTE2_BINARY) $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY)
+	$(INSTALL) -m 0755 $(IPROUTE2_DIR)/ip/ip $(TARGET_DIR)/sbin/ip
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/sbin/ip
+	$(INSTALL) -m 0755 $(IPROUTE2_DIR)/$(IPROUTE2_BINARY) $@
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
 iproute2: $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY)
 
 iproute2-clean:
-	rm -f $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/sbin/ip $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY)
 	-$(MAKE) -C $(IPROUTE2_DIR) clean
 
 iproute2-dirclean:
