From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  2 Jan 2009 08:29:32 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/socat
Message-ID: <20090102082932.46BD0769FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-02 08:29:31 +0000 (Fri, 02 Jan 2009)
New Revision: 24643

Log:
Bump socat version, optionally add configure variables

Modified:
   trunk/buildroot/package/socat/Config.in
   trunk/buildroot/package/socat/socat.mk


Changeset:
Modified: trunk/buildroot/package/socat/Config.in
===================================================================
--- trunk/buildroot/package/socat/Config.in	2009-01-01 21:20:46 UTC (rev 24642)
+++ trunk/buildroot/package/socat/Config.in	2009-01-02 08:29:31 UTC (rev 24643)
@@ -1,6 +1,28 @@
-config BR2_PACKAGE_SOCAT
+menuconfig BR2_PACKAGE_SOCAT
 	bool "socat"
 	help
 	  Multipurpose socket relay program.
 
 	  http://www.dest-unreach.org/socat/
+if BR2_PACKAGE_SOCAT
+config BR2_PACKAGE_SOCAT_PREDEF_CRDLY_SHIFT
+	string "CRDLY_SHIFT"
+	default "9"
+	help
+	  Add configure variable
+
+config BR2_PACKAGE_SOCAT_PREDEF_TABDLY_SHIFT
+	string "TABDLY_SHIFT"
+	default "11"
+	help
+	  Add configure variable
+
+config BR2_PACKAGE_SOCAT_PREDEF_CSIZE_SHIFT
+	string "CSIZE_SHIFT"
+	default "4"
+	help
+	  Add configure variable
+
+endif
+
+

Modified: trunk/buildroot/package/socat/socat.mk
===================================================================
--- trunk/buildroot/package/socat/socat.mk	2009-01-01 21:20:46 UTC (rev 24642)
+++ trunk/buildroot/package/socat/socat.mk	2009-01-02 08:29:31 UTC (rev 24643)
@@ -4,24 +4,47 @@
 #
 #############################################################
 
-SOCAT_VERSION=1.4.0.3
+#SOCAT_MAJOR_VERSION=1.4
+#SOCAT_MINOR_VERSION=.0.3
+SOCAT_MAJOR_VERSION=2.0.0-b2
+SOCAT_MINOR_VERSION=
 
 # Don't alter below this line unless you (think) you know
 # what you are doing! Danger, Danger!
 
-SOCAT_SOURCE=socat-$(SOCAT_VERSION).tar.bz2
+SOCAT_SOURCE=socat-$(SOCAT_MAJOR_VERSION)$(SOCAT_MINOR_VERSION).tar.bz2
 SOCAT_CAT:=$(BZCAT)
 SOCAT_SITE=http://www.dest-unreach.org/socat/download/
 #SOCAT_DIR=$(BUILD_DIR)/${shell basename $(SOCAT_SOURCE) .tar.bz2}
-SOCAT_DIR=$(BUILD_DIR)/socat-1.4
+SOCAT_DIR=$(BUILD_DIR)/socat-$(SOCAT_MAJOR_VERSION)
 #SOCAT_WORKDIR=$(BUILD_DIR)/socat_workdir
 SOCAT_WORKDIR=$(SOCAT_DIR)
 
+# SOCAT Configure opts taken from Config/config.Linux-2.6.24.h
+CRDLY_SHIFT := $(strip $(subst ",,$(BR2_PACKAGE_SOCAT_PREDEF_CRDLY_SHIFT)))
+#"))
+TABDLY_SHIFT := $(strip $(subst ",,$(BR2_PACKAGE_SOCAT_PREDEF_TABDLY_SHIFT)))
+#"))
+CSIZE_SHIFT := $(strip $(subst ",,$(BR2_PACKAGE_SOCAT_PREDEF_CSIZE_SHIFT)))
+#"))
+
+SOCAT_CONFIGURE_OPTS :=
+ifneq ($(CRDLY_SHIFT),)
+SOCAT_CONFIGURE_OPTS += sc_cv_sys_crdly_shift=$(CRDLY_SHIFT)
+endif
+ifneq ($(TABDLY_SHIFT),)
+SOCAT_CONFIGURE_OPTS += sc_cv_sys_tabdly_shift=$(TABDLY_SHIFT)
+endif
+ifneq ($(CRDLY_SHIFT),)
+SOCAT_CONFIGURE_OPTS += sc_cv_sys_csize_shift=$(CSIZE_SHIFT)
+endif
+
 $(DL_DIR)/$(SOCAT_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SOCAT_SITE)/$(SOCAT_SOURCE)
 
 $(SOCAT_DIR)/.unpacked: $(DL_DIR)/$(SOCAT_SOURCE)
 	$(SOCAT_CAT) $(DL_DIR)/$(SOCAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(SOCAT_DIR) package/socat/ socat-$(SOCAT_MAJOR_VERSION)\*.patch
 	touch $(SOCAT_DIR)/.unpacked
 
 $(SOCAT_WORKDIR)/Makefile: $(SOCAT_DIR)/.unpacked
@@ -30,6 +53,7 @@
 	(cd $(SOCAT_WORKDIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		$(SOCAT_CONFIGURE_OPTS) \
 		$(SOCAT_DIR)/configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -50,6 +74,9 @@
 	$(SED) 's/#define HAVE_TERMIOS_ISPEED 1/#undef HAVE_TERMIOS_ISPEED/g' config.h; \
 	)
 
+#	cp $(SOCAT_WORKDIR)/Config/config.Linux-2-6*.h $(SOCAT_WORKDIR)/config.h ; \
+
+
 $(SOCAT_WORKDIR)/socat: $(SOCAT_WORKDIR)/Makefile
 	rm -f $@
 	$(MAKE) -C $(SOCAT_WORKDIR)
