From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:34 -0000
Subject: [Buildroot] [git commit branch/next] package/ocf-linux: use
	kernel-module helper
Message-ID: <20150808105628.4F0AB7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54a42de966706b42aa6b9f9cabac64ebb69d17c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We have a patch that makes ocf-linux' Makefile basically only call to
the Linux buildsystem, with commands basically like:
    make -C $(LINUX_DIR) M=$(pwd) modules

which is basically what our new kernel-module infra basically does.

Remove our patch since it is basically no longer needed.

Basically-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ocf-linux/0001-modules-cross.patch |   42 ----------------------------
 package/ocf-linux/ocf-linux.mk             |   17 ++++------
 2 files changed, 7 insertions(+), 52 deletions(-)

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
index 8ca5578..35968d5 100644
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
+OCF_LINUX_MODULE_SUBDIRS = ocf
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
