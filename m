From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Oct 2019 23:54:40 +0100
Subject: [Buildroot] [PATCH 2/3] package/eudev: generate hwdb.bin
In-Reply-To: <cover.1572303270.git.yann.morin.1998@free.fr>
References: <cover.1572303270.git.yann.morin.1998@free.fr>
Message-ID: <20984e86a50b90ccc7b601198343b735416ae0fe.1572303270.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the hwdb installed by eudev to be useful, it has to be compiled
into a binary form.

This is a bit tricky:
  - the .hwdb files (the source) are installed in TARGET_DIR,
  - HOST_DIR/bin/udevadm only looks in HOST_DIR

So, we copy the .hwdb files for the target from TARGET_DIR and into
HOST_DIR, run udevadm, and copy the generated hwdb.bin back to
TARGET_DIR.

Various packages may install their .hwdb files, so we can only generate
hwdb.bin after all packages have been installed, that is as a
target-finalize hook.

Finally, the .hwdb files take as much space as the generated hwdb.bin
(in the order of 8MiB currently), so we remove them for target.

However, to still support iterative builds (e.g. make foo-reinstall), we
still want to have the .hwdb in target/. So we remove them as a
pre-rootfs hook.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Carlos Santos <unixmania@gmail.com>
---
 package/eudev/Config.in |  3 ++-
 package/eudev/eudev.mk  | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 2220265a55..b1d2f37a72 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -29,8 +29,9 @@ config BR2_PACKAGE_EUDEV_RULES_GEN
 config BR2_PACKAGE_EUDEV_ENABLE_HWDB
 	bool "enable hwdb installation"
 	default y
+	select BR2_PACKAGE_HOST_EUDEV # for udevadm, during target-finalize
 	help
-	  Enables hardware database installation to /etc/udev/hwdb.d
+	  Enables hardware database installation to /etc/udev/hwdb.bin
 
 endif
 
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 12568a6645..9bb96714f0 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -33,6 +33,28 @@ endif
 
 ifeq ($(BR2_PACKAGE_EUDEV_ENABLE_HWDB),y)
 EUDEV_CONF_OPTS += --enable-hwdb
+
+# "udevadm hwdb" was configured with its prefix set to HOST_DIR (it is
+# from a host package), so it can only look in there to find .hwdb files.
+# Remove existing .hwdb files (they are from the host variant or a
+# previous run), and replace them with those from target.
+define EUDEV_BUILD_HWDB
+	rm -rf $(HOST_DIR)/etc/udev/hwdb.d
+	cp -a $(TARGET_DIR)/etc/udev/hwdb.d $(HOST_DIR)/etc/udev/hwdb.d
+	$(HOST_DIR)/bin/udevadm hwdb --update
+	$(INSTALL) -D -m 0644 $(HOST_DIR)/etc/udev/hwdb.bin \
+		$(TARGET_DIR)/etc/udev/hwdb.bin
+endef
+EUDEV_TARGET_FINALIZE_HOOKS += EUDEV_BUILD_HWDB
+
+# Note: this will run in the filesystem context, so will use a copy
+# of tharget/, not the real one, so the files are still available on
+# re-builds (foo-rebuild, etc...)
+define EUDEV_RM_HWDB_SRC
+	rm -rf $(TARGET_DIR)/etc/udev/hwdb.d/
+endef
+EUDEV_ROOTFS_PRE_CMD_HOOKS += EUDEV_RM_HWDB_SRC
+
 else
 EUDEV_CONF_OPTS += --disable-hwdb
 endif
-- 
2.20.1
