From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Mar 2012 10:42:24 +0200
Subject: [Buildroot] [git commit] Fix problem with undefined umode_t type in
	3.3 kernel headers
Message-ID: <20120329084733.E5C69969A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3daa6f785285ee2354a55b55189930f18eb36a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 3.3 kernel headers define the umode_t type within a __KERNEL__
preprocessor ifdef region. This results in a broken kernel header in the
buildroot toolchain.

[Peter: This is discussed upstream here:
https://bugzilla.kernel.org/show_bug.cgi?id=42986
Long term socat/syslinux should stop using this header, but this hasn't
been fixed upstream yet]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../kernel-headers/linux-3.3-fix-umode_t.patch     |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

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
