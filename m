From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Wed, 14 Nov 2018 23:24:31 +0100
Subject: [Buildroot] [PATCH v2] boot/syslinux: Add host installer
Message-ID: <20181114222431.10194-1-alexander.sverdlin@gmail.com>
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

Changelog:
v2:
- host package variant inside boot/syslinux instead of separate
  package/syslinux-installer
- reworked commit title

 boot/syslinux/Config.in   |  5 +++++
 boot/syslinux/syslinux.mk | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index e969d53fd0..caec66d767 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -56,6 +56,11 @@ config BR2_TARGET_SYSLINUX_C32
 	  Enter a space-separated list of .c32 modules to install.
 	  Leave empty to install no module.
 
+config BR2_TARGET_HOST_SYSLINUX
+	bool "host syslinux installer"
+	help
+	  Host installer for syslinux bootloader
+
 endif # BR2_TARGET_SYSLINUX_LEGACY_BIOS
 
 endif # BR2_TARGET_SYSLINUX
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 67bc69254e..72d7f62672 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -102,4 +102,17 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
 	done
 endef
 
+# See SYSLINUX_POST_INSTALL_CLEANUP
+HOST_SYSLINUX_DEPENDENCIES = syslinux
+
+define HOST_SYSLINUX_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) \
+		-C $(@D) installer
+endef
+
+define HOST_SYSLINUX_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bios/mtools/syslinux $(HOST_DIR)/usr/bin/syslinux
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.19.1
