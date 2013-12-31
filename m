From: randy <lxr1234@hotmail.com>
Date: Tue, 31 Dec 2013 20:32:26 +0800
Subject: [Buildroot] [PATCH 2/2] Package: add x264 20120428-2245-stable
Message-ID: <BLU0-SMTP144BDBCAB5C34D2374B9972ADC90@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


x264 is the library for encoder h.264 code.
The version I choose is which is used in debian wheezy.

Signed-off-by: ayaka <ayaka@mail.sumomo.pri>
- ---
 package/x264/Config.in |  7 +++++++
 package/x264/x264.mk   | 47
+++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 package/x264/Config.in
 create mode 100644 package/x264/x264.mk

diff --git a/package/x264/Config.in b/package/x264/Config.in
new file mode 100644
index 0000000..bb9fba6
- --- /dev/null
+++ b/package/x264/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_X264
+	bool "x264"
+	help
+	  The x264 encoder libraries for videolan.
+
+	  https://www.videolan.org/developers/x264.html
+	
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
new file mode 100644
index 0000000..4a360eb
- --- /dev/null
+++ b/package/x264/x264.mk
@@ -0,0 +1,47 @@
+###############################################################
+#
+# x264
+#
+###############################################################
+
+X264_VERSION = 20120428-2245-stable
+X264_SOURCE = x264-snapshot-$(X264_VERSION).tar.bz2
+X264_SITE= ftp://ftp.videolan.org/pub/videolan/x264/snapshots
+X264_INSTALL_STAGING = YES
+X264_INSTALL_TARGET = YES
+X264_DEPENDENCIES = host-pkgconf
+
+define X264_CONFIGURE_CMDS
+	(cd $(@D);./configure \
+		--host="$(GNU_TARGET_NAME)" \
+		--cross-prefix="$(TARGET_CROSS)" \
+		--enable-static \
+		--enable-strip \
+		--enable-pic \
+		--enable-shared \
+		--disable-ffms \
+		--disable-cli \
+	)
+endef
+
+define X264_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+endef
+
+define X264_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/x264.pc
$(STAGING_DIR)/usr/lib/pkgconfig/x264.pc
+	$(INSTALL) -D -m 0644 $(@D)/x264.h $(STAGING_DIR)/usr/include
+	$(INSTALL) -D -m 0644 $(@D)/x264_config.h $(STAGING_DIR)/usr/include
+	$(INSTALL) -D -m 0755 $(@D)/libx264.so.123
$(STAGING_DIR)/usr/lib/libx264.so.123
+	$(INSTALL) -D -m 0755 $(@D)/libx264.a $(STAGING_DIR)/usr/lib/libx264.a
+#	$(INSTALL) -D -m 0755 $(@D)/x264 $(STAGING_DIR)/usr/bin/x264
+endef
+
+define X264_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/x264.pc
$(TARGET_DIR)/usr/lib/pkgconfig/x264.pc
+	$(INSTALL) -D -m 0755 $(@D)/libx264.so.123
$(TARGET_DIR)/usr/lib/libx264.so.123
+	$(INSTALL) -D -m 0755 $(@D)/libx264.a $(TARGET_DIR)/usr/lib/libx264.a
+endef
+
+
+$(eval $(generic-package))
- -- 
1.8.5.1
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJSwrlaAAoJEPb4VsMIzTziNNsH/3squWBs0DihtzWG3coyd+GT
VUao+0QnP+CYy1mJ7Um30XWRgdfVjuZ3jZrd8WbsJOQKk8isSGODZFGIcBAEnj+l
HY22KEDijAdNfFm19C22JAMa7nHfbY4fJYMUcqz6bwvF7DF+vafSDlrzjP3LBfo2
fOzivqlFxMzfsLKcfNrxDnGXx4lx1xtwcxqRcvrGjD8KGfYy9LWCYDASiQHeDi0p
0DeaT9pbf+sZCYsmjKVIa7a4cgVdoZMtEfxTNxzCQPyU9GAM1lrwQxnjywjpBs4b
s+y+hD3zP2p7IC36ZLauKkXCPNrCMBTvuAGgXRc6nsi6po365NMkdQI2y3MOV4E=
=TH21
-----END PGP SIGNATURE-----
