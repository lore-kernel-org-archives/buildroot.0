From: Biucchi Gabriele <biucchi@tiscali.de>
Date: Tue Jul 25 04:26:42 2006
Subject: [Buildroot] problems and solutions for tinyx
In-Reply-To: <20060724181217.GB22730@codepoet.org>
References: <44C4AD92.7000205@tiscali.de> <20060724181217.GB22730@codepoet.org>
Message-ID: <44C5FF63.1040402@tiscali.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is the patch for tinyx.mk

The change for tinyx-config.patch is not needed.

Best regards,
Gabriele

-------------- next part --------------
--- buildroot/package/tinyx/tinyx.mk	2006-07-25 11:56:45.000000000 +0200
+++ br/package/tinyx/tinyx.mk	2006-07-25 12:03:45.000000000 +0200
@@ -126,8 +126,19 @@
 		cp -pRf $$file $(TINYX_LIBX) ; \
 	done
 
-tinyx: zlib $(TINYX_LIBX)/libX11.so.6.2 $(TINYX_BINX)/Xfbdev
+#
+# Install x-includes and x-libraries in $(STAGING_DIR)/usr/X11R6/
+# and add a symbolic link between /usr/bin/X11 and /usr/X11R6/bin
+#
+$(STAGING_DIR)/usr/X11R6/lib/libX11.so.6.2: $(TINYX_LIBX)/libX11.so.6.2
+	mkdir -p $(STAGING_DIR)/usr/X11R6/lib
+	mkdir -p $(STAGING_DIR)/usr/X11R6/include
+	cp -fRL $(TINYX_DIR)/exports/include/* $(STAGING_DIR)/usr/X11R6/include/
+	cp -fRL $(TINYX_DIR)/exports/lib/* $(STAGING_DIR)/usr/X11R6/lib/
+	ln -s /usr/X11R6/bin $(TARGET_DIR)/usr/bin/X11
 
+tinyx: zlib $(TINYX_LIBX)/libX11.so.6.2 $(TINYX_BINX)/Xfbdev $(STAGING_DIR)/usr/X11R6/lib/libX11.so.6.2 
+	    
 tinyx-source: $(DL_DIR)/$(TINYX_SOURCE)
 
 tinyx-clean:
