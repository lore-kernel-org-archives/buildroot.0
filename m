From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed,  7 Oct 2009 22:08:30 +0200
Subject: [Buildroot] [PATCH 07/14] *-menuconfig needs dirs to exist
In-Reply-To: <382fdbb8e5e36dd9348dfd57b9267862ef8d2ead.1254945750.git.rep.dot.nop@gmail.com>
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
	<4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
	<8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<a576ef52cd1f156525fd2d327f1e7da466257be2.1254945750.git.rep.dot.nop@gmail.com>
	<df7563b3e1a87daa6f42ade2c505fecc014aa2a2.1254945750.git.rep.dot.nop@gmail.com>
	<382fdbb8e5e36dd9348dfd57b9267862ef8d2ead.1254945750.git.rep.dot.nop@gmail.com>
Message-ID: <53e08690da5a307328d4d5dc7d53865215ced09f.1254945750.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 package/busybox/busybox.mk |    2 +-
 target/linux/Makefile.in   |    4 ++--
 toolchain/uClibc/uclibc.mk |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index eb79134..c82ed0c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -130,7 +130,7 @@ busybox-unpacked: host-sed $(BUILD_DIR) $(BUSYBOX_DIR)/.unpacked
 
 busybox-config: host-sed $(BUILD_DIR) $(BUSYBOX_DIR)/.config
 
-busybox-menuconfig: host-sed $(BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.config
+busybox-menuconfig: host-sed dirs $(BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.config
 	$(MAKE) __TARGET_ARCH=$(ARCH) -C $(BUSYBOX_DIR) menuconfig
 
 busybox-update:
diff --git a/target/linux/Makefile.in b/target/linux/Makefile.in
index c4962bd..f3c7807 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -201,7 +201,7 @@ $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.config
 	fi
 	touch -c $@
 
-linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
+linux26-menuconfig: host-sed dirs $(LINUX26_DIR)/.patched
 	if [ ! -f $(LINUX26_DIR)/.config ]; then \
 		[ -n "$(LINUX26_KCONFIG)" ] && [ -f $(LINUX26_KCONFIG) ] && \
 			cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config || \
@@ -210,7 +210,7 @@ linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
-linux26-xconfig: $(LINUX26_DIR)/.patched host-sed
+linux26-xconfig: host-sed dirs $(LINUX26_DIR)/.patched
 	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 292f895..74b058d 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -463,7 +463,7 @@ $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_initial) $(LIBFLOAT_TA
 		all
 	touch -c $@
 
-uclibc-menuconfig: host-sed $(UCLIBC_DIR)/.config
+uclibc-menuconfig: host-sed dirs $(UCLIBC_DIR)/.config
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
-- 
1.6.3.3
