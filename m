From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 29 Mar 2009 19:10:26 +0000 (UTC)
Subject: [Buildroot] svn commit: [25880] trunk/buildroot/package: automake
	libtool pkgconfig
Message-ID: <20090329191026.8F79877487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-29 19:10:26 +0000 (Sun, 29 Mar 2009)
New Revision: 25880

Log:
package: proper aclocal fix

Revert r25827 and instead copy over the host aclocal files of the stuff
needed for auto* (libtool + pkgconfig). These logically belong with the
target stuff, as they are used for the target auto* toolchain.

Long term we should probably consider using
aclocal --acdir=$(STAGING_DIR)/usr/share/aclocal, so the host .m4 files
cannot interfere with the target build.

Modified:
   trunk/buildroot/package/automake/automake.mk
   trunk/buildroot/package/libtool/libtool.mk
   trunk/buildroot/package/pkgconfig/pkgconfig.mk


Changeset:
Modified: trunk/buildroot/package/automake/automake.mk
===================================================================
--- trunk/buildroot/package/automake/automake.mk	2009-03-29 18:32:18 UTC (rev 25879)
+++ trunk/buildroot/package/automake/automake.mk	2009-03-29 19:10:26 UTC (rev 25880)
@@ -20,7 +20,7 @@
 
 # variables used by other packages
 AUTOMAKE:=$(HOST_DIR)/usr/bin/automake
-ACLOCAL_DIR = $(HOST_DIR)/usr/share/aclocal
+ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
 ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
 
 $(DL_DIR)/$(AUTOMAKE_SOURCE):
@@ -51,6 +51,7 @@
 
 $(STAMP_DIR)/host_automake_installed: $(STAMP_DIR)/host_automake_compiled
 	$(MAKE) -C $(AUTOMAKE_HOST_DIR) install
+	mkdir -p $(STAGING_DIR)/usr/share/aclocal
 	touch $@
 
 host-automake: $(STAMP_DIR)/host_automake_installed

Modified: trunk/buildroot/package/libtool/libtool.mk
===================================================================
--- trunk/buildroot/package/libtool/libtool.mk	2009-03-29 18:32:18 UTC (rev 25879)
+++ trunk/buildroot/package/libtool/libtool.mk	2009-03-29 19:10:26 UTC (rev 25880)
@@ -49,6 +49,10 @@
 
 $(STAMP_DIR)/host_libtool_installed: $(STAMP_DIR)/host_libtool_compiled
 	$(MAKE) -C $(LIBTOOL_HOST_DIR) install
+	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/libtool.m4 \
+		$(STAGING_DIR)/usr/share/aclocal/libtool.m4
+	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/ltdl.m4 \
+		$(STAGING_DIR)/usr/share/aclocal/ltdl.m4
 	touch $@
 
 host-libtool: $(STAMP_DIR)/host_libtool_installed

Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-29 18:32:18 UTC (rev 25879)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-29 19:10:26 UTC (rev 25880)
@@ -50,6 +50,8 @@
 
 $(STAMP_DIR)/host_pkgconfig_installed: $(STAMP_DIR)/host_pkgconfig_compiled
 	$(MAKE) -C $(PKG_CONFIG_HOST_DIR) install
+	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/pkg.m4 \
+		$(STAGING_DIR)/usr/share/aclocal/pkg.m4
 	touch $@
 
 host-pkgconfig: $(STAMP_DIR)/host_pkgconfig_installed
