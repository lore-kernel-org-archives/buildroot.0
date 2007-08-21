From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 12:35:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sed
Message-ID: <20070821193508.16D19A65AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 12:35:08 -0700 (Tue, 21 Aug 2007)
New Revision: 19629

Log:
- more cleanup (Cristian Ionescu-Idbohrn)


Modified:
   trunk/buildroot/package/sed/sed.mk


Changeset:
Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2007-08-21 19:33:00 UTC (rev 19628)
+++ trunk/buildroot/package/sed/sed.mk	2007-08-21 19:35:08 UTC (rev 19629)
@@ -37,33 +37,35 @@
 	mkdir -p $(HOST_SED_DIR)/bin
 	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(SED_DIR1) package/sed/ configure.patch
-	touch $(SED_DIR1)/.unpacked
+	touch $@
 
 $(SED_DIR1)/.configured: $(SED_DIR1)/.unpacked
 	(cd $(SED_DIR1); rm -rf config.cache; \
 		./configure \
 		--prefix=/usr \
 	)
-	touch $(SED_DIR1)/.configured
+	touch $@
 
 $(SED_DIR1)/$(SED_BINARY): $(SED_DIR1)/.configured
 	$(MAKE) -C $(SED_DIR1)
 
 # This stuff is needed to work around GNU make deficiencies
 build-sed-host-binary: $(SED_DIR1)/$(SED_BINARY)
-	@if [ -L $(HOST_SED_DIR)/$(SED_TARGET_BINARY) ] ; then \
-		rm -f $(HOST_SED_DIR)/$(SED_TARGET_BINARY); fi
+	@if [ -L $(HOST_SED_DIR)/$(SED_TARGET_BINARY) ]; then \
+		rm -f $(HOST_SED_DIR)/$(SED_TARGET_BINARY); \
+	fi
 	@if [ ! -f $(HOST_SED_DIR)/$(SED_TARGET_BINARY) -o $(HOST_SED_DIR)/$(SED_TARGET_BINARY) \
-	-ot $(SED_DIR1)/$(SED_BINARY) ] ; then \
+	-ot $(SED_DIR1)/$(SED_BINARY) ]; then \
 	    set -x; \
 	    mkdir -p $(HOST_SED_DIR)/bin; \
 	    $(MAKE) DESTDIR=$(HOST_SED_DIR) -C $(SED_DIR1) install; \
 	    mv $(HOST_SED_DIR)/usr/bin/sed $(HOST_SED_DIR)/bin/; \
 	    rm -rf $(HOST_SED_DIR)/share/locale $(HOST_SED_DIR)/usr/info \
-		    $(HOST_SED_DIR)/usr/man $(HOST_SED_DIR)/usr/share/doc; fi
+		    $(HOST_SED_DIR)/usr/man $(HOST_SED_DIR)/usr/share/doc; \
+	fi
 
 $(HOST_SED_DIR)/$(SED_TARGET_BINARY):
-	if [ ! -e "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)" ] ; then \
+	if [ ! -e "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)" ]; then \
 		mkdir -p "$(HOST_SED_DIR)/bin"; \
 		rm -f "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
 		ln -sf "$(HOST_SED_IF_ANY)" "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
@@ -120,23 +122,25 @@
 		--include=$(STAGING_DIR)/usr/include \
 		$(DISABLE_NLS) \
 	)
-	touch $(SED_DIR2)/.configured
+	touch $@
 
 $(SED_DIR2)/$(SED_BINARY): $(SED_DIR2)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(SED_DIR2)
 
 # This stuff is needed to work around GNU make deficiencies
 sed-target_binary: $(SED_DIR2)/$(SED_BINARY)
-	@if [ -L $(TARGET_DIR)/$(SED_TARGET_BINARY) ] ; then \
-		rm -f $(TARGET_DIR)/$(SED_TARGET_BINARY); fi
+	@if [ -L $(TARGET_DIR)/$(SED_TARGET_BINARY) ]; then \
+		rm -f $(TARGET_DIR)/$(SED_TARGET_BINARY); \
+	fi
 
 	@if [ ! -f $(SED_DIR2)/$(SED_BINARY) -o $(TARGET_DIR)/$(SED_TARGET_BINARY) \
-	-ot $(SED_DIR2)/$(SED_BINARY) ] ; then \
+	-ot $(SED_DIR2)/$(SED_BINARY) ]; then \
 	    set -x; \
 	    $(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(SED_DIR2) install; \
 	    mv $(TARGET_DIR)/usr/bin/sed $(TARGET_DIR)/bin/; \
 	    rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-		    $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc; fi
+		    $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc; \
+	fi
 
 sed: uclibc sed-target_binary
 
@@ -156,4 +160,3 @@
 ifeq ($(strip $(BR2_PACKAGE_SED)),y)
 TARGETS+=sed
 endif
-
