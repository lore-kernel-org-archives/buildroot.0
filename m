From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 30 Sep 2007 11:06:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20070930180635.2FE6B300D4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-30 11:06:32 -0700 (Sun, 30 Sep 2007)
New Revision: 20150

Log:
- put a static grub into the staging dir


Modified:
   trunk/buildroot/target/x86/grub/grub.mk


Changeset:
Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2007-09-30 17:55:43 UTC (rev 20149)
+++ trunk/buildroot/target/x86/grub/grub.mk	2007-09-30 18:06:32 UTC (rev 20150)
@@ -97,6 +97,11 @@
 
 $(GRUB_DIR)/$(GRUB_BINARY): $(GRUB_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(GRUB_DIR)
+	rm -f $(GRUB_DIR)/$(GRUB_BINARY)
+	$(MAKE) CC=$(TARGET_CC) CFLAGS+=-static -C $(GRUB_DIR)/grub grub
+	mkdir -p $(dir $(STAGING_DIR)/$(GRUB_TARGET_BINARY))
+	mv $(GRUB_DIR)/$(GRUB_BINARY) $(STAGING_DIR)/$(GRUB_TARGET_BINARY).static
+	$(MAKE) CC=$(TARGET_CC) -C $(GRUB_DIR)/grub
 
 $(GRUB_DIR)/.installed: $(GRUB_DIR)/$(GRUB_BINARY)
 	cp $(GRUB_DIR)/$(GRUB_BINARY) $(TARGET_DIR)/$(GRUB_TARGET_BINARY)
