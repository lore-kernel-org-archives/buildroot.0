From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 16:03:15 +0200
Subject: [Buildroot] [git commit] package/lxc: bump to version 4.0.4
Message-ID: <20200829135636.B1C527FADF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c2532fc8b446e2546db946467ef590d1e77f38e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bug fix release: https://linuxcontainers.org/fr/lxc/news
- Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...on-t-fail-if-__NR_signalfd-is-not-defined.patch | 54 ----------------------
 package/lxc/lxc.hash                               |  2 +-
 package/lxc/lxc.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 56 deletions(-)

diff --git a/package/lxc/0001-syscall-don-t-fail-if-__NR_signalfd-is-not-defined.patch b/package/lxc/0001-syscall-don-t-fail-if-__NR_signalfd-is-not-defined.patch
deleted file mode 100644
index c6e70e0a55..0000000000
--- a/package/lxc/0001-syscall-don-t-fail-if-__NR_signalfd-is-not-defined.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 3341e204dc1e1da6ecbc1ffbe59fca33f23ca557 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 28 Jul 2020 12:31:31 +0200
-Subject: [PATCH] syscall: don't fail if __NR_signalfd is not defined
-
-lxc fails to build if __NR_signalfd is not defined since version 4.0.0
-and
-https://github.com/lxc/lxc/commit/bed09c9cc0bec7bbd2442fcce4a2a0f03994cb09
-
-However, some architectures don't define __NR_signalfd but only
-__NR_signalfd4. This is the case for example for nios2 or csky:
-https://github.com/bminor/glibc/blob/f9ac84f92f151e07586c55e14ed628d493a5929d/sysdeps/unix/sysv/linux/nios2/arch-syscall.h
-https://github.com/bminor/glibc/blob/f9ac84f92f151e07586c55e14ed628d493a5929d/sysdeps/unix/sysv/linux/csky/arch-syscall.h
-
-Fixes:
- - http://autobuild.buildroot.org/results/75096a48d2dbda57459523db3ed0952e63f93535
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/lxc/lxc/commit/3341e204dc1e1da6ecbc1ffbe59fca33f23ca557]
----
- src/lxc/syscall_numbers.h  | 3 ---
- src/lxc/syscall_wrappers.h | 2 ++
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/src/lxc/syscall_numbers.h b/src/lxc/syscall_numbers.h
-index e2e7883786..72e4ffe460 100644
---- a/src/lxc/syscall_numbers.h
-+++ b/src/lxc/syscall_numbers.h
-@@ -228,9 +228,6 @@
- 		#if _MIPS_SIM == _MIPS_SIM_ABI64	/* n64 */
- 			#define __NR_signalfd 5276
- 		#endif
--	#else
--		#define -1
--		#warning "__NR_signalfd not defined for your architecture"
- 	#endif
- #endif
- 
-diff --git a/src/lxc/syscall_wrappers.h b/src/lxc/syscall_wrappers.h
-index 220ef65fde..6aaa437226 100644
---- a/src/lxc/syscall_wrappers.h
-+++ b/src/lxc/syscall_wrappers.h
-@@ -112,8 +112,10 @@ static inline int signalfd(int fd, const sigset_t *mask, int flags)
- 	int retval;
- 
- 	retval = syscall(__NR_signalfd4, fd, mask, _NSIG / 8, flags);
-+#ifdef __NR_signalfd
- 	if (errno == ENOSYS && flags == 0)
- 		retval = syscall(__NR_signalfd, fd, mask, _NSIG / 8);
-+#endif
- 
- 	return retval;
- }
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 411947f165..ed4957c938 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d56d91d772449c57e9a67b770dab8967e412051d8d6246ce56c63264671672e5  lxc-4.0.3.tar.gz
+sha256  3c65a8ba20ed2b66c2075dc914aa632f76d0137af707b851b62b5555fed7d995  lxc-4.0.4.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index ad26580980..82b8793546 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 4.0.3
+LXC_VERSION = 4.0.4
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
