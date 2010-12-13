From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 22:26:52 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: simplify
Message-ID: <20101213214843.5BB5B8E2C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=742f393ffb0d13c33d4f1184fbaf906ae2310470
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Old-style kernel headers got removed almost 2 years ago, so get rid of
the seperate kernel-headers-new.makefile file and move the content
to the main kernel-headers.mk.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../kernel-headers/kernel-headers-new.makefile     |   57 --------------------
 toolchain/kernel-headers/kernel-headers.mk         |   51 +++++++++++++++++-
 2 files changed, 50 insertions(+), 58 deletions(-)
 delete mode 100644 toolchain/kernel-headers/kernel-headers-new.makefile

diff --git a/toolchain/kernel-headers/kernel-headers-new.makefile b/toolchain/kernel-headers/kernel-headers-new.makefile
deleted file mode 100644
index 5682869..0000000
--- a/toolchain/kernel-headers/kernel-headers-new.makefile
+++ /dev/null
@@ -1,57 +0,0 @@
-#############################################################
-#
-# full kernel tarballs >= 2.6.19.1
-#
-#############################################################
-
-# parse linux version string
-LNXVER:=$(subst ., , $(strip $(DEFAULT_KERNEL_HEADERS)))
-VERSION:=$(word 1, $(LNXVER))
-PATCHLEVEL:=$(word 2, $(LNXVER))
-SUBLEVEL:=$(word 3, $(LNXVER))
-EXTRAVERSION:=$(word 4, $(LNXVER))
-LOCALVERSION:=
-
-# should contain prepended dot
-SUBLEVEL:=$(if $(SUBLEVEL),.$(SUBLEVEL),)
-EXTRAVERSION:=$(if $(EXTRAVERSION),.$(EXTRAVERSION),)
-
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL)$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
-LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-$(LINUX_HEADERS_VERSION)
-LINUX_HEADERS_DIR:=$(TOOLCHAIN_DIR)/linux
-
-LINUX_HEADERS_DEPENDS:=
-
-$(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
-	@echo "*** Using kernel-headers generated from kernel source"
-	rm -rf $(LINUX_HEADERS_DIR)
-	$(INSTALL) -d $(@D)
-	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | \
-	tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
-	touch $@
-
-$(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked $(LINUX_HEADERS_DEPENDS)
-	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers \
-		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
-ifneq ($(KERNEL_HEADERS_PATCH_DIR),)
-	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
-		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
-endif
-	touch $@
-
-$(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
-	(cd $(LINUX_HEADERS_UNPACK_DIR); \
-	 $(MAKE) ARCH=$(KERNEL_ARCH) \
-		HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
-		HOSTCXX="$(HOSTCXX)" \
-		INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install; \
-	)
-ifeq ($(BR2_ARCH),"cris")
-	ln -s $(LINUX_HEADERS_DIR)/include/arch-v10/arch $(LINUX_HEADERS_DIR)/include/arch
-	cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/linux/user.h $(LINUX_HEADERS_DIR)/include/linux
-	$(SED) "/^#include <asm\/page\.h>/d" $(LINUX_HEADERS_DIR)/include/asm/user.h
-endif
-	touch $@
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index bb7ee3c..34a75e7 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -13,7 +13,56 @@ LINUX_HEADERS_SITE:=127.0.0.1
 LINUX_HEADERS_SOURCE:=unspecified-kernel-headers
 LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-libc-headers-null
 
-include toolchain/kernel-headers/kernel-headers-new.makefile
+# parse linux version string
+LNXVER:=$(subst ., , $(strip $(DEFAULT_KERNEL_HEADERS)))
+VERSION:=$(word 1, $(LNXVER))
+PATCHLEVEL:=$(word 2, $(LNXVER))
+SUBLEVEL:=$(word 3, $(LNXVER))
+EXTRAVERSION:=$(word 4, $(LNXVER))
+LOCALVERSION:=
+
+# should contain prepended dot
+SUBLEVEL:=$(if $(SUBLEVEL),.$(SUBLEVEL),)
+EXTRAVERSION:=$(if $(EXTRAVERSION),.$(EXTRAVERSION),)
+
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL)$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_DIR:=$(TOOLCHAIN_DIR)/linux
+
+LINUX_HEADERS_DEPENDS:=
+
+$(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
+	rm -rf $(LINUX_HEADERS_DIR)
+	$(INSTALL) -d $(@D)
+	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | \
+	tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
+
+$(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked $(LINUX_HEADERS_DEPENDS)
+	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers \
+		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
+ifneq ($(KERNEL_HEADERS_PATCH_DIR),)
+	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
+		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
+endif
+	touch $@
+
+$(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
+	(cd $(LINUX_HEADERS_UNPACK_DIR); \
+	 $(MAKE) ARCH=$(KERNEL_ARCH) \
+		HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
+		HOSTCXX="$(HOSTCXX)" \
+		INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install; \
+	)
+ifeq ($(BR2_ARCH),"cris")
+	ln -s $(LINUX_HEADERS_DIR)/include/arch-v10/arch $(LINUX_HEADERS_DIR)/include/arch
+	cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/linux/user.h $(LINUX_HEADERS_DIR)/include/linux
+	$(SED) "/^#include <asm\/page\.h>/d" $(LINUX_HEADERS_DIR)/include/asm/user.h
+endif
+	touch $@
 
 $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
 ifeq ($(BR2_KERNEL_HEADERS_SNAP),y)
-- 
1.7.2.2
