From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 31 Jul 2007 11:06:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package
Message-ID: <20070731180651.EC761A5E30@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-31 11:06:50 -0700 (Tue, 31 Jul 2007)
New Revision: 19362

Log:
- add possibility to select different flavours of strip (or none at all for debugging purposes)


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-07-31 17:09:44 UTC (rev 19361)
+++ trunk/buildroot/Config.in	2007-07-31 18:06:50 UTC (rev 19362)
@@ -652,11 +652,36 @@
 	  This option hides outdated/obsolete versions of packages.
 
 config BR2_USE_WCHAR
-	bool "Show packages that are require WCHAR support"
+	bool "Show packages that require WCHAR support"
 	default y
 	help
 	  This option hides packages which cannot be built without WCHAR.
 
+choice
+	prompt "strip"
+	default BR2_STRIP_strip
+	help
+	  Select whether to strip binaries and libraries for the target
+	  or not.
+	  strip   is the normal strip command
+	  sstrip  is a strip that discards more than the normal strip
+	  none    do not strip (only for debugging!)
+
+config BR2_STRIP_strip
+	bool "strip"
+	help
+	  strip   is the normal strip command
+config BR2_STRIP_sstrip
+	bool "sstrip"
+	select BR2_PACKAGE_SSTRIP_HOST
+	help
+	  sstrip  is a strip that discards more than the normal strip
+config BR2_STRIP_none
+	bool "none"
+	help
+	  none    do not strip (only for debugging!)
+endchoice
+
 config BR2_PREFER_STATIC_LIB
 	bool "prefer static libraries"
 	default n

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-07-31 17:09:44 UTC (rev 19361)
+++ trunk/buildroot/package/Makefile.in	2007-07-31 18:06:50 UTC (rev 19362)
@@ -131,10 +131,17 @@
 TARGET_CC=$(TARGET_CROSS)gcc
 TARGET_CXX=$(TARGET_CROSS)g++
 TARGET_RANLIB=$(TARGET_CROSS)ranlib
+INSTALL=/usr/bin/install
+ifeq ($(BR2_STRIP_strip),y)
 STRIP=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
-INSTALL=/usr/bin/install
+endif
+ifeq ($(BR2_STRIP_sstrip),y)
+STRIP=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
+endif
+ifeq ($(BR2_STRIP_none),y)
+STRIP=true -Not_stripping
+endif
 
-
 HOST_ARCH:=$(shell $(HOSTCC) -dumpmachine | sed -e s'/-.*//' \
 	-e 's/sparc.*/sparc/' \
 	-e 's/arm.*/arm/g' \
