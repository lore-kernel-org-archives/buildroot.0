From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 21 Feb 2013 15:58:38 +0100
Subject: [Buildroot] [PATCH 08/13] libnfs: new package
In-Reply-To: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <6f49fb1679eb12c011edfaf52648c065a049c101.1361458625.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nfs userspace implementation.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in        |    1 +
 package/libnfs/Config.in |   11 +++++++++++
 package/libnfs/libnfs.mk |   16 ++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/libnfs/Config.in
 create mode 100644 package/libnfs/libnfs.mk

diff --git a/package/Config.in b/package/Config.in
index ac021e8..a9cb9ed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -404,6 +404,7 @@ source "package/gamin/Config.in"
 source "package/libconfig/Config.in"
 source "package/libconfuse/Config.in"
 source "package/libfuse/Config.in"
+source "package/libnfs/Config.in"
 source "package/liblockfile/Config.in"
 source "package/libsysfs/Config.in"
 endmenu
diff --git a/package/libnfs/Config.in b/package/libnfs/Config.in
new file mode 100644
index 0000000..29e5a43
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
+comment "libnfs requires a toolchain with RPC and LARGEFILE support"
+	depends on !(BR2_TOOLCHAIN_HAS_NATIVE_RPC && BR2_LARGEFILE)
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
new file mode 100644
index 0000000..693de46
--- /dev/null
+++ b/package/libnfs/libnfs.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# libnfs
+#
+#############################################################
+
+LIBNFS_VERSION = libnfs-1.3.0
+LIBNFS_SITE = http://github.com/sahlberg/libnfs/tarball/$(LIBNFS_VERSION)
+LIBNFS_INSTALL_STAGING = YES
+LIBNFS_AUTORECONF = YES
+LIBNFS_MAKE = $(MAKE1)
+LIBNFS_LICENSE = LGPLv2.1
+LIBNFS_LICENSE_FILES = LICENCE-LGPL-2.1.txt
+LIBNFS_DEPENDENCIES = host-pkgconf
+
+$(eval $(autotools-package))
-- 
1.7.10.4
