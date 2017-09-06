From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Wed,  6 Sep 2017 21:30:06 +0100
Subject: [Buildroot] [PATCH 1/1] wireguard: add new package
In-Reply-To: <20170906203006.27294-1-aurelien@chabot.fr>
References: <20170906203006.27294-1-aurelien@chabot.fr>
Message-ID: <20170906203006.27294-2-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
 package/Config.in                                  |  1 +
 .../0001-build-Add-a-tools-install-target.patch    | 34 +++++++++++++++
 ...-build-Allow-to-configure-the-used-depmod.patch | 39 +++++++++++++++++
 package/wireguard/Config.in                        | 28 +++++++++++++
 package/wireguard/wireguard.hash                   |  2 +
 package/wireguard/wireguard.mk                     | 49 ++++++++++++++++++++++
 6 files changed, 153 insertions(+)
 create mode 100644 package/wireguard/0001-build-Add-a-tools-install-target.patch
 create mode 100644 package/wireguard/0002-build-Allow-to-configure-the-used-depmod.patch
 create mode 100644 package/wireguard/Config.in
 create mode 100644 package/wireguard/wireguard.hash
 create mode 100644 package/wireguard/wireguard.mk

diff --git a/package/Config.in b/package/Config.in
index 66ce30701..767f105a3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1777,6 +1777,7 @@ endif
 	source "package/wavemon/Config.in"
 	source "package/wget/Config.in"
 	source "package/whois/Config.in"
+	source "package/wireguard/Config.in"
 	source "package/wireless-regdb/Config.in"
 	source "package/wireless_tools/Config.in"
 	source "package/wireshark/Config.in"
diff --git a/package/wireguard/0001-build-Add-a-tools-install-target.patch b/package/wireguard/0001-build-Add-a-tools-install-target.patch
new file mode 100644
index 000000000..b265322bc
--- /dev/null
+++ b/package/wireguard/0001-build-Add-a-tools-install-target.patch
@@ -0,0 +1,34 @@
+From 5b940d6c65b0c1f58b4637f5b2300b65f46bbca3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
+Date: Fri, 1 Sep 2017 11:46:51 +0100
+Subject: [PATCH 1/2] build: Add a tools-install target
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
+---
+ src/Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 960bbb4..007f4e3 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -38,11 +38,11 @@ module-install:
+	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
+	depmod -a
+
+-install:
+-	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
+-	depmod -a
++tools-install:
+	$(MAKE) -C tools install
+
++install: module-install tools-install
++
+ DKMS_TOP_LEVEL := Makefile Kbuild Kconfig $(filter-out wireguard.mod.c, $(wildcard *.c)) $(filter-out version.h, $(wildcard *.h)) version.h dkms.conf
+ DKMS_SELFTEST_LEVEL := $(wildcard selftest/*.c) $(wildcard selftest/*.h)
+ DKMS_CRYPTO_LEVEL := $(wildcard crypto/*.c) $(wildcard crypto/*.h) $(wildcard crypto/*.S)
+--
+2.14.1
diff --git a/package/wireguard/0002-build-Allow-to-configure-the-used-depmod.patch b/package/wireguard/0002-build-Allow-to-configure-the-used-depmod.patch
new file mode 100644
index 000000000..36764c590
--- /dev/null
+++ b/package/wireguard/0002-build-Allow-to-configure-the-used-depmod.patch
@@ -0,0 +1,39 @@
+From ceb789b729d62433a8ab6e07dbfabc1eebeaf430 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
+Date: Thu, 31 Aug 2017 22:26:37 +0100
+Subject: [PATCH 2/2] build: Allow to configure the used depmod
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
+---
+ src/Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 007f4e3..9a223c9 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -1,8 +1,10 @@
+ KERNELDIR ?= /lib/modules/$(shell uname -r)/build
++KERNELVERSION ?=
+ PREFIX ?= /usr
+ DESTDIR ?=
+ SRCDIR ?= $(PREFIX)/src
+ DKMSDIR ?= $(SRCDIR)/wireguard
++DEPMOD ?= depmod
+
+ PWD := $(shell pwd)
+
+@@ -36,7 +38,7 @@ clean:
+
+ module-install:
+	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
+-	depmod -a
++	$(DEPMOD) -a --basedir $(DESTDIR) $(KERNELVERSION)
+
+ tools-install:
+	$(MAKE) -C tools install
+--
+2.14.1
diff --git a/package/wireguard/Config.in b/package/wireguard/Config.in
new file mode 100644
index 000000000..5dcedd6b3
--- /dev/null
+++ b/package/wireguard/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_WIREGUARD
+    bool "wireguard"
+    help
+      WireGuard is an extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography. It aims to be faster, simpler, leaner, and more useful than IPSec, while avoiding the massive headache. It intends to be considerably more performant than OpenVPN. WireGuard is designed as a general purpose VPN for running on embedded interfaces and super computers alike, fit for many different circumstances. Initially released for the Linux kernel, it plans to be cross-platform and widely deployable. It is currently under heavy development, but already it might be regarded as the most secure, easiest to use, and simplest VPN solution in the industry.
+
+      https://www.wireguard.com
+
+if BR2_PACKAGE_WIREGUARD
+
+config BR2_PACKAGE_WIREGUARD_MODULE
+    bool "Kernel Module"
+    default y
+    depends on BR2_LINUX_KERNEL
+    help
+      Wireguard kernel module
+
+comment "wireguard module needs a Linux kernel to be built"
+    depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_WIREGUARD_TOOLS
+    bool "User Tools"
+    default y
+    select BR2_PACKAGE_LIBMNL
+    help
+      Command-line tools to interact with the WireGuard kernel module. Currently, it provides only a single tool:
+        wg: set and retrieve configuration of WireGuard interfaces
+
+endif
diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
new file mode 100644
index 000000000..5bd1163d3
--- /dev/null
+++ b/package/wireguard/wireguard.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ab96230390625aad6f4816fa23aef6e9f7fee130f083d838919129ff12089bf7 WireGuard-0.0.20170810.tar.xz
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
new file mode 100644
index 000000000..bbabd4143
--- /dev/null
+++ b/package/wireguard/wireguard.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+## wireguard
+#
+#################################################################################
+
+WIREGUARD_VERSION = 0.0.20170810
+WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
+WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
+WIREGUARD_DEPENDENCIES =
+WIREGUARD_LICENSE = GPL-2.0
+WIREGUARD_LICENSE_FILES = COPYING
+WIREGUARD_MAKE_OPTS = \
+    $(LINUX_MAKE_FLAGS) \
+    KERNELDIR=$(LINUX_DIR) \
+    KERNELVERSION=$(LINUX_VERSION) \
+    DESTDIR=$(TARGET_DIR) \
+    WITH_WGQUICK=yes
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+    WIREGUARD_MAKE_OPTS += WITH_SYSTEMDUNITS=yes
+else
+    WIREGUARD_MAKE_OPTS += WITH_SYSTEMDUNITS=no
+endif
+
+WIREGUARD_TARGET_BUILD=
+WIREGUARD_TARGET_INSTALL=
+
+ifeq ($(BR2_PACKAGE_WIREGUARD_MODULE),y)
+    TARGET_BUILD += module
+    TARGET_INSTALL += module-install
+    WIREGUARD_DEPENDENCIES += linux
+endif
+
+ifeq ($(BR2_PACKAGE_WIREGUARD_TOOLS),y)
+    TARGET_BUILD += tools
+    TARGET_INSTALL += tools-install
+    WIREGUARD_DEPENDENCIES += libmnl
+endif
+
+define WIREGUARD_BUILD_CMDS
+    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(WIREGUARD_MAKE_OPTS) $(MAKE) -C $(@D)/src $(TARGET_BUILD)
+endef
+
+define WIREGUARD_INSTALL_TARGET_CMDS
+    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(WIREGUARD_MAKE_OPTS) $(MAKE) -C $(@D)/src $(TARGET_INSTALL)
+endef
+
+$(eval $(generic-package))
-- 
2.14.1
