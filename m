From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 10:27:48 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: docs package target/device
Message-ID: <20090116102748.E67F2768D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 10:27:48 +0000 (Fri, 16 Jan 2009)
New Revision: 24868

Log:
buildroot: add BR2_BACKUP_SITE and DOWNLOAD helper

This is the long requested backup mirror support. So far only enabled
for Makefile.autotools.in, but there's no reason why we cannot use
DOWNLOAD everywhere.

Notice, I'm still syncing http://buildroot.uclibc.org/downloads/sources/

Modified:
   trunk/buildroot/docs/buildroot.html
   trunk/buildroot/package/Makefile.autotools.in
   trunk/buildroot/target/device/Config.in.mirrors


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2009-01-16 10:27:39 UTC (rev 24867)
+++ trunk/buildroot/docs/buildroot.html	2009-01-16 10:27:48 UTC (rev 24868)
@@ -994,7 +994,7 @@
     <a name="ex2line11" id="ex2line11">11</a>  FOO_TARGET_BINARY:=usr/bin/foo
     <a name="ex2line12" id="ex2line12">12</a>
     <a name="ex2line13" id="ex2line13">13</a>  $(DL_DIR)/$(FOO_SOURCE):
-    <a name="ex2line14" id="ex2line14">14</a>          $(WGET) -P $(DL_DIR) $(FOO_SITE)/$(FOO_SOURCE)
+    <a name="ex2line14" id="ex2line14">14</a>          $(call DOWNLOAD,$(FOO_SITE),$(FOO_SOURCE))
     <a name="ex2line15" id="ex2line15">15</a>
     <a name="ex2line16" id="ex2line16">16</a>  $(FOO_DIR)/.source: $(DL_DIR)/$(FOO_SOURCE)
     <a name="ex2line17" id="ex2line17">17</a>          $(ZCAT) $(DL_DIR)/$(FOO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -

Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2009-01-16 10:27:39 UTC (rev 24867)
+++ trunk/buildroot/package/Makefile.autotools.in	2009-01-16 10:27:48 UTC (rev 24868)
@@ -119,6 +119,30 @@
 TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
+################################################################################
+# DOWNLOAD -- Download helper. Will try to download source from:
+# 1) BR2_PRIMARY_SITE if enabled
+# 2) Download site
+# 3) BR2_BACKUP_SITE if enabled
+#
+# Argument 1 is the source location
+# Argument 2 is the source filename
+#
+# E.G. use like this:
+# $(call DOWNLOAD,$(FOO_SITE),$(FOO_SOURCE))
+################################################################################
+
+# support make source-check/external-deps
+ifneq ($(SPIDER),)
+DOWNLOAD:=$(WGET) -P $(DL_DIR) $(1)/$(2)
+else
+define DOWNLOAD
+	$(Q)test -e $(DL_DIR)/$(2) || \
+	for site in $(strip $(subst ",,$(BR2_PRIMARY_SITE))) $(1) $(strip $(subst ",,$(BR2_BACKUP_SITE))); \
+	do $(WGET) -P $(DL_DIR) $$site/$(2) && exit; done
+endef
+endif
+
 # Utility programs used to build packages
 TAR ?= tar
 #ACLOCAL_STAGING_DIR ?= $(STAGING_DIR)/usr/share/aclocal
@@ -136,17 +160,12 @@
 # Retrieve and unpack the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
 # support make source-check/external-deps
-ifneq ($(SPIDER),)
-	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
-	$(if $($(PKG)_PATCH),$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
-else
+ifeq ($(SPIDER),)
 	$(call MESSAGE,"Downloading")
-ifneq ($(strip $(subst ",,$(BR2_PRIMARY_SITE))),)
-#"))
-	-$(Q)test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR) $(BR2_PRIMARY_SITE)/$($(PKG)_SOURCE)
 endif
-	$(Q)test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
-	$(if $($(PKG)_PATCH),$(Q)test -e $(DL_DIR)/$($(PKG)_PATCH) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
+	$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE))
+	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))
+ifeq ($(SPIDER),)
 	$(Q)mkdir -p $(@D)
 	$(Q)touch $@
 endif

Modified: trunk/buildroot/target/device/Config.in.mirrors
===================================================================
--- trunk/buildroot/target/device/Config.in.mirrors	2009-01-16 10:27:39 UTC (rev 24867)
+++ trunk/buildroot/target/device/Config.in.mirrors	2009-01-16 10:27:48 UTC (rev 24868)
@@ -9,6 +9,14 @@
 	  default if the file is not found.
 	  NOTE: This only works for packages using the Makefile.autotools.in
 
+config BR2_BACKUP_SITE
+	string "Backup download site"
+	default "http://buildroot.uclibc.org/downloads/sources/"
+	help
+	  Backup site to download from. If this option is set then buildroot
+	  will fall back to download package sources from here if the
+	  normal location fails.
+
 config BR2_SOURCEFORGE_MIRROR
 	string "Sourceforge mirror site"
 	default "easynews"
