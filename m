From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 21:18:44 +0200
Subject: [Buildroot] [git commit] connman: bump to version 1.32
Message-ID: <20160419191848.DAC1B81E38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba22728c56c420c0de891cbd4777cde910dcb0bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches and add a new build fix (submitted upstream).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-configure-check-for-execinfo.h.patch      | 65 ----------------------
 .../{0003-xtables.patch => 0001-xtables.patch}     |  0
 ...ion-item-of-xtables-to-match-iptables-1.6.patch | 38 -------------
 package/connman/0002-nat-build-failure.patch       | 30 ++++++++++
 package/connman/connman.hash                       |  2 +-
 package/connman/connman.mk                         |  2 +-
 6 files changed, 32 insertions(+), 105 deletions(-)

diff --git a/package/connman/0001-configure-check-for-execinfo.h.patch b/package/connman/0001-configure-check-for-execinfo.h.patch
deleted file mode 100644
index 384f41b..0000000
--- a/package/connman/0001-configure-check-for-execinfo.h.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 30642d5b1a3f479987c4d50a237311d84d5f0581 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Thu, 24 Dec 2015 12:04:57 +0100
-Subject: [PATCH] configure: check for execinfo.h
-
-Not all toolchains have execinfo.h. For example, support for it is
-optional in uClibc, while it is entirely missing from musl.
-
-Add a check in configure to look for it.
-
-Since execinfo.h is /only/ used to dump a backtrace in case of failure,
-just do nothing when execinfo.h is missing.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- configure.ac | 2 ++
- src/log.c    | 4 ++++
- 2 files changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index b51d6b3..28e657b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -182,6 +182,8 @@ AC_CHECK_LIB(resolv, ns_initparse, dummy=yes, [
- 		AC_MSG_ERROR(resolver library support is required))
- ])
- 
-+AC_CHECK_HEADERS([execinfo.h])
-+
- AC_CHECK_FUNC(signalfd, dummy=yes,
- 			AC_MSG_ERROR(signalfd support is required))
- 
-diff --git a/src/log.c b/src/log.c
-index a693bd0..76e10e7 100644
---- a/src/log.c
-+++ b/src/log.c
-@@ -30,7 +30,9 @@
- #include <stdlib.h>
- #include <string.h>
- #include <syslog.h>
-+#if defined(HAVE_EXECINFO_H)
- #include <execinfo.h>
-+#endif
- #include <dlfcn.h>
- 
- #include "connman.h"
-@@ -112,6 +114,7 @@ void connman_debug(const char *format, ...)
- 
- static void print_backtrace(unsigned int offset)
- {
-+#if defined(HAVE_EXECINFO_H)
- 	void *frames[99];
- 	size_t n_ptrs;
- 	unsigned int i;
-@@ -210,6 +213,7 @@ static void print_backtrace(unsigned int offset)
- 
- 	close(outfd[1]);
- 	close(infd[0]);
-+#endif /* HAVE_EXECINFO_H */
- }
- 
- static void signal_handler(int signo)
--- 
-1.9.1
-
diff --git a/package/connman/0003-xtables.patch b/package/connman/0001-xtables.patch
similarity index 100%
rename from package/connman/0003-xtables.patch
rename to package/connman/0001-xtables.patch
diff --git a/package/connman/0002-iptables-Add-missing-function-item-of-xtables-to-match-iptables-1.6.patch b/package/connman/0002-iptables-Add-missing-function-item-of-xtables-to-match-iptables-1.6.patch
deleted file mode 100644
index 75bf373..0000000
--- a/package/connman/0002-iptables-Add-missing-function-item-of-xtables-to-match-iptables-1.6.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From acea08a0e4234a4c1a87bedc087c73ff36de0c7b Mon Sep 17 00:00:00 2001
-From: Wu Zheng <wu.zheng@intel.com>
-Date: Thu, 28 Jan 2016 18:04:17 +0800
-Subject: iptables: Add missing function item of xtables to match iptables 1.6
-
-The struct of xtables_globals has been modified in iptables 1.6.
-If connman runs with iptables 1.6, it can crash.
-
-Program received signal SIGSEGV, Segmentation fault.
-0x00000000 in ?? ()
-0xb7dea89c in xtables_find_target () from /usr/lib/libxtables.so.11
-0xb7deac1c in ?? () from /usr/lib/libxtables.so.11
-0xb7dea793 in xtables_find_target () from /usr/lib/libxtables.so.11
-
-The the missing function item of xtables is added to xtables_globals.
-
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- src/iptables.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/iptables.c b/src/iptables.c
-index bc0c763..5ef757a 100644
---- a/src/iptables.c
-+++ b/src/iptables.c
-@@ -1566,6 +1566,9 @@ struct xtables_globals iptables_globals = {
- 	.option_offset = 0,
- 	.opts = iptables_opts,
- 	.orig_opts = iptables_opts,
-+#if XTABLES_VERSION_CODE > 10
-+	.compat_rev = xtables_compatible_revision,
-+#endif
- };
- 
- static struct xtables_target *prepare_target(struct connman_iptables *table,
--- 
-cgit v0.12
-
diff --git a/package/connman/0002-nat-build-failure.patch b/package/connman/0002-nat-build-failure.patch
new file mode 100644
index 0000000..0ab5850
--- /dev/null
+++ b/package/connman/0002-nat-build-failure.patch
@@ -0,0 +1,30 @@
+From 68f4b4f5b220f256b17ad2f084d61fe89f3632ae Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 19 Apr 2016 08:38:38 -0300
+Subject: [PATCH] nat: fix build failure
+
+_GNU_SOURCE needs to be defined so that O_CLOEXEC symbols can be found in
+system header files.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: submitted upstream
+
+ src/nat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/nat.c b/src/nat.c
+index 33ae6df..62e21d4 100644
+--- a/src/nat.c
++++ b/src/nat.c
+@@ -24,6 +24,7 @@
+ #include <config.h>
+ #endif
+ 
++#define _GNU_SOURCE
+ #include <errno.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+-- 
+2.7.3
+
diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index 4810f81..e0bb483 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256	88fcf0b6df334796b90e2fd2e434d6f5b36cd6f13b886a119b8c90276b72b8e2  connman-1.31.tar.xz
+sha256	3185864c73206a6033d12e9f583689dcd03f714a40a58333709d3f74a4e0934c	connman-1.32.tar.xz
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 1fe103c..d21284b 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.31
+CONNMAN_VERSION = 1.32
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
