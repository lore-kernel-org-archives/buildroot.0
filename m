From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 24 Nov 2006 01:49:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microperl
Message-ID: <20061124094917.BE484485E8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-24 01:49:16 -0800 (Fri, 24 Nov 2006)
New Revision: 16649

Log:
- fix microperl uconfig and pass the target cflags in properly.


Modified:
   trunk/buildroot/package/microperl/microperl.mk


Changeset:
Modified: trunk/buildroot/package/microperl/microperl.mk
===================================================================
--- trunk/buildroot/package/microperl/microperl.mk	2006-11-23 15:59:12 UTC (rev 16648)
+++ trunk/buildroot/package/microperl/microperl.mk	2006-11-24 09:49:16 UTC (rev 16649)
@@ -3,7 +3,8 @@
 # microperl
 #
 #############################################################
-MICROPERL_VER=5.8.8
+MICROPERL_MAJ=5
+MICROPERL_VER=$(MICROPERL_MAJ).8.8
 MICROPERL_SOURCE=perl-$(MICROPERL_VER).tar.bz2
 MICROPERL_CAT:=$(BZCAT)
 MICROPERL_SITE=ftp://ftp.cpan.org/pub/CPAN/src/5.0
@@ -14,11 +15,23 @@
 
 $(MICROPERL_DIR)/.source: $(DL_DIR)/$(MICROPERL_SOURCE)
 	$(MICROPERL_CAT) $(DL_DIR)/$(MICROPERL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(MICROPERL_DIR)/.source
+	touch $@
 
-$(MICROPERL_DIR)/microperl: $(MICROPERL_DIR)/.source
-	$(MAKE) -f Makefile.micro CC=$(TARGET_CC) -C $(MICROPERL_DIR)
+$(MICROPERL_DIR)/.configured: $(MICROPERL_DIR)/.source
+	(cd $(MICROPERL_DIR) ; chmod u+w uconfig.h ; . ./uconfig.sh ; \
+	 make -f Makefile.micro regen_uconfig ; \
+	 $(SED) \
+	 's,PRIVLIB ".*,PRIVLIB "/usr/lib/perl$(MICROPERL_MAJ)/$(MICROPERL_VER)",' \
+	 -e 's,PRIVLIB_EXP ".*,PRIVLIB_EXP "/usr/lib/perl$(MICROPERL_MAJ)/$(MICROPERL_VER)",' \
+	 -e 's,BIN ".*,BIN "/usr/bin",' \
+	 ./uconfig.h ; \
+	)
+	touch $@
 
+$(MICROPERL_DIR)/microperl: $(MICROPERL_DIR)/.configured
+	$(MAKE) -f Makefile.micro CC=$(TARGET_CC) \
+		OPTIMIZE="$(TARGET_CFLAGS)" -C $(MICROPERL_DIR)
+
 $(TARGET_DIR)/usr/bin/microperl: $(MICROPERL_DIR)/microperl
 	cp -dpf $(MICROPERL_DIR)/microperl $(TARGET_DIR)/usr/bin/microperl
 
