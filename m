From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  4 Nov 2008 14:28:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/matchbox
Message-ID: <20081104222859.1897A3C810@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-04 14:28:58 -0800 (Tue, 04 Nov 2008)
New Revision: 23926

Log:
matchbox: fix mb-applet-startup-monitor compilation (TRUE/FALSE issue)

Added:
   trunk/buildroot/package/matchbox/mb-applet-startup-monitor-true-false.patch

Modified:
   trunk/buildroot/package/matchbox/matchbox.mk


Changeset:
Modified: trunk/buildroot/package/matchbox/matchbox.mk
===================================================================
--- trunk/buildroot/package/matchbox/matchbox.mk	2008-11-04 21:44:28 UTC (rev 23925)
+++ trunk/buildroot/package/matchbox/matchbox.mk	2008-11-04 22:28:58 UTC (rev 23926)
@@ -126,6 +126,7 @@
 
 $(MATCHBOX_SM_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_SM_SOURCE)
 	$(MATCHBOX_CAT) $(DL_DIR)/$(MATCHBOX_SM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(MATCHBOX_SM_DIR) package/matchbox/ mb-applet-startup-monitor\*.patch
 	touch $(MATCHBOX_SM_DIR)/.unpacked
 
 $(MATCHBOX_CN_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_CN_SOURCE)

Added: trunk/buildroot/package/matchbox/mb-applet-startup-monitor-true-false.patch
===================================================================
--- trunk/buildroot/package/matchbox/mb-applet-startup-monitor-true-false.patch	                        (rev 0)
+++ trunk/buildroot/package/matchbox/mb-applet-startup-monitor-true-false.patch	2008-11-04 22:28:58 UTC (rev 23926)
@@ -0,0 +1,21 @@
+mbmonitor uses TRUE / FALSE without defining them
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ mbmonitor.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: mb-applet-startup-monitor-0.1/mbmonitor.c
+===================================================================
+--- mb-applet-startup-monitor-0.1.orig/mbmonitor.c
++++ mb-applet-startup-monitor-0.1/mbmonitor.c
+@@ -43,6 +43,9 @@
+ #define POLLTIME	   10
+ #define HOURGLASS_N_FRAMES 8 
+ 
++#define FALSE		   0
++#define TRUE		   1
++
+ typedef struct LaunchList LaunchList;
+ 
+ struct LaunchList
