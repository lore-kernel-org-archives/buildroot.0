From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 05:28:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/vpnc
Message-ID: <20070919122849.3C0F030056@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 05:28:48 -0700 (Wed, 19 Sep 2007)
New Revision: 19890

Log:
- bump version.
  Someone will have to fix the install thing (involves a file with .pl where my sh says 'line 18: use: command not found', which is a good thing).


Modified:
   trunk/buildroot/package/vpnc/vpnc.mk


Changeset:
Modified: trunk/buildroot/package/vpnc/vpnc.mk
===================================================================
--- trunk/buildroot/package/vpnc/vpnc.mk	2007-09-19 12:24:07 UTC (rev 19889)
+++ trunk/buildroot/package/vpnc/vpnc.mk	2007-09-19 12:28:48 UTC (rev 19890)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-VPNC_VERSION=0.4.0
+VPNC_VERSION=0.5.1
 VPNC_SOURCE=vpnc-$(VPNC_VERSION).tar.gz
 VPNC_SITE=http://www.unix-ag.uni-kl.de/~massar/vpnc
 VPNC_DIR=$(BUILD_DIR)/vpnc-$(VPNC_VERSION)
@@ -19,12 +19,14 @@
 
 $(VPNC_DIR)/.unpacked: $(DL_DIR)/$(VPNC_SOURCE)
 	$(VPNC_CAT) $(DL_DIR)/$(VPNC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(VPNC_DIR) package/vpnc \*.patch
+	toolchain/patch-kernel.sh $(VPNC_DIR) package/vpnc \*$(VPNC_VERSION).patch
 	touch $@
 
 $(VPNC_BINARY): $(VPNC_DIR)/.unpacked
 	rm -f $@
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) INCLUDE=$(STAGING_DIR)/usr/include \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS+=-lgcrypt LDFLAGS+=-lgpg-error \
 		CC="$(TARGET_CC)" -C $(VPNC_DIR)
 
 $(VPNC_TARGET_BINARY): $(VPNC_BINARY)
