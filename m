From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed,  3 Sep 2008 18:19:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080904011953.5CF893C675@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-03 18:19:52 -0700 (Wed, 03 Sep 2008)
New Revision: 23313

Log:
Fix duplicate $(AUTORECONF) run in autoreconf and configure targets


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-09-04 01:05:17 UTC (rev 23312)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-09-04 01:19:52 UTC (rev 23313)
@@ -192,17 +192,15 @@
 $(BUILD_DIR)/%/.stamp_autoconfigured:
 	$(call MESSAGE,"Running autoreconf")
 	$(Q)cd $(@D)/$($(PKG)_SUBDIR) && $(AUTORECONF)
+# if the package uses libtool, patch it for cross-compiling in buildroot
+	$(Q)for i in `find $(@D)/$($(PKG)_SUBDIR) -name ltmain.sh`; do \
+		toolchain/patch-kernel.sh $${i%/*} package buildroot-libtool.patch; \
+		done
 	$(Q)touch $@
 
 # Configuring
 $(BUILD_DIR)/%/.stamp_configured:
 	$(call MESSAGE,"Configuring")
-	$(Q)if test "$($(PKG)_AUTORECONF)" = "YES"; then \
-		cd $(@D)/$($(PKG)_SUBDIR) && $(AUTORECONF); \
-		for i in `find $(@D)/$($(PKG)_SUBDIR) -name ltmain.sh`; do \
-			../../toolchain/patch-kernel.sh $${i%/*} ../../package buildroot-libtool.patch; \
-		done \
-	fi
 	cd $(@D)/$($(PKG)_SUBDIR) && rm -f config.cache && \
 	$(TARGET_CONFIGURE_OPTS) \
 	$(TARGET_CONFIGURE_ARGS) \
