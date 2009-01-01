From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Thu,  1 Jan 2009 17:28:52 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pciutils
Message-ID: <20090101172852.A361A76C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-01 17:28:51 +0000 (Thu, 01 Jan 2009)
New Revision: 24635

Log:
* Removed duplicate PCIUTILS_VERSION
* When installing pci.ids[.gz] the -D means create all components leading up, using $(@D) does not include the filename, the last directory component is then /usr/share. pci.ids[.gz] is therefore created as /usr/share/misc (misc being the filename). Using $@ fixes this, the directory path is created and the file is installed as /usr/share/misc/pci.ids[.gz] .


Modified:
   trunk/buildroot/package/pciutils/pciutils.mk


Changeset:
Modified: trunk/buildroot/package/pciutils/pciutils.mk
===================================================================
--- trunk/buildroot/package/pciutils/pciutils.mk	2009-01-01 14:05:54 UTC (rev 24634)
+++ trunk/buildroot/package/pciutils/pciutils.mk	2009-01-01 17:28:51 UTC (rev 24635)
@@ -3,7 +3,6 @@
 # pciutils
 #
 #############################################################
-PCIUTILS_VERSION:=2.2.10
 PCIUTILS_VERSION:=3.0.1
 PCIUTILS_SOURCE:=pciutils-$(PCIUTILS_VERSION).tar.gz
 PCIUTILS_CAT:=$(ZCAT)
@@ -55,7 +54,7 @@
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
 $(TARGET_DIR)/usr/share/misc/$(PCIIDS_FILE): $(PCIUTILS_DIR)/.unpacked
-	$(INSTALL) -D $(PCIUTILS_DIR)/$(PCIIDS_FILE) $(@D)
+	$(INSTALL) -D $(PCIUTILS_DIR)/$(PCIIDS_FILE) $@
 
 pciutils: uclibc $(if $(BR2_PACKAGE_ZLIB),zlib) $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/usr/share/misc/$(PCIIDS_FILE)
 
