From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Apr 2010 22:39:19 +0200
Subject: [Buildroot] [PATCH 1/1] libaio: convert to the GENTARGETS
	infrastructure
In-Reply-To: <cover.1270499953.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270499953.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0254addf9b7aee9429122d5d6934adbe88b904d4.1270499953.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libaio/libaio.mk |   52 +++++++++++----------------------------------
 1 files changed, 13 insertions(+), 39 deletions(-)

diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index f1bb603..58cdf6c 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -3,48 +3,22 @@
 # libaio
 #
 #############################################################
-LIBAIO_VERSION=0.3.106-avr32
+LIBAIO_VERSION=0.3.109
 LIBAIO_SOURCE=libaio-$(LIBAIO_VERSION).tar.bz2
-LIBAIO_SITE=http://avr32linux.org/twiki/pub/Main/LibAio/
-LIBAIO_DIR=$(BUILD_DIR)/libaio-$(LIBAIO_VERSION)
-LIBAIO_SOVER=1.0.1
+LIBAIO_SITE=ftp://ftp.kernel.org/pub/linux/libs/aio/
+LIBAIO_INSTALL_STAGING=YES
 
-LIBAIO_ARCH:=$(ARCH)
-LIBAIO_MAKEOPTS:= $(TARGET_CONFIGURE_OPTS) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS) -nostdlib -nostartfiles -I. -fPIC" LDFLAGS="$(TARGET_LDFLAGS)"
+define LIBAIO_BUILD_CMDS
+  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
 
-$(DL_DIR)/$(LIBAIO_SOURCE):
-	$(call DOWNLOAD,$(LIBAIO_SITE),$(LIBAIO_SOURCE))
+define LIBAIO_INSTALL_STAGING_CMDS
+  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
 
-$(LIBAIO_DIR)/.unpacked: $(DL_DIR)/$(LIBAIO_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(LIBAIO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBAIO_DIR) package/libaio libaio\*.patch
-	touch $@
+define LIBAIO_INSTALL_TARGET_CMDS
+  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
 
-$(LIBAIO_DIR)/src/libaio.so.$(LIBAIO_SOVER): $(LIBAIO_DIR)/.unpacked
-	$(MAKE) -C $(LIBAIO_DIR) $(LIBAIO_MAKEOPTS)
+$(eval $(call GENTARGETS,package,libaio))
 
-$(STAGING_DIR)/usr/lib/libaio.so: $(LIBAIO_DIR)/src/libaio.so.$(LIBAIO_SOVER)
-	$(MAKE) -C $(LIBAIO_DIR) $(LIBAIO_MAKEOPTS) prefix=$(STAGING_DIR)/usr install
-
-$(TARGET_DIR)/usr/lib/libaio.so: $(STAGING_DIR)/usr/lib/libaio.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libaio.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libaio.so
-
-libaio: $(TARGET_DIR)/usr/lib/libaio.so
-
-libaio-source: $(DL_DIR)/$(LIBAIO_SOURCE)
-
-libaio-clean:
-	-$(MAKE) -C $(LIBAIO_DIR) $(LIBAIO_MAKEOPTS) clean
-
-libaio-dirclean:
-	rm -rf $(LIBAIO_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBAIO),y)
-TARGETS+=libaio
-endif
-- 
1.6.3.3
