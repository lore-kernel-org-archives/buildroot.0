From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  4 Sep 2007 20:40:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  irda-utils
Message-ID: <20070905034048.6B30EA6883@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-04 20:40:47 -0700 (Tue, 04 Sep 2007)
New Revision: 19785

Log:
Add irda-utils package, Courtesy of Benjamin Tietz

Added:
   trunk/buildroot/package/irda-utils/
   trunk/buildroot/package/irda-utils/Config.in
   trunk/buildroot/package/irda-utils/irda-utils-0.9.18-install_irnetd.patch
   trunk/buildroot/package/irda-utils/irda.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-09-04 21:24:46 UTC (rev 19784)
+++ trunk/buildroot/package/Config.in	2007-09-05 03:40:47 UTC (rev 19785)
@@ -136,6 +136,7 @@
 source "package/ethtool/Config.in"
 source "package/haserl/Config.in"
 source "package/hostap/Config.in"
+source "package/irda-utils/Config.in"
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"

Added: trunk/buildroot/package/irda-utils/Config.in
===================================================================
--- trunk/buildroot/package/irda-utils/Config.in	                        (rev 0)
+++ trunk/buildroot/package/irda-utils/Config.in	2007-09-05 03:40:47 UTC (rev 19785)
@@ -0,0 +1,51 @@
+menuconfig BR2_PACKAGE_IRDA_UTILS
+	bool "irda_utils"
+	default n
+	help
+		Tools for accessing the irda-Subsystem of the Linux-Kernel
+
+if BR2_PACKAGE_IRDA_UTILS
+config IRDA_IRATTACH
+	bool "irattach"
+	default y
+	help
+		To start the Irda-Subsystem in SIR-Mode you may need this
+
+config IRDA_IRDAPING
+	bool "irdaping"
+	default n
+	help
+		what ping is for networks is irdaping for Irda
+
+config IRDA_IRNETD
+	bool "irnetd"
+	default n
+	help
+		Needed for Networking over Irda
+
+config IRDA_IRDADUMP
+	bool "irdadump"
+	default n
+	help
+		Like tcpdump, but for infrared connections
+
+config IRDA_FINDCHIP
+	bool "findchip"
+	default n
+
+config IRDA_PSION
+	bool "support psion-dongle"
+	default n
+
+config IRDA_TEKRAM
+	bool "support tekram-dongle"
+	default n
+
+config IRDA_SMCINIT
+	bool "support toshiba-laptops"
+	default n
+	help
+		Some Toshiba Laptops have buggy BIOSes which didn't initialize 
+		Irda. This may help those.
+	
+endif

Added: trunk/buildroot/package/irda-utils/irda-utils-0.9.18-install_irnetd.patch
===================================================================
--- trunk/buildroot/package/irda-utils/irda-utils-0.9.18-install_irnetd.patch	                        (rev 0)
+++ trunk/buildroot/package/irda-utils/irda-utils-0.9.18-install_irnetd.patch	2007-09-05 03:40:47 UTC (rev 19785)
@@ -0,0 +1,12 @@
+diff -Naur irda-utils-0.9.18.orig/irnetd/Makefile irda-utils-0.9.18/irnetd/Makefile
+--- irda-utils-0.9.18.orig/irnetd/Makefile	2006-07-11 08:16:06.000000000 +0200
++++ irda-utils-0.9.18/irnetd/Makefile	2007-06-08 20:39:25.000000000 +0200
+@@ -55,7 +55,7 @@
+ 
+ install: irnetd
+ 	$(prn_install)
+-	$(ECMD) install irnetd /usr/sbin/
++	$(ECMD) install irnetd $(ROOT)/usr/sbin/
+ 
+ 
+ clean:

Added: trunk/buildroot/package/irda-utils/irda.mk
===================================================================
--- trunk/buildroot/package/irda-utils/irda.mk	                        (rev 0)
+++ trunk/buildroot/package/irda-utils/irda.mk	2007-09-05 03:40:47 UTC (rev 19785)
@@ -0,0 +1,57 @@
+#############################################################
+#
+# irda-utils
+#
+#############################################################
+IRDA_UTILS_VERSION:=0.9.18
+IRDA_UTILS_SOURCE:=irda-utils-$(IRDA_UTILS_VERSION).tar.gz
+IRDA_UTILS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/irda/$(IRDA_UTILS_SOURCE)
+IRDA_UTILS_DIR:=$(BUILD_DIR)/irda-utils-$(IRDA_UTILS_VERSION)
+
+ifeq ($(IRDA_IRATTACH),y)
+IRDA_DIRS += irattach
+endif
+ifeq ($(IRDA_IRDAPING),y)
+IRDA_DIRS += irdaping
+endif
+ifeq ($(IRDA_IRNETD),y)
+IRDA_DIRS += irnetd
+endif
+ifeq ($(IRDA_PSION),y)
+IRDA_DIRS += psion
+endif
+ifeq ($(IRDA_TEKRAM),y)
+IRDA_DIRS += tekram
+endif
+ifeq ($(IRDA_FINDCHIP),y)
+IRDA_DIRS += findchip
+endif
+ifeq ($(IRDA_IRDADUMP),y)
+IRDA_DIRS += irdadump
+endif
+ifeq ($(IRDA_SMCINIT),y)
+IRDA_DIRS += smcinit
+endif
+
+IRDA_UTILS_MAKE_OPT:=-e "DIRS=$(IRDA_DIRS)"
+IRDA_UTILS_MAKE_ENV:=CC=$(TARGET_CC) LD=$(TARGET_LD) AR=$(TARGET_AR) RANLIB=$(TARGET_RANLIB) ROOT=$(TARGET_DIR) PREFIX=$(TARGET_DIR)
+
+# Since there is no configure-script
+
+$(IRDA_UTILS_DIR)/.configured: $(IRDA_UTILS_DIR)/.patched
+	touch $@
+
+irda-utils: uclibc $(DL_DIR)/$(IRDA_UTILS_SOURCE) $(IRDA_UTILS_DIR)/.installed
+
+irda-utils-clean: $(IRDA_UTILS_DIR)/.clean
+
+irda-utils-dirclean: $(IRDA_UTILS_DIR)/.dirclean
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_IRDA_UTILS)),y)
+TARGETS+=irda-utils
+endif
