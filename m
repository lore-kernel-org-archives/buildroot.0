From: Will Newton <will.newton@gmail.com>
Date: Sun, 2 Aug 2009 22:25:04 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: Bump version to 20090630.
Message-ID: <20090802202923.C5A8177784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=56fcdc9b6e695170a6fedf5380c3dab7e2c4fb0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #437

- Remove a few obsolete patches.
 - Add a patch to disable syscall tests unsupported by uClibc.
 - Add a patch to fix sched_getaffinity build.

Signed-off-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    1 +
 .../ltp-testsuite-sched-getaffinity.patch          |   11 +++
 .../ltp-testsuite-sh-is-not-C-code.patch           |   11 ---
 .../ltp-testsuite-uclibc-syscalls.patch            |   11 +++
 package/ltp-testsuite/ltp-testsuite.mk             |    5 +-
 package/ltp-testsuite/ltp-testsuite.patch          |   73 --------------------
 6 files changed, 26 insertions(+), 86 deletions(-)
 create mode 100644 package/ltp-testsuite/ltp-testsuite-sched-getaffinity.patch
 delete mode 100644 package/ltp-testsuite/ltp-testsuite-sh-is-not-C-code.patch
 create mode 100644 package/ltp-testsuite/ltp-testsuite-uclibc-syscalls.patch
 delete mode 100644 package/ltp-testsuite/ltp-testsuite.patch

diff --git a/CHANGES b/CHANGES
index 58e5709..0245a95 100644
--- a/CHANGES
+++ b/CHANGES
@@ -45,6 +45,7 @@
 	#419: Bump lighttpd package to 1.4.23
 	#421: toolchain: Clean up toolchain locale support menu
 	#427: webkit: Update to WebKit svn r44552
+	#437: ltp-testsuite: Bump version to 20090630
 	#451: Upgrade from unmaintained dosfstools-2.11 to dosfstools-3.0.3
 	#467: DirectFB 1.4.1
 	#473: memstat_0.5.tar.gz has install with -D and that fails "make"
diff --git a/package/ltp-testsuite/ltp-testsuite-sched-getaffinity.patch b/package/ltp-testsuite/ltp-testsuite-sched-getaffinity.patch
new file mode 100644
index 0000000..9e4a9d8
--- /dev/null
+++ b/package/ltp-testsuite/ltp-testsuite-sched-getaffinity.patch
@@ -0,0 +1,11 @@
+--- ltp-full-20090630/testcases/kernel/syscalls/sched_getaffinity/Makefile	2009-06-15 19:38:04.000000000 +0100
++++ ltp-full-20090630.mod/testcases/kernel/syscalls/sched_getaffinity/Makefile	2009-07-02 15:02:33.000000000 +0100
+@@ -16,7 +16,7 @@
+ #  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ #
+ 
+-CFLAGS += -I../../../../include -Wall
++CFLAGS += -I../../../../include -Wall -D_GNU_SOURCE
+ LDLIBS += -L../../../../lib -lltp
+ 
+ SRCS    = $(wildcard *.c)
diff --git a/package/ltp-testsuite/ltp-testsuite-sh-is-not-C-code.patch b/package/ltp-testsuite/ltp-testsuite-sh-is-not-C-code.patch
deleted file mode 100644
index a6f98ac..0000000
--- a/package/ltp-testsuite/ltp-testsuite-sh-is-not-C-code.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- ltp-full-20061121/IDcheck.sh.orig	2006-12-07 22:31:29.000000000 -0700
-+++ ltp-full-20061121/IDcheck.sh	2006-12-07 22:32:58.000000000 -0700
-@@ -85,7 +85,7 @@
- fi
- 
- whoami | grep root > /dev/null
--if [ $? == "0" ]; then
-+if [ $? = "0" ]; then
-  I_AM_ROOT=1
- fi
- 
diff --git a/package/ltp-testsuite/ltp-testsuite-uclibc-syscalls.patch b/package/ltp-testsuite/ltp-testsuite-uclibc-syscalls.patch
new file mode 100644
index 0000000..866a56c
--- /dev/null
+++ b/package/ltp-testsuite/ltp-testsuite-uclibc-syscalls.patch
@@ -0,0 +1,11 @@
+--- ltp-full-20090630/testcases/kernel/syscalls/Makefile	2009-02-26 11:37:28.000000000 +0000
++++ ltp-full-20090630.mod/testcases/kernel/syscalls/Makefile	2009-07-02 14:57:30.000000000 +0100
+@@ -25,7 +25,7 @@
+ #
+ # Commented this out since there are directories here we don't want built by default
+ #
+-SUBDIR = `ls */Makefile | sed "s/Makefile//g"` 
++SUBDIR = `ls */Makefile | sed "s/Makefile//g" | grep -vE "^clock_nanosleep|quotactl|sched_getaffinity|sigreturn|unshare"` 
+ UCLINUX_SUBDIR = `ls */Makefile | sed "s/Makefile//g" | grep -vE "^fork|epoll|capget|capset|chmod|chown|llseek|nftw|clone|profil|getcontext|remap_file_pages"`
+ 
+ all:
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 1789832..7cb51c2 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -3,7 +3,7 @@
 # ltp-testsuite
 #
 #############################################################
-LTP_TESTSUITE_VERSION:=20070228
+LTP_TESTSUITE_VERSION:=20090630
 LTP_TESTSUITE_SOURCE:=ltp-full-$(LTP_TESTSUITE_VERSION).tgz
 LTP_TESTSUITE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ltp
 LTP_TESTSUITE_CAT:=$(ZCAT)
@@ -15,7 +15,8 @@ LTP_TESTSUITE_DIR:=$(LTP_TESTSUITE_ROOT)/ltp-full-$(LTP_TESTSUITE_VERSION)
 #
 LTP_PATCHES:=ltp-testsuite-generate-needs-bash.patch \
 	     ltp-testsuite-sh-is-not-C-code.patch \
-	     ltp-testsuite.patch
+	     ltp-testsuite-sched-getaffinity.patch \
+	     ltp-testsuite-uclibc-syscalls.patch
 
 ifeq ($(BR2_PTHREADS_NATIVE),y)
 LTP_PATCHES+=ltp-testsuite-enable-openposix-for-nptl.patch
diff --git a/package/ltp-testsuite/ltp-testsuite.patch b/package/ltp-testsuite/ltp-testsuite.patch
deleted file mode 100644
index ce6cff3..0000000
--- a/package/ltp-testsuite/ltp-testsuite.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-diff -ur ltp-full-20061121/testcases/kernel/syscalls/fmtmsg/Makefile ltp-full-20061121-patched/testcases/kernel/syscalls/fmtmsg/Makefile
---- ltp-full-20061121/testcases/kernel/syscalls/fmtmsg/Makefile	2006-11-21 14:31:28.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/syscalls/fmtmsg/Makefile	2006-12-02 00:16:36.830948316 -0600
-@@ -20,7 +20,7 @@
- LDLIBS += -L../../../../lib -lltp
- 
- SRCS    = $(wildcard *.c)
--TARGETS = $(patsubst %.c,%,$(SRCS))
-+TARGETS =#$(patsubst %.c,%,$(SRCS))
- 
- all: $(TARGETS)
- 
-diff -ur ltp-full-20061121/testcases/kernel/syscalls/getcontext/Makefile ltp-full-20061121-patched/testcases/kernel/syscalls/getcontext/Makefile
---- ltp-full-20061121/testcases/kernel/syscalls/getcontext/Makefile	2006-11-21 14:31:27.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/syscalls/getcontext/Makefile	2006-12-02 00:16:50.072004501 -0600
-@@ -20,7 +20,7 @@
- LDLIBS += -L../../../../lib -lltp
- 
- SRCS    = $(wildcard *.c)
--TARGETS = $(patsubst %.c,%,$(SRCS))
-+TARGETS =#$(patsubst %.c,%,$(SRCS))
- 
- all: $(TARGETS)
- 
-diff -ur ltp-full-20061121/testcases/kernel/syscalls/profil/Makefile ltp-full-20061121-patched/testcases/kernel/syscalls/profil/Makefile
---- ltp-full-20061121/testcases/kernel/syscalls/profil/Makefile	2006-11-21 14:31:28.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/syscalls/profil/Makefile	2006-12-02 00:17:03.301059744 -0600
-@@ -20,7 +20,7 @@
- LDLIBS += -L../../../../lib -lltp
- 
- SRCS    = $(wildcard *.c)
--TARGETS = $(patsubst %.c,%,$(SRCS))
-+TARGETS =#$(patsubst %.c,%,$(SRCS))
- 
- all: $(TARGETS)
- 
-diff -ur ltp-full-20061121/testcases/kernel/syscalls/pselect/Makefile ltp-full-20061121-patched/testcases/kernel/syscalls/pselect/Makefile
---- ltp-full-20061121/testcases/kernel/syscalls/pselect/Makefile	2006-11-21 14:31:29.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/syscalls/pselect/Makefile	2006-12-02 00:17:14.661965984 -0600
-@@ -20,7 +20,7 @@
- LDLIBS += -L../../../../lib -lltp
- 
- SRCS    = $(wildcard *.c)
--TARGETS = $(patsubst %.c,%,$(SRCS))
-+TARGETS =#$(patsubst %.c,%,$(SRCS))
- 
- all: $(TARGETS)
- 
-diff -ur ltp-full-20061121/testcases/kernel/syscalls/swapon/swapon02.c ltp-full-20061121-patched/testcases/kernel/syscalls/swapon/swapon02.c
---- ltp-full-20061121/testcases/kernel/syscalls/swapon/swapon02.c	2006-11-21 14:31:29.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/syscalls/swapon/swapon02.c	2006-12-02 00:18:12.422573631 -0600
-@@ -85,9 +85,7 @@
- #include <sys/wait.h>
- #include <sys/stat.h>
- #include <sys/swap.h>
--#ifdef OLDER_DISTRO_RELEASE
--#include <linux/swap.h>
--#endif
-+#define MAX_SWAPFILES 32
- #include <fcntl.h>
- #include <pwd.h>
- #include <string.h>
-@@ -96,10 +94,6 @@
- #include "test.h"
- #include "usctest.h"
- 
--#ifndef OLDER_DISTRO_RELEASE
--#define MAX_SWAPFILES 32 
--#endif
--
- static void setup();
- static void cleanup();
- static int setup01();
-- 
1.6.3.3
