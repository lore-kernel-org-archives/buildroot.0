From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Oct 2019 23:54:41 +0100
Subject: [Buildroot] [PATCH 3/3] package/systemd: generate hwdb.bin
In-Reply-To: <cover.1572303270.git.yann.morin.1998@free.fr>
References: <cover.1572303270.git.yann.morin.1998@free.fr>
Message-ID: <371d42c6636c11fe7ad280c28ca67aa9e2d9f3ba.1572303270.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the hwdb installed by systemd to be useful, it has to be compiled
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
 package/systemd/Config.in  |  1 +
 package/systemd/systemd.mk | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 601398bf96..aef39abe27 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -199,6 +199,7 @@ config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 config BR2_PACKAGE_SYSTEMD_HWDB
 	bool "enable hwdb installation"
 	default y
+	select BR2_PACKAGE_HOST_EUDEV # for udevadm, during target-finalize
 	help
 	  Enables hardware database installation to /usr/lib/udev/hwdb.d
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index df40961fee..4e8db8fd31 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -203,6 +203,29 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
 SYSTEMD_CONF_OPTS += -Dhwdb=true
+
+# "udevadm hwdb" was configured with its prefix set to HOST_DIR (it is
+# from a host package), so it can only look in there to find .hwdb files.
+# Remove existing .hwdb files (they are from the host variant or a
+# previous run), and replace them with those from target.
+# Note that systemd and eudev put their files in diffeernt locations.
+define SYSTEMD_BUILD_HWDB
+	rm -rf $(HOST_DIR)/etc/udev/hwdb.d
+	cp -a $(TARGET_DIR)/usr/lib/udev/hwdb.d $(HOST_DIR)/etc/udev/hwdb.d
+	$(HOST_DIR)/bin/udevadm hwdb --update
+	$(INSTALL) -D -m 0644 $(HOST_DIR)/etc/udev/hwdb.bin \
+		$(TARGET_DIR)/usr/lib/udev/hwdb.bin
+endef
+SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_BUILD_HWDB
+
+# Note: this will run in the filesystem context, so will use a copy
+# of tharget/, not the real one, so the files are still available on
+# re-builds (foo-rebuild, etc...)
+define SYSTEMD_RM_HWDB_SRC
+	rm -rf $(TARGET_DIR)/usr/lib/udev/hwdb.d/
+endef
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_HWDB_SRC
+
 else
 SYSTEMD_CONF_OPTS += -Dhwdb=false
 endif
-- 
2.20.1
