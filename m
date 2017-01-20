From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 15:46:27 +0100
Subject: [Buildroot] [PATCH] busybox: bump version to 1.26.2
Message-ID: <20170120144627.10087-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And drop patches now upstream.  Also enable internal glob() handling in ash,
as busybox now errors out if this isn't enabled when building for uClibc
because of bugs in the the glob(3) implementation in uClibc and musl since:

commit 3a4cdf45f928de0af09088bbbb96f60d9ac44e87
Author: Denys Vlasenko <vda.linux@googlemail.com>
Date:   Wed Dec 21 04:13:23 2016 +0100

    ash: error out if ASH_INTERNAL_GLOB is not selected on uClibc

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...odutils-remove-special-handling-of-uClibc.patch | 76 ----------------------
 ...ependency-for-IFUPDOWN_UDHCPC_CMD_OPTIONS.patch | 36 ----------
 package/busybox/busybox.config                     |  2 +-
 package/busybox/busybox.hash                       |  6 +-
 package/busybox/busybox.mk                         |  2 +-
 5 files changed, 5 insertions(+), 117 deletions(-)
 delete mode 100644 package/busybox/0003-modutils-remove-special-handling-of-uClibc.patch
 delete mode 100644 package/busybox/0004-Fix-dependency-for-IFUPDOWN_UDHCPC_CMD_OPTIONS.patch

diff --git a/package/busybox/0003-modutils-remove-special-handling-of-uClibc.patch b/package/busybox/0003-modutils-remove-special-handling-of-uClibc.patch
deleted file mode 100644
index 49ccb8ff4..000000000
--- a/package/busybox/0003-modutils-remove-special-handling-of-uClibc.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 7cf41b6e281c42fb7f2117927a8ff7f476103e76 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sun, 25 Dec 2016 16:53:32 +0100
-Subject: [PATCH] modutils: remove special handling of uClibc
-
-Commit 3a45b87ac36f (modutils: support finit_module syscall) introduced
-macro finit_module. But it is not defined for uClibc.
-
-The compilation for busybox fails for MIPS with:
-With uClibc, we get following build errors:
-
-  modutils/lib.a(modutils.o): In function `bb_init_module':
-  modutils.c:(.text.bb_init_module+0x94): undefined reference to `finit_module'
-  modutils.c:(.text.bb_init_module+0xa0): undefined reference to `finit_module'
-
-We can just use syscall() without any need for the
-uClibc wrappers.
-
-Newer versions of uClibc-ng (>1.0.20) will remove the
-module syscall wrappers.
-
-Found via Buildroot autobuilders:
-http://autobuild.buildroot.net/results/556/55655daef23788fb3967f801ec8b79e9bed7122b/build-end.log
-
-Reported-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- modutils/modprobe-small.c |  4 ++--
- modutils/modutils.c       | 15 +++++----------
- 2 files changed, 7 insertions(+), 12 deletions(-)
-
-diff --git a/modutils/modprobe-small.c b/modutils/modprobe-small.c
-index 652ff4d..0fc9ea4 100644
---- a/modutils/modprobe-small.c
-+++ b/modutils/modprobe-small.c
-@@ -39,8 +39,8 @@
- #include <fnmatch.h>
- #include <sys/syscall.h>
- 
--extern int init_module(void *module, unsigned long len, const char *options);
--extern int delete_module(const char *module, unsigned flags);
-+#define init_module(mod, len, opts) syscall(__NR_init_module, mod, len, opts)
-+#define delete_module(mod, flags) syscall(__NR_delete_module, mod, flags)
- #ifdef __NR_finit_module
- # define finit_module(fd, uargs, flags) syscall(__NR_finit_module, fd, uargs, flags)
- #endif
-diff --git a/modutils/modutils.c b/modutils/modutils.c
-index d36caaf..d56bfc8 100644
---- a/modutils/modutils.c
-+++ b/modutils/modutils.c
-@@ -7,17 +7,12 @@
-  */
- #include "modutils.h"
- 
--#ifdef __UCLIBC__
--extern int init_module(void *module, unsigned long len, const char *options);
--extern int delete_module(const char *module, unsigned int flags);
--#else
--# include <sys/syscall.h>
--# define init_module(mod, len, opts) syscall(__NR_init_module, mod, len, opts)
--# if defined(__NR_finit_module)
--#  define finit_module(fd, uargs, flags) syscall(__NR_finit_module, fd, uargs, flags)
--# endif
--# define delete_module(mod, flags) syscall(__NR_delete_module, mod, flags)
-+#include <sys/syscall.h>
-+#define init_module(mod, len, opts) syscall(__NR_init_module, mod, len, opts)
-+#if defined(__NR_finit_module)
-+# define finit_module(fd, uargs, flags) syscall(__NR_finit_module, fd, uargs, flags)
- #endif
-+#define delete_module(mod, flags) syscall(__NR_delete_module, mod, flags)
- 
- static module_entry *helper_get_module(module_db *db, const char *module, int create)
- {
--- 
-2.1.4
-
diff --git a/package/busybox/0004-Fix-dependency-for-IFUPDOWN_UDHCPC_CMD_OPTIONS.patch b/package/busybox/0004-Fix-dependency-for-IFUPDOWN_UDHCPC_CMD_OPTIONS.patch
deleted file mode 100644
index 35e4e45c6..000000000
--- a/package/busybox/0004-Fix-dependency-for-IFUPDOWN_UDHCPC_CMD_OPTIONS.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9c0b06bfbb05c40ba31bad8aa469aa2330620e9e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Thu, 29 Dec 2016 18:41:21 +0100
-Subject: [PATCH] Fix dependency for IFUPDOWN_UDHCPC_CMD_OPTIONS
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Commit a8c696bf09d8151323f6e99348c4bc8989f829c8 makes ifup and ifdown
-individually selectable, but forgets to update the dependency to
-IFUPDOWN_UDHCPC_CMD_OPTIONS, so it is not selectable anymore.
-
-This patch fixes the dependency by checking for IFUP or IFDOWN, instead
-of the obsolete IFUPDOWN.
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- networking/Config.src | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/networking/Config.src b/networking/Config.src
-index 527bdd15d..a3d895b5f 100644
---- a/networking/Config.src
-+++ b/networking/Config.src
-@@ -53,7 +53,7 @@ source networking/udhcp/Config.in
- config IFUPDOWN_UDHCPC_CMD_OPTIONS
- 	string "ifup udhcpc command line options"
- 	default "-R -n"
--	depends on IFUPDOWN && UDHCPC
-+	depends on (IFUP || IFDOWN) && UDHCPC
- 	help
- 	  Command line options to pass to udhcpc from ifup.
- 	  Intended to alter options not available in /etc/network/interfaces.
--- 
-2.11.0
-
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index a8926d796..c45de2180 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1032,7 +1032,7 @@ CONFIG_SVC=y
 #
 CONFIG_ASH=y
 CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
-# CONFIG_ASH_INTERNAL_GLOB is not set
+CONFIG_ASH_INTERNAL_GLOB=y
 CONFIG_ASH_RANDOM_SUPPORT=y
 CONFIG_ASH_EXPAND_PRMT=y
 CONFIG_ASH_BASH_COMPAT=y
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index b6f9fedd7..d73f8d546 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From http://busybox.net/downloads/busybox-1.26.0.tar.bz2.sign
-md5	362acc60bd94343aa36d98beb1f0831f	busybox-1.26.0.tar.bz2
-sha1	7e3a85b698c4d74f5fa374d3f3774b064053ae17	busybox-1.26.0.tar.bz2
+# From https://busybox.net/downloads/busybox-1.26.2.tar.bz2.sign
+md5	bb59d25ee2643db20f212eec539429f1	busybox-1.26.2.tar.bz2
+sha1	0b3e3cd49d6d9e30f66e364bf842663348b23dc9	busybox-1.26.2.tar.bz2
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 40fb4d96a..577f2f247 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.26.0
+BUSYBOX_VERSION = 1.26.2
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
-- 
2.11.0
