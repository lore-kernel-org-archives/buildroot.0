From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 22:41:22 +0100
Subject: [Buildroot] [git commit] nilfs-utils: needs threads support
Message-ID: <20180102214125.4C408834E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f8a3826bb4ccb57dbed31bd435da2cf3d567e87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nilfs-utils uses the sem_* family of functions from the realtime
extension. Technically this is not part of pthreads. But in uClibc
enabling threads enables also UCLIBC_HAS_REALTIME.

Fixes:
http://autobuild.buildroot.net/results/c5d/c5d93b6ab5b260fe5db46298b956a9ae765c828a/
http://autobuild.buildroot.net/results/9d6/9d6a248f9acbb58b6c2893de58978c6013332415/

Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nilfs-utils/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
index 2763af5..0c6b7a0 100644
--- a/package/nilfs-utils/Config.in
+++ b/package/nilfs-utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NILFS_UTILS
 	bool "nilfs-utils"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # sem_open()
 	depends on BR2_USE_MMU # util-linux libmount, libblkid
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
@@ -9,3 +10,6 @@ config BR2_PACKAGE_NILFS_UTILS
 	  Tools for creating and managing NILFS2 filesystems.
 
 	  https://github.com/nilfs-dev/nilfs-utils
+
+comment "nilfs-utils needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
