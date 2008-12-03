From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 14:29:24 -0500 (EST)
Subject: [Buildroot] [PATCH] have e2fsprogs respect BR2_PREFER_STATIC_LIB
Message-ID: <alpine.LFD.2.00.0812031428270.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: package/e2fsprogs/e2fsprogs.mk
===================================================================
--- package/e2fsprogs/e2fsprogs.mk	(revision 24219)
+++ package/e2fsprogs/e2fsprogs.mk	(working copy)
@@ -26,6 +26,12 @@
 	$(CONFIG_UPDATE) $(E2FSPROGS_DIR)/config
 	touch $@
 
+ifeq ($(strip $(BR2_PREFER_STATIC_LIB)),y)
+E2SHLIBS := --disable-elf-shlibs --disable-bsd-shlibs
+else
+E2SHLIBS := --enable-elf-shlibs
+endif
+
 $(E2FSPROGS_DIR)/.configured: $(E2FSPROGS_DIR)/.unpacked
 	(cd $(E2FSPROGS_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -48,7 +54,7 @@
 		--localstatedir=/var \
 		--mandir=/usr/share/man \
 		--infodir=/usr/share/info \
-		--enable-elf-shlibs --enable-dynamic-e2fsck --disable-swapfs \
+		$(E2SHLIBS) --enable-dynamic-e2fsck --disable-swapfs \
 		--disable-debugfs --disable-imager \
 		--disable-resizer --enable-fsck \
 		--disable-e2initrd-helper \
