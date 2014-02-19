From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 21:02:30 +0100
Subject: [Buildroot] [git commit] linux-headers: remove unused 3.3.8 patch
Message-ID: <20140219203531.E59EF9CAC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdbd7418fb6f7f5feff6a495a7c79946d9bf56d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

3.3.8 support is removed since 334dca61 (kernel-headers: remove deprecated
versions 3.1, 3.3, 3.5), so let's get rid of the patch as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../linux-headers/3.3.8/linux-fix-umode_t.patch    |   22 --------------------
 1 files changed, 0 insertions(+), 22 deletions(-)

diff --git a/package/linux-headers/3.3.8/linux-fix-umode_t.patch b/package/linux-headers/3.3.8/linux-fix-umode_t.patch
deleted file mode 100644
index 9663662..0000000
--- a/package/linux-headers/3.3.8/linux-fix-umode_t.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fix a problem with the 3.3 kernel headers. Specifically, the umode_t type
-is defined within a __KERNEL__ preprocessor ifdef region, and so the type
-is not usable by non-kernel code. Visit the following URL for more details.
-
-* http://www.spinics.net/lists/linux-fsdevel/msg52638.html
-
-The commit that created the problem can be seen at the following URL.
-
-* http://git.kernel.org/?p=linux/kernel/git/stable/linux-stable.git;a=commitdiff;h=0583fcc96bb117763c0fa74c123573c0112dec65
-
-diff -Nur a/include/linux/ext2_fs.h b/include/linux/ext2_fs.h
---- a/include/linux/ext2_fs.h	2012-03-18 23:15:34.000000000 +0000
-+++ b/include/linux/ext2_fs.h	2012-03-21 11:47:53.015548437 +0000
-@@ -209,7 +209,7 @@
- #define EXT2_OTHER_FLMASK (EXT2_NODUMP_FL | EXT2_NOATIME_FL)
- 
- /* Mask out flags that are inappropriate for the given type of inode. */
--static inline __u32 ext2_mask_flags(umode_t mode, __u32 flags)
-+static inline __u32 ext2_mask_flags(unsigned short mode, __u32 flags)
- {
- 	if (S_ISDIR(mode))
- 		return flags;
