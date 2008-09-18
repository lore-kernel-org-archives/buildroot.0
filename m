From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu, 18 Sep 2008 01:42:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/aumix
Message-ID: <20080918084256.E277B3C64F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-18 01:42:56 -0700 (Thu, 18 Sep 2008)
New Revision: 23423

Log:
aumix: fix install rule to target to support multiple projects

This patch will let aumix depend on an installed file on the target root file
system instead of touched file.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/audio/aumix/aumix.mk


Changeset:
Modified: trunk/buildroot/package/audio/aumix/aumix.mk
===================================================================
--- trunk/buildroot/package/audio/aumix/aumix.mk	2008-09-18 06:48:20 UTC (rev 23422)
+++ trunk/buildroot/package/audio/aumix/aumix.mk	2008-09-18 08:42:56 UTC (rev 23423)
@@ -41,11 +41,10 @@
 $(AUMIX_DIR)/src/aumix: $(AUMIX_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(AUMIX_DIR)
 
-$(AUMIX_DIR)/.installed: $(AUMIX_DIR)/src/aumix
+$(TARGET_DIR)/usr/bin/aumix: $(AUMIX_DIR)/src/aumix
 	$(MAKE) -C $(AUMIX_DIR) DESTDIR=$(TARGET_DIR) install
-	touch $@
 
-aumix: uclibc ncurses $(AUMIX_DIR)/.installed
+aumix: uclibc ncurses $(TARGET_DIR)/usr/bin/aumix
 
 aumix-source: $(DL_DIR)/$(AUMIX_SOURCE)
 
