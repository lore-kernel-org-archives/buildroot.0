From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 23 Mar 2015 20:54:38 +0100
Subject: [Buildroot] [PATCH v5] dtc: add host build
Message-ID: <1427140478-31535-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add dtc host build support

- install linux kernel package provided dtc only in case package
  host dtc is not selected (suggested by Matthew Weber (see [1])
  to avoid double installation of host dtc).

[1] http://lists.busybox.net/pipermail/buildroot/2015-January/117121.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v4 -> v5:
  - added Reviewed-by/Tested-by
  - squashed with 'linux: install dtc only in case package host dtc is not
    selected' and fixed variable parenthesis (as suggested by Yann E. MORIN)
    and reworded commit message

Changes v3 -> v4:
  - fix host build/install commands (use PREFIX=$(HOST_DIR)/usr)
    (suggested by Yann E. MORIN)

Changes v2 -> v3:
  - remove extra HOST_DTC_DEPENDENCIES (suggested by Thomas Petazzoni)
  - no need for extra CFLAGS setting (suggested by Thomas Petazzoni)

Changes v1 -> v2:
  - fix host build command (use native compiler instead of
    cross compiler)
---
 linux/linux.mk             |  4 ++--
 package/Config.in.host     |  1 +
 package/dtc/Config.in.host |  9 +++++++++
 package/dtc/dtc.mk         | 10 ++++++++++
 4 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 package/dtc/Config.in.host

diff --git a/linux/linux.mk b/linux/linux.mk
index 5a0ba01..808b31a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -297,14 +297,14 @@ define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
 endef
 endif
 
-
+ifeq ($(BR2_PACKAGE_HOST_DTC),)
 define LINUX_INSTALL_HOST_TOOLS
 	# Installing dtc (device tree compiler) as host tool, if selected
 	if grep -q "CONFIG_DTC=y" $(@D)/.config; then 	\
 		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/dtc ;	\
 	fi
 endef
-
+endif
 
 define LINUX_INSTALL_IMAGES_CMDS
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
diff --git a/package/Config.in.host b/package/Config.in.host
index 94981ad..6a63e57 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -5,6 +5,7 @@ menu "Host utilities"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
+	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
 	source "package/genext2fs/Config.in.host"
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
2.1.4
