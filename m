From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 12 Oct 2007 07:28:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20071012142857.1E2FAA6856@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-12 07:28:56 -0700 (Fri, 12 Oct 2007)
New Revision: 20229

Log:
Remove LEGACY functions from haserl

Added:
   trunk/buildroot/package/haserl/haserl-0.8.0-legacy.patch

Modified:
   trunk/buildroot/package/haserl/haserl.mk


Changeset:
Added: trunk/buildroot/package/haserl/haserl-0.8.0-legacy.patch
===================================================================
--- trunk/buildroot/package/haserl/haserl-0.8.0-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/haserl/haserl-0.8.0-legacy.patch	2007-10-12 14:28:56 UTC (rev 20229)
@@ -0,0 +1,12 @@
+diff -urN haserl-0.8.0-0rig/src/haserl.c haserl-0.8.0/src/haserl.c
+--- haserl-0.8.0-0rig/src/haserl.c	2004-11-10 18:59:35.000000000 +0100
++++ haserl-0.8.0/src/haserl.c	2007-10-12 14:36:28.000000000 +0200
+@@ -131,7 +131,7 @@
+ 	if (strlen(prefix)) { memcpy (entry, prefix, strlen(prefix)); }
+ 	memcpy ((char *) (entry + strlen(prefix)), newbuf, strlen(newbuf));
+ 
+-	keylen = (size_t) (index (entry, '=') - entry);
++	keylen = (size_t) (strchr (entry, '=') - entry);
+ 	
+ 	if ( keylen <= 0 ) {
+ 			free (entry);

Modified: trunk/buildroot/package/haserl/haserl.mk
===================================================================
--- trunk/buildroot/package/haserl/haserl.mk	2007-10-12 12:34:04 UTC (rev 20228)
+++ trunk/buildroot/package/haserl/haserl.mk	2007-10-12 14:28:56 UTC (rev 20229)
@@ -15,6 +15,7 @@
 
 $(HASERL_DIR)/.unpacked: $(DL_DIR)/$(HASERL_SOURCE)
 	$(HASERL_CAT) $(DL_DIR)/$(HASERL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(HASERL_DIR) package/haserl/ haserl-$(HASERL_VERSION)\*.patch
 	touch $@
 
 $(HASERL_DIR)/.configured: $(HASERL_DIR)/.unpacked
@@ -41,6 +42,8 @@
 
 haserl-source: $(DL_DIR)/$(HASERL_SOURCE)
 
+haserl-unpacked: $(HASERL_DIR)/.unpacked
+
 haserl-clean:
 	-$(MAKE) -C $(HASERL_DIR) clean
 
