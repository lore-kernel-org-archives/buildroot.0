From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 08:14:38 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microperl
Message-ID: <20090125081438.BE00D76D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 08:14:37 +0000 (Sun, 25 Jan 2009)
New Revision: 25011

Log:
Fix make problems with perl

Modified:
   trunk/buildroot/package/microperl/microperl.mk


Changeset:
Modified: trunk/buildroot/package/microperl/microperl.mk
===================================================================
--- trunk/buildroot/package/microperl/microperl.mk	2009-01-25 01:00:15 UTC (rev 25010)
+++ trunk/buildroot/package/microperl/microperl.mk	2009-01-25 08:14:37 UTC (rev 25011)
@@ -23,18 +23,38 @@
 
 $(MICROPERL_DIR)/.source: $(DL_DIR)/$(MICROPERL_SOURCE)
 	$(MICROPERL_CAT) $(DL_DIR)/$(MICROPERL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	(cd $(MICROPERL_DIR); chmod -R u+w *)
 	touch $@
 
-$(MICROPERL_DIR)/.configured: $(MICROPERL_DIR)/.source
-ifeq ($(BR2_PACKAGE_AUTOMAKE),y)
+$(MICROPERL_DIR)/.host_configured: $(MICROPERL_DIR)/.source
 	# we need to build a perl for the host just for Errno.pm
-	(cd $(MICROPERL_DIR); ./Configure -de; \
-	 $(MAKE) CC="$(HOSTCC)"; \
-	 $(SHELL) ext/util/make_ext nonxs Errno MAKE="$(firstword $(MAKE))"; \
+	(cd $(MICROPERL_DIR); ./Configure -Dcc=$(HOSTCC) -de  )
+	touch $@
+
+
+$(MICROPERL_DIR)/.host_configured_and_fixed: $(MICROPERL_DIR)/.host_configured
+	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/makefile
+	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/x2p/makefile
+	touch $@
+
+$(MICROPERL_DIR)/.host_make: $(MICROPERL_DIR)/.host_configured_and_fixed
+	$(MAKE) -C $(MICROPERL_DIR)		|| echo "An error is expected on make"
+	touch $@
+
+$(MICROPERL_DIR)/.host_make_fixed: $(MICROPERL_DIR)/.host_make
+	$(SED) 's#^.*<asm/page.h>.*##g' $(MICROPERL_DIR)/ext/IPC/SysV/SysV.c
+	$(MAKE) -C $(MICROPERL_DIR) test	|| echo "An error is expected on make test"
+	touch $@
+
+$(MICROPERL_DIR)/.configured: $(MICROPERL_DIR)/.host_make_fixed
+	# we need to build a perl for the host just for Errno.pm
+	(cd $(MICROPERL_DIR); \
+	 chmod a+x ext/util/make_ext; \
+	 ext/util/make_ext nonxs Errno MAKE="$(firstword $(MAKE))" \
 	)
-endif
-	(cd $(MICROPERL_DIR); chmod u+w uconfig.h; . ./uconfig.sh; \
-	 $(MAKE) -f Makefile.micro regen_uconfig; \
+	(cd $(MICROPERL_DIR); \
+	 chmod u+w uconfig.h; ./uconfig.sh; \
+	 $(MAKE) -f $(MICROPERL_DIR)/Makefile.micro regen_uconfig; \
 	 $(SED) 's,PRIVLIB ".*,PRIVLIB "/$(MICROPERL_MODS_DIR)",' \
 		 -e 's,PRIVLIB_EXP ".*,PRIVLIB_EXP "$(MICROPERL_MODS_DIR)",' \
 		 -e 's,BIN ".*,BIN "/usr/bin",' \
@@ -43,7 +63,7 @@
 	touch $@
 
 $(MICROPERL_DIR)/microperl: $(MICROPERL_DIR)/.configured
-	$(MAKE) -f Makefile.micro CC=$(TARGET_CC) \
+	$(MAKE) -f $(MICROPERL_DIR)/Makefile.micro CC=$(TARGET_CC) \
 		OPTIMIZE="$(TARGET_CFLAGS)" -C $(MICROPERL_DIR)
 ifeq ($(BR2_PACKAGE_AUTOMAKE),y)
 	#(cd $(@D); \
@@ -58,7 +78,7 @@
 		[ -d $$i ] || mkdir -p $$i; \
 	 done; \
 	 for i in $(MICROPERL_MODS); do \
-	 cp -dpf lib/$$i $(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \
+	 cp -dpf $(MICROPERL_DIR)/lib/$$i $(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \
 	 done; \
 	)
 endif
@@ -69,6 +89,14 @@
 
 microperl-source: $(DL_DIR)/$(MICROPERL_SOURCE)
 
+microperl-unpacked: $(MICROPERL_DIR)/.source
+
+microperl-config: $(MICROPERL_DIR)/.host_configured
+
+microperl-host: $(MICROPERL_DIR)/.host_make
+
+microperl-host-fixed: $(MICROPERL_DIR)/.host_make_fixed
+
 microperl-clean:
 	rm -rf $(TARGET_DIR)/usr/bin/microperl \
 		$(TARGET_DIR)/$(MICROPERL_MODS_DIR) $(TARGET_DIR)/usr/bin/perl
