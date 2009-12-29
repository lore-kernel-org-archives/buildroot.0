From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 29 Dec 2009 22:45:41 +0100
Subject: [Buildroot] [PATCH] jpeg: convert to autotools infrastructure
In-Reply-To: <87aax1v6zy.fsf@macbook.be.48ers.dk>
References: <4d28d4b50912290214u6b15af37nbefdf6b672b87c3d@mail.gmail.com>
	<87aax1v6zy.fsf@macbook.be.48ers.dk>
Message-ID: <1262123141.5867.51.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/jpeg/jpeg.mk |   73 ++++++-------------------------------------------
 1 files changed, 9 insertions(+), 64 deletions(-)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 2688084..b4afc24 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -21,77 +21,22 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
 JPEG_VERSION:=6b
-JPEG_DIR=$(BUILD_DIR)/jpeg-$(JPEG_VERSION)
 JPEG_SITE:=ftp://ftp.uu.net/graphics/jpeg/
 JPEG_SOURCE=jpegsrc.v$(JPEG_VERSION).tar.gz
-JPEG_CAT:=$(ZCAT)
+JPEG_INSTALL_STAGING = YES
+JPEG_INSTALL_TARGET = YES
 
-$(DL_DIR)/$(JPEG_SOURCE):
-	 $(call DOWNLOAD,$(JPEG_SITE),$(JPEG_SOURCE))
+JPEG_CONF_OPT = --without-x --enable-shared --enable-static
 
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
-	touch $@
-
-$(JPEG_DIR)/.libs/libjpeg.a: $(JPEG_DIR)/.configured
-	$(MAKE) -C $(JPEG_DIR) all
-	touch -c $@
-
-$(STAGING_DIR)/usr/lib/libjpeg.a: $(JPEG_DIR)/.libs/libjpeg.a
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(JPEG_DIR) install
-	cp -f $(JPEG_DIR)/libjpeg.la $(STAGING_DIR)/usr/lib
+define JPEG_INSTALL_STAGING_CMDS
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libjpeg.la
-	touch -c $@
+endef
 
-$(TARGET_DIR)/usr/lib/libjpeg.so: $(STAGING_DIR)/usr/lib/libjpeg.a
+define JPEG_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/libjpeg.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libjpeg.so*
-	touch -c $@
-
-jpeg: $(TARGET_DIR)/usr/lib/libjpeg.so
-
-jpeg-clean:
-	-$(MAKE) -C $(JPEG_DIR) clean
+endef
 
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
+$(eval $(call AUTOTARGETS,package,jpeg))
-- 
1.6.5.7
