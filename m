From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Nov 2007 05:06:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ipsec-tools
Message-ID: <20071129130643.7679230077@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-29 05:06:42 -0800 (Thu, 29 Nov 2007)
New Revision: 20589

Log:
Make ipsec-tools depend on packets, instead of selecting them, depend on flex

Modified:
   trunk/buildroot/package/ipsec-tools/Config.in
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk


Changeset:
Modified: trunk/buildroot/package/ipsec-tools/Config.in
===================================================================
--- trunk/buildroot/package/ipsec-tools/Config.in	2007-11-29 13:05:28 UTC (rev 20588)
+++ trunk/buildroot/package/ipsec-tools/Config.in	2007-11-29 13:06:42 UTC (rev 20589)
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools"
 	default n
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_FLEX
+	depends BR2_PACKAGE_OPENSSL && BR2_PACKAGE_FLEX && BR2_PACKAGE_FLEX_LIBFL
 	help
 	  This package is required to support IPSec for Linux 2.6+
 
+comment "ipsec-tools	- disabled (requires openssl, flex and the flex library (libfl.a) )"
+	depends on !BR2_PACKAGE_OPENSSL || !BR2_PACKAGE_FLEX
+
 config BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT
 	default y
 	depends on BR2_PACKAGE_IPSEC_TOOLS

Modified: trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2007-11-29 13:05:28 UTC (rev 20588)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2007-11-29 13:06:42 UTC (rev 20589)
@@ -97,7 +97,7 @@
 $(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_RACOON) \
 $(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_RACOONCTL): \
     $(IPSEC_TOOLS_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(IPSEC_TOOLS_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(IPSEC_TOOLS_DIR)
 
 $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_SETKEY) \
 $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOON) \
@@ -135,7 +135,7 @@
 IPSEC_TOOLS_PROGS+= $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOONCTL)
 endif
 
-ipsec-tools: uclibc openssl $(IPSEC_TOOLS_PROGS)
+ipsec-tools: uclibc openssl flex $(IPSEC_TOOLS_PROGS)
 
 ipsec-tools-source: $(DL_DIR)/$(IPSEC_TOOLS_SOURCE)
 
