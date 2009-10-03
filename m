From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 23:05:58 +0200
Subject: [Buildroot] [git commit master] libmad: remove dedicated
	target-headers option
Message-ID: <20091003210636.96E82776F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e008caa06c4cdc78a0b3cd61e6269ca72fdbdcb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead, simply only copy headers/static lib if BR2_HAVE_DEVFILES
is enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                             |    2 +-
 package/multimedia/libmad/Config.in |    6 ------
 package/multimedia/libmad/libmad.mk |   13 ++++---------
 3 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6e7f259..e0af608 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 
 	Updated/fixed packages: autoconf, busybox, directfb, dnsmasq,
 	festival, imagemagick, iptables, kernel-headers, kismet,
-	libevent, libglib2, liblockfile, libuuid, ltrace, mdadm,
+	libevent, libglib2, liblockfile, libmad, libuuid, ltrace, mdadm,
 	ncftp, netkittelnet, openssl, python, quagga, radvd, samba,
 	speech-tools, squashfs, syslinux, u-boot, valgrind, wipe,
 	xdata_xcursor-themes
diff --git a/package/multimedia/libmad/Config.in b/package/multimedia/libmad/Config.in
index 867a11a..4d4f930 100644
--- a/package/multimedia/libmad/Config.in
+++ b/package/multimedia/libmad/Config.in
@@ -6,9 +6,3 @@ config BR2_PACKAGE_LIBMAD
 	  without a floating-point unit.
 
 	  http://www.underbit.com/products/mad/
-
-config BR2_PACKAGE_LIBMAD_TARGET_HEADERS
-	bool "libmad headers in target"
-	depends on BR2_PACKAGE_LIBMAD
-	help
-	  Put headers files in the target.
diff --git a/package/multimedia/libmad/libmad.mk b/package/multimedia/libmad/libmad.mk
index 07b1e0a..83be902 100644
--- a/package/multimedia/libmad/libmad.mk
+++ b/package/multimedia/libmad/libmad.mk
@@ -47,20 +47,18 @@ $(STAGING_DIR)/usr/lib/libmad.so.0: $(LIBMAD_DIR)/libmad.la
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libmad.la
 
 $(TARGET_DIR)/usr/lib/libmad.so.0: $(STAGING_DIR)/usr/lib/libmad.so.0
-	cp -dpf $(STAGING_DIR)/usr/lib/libmad.so.* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libmad.so.*
-
-$(TARGET_DIR)/usr/lib/libmad.a: $(STAGING_DIR)/usr/lib/libmad.so.0
+ifeq ($(BR2_HAVE_DEVFILES),y)
 	mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(STAGING_DIR)/usr/include/mad.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(STAGING_DIR)/usr/lib/libmad.la $(TARGET_DIR)/usr/lib/
 	cp -dpf $(STAGING_DIR)/usr/lib/libmad.so $(TARGET_DIR)/usr/lib/
 	cp -dpf $(STAGING_DIR)/usr/lib/libmad.a $(TARGET_DIR)/usr/lib/
+endif
+	cp -dpf $(STAGING_DIR)/usr/lib/libmad.so.* $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libmad.so.*
 
 libmad: $(TARGET_DIR)/usr/lib/libmad.so.0
 
-libmad-headers: $(TARGET_DIR)/usr/lib/libmad.a
-
 libmad-source: $(DL_DIR)/$(LIBMAD_SOURCE)
 
 libmad-clean:
@@ -81,6 +79,3 @@ libmad-dirclean:
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
 TARGETS+=libmad
 endif
-ifeq ($(BR2_PACKAGE_LIBMAD_TARGET_HEADERS),y)
-TARGETS+=libmad-headers
-endif
-- 
1.6.3.3
