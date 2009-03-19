From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Mar 2009 11:07:11 +0000 (UTC)
Subject: [Buildroot] svn commit: [25756] trunk/buildroot/package/pango
Message-ID: <20090319110711.6B2137763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-19 11:07:10 +0000 (Thu, 19 Mar 2009)
New Revision: 25756

Log:
pango: fix host build

pango likes to rerun it's configure script at make time, and it then
fails to find the correct pkg-config files (it finds the ones ins
STAGING_DIR) causing problems if they are not compatible.

Fix it by setting PKG_CONFIG_PATH in it's make environment.

Modified:
   trunk/buildroot/package/pango/pango.mk


Changeset:
Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2009-03-19 11:06:47 UTC (rev 25755)
+++ trunk/buildroot/package/pango/pango.mk	2009-03-19 11:07:10 UTC (rev 25756)
@@ -88,7 +88,7 @@
 	touch $@
 
 $(STAMP_DIR)/host_pango_compiled: $(STAMP_DIR)/host_pango_configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(PANGO_HOST_DIR)
+	$(HOST_MAKE_ENV) PKG_CONFIG_PATH="$(HOST_DIR)/usr/lib/pkgconfig$(PKG_CONFIG_PATH)" $(MAKE) -C $(PANGO_HOST_DIR)
 	touch $@
 
 $(STAMP_DIR)/host_pango_installed: $(STAMP_DIR)/host_pango_compiled
