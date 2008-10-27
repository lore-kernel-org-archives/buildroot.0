From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 27 Oct 2008 08:15:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/matchbox
Message-ID: <20081027151553.2738B3C6FA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-27 08:15:52 -0700 (Mon, 27 Oct 2008)
New Revision: 23821

Log:
Fix matchbox build

Fix matchbox build

This patch fixes various failures in the Matchbox build:

 * libmatchbox and matchbox-panel were using a now legacy index()
   function, which is not part of every uClibc build nowadays
   (depending on the configuration). As this function doesn't exist
   anymore in all builds, use strchr() instead, which is the
   recommended replacement for index(). Two patches, one for
   libmatchbox, one for matchbox-panel, are added to fix this problem.

   Closes bug http://bugs.uclibc.org/view.php?id=5484

 * Do not override the CFLAGS and LDFLAGS values, they are already set
   by TARGET_CONFIGURE_OPTS. It caused build failures.

 * Mangle the library paths in the .la file of libmatchbox, after
   installation in the staging dir.

It would probably be nice to switch Matchbox over to the new
Makefile.autotools.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Added:
   trunk/buildroot/package/matchbox/libmatchbox-1.9-index-is-legacy.patch
   trunk/buildroot/package/matchbox/matchbox-panel-0.9.3-index-is-legacy.patch

Modified:
   trunk/buildroot/package/matchbox/matchbox.mk


Changeset:
Added: trunk/buildroot/package/matchbox/libmatchbox-1.9-index-is-legacy.patch
===================================================================
--- trunk/buildroot/package/matchbox/libmatchbox-1.9-index-is-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/matchbox/libmatchbox-1.9-index-is-legacy.patch	2008-10-27 15:15:52 UTC (rev 23821)
@@ -0,0 +1,35 @@
+index() is a legacy function, not implemented in some uClibc
+configurations.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libmb/mbexp.c  |    2 +-
+ libmb/mbmenu.c |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: libmatchbox-1.9/libmb/mbexp.c
+===================================================================
+--- libmatchbox-1.9.orig/libmb/mbexp.c
++++ libmatchbox-1.9/libmb/mbexp.c
+@@ -492,7 +492,7 @@
+ 
+   /* get the family */
+ 
+-  if (index(spec, ',') != NULL || index(spec, '-') != NULL) 
++  if (strchr(spec, ',') != NULL || strchr(spec, '-') != NULL) 
+     has_comma_delim = True;
+ 
+   while (!got_family) {
+Index: libmatchbox-1.9/libmb/mbmenu.c
+===================================================================
+--- libmatchbox-1.9.orig/libmb/mbmenu.c
++++ libmatchbox-1.9/libmb/mbmenu.c
+@@ -433,7 +433,7 @@
+    {
+       s = p;
+       found   = NULL;
+-      while(index("/\0", *p) == NULL) p++;
++      while(strchr("/\0", *p) == NULL) p++;
+       if (*p != '\0') { *p = '\0'; p++; };
+ 
+       item = current->items;

Added: trunk/buildroot/package/matchbox/matchbox-panel-0.9.3-index-is-legacy.patch
===================================================================
--- trunk/buildroot/package/matchbox/matchbox-panel-0.9.3-index-is-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/matchbox/matchbox-panel-0.9.3-index-is-legacy.patch	2008-10-27 15:15:52 UTC (rev 23821)
@@ -0,0 +1,20 @@
+Replace the legacy index() with strchr()
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ applets/mb-applet-menu-launcher.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: matchbox-panel-0.9.3/applets/mb-applet-menu-launcher.c
+===================================================================
+--- matchbox-panel-0.9.3.orig/applets/mb-applet-menu-launcher.c
++++ matchbox-panel-0.9.3/applets/mb-applet-menu-launcher.c
+@@ -280,7 +280,7 @@
+ 	 DBG("\tkey %s ", key);
+          if (*(++p) == '"') { p++; tc = sc; } /* skip "'s */
+ 	 val = p;
+-	 while(index(tc,*p) == NULL)
++	 while(strchr(tc,*p) == NULL)
+ 	 {
+ 	    if (*p == '\\' && *(p+1) == '"') p++;  /* skip \" */
+ 	    p++;

Modified: trunk/buildroot/package/matchbox/matchbox.mk
===================================================================
--- trunk/buildroot/package/matchbox/matchbox.mk	2008-10-27 14:33:03 UTC (rev 23820)
+++ trunk/buildroot/package/matchbox/matchbox.mk	2008-10-27 15:15:52 UTC (rev 23821)
@@ -113,6 +113,7 @@
 
 $(MATCHBOX_LIB_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_LIB_SOURCE)
 	$(MATCHBOX_CAT) $(DL_DIR)/$(MATCHBOX_LIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(MATCHBOX_LIB_DIR) package/matchbox/ libmatchbox\*.patch
 	touch $(MATCHBOX_LIB_DIR)/.unpacked
 
 $(MATCHBOX_SNOTIFY_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_SNOTIFY_SOURCE)
@@ -133,6 +134,7 @@
 
 $(MATCHBOX_PL_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_PL_SOURCE)
 	$(MATCHBOX_CAT) $(DL_DIR)/$(MATCHBOX_PL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(MATCHBOX_PL_DIR) package/matchbox/ matchbox-panel\*.patch
 	touch $(MATCHBOX_PL_DIR)/.unpacked
 
 $(MATCHBOX_DP_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_DP_SOURCE)
@@ -214,8 +216,6 @@
 $(MATCHBOX_LIB_DIR)/.configured: $(MATCHBOX_LIB_DIR)/.unpacked xlib_libXext-install-staging
 	(cd $(MATCHBOX_LIB_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
-	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
 	--host=$(GNU_TARGET_NAME) \
@@ -241,8 +241,6 @@
 $(MATCHBOX_SNOTIFY_DIR)/.configured: $(MATCHBOX_SNOTIFY_DIR)/.unpacked
 	(cd $(MATCHBOX_SNOTIFY_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
-	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	lf_cv_sane_realloc=no \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -264,8 +262,6 @@
 $(MATCHBOX_WM_DIR)/.configured: $(MATCHBOX_WM_DIR)/.unpacked
 	(cd $(MATCHBOX_WM_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
-	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
 	--host=$(GNU_TARGET_NAME) \
@@ -291,8 +287,6 @@
 $(MATCHBOX_SM_DIR)/.configured: $(MATCHBOX_SM_DIR)/.unpacked
 	(cd $(MATCHBOX_SM_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
-	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
 	--host=$(GNU_TARGET_NAME) \
@@ -317,8 +311,6 @@
 $(MATCHBOX_CN_DIR)/.configured: $(MATCHBOX_CN_DIR)/.unpacked
 	(cd $(MATCHBOX_CN_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
-	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
 	--host=$(GNU_TARGET_NAME) \
@@ -342,8 +334,6 @@
 $(MATCHBOX_PL_DIR)/.configured: $(MATCHBOX_PL_DIR)/.unpacked
 	(cd $(MATCHBOX_PL_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
-	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
 	--host=$(GNU_TARGET_NAME) \
@@ -368,8 +358,6 @@
 $(MATCHBOX_DP_DIR)/.configured: $(MATCHBOX_DP_DIR)/.unpacked
 	(cd $(MATCHBOX_DP_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
-	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
 	--host=$(GNU_TARGET_NAME) \
@@ -394,8 +382,6 @@
 $(MATCHBOX_FK_DIR)/.configured: $(MATCHBOX_FK_DIR)/.unpacked
 	(cd $(MATCHBOX_FK_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
-	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
 	--host=$(GNU_TARGET_NAME) \
@@ -420,8 +406,6 @@
 $(MATCHBOX_KB_DIR)/.configured: $(MATCHBOX_KB_DIR)/.unpacked
 	(cd $(MATCHBOX_KB_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
-	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
 	--host=$(GNU_TARGET_NAME) \
@@ -486,6 +470,7 @@
 	libdir=/usr/lib \
 	includedir=/usr/include \
 	install
+	$(SED) "s:\(['= ]\)/usr:\1$(STAGING_DIR)/usr:g" $(STAGING_DIR)/usr/lib/libmb.la
 
 $(STAGING_DIR)/usr/lib/$(MATCHBOX_SNOTIFY_BIN): $(MATCHBOX_SNOTIFY_DIR)/.compiled
 	$(MAKE) -C $(MATCHBOX_SNOTIFY_DIR) DESTDIR=$(STAGING_DIR) \
