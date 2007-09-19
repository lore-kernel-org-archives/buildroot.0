From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 13:22:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package/libvorbis
Message-ID: <20070919202258.DD9833008B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 13:22:58 -0700 (Wed, 19 Sep 2007)
New Revision: 19899

Log:
- add a SVN_UP command for updating an already checked-out tree


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/libvorbis/libvorbis.mk


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-09-19 20:13:08 UTC (rev 19898)
+++ trunk/buildroot/Config.in	2007-09-19 20:22:58 UTC (rev 19899)
@@ -672,10 +672,14 @@
 	string "Wget command"
 	default "wget --passive-ftp -nd"
 
-config BR2_SVN
+config BR2_SVN_CO
 	string "Subversion (svn) command to download source tree"
 	default "svn co"
 
+config BR2_SVN_UP
+	string "Subversion (svn) command to update source tree"
+	default "svn up"
+
 config BR2_GIT
 	string "Git command to download source tree"
 	default "git clone"

Modified: trunk/buildroot/package/libvorbis/libvorbis.mk
===================================================================
--- trunk/buildroot/package/libvorbis/libvorbis.mk	2007-09-19 20:13:08 UTC (rev 19898)
+++ trunk/buildroot/package/libvorbis/libvorbis.mk	2007-09-19 20:22:58 UTC (rev 19899)
@@ -82,11 +82,11 @@
 
 $(DL_DIR)/$(TREMOR_SOURCE):
 	(cd $(BUILD_DIR); \
-		svn co $(TREMOR_TRUNK); \
+		$(SVN_CO) $(TREMOR_TRUNK); \
 		mv -f Tremor $(TREMOR_NAME); \
 		tar -cvf $(TREMOR_NAME).tar $(TREMOR_DIR); \
 		bzip2 $(TREMOR_NAME).tar; \
-		rm -fr $(TREMOR_DIR); \
+		rm -rf $(TREMOR_DIR); \
 		mv $(TREMOR_NAME).tar.bz2 $(DL_DIR)/$(TREMOR_SOURCE); \
 	)
 
@@ -99,9 +99,6 @@
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig" \
-		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
-		PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -150,13 +147,12 @@
 #
 ############################################################
 ifeq ($(strip $(BR2_PACKAGE_LIBVORBIS)),y)
-ifeq ($(strip $(BR2_PACKAGE_LIBVORBIS)),y)
+ifeq ($(strip $(BR2_PACKAGE_LIBVORBIS_TREMOR)),y)
 TARGETS+=tremor
-else
+endif
 TARGETS+=libvorbis
 endif
-endif
 
 ifeq ($(strip $(BR2_PACKAGE_LIBVORBIS_HEADERS)),y)
- TARGETS+=libvorbis-header
+TARGETS+=libvorbis-header
 endif
