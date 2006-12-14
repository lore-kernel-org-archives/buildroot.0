From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 14 Dec 2006 07:36:12 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openswan
Message-ID: <20061214153612.C1C2E485FF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-14 07:36:12 -0800 (Thu, 14 Dec 2006)
New Revision: 16925

Log:
- remove usage of SUSv3 legacy functions.


Added:
   trunk/buildroot/package/openswan/openswan-2.4.7-010-susv3-legacy.patch

Modified:
   trunk/buildroot/package/openswan/openswan.mk


Changeset:
Added: trunk/buildroot/package/openswan/openswan-2.4.7-010-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/openswan/openswan-2.4.7-010-susv3-legacy.patch	2006-12-14 15:25:47 UTC (rev 16924)
+++ trunk/buildroot/package/openswan/openswan-2.4.7-010-susv3-legacy.patch	2006-12-14 15:36:12 UTC (rev 16925)
@@ -0,0 +1,22 @@
+--- openswan-2.4.7.oorig/lib/libopenswan/alg_info.c	2006-10-06 18:47:38.000000000 +0200
++++ openswan-2.4.7/lib/libopenswan/alg_info.c	2006-12-14 14:27:29.000000000 +0100
+@@ -649,7 +649,7 @@ alg_info_esp_create_from_str (const char
+ 
+     if (!alg_info_esp) goto out;
+ 
+-    pfs_name=index (alg_str, ';');
++    pfs_name=strchr (alg_str, ';');
+ 
+     if (pfs_name) {
+ 	memcpy(esp_buf, alg_str, pfs_name-alg_str);
+--- openswan-2.4.7.oorig/programs/ikeping/ikeping.c	2005-07-08 04:56:38.000000000 +0200
++++ openswan-2.4.7/programs/ikeping/ikeping.c	2006-12-14 14:31:36.000000000 +0100
+@@ -315,7 +315,7 @@ main(int argc, char **argv)
+   natt=0;
+   listen_only=0;
+   noDNS=0;
+-  bzero(&laddr, sizeof(laddr));
++  memset(&laddr, 0, sizeof(laddr));
+ 
+   while((c = getopt_long(argc, argv, "hVnvsp:b:46E:w:", long_opts, 0))!=EOF) {
+       switch (c) {

Modified: trunk/buildroot/package/openswan/openswan.mk
===================================================================
--- trunk/buildroot/package/openswan/openswan.mk	2006-12-14 15:25:47 UTC (rev 16924)
+++ trunk/buildroot/package/openswan/openswan.mk	2006-12-14 15:36:12 UTC (rev 16925)
@@ -24,10 +24,7 @@
 	toolchain/patch-kernel.sh $(OPENSWAN_DIR) package/openswan/ openswan\*.patch
 	touch $(OPENSWAN_DIR)/.unpacked
 
-$(OPENSWAN_DIR)/.configured: $(OPENSWAN_DIR)/.unpacked
-	touch  $(OPENSWAN_DIR)/.configured
-
-$(OPENSWAN_DIR)/$(OPENSWAN_BINARY): $(OPENSWAN_DIR)/.configured
+$(OPENSWAN_DIR)/$(OPENSWAN_BINARY): $(OPENSWAN_DIR)/.unpacked
 	@echo $(LINUX_KERNEL)
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) -C $(OPENSWAN_DIR) \
