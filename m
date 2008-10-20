From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 04:32:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package
Message-ID: <20081020113226.209193C784@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-20 04:32:25 -0700 (Mon, 20 Oct 2008)
New Revision: 23741

Log:
BR2_HAVE_DOCUMENTATION: add option to remove documentation from target

Some packages' install-strip target install quite big documentation,
so create an option to remove it similar to the existing man/info options.

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2008-10-20 11:32:22 UTC (rev 23740)
+++ trunk/buildroot/Config.in	2008-10-20 11:32:25 UTC (rev 23741)
@@ -348,6 +348,13 @@
 	  If you say n here, your target will not contain any
 	  infopage.
 
+config BR2_HAVE_DOCUMENTATION
+	bool "documentation on the target"
+	help
+	  Leave the documentation on the target.
+	  If you say n here, your target will not contain any
+	  documentation.
+
 config BR2_HAVE_DEVFILES
 	bool "development files in target filesystem"
 	help

Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-10-20 11:32:22 UTC (rev 23740)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-10-20 11:32:25 UTC (rev 23741)
@@ -256,6 +256,9 @@
 	$(if $(BR2_HAVE_INFOPAGES),,for d in info share/info; do \
 		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
 	done)
+	$(if $(BR2_HAVE_DOCUMENTATION),,for d in doc share/doc; do \
+		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
+	done)
 	$(Q)mkdir -p $(@D)
 	touch $@
 
