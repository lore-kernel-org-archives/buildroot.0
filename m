From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 21 Jan 2009 00:21:46 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcgicc
Message-ID: <20090121002146.562C8775DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-21 00:21:43 +0000 (Wed, 21 Jan 2009)
New Revision: 24932

Log:
include string.h when building cgicc, add libcgicc-unpacked, and clean up libcgicc.mk - still does not build OK

Added:
   trunk/buildroot/package/libcgicc/cgicc-3.2.7-memset.patch

Modified:
   trunk/buildroot/package/libcgicc/libcgicc.mk


Changeset:
Added: trunk/buildroot/package/libcgicc/cgicc-3.2.7-memset.patch
===================================================================
--- trunk/buildroot/package/libcgicc/cgicc-3.2.7-memset.patch	                        (rev 0)
+++ trunk/buildroot/package/libcgicc/cgicc-3.2.7-memset.patch	2009-01-21 00:21:43 UTC (rev 24932)
@@ -0,0 +1,12 @@
+diff -urN cgicc-3.2.7-0rig//demo/dns.cpp cgicc-3.2.7/demo/dns.cpp
+--- cgicc-3.2.7-0rig//demo/dns.cpp	2009-01-21 00:24:13.000000000 +0100
++++ cgicc-3.2.7/demo/dns.cpp	2009-01-21 00:24:30.000000000 +0100
+@@ -34,6 +34,7 @@
+ #include <vector>
+ #include <stdexcept>
+ #include <iostream>
++#include <string.h>
+ 
+ #include "cgicc/CgiDefs.h"
+ #include "cgicc/Cgicc.h"
+

Modified: trunk/buildroot/package/libcgicc/libcgicc.mk
===================================================================
--- trunk/buildroot/package/libcgicc/libcgicc.mk	2009-01-21 00:17:03 UTC (rev 24931)
+++ trunk/buildroot/package/libcgicc/libcgicc.mk	2009-01-21 00:21:43 UTC (rev 24932)
@@ -17,7 +17,8 @@
 
 $(LIBCGICC_DIR)/.unpacked: $(DL_DIR)/$(LIBCGICC_SOURCE)
 	$(LIBCGICC_CAT) $(DL_DIR)/$(LIBCGICC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LIBCGICC_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(LIBCGICC_DIR) package/libcgicc cgicc\*.patch
+	touch $@
 
 $(LIBCGICC_DIR)/.configured: $(LIBCGICC_DIR)/.unpacked
 	(cd $(LIBCGICC_DIR); rm -f config.cache; \
@@ -40,11 +41,11 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 	)
-	touch $(LIBCGICC_DIR)/.configured
+	touch $@
 
 $(LIBCGICC_DIR)/.compiled: $(LIBCGICC_DIR)/.configured
 	$(MAKE) -C $(LIBCGICC_DIR)
-	touch $(LIBCGICC_DIR)/.compiled
+	touch $@
 
 $(STAGING_DIR)/lib/libcgicc.so: $(LIBCGICC_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBCGICC_DIR) install
@@ -55,6 +56,8 @@
 
 libcgicc: uclibc $(TARGET_DIR)/usr/lib/libcgicc.so
 
+libcgicc-unpacked: $(LIBCGICC_DIR)/.unpacked
+
 libcgicc-clean:
 		-$(MAKE) -C $(LIBCGICC_DIR) clean
 
