From: Karl Krach <mailinglists@blueSpirit.la>
Date: Tue, 27 Jul 2010 16:55:21 +0200
Subject: [Buildroot] Busybox: crt1.o: No such file (CONFIG_EXTRA_CFLAGS)
Message-ID: <l681g9.6u5jdn@webmail.variomedia.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'd like to submit a patch for a minor bug.

My problem: My busybox.conf is in the svn repository. When I compile the
Buildroot and my sysroot has changed, I get this ugly linker error:

/path/to/toolchain/usr/bin-ccache/../lib/gcc/powerpc-unknown-linux-uclibc/4.4.4/../../../../powerpc-unknown-linux-uclibc/bin/ld:
   crt1.o: No such file: No such file or directory

Google just tells you, that your gcc specs are wrong. But the reason is, that
the linker cmd includes "--sysroot" twice - once with the old and once with
the new sysroot.

Question: Why do we compile Busybox with overwritten EXTRA_LDFLAGS, but leave
the CONFIG_EXTRA_CFLAGS untouched?

The patch would fix this,

Thanks, Charly



--- buildroot-orig/package/busybox/busybox.mk	2010-07-26 18:52:13.000000000
-0400
+++ buildroot/package/busybox/busybox.mk	2010-07-27 10:38:40.000000000 -0400
@@ -122,16 +122,17 @@
 
 define BUSYBOX_BUILD_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
-		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
+		PREFIX="$(TARGET_DIR)" CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" CROSS_COMPILE="$(TARGET_CROSS)" \
+		-C $(@D)
 endef
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
 define BUSYBOX_INSTALL_BINARY
 	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
-		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
-		-C $(@D) install
+		PREFIX="$(TARGET_DIR)" CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" CROSS_COMPILE="$(TARGET_CROSS)" \
+		CONFIG_PREFIX="$(TARGET_DIR)" -C $(@D) install
 endef
 else
 define BUSYBOX_INSTALL_BINARY
@@ -146,16 +147,16 @@
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
-		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
-		-C $(@D) uninstall
+		PREFIX="$(TARGET_DIR)" CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" CROSS_COMPILE="$(TARGET_CROSS)" \
+		CONFIG_PREFIX="$(TARGET_DIR)" -C $(@D) uninstall
 endef
 
 define BUSYBOX_CLEAN_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
-		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
-		-C $(@D) clean
+		PREFIX="$(TARGET_DIR)" CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" CROSS_COMPILE="$(TARGET_CROSS)" \
+		CONFIG_PREFIX="$(TARGET_DIR)" -C $(@D) clean
 endef
 
 $(eval $(call GENTARGETS,package,busybox))
