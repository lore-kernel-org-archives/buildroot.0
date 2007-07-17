From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 05:12:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sed
Message-ID: <20070717121217.C4E98A6866@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 05:12:12 -0700 (Tue, 17 Jul 2007)
New Revision: 19132

Log:
Avoid constant rebuild of 'sed'

Modified:
   trunk/buildroot/package/sed/sed.mk


Changeset:
Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2007-07-17 12:09:07 UTC (rev 19131)
+++ trunk/buildroot/package/sed/sed.mk	2007-07-17 12:12:12 UTC (rev 19132)
@@ -62,13 +62,16 @@
 	    rm -rf $(HOST_SED_DIR)/share/locale $(HOST_SED_DIR)/usr/info \
 		    $(HOST_SED_DIR)/usr/man $(HOST_SED_DIR)/usr/share/doc; fi
 
-use-sed-host-binary:
+$(HOST_SED_DIR)/$(SED_TARGET_BINARY):
 	if [ ! -e "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)" ] ; then \
 		mkdir -p "$(HOST_SED_DIR)/bin"; \
 		rm -f "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
 		ln -sf "$(HOST_SED_IF_ANY)" "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
 	fi
 
+
+use-sed-host-binary:	$(HOST_SED_DIR)/$(SED_TARGET_BINARY)
+
 host-sed: $(HOST_SED_BINARY)
 
 ifeq ($(HOST_SED_BINARY),build-sed-host-binary)
@@ -113,6 +116,8 @@
 		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
+		--include=$(STAGING_DIR)/include \
+		--include=$(STAGING_DIR)/usr/include \
 		$(DISABLE_NLS) \
 	);
 	touch $(SED_DIR2)/.configured
@@ -151,4 +156,4 @@
 ifeq ($(strip $(BR2_PACKAGE_SED)),y)
 TARGETS+=sed
 endif
-.PHONY: sed host-sed
+.PHONY: sed host-sed use-sed-host-binary
