From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 15 Apr 2020 08:53:06 -0500
Subject: [Buildroot] [PATCH v2] package/swupdate: add basic systemd service
Message-ID: <20200415135306.45022-1-matthew.weber@rockwellcollins.com>
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

Changes v1 -> v2
[Thomas P
 - Remove symlink because it is created by
   [231ad359bcc0] package/systemd: use host-systemctl preset all to enable units
---
 package/swupdate/swupdate.mk      |  8 ++++++++
 package/swupdate/swupdate.service | 17 +++++++++++++++++
 2 files changed, 25 insertions(+)
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
index 0000000000..cb065a0414
--- /dev/null
+++ b/package/swupdate/swupdate.service
@@ -0,0 +1,17 @@
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
+
+[Install]
+WantedBy=multi-user.target
-- 
2.17.1
