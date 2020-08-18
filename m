From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 18 Aug 2020 20:38:31 +0200
Subject: [Buildroot] [RFC PATCH 1/2] uclibc: backport Add {name,
 open}_to_handle_at() implementation
Message-ID: <20200818183832.7947-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required for iproute2 v5.8.0.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

I tested this just on intel build (didn't run it).
Running build with ./utils/test-pkg didn't help, thus I'm not sure it's
correct. I also expect that the patch [1] needs some correction.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/uclibc-ng/patch/20200818165626.2702-1-petr.vorel at gmail.com/

 ...me-open-_to_handle_at-implementation.patch | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 package/uclibc/0002-Add-name-open-_to_handle_at-implementation.patch

diff --git a/package/uclibc/0002-Add-name-open-_to_handle_at-implementation.patch b/package/uclibc/0002-Add-name-open-_to_handle_at-implementation.patch
new file mode 100644
index 0000000000..f2b6d29d5a
--- /dev/null
+++ b/package/uclibc/0002-Add-name-open-_to_handle_at-implementation.patch
@@ -0,0 +1,139 @@
+From dbd1982f7733fb3898aef80ceb56e7707691ca43 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Tue, 18 Aug 2020 18:26:37 +0200
+Subject: [PATCH 1/1] Add {name,open}_to_handle_at() implementation
+
+copied from musl 1.2.1.
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ Upstream status: https://patchwork.ozlabs.org/project/uclibc-ng/patch/20200818165626.2702-1-petr.vorel at gmail.com/ ]
+---
+ include/fcntl.h                               | 12 +++++++
+ libc/sysdeps/linux/common/Makefile.in         |  2 ++
+ libc/sysdeps/linux/common/name_to_handle_at.c | 36 +++++++++++++++++++
+ libc/sysdeps/linux/common/open_by_handle_at.c | 34 ++++++++++++++++++
+ 4 files changed, 84 insertions(+)
+ create mode 100644 libc/sysdeps/linux/common/name_to_handle_at.c
+ create mode 100644 libc/sysdeps/linux/common/open_by_handle_at.c
+
+diff --git a/include/fcntl.h b/include/fcntl.h
+index e8a781f28..02d4b0110 100644
+--- a/include/fcntl.h
++++ b/include/fcntl.h
+@@ -281,6 +281,18 @@ extern int fallocate64 (int __fd, int __mode, __off64_t __offset, __off64_t __le
+ # endif
+ #endif
+ 
++#if (defined __UCLIBC_LINUX_SPECIFIC__ && defined __USE_GNU)
++struct file_handle {
++	unsigned handle_bytes;
++	int handle_type;
++	unsigned char f_handle[];
++};
++
++int name_to_handle_at(int dirfd, const char *pathname,
++	struct file_handle *handle, int *mount_id, int flags);
++int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags);
++#endif
++
+ __END_DECLS
+ 
+ #endif /* fcntl.h  */
+diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
+index f114a5bd1..9562de52c 100644
+--- a/libc/sysdeps/linux/common/Makefile.in
++++ b/libc/sysdeps/linux/common/Makefile.in
+@@ -32,6 +32,8 @@ CSRC-$(UCLIBC_LINUX_SPECIFIC) += \
+ 	iopl.c \
+ 	modify_ldt.c \
+ 	module.c \
++	name_to_handle_at.c \
++	open_by_handle_at.c \
+ 	personality.c \
+ 	pipe2.c \
+ 	ppoll.c \
+diff --git a/libc/sysdeps/linux/common/name_to_handle_at.c b/libc/sysdeps/linux/common/name_to_handle_at.c
+new file mode 100644
+index 000000000..20c67cbca
+--- /dev/null
++++ b/libc/sysdeps/linux/common/name_to_handle_at.c
+@@ -0,0 +1,36 @@
++/*
++ * Copyright ? 2005-2020 Rich Felker, et al.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject to
++ * the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be
++ * included in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ * Imported from musl C library
++ */
++
++#include <sys/syscall.h>
++
++#ifdef __NR_open_by_handle_at
++#include <fcntl.h>
++int name_to_handle_at(int dirfd, const char *pathname,
++	struct file_handle *handle, int *mount_id, int flags)
++{
++	return INLINE_SYSCALL(name_to_handle_at, 5, dirfd, pathname, handle,
++			      mount_id, flags);
++}
++#endif
+diff --git a/libc/sysdeps/linux/common/open_by_handle_at.c b/libc/sysdeps/linux/common/open_by_handle_at.c
+new file mode 100644
+index 000000000..5e65648a6
+--- /dev/null
++++ b/libc/sysdeps/linux/common/open_by_handle_at.c
+@@ -0,0 +1,34 @@
++/*
++ * Copyright ? 2005-2020 Rich Felker, et al.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject to
++ * the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be
++ * included in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ * Imported from musl C library
++ */
++
++#include <sys/syscall.h>
++
++#ifdef __NR_open_by_handle_at
++#include <fcntl.h>
++int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags)
++{
++	return INLINE_SYSCALL(open_by_handle_at, 3, mount_fd, handle, flags);
++}
++#endif
+-- 
+2.28.0
+
-- 
2.28.0
