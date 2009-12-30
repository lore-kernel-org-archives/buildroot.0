From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 Dec 2009 14:05:46 +0100
Subject: [Buildroot] [git commit master] libungif: convert to autotools
	infrastructure
Message-ID: <20091230130642.13D0B776F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6415e3a19ad5af9445ae80c897818fdda8905931
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use std staging/target install handling]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    4 +-
 package/libungif/libungif.mk |   67 +++++++-----------------------------------
 2 files changed, 13 insertions(+), 58 deletions(-)

diff --git a/CHANGES b/CHANGES
index b87cf23..2be6728 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,8 +3,8 @@
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
-	directfb, e2fsprogs, gst-plugins-bad, hal, iw, libfuse, libpcap,
-	lighttpd, mesa, mpg123, mtd-utils, neon, pcre, qt, sshfs,
+	directfb, e2fsprogs, gst-plugins-bad, hal, iw, jpeg, libfuse, libpcap,
+	libungif, lighttpd, mesa, mpg123, mtd-utils, neon, pcre, qt, sshfs,
 	tremor, u-boot, usbutils, xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index 6e3be9c..466a72c 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -6,64 +6,19 @@
 LIBUNGIF_VERSION:=4.1.4
 LIBUNGIF_SOURCE:=libungif-$(LIBUNGIF_VERSION).tar.bz2
 LIBUNGIF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/giflib
-LIBUNGIF_DIR:=$(BUILD_DIR)/libungif-$(LIBUNGIF_VERSION)
-LIBUNGIF_CAT:=$(BZCAT)
-LIBUNGIF_BINARY:=libungif.so.$(LIBUNGIF_VERSION)
-LIBUNGIF_TARGET_BINARY:=usr/lib/libungif.so
+LIBUNGIF_INSTALL_STAGING = YES
+LIBUNGIF_INSTALL_TARGET = YES
 
-$(DL_DIR)/$(LIBUNGIF_SOURCE):
-	$(call DOWNLOAD,$(LIBUNGIF_SITE),$(LIBUNGIF_SOURCE))
+LIBUNGIF_CONF_OPT = --without-x
 
-libungif-source: $(DL_DIR)/$(LIBUNGIF_SOURCE)
+LIBUNGIF_BINS = gif2epsn gif2ps gif2rgb gif2x11 gifasm gifbg gifburst gifclip \
+		gifclrmp gifcolor gifcomb gifcompose giffiltr giffix gifflip  \
+		gifhisto gifinfo gifinter gifinto gifovly gifpos gifrotat     \
+		gifrsize gifspnge giftext gifwedge icon2gif raw2gif rgb2gif   \
+		text2gif
 
-$(LIBUNGIF_DIR)/.unpacked: $(DL_DIR)/$(LIBUNGIF_SOURCE)
-	$(LIBUNGIF_CAT) $(DL_DIR)/$(LIBUNGIF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBUNGIF_DIR) package/libungif/ libungif-$(LIBUNGIF_VERSION)\*.patch\*
-	$(CONFIG_UPDATE) $(LIBUNGIF_DIR)
-	touch $@
+$(eval $(call AUTOTARGETS,package,libungif))
 
-$(LIBUNGIF_DIR)/.configured: $(LIBUNGIF_DIR)/.unpacked
-	(cd $(LIBUNGIF_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--sysconfdir=/etc \
-		--enable-shared \
-		--enable-static \
-		--prefix=/usr \
-		--without-x \
-	)
+$(LIBUNGIF_HOOK_POST_INSTALL):
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(LIBUNGIF_BINS))
 	touch $@
-
-$(LIBUNGIF_DIR)/lib/.libs/libungif.a: $(LIBUNGIF_DIR)/.configured
-	$(MAKE) -C $(LIBUNGIF_DIR)
-
-$(STAGING_DIR)/usr/lib/libungif.a: $(LIBUNGIF_DIR)/lib/.libs/libungif.a
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBUNGIF_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libungif.la
-
-$(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libungif.a
-	cp -dpf $(STAGING_DIR)/$(LIBUNGIF_TARGET_BINARY)* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY)*
-
-libungif: $(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY)
-
-libungif-clean:
-	rm -f $(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY)*
-	-$(MAKE) -C $(LIBUNGIF_DIR) clean
-
-libungif-dirclean:
-	rm -rf $(LIBUNGIF_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBUNGIF),y)
-TARGETS+=libungif
-endif
-- 
1.6.3.3
