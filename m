From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed, 25 Jun 2008 23:43:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  mii-diag
Message-ID: <20080626064335.93C843C289@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-06-25 23:43:33 -0700 (Wed, 25 Jun 2008)
New Revision: 22511

Log:
Added mii-diag package


Added:
   trunk/buildroot/package/mii-diag/
   trunk/buildroot/package/mii-diag/Config.in
   trunk/buildroot/package/mii-diag/mii-diag-strchr.patch
   trunk/buildroot/package/mii-diag/mii-diag.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-06-26 03:26:57 UTC (rev 22510)
+++ trunk/buildroot/package/Config.in	2008-06-26 06:43:33 UTC (rev 22511)
@@ -179,6 +179,7 @@
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS || !BR2_PACKAGE_BUSYBOX_SNAPSHOT
 source "package/microcom/Config.in"
 endif
+source "package/mii-diag/Config.in"
 source "package/mrouted/Config.in"
 source "package/mutt/Config.in"
 source "package/nbd/Config.in"

Added: trunk/buildroot/package/mii-diag/Config.in
===================================================================
--- trunk/buildroot/package/mii-diag/Config.in	                        (rev 0)
+++ trunk/buildroot/package/mii-diag/Config.in	2008-06-26 06:43:33 UTC (rev 22511)
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_MIIDIAG
+	bool "mii-diag"
+	default n
+	help
+	  mii-diag allows you to manipulate the MII registers of
+	  network cards.

Added: trunk/buildroot/package/mii-diag/mii-diag-strchr.patch
===================================================================
--- trunk/buildroot/package/mii-diag/mii-diag-strchr.patch	                        (rev 0)
+++ trunk/buildroot/package/mii-diag/mii-diag-strchr.patch	2008-06-26 06:43:33 UTC (rev 22511)
@@ -0,0 +1,20 @@
+--- mii-diag-2.11.orig/mii-diag.c.orig	2008-06-25 11:08:52.000000000 +1000
++++ mii-diag-2.11.orig/mii-diag.c	2005-03-27 03:56:33.000000000 +1000
+@@ -174,7 +174,7 @@
+ {
+ 	int c, errflag = 0;
+ 	char **spp, *ifname;
+-    char *progname = rindex(argv[0], '/') ? rindex(argv[0], '/')+1 : argv[0];
++    char *progname = strrchr(argv[0], '/') ? strrchr(argv[0], '/')+1 : argv[0];
+ 
+ 	while ((c = getopt_long(argc, argv, shortopts, longopts, 0)) != EOF)
+ 		switch (c) {
+@@ -310,7 +310,7 @@
+ 					str = endstr+1;
+ 				else {
+ 					fprintf(stderr, "Invalid driver parameter '%s'.\n", str);
+-					str = index(str, ',');
++					str = strchr(str, ',');
+ 				}
+ 			} else if (endstr[0] == ',') {
+ 				data32[i] = newval;

Added: trunk/buildroot/package/mii-diag/mii-diag.mk
===================================================================
--- trunk/buildroot/package/mii-diag/mii-diag.mk	                        (rev 0)
+++ trunk/buildroot/package/mii-diag/mii-diag.mk	2008-06-26 06:43:33 UTC (rev 22511)
@@ -0,0 +1,61 @@
+#############################################################
+#
+# mii-diag
+#
+#############################################################
+MIIDIAG_VERSION:=2.11
+MIIDIAG_DEBIAN_PATCH_LEVEL:=2
+MIIDIAG_SOURCE:=mii-diag_$(MIIDIAG_VERSION).orig.tar.gz
+MIIDIAG_PATCH_FILE=mii-diag_$(MIIDIAG_VERSION)-$(MIIDIAG_DEBIAN_PATCH_LEVEL).diff.gz
+MIIDIAG_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
+MIIDIAG_DIR:=$(BUILD_DIR)/mii-diag-$(MIIDIAG_VERSION)
+MIIDIAG_CAT:=$(ZCAT)
+MIIDIAG_BINARY:=usr/sbin/mii-diag
+
+ifneq ($(MIIDIAG_PATCH_FILE),)
+MIIDIAG_PATCH=$(DL_DIR)/$(MIIDIAG_PATCH_FILE)
+$(MIIDIAG_PATCH):
+	$(WGET) -P $(DL_DIR) $(MIIDIAG_SITE)/$(MIIDIAG_PATCH_FILE)
+endif
+
+$(DL_DIR)/$(MIIDIAG_SOURCE):
+	$(WGET) -P $(DL_DIR) $(MIIDIAG_SITE)/$(MIIDIAG_SOURCE)
+
+$(MIIDIAG_DIR)/.unpacked: $(DL_DIR)/$(MIIDIAG_SOURCE) $(MIIDIAG_PATCH)
+	mkdir -p $(MIIDIAG_DIR)
+	$(MIIDIAG_CAT) $(DL_DIR)/$(MIIDIAG_SOURCE) | tar --strip 1 -C $(MIIDIAG_DIR) $(TAR_OPTIONS) -
+ifneq ($(MIIDIAG_PATCH_FILE),)
+	(cd $(MIIDIAG_DIR) && $(MIIDIAG_CAT) $(MIIDIAG_PATCH) | patch -p1)
+endif
+	toolchain/patch-kernel.sh $(MIIDIAG_DIR) package/mii-diag/ mii-diag-\*.patch*
+	touch $@
+
+$(MIIDIAG_DIR)/.configured: $(MIIDIAG_DIR)/.unpacked
+	touch $@
+
+$(MIIDIAG_DIR)/mii-diag: $(MIIDIAG_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MIIDIAG_DIR)
+
+$(TARGET_DIR)/$(MIIDIAG_BINARY): $(MIIDIAG_DIR)/mii-diag
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MIIDIAG_DIR) DESTDIR=$(TARGET_DIR) install
+	$(STRIPCMD) $@
+	touch $@
+
+mii-diag: uclibc $(TARGET_DIR)/$(MIIDIAG_BINARY)
+
+mii-diag-source: $(DL_DIR)/$(MIIDIAG_SOURCE) $(MIIDIAG_PATCH)
+
+mii-diag-clean:
+	-$(MAKE) -C $(MIIDIAG_DIR) clean
+
+mii-diag-dirclean:
+	rm -rf $(MIIDIAG_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_MIIDIAG)),y)
+TARGETS+=mii-diag
+endif
