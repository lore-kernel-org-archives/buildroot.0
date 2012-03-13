From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Mar 2012 13:59:05 +0100
Subject: [Buildroot] [git commit] New package: parted
Message-ID: <20120313130006.2796390D7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa9f6a9b133104b54c1abc0db203c30b6c0ea364
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs largefile + wchar]
Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/parted/Config.in |   14 ++++++++++++++
 package/parted/parted.mk |   13 +++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4838edc..36a221c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -202,6 +202,7 @@ source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
+source "package/parted/Config.in"
 source "package/pciutils/Config.in"
 source "package/picocom/Config.in"
 source "package/rng-tools/Config.in"
diff --git a/package/parted/Config.in b/package/parted/Config.in
new file mode 100644
index 0000000..610c040
--- /dev/null
+++ b/package/parted/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PARTED
+	bool "parted"
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_UTIL_LINUX
+	help
+	  parted, the GNU partition resizing program
+
+	  http://www.gnu.org/software/parted/
+
+comment "parted requires a toolchain with LARGEFILE+WCHAR support"
+        depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
new file mode 100644
index 0000000..c4107e7
--- /dev/null
+++ b/package/parted/parted.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# parted
+#
+#############################################################
+
+PARTED_VERSION = 3.1
+PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
+PARTED_SITE = $(BR2_GNU_MIRROR)/parted
+PARTED_DEPENDENCIES = readline util-linux lvm2
+PARTED_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
