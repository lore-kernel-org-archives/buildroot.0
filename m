From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 14:27:37 -0500 (EST)
Subject: [Buildroot] [PATCH] make busybox build honnor the "none" strip
	option
Message-ID: <alpine.LFD.2.00.0812031427000.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The busybox build insists on doing its fancy link and strip dance,
ignoring the externally provided STRIP variable.  It however tries to
avoid stripping when -elf2flt is found in LDFLAGS or CFLAGS, but a
properly configured toolchain won't need to have -elf2flt there, and
there might be legitimate reasons to not strip busybox even on non uClinux
systems.

Fortunately there is a SKIP_STRIP variable that we can set directly.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: package/busybox/busybox.mk
===================================================================
--- package/busybox/busybox.mk	(revision 24219)
+++ package/busybox/busybox.mk	(working copy)
@@ -109,7 +109,9 @@
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR)
+		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+		SKIP_STRIP=$(BR2_STRIP_none) \
+		-C $(BUSYBOX_DIR)
 ifeq ($(BR2_PREFER_IMA)$(BR2_PACKAGE_BUSYBOX_SNAPSHOT),yy)
 	rm -f $@
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
@@ -124,7 +126,9 @@
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR) install
+		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+		SKIP_STRIP=$(BR2_STRIP_none) \
+		-C $(BUSYBOX_DIR) install
 else
 	install -D -m 0755 $(BUSYBOX_DIR)/busybox $(TARGET_DIR)/bin/busybox
 endif
