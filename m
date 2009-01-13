From: laird at uclibc.org <laird@uclibc.org>
Date: Tue, 13 Jan 2009 10:26:29 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: gettext
	multimedia/alsa-utils
Message-ID: <20090113102629.9FDF776850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-13 10:26:28 +0000 (Tue, 13 Jan 2009)
New Revision: 24812

Log:
package/alsa-lib/alsa-lib.mk
package/gettext/gettext.mk: Both of these components look for iconv when configuring so need to be dependent.

Both of these packages can be built with libiconv support.  If libiconv is enabled and these are built first 
then some configure variables get stored in the system cache and then libiconv is not used properly.
If libiconv is selected by user make sure it is built before either of these packages are built.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/gettext/gettext.mk
   trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk


Changeset:
Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2009-01-13 08:02:52 UTC (rev 24811)
+++ trunk/buildroot/package/gettext/gettext.mk	2009-01-13 10:26:28 UTC (rev 24812)
@@ -120,7 +120,7 @@
 		autopoint envsubst gettext.sh gettextize msg* ?gettext)
 	touch -c $@
 
-gettext: uclibc pkgconfig $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
+gettext: uclibc pkgconfig $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 
 gettext-unpacked: $(GETTEXT_DIR)/.unpacked
 

Modified: trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk	2009-01-13 08:02:52 UTC (rev 24811)
+++ trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk	2009-01-13 10:26:28 UTC (rev 24812)
@@ -71,7 +71,7 @@
 	fi
 	touch -c $@
 
-alsa-utils: uclibc alsa-lib ncurses $(if $(BR2_PACKAGE_LIBINTL),libintl) $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
+alsa-utils: uclibc alsa-lib ncurses $(if $(BR2_PACKAGE_LIBINTL),libintl) $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
 
 alsa-utils-source: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
 
