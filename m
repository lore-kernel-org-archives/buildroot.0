From: Robert J. Heywood <robert.heywood@codethink.co.uk>
Date: Tue, 21 Aug 2018 17:04:11 +0100
Subject: [Buildroot] [PATCH 1/2] Adding btrfs-progs host package.
Message-ID: <20180821160412.28757-1-robert.heywood@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding a new option to build the btrfs toolset for the host.

Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
---
 package/Config.in.host             | 1 +
 package/btrfs-progs/Config.in.host | 6 ++++++
 package/btrfs-progs/btrfs-progs.mk | 4 ++++
 3 files changed, 11 insertions(+)
 create mode 100644 package/btrfs-progs/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 7838ffc219..432597ed31 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/btrfs-progs/Config.in.host"
 	source "package/cargo/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
diff --git a/package/btrfs-progs/Config.in.host b/package/btrfs-progs/Config.in.host
new file mode 100644
index 0000000000..cdcd2e4ec4
--- /dev/null
+++ b/package/btrfs-progs/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_BTRFS_PROGS
+	bool "host btrfs-progs"
+	help
+	  Btrfs filesystem utilities
+
+	  https://btrfs.wiki.kernel.org/index.php/Main_Page
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index b4cc839352..3129ecc714 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -21,4 +21,8 @@ BTRFS_PROGS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-static
 BTRFS_PROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static
 endif
 
+HOST_BTRFS_PROGS_DEPENDENCIES = host-e2fsprogs host-lzo host-zlib
+HOST_BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd --disable-python
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.11.0
