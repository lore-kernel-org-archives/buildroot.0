From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:58 -0000
Subject: [Buildroot] [git commit] btrfs-progs: add host package variant
Message-ID: <20180907111548.1340A80225@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed69859a7261ee86e71aa666d30a28e374769e15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds a new option to build the btrfs toolset for the host, which
can be useful to prepare a btrfs filesystem image for the target.

Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host             | 1 +
 package/btrfs-progs/Config.in.host | 6 ++++++
 package/btrfs-progs/btrfs-progs.mk | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 0c21b11bd0..a3f852b3fc 100644
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
