From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 15 Oct 2019 19:02:18 +0200
Subject: [Buildroot] [PATCH] package/uclibc: bump to version 1.0.32
Message-ID: <20191015170218.GA28628@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove all patches, since they were already applied upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...1-statfs.h-sync-generic-header-with-glibc.patch | 169 --------------------
 .../0002-xtensa-add-custom-bits-poll.h.patch       |  93 -----------
 ...3-preadv-pwritev-fix-offset-argument-type.patch |  71 ---------
 .../uclibc/0004-sparc-remove-asm-constraint.patch  |  40 -----
 ...-PowerPC-sync-with-termios-fix-from-glibc.patch | 172 ---------------------
 package/uclibc/uclibc.hash                         |   4 +-
 package/uclibc/uclibc.mk                           |   2 +-
 7 files changed, 3 insertions(+), 548 deletions(-)
 delete mode 100644 package/uclibc/0001-statfs.h-sync-generic-header-with-glibc.patch
 delete mode 100644 package/uclibc/0002-xtensa-add-custom-bits-poll.h.patch
 delete mode 100644 package/uclibc/0003-preadv-pwritev-fix-offset-argument-type.patch
 delete mode 100644 package/uclibc/0004-sparc-remove-asm-constraint.patch
 delete mode 100644 package/uclibc/0005-PowerPC-sync-with-termios-fix-from-glibc.patch

diff --git a/package/uclibc/0001-statfs.h-sync-generic-header-with-glibc.patch b/package/uclibc/0001-statfs.h-sync-generic-header-with-glibc.patch
deleted file mode 100644
index b8753ed..0000000
--- a/package/uclibc/0001-statfs.h-sync-generic-header-with-glibc.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From 8a73a967e18c55199785bae0f22dc94d9b2f8985 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbrodkorb@conet.de>
-Date: Tue, 27 Nov 2018 15:41:37 +0100
-Subject: [PATCH] statfs.h: sync generic header with glibc
-
-Fix issues with aarch64 and df with mismatching header between kernel
-and libc.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- .../linux/common-generic/bits/statfs.h        | 84 +++++++++----------
- libc/sysdeps/linux/common/fstatfs.c           |  9 --
- libc/sysdeps/linux/common/statfs.c            | 10 ---
- 3 files changed, 40 insertions(+), 63 deletions(-)
-
-diff --git a/libc/sysdeps/linux/common-generic/bits/statfs.h b/libc/sysdeps/linux/common-generic/bits/statfs.h
-index a2767b49a..23519a57e 100644
---- a/libc/sysdeps/linux/common-generic/bits/statfs.h
-+++ b/libc/sysdeps/linux/common-generic/bits/statfs.h
-@@ -11,65 +11,61 @@
- #include <endian.h>
- #include <bits/align64bit.h>
- #include <bits/types.h>
-+#include <bits/wordsize.h>
- 
-+/* 64-bit libc uses the kernel's 'struct statfs', accessed via the
-+   statfs() syscall; 32-bit libc uses the kernel's 'struct statfs64'
-+   and accesses it via the statfs64() syscall.  All the various
-+   APIs offered by libc use the kernel shape for their struct statfs
-+   structure; the only difference is that 32-bit programs not
-+   using __USE_FILE_OFFSET64 only see the low 32 bits of some
-+   of the fields (the __fsblkcnt_t and __fsfilcnt_t fields).  */
-+
-+#if defined __USE_FILE_OFFSET64
-+# define __field64(type, type64, name) type64 name
-+#elif __WORDSIZE == 64
-+# define __field64(type, type64, name) type name
-+#elif __BYTE_ORDER == __LITTLE_ENDIAN
-+# define __field64(type, type64, name) \
-+  type name __attribute__((__aligned__ (__alignof__ (type64)))); int __##name##_pad
-+#else
-+# define __field64(type, type64, name) \
-+  int __##name##_pad __attribute__((__aligned__ (__alignof__ (type64)))); type name
-+#endif
- 
- struct statfs
-   {
--    __U32_TYPE f_type;
--    __U32_TYPE f_bsize;
--#ifndef __USE_FILE_OFFSET64
--# if __BYTE_ORDER == __LITTLE_ENDIAN
--    __U32_TYPE f_blocks;
--    __U32_TYPE __pad1;
--    __U32_TYPE f_bfree;
--    __U32_TYPE __pad2;
--    __U32_TYPE f_bavail;
--    __U32_TYPE __pad3;
--    __U32_TYPE f_files;
--    __U32_TYPE __pad4;
--    __U32_TYPE f_ffree;
--    __U32_TYPE __pad5;
--# else
--    __U32_TYPE __pad1;
--    __U32_TYPE f_blocks;
--    __U32_TYPE __pad2;
--    __U32_TYPE f_bfree;
--    __U32_TYPE __pad3;
--    __U32_TYPE f_bavail;
--    __U32_TYPE __pad4;
--    __U32_TYPE f_files;
--    __U32_TYPE __pad5;
--    __U32_TYPE f_ffree;
--# endif /* __LITTLE_ENDIAN */
--#else
--    __U64_TYPE f_blocks;
--    __U64_TYPE f_bfree;
--    __U64_TYPE f_bavail;
--    __U64_TYPE f_files;
--    __U64_TYPE f_ffree;
--#endif /* __USE_FILE_OFFSET64 */
-+    __SWORD_TYPE f_type;
-+    __SWORD_TYPE f_bsize;
-+    __field64(__fsblkcnt_t, __fsblkcnt64_t, f_blocks);
-+    __field64(__fsblkcnt_t, __fsblkcnt64_t, f_bfree);
-+    __field64(__fsblkcnt_t, __fsblkcnt64_t, f_bavail);
-+    __field64(__fsfilcnt_t, __fsfilcnt64_t, f_files);
-+    __field64(__fsfilcnt_t, __fsfilcnt64_t, f_ffree);
-     __fsid_t f_fsid;
--    __U32_TYPE f_namelen;
--    __U32_TYPE f_frsize;
--    __U32_TYPE f_flags;
--    __U32_TYPE f_spare[4];
--  } __ARCH_64BIT_ALIGNMENT__;
-+    __SWORD_TYPE f_namelen;
-+    __SWORD_TYPE f_frsize;
-+    __SWORD_TYPE f_flags;
-+    __SWORD_TYPE f_spare[4];
-+  };
-+
-+#undef __field64
- 
- #ifdef __USE_LARGEFILE64
- struct statfs64
-   {
--    __U32_TYPE f_type;
--    __U32_TYPE f_bsize;
-+    __SWORD_TYPE f_type;
-+    __SWORD_TYPE f_bsize;
-     __U64_TYPE f_blocks;
-     __U64_TYPE f_bfree;
-     __U64_TYPE f_bavail;
-     __U64_TYPE f_files;
-     __U64_TYPE f_ffree;
-     __fsid_t f_fsid;
--    __U32_TYPE f_namelen;
--    __U32_TYPE f_frsize;
--    __U32_TYPE f_flags;
--    __U32_TYPE f_spare[4];
-+    __SWORD_TYPE f_namelen;
-+    __SWORD_TYPE f_frsize;
-+    __SWORD_TYPE f_flags;
-+    __SWORD_TYPE f_spare[4];
-   };
- #endif
- 
-diff --git a/libc/sysdeps/linux/common/fstatfs.c b/libc/sysdeps/linux/common/fstatfs.c
-index fcb0820eb..0b2709ce3 100644
---- a/libc/sysdeps/linux/common/fstatfs.c
-+++ b/libc/sysdeps/linux/common/fstatfs.c
-@@ -30,15 +30,6 @@ _syscall2(int, __libc_fstatfs, int, fd, struct statfs *, buf)
- int __libc_fstatfs (int __fildes, struct statfs *__buf)
- {
- 	int err = INLINE_SYSCALL(fstatfs64, 3, __fildes, sizeof(*__buf), __buf);
--
--	if (err == 0) {
--		/* Did we overflow? */
--		if (__buf->__pad1 || __buf->__pad2 || __buf->__pad3 ||
--		    __buf->__pad4 || __buf->__pad5) {
--			__set_errno(EOVERFLOW);
--			return -1;
--		}
--	}
- 	return err;
- };
- /* Redefined fstatfs because we need it for backwards compatibility */
-diff --git a/libc/sysdeps/linux/common/statfs.c b/libc/sysdeps/linux/common/statfs.c
-index ab9ec0e56..2990ff3e2 100644
---- a/libc/sysdeps/linux/common/statfs.c
-+++ b/libc/sysdeps/linux/common/statfs.c
-@@ -18,16 +18,6 @@ extern __typeof(statfs) __libc_statfs attribute_hidden;
- int __libc_statfs(const char *path, struct statfs *buf)
- {
- 	int err = INLINE_SYSCALL(statfs64, 3, path, sizeof(*buf), buf);
--
--	if (err == 0) {
--		/* Did we overflow? */
--		if (buf->__pad1 || buf->__pad2 || buf->__pad3 ||
--		    buf->__pad4 || buf->__pad5) {
--			__set_errno(EOVERFLOW);
--			return -1;
--		}
--	}
--
- 	return err;
- }
- # if defined __UCLIBC_LINUX_SPECIFIC__ || defined __UCLIBC_HAS_THREADS_NATIVE__
--- 
-2.19.1
-
diff --git a/package/uclibc/0002-xtensa-add-custom-bits-poll.h.patch b/package/uclibc/0002-xtensa-add-custom-bits-poll.h.patch
deleted file mode 100644
index 030938b..0000000
--- a/package/uclibc/0002-xtensa-add-custom-bits-poll.h.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 0cae9700a4a421dc22c80d205fbae4d01fdd1356 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Wed, 12 Dec 2018 06:58:01 -0800
-Subject: [PATCH] xtensa: add custom bits/poll.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Definitions of POLLWRNORM, POLLWRBAND and POLLREMOVE in xtensa linux
-kernel are non-standard. Provide bits/poll.h with correct values for
-these constants.
-
-This fixes the following strace build errors:
-
-  In file included from xlat/pollflags.h:4:0,
-                   from poll.c:34:
-  ./static_assert.h:40:24: error: static assertion failed: "POLLWRBAND != 0x0100"
-   # define static_assert _Static_assert
-                          ^
-  xlat/pollflags.h:75:1: note: in expansion of macro ?static_assert?
-   static_assert((POLLWRBAND) == (0x0100), "POLLWRBAND != 0x0100");
-   ^~~~~~~~~~~~~
-  ./static_assert.h:40:24: error: static assertion failed: "POLLREMOVE != 0x0800"
-   # define static_assert _Static_assert
-                          ^
-  xlat/pollflags.h:117:1: note: in expansion of macro ?static_assert?
-   static_assert((POLLREMOVE) == (0x0800), "POLLREMOVE != 0x0800");
-   ^~~~~~~~~~~~~
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- libc/sysdeps/linux/xtensa/bits/poll.h | 49 +++++++++++++++++++++++++++++++++++
- 1 file changed, 49 insertions(+)
- create mode 100644 libc/sysdeps/linux/xtensa/bits/poll.h
-
-diff --git a/libc/sysdeps/linux/xtensa/bits/poll.h b/libc/sysdeps/linux/xtensa/bits/poll.h
-new file mode 100644
-index 000000000000..4588cc326006
---- /dev/null
-+++ b/libc/sysdeps/linux/xtensa/bits/poll.h
-@@ -0,0 +1,49 @@
-+/* Copyright (C) 1997, 2001, 2006 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#ifndef _SYS_POLL_H
-+# error "Never use <bits/poll.h> directly; include <sys/poll.h> instead."
-+#endif
-+
-+/* Event types that can be polled for.  These bits may be set in `events'
-+   to indicate the interesting event types; they will appear in `revents'
-+   to indicate the status of the file descriptor.  */
-+#define POLLIN		0x001		/* There is data to read.  */
-+#define POLLPRI		0x002		/* There is urgent data to read.  */
-+#define POLLOUT		0x004		/* Writing now will not block.  */
-+
-+#ifdef __USE_XOPEN
-+/* These values are defined in XPG4.2.  */
-+# define POLLRDNORM	0x040		/* Normal data may be read.  */
-+# define POLLRDBAND	0x080		/* Priority data may be read.  */
-+# define POLLWRNORM	POLLOUT		/* Writing now will not block.  */
-+# define POLLWRBAND	0x100		/* Priority data may be written.  */
-+#endif
-+
-+#ifdef __USE_GNU
-+/* These are extensions for Linux.  */
-+# define POLLMSG	0x400
-+# define POLLREMOVE	0x800
-+# define POLLRDHUP	0x2000
-+#endif
-+
-+/* Event types always implicitly polled for.  These bits need not be set in
-+   `events', but they will appear in `revents' to indicate the status of
-+   the file descriptor.  */
-+#define POLLERR		0x008		/* Error condition.  */
-+#define POLLHUP		0x010		/* Hung up.  */
-+#define POLLNVAL	0x020		/* Invalid polling request.  */
--- 
-2.11.0
-
diff --git a/package/uclibc/0003-preadv-pwritev-fix-offset-argument-type.patch b/package/uclibc/0003-preadv-pwritev-fix-offset-argument-type.patch
deleted file mode 100644
index ccc262b..0000000
--- a/package/uclibc/0003-preadv-pwritev-fix-offset-argument-type.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 1077d5bebffacfd4b09896ed890fb45a5b3c6dc6 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Fri, 10 May 2019 07:13:19 -0700
-Subject: [PATCH] preadv/pwritev: fix offset argument type
-
-preadv/pwritev don't provide separate version for 64-bit wide off_t,
-and default to 32-bit wide off_t, which results in a mismatch between
-declaration and definition for user programs built with
--D_FILE_OFFSET_BITS=64.
-Make offset argument of both functions __off64_t.
-This fixes test misc/tst-preadvwritev on xtensa.
-
-Backported from: 423e49023eeb ("preadv/pwritev: fix offset argument type")
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- include/sys/uio.h                   | 4 ++--
- libc/sysdeps/linux/common/preadv.c  | 2 +-
- libc/sysdeps/linux/common/pwritev.c | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/include/sys/uio.h b/include/sys/uio.h
-index aa766f9b1187..330426fec492 100644
---- a/include/sys/uio.h
-+++ b/include/sys/uio.h
-@@ -59,7 +59,7 @@ extern ssize_t writev (int __fd, const struct iovec *__iovec, int __count);
-    This function is a cancellation point and therefore not marked with
-    __THROW.  */
- extern ssize_t preadv (int __fd, const struct iovec *__iovec, int __count,
--		       off_t __offset) __wur;
-+		       __off64_t __offset) __wur;
- 
- /* Write data pointed by the buffers described by IOVEC, which is a
-    vector of COUNT 'struct iovec's, to file descriptor FD at the given
-@@ -71,7 +71,7 @@ extern ssize_t preadv (int __fd, const struct iovec *__iovec, int __count,
-    This function is a cancellation point and therefore not marked with
-    __THROW.  */
- extern ssize_t pwritev (int __fd, const struct iovec *__iovec, int __count,
--			off_t __offset) __wur;
-+			__off64_t __offset) __wur;
- #endif	/* Use misc.  */
- 
- __END_DECLS
-diff --git a/libc/sysdeps/linux/common/preadv.c b/libc/sysdeps/linux/common/preadv.c
-index fd9dde4b999c..6a07d5df87e0 100644
---- a/libc/sysdeps/linux/common/preadv.c
-+++ b/libc/sysdeps/linux/common/preadv.c
-@@ -21,7 +21,7 @@
- 
- #ifdef __NR_preadv
- ssize_t
--preadv (int fd, const struct iovec *vector, int count, off_t offset)
-+preadv (int fd, const struct iovec *vector, int count, __off64_t offset)
- {
-   unsigned long pos_l, pos_h;
- 
-diff --git a/libc/sysdeps/linux/common/pwritev.c b/libc/sysdeps/linux/common/pwritev.c
-index bef5bcf69b46..f07c40e6de3c 100644
---- a/libc/sysdeps/linux/common/pwritev.c
-+++ b/libc/sysdeps/linux/common/pwritev.c
-@@ -21,7 +21,7 @@
- 
- #ifdef __NR_pwritev
- ssize_t
--pwritev (int fd, const struct iovec *vector, int count, off_t offset)
-+pwritev (int fd, const struct iovec *vector, int count, __off64_t offset)
- {
-   unsigned long pos_l, pos_h;
- 
--- 
-2.11.0
-
diff --git a/package/uclibc/0004-sparc-remove-asm-constraint.patch b/package/uclibc/0004-sparc-remove-asm-constraint.patch
deleted file mode 100644
index 2fbe8cd..0000000
--- a/package/uclibc/0004-sparc-remove-asm-constraint.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 75a1a2a9fec8a310a18ff7d63ead95f3a0d1b11b Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 24 May 2019 12:42:04 +0200
-Subject: [PATCH] sparc: remove asm constraint
-
-uClibc-ng don't build with gcc 9.1 [1] due to a new check that
-"catch illegal asm constraint usage" [2].
-gcc 9.1 print this error:
-"invalid hard register usage between earlyclobber operand and input operand"
-The asm constraint is present in uClibc since it support sparc (back in 2002)[3].
-Note: There is no such constraint is Glibc counterpart code [4].
-[1] https://gitlab.com/kubu93/toolchains-builder/-/jobs/205435757
-[2] https://github.com/gcc-mirror/gcc/commit/b782636f28f5c378897c238081d28d7a4a6ca578
-[3] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=3b6d086531102b6d09ce852feb1e370d5dca3ce9
-[4]
-+https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/sparc/sysdep.h;h=981b2a26b7a91093f821c97876
-+e55bc4be2d9f8a;hb=HEAD
-
-(cherry picked from commit c2eaf6c30d930b65a8bcf5f912ef8873a6f4eb20)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- libc/sysdeps/linux/sparc/bits/syscalls.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libc/sysdeps/linux/sparc/bits/syscalls.h b/libc/sysdeps/linux/sparc/bits/syscalls.h
-index 75af7a157..28edc0568 100644
---- a/libc/sysdeps/linux/sparc/bits/syscalls.h
-+++ b/libc/sysdeps/linux/sparc/bits/syscalls.h
-@@ -33,7 +33,7 @@
-             register long __g1 __asm__("g1") = sys_num;     \
-             LOAD_ARGS_##nr(args)                            \
-             __asm__ __volatile__( __SYSCALL_STRING          \
--                : "=r" (__res), "=&r" (__o0)                \
-+                : "=r" (__res), "=r" (__o0)                \
-                 : "1" (__o0) ASM_ARGS_##nr, "r" (__g1)     \
-                 : __SYSCALL_CLOBBERS );                                   \
-         }                                                   \
--- 
-2.21.0
-
diff --git a/package/uclibc/0005-PowerPC-sync-with-termios-fix-from-glibc.patch b/package/uclibc/0005-PowerPC-sync-with-termios-fix-from-glibc.patch
deleted file mode 100644
index f933d43..0000000
--- a/package/uclibc/0005-PowerPC-sync-with-termios-fix-from-glibc.patch
+++ /dev/null
@@ -1,172 +0,0 @@
-From 67b3b894517893e94b9eed46f38c5d631b87a200 Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <azanella@linux.vnet.ibm.com>
-Date: Tue, 20 Aug 2019 23:16:18 +0300
-Subject: [PATCH] PowerPC: Fix termios definitions
-
-This patch fixes the incorrect guard by __USE_MISC of struct winsize and
-struct termio in powerpc termios header.  Current states leads to build
-failures if the program defines _XOPEN_SOURCE, but not _DEFAULT_SOURCE
-or either _BSD_SOURCE or _SVID_SOURCE.  Without any definition,
-__USE_MISC will not be defined and neither the struct definitions.
-
-This patch copies the default Linux ioctl-types.h by adjusting only the
-character control field (c_cc) size in struct termio.
-
-Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
-[Vadim: adopted for uclibc ]
----
- libc/sysdeps/linux/powerpc/bits/ioctl-types.h | 74 ++++++++++++++++++-
- libc/sysdeps/linux/powerpc/bits/termios.h     | 48 ------------
- 2 files changed, 73 insertions(+), 49 deletions(-)
-
-diff --git a/libc/sysdeps/linux/powerpc/bits/ioctl-types.h b/libc/sysdeps/linux/powerpc/bits/ioctl-types.h
-index 87b8265af..926061fa8 100644
---- a/libc/sysdeps/linux/powerpc/bits/ioctl-types.h
-+++ b/libc/sysdeps/linux/powerpc/bits/ioctl-types.h
-@@ -1,5 +1,77 @@
-+/* Structure types for pre-termios terminal ioctls.  Linux/powerpc version.
-+   Copyright (C) 2014-2019 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
- #ifndef _SYS_IOCTL_H
- # error "Never use <bits/ioctl-types.h> directly; include <sys/ioctl.h> instead."
- #endif
- 
--#include <termios.h>
-+/* Get definition of constants for use with `ioctl'.  */
-+#include <asm/ioctls.h>
-+
-+
-+struct winsize
-+  {
-+    unsigned short int ws_row;
-+    unsigned short int ws_col;
-+    unsigned short int ws_xpixel;
-+    unsigned short int ws_ypixel;
-+  };
-+
-+#define NCC 10
-+struct termio
-+  {
-+    unsigned short int c_iflag;		/* input mode flags */
-+    unsigned short int c_oflag;		/* output mode flags */
-+    unsigned short int c_cflag;		/* control mode flags */
-+    unsigned short int c_lflag;		/* local mode flags */
-+    unsigned char c_line;		/* line discipline */
-+    unsigned char c_cc[NCC];		/* control characters */
-+};
-+
-+/* modem lines */
-+#define TIOCM_LE	0x001
-+#define TIOCM_DTR	0x002
-+#define TIOCM_RTS	0x004
-+#define TIOCM_ST	0x008
-+#define TIOCM_SR	0x010
-+#define TIOCM_CTS	0x020
-+#define TIOCM_CAR	0x040
-+#define TIOCM_RNG	0x080
-+#define TIOCM_DSR	0x100
-+#define TIOCM_CD	TIOCM_CAR
-+#define TIOCM_RI	TIOCM_RNG
-+
-+/* ioctl (fd, TIOCSERGETLSR, &result) where result may be as below */
-+
-+/* line disciplines */
-+#define N_TTY		0
-+#define N_SLIP		1
-+#define N_MOUSE		2
-+#define N_PPP		3
-+#define N_STRIP		4
-+#define N_AX25		5
-+#define N_X25		6	/* X.25 async  */
-+#define N_6PACK		7
-+#define N_MASC		8	/* Mobitex module  */
-+#define N_R3964		9	/* Simatic R3964 module  */
-+#define N_PROFIBUS_FDL	10	/* Profibus  */
-+#define N_IRDA		11	/* Linux IR  */
-+#define N_SMSBLOCK	12	/* SMS block mode  */
-+#define N_HDLC		13	/* synchronous HDLC  */
-+#define N_SYNC_PPP	14	/* synchronous PPP  */
-+#define	N_HCI		15	/* Bluetooth HCI UART  */
-diff --git a/libc/sysdeps/linux/powerpc/bits/termios.h b/libc/sysdeps/linux/powerpc/bits/termios.h
-index ffd99a5e2..83380685f 100644
---- a/libc/sysdeps/linux/powerpc/bits/termios.h
-+++ b/libc/sysdeps/linux/powerpc/bits/termios.h
-@@ -256,23 +256,6 @@ struct ltchars {
- #define TIOCPKT_NOSTOP		16
- #define TIOCPKT_DOSTOP		32
- 
--struct winsize {
--	unsigned short ws_row;
--	unsigned short ws_col;
--	unsigned short ws_xpixel;
--	unsigned short ws_ypixel;
--};
--
--#define NCC 10
--struct termio {
--	unsigned short c_iflag;		/* input mode flags */
--	unsigned short c_oflag;		/* output mode flags */
--	unsigned short c_cflag;		/* control mode flags */
--	unsigned short c_lflag;		/* local mode flags */
--	unsigned char c_line;		/* line discipline */
--	unsigned char c_cc[NCC];	/* control characters */
--};
--
- /* c_cc characters */
- #define _VINTR	0
- #define _VQUIT	1
-@@ -285,36 +268,5 @@ struct termio {
- #define _VEOL2	8
- #define _VSWTC	9
- 
--/* modem lines */
--#define TIOCM_LE	0x001
--#define TIOCM_DTR	0x002
--#define TIOCM_RTS	0x004
--#define TIOCM_ST	0x008
--#define TIOCM_SR	0x010
--#define TIOCM_CTS	0x020
--#define TIOCM_CAR	0x040
--#define TIOCM_RNG	0x080
--#define TIOCM_DSR	0x100
--#define TIOCM_CD	TIOCM_CAR
--#define TIOCM_RI	TIOCM_RNG
--
- /* ioctl (fd, TIOCSERGETLSR, &result) where result may be as below */
- #define TIOCSER_TEMT    0x01	/* Transmitter physically empty */
--
--/* line disciplines */
--#define N_TTY		0
--#define N_SLIP		1
--#define N_MOUSE		2
--#define N_PPP		3
--#define N_STRIP		4
--#define N_AX25		5
--#define N_X25		6	/* X.25 async  */
--#define N_6PACK		7
--#define N_MASC		8	/* Mobitex module  */
--#define N_R3964		9	/* Simatic R3964 module  */
--#define N_PROFIBUS_FDL	10	/* Profibus  */
--#define N_IRDA		11	/* Linux IR  */
--#define N_SMSBLOCK	12	/* SMS block mode  */
--#define N_HDLC		13	/* synchronous HDLC  */
--#define N_SYNC_PPP	14	/* synchronous PPP  */
--#define	N_HCI		15	/* Bluetooth HCI UART  */
--- 
-2.22.0
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index d1cbdb6..c1f161f 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.31/uClibc-ng-1.0.31.tar.xz.sha256
-sha256  2215d7377118434d1697fd575f10d7a6be3f29e460d6b0e1ee9f6f5306288060  uClibc-ng-1.0.31.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.32/uClibc-ng-1.0.32.tar.xz.sha256
+sha256  891b5e4573855e4c11e51d3a518f89a82e490d9aa73280c05ce3e4d7e739a370  uClibc-ng-1.0.32.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index b9ed8b9..2af666c 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.31
+UCLIBC_VERSION = 1.0.32
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.1.4
