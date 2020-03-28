From: sunil at amarulasolutions.com <sunil@amarulasolutions.com>
Date: Sat, 28 Mar 2020 10:34:29 +0530
Subject: [Buildroot] [PATCH v5 1/3] package/arm-gnu-a-toolchain: new package
In-Reply-To: <1585371871-29406-1-git-send-email-sunil@amarulasolutions.com>
References: <1585371871-29406-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <1585371871-29406-2-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Suniel Mahesh <sunil@amarulasolutions.com>

arm trusted firmware requires a bare metal toolchain to build platforms which
host cortex-m series core, like Rockchip rk3399 which has a cortex-m0 core.
Add pre-built cross-compilation ARM-A bare metal toolchain to avoid the following
build error.

make[3]: arm-none-eabi-gcc: Command not found

pre-built bate metal ARM GNU-A toolchain installs into the host file system folder
/opt/gcc-arm-none-eabi.

https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
---
Changes for v5:
- Introduced a BR2_PACKAGE_HOST_ARM_GNU_A_TOOLCHAIN config option
  based on discussions from Thomas Pettazzoni
- Added to package/Config.in.host

Changes for v4:
- Upated DEVELOPERS file as suggested by Heiko Thiery and Thomas Pettazoni

Changes for v3:
- no change

Changes for v2:
- Added lines in description regarding why bare metal toolchain is required,
  as suggested by Jagan and pointed out by Sergey
---
 DEVELOPERS                                         |  3 +++
 package/Config.in.host                             |  1 +
 package/arm-gnu-a-toolchain/Config.in.host         |  9 ++++++++
 .../arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash   |  2 ++
 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk | 27 ++++++++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 package/arm-gnu-a-toolchain/Config.in.host
 create mode 100644 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
 create mode 100644 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1fb4e65..ce1a761 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2389,6 +2389,9 @@ N:	Steven Noonan <steven@uplinklabs.net>
 F:	package/hwloc/
 F:	package/powertop/
 
+N:	Suniel Mahesh <sunil@amarulasolutions.com>
+F:	package/arm-gnu-a-toolchain
+
 N:	Sven Haardiek <sven.haardiek@iotec-gmbh.de>
 F:	package/lcdproc/
 F:	package/python-influxdb/
diff --git a/package/Config.in.host b/package/Config.in.host
index eb8f63f..19dcab6 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/arm-gnu-a-toolchain/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
 	source "package/cargo/Config.in.host"
 	source "package/cbootimage/Config.in.host"
diff --git a/package/arm-gnu-a-toolchain/Config.in.host b/package/arm-gnu-a-toolchain/Config.in.host
new file mode 100644
index 0000000..07b73a7
--- /dev/null
+++ b/package/arm-gnu-a-toolchain/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_ARM_GNU_A_TOOLCHAIN
+	bool "host arm-gnu-a-toolchain"
+	help
+	  arm trusted firmware requires a bare metal toolchain to build some platforms
+	  which host cortex-m series core, for instance rockchip rk3399 has a cortex-m0 core. 
+	  This package installs a pre-built cross-compilation ARM-A bare metal toolchain for
+	  the host machine.
+
+	  https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz
diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
new file mode 100644
index 0000000..b18e56c
--- /dev/null
+++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ac952d89ae0fc3543e81099e7d34917efc621f5def112eee843fd1ce755eca8c  gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz
diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
new file mode 100644
index 0000000..cbe8aba
--- /dev/null
+++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# arm-gnu-a-toolchain
+#
+################################################################################
+
+ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel
+ARM_GNU_A_TOOLCHAIN_VERSION = 9.2-2019.12
+ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
+ARM_GNU_A_TOOLCHAIN_LICENSE = GPL-3.0+
+ARM_GNU_A_TOOLCHAIN_LICENSE_FILES =
+
+HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
+
+define HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_CMDS
+	rm -rf $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
+	mkdir -p $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
+	cp -rf $(@D)/* $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
+
+	cd $(HOST_DIR)/bin && \
+	for i in $(HOST_DIR)/opt/gcc-arm-none-eabi/bin/*; do \
+		ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
+	done
+
+endef
+
+$(eval $(host-generic-package))
-- 
2.7.4
