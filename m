From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 03:30:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/vpnc
Message-ID: <20070919103003.6CB77A6881@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 03:30:02 -0700 (Wed, 19 Sep 2007)
New Revision: 19886

Log:
- add missing dependency on libgcrypt
  Ulf, this should be updated to 0.5.1


Removed:
   trunk/buildroot/package/vpnc/vpnc-0.4.0.patch

Modified:
   trunk/buildroot/package/vpnc/vpnc.mk


Changeset:
Deleted: trunk/buildroot/package/vpnc/vpnc-0.4.0.patch
===================================================================
--- trunk/buildroot/package/vpnc/vpnc-0.4.0.patch	2007-09-19 10:26:39 UTC (rev 19885)
+++ trunk/buildroot/package/vpnc/vpnc-0.4.0.patch	2007-09-19 10:30:02 UTC (rev 19886)
@@ -1,12 +0,0 @@
-diff -urN vpnc-0.4.0-0rig/Makefile vpnc-0.4.0/Makefile
---- vpnc-0.4.0-0rig/Makefile	2007-02-19 21:51:12.000000000 +0100
-+++ vpnc-0.4.0/Makefile	2007-07-17 19:59:53.000000000 +0200
-@@ -35,7 +35,7 @@
- RELEASE_VERSION := $(shell cat VERSION)
- 
- CC=gcc
--CFLAGS += -W -Wall -O3 -Wmissing-declarations -Wwrite-strings -g
-+CFLAGS += -W -Wall -O3 -Wmissing-declarations -Wwrite-strings -g -I$(INCLUDE)
- CPPFLAGS = -DVERSION=\"$(VERSION)\"
- LDFLAGS = -g $(shell libgcrypt-config --libs)
- CFLAGS +=  $(shell libgcrypt-config --cflags)

Modified: trunk/buildroot/package/vpnc/vpnc.mk
===================================================================
--- trunk/buildroot/package/vpnc/vpnc.mk	2007-09-19 10:26:39 UTC (rev 19885)
+++ trunk/buildroot/package/vpnc/vpnc.mk	2007-09-19 10:30:02 UTC (rev 19886)
@@ -20,15 +20,12 @@
 $(VPNC_DIR)/.unpacked: $(DL_DIR)/$(VPNC_SOURCE)
 	$(VPNC_CAT) $(DL_DIR)/$(VPNC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(VPNC_DIR) package/vpnc \*.patch
-	touch $(VPNC_DIR)/.unpacked
+	touch $@
 
-$(VPNC_DIR)/.configured: $(VPNC_DIR)/.unpacked
-	touch $(VPNC_DIR)/.configured
-
-$(VPNC_BINARY): $(VPNC_DIR)/.configured
+$(VPNC_BINARY): $(VPNC_DIR)/.unpacked
 	rm -f $@
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) INCLUDE=$(STAGING_DIR)/usr/include \
-		CC=$(TARGET_CC) -C $(VPNC_DIR)
+		CC="$(TARGET_CC)" -C $(VPNC_DIR)
 
 $(VPNC_TARGET_BINARY): $(VPNC_BINARY)
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
@@ -39,18 +36,16 @@
 		MANDIR=/usr/share/man \
 		VERSION=$(VPNC_VERSION) \
 		INCLUDE=$(STAGING_DIR)/usr/include \
-		LDFLAGS="-g -lgcrypt -lgpg-error" \
+		LDFLAGS="-lgcrypt -lgpg-error" \
 		-C $(VPNC_DIR) install
 	$(STRIP) $(STRIP_STRIP_UNNEEDED) $(VPNC_TARGET_BINARY)
 
-vpnc: uclibc $(VPNC_TARGET_BINARY)
+vpnc: uclibc libgcrypt $(VPNC_TARGET_BINARY)
 
 vpnc-source: $(DL_DIR)/$(VPNC_SOURCE)
 
 vpnc-clean:
-	@if [ -d $(VPNC_DIR)/Makefile ]; then \
-		$(MAKE) -C $(VPNC_DIR) clean; \
-	fi
+	-$(MAKE) -C $(VPNC_DIR) clean
 	rm -f $(STAGING_DIR)/usr/bin/vpnc
 
 vpnc-dirclean:
