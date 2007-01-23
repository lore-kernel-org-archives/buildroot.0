From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 23 Jan 2007 03:47:07 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kexec
Message-ID: <20070123114707.7640F4857E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-23 03:47:05 -0800 (Tue, 23 Jan 2007)
New Revision: 17488

Log:
- update timestamp of the build_dir binary by stripping it


Modified:
   trunk/buildroot/package/kexec/kexec.mk


Changeset:
Modified: trunk/buildroot/package/kexec/kexec.mk
===================================================================
--- trunk/buildroot/package/kexec/kexec.mk	2007-01-23 11:44:14 UTC (rev 17487)
+++ trunk/buildroot/package/kexec/kexec.mk	2007-01-23 11:47:05 UTC (rev 17488)
@@ -38,7 +38,7 @@
 	toolchain/patch-kernel.sh $(KEXEC_DIR) $(KEXEC_DIR)/debian/patches \*.patch
 endif
 	toolchain/patch-kernel.sh $(KEXEC_DIR) package/kexec/ kexec\*.dpatch
-	touch $(KEXEC_DIR)/.unpacked
+	touch $@
 
 $(KEXEC_DIR)/.configured: $(KEXEC_DIR)/.unpacked
 	(cd $(KEXEC_DIR); rm -rf config.cache; \
@@ -50,15 +50,17 @@
 		--prefix=/ \
 		$(KEXEC_CONFIG_OPTS) \
 	);
-	touch $(KEXEC_DIR)/.configured
+	touch $@
 
 $(KEXEC_DIR)/$(KEXEC_BINARY): $(KEXEC_DIR)/.configured
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(KEXEC_DIR)
+	$(STRIP) -s $@
 
 $(TARGET_DIR)/$(KEXEC_TARGET_BINARY): $(KEXEC_DIR)/$(KEXEC_BINARY)
 	cp -dpf $(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/$(KEXEC_BINARY) \
 		$(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/kdump \
 		$(TARGET_DIR)/sbin/
+	touch -c $@
 
 kexec: uclibc $(TARGET_DIR)/$(KEXEC_TARGET_BINARY)
 
