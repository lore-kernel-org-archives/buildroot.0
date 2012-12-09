From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  9 Dec 2012 10:57:36 -0300
Subject: [Buildroot] [PATCH] ltrace: bump to version 0.7.2
Message-ID: <1355061456-7191-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump ltrace to version 0.7.2 which includes my ppc fixup patch.
Also exclude aarch64 since it's not supported, fixes
http://autobuild.buildroot.net/results/8fc3a3720d9be2525784b0488653b4fdbb29e676/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ltrace/Config.in                   |    1 +
 package/ltrace/ltrace-ppc-waitstatus.patch |   37 ----------------------------
 package/ltrace/ltrace.mk                   |    2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/ltrace/ltrace-ppc-waitstatus.patch

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 9fd9aaa..c77108f 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
 	depends on !(BR2_avr32 || BR2_mips || BR2_sh || BR2_sh64 || BR2_xtensa)
+	depends on !BR2_aarch64
 	select BR2_PACKAGE_LIBELF
 	help
 	  Debugging program which runs a specified command until it exits.
diff --git a/package/ltrace/ltrace-ppc-waitstatus.patch b/package/ltrace/ltrace-ppc-waitstatus.patch
deleted file mode 100644
index fa87ea4..0000000
--- a/package/ltrace/ltrace-ppc-waitstatus.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From faa8dfe0507b56fb8a7666e326177aec7f364071 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 3 Dec 2012 11:12:08 -0300
-Subject: [PATCH] Fix build failure on ppc
-
-ppc/trace.c is using waitstatus bits without including the appropiate
-headers, leading to a build failure:
-
-libtool: link:
-/home/gustavoz/b/test/output/host/usr/bin/powerpc-buildroot-linux-uclibc-gcc
--Wall -Wsign-compare -Wfloat-equal -Wformat-security -pipe -Os -o ltrace
-main.o  ./.libs/libltrace.a -lelf
-./.libs/libltrace.a(lt1-trace.o): In function `syscall_p':
-trace.c:(.text+0x28): undefined reference to `WIFSTOPPED'
-trace.c:(.text+0x40): undefined reference to `WSTOPSIG'
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- sysdeps/linux-gnu/ppc/trace.c |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
-
-diff --git a/sysdeps/linux-gnu/ppc/trace.c b/sysdeps/linux-gnu/ppc/trace.c
-index c152101..4357a1e 100644
---- a/sysdeps/linux-gnu/ppc/trace.c
-+++ b/sysdeps/linux-gnu/ppc/trace.c
-@@ -29,6 +29,8 @@
- #include <errno.h>
- #include <signal.h>
- #include <string.h>
-+#include <sys/types.h>
-+#include <sys/wait.h>
- 
- #include "backend.h"
- #include "breakpoint.h"
--- 
-1.7.8.6
-
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index ca6d621..4b31690 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LTRACE_VERSION = 0.7.1
+LTRACE_VERSION = 0.7.2
 LTRACE_SITE = http://alioth.debian.org/frs/download.php/3844
 LTRACE_SOURCE = ltrace-$(LTRACE_VERSION).tar.bz2
 LTRACE_DEPENDENCIES = libelf
-- 
1.7.8.6
