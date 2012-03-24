From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat, 24 Mar 2012 09:14:44 +0000
Subject: [Buildroot] [PATCH] Fix problem with undefined umode_t type in 3.3
	kernel headers
Message-ID: <1332580484-4489-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The 3.3 kernel headers define the umode_t type within a __KERNEL__
preprocessor ifdef region. This results in a broken kernel header in the
buildroot toolchain.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 .../kernel-headers/linux-3.3-fix-umode_t.patch     |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/kernel-headers/linux-3.3-fix-umode_t.patch

diff --git a/toolchain/kernel-headers/linux-3.3-fix-umode_t.patch b/toolchain/kernel-headers/linux-3.3-fix-umode_t.patch
new file mode 100644
index 0000000..9663662
--- /dev/null
+++ b/toolchain/kernel-headers/linux-3.3-fix-umode_t.patch
@@ -0,0 +1,22 @@
+Fix a problem with the 3.3 kernel headers. Specifically, the umode_t type
+is defined within a __KERNEL__ preprocessor ifdef region, and so the type
+is not usable by non-kernel code. Visit the following URL for more details.
+
+* http://www.spinics.net/lists/linux-fsdevel/msg52638.html
+
+The commit that created the problem can be seen at the following URL.
+
+* http://git.kernel.org/?p=linux/kernel/git/stable/linux-stable.git;a=commitdiff;h=0583fcc96bb117763c0fa74c123573c0112dec65
+
+diff -Nur a/include/linux/ext2_fs.h b/include/linux/ext2_fs.h
+--- a/include/linux/ext2_fs.h	2012-03-18 23:15:34.000000000 +0000
++++ b/include/linux/ext2_fs.h	2012-03-21 11:47:53.015548437 +0000
+@@ -209,7 +209,7 @@
+ #define EXT2_OTHER_FLMASK (EXT2_NODUMP_FL | EXT2_NOATIME_FL)
+ 
+ /* Mask out flags that are inappropriate for the given type of inode. */
+-static inline __u32 ext2_mask_flags(umode_t mode, __u32 flags)
++static inline __u32 ext2_mask_flags(unsigned short mode, __u32 flags)
+ {
+ 	if (S_ISDIR(mode))
+ 		return flags;
-- 
1.7.5.4
