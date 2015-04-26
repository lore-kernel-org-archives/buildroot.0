From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Apr 2015 14:54:30 +0200
Subject: [Buildroot] [PATCH 1/2] libnfs: Without native RPC use libtirpc
Message-ID: <1430052871-6235-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As it's done with nfs-utils, use libtirpc when no native rpc support
exists in the toolchain.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libnfs/Config.in | 5 +----
 package/libnfs/libnfs.mk | 4 ++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libnfs/Config.in b/package/libnfs/Config.in
index 6642fe4..e9b939f 100644
--- a/package/libnfs/Config.in
+++ b/package/libnfs/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_LIBNFS
 	bool "libnfs"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  nfs userspace implementation.
 
 	  http://github.com/sahlberg/libnfs
-
-comment "libnfs needs a toolchain w/ RPC"
-	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 0c8c4f5..fb95e21 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -13,4 +13,8 @@ LIBNFS_LICENSE = LGPLv2.1+
 LIBNFS_LICENSE_FILES = LICENCE-LGPL-2.1.txt
 LIBNFS_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+LIBNFS_DEPENDENCIES += libtirpc
+endif
+
 $(eval $(autotools-package))
-- 
2.1.4
