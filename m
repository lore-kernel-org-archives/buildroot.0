From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed, 25 Jun 2008 23:50:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ethtool
Message-ID: <20080626065045.627EB3C289@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-06-25 23:50:44 -0700 (Wed, 25 Jun 2008)
New Revision: 22512

Log:
Don't use a stamp file to note whether the package has been installed into the $(TARGET_DIR)


Modified:
   trunk/buildroot/package/ethtool/ethtool.mk


Changeset:
Modified: trunk/buildroot/package/ethtool/ethtool.mk
===================================================================
--- trunk/buildroot/package/ethtool/ethtool.mk	2008-06-26 06:43:33 UTC (rev 22511)
+++ trunk/buildroot/package/ethtool/ethtool.mk	2008-06-26 06:50:44 UTC (rev 22512)
@@ -9,6 +9,7 @@
 ETHTOOL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gkernel/
 ETHTOOL_DIR:=$(BUILD_DIR)/ethtool-$(ETHTOOL_VERSION)
 ETHTOOL_CAT:=$(ZCAT)
+ETHTOOL_BINARY=usr/sbin/ethtool
 
 $(DL_DIR)/$(ETHTOOL_SOURCE):
 	$(WGET) -P $(DL_DIR) $(ETHTOOL_SITE)/$(ETHTOOL_SOURCE)
@@ -33,11 +34,11 @@
 $(ETHTOOL_DIR)/ethtool: $(ETHTOOL_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(ETHTOOL_DIR)
 
-$(ETHTOOL_DIR)/.installed: $(ETHTOOL_DIR)/ethtool
-	cp $(ETHTOOL_DIR)/ethtool $(TARGET_DIR)/usr/sbin
-	touch $@
+$(TARGET_DIR)/$(ETHTOOL_BINARY): $(ETHTOOL_DIR)/ethtool
+	cp $(ETHTOOL_DIR)/ethtool $@
+	$(STRIPCMD) $@
 
-ethtool: uclibc $(ETHTOOL_DIR)/.installed
+ethtool: uclibc $(TARGET_DIR)/$(ETHTOOL_BINARY)
 
 ethtool-source: $(DL_DIR)/$(ETHTOOL_SOURCE)
 
