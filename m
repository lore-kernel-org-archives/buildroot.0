From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 29 Jan 2007 04:51:40 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/autoconf
Message-ID: <20070129125140.89F5E485A6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-29 04:51:39 -0800 (Mon, 29 Jan 2007)
New Revision: 17628

Log:
- ironically, autoconf-2.61 is broken for parallel builds, force -j1


Modified:
   trunk/buildroot/package/autoconf/autoconf.mk


Changeset:
Modified: trunk/buildroot/package/autoconf/autoconf.mk
===================================================================
--- trunk/buildroot/package/autoconf/autoconf.mk	2007-01-29 10:08:39 UTC (rev 17627)
+++ trunk/buildroot/package/autoconf/autoconf.mk	2007-01-29 12:51:39 UTC (rev 17628)
@@ -18,7 +18,7 @@
 
 $(AUTOCONF_DIR)/.unpacked: $(DL_DIR)/$(AUTOCONF_SOURCE)
 	$(AUTOCONF_CAT) $(DL_DIR)/$(AUTOCONF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(AUTOCONF_DIR)/.unpacked
+	touch $@
 
 $(AUTOCONF_DIR)/.configured: $(AUTOCONF_DIR)/.unpacked
 	(cd $(AUTOCONF_DIR); rm -rf config.cache; \
@@ -40,10 +40,10 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 	);
-	touch $(AUTOCONF_DIR)/.configured
+	touch $@
 
 $(AUTOCONF_DIR)/bin/$(AUTOCONF_BINARY): $(AUTOCONF_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(AUTOCONF_DIR)
+	$(MAKE1) -C $(AUTOCONF_DIR)
 
 $(TARGET_DIR)/$(AUTOCONF_TARGET_BINARY): $(AUTOCONF_DIR)/bin/$(AUTOCONF_BINARY)
 	$(MAKE) \
