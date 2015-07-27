From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 27 Jul 2015 12:06:20 +0200
Subject: [Buildroot] [PATCH v3] rtl8188eu: new package
Message-ID: <1437991580-31649-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---

This standalone driver needs a few small patches to properly build and install
within Buildroot.
Pathces sent upstream: https://github.com/lwfinger/rtl8188eu/pull/128

Changes v2 -> v3:
 - remove patches 4 and 5, useless in the Buildroot context (Yann);
 - add Yann's Reviewed-by tag;
 - rebase on current master.

Changes v1 -> v2:
 - use the kernel-module infra;
 - mention binary blob in _LICENSE;
 - remove inappropriate BR2_ROOTFS_DEVICE_CREATION_ stuff;
 - mention the need to enable CONFIG_WIRELESS_EXT in the kernel.
---
 package/Config.in                                  |  1 +
 .../0001-Makefile-quote-CROSS_COMPILE.patch        | 33 +++++++++++++++++++++
 ...002-Makefile-add-a-modules_install-target.patch | 34 ++++++++++++++++++++++
 ...03-Makefile-add-a-firmware_install-target.patch | 32 ++++++++++++++++++++
 package/rtl8188eu/Config.in                        | 19 ++++++++++++
 package/rtl8188eu/rtl8188eu.mk                     | 21 +++++++++++++
 6 files changed, 140 insertions(+)
 create mode 100644 package/rtl8188eu/0001-Makefile-quote-CROSS_COMPILE.patch
 create mode 100644 package/rtl8188eu/0002-Makefile-add-a-modules_install-target.patch
 create mode 100644 package/rtl8188eu/0003-Makefile-add-a-firmware_install-target.patch
 create mode 100644 package/rtl8188eu/Config.in
 create mode 100644 package/rtl8188eu/rtl8188eu.mk

diff --git a/package/Config.in b/package/Config.in
index f029e1d..493851a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -405,6 +405,7 @@ endif
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
+	source "package/rtl8188eu/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
diff --git a/package/rtl8188eu/0001-Makefile-quote-CROSS_COMPILE.patch b/package/rtl8188eu/0001-Makefile-quote-CROSS_COMPILE.patch
new file mode 100644
index 0000000..9b375fe
--- /dev/null
+++ b/package/rtl8188eu/0001-Makefile-quote-CROSS_COMPILE.patch
@@ -0,0 +1,33 @@
+From 7b7d6b392a963b462c0240296daa38d6413f6246 Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca@lucaceresoli.net>
+Date: Fri, 3 Jul 2015 14:45:03 +0200
+Subject: [PATCH 1/5] Makefile: quote CROSS_COMPILE
+
+When using a CROSS_COMPILE value that contains a whitespace, such as
+"ccache arm-linux-", building fails because only the first word is passed down
+to the kernel Makefile as CROSS_COMPILE. Successive words are interpreted as
+targets.
+
+Fix by quoting CROSS_COMPILE.
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index ea1b316..76db121 100644
+--- a/Makefile
++++ b/Makefile
+@@ -144,7 +144,7 @@ export CONFIG_RTL8188EU = m
+ all: modules
+ 
+ modules:
+-	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSRC) M=$(shell pwd)  modules
++	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE="$(CROSS_COMPILE)" -C $(KSRC) M=$(shell pwd)  modules
+ 
+ strip:
+ 	$(CROSS_COMPILE)strip 8188eu.ko --strip-unneeded
+-- 
+1.9.1
+
diff --git a/package/rtl8188eu/0002-Makefile-add-a-modules_install-target.patch b/package/rtl8188eu/0002-Makefile-add-a-modules_install-target.patch
new file mode 100644
index 0000000..fe0aa94
--- /dev/null
+++ b/package/rtl8188eu/0002-Makefile-add-a-modules_install-target.patch
@@ -0,0 +1,34 @@
+From f7e5725ea2e848546830ac2da117d808b4c19d08 Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca@lucaceresoli.net>
+Date: Fri, 3 Jul 2015 15:51:38 +0200
+Subject: [PATCH 2/5] Makefile: add a modules_install target
+
+Allows to cleanly install the module in the standard way, as suggested by
+Documentation/kbuild/modules.txt in the kernel sources.
+
+This is needed when installing from within a build system (such as Buildroot)
+that implement depmod on its own, and does not need the blacklist and other
+fixups that are implemented by the 'install' target.
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+---
+ Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 76db121..63e0103 100644
+--- a/Makefile
++++ b/Makefile
+@@ -149,6 +149,9 @@ modules:
+ strip:
+ 	$(CROSS_COMPILE)strip 8188eu.ko --strip-unneeded
+ 
++modules_install:
++	$(MAKE) -C $(KSRC) M=`pwd` modules_install
++
+ install:
+ 	install -p -m 644 8188eu.ko  $(MODDESTDIR)
+ 	@if [ -a /lib/modules/$(KVER)/kernel/drivers/staging/rtl8188eu/r8188eu.ko ] ; then modprobe -r r8188eu; fi;
+-- 
+1.9.1
+
diff --git a/package/rtl8188eu/0003-Makefile-add-a-firmware_install-target.patch b/package/rtl8188eu/0003-Makefile-add-a-firmware_install-target.patch
new file mode 100644
index 0000000..eebef3a
--- /dev/null
+++ b/package/rtl8188eu/0003-Makefile-add-a-firmware_install-target.patch
@@ -0,0 +1,32 @@
+From d8063ef657fd44e29ef2fffba07f0632d1e60a92 Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca@lucaceresoli.net>
+Date: Mon, 6 Jul 2015 09:59:46 +0200
+Subject: [PATCH 3/5] Makefile: add a firmware_install target
+
+When installing using the modules_install target, the firmware is not
+installed. Add an ad-hoc target that just installs the firmware into
+$(INSTALL_MOD_PATH)/lib/firmware/rtlwifi/.
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+---
+ Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 63e0103..4012f9a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -152,6 +152,10 @@ strip:
+ modules_install:
+ 	$(MAKE) -C $(KSRC) M=`pwd` modules_install
+ 
++firmware_install:
++	install -D -m 644 rtl8188eufw.bin \
++		$(INSTALL_MOD_PATH)/lib/firmware/rtlwifi/rtl8188eufw.bin
++
+ install:
+ 	install -p -m 644 8188eu.ko  $(MODDESTDIR)
+ 	@if [ -a /lib/modules/$(KVER)/kernel/drivers/staging/rtl8188eu/r8188eu.ko ] ; then modprobe -r r8188eu; fi;
+-- 
+1.9.1
+
diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
new file mode 100644
index 0000000..09cde24
--- /dev/null
+++ b/package/rtl8188eu/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_RTL8188EU
+	bool "rtl8188eu"
+	depends on BR2_LINUX_KERNEL
+	help
+	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
+	  This is needed only for Linux kernels before 3.12.
+	  Since 3.12, there is a (staging) driver in mainline, with a similar
+	  codebase.
+
+	  Make sure your target kernel has the CONFIG_WIRELESS_EXT config
+	  option enabled.
+
+	  Note: this package needs a firmware loading mechanism to load the
+	  binary blob for the chip to work.
+
+	  https://github.com/lwfinger/rtl8188eu
+
+comment "rtl8188eu needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
new file mode 100644
index 0000000..dec0900
--- /dev/null
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# rtl8188eu
+#
+################################################################################
+
+RTL8188EU_VERSION = 3091828c8f4b4a01cbec6025128bf77e6e7b9f97
+RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
+RTL8188EU_DEPENDENCIES = linux
+RTL8188EU_LICENSE = GPLv2, proprietary (rtl8188eufw.bin firmware blob)
+RTL8188EU_LICENSE_FILES = COPYING
+RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
+
+$(eval $(kernel-module))
+
+define RTL8188EU_INSTALL_FIRMWARE
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) firmware_install
+endef
+RTL8188EU_POST_INSTALL_TARGET_HOOKS += RTL8188EU_INSTALL_FIRMWARE
+
+$(eval $(generic-package))
-- 
1.9.1
