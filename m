From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Sep 2016 14:38:55 +0200
Subject: [Buildroot] [PATCH 4/4] system: fix unmet dependencies
In-Reply-To: <cover.1473597259.git.yann.morin.1998@free.fr>
References: <cover.1473597259.git.yann.morin.1998@free.fr>
Message-ID: <ff633ea671d650a4be16ff4468579043a5c6e523.1473597259.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't force remounting / read/write when using a customskeleton and
systemd as init system, to fix the following unmet dependencies:

    warning: (BR2_INIT_SYSTEMD) selects BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
    which has unmet direct dependencies (BR2_ROOTFS_SKELETON_DEFAULT)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 353421a..77c665b 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -127,7 +127,7 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
-	select BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
+	select BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW if BR2_ROOTFS_SKELETON_DEFAULT
 
 comment "systemd needs a glibc toolchain, headers >= 3.10"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
-- 
2.7.4
