From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  3 Oct 2015 16:30:00 +0200
Subject: [Buildroot] [RFC] libnfs: Without native RPC use libtirpc
Message-ID: <1443882600-10249-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
RFC: A few packages uses libtirpc if there's no native RPC support *BUT*
they don't propagate the BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2.

It was probably added later on in libtirpc, so the questions here, is
what do we do with that ? Should we add the dependencies to the other
packages ?
Do we need some kind of mechanisms to handle that ?
---
 package/libnfs/Config.in | 8 +++++---
 package/libnfs/libnfs.mk | 4 ++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/libnfs/Config.in b/package/libnfs/Config.in
index 6642fe4..0081548 100644
--- a/package/libnfs/Config.in
+++ b/package/libnfs/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_LIBNFS
 	bool "libnfs"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || \
+		(BR2_TOOLCHAIN_HAS_THREADS && !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)# libtirpc
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  nfs userspace implementation.
 
 	  http://github.com/sahlberg/libnfs
 
-comment "libnfs needs a toolchain w/ RPC"
-	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+comment "libnfs needs a toolchain w/ threads"
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
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
2.5.3
