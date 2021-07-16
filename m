From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Jul 2021 23:01:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: needs uuid
Message-ID: <20210716210106.342232-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Build of nfs-utils without uuid is broken since bump to version 2.5.4 in
commit 0ce30de72fb303768c5865949b8ce9260d0c43f5 because of
http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=c5528f40f9db5061e06dcf1f9b7fce5185b376c6

Fixes:
 - http://autobuild.buildroot.org/results/510b3425943f2e31b024c99b3552419a80c2f9f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nfs-utils/Config.in    | 2 ++
 package/nfs-utils/nfs-utils.mk | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index b736f6c973..bd1e091331 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -7,6 +7,8 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  The NFS Linux kernel server.
 
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index ab000e1ead..4e4cf93587 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -9,7 +9,7 @@ NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
 NFS_UTILS_LICENSE_FILES = COPYING
-NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libtirpc
+NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libtirpc util-linux
 NFS_UTILS_CPE_ID_VENDOR = linux-nfs
 NFS_UTILS_AUTORECONF = YES
 
@@ -57,9 +57,8 @@ else
 NFS_UTILS_CONF_OPTS += --disable-caps
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID)$(BR2_PACKAGE_UTIL_LINUX_LIBUUID),yy)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
 NFS_UTILS_CONF_OPTS += --enable-uuid
-NFS_UTILS_DEPENDENCIES += util-linux
 else
 NFS_UTILS_CONF_OPTS += --disable-uuid
 endif
-- 
2.30.2
