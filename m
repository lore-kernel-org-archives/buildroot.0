From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jun 2015 00:20:43 +0200
Subject: [Buildroot] [PATCH 07/11] package/ocf-linux: use kernel-module
	helper
In-Reply-To: <cover.1433628825.git.yann.morin.1998@free.fr>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
Message-ID: <4efd619bc93860107ecf52076857ae06321f0e61.1433628825.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove our patch since it is no longer needed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ocf-linux/0001-modules-cross.patch | 42 ------------------------------
 package/ocf-linux/ocf-linux.mk             | 17 +++++-------
 2 files changed, 7 insertions(+), 52 deletions(-)
 delete mode 100644 package/ocf-linux/0001-modules-cross.patch

diff --git a/package/ocf-linux/0001-modules-cross.patch b/package/ocf-linux/0001-modules-cross.patch
deleted file mode 100644
index f80ef06..0000000
--- a/package/ocf-linux/0001-modules-cross.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Remove the OCF linux kernel extension instead opting to build ocf-linux
-modules out of tree.
-This is easier for users since no kernel config tweaking is required.
-On the downside the OCF drivers can't be used, but then all of the
-kernel crypto drivers are available to users via cryptosoft which is
-preferred.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura ocf-linux-20120127.orig/ocf/Makefile ocf-linux-20120127/ocf/Makefile
---- ocf-linux-20120127.orig/ocf/Makefile	2013-04-27 09:27:04.413911866 -0300
-+++ ocf-linux-20120127/ocf/Makefile	2013-04-27 09:27:31.131775576 -0300
-@@ -2,6 +2,7 @@
- -include $(ROOTDIR)/modules/.config
-
- OCF_OBJS = crypto.o criov.o
-+KDIR ?= /lib/modules/$(shell uname -r)/build
-
- ifdef CONFIG_OCF_RANDOMHARVEST
- 	OCF_OBJS += random.o
-@@ -78,20 +79,13 @@
- #
-
- ocf_make:
--	make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m
--	make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_CRYPTOSOFT=m
--	-make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_BENCH=m
--	-make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_OCFNULL=m
--	-make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_HIFN=m
-+	make -C $(KDIR) M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_CRYPTOSOFT=m CONFIG_OCF_BENCH=m CONFIG_OCF_OCFNULL=m
-
- ocf_modules:
- 	$(MAKE) ocf_make OCF_TARGET=modules
-
- ocf_install:
- 	$(MAKE) ocf_make OCF_TARGET="modules modules_install"
--	depmod
--	mkdir -p /usr/include/crypto
--	cp cryptodev.h /usr/include/crypto/.
-
- #
- # generate full kernel patches for 2.4 and 2.6 kernels to make patching
diff --git a/package/ocf-linux/ocf-linux.mk b/package/ocf-linux/ocf-linux.mk
index 8ca5578..3ebf462 100644
--- a/package/ocf-linux/ocf-linux.mk
+++ b/package/ocf-linux/ocf-linux.mk
@@ -6,22 +6,19 @@
 
 OCF_LINUX_VERSION = 20120127
 OCF_LINUX_SITE = http://downloads.sourceforge.net/project/ocf-linux/ocf-linux/$(OCF_LINUX_VERSION)
-OCF_LINUX_DEPENDENCIES = linux
 OCF_LINUX_INSTALL_STAGING = YES
 
-define OCF_LINUX_BUILD_CMDS
-	$(MAKE) -C $(@D)/ocf $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) \
-		ocf_modules
-endef
-
-define OCF_LINUX_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/ocf $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) \
-		ocf_install
-endef
+OCF_LINUX_MODULE_DIR = ocf
+OCF_LINUX_MODULE_MAKE_OPTS = \
+	CONFIG_OCF_OCF=m \
+	CONFIG_OCF_CRYPTOSOFT=m \
+	CONFIG_OCF_BENCH=m \
+	CONFIG_OCF_OCFNULL=m
 
 define OCF_LINUX_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
 		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
 endef
 
+$(eval $(kernel-module))
 $(eval $(generic-package))
-- 
1.9.1
