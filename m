From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 14 Apr 2012 23:08:07 +0200
Subject: [Buildroot] [git commit] toolchain/uClibc: bump 0.9.33.x series to
	version 0.9.33.1
Message-ID: <20120414215233.EB76E96ABF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6c110e77fce6ebaf79b02caa69f1f5659f86100
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/Config.in                         |    2 +-
 ...__err-and-pass-it-to-INTERNAL_SYSCALL_NCS.patch |   30 ----
 ...t-stat-fstat-Use-64bit-version-of-syscall.patch |  179 --------------------
 ... uClibc-0.9.33.1-define-MSG_CMSG_CLOEXEC.patch} |    0
 ....9.33-dup3.patch => uClibc-0.9.33.1-dup3.patch} |    0
 ...33.1-mmap64-include-stdint.h-for-uint64_t.patch |   28 +++
 6 files changed, 29 insertions(+), 210 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 64c5a9f..55e2f8b 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -37,7 +37,7 @@ config BR2_UCLIBC_VERSION_STRING
 	string
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
-	default 0.9.33		if BR2_UCLIBC_VERSION_0_9_33
+	default 0.9.33.1	if BR2_UCLIBC_VERSION_0_9_33
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/toolchain/uClibc/uClibc-0.9.33-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS.patch b/toolchain/uClibc/uClibc-0.9.33-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS.patch
deleted file mode 100644
index 68077f5..0000000
--- a/toolchain/uClibc/uClibc-0.9.33-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ca457af92be7835edf77f34bead94f504fbc2d4b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 3 Feb 2012 10:57:44 -0800
-Subject: [PATCH 2/4] Declare __err and pass it to INTERNAL_SYSCALL_NCS so
- subsequent macros can use it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
----
- libc/sysdeps/linux/common/bits/syscalls-common.h |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libc/sysdeps/linux/common/bits/syscalls-common.h b/libc/sysdeps/linux/common/bits/syscalls-common.h
-index faebd1b..0f5a929 100644
---- a/libc/sysdeps/linux/common/bits/syscalls-common.h
-+++ b/libc/sysdeps/linux/common/bits/syscalls-common.h
-@@ -59,8 +59,8 @@
- #ifndef INLINE_SYSCALL_NOERR_NCS
- # define INLINE_SYSCALL_NOERR_NCS(name, nr, args...)			\
- ({									\
--	/*INTERNAL_SYSCALL_DECL(__err);*/					\
--	long __res = INTERNAL_SYSCALL_NCS(name, /*__err*/, nr, args);	\
-+	INTERNAL_SYSCALL_DECL(__err);					\
-+	long __res = INTERNAL_SYSCALL_NCS(name, __err, nr, args);	\
- 	__res;								\
- })
- #endif
--- 
-1.7.8.3
-
diff --git a/toolchain/uClibc/uClibc-0.9.33-lstat-stat-fstat-Use-64bit-version-of-syscall.patch b/toolchain/uClibc/uClibc-0.9.33-lstat-stat-fstat-Use-64bit-version-of-syscall.patch
deleted file mode 100644
index a9d1c96..0000000
--- a/toolchain/uClibc/uClibc-0.9.33-lstat-stat-fstat-Use-64bit-version-of-syscall.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-From b813377f6c746118a9d2625e6b29ffeec4233663 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 3 Feb 2012 20:06:55 -0800
-Subject: [PATCH 3/4] lstat/stat/fstat: Use 64bit version of syscall if
- available
-
-This is needed for stat'ing loop devices > 255
-since otherwise kernel returns EOVERFLOW becasue
-it needs st_rdev/st_dev to be larger than 16bits but
-in kernel it uses __old_kernel_stat for stat
-syscall which has st_rdev/st_dev as unsigned short
-
-Add a testcase
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
----
- libc/sysdeps/linux/common/fstat.c |   18 ++++++++++++++----
- libc/sysdeps/linux/common/lstat.c |   19 ++++++++++++++-----
- libc/sysdeps/linux/common/stat.c  |   18 ++++++++++++++----
- test/stat/stat-loop256.c          |   32 ++++++++++++++++++++++++++++++++
- 4 files changed, 74 insertions(+), 13 deletions(-)
- create mode 100644 test/stat/stat-loop256.c
-
-diff --git a/libc/sysdeps/linux/common/fstat.c b/libc/sysdeps/linux/common/fstat.c
-index acc639b..4726a68 100644
---- a/libc/sysdeps/linux/common/fstat.c
-+++ b/libc/sysdeps/linux/common/fstat.c
-@@ -12,18 +12,28 @@
- #include <sys/stat.h>
- #include "xstatconv.h"
- 
--#define __NR___syscall_fstat __NR_fstat
--static __inline__ _syscall2(int, __syscall_fstat, int, fd, struct kernel_stat *, buf)
--
- int fstat(int fd, struct stat *buf)
- {
- 	int result;
-+#ifdef __NR_fstat64
-+	/* normal stat call has limited values for various stat elements
-+	 * e.g. uid device major/minor etc.
-+	 * so we use 64 variant if available
-+	 * in order to get newer versions of stat elements
-+	 */
-+	struct kernel_stat64 kbuf;
-+	result = INLINE_SYSCALL(fstat64, 2, fd, &kbuf);
-+	if (result == 0) {
-+		__xstat32_conv(&kbuf, buf);
-+	}
-+#else
- 	struct kernel_stat kbuf;
- 
--	result = __syscall_fstat(fd, &kbuf);
-+	result = INLINE_SYSCALL(fstat, 2, fd, &kbuf);
- 	if (result == 0) {
- 		__xstat_conv(&kbuf, buf);
- 	}
-+#endif
- 	return result;
- }
- libc_hidden_def(fstat)
-diff --git a/libc/sysdeps/linux/common/lstat.c b/libc/sysdeps/linux/common/lstat.c
-index aa77447..db72d1f 100644
---- a/libc/sysdeps/linux/common/lstat.c
-+++ b/libc/sysdeps/linux/common/lstat.c
-@@ -12,19 +12,28 @@
- #include <sys/stat.h>
- #include "xstatconv.h"
- 
--#define __NR___syscall_lstat __NR_lstat
--static __inline__ _syscall2(int, __syscall_lstat,
--		const char *, file_name, struct kernel_stat *, buf)
--
- int lstat(const char *file_name, struct stat *buf)
- {
- 	int result;
-+#ifdef __NR_lstat64
-+	/* normal stat call has limited values for various stat elements
-+	 * e.g. uid device major/minor etc.
-+	 * so we use 64 variant if available
-+	 * in order to get newer versions of stat elements
-+	 */
-+	struct kernel_stat64 kbuf;
-+	result = INLINE_SYSCALL(lstat64, 2, file_name, &kbuf);
-+	if (result == 0) {
-+		__xstat32_conv(&kbuf, buf);
-+	}
-+#else
- 	struct kernel_stat kbuf;
- 
--	result = __syscall_lstat(file_name, &kbuf);
-+	result = INLINE_SYSCALL(lstat, 2, file_name, &kbuf);
- 	if (result == 0) {
- 		__xstat_conv(&kbuf, buf);
- 	}
-+#endif
- 	return result;
- }
- libc_hidden_def(lstat)
-diff --git a/libc/sysdeps/linux/common/stat.c b/libc/sysdeps/linux/common/stat.c
-index a6ab291..829f35a 100644
---- a/libc/sysdeps/linux/common/stat.c
-+++ b/libc/sysdeps/linux/common/stat.c
-@@ -12,20 +12,30 @@
- #include <sys/stat.h>
- #include "xstatconv.h"
- 
--#define __NR___syscall_stat __NR_stat
- #undef stat
--static __inline__ _syscall2(int, __syscall_stat,
--		const char *, file_name, struct kernel_stat *, buf)
- 
- int stat(const char *file_name, struct stat *buf)
- {
- 	int result;
-+#ifdef __NR_stat64
-+	/* normal stat call has limited values for various stat elements
-+	 * e.g. uid device major/minor etc.
-+	 * so we use 64 variant if available
-+	 * in order to get newer versions of stat elements
-+	 */
-+	struct kernel_stat64 kbuf;
-+	result = INLINE_SYSCALL(stat64, 2, file_name, &kbuf);
-+	if (result == 0) {
-+		__xstat32_conv(&kbuf, buf);
-+	}
-+#else
- 	struct kernel_stat kbuf;
- 
--	result = __syscall_stat(file_name, &kbuf);
-+	result = INLINE_SYSCALL(stat, 2, file_name, &kbuf);
- 	if (result == 0) {
- 		__xstat_conv(&kbuf, buf);
- 	}
-+#endif
- 	return result;
- }
- libc_hidden_def(stat)
-diff --git a/test/stat/stat-loop256.c b/test/stat/stat-loop256.c
-new file mode 100644
-index 0000000..14284c1
---- /dev/null
-+++ b/test/stat/stat-loop256.c
-@@ -0,0 +1,32 @@
-+#include <stdio.h>
-+#include <unistd.h>
-+#include <stdlib.h>
-+#include <sys/stat.h>
-+int main()
-+{
-+    struct stat statbuf;
-+    int ret = 0;
-+    char* loop255 = "/dev/loop255";
-+    char* loop256 = "/dev/loop256";
-+    mode_t mode = 0660;
-+    mknod(loop255, mode, 0x7ff);
-+    mknod(loop256, mode, 0x100700);
-+    ret = stat(loop255, &statbuf);
-+    if(ret < 0) {
-+	printf("stat: Cant stat %s\n",loop255);
-+	unlink(loop255);
-+	exit(1);
-+    }
-+    ret = stat(loop256, &statbuf);
-+    if(ret < 0) {
-+        printf("stat: Cant stat %s\n",loop256);
-+	unlink(loop255);
-+	unlink(loop256);
-+        exit(1);
-+    }
-+
-+    unlink(loop255);
-+    unlink(loop256);
-+    exit(0);
-+}
-+
--- 
-1.7.8.3
-
diff --git a/toolchain/uClibc/uClibc-0.9.33-define-MSG_CMSG_CLOEXEC.patch b/toolchain/uClibc/uClibc-0.9.33.1-define-MSG_CMSG_CLOEXEC.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.33-define-MSG_CMSG_CLOEXEC.patch
rename to toolchain/uClibc/uClibc-0.9.33.1-define-MSG_CMSG_CLOEXEC.patch
diff --git a/toolchain/uClibc/uClibc-0.9.33-dup3.patch b/toolchain/uClibc/uClibc-0.9.33.1-dup3.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.33-dup3.patch
rename to toolchain/uClibc/uClibc-0.9.33.1-dup3.patch
diff --git a/toolchain/uClibc/uClibc-0.9.33.1-mmap64-include-stdint.h-for-uint64_t.patch b/toolchain/uClibc/uClibc-0.9.33.1-mmap64-include-stdint.h-for-uint64_t.patch
new file mode 100644
index 0000000..8b08a2c
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.33.1-mmap64-include-stdint.h-for-uint64_t.patch
@@ -0,0 +1,28 @@
+From 47009e1e1c6b721c38b5ffa2eeb9202fb8db298a Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Wed, 11 Apr 2012 16:01:29 -0400
+Subject: [PATCH 1/2] mmap64: include stdint.h for uint64_t
+
+Some targets include this implicitly, but pull it in explicitly for those
+which don't to fix building for them.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ libc/sysdeps/linux/common/mmap64.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/libc/sysdeps/linux/common/mmap64.c b/libc/sysdeps/linux/common/mmap64.c
+index 3c97c84..cebf961 100644
+--- a/libc/sysdeps/linux/common/mmap64.c
++++ b/libc/sysdeps/linux/common/mmap64.c
+@@ -10,6 +10,7 @@
+ #ifdef __UCLIBC_HAS_LFS__
+ 
+ #include <errno.h>
++#include <stdint.h>
+ #include <unistd.h>
+ #include <sys/mman.h>
+ #include <sys/syscall.h>
+-- 
+1.7.3.4
+
