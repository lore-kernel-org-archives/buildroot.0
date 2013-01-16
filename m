From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jan 2013 00:41:40 +0100
Subject: [Buildroot] [PATCH 6/6] toolchain/uClibc: sprinkle with some calls
	to MESSAGE
In-Reply-To: <cover.1358379198.git.yann.morin.1998@free.fr>
References: <cover.1358379198.git.yann.morin.1998@free.fr>
Message-ID: <48c069d16567a23036274780ce1b5f68f044f550.1358379198.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thus, the failing step can be easily extracted by autobuilders,
to ease with post-mortem analysis.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/uClibc/uclibc.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 055267c..b45e85c 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -66,6 +66,7 @@ $(DL_DIR)/$(UCLIBC_SOURCE):
 
 uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
 $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE)
+	$(Q)$(call MESSAGE,"Extracting uClibc")
 	mkdir -p $(TOOLCHAIN_DIR)
 	rm -rf $(UCLIBC_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
@@ -73,6 +74,7 @@ $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE)
 
 uclibc-patched: $(UCLIBC_DIR)/.patched
 $(UCLIBC_DIR)/.patched: $(UCLIBC_DIR)/.unpacked
+	$(Q)$(call MESSAGE,"Patching uClibc")
 ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 	support/scripts/apply-patches.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
 		uClibc-$(UCLIBC_VERSION)-\*.patch \
@@ -86,6 +88,7 @@ endif
 
 # Some targets may wish to provide their own UCLIBC_CONFIG_FILE...
 $(UCLIBC_DIR)/.oldconfig: $(UCLIBC_DIR)/.patched $(UCLIBC_CONFIG_FILE)
+	$(Q)$(call MESSAGE,"Pre-configuring uClibc")
 	cp -f $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.oldconfig
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
@@ -370,6 +373,7 @@ endif
 endif
 
 $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
+	$(Q)$(call MESSAGE,"Configuring uClibc")
 	cp -f $(UCLIBC_DIR)/.oldconfig $(UCLIBC_DIR)/.config
 	mkdir -p $(TOOLCHAIN_DIR)/uClibc_dev/usr/include
 	mkdir -p $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib
@@ -393,6 +397,7 @@ $(UCLIBC_DIR)/.config: | host-ccache
 endif
 
 $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.config
+	$(Q)$(call MESSAGE,"Installing uClibc headers")
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
@@ -415,6 +420,7 @@ $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.confi
 	touch $@
 
 $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_intermediate) $(LIBFLOAT_TARGET)
+	$(Q)$(call MESSAGE,"Building uClibc")
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX= \
@@ -440,6 +446,7 @@ uclibc-menuconfig: dirs $(UCLIBC_DIR)/.config
 
 
 $(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
+	$(Q)$(call MESSAGE,"Installing uClibc to staging dir")
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(STAGING_DIR) \
@@ -470,6 +477,7 @@ $(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
 
 ifneq ($(TARGET_DIR),)
 $(TARGET_DIR)/lib/libc.so.0: $(STAGING_DIR)/usr/lib/libc.a
+	$(Q)$(call MESSAGE,"Installing uClibc runtime to target dir")
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TARGET_DIR) \
@@ -481,6 +489,7 @@ $(TARGET_DIR)/lib/libc.so.0: $(STAGING_DIR)/usr/lib/libc.a
 	touch -c $@
 
 $(TARGET_DIR)/usr/bin/ldd: $(cross_compiler)
+	$(Q)$(call MESSAGE,"Installing uClibc utils to target dir")
 	$(MAKE1) -C $(UCLIBC_DIR) CC=$(TARGET_CROSS)gcc \
 		CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
@@ -525,11 +534,13 @@ uclibc-target-utils: $(TARGET_DIR)/usr/bin/ldd
 uclibc-target-utils-source: $(DL_DIR)/$(UCLIBC_SOURCE)
 
 $(UCLIBC_DIR)/test/unistd/errno:
+	$(Q)$(call MESSAGE,"Building uClibc test suite")
 	$(MAKE) -C $(UCLIBC_DIR)/test \
 	ARCH_CFLAGS=-I$(STAGING_DIR)/usr/include \
 	UCLIBC_ONLY=1 TEST_INSTALLED_UCLIBC=1 compile
 
 $(TARGET_DIR)/root/uClibc/test/unistd/errno: $(UCLIBC_DIR)/test/unistd/errno
+	$(Q)$(call MESSAGE,"Installing uClibc test suite to target dir")
 	mkdir -p $(TARGET_DIR)/root/uClibc
 	cp -rdpf $(UCLIBC_DIR)/test $(TARGET_DIR)/root/uClibc
 	$(INSTALL) $(UCLIBC_DIR)/Rules.mak $(TARGET_DIR)/root/uClibc
@@ -554,6 +565,7 @@ uclibc-test-dirclean:
 #############################################################
 
 $(TARGET_DIR)/usr/lib/libc.a: $(STAGING_DIR)/usr/lib/libc.a
+	$(Q)$(call MESSAGE,"Installing uClibc development files to target dir")
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TARGET_DIR) \
-- 
1.7.2.5
