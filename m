From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 Jan 2009 23:06:28 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/alsa-utils
Message-ID: <20090122230628.8AFE376724@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-22 23:06:28 +0000 (Thu, 22 Jan 2009)
New Revision: 24974

Log:
Add workarounds for alsa-utils

Added:
   trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.arm
   trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.avr32

Modified:
   trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk


Changeset:
Added: trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.arm
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.arm	                        (rev 0)
+++ trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.arm	2009-01-22 23:06:28 UTC (rev 24974)
@@ -0,0 +1,29 @@
+When configuring alsa-utils, it will use the hosts <ncurses.h>
+See: alsa-utils <VERSION> / alsamixer/.deps/alsamicer.Po
+This will, on OpenSuSE 11.0, and possibly other distributions
+result in that the preprocessor directive:
+#define acs_map _nc_acs_map
+which is present in the Buildroot build of ncurses,
+is not executed, and the
+extern <chartype> acs_map[]; 
+declaration in the host ncurses will
+result in an undefined symbol: acs_map.
+
+This patches give up trying to force alsa-utils to use the correct
+ncurses, and just defines a byte with the needed symbol.
+
+
+diff -urN alsa-utils-1.0.18-0rig//alsamixer/alsamixer.c alsa-utils-1.0.18/alsamixer/alsamixer.c
+--- alsa-utils-1.0.18-0rig//alsamixer/alsamixer.c	2008-10-29 13:42:11.000000000 +0100
++++ alsa-utils-1.0.18/alsamixer/alsamixer.c	2009-01-22 23:35:29.000000000 +0100
+@@ -115,6 +115,10 @@
+ #include <sys/time.h>
+ 
+ #include <locale.h>
++/* Ugly hack to get rid of undefined "acs_map" */
++/* This is caused by configure using host ncurses.h */
++/* instead of buildroot's ncurses.h */
++unsigned long acs_map[1];
+ 
+ #ifndef CURSESINC
+ #include <ncurses.h>

Added: trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.avr32
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.avr32	                        (rev 0)
+++ trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.avr32	2009-01-22 23:06:28 UTC (rev 24974)
@@ -0,0 +1,29 @@
+When configuring alsa-utils, it will use the hosts <ncurses.h>
+See: alsa-utils <VERSION> / alsamixer/.deps/alsamicer.Po
+This will, on OpenSuSE 11.0, and possibly other distributions
+result in that the preprocessor directive:
+#define acs_map _nc_acs_map
+which is present in the Buildroot build of ncurses,
+is not executed, and the
+extern <chartype> acs_map[]; 
+declaration in the host ncurses will
+result in an undefined symbol: acs_map.
+
+This patches give up trying to force alsa-utils to use the correct
+ncurses, and just defines a byte with the needed symbol.
+
+
+diff -urN alsa-utils-1.0.18-0rig//alsamixer/alsamixer.c alsa-utils-1.0.18/alsamixer/alsamixer.c
+--- alsa-utils-1.0.18-0rig//alsamixer/alsamixer.c	2008-10-29 13:42:11.000000000 +0100
++++ alsa-utils-1.0.18/alsamixer/alsamixer.c	2009-01-22 23:35:29.000000000 +0100
+@@ -115,6 +115,10 @@
+ #include <sys/time.h>
+ 
+ #include <locale.h>
++/* Ugly hack to get rid of undefined "acs_map" */
++/* This is caused by configure using host ncurses.h */
++/* instead of buildroot's ncurses.h */
++unsigned long acs_map[1];
+ 
+ #ifndef CURSESINC
+ #include <ncurses.h>

Modified: trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk	2009-01-22 23:05:49 UTC (rev 24973)
+++ trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk	2009-01-22 23:06:28 UTC (rev 24974)
@@ -16,7 +16,8 @@
 
 $(ALSA_UTILS_DIR)/.unpacked: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
 	$(ALSA_UTILS_CAT) $(DL_DIR)/$(ALSA_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/multimedia/alsa-utils/ alsa-utils-$(ALSA_UTILS_VERSION)\*.patch\*
+	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/multimedia/alsa-utils/ alsa-utils-$(ALSA_UTILS_VERSION)\*.patch
+	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/multimedia/alsa-utils/ alsa-utils-$(ALSA_UTILS_VERSION)\*.patch.$(ARCH)
 	$(CONFIG_UPDATE) $(ALSA_UTILS_DIR)
 	touch $@
 
@@ -73,6 +74,8 @@
 
 alsa-utils: uclibc alsa-lib ncurses $(if $(BR2_PACKAGE_LIBINTL),libintl) $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
 
+alsa-utils-unpacked: $(ALSA_UTILS_DIR)/.unpacked
+
 alsa-utils-source: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
 
 alsa-utils-clean:
