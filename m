From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 Sep 2009 21:20:18 +0200
Subject: [Buildroot] [git commit master] uClibc as of 20090825 requires the
	ARCH to be specified when we call it's make
Message-ID: <20090903192047.5989F77513@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4d0c00588f80c0424b2819ce2f3fb8fc7046ff53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Austin Foxley <austinf@cetoncorp.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uclibc.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index de8e1d5..764b503 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -420,6 +420,7 @@ $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/lib
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/lib
 	$(MAKE1) -C $(UCLIBC_DIR) \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
@@ -429,6 +430,7 @@ $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
 
 $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.config
 	set -x && $(MAKE1) -C $(UCLIBC_DIR) \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
@@ -457,6 +459,7 @@ endif
 
 $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_initial) $(LIBFLOAT_TARGET)
 	$(MAKE1) -C $(UCLIBC_DIR) \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX= \
 		DEVEL_PREFIX=/ \
 		RUNTIME_PREFIX=/ \
@@ -466,6 +469,7 @@ $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_initial) $(LIBFLOAT_TA
 
 uclibc-menuconfig: host-sed $(UCLIBC_DIR)/.config
 	$(MAKE1) -C $(UCLIBC_DIR) \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
@@ -477,12 +481,14 @@ uclibc-menuconfig: host-sed $(UCLIBC_DIR)/.config
 $(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
 ifneq ($(BR2_TOOLCHAIN_SYSROOT),y)
 	$(MAKE1) -C $(UCLIBC_DIR) \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX= \
 		DEVEL_PREFIX=$(STAGING_DIR)/ \
 		RUNTIME_PREFIX=$(STAGING_DIR)/ \
 		install_runtime install_dev
 else
 	$(MAKE1) -C $(UCLIBC_DIR) \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(STAGING_DIR) \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
@@ -525,6 +531,7 @@ endif
 ifneq ($(TARGET_DIR),)
 $(TARGET_DIR)/lib/libc.so.0: $(STAGING_DIR)/usr/lib/libc.a
 	$(MAKE1) -C $(UCLIBC_DIR) \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TARGET_DIR) \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
@@ -539,6 +546,7 @@ endif
 $(TARGET_DIR)/usr/bin/ldd: $(cross_compiler)
 	$(MAKE1) -C $(UCLIBC_DIR) CC=$(TARGET_CROSS)gcc \
 		CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TARGET_DIR) utils install_utils
 ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
 	mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils
@@ -571,7 +579,7 @@ uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
 uclibc-configured-source: uclibc-source
 
 uclibc-clean: uclibc-test-clean
-	-$(MAKE1) -C $(UCLIBC_DIR) clean
+	-$(MAKE1) -C $(UCLIBC_DIR) ARCH="$(UCLIBC_TARGET_ARCH)" clean
 	rm -f $(UCLIBC_DIR)/.config
 
 uclibc-dirclean: uclibc-test-dirclean
@@ -613,6 +621,7 @@ uclibc-test-dirclean:
 
 $(TARGET_DIR)/usr/lib/libc.a: $(STAGING_DIR)/usr/lib/libc.a
 	$(MAKE1) -C $(UCLIBC_DIR) \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TARGET_DIR) \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
-- 
1.6.3.3
