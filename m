From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 24 Oct 2014 22:43:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/uclibc: Add eventfd_read() and
	eventfd_write()
Message-ID: <1414183436-6964-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming eventfd support in Kodi:
https://github.com/FernetMenta/xbmc/commit/1030119691a67511b6e9a27abdec474525de8d26

Runtime test was positive:
22:13:39 T:3035360160  NOTICE: Thread FDEventMonitor start, auto delete: false

Downloaded from Openembedded:
https://github.com/openembedded/oe-core/blob/master/meta/recipes-core/uclibc/uclibc-git/0001-Add-eventfd_read-and-eventfd_write.patch

This function needs CONFIG_EVENTFD enabled in kernel and the following line to be
added to package/kodi/Config.in when the eventfd support becomes part of upstream:
depends on !BR2_TOOLCHAIN_EXTERNAL_UCLIBC

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...c-0065-Add-eventfd_read-and-eventfd_write.patch |  131 ++++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0065-Add-eventfd_read-and-eventfd_write.patch

diff --git a/package/uclibc/0.9.33.2/uclibc-0065-Add-eventfd_read-and-eventfd_write.patch b/package/uclibc/0.9.33.2/uclibc-0065-Add-eventfd_read-and-eventfd_write.patch
new file mode 100644
index 0000000..bfe02a7
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0065-Add-eventfd_read-and-eventfd_write.patch
@@ -0,0 +1,131 @@
+Add eventfd_read() and eventfd_write()
+
+Needed for upcoming eventfd support in Kodi:
+https://github.com/FernetMenta/xbmc/commit/1030119691a67511b6e9a27abdec474525de8d26
+
+Downloaded from Openembedded:
+https://github.com/openembedded/oe-core/blob/master/meta/recipes-core/uclibc/uclibc-git/0001-Add-eventfd_read-and-eventfd_write.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From e3aae24ede969e2dede1aa19c2ee520cab71ce11 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Feb 2014 00:30:18 -0800
+Subject: [PATCH 1/3] Add eventfd_read() and eventfd_write()
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+---
+ libc/sysdeps/linux/common/Makefile.in     |  2 ++
+ libc/sysdeps/linux/common/eventfd_read.c  | 27 +++++++++++++++++++++++++++
+ libc/sysdeps/linux/common/eventfd_write.c | 28 ++++++++++++++++++++++++++++
+ libc/sysdeps/linux/common/sys/eventfd.h   |  4 ----
+ 4 files changed, 57 insertions(+), 4 deletions(-)
+ create mode 100644 libc/sysdeps/linux/common/eventfd_read.c
+ create mode 100644 libc/sysdeps/linux/common/eventfd_write.c
+
+diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
+index dbf0b0f..45d2e21 100644
+--- a/libc/sysdeps/linux/common/Makefile.in
++++ b/libc/sysdeps/linux/common/Makefile.in
+@@ -25,6 +25,8 @@ CSRC-$(UCLIBC_LINUX_SPECIFIC) += \
+ 	capset.c \
+ 	dup3.c \
+ 	eventfd.c \
++	eventfd_read.c \
++	eventfd_write.c \
+ 	inotify.c \
+ 	ioperm.c \
+ 	iopl.c \
+diff --git a/libc/sysdeps/linux/common/eventfd_read.c b/libc/sysdeps/linux/common/eventfd_read.c
+new file mode 100644
+index 0000000..75f2aaa
+--- /dev/null
++++ b/libc/sysdeps/linux/common/eventfd_read.c
+@@ -0,0 +1,27 @@
++/* Copyright (C) 2007-2014 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <errno.h>
++#include <unistd.h>
++#include <sys/eventfd.h>
++
++
++int
++eventfd_read (int fd, eventfd_t *value)
++{
++  return read (fd, value, sizeof (eventfd_t)) != sizeof (eventfd_t) ? -1 : 0;
++}
+diff --git a/libc/sysdeps/linux/common/eventfd_write.c b/libc/sysdeps/linux/common/eventfd_write.c
+new file mode 100644
+index 0000000..e1509cf
+--- /dev/null
++++ b/libc/sysdeps/linux/common/eventfd_write.c
+@@ -0,0 +1,28 @@
++/* Copyright (C) 2007-2014 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <errno.h>
++#include <unistd.h>
++#include <sys/eventfd.h>
++
++
++int
++eventfd_write (int fd, eventfd_t value)
++{
++  return write (fd, &value,
++		sizeof (eventfd_t)) != sizeof (eventfd_t) ? -1 : 0;
++}
+diff --git a/libc/sysdeps/linux/common/sys/eventfd.h b/libc/sysdeps/linux/common/sys/eventfd.h
+index 1bf785f..91b265b 100644
+--- a/libc/sysdeps/linux/common/sys/eventfd.h
++++ b/libc/sysdeps/linux/common/sys/eventfd.h
+@@ -33,16 +33,12 @@ __BEGIN_DECLS
+    value to COUNT.  */
+ extern int eventfd (int __count, int __flags) __THROW;
+ 
+-#if 0 /* not (yet) implemented in uClibc */
+-
+ /* Read event counter and possibly wait for events.  */
+ extern int eventfd_read (int __fd, eventfd_t *__value);
+ 
+ /* Increment event counter.  */
+ extern int eventfd_write (int __fd, eventfd_t __value);
+ 
+-#endif
+-
+ __END_DECLS
+ 
+ #endif /* sys/eventfd.h */
+-- 
+1.9.0
+
-- 
1.7.10.4
