From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 Dec 2009 13:48:02 +0100
Subject: [Buildroot] [git commit master] jpeg: convert to autotools
	infrastructure
Message-ID: <20091230125026.15826776B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=21bab8862f3c2906af347e5a993ce4cd36c1b063
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: has own libtool patch, use std staging install, fix target install]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jpeg/jpeg.mk |   77 +++++--------------------------------------------
 1 files changed, 8 insertions(+), 69 deletions(-)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 2688084..c3754d4 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -21,77 +21,16 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
 JPEG_VERSION:=6b
-JPEG_DIR=$(BUILD_DIR)/jpeg-$(JPEG_VERSION)
 JPEG_SITE:=ftp://ftp.uu.net/graphics/jpeg/
 JPEG_SOURCE=jpegsrc.v$(JPEG_VERSION).tar.gz
-JPEG_CAT:=$(ZCAT)
+JPEG_INSTALL_STAGING = YES
+JPEG_INSTALL_TARGET = YES
+JPEG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+JPEG_LIBTOOL_PATCH = NO
+JPEG_CONF_OPT = --without-x --enable-shared --enable-static
 
-$(DL_DIR)/$(JPEG_SOURCE):
-	 $(call DOWNLOAD,$(JPEG_SITE),$(JPEG_SOURCE))
+$(eval $(call AUTOTARGETS,package,jpeg))
 
-jpeg-source: $(DL_DIR)/$(JPEG_SOURCE)
-
-$(JPEG_DIR)/.unpacked: $(DL_DIR)/$(JPEG_SOURCE)
-	$(JPEG_CAT) $(DL_DIR)/$(JPEG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(JPEG_DIR) package/jpeg/ jpeg\*.patch
-	$(CONFIG_UPDATE) $(JPEG_DIR)
-	touch $@
-
-$(JPEG_DIR)/.configured: $(JPEG_DIR)/.unpacked
-	(cd $(JPEG_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/usr/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		--enable-shared \
-		--enable-static \
-		--without-x \
-	)
+$(JPEG_HOOK_POST_INSTALL):
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtrans rdjpgcom wrjpgcom)
 	touch $@
-
-$(JPEG_DIR)/.libs/libjpeg.a: $(JPEG_DIR)/.configured
-	$(MAKE) -C $(JPEG_DIR) all
-	touch -c $@
-
-$(STAGING_DIR)/usr/lib/libjpeg.a: $(JPEG_DIR)/.libs/libjpeg.a
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(JPEG_DIR) install
-	cp -f $(JPEG_DIR)/libjpeg.la $(STAGING_DIR)/usr/lib
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libjpeg.la
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libjpeg.so: $(STAGING_DIR)/usr/lib/libjpeg.a
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/usr/lib/libjpeg.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libjpeg.so*
-	touch -c $@
-
-jpeg: $(TARGET_DIR)/usr/lib/libjpeg.so
-
-jpeg-clean:
-	-$(MAKE) -C $(JPEG_DIR) clean
-
-jpeg-dirclean:
-	rm -rf $(JPEG_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_JPEG),y)
-TARGETS+=jpeg
-endif
-- 
1.6.3.3
