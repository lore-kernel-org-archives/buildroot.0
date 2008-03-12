From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Wed, 12 Mar 2008 12:04:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/wireless-tools
Message-ID: <20080312190418.F372412C806@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-12 12:04:14 -0700 (Wed, 12 Mar 2008)
New Revision: 21319

Log:
patch to replace legacy bzero with memset in wireless-tools

Added:
   trunk/buildroot/package/wireless-tools/wireless_tools.29-remove-bzero.patch

Modified:
   trunk/buildroot/package/wireless-tools/wireless-tools.mk


Changeset:
Modified: trunk/buildroot/package/wireless-tools/wireless-tools.mk
===================================================================
--- trunk/buildroot/package/wireless-tools/wireless-tools.mk	2008-03-12 19:03:20 UTC (rev 21318)
+++ trunk/buildroot/package/wireless-tools/wireless-tools.mk	2008-03-12 19:04:14 UTC (rev 21319)
@@ -20,6 +20,7 @@
 
 $(WIRELESS_TOOLS_BUILD_DIR)/.unpacked: $(DL_DIR)/$(WIRELESS_TOOLS_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(WIRELESS_TOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(WIRELESS_TOOLS_BUILD_DIR) package/wireless-tools/ \*.patch
 	sed -i -e s:'strip':'$(STRIPCMD)':g $(WIRELESS_TOOLS_BUILD_DIR)/Makefile
 	touch $(WIRELESS_TOOLS_BUILD_DIR)/.unpacked
 

Added: trunk/buildroot/package/wireless-tools/wireless_tools.29-remove-bzero.patch
===================================================================
--- trunk/buildroot/package/wireless-tools/wireless_tools.29-remove-bzero.patch	                        (rev 0)
+++ trunk/buildroot/package/wireless-tools/wireless_tools.29-remove-bzero.patch	2008-03-12 19:04:14 UTC (rev 21319)
@@ -0,0 +1,29 @@
+--- a/iwlib.c	2007-06-29 19:43:31.000000000 -0400
++++ b/iwlib.c	2008-03-12 14:18:48.000000000 -0400
+@@ -475,7 +475,7 @@ iw_get_range_info(int		skfd,
+   union iw_range_raw *	range_raw;
+ 
+   /* Cleanup */
+-  bzero(buffer, sizeof(buffer));
++  memset(buffer, 0, sizeof(buffer));
+ 
+   wrq.u.data.pointer = (caddr_t) buffer;
+   wrq.u.data.length = sizeof(buffer);
+@@ -504,7 +504,7 @@ iw_get_range_info(int		skfd,
+   else
+     {
+       /* Zero unknown fields */
+-      bzero((char *) range, sizeof(struct iw_range));
++      memset((char *) range, 0, sizeof(struct iw_range));
+ 
+       /* Initial part unmoved */
+       memcpy((char *) range,
+@@ -2960,7 +2960,7 @@ iw_process_scanning_token(struct iw_even
+ 	oldwscan->next = wscan;
+ 
+       /* Reset it */
+-      bzero(wscan, sizeof(struct wireless_scan));
++      memset(wscan, 0, sizeof(struct wireless_scan));
+ 
+       /* Save cell identifier */
+       wscan->has_ap_addr = 1;
