From: Dan Nicolaescu <dann@ics.uci.edu>
Date: Fri, 08 Feb 2008 17:11:51 -0800
Subject: [Buildroot] [patch] install fontconfig binaries fc-cache, fc-list,
	fc-cat and fc-match in $(TARGET_DIR)
Message-ID: <200802090111.m191BpdQ011594@sallyv1.ics.uci.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Not all fonconfig binaries are installed in $(TARGET_DIR), they are
useful, so it seems better to install them.  It's also not a good idea
to leave them in $STAGING_DIR/usr/bin because they can cause problems
when cross-compiling. 

Please apply. 

Thanks



diff -u a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -80,14 +79,23 @@ $(TARGET_DIR)/usr/lib/libfontconfig.so: $(STAGING_DIR)/usr/lib/libfontconfig.so
 	mkdir -p $(TARGET_DIR)/usr/bin
 	cp -a $(STAGING_DIR)/usr/bin/fc-cache $(TARGET_DIR)/usr/bin/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/fc-cache
+	-rm -f $(STAGING_DIR)/usr/bin/fc-cache
 	cp -a $(STAGING_DIR)/usr/bin/fc-list $(TARGET_DIR)/usr/bin/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/fc-list
+	-rm -f $(STAGING_DIR)/usr/bin/fc-list
+	cp -a $(STAGING_DIR)/usr/bin/fc-cat $(TARGET_DIR)/usr/bin/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/fc-cat
+	-rm -f $(STAGING_DIR)/usr/bin/fc-cat
+	cp -a $(STAGING_DIR)/usr/bin/fc-match $(TARGET_DIR)/usr/bin/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/fc-match
+	-rm -f $(STAGING_DIR)/usr/bin/fc-match
 	touch -c $@
 
 fontconfig: uclibc freetype host-freetype expat $(TARGET_DIR)/usr/lib/libfontconfig.so
 
 fontconfig-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FONTCONFIG_DIR) uninstall
+	-rm -f $(STAGING_DIR)/usr/bin/fc-cache $(STAGING_DIR)/usr/bin/fc-list $(STAGING_DIR)/usr/bin/fc-cat $(STAGING_DIR)/usr/bin/fc-match
 	-$(MAKE) -C $(FONTCONFIG_DIR) clean
 
 fontconfig-dirclean:
