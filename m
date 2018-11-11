From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sun, 11 Nov 2018 16:06:47 +0100
Subject: [Buildroot] [PATCH] Add syslinux installer host package
In-Reply-To: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
Message-ID: <20181111150652.17459-2-alexander.sverdlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add host installer for syslinux bootloader which allows to pre-install
syslinux in the generated firmware images. BR2_ROOTFS_POST_IMAGE_SCRIPT
can do something like this:

	${HOST_DIR}/usr/bin/syslinux -d /syslinux/ -i ${IMGFILE}

if the rest of syslinux is installed under /syslinux inside the firmware
image.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 package/Config.in.host                    |  1 +
 package/syslinux-installer/Config.in.host |  7 +++++++
 package/syslinux-installer/syslinux.mk    | 25 +++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/syslinux-installer/Config.in.host
 create mode 100644 package/syslinux-installer/syslinux.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 16b474fc9d..24a51d0e79 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -59,6 +59,7 @@ menu "Host utilities"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
+	source "package/syslinux-installer/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
 	source "package/ti-cgt-pru/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
diff --git a/package/syslinux-installer/Config.in.host b/package/syslinux-installer/Config.in.host
new file mode 100644
index 0000000000..d82e7f00d7
--- /dev/null
+++ b/package/syslinux-installer/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_SYSLINUX_INSTALLER
+	bool "host syslinux installer"
+	depends on BR2_TARGET_SYSLINUX
+	help
+	  Host installer for syslinux bootloader
+
+	  http://syslinux.org
diff --git a/package/syslinux-installer/syslinux.mk b/package/syslinux-installer/syslinux.mk
new file mode 100644
index 0000000000..cbcf49d47a
--- /dev/null
+++ b/package/syslinux-installer/syslinux.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# host syslinux installer
+#
+################################################################################
+
+SYSLINUX_INSTALLER_VERSION = $(SYSLINUX_VERSION)
+SYSLINUX_INSTALLER_SOURCE = $(SYSLINUX_SOURCE)
+SYSLINUX_INSTALLER_SITE = $(SYSLINUX_SITE)
+
+SYSLINUX_INSTALLER_LICENSE = $(SYSLINUX_LICENSE)
+SYSLINUX_INSTALLER_LICENSE_FILES = $(SYSLINUX_LICENSE_FILES)
+
+HOST_SYSLINUX_INSTALLER_DEPENDENCIES = syslinux
+
+define HOST_SYSLINUX_INSTALLER_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) \
+		-C $(@D) installer
+endef
+
+define HOST_SYSLINUX_INSTALLER_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bios/mtools/syslinux $(HOST_DIR)/usr/bin/syslinux
+endef
+
+$(eval $(host-generic-package))
-- 
2.19.1
