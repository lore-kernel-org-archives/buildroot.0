From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Apr 2013 17:09:44 -0300
Subject: [Buildroot] [PATCH 1/6] ocf-linux: remove extension and build out
	of tree
Message-ID: <1367093389-23877-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the OCF linux kernel extension instead opting to build ocf-linux
modules out of tree.
This is easier for users since no kernel config tweaking is required.
On the downside the OCF drivers can't be used, but then all of the
kernel crypto drivers are available to users via cryptosoft which is
preferred.
Also remove it from the menu to utilize a virtual.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.ext.in                                | 12 -------
 linux/linux-ext-ocf-linux.mk                       | 25 -------------
 package/Config.in                                  |  1 -
 package/ocf-linux/Config.in                        | 12 -------
 package/ocf-linux/ocf-linux-01-modules-cross.patch | 42 ++++++++++++++++++++++
 package/ocf-linux/ocf-linux.mk                     | 14 +++++---
 6 files changed, 52 insertions(+), 54 deletions(-)
 delete mode 100644 linux/linux-ext-ocf-linux.mk
 delete mode 100644 package/ocf-linux/Config.in
 create mode 100644 package/ocf-linux/ocf-linux-01-modules-cross.patch

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index a68cbe9..172fa76 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -23,18 +23,6 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
 	  Download it at http://download.gna.org/adeos/patches/v2.6/$(ARCH)/
 	  and verify that your kernel version in buildroot matches.
 
-# ocf-linux
-config BR2_LINUX_KERNEL_EXT_OCF_LINUX
-	bool "Open Cryptographic Framework (OCF)"
-	select BR2_PACKAGE_OCF_LINUX
-	help
-	  OCF-Linux Kernel part.
-
-	  Select this option to patch your kernel with OCF for
-	  hardware-accelerated crypto support for available drivers.
-	  Some libraries need to also have OCF enabled for them,
-	  for example OpenSSL.
-
 # RTAI
 config BR2_LINUX_KERNEL_EXT_RTAI
        bool "RTAI Real-time patch"
diff --git a/linux/linux-ext-ocf-linux.mk b/linux/linux-ext-ocf-linux.mk
deleted file mode 100644
index 1a601d5..0000000
--- a/linux/linux-ext-ocf-linux.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-##################################################
-# Linux OCF extension
-#
-# Patch the linux kernel with OCF
-##################################################
-
-ifeq ($(BR2_LINUX_KERNEL_EXT_OCF_LINUX),y)
-LINUX_DEPENDENCIES += ocf-linux
-
-# Prepare kernel patch
-# The linux-3.2.1.patch is just the main inclusion, most of the code
-# resides in the ocf/ subdir.
-# It works for older kernel versions.
-# Run tested from 2.6.38+ and build tested from 2.6.35+
-define OCF_LINUX_PREPARE_KERNEL
-	support/scripts/apply-patches.sh $(LINUX_DIR) \
-		$(OCF_LINUX_DIR)/patches/ linux-3.2.1-ocf.patch ; \
-	grep -q __mix_pool_bytes $(LINUX_DIR)/drivers/char/random.c && \
-	$(SED) 's:wordcount\*4:&, NULL:' $(LINUX_DIR)/drivers/char/random.c ; \
-	cp -rf $(OCF_LINUX_DIR)/ocf $(LINUX_DIR)/crypto/ocf ;
-endef
-
-LINUX_PRE_PATCH_HOOKS += OCF_LINUX_PREPARE_KERNEL
-
-endif #BR2_LINUX_EXT_OCF_LINUX
diff --git a/package/Config.in b/package/Config.in
index a2ccae7..c8badad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -392,7 +392,6 @@ source "package/libmhash/Config.in"
 source "package/libnss/Config.in"
 source "package/libsha1/Config.in"
 source "package/nettle/Config.in"
-source "package/ocf-linux/Config.in"
 source "package/openssl/Config.in"
 source "package/polarssl/Config.in"
 endmenu
diff --git a/package/ocf-linux/Config.in b/package/ocf-linux/Config.in
deleted file mode 100644
index 9dc5766..0000000
--- a/package/ocf-linux/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_OCF_LINUX
-	bool "ocf-linux"
-	help
-	  OCF-Linux is a Linux port of the OpenBSD/FreeBSD Cryptographic
-	  Framework (OCF). This port aims to bring full asynchronous HW/SW
-	  crypto acceleration to the Linux kernel and applications
-	  running under Linux.
-
-	  You need to enable the OCF linux kernel extension or provide
-	  a prepatched kernel to make this option useful.
-
-	  http://ocf-linux.sourceforge.net/
diff --git a/package/ocf-linux/ocf-linux-01-modules-cross.patch b/package/ocf-linux/ocf-linux-01-modules-cross.patch
new file mode 100644
index 0000000..f80ef06
--- /dev/null
+++ b/package/ocf-linux/ocf-linux-01-modules-cross.patch
@@ -0,0 +1,42 @@
+Remove the OCF linux kernel extension instead opting to build ocf-linux
+modules out of tree.
+This is easier for users since no kernel config tweaking is required.
+On the downside the OCF drivers can't be used, but then all of the
+kernel crypto drivers are available to users via cryptosoft which is
+preferred.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura ocf-linux-20120127.orig/ocf/Makefile ocf-linux-20120127/ocf/Makefile
+--- ocf-linux-20120127.orig/ocf/Makefile	2013-04-27 09:27:04.413911866 -0300
++++ ocf-linux-20120127/ocf/Makefile	2013-04-27 09:27:31.131775576 -0300
+@@ -2,6 +2,7 @@
+ -include $(ROOTDIR)/modules/.config
+
+ OCF_OBJS = crypto.o criov.o
++KDIR ?= /lib/modules/$(shell uname -r)/build
+
+ ifdef CONFIG_OCF_RANDOMHARVEST
+ 	OCF_OBJS += random.o
+@@ -78,20 +79,13 @@
+ #
+
+ ocf_make:
+-	make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m
+-	make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_CRYPTOSOFT=m
+-	-make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_BENCH=m
+-	-make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_OCFNULL=m
+-	-make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_HIFN=m
++	make -C $(KDIR) M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_CRYPTOSOFT=m CONFIG_OCF_BENCH=m CONFIG_OCF_OCFNULL=m
+
+ ocf_modules:
+ 	$(MAKE) ocf_make OCF_TARGET=modules
+
+ ocf_install:
+ 	$(MAKE) ocf_make OCF_TARGET="modules modules_install"
+-	depmod
+-	mkdir -p /usr/include/crypto
+-	cp cryptodev.h /usr/include/crypto/.
+
+ #
+ # generate full kernel patches for 2.4 and 2.6 kernels to make patching
diff --git a/package/ocf-linux/ocf-linux.mk b/package/ocf-linux/ocf-linux.mk
index fb5f7e8..1be3a3f 100644
--- a/package/ocf-linux/ocf-linux.mk
+++ b/package/ocf-linux/ocf-linux.mk
@@ -6,16 +6,22 @@
 
 OCF_LINUX_VERSION = 20120127
 OCF_LINUX_SITE = http://downloads.sourceforge.net/project/ocf-linux/ocf-linux/$(OCF_LINUX_VERSION)
+OCF_LINUX_DEPENDENCIES = linux
 OCF_LINUX_INSTALL_STAGING = YES
 
-define OCF_LINUX_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
-		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
+define OCF_LINUX_BUILD_CMDS
+	$(MAKE) -C $(@D)/ocf $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) \
+		ocf_modules
 endef
 
 define OCF_LINUX_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/ocf $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) \
+		ocf_install
+endef
+
+define OCF_LINUX_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
-		$(TARGET_DIR)/usr/include/crypto/cryptodev.h
+		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
 endef
 
 $(eval $(generic-package))
-- 
1.8.1.5
