From: Jared Holzman <j.holzman@genesysdesign.com.au>
Date: Fri, 21 Nov 2008 12:22:15 +1100
Subject: [Buildroot]  [PATCH 1/1] package: add bitstream-vera package
Message-ID: <49260D47.30902@genesysdesign.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds the bitstream-vera package which installs the bitstream vera series of truetype fonts to the /usr/share/fonts dir on the target.

Signed-off-by: Jared Holzman <j.holzman@genesysdesign.com.au>

---

Index: package/Config.in
===================================================================
--- package/Config.in	(revision 24069)
+++ package/Config.in	(working copy)
@@ -340,6 +339,7 @@
 comment "X libraries and helper libraries"
 #XXX: maybe some of these should depend on !BR2_PACKAGE_XSERVER_none
 source "package/atk/Config.in"
+source "package/bitstream-vera/Config.in"
 source "package/cairo/Config.in"
 source "package/pango/Config.in"
 source "package/libdrm/Config.in"
Index: package/bitstream-vera/Config.in
===================================================================
--- package/bitstream-vera/Config.in	(revision 0)
+++ package/bitstream-vera/Config.in	(revision 0)
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_BITSTREAM_VERA
+	bool "bitstream-vera"
+	help
+	  Install the Bitstream Vera Truetype fonts
Index: package/bitstream-vera/bitstream-vera.mk
===================================================================
--- package/bitstream-vera/bitstream-vera.mk	(revision 0)
+++ package/bitstream-vera/bitstream-vera.mk	(revision 0)
@@ -0,0 +1,54 @@
+#############################################################
+#
+# bitstream-vera
+#
+#############################################################
+BITSTREAM_VERA_VERSION = 1.10
+BITSTREAM_VERA_SOURCE = ttf-bitstream-vera-$(BITSTREAM_VERA_VERSION).tar.bz2
+BITSTREAM_VERA_SITE = http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10
+BITSTREAM_VERA_AUTORECONF = NO
+BITSTREAM_VERA_INSTALL_STAGING = NO
+BITSTREAM_VERA_INSTALL_TARGET = YES
+
+BITSTREAM_VERA_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/bitstream-vera
+BITSTREAM_VERA_FONTS = 
+BITSTREAM_VERA_FONTS += VeraBd.ttf
+BITSTREAM_VERA_FONTS += VeraBI.ttf
+BITSTREAM_VERA_FONTS += VeraIt.ttf
+BITSTREAM_VERA_FONTS += VeraMoBd.ttf
+BITSTREAM_VERA_FONTS += VeraMoBI.ttf
+BITSTREAM_VERA_FONTS += VeraMoIt.ttf
+BITSTREAM_VERA_FONTS += VeraMono.ttf
+BITSTREAM_VERA_FONTS += VeraSeBd.ttf
+BITSTREAM_VERA_FONTS += VeraSe.ttf
+BITSTREAM_VERA_FONTS += Vera.ttf
+
+$(eval $(call AUTOTARGETS,package,bitstream-vera))
+
+#############################################################
+#
+# Override standard configure, build and install
+#
+#############################################################
+
+$(BITSTREAM_VERA_TARGET_CONFIGURE):
+	touch $@
+
+$(BITSTREAM_VERA_TARGET_BUILD):
+	touch $@
+
+$(BITSTREAM_VERA_TARGET_INSTALL_TARGET):
+	$(Q)mkdir -p $(BITSTREAM_VERA_TARGET_DIR)
+	for file in $(BITSTREAM_VERA_FONTS); do \
+                cp -dpf $(BITSTREAM_VERA_DIR)/$$file $(BITSTREAM_VERA_TARGET_DIR)/$$file; \
+        done
+
+$(BITSTREAM_VERA_TARGET_UNINSTALL):
+	for file in $(BITSTREAM_VERA_FONTS); do \
+		rm $(BITSTREAM_VERA_TARGET_DIR)/$$file; \
+	done
+	$(Q)rmdir $(BITSTREAM_VERA_TARGET_DIR)
+
+$(BITSTREAM_VERA_TARGET_CLEAN):
+	touch $@
+

--- 

Regards,

Jared Holzman

------------------------------------------------------------------------

*Electronics Design Engineer*

*Genesys Electronics Design Pty Ltd*

Unit 5, 33 Ryde Rd Pymble

NSW, Australia 2073

Direct: +612 9496 8924

Phone: +612 9496 8900

Fax: +612 9496 8999


j.holzman at genesysdesign.com.au <mailto:j.holzman@genesysdesign.com.au>

www.genesysdesign.com.au <http://www.genesysdesign.com.au>

------------------------------------------------------------------------
