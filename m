From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 3 Feb 2017 20:56:00 +0100
Subject: [Buildroot] [git commit] uclibc: update to 1.0.22
Message-ID: <20170203200311.3604B82145@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9be8837ad252c2d37e3732367b9a8eaf5f1b4678
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- fixes mips{32,64}r6 support
- adds experimental aarch64 support
- fixes syscalls with 6 arguments for x86
- removes PID caching and simplifies architecture specific code

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nit_module-delete_module-syscall-wrappers.patch | 59 ----------------------
 ...ve-iconv.h-when-UCLIBC_HAS_LOCALE-is-not-.patch | 26 ----------
 package/uclibc/0003-locale-needs-libiconv.patch    | 25 ---------
 ...0004-Makefile.in-Fix-removal-of-libintl.h.patch | 33 ------------
 package/uclibc/uclibc.hash                         |  2 +-
 package/uclibc/uclibc.mk                           |  2 +-
 6 files changed, 2 insertions(+), 145 deletions(-)

diff --git a/package/uclibc/0001-add-init_module-delete_module-syscall-wrappers.patch b/package/uclibc/0001-add-init_module-delete_module-syscall-wrappers.patch
deleted file mode 100644
index 4a3e07f..0000000
--- a/package/uclibc/0001-add-init_module-delete_module-syscall-wrappers.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From f60f9d6f1f73ab3f77771dafa4f90c2e0de2a7e2 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Tue, 27 Dec 2016 09:24:24 +0100
-Subject: [PATCH] add init_module/delete_module syscall wrappers
-
-Add the wrappers unconditionally, because kmod package
-still uses them.
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- libc/sysdeps/linux/common/Makefile.in |  1 +
- libc/sysdeps/linux/common/module.c    | 23 +++++++++++++++++++++++
- 2 files changed, 24 insertions(+)
- create mode 100644 libc/sysdeps/linux/common/module.c
-
-diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
-index 595074c..faed6fd 100644
---- a/libc/sysdeps/linux/common/Makefile.in
-+++ b/libc/sysdeps/linux/common/Makefile.in
-@@ -31,6 +31,7 @@ CSRC-$(UCLIBC_LINUX_SPECIFIC) += \
- 	ioperm.c \
- 	iopl.c \
- 	modify_ldt.c \
-+	module.c \
- 	personality.c \
- 	pipe2.c \
- 	ppoll.c \
-diff --git a/libc/sysdeps/linux/common/module.c b/libc/sysdeps/linux/common/module.c
-new file mode 100644
-index 0000000..146a43e
---- /dev/null
-+++ b/libc/sysdeps/linux/common/module.c
-@@ -0,0 +1,23 @@
-+/*
-+ * init_module()/delete_module() for uClibc
-+ *
-+ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
-+ *
-+ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
-+ */
-+
-+#include <sys/syscall.h>
-+
-+#ifdef __NR_init_module
-+int init_module(void *first, void *second, void *third, void *fourth, void *fifth);
-+/* This may have 5 arguments (for old 2.0 kernels) or 2 arguments
-+ * (for 2.2 and 2.4 kernels).  Use the greatest common denominator,
-+ * and let the kernel cope with whatever it gets.  It's good at that. */
-+_syscall5(int, init_module, void *, first, void *, second, void *, third,
-+	  void *, fourth, void *, fifth)
-+#endif
-+
-+#ifdef __NR_delete_module
-+int delete_module(const char *name, unsigned int flags);
-+_syscall2(int, delete_module, const char *, name, unsigned int, flags)
-+#endif
--- 
-2.1.4
-
diff --git a/package/uclibc/0002-do-not-remove-iconv.h-when-UCLIBC_HAS_LOCALE-is-not-.patch b/package/uclibc/0002-do-not-remove-iconv.h-when-UCLIBC_HAS_LOCALE-is-not-.patch
deleted file mode 100644
index 4567720..0000000
--- a/package/uclibc/0002-do-not-remove-iconv.h-when-UCLIBC_HAS_LOCALE-is-not-.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 0d80d5a235af1a12b606dea6380dc91f755546fe Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Wed, 28 Dec 2016 19:08:15 +0100
-Subject: [PATCH] do not remove iconv.h when UCLIBC_HAS_LOCALE is not set
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 9acf76c..c8afe1c 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -282,7 +282,7 @@ HEADERS_RM-$(UCLIBC_HAS_IPV6)                += netinet/ip6.h netinet/icmp6.h
- HEADERS_RM-$(UCLIBC_HAS_BACKTRACE)           += execinfo.h
- HEADERS_RM-$(UCLIBC_HAS_LIBICONV)            += iconv.h
- HEADERS_RM-$(UCLIBC_HAS_LIBINTL)             += intl.h
--HEADERS_RM-$(UCLIBC_HAS_LOCALE)              += iconv.h bits/uClibc_ctype.h
-+HEADERS_RM-$(UCLIBC_HAS_LOCALE)              += bits/uClibc_ctype.h
- HEADERS_RM-$(UCLIBC_HAS_PTY)                 += pty.h
- HEADERS_RM-$(UCLIBC_HAS_REALTIME)            += mqueue.h bits/mqueue.h sched.h \
- 	bits/sched.h \
--- 
-2.1.4
-
diff --git a/package/uclibc/0003-locale-needs-libiconv.patch b/package/uclibc/0003-locale-needs-libiconv.patch
deleted file mode 100644
index e244955..0000000
--- a/package/uclibc/0003-locale-needs-libiconv.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a2c56ee4fbff7af9128d630299d81fb46582673d Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Thu, 29 Dec 2016 13:38:09 +0100
-Subject: [PATCH] locale: needs libiconv
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- extra/Configs/Config.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/extra/Configs/Config.in b/extra/Configs/Config.in
-index 6b0985e..b02054c 100644
---- a/extra/Configs/Config.in
-+++ b/extra/Configs/Config.in
-@@ -1442,6 +1442,7 @@ config UCLIBC_HAS_LOCALE
- 	bool "Locale Support"
- 	select UCLIBC_HAS_WCHAR
- 	select UCLIBC_HAS_CTYPE_TABLES
-+	select UCLIBC_HAS_LIBICONV
- 	help
- 	  uClibc now has full ANSI/ISO C99 locale support (except for
- 	  wcsftime() and collating items in regex).  Be aware that enabling
--- 
-2.1.4
-
diff --git a/package/uclibc/0004-Makefile.in-Fix-removal-of-libintl.h.patch b/package/uclibc/0004-Makefile.in-Fix-removal-of-libintl.h.patch
deleted file mode 100644
index 7cbcd47..0000000
--- a/package/uclibc/0004-Makefile.in-Fix-removal-of-libintl.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5f7b66fe28a785330a874a11001d7758dd5a59d7 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 16 Jan 2017 21:01:43 +0100
-Subject: [PATCH 1/1] Makefile.in: Fix removal of libintl.h
-
-A wrong filename was present in Makefile.in leaving libintl.h installed
-even if libintl support is disabled leading to wrong configure checks
-by other packages.
-
-Patch sent upstream:
-http://mailman.uclibc-ng.org/pipermail/devel/2017-January/001360.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index c8afe1cd0..bb3549c19 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -281,7 +281,7 @@ HEADERS_RM-$(UCLIBC_HAS_GETOPT_LONG)         += getopt.h
- HEADERS_RM-$(UCLIBC_HAS_IPV6)                += netinet/ip6.h netinet/icmp6.h
- HEADERS_RM-$(UCLIBC_HAS_BACKTRACE)           += execinfo.h
- HEADERS_RM-$(UCLIBC_HAS_LIBICONV)            += iconv.h
--HEADERS_RM-$(UCLIBC_HAS_LIBINTL)             += intl.h
-+HEADERS_RM-$(UCLIBC_HAS_LIBINTL)             += libintl.h
- HEADERS_RM-$(UCLIBC_HAS_LOCALE)              += bits/uClibc_ctype.h
- HEADERS_RM-$(UCLIBC_HAS_PTY)                 += pty.h
- HEADERS_RM-$(UCLIBC_HAS_REALTIME)            += mqueue.h bits/mqueue.h sched.h \
--- 
-2.11.0
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 0c9e71a..d2fbd0a 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From http://www.uclibc-ng.org/
-sha256  6e99ebebe8a46ddcd26615828d51b62dbf580568aa58bf5f495da37eba0c872d        uClibc-ng-1.0.21.tar.xz
+sha256  f2004c85db8e07e9f1c2e8b7c513fa7c237bc9f9685d8e1bfc89535b8a85449b        uClibc-ng-1.0.22.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index bef1bb7..9f9bffb 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.21
+UCLIBC_VERSION = 1.0.22
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPLv2.1+
