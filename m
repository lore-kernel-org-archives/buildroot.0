From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 26 Dec 2016 20:28:23 +0100
Subject: [Buildroot] [PATCH] busybox: fix modutils compile
Message-ID: <20161226192823.GA11664@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not use syscall wrappers from uClibc.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...odutils-remove-special-handling-of-uClibc.patch | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 package/busybox/0003-modutils-remove-special-handling-of-uClibc.patch

diff --git a/package/busybox/0003-modutils-remove-special-handling-of-uClibc.patch b/package/busybox/0003-modutils-remove-special-handling-of-uClibc.patch
new file mode 100644
index 0000000..49ccb8f
--- /dev/null
+++ b/package/busybox/0003-modutils-remove-special-handling-of-uClibc.patch
@@ -0,0 +1,76 @@
+From 7cf41b6e281c42fb7f2117927a8ff7f476103e76 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sun, 25 Dec 2016 16:53:32 +0100
+Subject: [PATCH] modutils: remove special handling of uClibc
+
+Commit 3a45b87ac36f (modutils: support finit_module syscall) introduced
+macro finit_module. But it is not defined for uClibc.
+
+The compilation for busybox fails for MIPS with:
+With uClibc, we get following build errors:
+
+  modutils/lib.a(modutils.o): In function `bb_init_module':
+  modutils.c:(.text.bb_init_module+0x94): undefined reference to `finit_module'
+  modutils.c:(.text.bb_init_module+0xa0): undefined reference to `finit_module'
+
+We can just use syscall() without any need for the
+uClibc wrappers.
+
+Newer versions of uClibc-ng (>1.0.20) will remove the
+module syscall wrappers.
+
+Found via Buildroot autobuilders:
+http://autobuild.buildroot.net/results/556/55655daef23788fb3967f801ec8b79e9bed7122b/build-end.log
+
+Reported-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ modutils/modprobe-small.c |  4 ++--
+ modutils/modutils.c       | 15 +++++----------
+ 2 files changed, 7 insertions(+), 12 deletions(-)
+
+diff --git a/modutils/modprobe-small.c b/modutils/modprobe-small.c
+index 652ff4d..0fc9ea4 100644
+--- a/modutils/modprobe-small.c
++++ b/modutils/modprobe-small.c
+@@ -39,8 +39,8 @@
+ #include <fnmatch.h>
+ #include <sys/syscall.h>
+ 
+-extern int init_module(void *module, unsigned long len, const char *options);
+-extern int delete_module(const char *module, unsigned flags);
++#define init_module(mod, len, opts) syscall(__NR_init_module, mod, len, opts)
++#define delete_module(mod, flags) syscall(__NR_delete_module, mod, flags)
+ #ifdef __NR_finit_module
+ # define finit_module(fd, uargs, flags) syscall(__NR_finit_module, fd, uargs, flags)
+ #endif
+diff --git a/modutils/modutils.c b/modutils/modutils.c
+index d36caaf..d56bfc8 100644
+--- a/modutils/modutils.c
++++ b/modutils/modutils.c
+@@ -7,17 +7,12 @@
+  */
+ #include "modutils.h"
+ 
+-#ifdef __UCLIBC__
+-extern int init_module(void *module, unsigned long len, const char *options);
+-extern int delete_module(const char *module, unsigned int flags);
+-#else
+-# include <sys/syscall.h>
+-# define init_module(mod, len, opts) syscall(__NR_init_module, mod, len, opts)
+-# if defined(__NR_finit_module)
+-#  define finit_module(fd, uargs, flags) syscall(__NR_finit_module, fd, uargs, flags)
+-# endif
+-# define delete_module(mod, flags) syscall(__NR_delete_module, mod, flags)
++#include <sys/syscall.h>
++#define init_module(mod, len, opts) syscall(__NR_init_module, mod, len, opts)
++#if defined(__NR_finit_module)
++# define finit_module(fd, uargs, flags) syscall(__NR_finit_module, fd, uargs, flags)
+ #endif
++#define delete_module(mod, flags) syscall(__NR_delete_module, mod, flags)
+ 
+ static module_entry *helper_get_module(module_db *db, const char *module, int create)
+ {
+-- 
+2.1.4
+
-- 
2.1.4
