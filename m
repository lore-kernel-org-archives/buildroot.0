From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Mon,  6 Oct 2008 12:14:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/ccache
Message-ID: <20081006191441.EF9D33C7C5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-10-06 12:14:41 -0700 (Mon, 06 Oct 2008)
New Revision: 23604

Log:
ccache:
-Allow user to specify custom ccache location.

This allows you to build a toolchain and put it on
 an nfs share so other people can use the toolchain
 without errors about the ccache dir missing.


Modified:
   trunk/buildroot/toolchain/ccache/Config.in
   trunk/buildroot/toolchain/ccache/ccache.mk


Changeset:
Modified: trunk/buildroot/toolchain/ccache/Config.in
===================================================================
--- trunk/buildroot/toolchain/ccache/Config.in	2008-10-06 19:09:14 UTC (rev 23603)
+++ trunk/buildroot/toolchain/ccache/Config.in	2008-10-06 19:14:41 UTC (rev 23604)
@@ -7,3 +7,13 @@
 	help
 	    Enable ccache support?
 
+config BR2_CCACHE_DIR
+	string "ccache dir location?"
+	depends on BR2_CCACHE
+	default "$(TOOL_BUILD_DIR)/ccache-$(CCACHE_VER)/cache"
+	help
+	    Where ccache should store cached files.
+
+comment "ccache dir location?       - disabled (requires ccache support)"
+	depends on !BR2_CCACHE
+

Modified: trunk/buildroot/toolchain/ccache/ccache.mk
===================================================================
--- trunk/buildroot/toolchain/ccache/ccache.mk	2008-10-06 19:09:14 UTC (rev 23603)
+++ trunk/buildroot/toolchain/ccache/ccache.mk	2008-10-06 19:14:41 UTC (rev 23604)
@@ -24,8 +24,9 @@
 	# Should probably patch things to use a relative path.
 	$(SED) "s,getenv(\"CCACHE_PATH\"),\"$(STAGING_DIR)/usr/bin-ccache\",g" \
 		$(CCACHE_DIR1)/execute.c
-	# WARNING - this will break if the toolchain build dir is deleted.
-	$(SED) "s,getenv(\"CCACHE_DIR\"),\"$(CCACHE_DIR1)/cache\",g" \
+	# WARNING - this will break if the toolchain build dir is deleted
+	#	when using the default cache dir location.
+	$(SED) "s,getenv(\"CCACHE_DIR\"),\"$(BR2_CCACHE_DIR)\",g" \
 		$(CCACHE_DIR1)/ccache.c
 	mkdir -p $(CCACHE_DIR1)/cache
 	touch $@
