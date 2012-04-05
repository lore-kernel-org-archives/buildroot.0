From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Apr 2012 13:15:22 +0200
Subject: [Buildroot] [git commit] uClibc: add dup3() for 0.9.33
Message-ID: <20120405111656.5919296A10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a67da440db61b4f44d79c95c092efbf2d04d97d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by E.G. systemd. Patch from uClibc list:

http://lists.uclibc.org/pipermail/uclibc/2011-September/045702.html

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-0.9.33-dup3.patch |   54 +++++++++++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.33-dup3.patch b/toolchain/uClibc/uClibc-0.9.33-dup3.patch
new file mode 100644
index 0000000..66b419e
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.33-dup3.patch
@@ -0,0 +1,54 @@
+From: Jonas Bonn <jonas@southpole.se>
+Subject: [RFC PATCH 16/38] Add dup3 syscall
+Date: Tue,  6 Sep 2011 10:30:40 +0200
+
+Signed-off-by: Jonas Bonn <jonas@southpole.se>
+---
+ include/unistd.h                 |    4 ++++
+ libc/sysdeps/linux/common/dup3.c |   15 +++++++++++++++
+ 2 files changed, 19 insertions(+), 0 deletions(-)
+ create mode 100644 libc/sysdeps/linux/common/dup3.c
+
+diff --git a/include/unistd.h b/include/unistd.h
+index 9568790..7c2fa4a 100644
+--- a/include/unistd.h
++++ b/include/unistd.h
+@@ -513,6 +513,10 @@ extern int dup (int __fd) __THROW __wur;
+ extern int dup2 (int __fd, int __fd2) __THROW;
+ libc_hidden_proto(dup2)
+ 
++/* Duplicate FD to FD2, closing FD2 and making it open on the same file.  */
++extern int dup3 (int __fd, int __fd2, int __flags) __THROW;
++libc_hidden_proto(dup3)
++
+ /* NULL-terminated array of "NAME=VALUE" environment variables.  */
+ extern char **__environ;
+ #ifdef __USE_GNU
+diff --git a/libc/sysdeps/linux/common/dup3.c b/libc/sysdeps/linux/common/dup3.c
+new file mode 100644
+index 0000000..5fdab2e
+--- /dev/null
++++ b/libc/sysdeps/linux/common/dup3.c
+@@ -0,0 +1,15 @@
++/* vi: set sw=4 ts=4: */
++/*
++ * dup3() for uClibc
++ *
++ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
++ *
++ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++ */
++
++#include <sys/syscall.h>
++#include <unistd.h>
++
++
++_syscall3(int, dup3, int, oldfd, int, newfd, int, flags)
++libc_hidden_def(dup3)
+-- 
+1.7.5.4
+
+_______________________________________________
+uClibc mailing list
+uClibc at uclibc.org
+http://lists.busybox.net/mailman/listinfo/uclibc
