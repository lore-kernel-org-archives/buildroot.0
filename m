From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jan 2014 23:14:14 +0100
Subject: [Buildroot] [git commit] libnfs: new package
Message-ID: <20140120212458.79B7A9AC8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d6b418081015ead1eecb2841a1596f0e33dfaa0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nfs userspace implementation.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in        |    1 +
 package/libnfs/Config.in |   11 +++++++++++
 package/libnfs/libnfs.mk |   16 ++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 749ffea..0bb0d2d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -514,6 +514,7 @@ source "package/libconfig/Config.in"
 source "package/libconfuse/Config.in"
 source "package/libfuse/Config.in"
 source "package/liblockfile/Config.in"
+source "package/libnfs/Config.in"
 source "package/libsysfs/Config.in"
 source "package/lockdev/Config.in"
 endmenu
diff --git a/package/libnfs/Config.in b/package/libnfs/Config.in
new file mode 100644
index 0000000..657bdda
--- /dev/null
+++ b/package/libnfs/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBNFS
+	bool "libnfs"
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_LARGEFILE
+	help
+	  nfs userspace implementation.
+
+	  http://github.com/sahlberg/libnfs
+
+comment "libnfs needs a toolchain w/ RPC and LARGEFILE"
+	depends on !(BR2_TOOLCHAIN_HAS_NATIVE_RPC && BR2_LARGEFILE)
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
new file mode 100644
index 0000000..a17d8c3
--- /dev/null
+++ b/package/libnfs/libnfs.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libnfs
+#
+################################################################################
+
+LIBNFS_VERSION = libnfs-1.8.0
+LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
+LIBNFS_INSTALL_STAGING = YES
+LIBNFS_AUTORECONF = YES
+LIBNFS_MAKE = $(MAKE1)
+LIBNFS_LICENSE = LGPLv2.1+
+LIBNFS_LICENSE_FILES = LICENCE-LGPL-2.1.txt
+LIBNFS_DEPENDENCIES = host-pkgconf
+
+$(eval $(autotools-package))
