From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Oct 2015 20:44:12 +0100
Subject: [Buildroot] [PATCH 2/7] dtc: add host build
In-Reply-To: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1443901457-7914-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Seiderer <ps.report@gmx.net>

Having a host variant of dtc is needed for example for U-Boot, which
uses the Device Tree for a number of platforms.

In addition, now that we have a proper host-dtc package, it is no
longer needed for the linux package to install the host dtc compiler:
users interested in having the host dtc compiler can simply enable
this package.

A Config.in.host option is added to build host-dtc, because the
initial reason why the host DTC built by the kernel was installed in
$(HOST_DIR)/usr/bin (commit 707d44d0a28906ebda49584dd5f55985406f0bde
from Thomas DS) was:

    Having dtc as a host tool can be useful for users that have a
    custom boot scenario where the device tree is not embedded in the
    kernel.

[Thomas:
  - remove the linux installation of host dtc.
  - rework the commit log.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk             | 10 ----------
 package/Config.in.host     |  1 +
 package/dtc/Config.in.host |  9 +++++++++
 package/dtc/dtc.mk         | 10 ++++++++++
 4 files changed, 20 insertions(+), 10 deletions(-)
 create mode 100644 package/dtc/Config.in.host

diff --git a/linux/linux.mk b/linux/linux.mk
index bbcc54b..8c0db9b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -290,15 +290,6 @@ define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
 endef
 endif
 
-
-define LINUX_INSTALL_HOST_TOOLS
-	# Installing dtc (device tree compiler) as host tool, if selected
-	if grep -q "CONFIG_DTC=y" $(@D)/.config; then 	\
-		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/dtc ;	\
-	fi
-endef
-
-
 define LINUX_INSTALL_IMAGES_CMDS
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
 	$(LINUX_INSTALL_DTB)
@@ -313,7 +304,6 @@ define LINUX_INSTALL_TARGET_CMDS
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ;		\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ;	\
 	fi
-	$(LINUX_INSTALL_HOST_TOOLS)
 endef
 
 # Include all our extensions and tools definitions.
diff --git a/package/Config.in.host b/package/Config.in.host
index 1e047aa..1f69687 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -5,6 +5,7 @@ menu "Host utilities"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
+	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
 	source "package/faketime/Config.in.host"
diff --git a/package/dtc/Config.in.host b/package/dtc/Config.in.host
new file mode 100644
index 0000000..cbabf0a
--- /dev/null
+++ b/package/dtc/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_DTC
+	bool "host dtc"
+	help
+	  The Device Tree Compiler, dtc, takes as input a device-tree in
+	  a given format and outputs a device-tree in another format.
+
+	  Install host tools: dtc, convert-dtsv0, fdtdump, fdtget and fdtput.
+
+	  https://git.kernel.org/cgit/utils/dtc/dtc.git
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index e094f7b..f3b6f3b 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -44,4 +44,14 @@ define DTC_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
 endef
 
+# host build
+define HOST_DTC_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr
+endef
+
+define HOST_DTC_INSTALL_CMDS
+	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.6.0
