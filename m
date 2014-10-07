From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 16:21:50 +0200
Subject: [Buildroot] [git commit] btrfs-progs: fix build breakage on uClibc
	without backtrace
Message-ID: <20141007142249.31957B0E4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65cf9e9291716f713b4bd4cd0b2422033908ef0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc has optional support for backtrace() hence on default
configurations where it's disabled it'll fail.
Add patch to make backtrace support conditional and disable it for
uClibc-based builds since it's mostly for debugging purposes. Fixes:
http://autobuild.buildroot.net/results/325/32523398a8c66a7ac6d3e789332d1b57e090aef1/

Patch status: sent upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-add-option-to-disable-backtrace-usage.patch |   88 ++++++++++++++++++++
 package/btrfs-progs/btrfs-progs.mk                 |    3 +-
 2 files changed, 90 insertions(+), 1 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs-0001-add-option-to-disable-backtrace-usage.patch b/package/btrfs-progs/btrfs-progs-0001-add-option-to-disable-backtrace-usage.patch
new file mode 100644
index 0000000..bcc19b6
--- /dev/null
+++ b/package/btrfs-progs/btrfs-progs-0001-add-option-to-disable-backtrace-usage.patch
@@ -0,0 +1,88 @@
+From eb8d1bbdfea80a50ce9fbf3238062a543036f855 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 7 Oct 2014 11:03:03 -0300
+Subject: [PATCH] btrfs-progs: add option to disable backtrace usage
+
+This commit adds the support for a make variable named
+"DISABLE_BACKTRACE" which allows to disable the support for backtrace()
+usage on ASSERT(), BUG() and BUG_ON() calls.
+This is useful because some alternative C libraries like uClibc have
+optional support for backtrace() which is rarely built when debugging
+isn't taking place.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ Makefile     |  4 ++++
+ kerncompat.h | 15 +++++++++++++++
+ 2 files changed, 19 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 7cc7783..03a4779 100644
+--- a/Makefile
++++ b/Makefile
+@@ -63,6 +63,10 @@ BUILDDIRS = $(patsubst %,build-%,$(SUBDIRS))
+ INSTALLDIRS = $(patsubst %,install-%,$(SUBDIRS))
+ CLEANDIRS = $(patsubst %,clean-%,$(SUBDIRS))
+ 
++ifeq ($(DISABLE_BACKTRACE),1)
++AM_CFLAGS += -DBTRFS_DISABLE_BACKTRACE
++endif
++
+ ifneq ($(DISABLE_DOCUMENTATION),1)
+ BUILDDIRS += build-Documentation
+ INSTALLDIRS += install-Documentation
+diff --git a/kerncompat.h b/kerncompat.h
+index 19c7fa5..889d94c 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -29,7 +29,9 @@
+ #include <stddef.h>
+ #include <linux/types.h>
+ #include <stdint.h>
++#ifndef BTRFS_DISABLE_BACKTRACE
+ #include <execinfo.h>
++#endif
+ 
+ #define ptr_to_u64(x)	((u64)(uintptr_t)x)
+ #define u64_to_ptr(x)	((void *)(uintptr_t)x)
+@@ -55,6 +57,7 @@
+ #define ULONG_MAX       (~0UL)
+ #endif
+ 
++#ifndef BTRFS_DISABLE_BACKTRACE
+ #define MAX_BACKTRACE	16
+ static inline void print_trace(void)
+ {
+@@ -81,6 +84,9 @@ static inline void assert_trace(const char *assertion, const char *filename,
+ }
+ 
+ #define BUG() assert_trace(NULL, __FILE__, __func__, __LINE__, 0)
++#else
++#define BUG() assert(0)
++#endif
+ 
+ #ifdef __CHECKER__
+ #define __force    __attribute__((force))
+@@ -264,10 +270,19 @@ static inline long IS_ERR(const void *ptr)
+ #define kstrdup(x, y) strdup(x)
+ #define kfree(x) free(x)
+ 
++#ifndef BTRFS_DISABLE_BACKTRACE
+ #define BUG_ON(c) assert_trace(#c, __FILE__, __func__, __LINE__, !(c))
++#else
++#define BUG_ON(c) assert(!(c))
++#endif
+ 
+ #define WARN_ON(c) BUG_ON(c)
++
++#ifndef BTRFS_DISABLE_BACKTRACE
+ #define	ASSERT(c) assert_trace(#c, __FILE__, __func__, __LINE__, (c))
++#else
++#define ASSERT(c) assert(c)
++#endif
+ 
+ #define container_of(ptr, type, member) ({                      \
+         const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
+-- 
+2.0.4
+
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 154cb98..d0b56cd 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -8,10 +8,11 @@ BTRFS_PROGS_VERSION = 3.16.2
 BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = acl attr e2fsprogs lzo util-linux zlib
+BTRFS_PROGS_MAKE_FLAGS = DISABLE_DOCUMENTATION=1 \
+	$(if $(BR2_TOOLCHAIN_USES_UCLIBC),DISABLE_BACKTRACE=1)
 BTRFS_PROGS_LICENSE = GPLv2
 BTRFS_PROGS_LICENSE_FILES = COPYING
 
-BTRFS_PROGS_MAKE_FLAGS = DISABLE_DOCUMENTATION=1
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 BTRFS_PROGS_MAKE_TARGET = static
