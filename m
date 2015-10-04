From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 16:11:57 +0100
Subject: [Buildroot] [git commit] libnfs: Without native RPC use libtirpc
Message-ID: <20151004151805.EFFE180DF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1a20960c4a291c977bddb0ca6eabe193d9a18e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnfs/Config.in |    7 ++++---
 package/libnfs/libnfs.mk |    4 ++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/libnfs/Config.in b/package/libnfs/Config.in
index 6642fe4..2a1ef03 100644
--- a/package/libnfs/Config.in
+++ b/package/libnfs/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_LIBNFS
 	bool "libnfs"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
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
