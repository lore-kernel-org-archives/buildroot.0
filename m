From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 15 Dec 2006 05:34:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microperl
Message-ID: <20061215133430.5710E48570@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-15 05:34:29 -0800 (Fri, 15 Dec 2006)
New Revision: 16939

Log:
- add config option to specify modules to be copied to the target.


Modified:
   trunk/buildroot/package/microperl/Config.in
   trunk/buildroot/package/microperl/microperl.mk


Changeset:
Modified: trunk/buildroot/package/microperl/Config.in
===================================================================
--- trunk/buildroot/package/microperl/Config.in	2006-12-15 02:02:23 UTC (rev 16938)
+++ trunk/buildroot/package/microperl/Config.in	2006-12-15 13:34:29 UTC (rev 16939)
@@ -3,3 +3,13 @@
 	default n
 	help
 	  Perl without operating-specific functions such as readdir.
+
+config BR2_PACKAGE_MICROPERL_MODULES
+	string "perl modules"
+	default ""
+	depends on BR2_PACKAGE_MICROPERL
+	help
+	  List of microperl modules to copy to the rootfs.
+	  E.g.
+	  warnings.pm warnings/register.pm strict.pm constant.pm vars.pm 
+	  Exporter.pm Exporter/Heavy.pm Carp.pm Getopt/Long.pm

Modified: trunk/buildroot/package/microperl/microperl.mk
===================================================================
--- trunk/buildroot/package/microperl/microperl.mk	2006-12-15 02:02:23 UTC (rev 16938)
+++ trunk/buildroot/package/microperl/microperl.mk	2006-12-15 13:34:29 UTC (rev 16939)
@@ -10,6 +10,10 @@
 MICROPERL_SITE=ftp://ftp.cpan.org/pub/CPAN/src/5.0
 MICROPERL_DIR=$(BUILD_DIR)/perl-$(MICROPERL_VER)
 
+MICROPERL_MODS_DIR=/usr/lib/perl$(MICROPERL_MAJ)/$(MICROPERL_VER)
+MICROPERL_MODS=$(subst ",,$(BR2_PACKAGE_MICROPERL_MODULES))
+# ")
+
 $(DL_DIR)/$(MICROPERL_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MICROPERL_SITE)/$(MICROPERL_SOURCE)
 
@@ -20,11 +24,10 @@
 $(MICROPERL_DIR)/.configured: $(MICROPERL_DIR)/.source
 	(cd $(MICROPERL_DIR) ; chmod u+w uconfig.h ; . ./uconfig.sh ; \
 	 make -f Makefile.micro regen_uconfig ; \
-	 $(SED) \
-	 's,PRIVLIB ".*,PRIVLIB "/usr/lib/perl$(MICROPERL_MAJ)/$(MICROPERL_VER)",' \
-	 -e 's,PRIVLIB_EXP ".*,PRIVLIB_EXP "/usr/lib/perl$(MICROPERL_MAJ)/$(MICROPERL_VER)",' \
-	 -e 's,BIN ".*,BIN "/usr/bin",' \
-	 ./uconfig.h ; \
+	 $(SED) 's,PRIVLIB ".*,PRIVLIB "/$(MICROPERL_MODS_DIR)",' \
+		 -e 's,PRIVLIB_EXP ".*,PRIVLIB_EXP "$(MICROPERL_MODS_DIR)",' \
+		 -e 's,BIN ".*,BIN "/usr/bin",' \
+		 ./uconfig.h ; \
 	)
 	touch $@
 
@@ -32,7 +35,18 @@
 	$(MAKE) -f Makefile.micro CC=$(TARGET_CC) \
 		OPTIMIZE="$(TARGET_CFLAGS)" -C $(MICROPERL_DIR)
 
+__perl_tgt_dir=$(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$(dir $$i)
 $(TARGET_DIR)/usr/bin/microperl: $(MICROPERL_DIR)/microperl
+ifneq ($(MICROPERL_MODS),)
+	(cd $(MICROPERL_DIR) ; \
+	 for i in $(patsubst %,$(TARGET_DIR)/$(MICROPERL_MODS_DIR)/%,$(dir $(MICROPERL_MODS))) ; do \
+		[ -d $$i ] || mkdir -p $$i ; \
+	 done ; \
+	 for i in $(MICROPERL_MODS) ; do \
+	 cp -dpf lib/$$i $(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i ; \
+	 done; \
+	)
+endif
 	cp -dpf $(MICROPERL_DIR)/microperl $(TARGET_DIR)/usr/bin/microperl
 
 microperl: uclibc $(TARGET_DIR)/usr/bin/microperl
@@ -40,8 +54,9 @@
 microperl-source: $(DL_DIR)/$(MICROPERL_SOURCE)
 
 microperl-clean:
-	rm -f $(TARGET_DIR)/usr/bin/microperl
-	-$(MAKE) -C $(MICROPERL_DIR) clean
+	rm -rf $(TARGET_DIR)/usr/bin/microperl $(TARGET_DIR)/$(MICROPERL_MODS_DIR)
+	-rmdir $(TARGET_DIR)/usr/lib/perl$(MICROPERL_MAJ)
+	-$(MAKE) -C $(MICROPERL_DIR) -f Makefile.micro clean
 
 microperl-dirclean:
 	rm -rf $(MICROPERL_DIR)
