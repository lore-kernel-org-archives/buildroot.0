From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jul 2021 12:15:46 +0200
Subject: [Buildroot] [git commit] package/nfs-utils: needs uuid
Message-ID: <20210718094632.271AB912EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=b2857786f1fdccac271b99c791080fdbf500d096
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build of nfs-utils without uuid is broken since bump to version 2.5.4 in
commit 0ce30de72fb303768c5865949b8ce9260d0c43f5: the --enable-uuid
option is now ill-named, it now only checks for libblkid:
    http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=c5528f40f9db5061e06dcf1f9b7fce5185b376c6

Cleaning this up is upstream's role, though.

Fixes:
 - http://autobuild.buildroot.org/results/510b3425943f2e31b024c99b3552419a80c2f9f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
index 51a35028e2..0b4bca4772 100644
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
 
@@ -59,9 +59,8 @@ else
 NFS_UTILS_CONF_OPTS += --disable-caps
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID)$(BR2_PACKAGE_UTIL_LINUX_LIBUUID),yy)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
 NFS_UTILS_CONF_OPTS += --enable-uuid
-NFS_UTILS_DEPENDENCIES += util-linux
 else
 NFS_UTILS_CONF_OPTS += --disable-uuid
 endif
