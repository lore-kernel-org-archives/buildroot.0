From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 16:58:27 +0100
Subject: [Buildroot] [PATCH 2/2] package/ecryptfs-utils: fix musl build
In-Reply-To: <1453651107-26352-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453651107-26352-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453651107-26352-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build based
on the defconfig from:
http://autobuild.buildroot.net/results/6fb/6fbe96af007803acfe9deacf26399cb19e5f2b47/defconfig

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ecryptfs-utils/0001-musl.patch | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/ecryptfs-utils/0001-musl.patch

diff --git a/package/ecryptfs-utils/0001-musl.patch b/package/ecryptfs-utils/0001-musl.patch
new file mode 100644
index 0000000..4a3b8a7
--- /dev/null
+++ b/package/ecryptfs-utils/0001-musl.patch
@@ -0,0 +1,35 @@
+fix musl build
+
+Patch inspired by
+https://github.com/kraj/meta-musl/blob/master/recipes-core/util-linux/util-linux-2.25/0001-switch_root-use-typeof-instead-of-__SWORD_TYPE-for-s.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr ecryptfs-utils-109.org/src/utils/mount.ecryptfs_private.c ecryptfs-utils-109/src/utils/mount.ecryptfs_private.c
+--- ecryptfs-utils-109.org/src/utils/mount.ecryptfs_private.c	2016-01-22 17:04:52.000000000 +0100
++++ ecryptfs-utils-109/src/utils/mount.ecryptfs_private.c	2016-01-24 16:52:37.000000000 +0100
+@@ -224,6 +224,7 @@
+ 
+ static int check_cwd_f_type()
+ {
++	struct statfs buf;
+ 	/**
+ 	 * This is *not* a list of compatible lower filesystems list for
+ 	 * eCryptfs. This is a list of filesystems that we reasonably expect to
+@@ -235,7 +236,7 @@
+ 	 * deceive other programs with a crafted /proc/self/*. See
+ 	 * https://launchpad.net/bugs/1530566 for more details.
+ 	 */
+-	__SWORD_TYPE f_type_whitelist[] = {
++	typeof(buf.f_type) f_type_whitelist[] = {
+ 		0x61756673 /* AUFS_SUPER_MAGIC */,
+ 		0x9123683E /* BTRFS_SUPER_MAGIC */,
+ 		0x00C36400 /* CEPH_SUPER_MAGIC */,
+@@ -259,7 +260,6 @@
+ 		0x58465342 /* XFS_SB_MAGIC */,
+ 		0x2FC12FC1 /* ZFS_SUPER_MAGIC */,
+ 	};
+-	struct statfs buf;
+ 	size_t i, whitelist_len;
+ 
+ 	if (statfs(".", &buf) != 0) {
-- 
2.7.0.rc3
