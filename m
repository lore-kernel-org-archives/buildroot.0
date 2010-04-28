From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:53 +0200
Subject: [Buildroot] [PATCH 12/19] Get rid of KERNEL_CROSS
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ae090e2cd187d15b779572e0d1d02bf9dc3efb5b.1272490771.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In both internal and external toolchain cases, KERNEL_CROSS was
defined to *exactly* the same value as TARGET_CROSS. It isn't modified
anywhere, and is just used by kernel compilation and pcmcia
compilation.

Therefore, get rid of KERNEL_CROSS and use TARGET_CROSS instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in               |    2 --
 package/pcmcia/pcmcia.mk          |    2 +-
 target/linux/Makefile.in          |    2 +-
 target/linux/Makefile.in.advanced |    2 +-
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 396187d..adc645e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -111,14 +111,12 @@ TARGET_PATH="$(TOOLCHAIN_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR
 GNU_TARGET_NAME=$(ARCH)-linux
 REAL_GNU_TARGET_NAME=$(ARCH)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
-KERNEL_CROSS=$(TARGET_CROSS)
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(TOOLCHAIN_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
-KERNEL_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 endif
 TARGET_AR=$(TARGET_CROSS)ar
diff --git a/package/pcmcia/pcmcia.mk b/package/pcmcia/pcmcia.mk
index 7cea886..00ee358 100644
--- a/package/pcmcia/pcmcia.mk
+++ b/package/pcmcia/pcmcia.mk
@@ -42,7 +42,7 @@ $(PCMCIA_DIR)/.patched: $(PCMCIA_DIR)/.unpacked
 $(PCMCIA_DIR)/.configured: $(PCMCIA_DIR)/.patched
 	( cd $(PCMCIA_DIR); ./Configure --kernel=$(LINUX26_DIR) --noprompt \
 		--rcdir=/etc --arch=$(ARCH) --trust --srctree --nocardbus \
-		--sysv --kcc=$(KERNEL_CROSS)gcc --ucc=$(TARGET_CC) --ld=$(TARGET_CROSS)ld \
+		--sysv --kcc=$(TARGET_CROSS)gcc --ucc=$(TARGET_CC) --ld=$(TARGET_CROSS)ld \
 		--target=$(TARGET_DIR))
 	$(SED) "s/pump/udhcpc/" $(PCMCIA_DIR)/etc/network
 	$(SED) "s/ide_cs/ide-cs/" $(PCMCIA_DIR)/etc/config
diff --git a/target/linux/Makefile.in b/target/linux/Makefile.in
index 41e4821..ea74409 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -85,7 +85,7 @@ endif
 LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
-	CROSS_COMPILE=$(KERNEL_CROSS) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LZMA="$(LZMA)"
 
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 745224d..a95852d 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -179,7 +179,7 @@ LINUX26_BZCAT:=$(BZCAT)
 LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
-	CROSS_COMPILE=$(KERNEL_CROSS) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LZMA="$(LZMA)" \
 	PATH=$(LINUX26_MKIMAGE_DIR):$(PATH)
-- 
1.6.3.3
