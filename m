From: sunil at amarulasolutions.com <sunil@amarulasolutions.com>
Date: Thu, 13 Feb 2020 11:22:29 +0530
Subject: [Buildroot] [PATCH 2/4] package/arm-gnu-a-toolchain: new package
In-Reply-To: <1581573151-18943-1-git-send-email-sunil@amarulasolutions.com>
References: <1581573151-18943-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <1581573151-18943-3-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Suniel Mahesh <sunil@amarulasolutions.com>

arm trusted firmware requires a bare metal toolchain for its build.
Add pre-built cross-compilation ARM-A bare metal toolchain for Arm Cortex-A
family processors to avoid the following build error.

make[3]: arm-none-eabi-gcc: Command not found

pre-built bate metal ARM GNU-A toolchain installs into the host file system folder
/opt/gcc-arm-none-eabi.

https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
---
 .../arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash   |  3 +++
 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk | 27 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
 create mode 100644 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk

diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
new file mode 100644
index 0000000..aa0a23a
--- /dev/null
+++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+#sha256 bb17109f0ee697254a5d4ae6e5e01440e3ea8f0277f2e8169bf95d07c7d5fe69 gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2
+sha256 ac952d89ae0fc3543e81099e7d34917efc621f5def112eee843fd1ce755eca8c  gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz
diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
new file mode 100644
index 0000000..74e0bee
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
+    rm -rf $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
+    mkdir -p $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
+    cp -rf $(@D)/* $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
+
+    cd $(HOST_DIR)/bin && \
+	for i in $(HOST_DIR)/opt/gcc-arm-none-eabi/bin/*; do \
+        ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
+    done
+
+endef
+
+$(eval $(host-generic-package))
-- 
2.7.4
