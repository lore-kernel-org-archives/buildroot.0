From: hamish at uclibc.org <hamish@uclibc.org>
Date: Sun,  7 Dec 2008 20:41:19 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tiff
Message-ID: <20081208044119.81B323C6DF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-12-07 20:41:19 -0800 (Sun, 07 Dec 2008)
New Revision: 24304

Log:
Over-ride the target-install target rather than installing as a post-build
hook. Otherwise the wrong stamps are used and the library won't be reinstalled
if you clean out $(TARGET_DIR).


Modified:
   trunk/buildroot/package/tiff/tiff.mk


Changeset:
Modified: trunk/buildroot/package/tiff/tiff.mk
===================================================================
--- trunk/buildroot/package/tiff/tiff.mk	2008-12-07 21:22:51 UTC (rev 24303)
+++ trunk/buildroot/package/tiff/tiff.mk	2008-12-08 04:41:19 UTC (rev 24304)
@@ -8,7 +8,7 @@
 TIFF_SOURCE:=tiff-$(TIFF_VERSION).tar.gz
 TIFF_LIBTOOL_PATCH = NO
 TIFF_INSTALL_STAGING = YES
-TIFF_INSTALL_TARGET = NO
+TIFF_INSTALL_TARGET = YES
 TIFF_CONF_OPT = \
 	--enable-shared \
 	--enable-static \
@@ -19,7 +19,7 @@
 
 $(eval $(call AUTOTARGETS,package,tiff))
 
-$(TIFF_HOOK_POST_BUILD):
+$(TIFF_TARGET_INSTALL_TARGET):
 	-cp -a $(TIFF_DIR)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtiff.so
 	touch $@
