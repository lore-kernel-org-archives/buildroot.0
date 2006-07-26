From: andersen@uclibc.org <andersen@uclibc.org>
Date: Wed Jul 26 12:11:39 2006
Subject: [Buildroot] svn commit: trunk/buildroot/package/tinyx
Message-ID: <20060726191137.1053948B0E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-26 12:11:36 -0700 (Wed, 26 Jul 2006)
New Revision: 15747

Log:
patch from Biucchi Gabriele:
Some programs (like rxvt) need x-includes and x-libraries in
$(STAGING_DIR)/usr/X11R6/ , but tinyx.mk does not install anything there.
copy everything from $(TINYX_DIR)/exports/ into $(STAGING_DIR)/usr/X11R6/


Modified:
   trunk/buildroot/package/tinyx/tinyx.mk


Changeset:
Modified: trunk/buildroot/package/tinyx/tinyx.mk
===================================================================
--- trunk/buildroot/package/tinyx/tinyx.mk	2006-07-26 17:25:08 UTC (rev 15746)
+++ trunk/buildroot/package/tinyx/tinyx.mk	2006-07-26 19:11:36 UTC (rev 15747)
@@ -100,8 +100,17 @@
 	( cd $(TINYX_DIR) ; $(MAKE) World )
 
 #
+# Install x-includes and x-libraries in $(STAGING_DIR)/usr/X11R6/
+# and add a symbolic link between /usr/bin/X11 and /usr/X11R6/bin
+$(STAGING_DIR)/usr/X11R6/lib/libX11.so.6.2: $(TINYX_XFBDEV)
+       mkdir -p $(STAGING_DIR)/usr/X11R6/lib
+       mkdir -p $(STAGING_DIR)/usr/X11R6/include
+       cp -fRL $(TINYX_DIR)/exports/include/* $(STAGING_DIR)/usr/X11R6/include/
+       cp -fRL $(TINYX_DIR)/exports/lib/* $(STAGING_DIR)/usr/X11R6/lib/
+       ln -s /usr/X11R6/bin $(TARGET_DIR)/usr/bin/X11
+
+#
 # Once Frame Buffer is built, we install executables.
-#
 $(TINYX_BINX)/Xfbdev: $(TINYX_XFBDEV)
 	-mkdir $(TARGET_DIR)/usr/X11R6
 	-mkdir $(TINYX_BINX)
@@ -116,7 +125,6 @@
 
 #
 # After we have executables installed, install the libraries.
-#
 $(TINYX_LIBX)/libX11.so.6.2: $(TINYX_XFBDEV)
 	for dirs in $(TINYX_LIBS) ; do \
 		file=`find $(TINYX_LDIR)/$$dirs -type f -iname "lib$$dirs.so*"` ; \
@@ -126,7 +134,8 @@
 		cp -pRf $$file $(TINYX_LIBX) ; \
 	done
 
-tinyx: zlib $(TINYX_LIBX)/libX11.so.6.2 $(TINYX_BINX)/Xfbdev
+tinyx: zlib $(STAGING_DIR)/usr/X11R6/lib/libX11.so.6.2 \
+	$(TINYX_LIBX)/libX11.so.6.2 $(TINYX_BINX)/Xfbdev
 
 tinyx-source: $(DL_DIR)/$(TINYX_SOURCE)
 
