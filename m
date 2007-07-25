From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 25 Jul 2007 10:37:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tn5250
Message-ID: <20070725173752.3F78EA4644@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-25 10:37:50 -0700 (Wed, 25 Jul 2007)
New Revision: 19260

Log:
Fix tn5250 package

Added:
   trunk/buildroot/package/tn5250/tn5250-0.16.4-001.patch

Modified:
   trunk/buildroot/package/tn5250/tn5250.mk


Changeset:
Added: trunk/buildroot/package/tn5250/tn5250-0.16.4-001.patch
===================================================================
--- trunk/buildroot/package/tn5250/tn5250-0.16.4-001.patch	                        (rev 0)
+++ trunk/buildroot/package/tn5250/tn5250-0.16.4-001.patch	2007-07-25 17:37:50 UTC (rev 19260)
@@ -0,0 +1,28 @@
+diff -urN tn5250-0.16.4-0rig/src/common.h tn5250-0.16.4/src/common.h
+--- tn5250-0.16.4-0rig/src/common.h	1970-01-01 01:00:00.000000000 +0100
++++ tn5250-0.16.4/src/common.h	2007-07-25 15:33:37.000000000 +0200
+@@ -0,0 +1,2 @@
++#define	TRUE	1
++#define	FALSE	0
+diff -urN tn5250-0.16.4-0rig/src/host3270.c tn5250-0.16.4/src/host3270.c
+--- tn5250-0.16.4-0rig/src/host3270.c	2002-03-20 09:50:36.000000000 +0100
++++ tn5250-0.16.4/src/host3270.c	2007-07-25 15:34:25.000000000 +0200
+@@ -20,6 +20,7 @@
+  * 
+  */
+ 
++#include "common.h"
+ #include "tn5250-private.h"
+ #include "host3270.h"
+ #include "codes3270.h"
+diff -urN tn5250-0.16.4-0rig/src/host5250.c tn5250-0.16.4/src/host5250.c
+--- tn5250-0.16.4-0rig/src/host5250.c	2002-03-20 09:50:36.000000000 +0100
++++ tn5250-0.16.4/src/host5250.c	2007-07-25 15:33:10.000000000 +0200
+@@ -19,6 +19,7 @@
+  * Boston, MA 02111-1307 USA
+  */
+ 
++#include "common.h"
+ #include "tn5250-private.h"
+ #include "host5250.h"
+ 

Modified: trunk/buildroot/package/tn5250/tn5250.mk
===================================================================
--- trunk/buildroot/package/tn5250/tn5250.mk	2007-07-25 17:27:58 UTC (rev 19259)
+++ trunk/buildroot/package/tn5250/tn5250.mk	2007-07-25 17:37:50 UTC (rev 19260)
@@ -9,6 +9,7 @@
 
 $(TN5250_DIR)/.dist: $(DL_DIR)/$(TN5250_SOURCE)
 	$(TN5250_CAT) $(DL_DIR)/$(TN5250_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(TN5250_DIR) package/tn5250 tn5250\*.patch
 	-touch $(TN5250_DIR)/.dist
 
 $(TN5250_DIR)/.configured: $(TN5250_DIR)/.dist
@@ -35,11 +36,11 @@
 	);
 	touch $(TN5250_DIR)/.configured
 
-$(TN5250_DIR)/tn5250: $(TN5250_DIR)/.configured
+$(TN5250_DIR)/src/tn5250: $(TN5250_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(TN5250_DIR)
 
-$(TARGET_DIR)/usr/bin/tn5250: $(TN5250_DIR)/tn5250
-	install -c $(TN5250_DIR)/tn5250 $(TARGET_DIR)/usr/bin/tn5250
+$(TARGET_DIR)/usr/bin/tn5250: $(TN5250_DIR)/src/tn5250
+	install -c $(TN5250_DIR)/src/tn5250 $(TARGET_DIR)/usr/bin/tn5250
 
 tn5250: uclibc slang $(TARGET_DIR)/usr/bin/tn5250
 
