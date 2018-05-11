From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 22:39:36 +0200
Subject: [Buildroot] [git commit branch/next] strace: bump to version 4.22
Message-ID: <20180511203933.3DF588CA6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06043706893f1e5476435b60feb5901dd04b9af7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop upstream patch.

Update license file hash; copyright year update.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strace/0001-m68k-fix-build.patch | 97 --------------------------------
 package/strace/strace.hash               |  6 +-
 package/strace/strace.mk                 |  2 +-
 3 files changed, 4 insertions(+), 101 deletions(-)

diff --git a/package/strace/0001-m68k-fix-build.patch b/package/strace/0001-m68k-fix-build.patch
deleted file mode 100644
index 9675eaaa3c..0000000000
--- a/package/strace/0001-m68k-fix-build.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 6ebf6c4f9e5ebca123a5b5f24afe67cf0473cf92 Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@altlinux.org>
-Date: Wed, 21 Feb 2018 23:03:27 +0000
-Subject: [PATCH] m68k: fix build
-
-When <sys/reg.h> is included after <linux/ptrace.h>, the build fails
-on m68k with the following diagnostics:
-
-  In file included from /usr/include/linux/ptrace.h:101:0,
-                   from ptrace.h:51,
-                   from sigreturn.c:2:
-  /usr/include/m68k-linux-gnu/sys/reg.h:26:3: error: expected identifier
-  before numeric constant
-     PT_D1 = 0,
-     ^
-
-Apparently, the only architecture where strace needs definitions
-provided by <sys/reg.h> is x86_64, other three (m68k, tile, and x86)
-are fine with definitions already provided by <linux/ptrace.h>.
-
-Fix the issue by getting rid of <sys/reg.h> and defining necessary
-macros in linux/x86_64/arch_regs.h file.
-
-* configure.ac (AC_CHECK_HEADERS): Remove sys/reg.h.
-* regs.h: Do not include <sys/reg.h>.
-* linux/x86_64/arch_regs.h (R15, R14, R13, R12, RBP, RBX, R11, R10,
-R9, R8, RAX, RCX, RDX, RSI, RDI, ORIG_RAX, RIP, CS, EFLAGS, RSP, SS,
-FS_BASE, GS_BASE, DS, ES, FS, GS): New macros.
-* NEWS: Mention this fix.
-
-Fixes: v4.21~21 ("Include <sys/ptrace.h> early")
-[baruch: drop the NEWS and configure.ac hunks]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 6ebf6c4f9e5e
-
- NEWS                     |  3 +++
- configure.ac             |  1 -
- linux/x86_64/arch_regs.h | 29 +++++++++++++++++++++++++++++
- regs.h                   |  5 -----
- 4 files changed, 32 insertions(+), 6 deletions(-)
-
-diff --git a/linux/x86_64/arch_regs.h b/linux/x86_64/arch_regs.h
-index c2ccee671d4f..d502ca4bf202 100644
---- a/linux/x86_64/arch_regs.h
-+++ b/linux/x86_64/arch_regs.h
-@@ -1,2 +1,31 @@
- extern uint32_t *const i386_esp_ptr;
- extern uint64_t *const x86_64_rsp_ptr;
-+
-+/* <asm/ptrace.h> does not provide these definitions.  */
-+#define R15		0
-+#define R14		1
-+#define R13		2
-+#define R12		3
-+#define RBP		4
-+#define RBX		5
-+#define R11		6
-+#define R10		7
-+#define R9		8
-+#define R8		9
-+#define RAX		10
-+#define RCX		11
-+#define RDX		12
-+#define RSI		13
-+#define RDI		14
-+#define ORIG_RAX	15
-+#define RIP		16
-+#define CS		17
-+#define EFLAGS		18
-+#define RSP		19
-+#define SS		20
-+#define FS_BASE		21
-+#define GS_BASE		22
-+#define DS		23
-+#define ES		24
-+#define FS		25
-+#define GS		26
-diff --git a/regs.h b/regs.h
-index d89581d7dd3f..7a044cef8fbf 100644
---- a/regs.h
-+++ b/regs.h
-@@ -2,11 +2,6 @@
- #define STRACE_REGS_H
- 
- #include <sys/user.h>
--
--#ifdef HAVE_SYS_REG_H
--# include <sys/reg.h>
--#endif
--
- #include "arch_regs.h"
- 
- #endif /* !STRACE_REGS_H */
--- 
-2.17.0
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 21da83058e..f50e89c060 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# https://strace.io/files/4.21/strace-4.21.tar.xz.asc
-sha256	5c7688db44073e94c59a5627744e5699454419824cc8166e8bcfd7ec58375c37	strace-4.21.tar.xz
-sha256	ea7ff222f36c9df0aa2924a8f7c7d2aec3ea11e752feba4b15ec79b695b6236a	COPYING
+# https://strace.io/files/4.22/strace-4.22.tar.xz.asc
+sha256	068cd09264c95e4d591bbcd3ea08f99a693ed8663cd5169b0fdad72eb5bdb39d	strace-4.22.tar.xz
+sha256	df862ba273812c589fd69acc74197a25d38c5295baccab00a62d39d1894c0253	COPYING
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 0529d79af6..4d42085819 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.21
+STRACE_VERSION = 4.22
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3-Clause
