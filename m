From: Blaine Kubesh <bkubesh@cisco.com>
Date: Mon, 02 Jun 2008 20:24:35 -0500
Subject: [Buildroot] bug in ncurses.mk commit on 3/31/08
In-Reply-To: <2590773a0806021308j4137d671v15cf0d297e4c5c02@mail.gmail.com>
Message-ID: <C46A0783.17301%bkubesh@cisco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was looking into the error:

-----
ln -sf /usr/share/terminfo /$(TARGET_DIR)/usr/lib/terminfo
ln: creating symbolic link `$(TARGET_DIR)/usr/lib/terminfo/terminfo' to
`/usr/share/terminfo': Permission denied
-----

The source of the problem is related to a commit on March 31, 2008.

The first diff line should use $(TARGET_DIR)/usr/share and not the host
system's /usr/share:
-    -cp -dpf $(STAGING_DIR)/usr/lib/terminfo $(TARGET_DIR)/usr/lib/
+    ln -sf $(TARGET_DIR)/usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo

====

--- trunk/buildroot/package/ncurses/ncurses.mk    2008/03/26 03:28:09
21494
+++ trunk/buildroot/package/ncurses/ncurses.mk    2008/03/31 14:44:32
21596
@@ -104,7 +104,7 @@
 
 $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION):
$(STAGING_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
     cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/
-    -cp -dpf $(STAGING_DIR)/usr/lib/terminfo $(TARGET_DIR)/usr/lib/
+    ln -sf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
     mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
     cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm
$(TARGET_DIR)/usr/share/terminfo/x
     cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-color
$(TARGET_DIR)/usr/share/terminfo/x
@@ -129,8 +129,7 @@
     cp -dpf $(NCURSES_DIR)/include/unctrl.h $(TARGET_DIR)/usr/include/
     cp -dpf $(NCURSES_DIR)/include/termcap.h $(TARGET_DIR)/usr/include/
     cp -dpf $(NCURSES_DIR)/lib/libncurses.a $(TARGET_DIR)/usr/lib/
-    rm -f $(TARGET_DIR)/usr/lib/terminfo
-    (cd $(TARGET_DIR)/usr/lib; ln -fs ../share/terminfo; \
+    (cd $(TARGET_DIR)/usr/lib; \
      ln -fs libncurses.a libcurses.a; \
      ln -fs libncurses.a libtermcap.a; \
     )
@@ -151,6 +150,7 @@
     rm -f $(STAGING_DIR)/usr/lib/libncurses.so*
$(TARGET_DIR)/usr/lib/libncurses.so*
     rm -rf $(STAGING_DIR)/usr/share/tabset $(TARGET_DIR)/usr/share/tabset
     rm -rf $(STAGING_DIR)/usr/share/terminfo
$(TARGET_DIR)/usr/share/terminfo
+    rm -rf $(TARGET_DIR)/usr/lib/terminfo
     -$(MAKE) -C $(NCURSES_DIR) clean
 
 ncurses-dirclean:
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080602/418c35cf/attachment.htm 
