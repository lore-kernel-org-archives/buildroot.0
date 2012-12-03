From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Dec 2012 11:46:12 -0300
Subject: [Buildroot] [PATCH 14/14] ltrace: bump to version 0.7.1
In-Reply-To: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1354545972-26783-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ltrace/Config.in                           |    3 +-
 ...nning-in-ARM-arch_-dis-en-able_breakpoint.patch |   67 --------------------
 package/ltrace/ltrace-0.6.0-uclibc.patch           |   22 -------
 ...race-0.6.0-events.patch => ltrace-events.patch} |    0
 package/ltrace/ltrace-ppc-waitstatus.patch         |   37 +++++++++++
 package/ltrace/ltrace-uclibc.patch                 |   20 ++++++
 package/ltrace/ltrace.mk                           |   12 +++-
 7 files changed, 66 insertions(+), 95 deletions(-)
 delete mode 100644 package/ltrace/ltrace-0.6.0-fix-type-punning-in-ARM-arch_-dis-en-able_breakpoint.patch
 delete mode 100644 package/ltrace/ltrace-0.6.0-uclibc.patch
 rename package/ltrace/{ltrace-0.6.0-events.patch => ltrace-events.patch} (100%)
 create mode 100644 package/ltrace/ltrace-ppc-waitstatus.patch
 create mode 100644 package/ltrace/ltrace-uclibc.patch

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 4cce767..9fd9aaa 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
-	depends on !(BR2_avr32 || BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64)
-	depends on !BR2_xtensa
+	depends on !(BR2_avr32 || BR2_mips || BR2_sh || BR2_sh64 || BR2_xtensa)
 	select BR2_PACKAGE_LIBELF
 	help
 	  Debugging program which runs a specified command until it exits.
diff --git a/package/ltrace/ltrace-0.6.0-fix-type-punning-in-ARM-arch_-dis-en-able_breakpoint.patch b/package/ltrace/ltrace-0.6.0-fix-type-punning-in-ARM-arch_-dis-en-able_breakpoint.patch
deleted file mode 100644
index c005932..0000000
--- a/package/ltrace/ltrace-0.6.0-fix-type-punning-in-ARM-arch_-dis-en-able_breakpoint.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From c46448f4e5a4c124fbc75ca9b14697212e676893 Mon Sep 17 00:00:00 2001
-From: Michael K. Edwards <m.k.edwards@gmail.com>
-Date: Mon, 7 Mar 2011 16:15:48 +0000
-Subject: [PATCH] fix type punning in ARM arch_(dis|en)able_breakpoint
-
----
- sysdeps/linux-gnu/arm/breakpoint.c |   26 ++++++++++++++++++--------
- 1 files changed, 18 insertions(+), 8 deletions(-)
-
-diff --git a/sysdeps/linux-gnu/arm/breakpoint.c b/sysdeps/linux-gnu/arm/breakpoint.c
-index 4a5ab92..4e17940 100644
---- a/sysdeps/linux-gnu/arm/breakpoint.c
-+++ b/sysdeps/linux-gnu/arm/breakpoint.c
-@@ -35,10 +35,15 @@ arch_enable_breakpoint(pid_t pid, Breakpoint *sbp) {
- 	debug(1, "arch_enable_breakpoint(%d,%p)", pid, sbp->addr);
- 
- 	for (i = 0; i < 1 + ((BREAKPOINT_LENGTH - 1) / sizeof(long)); i++) {
--		long a = ptrace(PTRACE_PEEKTEXT, pid, sbp->addr + i * sizeof(long), 0);
--		unsigned char *bytes = (unsigned char *)&a;
-+		union _ { long l; unsigned char b[SIZEOF_LONG]; };
-+		union _ orig, current;
-+		unsigned char *bytes = current.b;
-+		for (j = 0; j < sizeof(long); j++) {
-+			orig.b[j] = sbp->orig_value[i * sizeof(long) + j];
-+		}
-+		current.l = ptrace(PTRACE_PEEKTEXT, pid, sbp->addr + i * sizeof(long), 0);
- 
--		debug(2, "current = 0x%lx, orig_value = 0x%lx, thumb_mode = %d", a, *(long *)&sbp->orig_value, sbp->thumb_mode);
-+		debug(2, "current = 0x%lx, orig_value = 0x%lx, thumb_mode = %d", current.l, orig.l, sbp->thumb_mode);
- 		for (j = 0; j < sizeof(long) && i * sizeof(long) + j < BREAKPOINT_LENGTH; j++) {
- 
- 			sbp->orig_value[i * sizeof(long) + j] = bytes[j];
-@@ -49,7 +54,7 @@ arch_enable_breakpoint(pid_t pid, Breakpoint *sbp) {
- 				bytes[j] = thumb_break_insn[i * sizeof(long) + j];
- 			}
- 		}
--		ptrace(PTRACE_POKETEXT, pid, sbp->addr + i * sizeof(long), a);
-+		ptrace(PTRACE_POKETEXT, pid, sbp->addr + i * sizeof(long), current.l);
- 	}
- }
- 
-@@ -60,13 +65,18 @@ arch_disable_breakpoint(pid_t pid, const Breakpoint *sbp) {
- 	debug(1, "arch_disable_breakpoint(%d,%p)", pid, sbp->addr);
- 
- 	for (i = 0; i < 1 + ((BREAKPOINT_LENGTH - 1) / sizeof(long)); i++) {
--		long a = ptrace(PTRACE_PEEKTEXT, pid, sbp->addr + i * sizeof(long), 0);
--		unsigned char *bytes = (unsigned char *)&a;
-+		union _ { long l; unsigned char b[SIZEOF_LONG]; };
-+		union _ orig, current;
-+		unsigned char *bytes = current.b;
-+		for (j = 0; j < sizeof(long); j++) {
-+			orig.b[j] = sbp->orig_value[i * sizeof(long) + j];
-+		}
-+		current.l = ptrace(PTRACE_PEEKTEXT, pid, sbp->addr + i * sizeof(long), 0);
- 
--		debug(2, "current = 0x%lx, orig_value = 0x%lx, thumb_mode = %d", a, *(long *)&sbp->orig_value, sbp->thumb_mode);
-+		debug(2, "current = 0x%lx, orig_value = 0x%lx, thumb_mode = %d", current.l, orig.l, sbp->thumb_mode);
- 		for (j = 0; j < sizeof(long) && i * sizeof(long) + j < BREAKPOINT_LENGTH; j++) {
- 			bytes[j] = sbp->orig_value[i * sizeof(long) + j];
- 		}
--		ptrace(PTRACE_POKETEXT, pid, sbp->addr + i * sizeof(long), a);
-+		ptrace(PTRACE_POKETEXT, pid, sbp->addr + i * sizeof(long), current.l);
- 	}
- }
--- 
-1.7.4.1
-
diff --git a/package/ltrace/ltrace-0.6.0-uclibc.patch b/package/ltrace/ltrace-0.6.0-uclibc.patch
deleted file mode 100644
index 8bec2ae..0000000
--- a/package/ltrace/ltrace-0.6.0-uclibc.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-[PATCH] configure.ac: Recognize linux-uclibc as well
-
-Ltrace works on uClibc as well as on glibc, so accept it.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: ltrace-0.6.0/configure.ac
-===================================================================
---- ltrace-0.6.0.orig/configure.ac
-+++ ltrace-0.6.0/configure.ac
-@@ -11,7 +11,7 @@
- AC_CANONICAL_HOST
- 
- case "${host_os}" in
--    linux-gnu*)	HOST_OS="linux-gnu" ;;
-+    linux-gnu* | linux-uclibc*)	HOST_OS="linux-gnu" ;;
-     *)		AC_MSG_ERROR([unkown host-os ${host_osx}]) ;;
- esac
- AC_SUBST(HOST_OS)
diff --git a/package/ltrace/ltrace-0.6.0-events.patch b/package/ltrace/ltrace-events.patch
similarity index 100%
rename from package/ltrace/ltrace-0.6.0-events.patch
rename to package/ltrace/ltrace-events.patch
diff --git a/package/ltrace/ltrace-ppc-waitstatus.patch b/package/ltrace/ltrace-ppc-waitstatus.patch
new file mode 100644
index 0000000..fa87ea4
--- /dev/null
+++ b/package/ltrace/ltrace-ppc-waitstatus.patch
@@ -0,0 +1,37 @@
+From faa8dfe0507b56fb8a7666e326177aec7f364071 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 3 Dec 2012 11:12:08 -0300
+Subject: [PATCH] Fix build failure on ppc
+
+ppc/trace.c is using waitstatus bits without including the appropiate
+headers, leading to a build failure:
+
+libtool: link:
+/home/gustavoz/b/test/output/host/usr/bin/powerpc-buildroot-linux-uclibc-gcc
+-Wall -Wsign-compare -Wfloat-equal -Wformat-security -pipe -Os -o ltrace
+main.o  ./.libs/libltrace.a -lelf
+./.libs/libltrace.a(lt1-trace.o): In function `syscall_p':
+trace.c:(.text+0x28): undefined reference to `WIFSTOPPED'
+trace.c:(.text+0x40): undefined reference to `WSTOPSIG'
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ sysdeps/linux-gnu/ppc/trace.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/sysdeps/linux-gnu/ppc/trace.c b/sysdeps/linux-gnu/ppc/trace.c
+index c152101..4357a1e 100644
+--- a/sysdeps/linux-gnu/ppc/trace.c
++++ b/sysdeps/linux-gnu/ppc/trace.c
+@@ -29,6 +29,8 @@
+ #include <errno.h>
+ #include <signal.h>
+ #include <string.h>
++#include <sys/types.h>
++#include <sys/wait.h>
+ 
+ #include "backend.h"
+ #include "breakpoint.h"
+-- 
+1.7.8.6
+
diff --git a/package/ltrace/ltrace-uclibc.patch b/package/ltrace/ltrace-uclibc.patch
new file mode 100644
index 0000000..c1041fb
--- /dev/null
+++ b/package/ltrace/ltrace-uclibc.patch
@@ -0,0 +1,20 @@
+[PATCH] configure.ac: Recognize linux-uclibc as well
+
+Ltrace works on uClibc as well as on glibc, so accept it.
+
+[Gustavo: update for ltrace 0.7.1]
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura ltrace-0.7.1.orig/configure.ac ltrace-0.7.1/configure.ac
+--- ltrace-0.7.1.orig/configure.ac	2012-12-03 09:02:32.995352741 -0300
++++ ltrace-0.7.1/configure.ac	2012-12-03 09:02:56.579096389 -0300
+@@ -32,7 +32,7 @@
+ AC_CANONICAL_HOST
+ 
+ case "${host_os}" in
+-    linux-gnu*)	HOST_OS="linux-gnu" ;;
++    linux-gnu* | linux-uclibc*)	HOST_OS="linux-gnu" ;;
+     *)		AC_MSG_ERROR([unkown host-os ${host_os}]) ;;
+ esac
+ AC_SUBST(HOST_OS)
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 0e684fb..ca6d621 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -3,10 +3,14 @@
 # ltrace
 #
 #############################################################
-LTRACE_VERSION      = 0.6.0
-LTRACE_SITE         = git://anonscm.debian.org/collab-maint/ltrace.git
+
+LTRACE_VERSION = 0.7.1
+LTRACE_SITE = http://alioth.debian.org/frs/download.php/3844
+LTRACE_SOURCE = ltrace-$(LTRACE_VERSION).tar.bz2
 LTRACE_DEPENDENCIES = libelf
-LTRACE_AUTORECONF   = YES
-LTRACE_CONF_OPT     += --disable-werror
+LTRACE_AUTORECONF = YES
+LTRACE_CONF_OPT = --disable-werror
+LTRACE_LICENSE = GPLv2
+LTRACE_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.8.6
