From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 16 Apr 2020 14:02:09 -0500
Subject: [Buildroot] [PATCH v3] package/swupdate: add basic systemd service
Message-ID: <20200416190209.40757-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam Voss <sam.voss@rockwellcollins.com>

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---

Test cfg for verifying systemd created the symlink:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSTEMD=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_SWUPDATE=y
BR2_TARGET_ROOTFS_EXT2=y

Changes
v2 -> v3
 - During testing we found that the service killmode needed adjusting to
   prevent a hang/timeout during shutdown/reboot
   (https://github.com/sbabic/meta-swupdate/blob/master/recipes-support/swupdate/swupdate/swupdate.service)

v1 -> v2
[Thomas P
 - Remove symlink because it is created by
   [231ad359bcc0] package/systemd: use host-systemctl preset all to enable units
---
 package/swupdate/swupdate.mk      |  8 ++++++++
 package/swupdate/swupdate.service | 18 ++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 package/swupdate/swupdate.service

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 2b51edb66d..f31b7f3883 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -189,4 +189,12 @@ $(error No Swupdate configuration file specified, check your BR2_PACKAGE_SWUPDAT
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE),y)
+define SWUPDATE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/swupdate/swupdate.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+endef
+endif
+
 $(eval $(kconfig-package))
diff --git a/package/swupdate/swupdate.service b/package/swupdate/swupdate.service
new file mode 100644
index 0000000000..232bd9956e
--- /dev/null
+++ b/package/swupdate/swupdate.service
@@ -0,0 +1,18 @@
+[Unit]
+Description=SWUpdate daemon
+Documentation=https://github.com/sbabic/swupdate
+Documentation=https://sbabic.github.io/swupdate
+
+[Service]
+# Default environment variables in case /etc/default/swupdate isn't providing them
+Environment=SWU_POST_UPDATE_CMD="touch /tmp/.swu_complete"
+Environment=SWU_WEBSERVER_ARGS="-p 8080 -r /var/www/swupdate/"
+
+# Always take what is in the environment files when exists
+EnvironmentFile=/etc/default/swupdate
+
+ExecStart=/usr/bin/swupdate ${SWU_KEY_ARGS} -p ${SWU_POST_UPDATE_CMD} -v -L -w "${SWU_WEBSERVER_ARGS}"
+KillMode=mixed
+
+[Install]
+WantedBy=multi-user.target
-- 
2.17.1
