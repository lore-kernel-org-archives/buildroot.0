From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Feb 2009 13:30:03 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/mesa3d
Message-ID: <20090224133004.2C03B7669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-24 13:30:03 +0000 (Tue, 24 Feb 2009)
New Revision: 25443

Log:
mesa3d: fix makedepend arguments

Make sure makedepends only searches the gcc/staging dir, and not the
host include dirs.

Modified:
   trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk
===================================================================
--- trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk	2009-02-24 13:29:59 UTC (rev 25442)
+++ trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk	2009-02-24 13:30:03 UTC (rev 25443)
@@ -24,6 +24,8 @@
 MESA_BUILD_ENV=$(TARGET_CONFIGURE_OPTS)
 MESA_CONFIG_FILE=$(MESA3D_DIR)/configs/$(MESA_TARGET)
 
+MESA_GCCINCLUDE=$(shell $(TARGET_CC) -print-search-dirs|grep '^install:'|sed 's/^install: //')/include
+
 #MESA_DRIVERS= i810 i915 i965 mga mach64 r128 r200 r300 s3v savage sis ffb tdfx trident unichrome
 MESA_DRIVERS=
 
@@ -46,15 +48,14 @@
 		echo "USING_EGL = 0" && \
 		echo "X11_INCLUDES = " && \
 		echo "EXTRA_LIB_PATH = " && \
-		echo "PROGRAM_DIRS =" \
+		echo "PROGRAM_DIRS =" && \
+		echo "MKDEP_OPTIONS = -fdepend -Y$(STAGING_DIR)/usr/include -I$(MESA_GCCINCLUDE)" \
 	) >> $(MESA_CONFIG_FILE)
 	touch $@
 
 $(MESA3D_DIR)/.built: $(MESA3D_DIR)/.configured
-	gccinc=$$($(TARGET_CC) -print-search-dirs | grep '^install:' | sed 's@^install: @@')include; \
 	rm -f $(MESA3D_DIR)/config/current
 	env $(MESA_BUILD_ENV) $(MAKE1) \
-		MKDEP="makedepend -I$$gccinc" \
 		CC=$(TARGET_CC) CXX=$(TARGET_CXX) CC_FOR_BUILD=/usr/bin/gcc \
 		-C $(MESA3D_DIR) $(MESA_TARGET)
 	touch $@
