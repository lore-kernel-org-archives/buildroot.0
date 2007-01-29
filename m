From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 29 Jan 2007 12:06:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: automake microperl
Message-ID: <20070129200601.A51B2485AD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-29 12:06:00 -0800 (Mon, 29 Jan 2007)
New Revision: 17643

Log:
- start populating perl stuff into the rootfs to make automake work


Modified:
   trunk/buildroot/package/automake/automake.mk
   trunk/buildroot/package/microperl/microperl.mk


Changeset:
Modified: trunk/buildroot/package/automake/automake.mk
===================================================================
--- trunk/buildroot/package/automake/automake.mk	2007-01-29 18:34:37 UTC (rev 17642)
+++ trunk/buildroot/package/automake/automake.mk	2007-01-29 20:06:00 UTC (rev 17643)
@@ -18,6 +18,7 @@
 
 $(AUTOMAKE_DIR)/.unpacked: $(DL_DIR)/$(AUTOMAKE_SOURCE)
 	$(AUTOMAKE_CAT) $(DL_DIR)/$(AUTOMAKE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(AUTOMAKE_DIR)
 	touch $@
 
 $(AUTOMAKE_DIR)/.configured: $(AUTOMAKE_DIR)/.unpacked
@@ -61,7 +62,7 @@
 	    infodir=$(TARGET_DIR)/usr/info \
 	    mandir=$(TARGET_DIR)/usr/man \
 	    includedir=$(TARGET_DIR)/usr/include \
-	    -C $(AUTOMAKE_DIR) install;
+	    -C $(AUTOMAKE_DIR) install
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	touch -c $(TARGET_DIR)/$(AUTOMAKE_TARGET_BINARY)

Modified: trunk/buildroot/package/microperl/microperl.mk
===================================================================
--- trunk/buildroot/package/microperl/microperl.mk	2007-01-29 18:34:37 UTC (rev 17642)
+++ trunk/buildroot/package/microperl/microperl.mk	2007-01-29 20:06:00 UTC (rev 17643)
@@ -13,7 +13,11 @@
 MICROPERL_MODS_DIR=/usr/lib/perl$(MICROPERL_MAJ)/$(MICROPERL_VER)
 MICROPERL_MODS=$(subst ",,$(BR2_PACKAGE_MICROPERL_MODULES))
 # ")
-
+ifeq ($(BR2_PACKAGE_AUTOMAKE),y)
+MICROPERL_MODS+=File/Basename.pm Errno.pm Config.pm IO/File.pm Symbol.pm \
+	SelectSaver.pm IO/Seekable.pm IO/Handle.pm IO.pm XSLoader.pm \
+	DynaLoader.pm AutoLoader.pm
+endif
 $(DL_DIR)/$(MICROPERL_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MICROPERL_SITE)/$(MICROPERL_SOURCE)
 
@@ -22,6 +26,13 @@
 	touch $@
 
 $(MICROPERL_DIR)/.configured: $(MICROPERL_DIR)/.source
+ifeq ($(BR2_PACKAGE_AUTOMAKE),y)
+	# we need to build a perl for the host just for Errno.pm
+	(cd $(MICROPERL_DIR) ; ./Configure -de ; \
+	 $(MAKE) CC="$(HOSTCC)" ; \
+	 $(SHELL) ext/util/make_ext nonxs Errno MAKE="$(firstword $(MAKE))" ; \
+	)
+endif
 	(cd $(MICROPERL_DIR) ; chmod u+w uconfig.h ; . ./uconfig.sh ; \
 	 $(MAKE) -f Makefile.micro regen_uconfig ; \
 	 $(SED) 's,PRIVLIB ".*,PRIVLIB "/$(MICROPERL_MODS_DIR)",' \
@@ -34,6 +45,11 @@
 $(MICROPERL_DIR)/microperl: $(MICROPERL_DIR)/.configured
 	$(MAKE) -f Makefile.micro CC=$(TARGET_CC) \
 		OPTIMIZE="$(TARGET_CFLAGS)" -C $(MICROPERL_DIR)
+ifeq ($(BR2_PACKAGE_AUTOMAKE),y)
+	#(cd $(@D) ; \
+	# CONFIG=uconfig.h $(SHELL) ext/util/make_ext nonxs Errno MAKE="$(firstword $(MAKE))" ; \
+	#)
+endif
 
 $(TARGET_DIR)/usr/bin/microperl: $(MICROPERL_DIR)/microperl
 ifneq ($(MICROPERL_MODS),)
@@ -47,13 +63,15 @@
 	)
 endif
 	cp -dpf $(MICROPERL_DIR)/microperl $(TARGET_DIR)/usr/bin/microperl
+	(cd $(TARGET_DIR)/usr/bin ; rm -f perl ; ln -s microperl perl ;)
 
 microperl: uclibc $(TARGET_DIR)/usr/bin/microperl
 
 microperl-source: $(DL_DIR)/$(MICROPERL_SOURCE)
 
 microperl-clean:
-	rm -rf $(TARGET_DIR)/usr/bin/microperl $(TARGET_DIR)/$(MICROPERL_MODS_DIR)
+	rm -rf $(TARGET_DIR)/usr/bin/microperl \
+		$(TARGET_DIR)/$(MICROPERL_MODS_DIR) $(TARGET_DIR)/usr/bin/perl
 	-rmdir $(TARGET_DIR)/usr/lib/perl$(MICROPERL_MAJ)
 	-$(MAKE) -C $(MICROPERL_DIR) -f Makefile.micro clean
 
