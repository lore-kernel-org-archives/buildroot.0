From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jan 2012 15:09:31 +0100
Subject: [Buildroot] [git commit] uClibc: bump 0.9.32.x version to 0.9.32.1
Message-ID: <20120102160217.385038FFBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fd4c35058684fde99e84261343ef9aa24e64a90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/Config.in                         |    2 +-
 .../uClibc-0.9.32-Fix-e500-fpu-libm-build.patch    |   31 -----------------
 ...-0.9.32-fix-daylight-saving-time-handling.patch |   36 --------------------
 ...ibc-0.9.32-honor-UCLIBC_HAS_FENV-for-e500.patch |   28 ---------------
 ..._libc_epoll_pwait-compile-failure-on-x86.patch} |    0
 ...-e500-__fe_nomask_env-use-of-__set_errno.patch} |    0
 ...> uClibc-0.9.32.1-linuxthreads-errno-fix.patch} |    0
 ...patch => uClibc-0.9.32.1-sparc-errno-fix.patch} |    0
 ...unshare.patch => uClibc-0.9.32.1-unshare.patch} |    0
 9 files changed, 1 insertions(+), 96 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 4b480fd..19c71e0 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -32,7 +32,7 @@ config BR2_USE_UCLIBC_SNAPSHOT
 config BR2_UCLIBC_VERSION_STRING
 	string
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
-	default 0.9.32		if BR2_UCLIBC_VERSION_0_9_32
+	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/toolchain/uClibc/uClibc-0.9.32-Fix-e500-fpu-libm-build.patch b/toolchain/uClibc/uClibc-0.9.32-Fix-e500-fpu-libm-build.patch
deleted file mode 100644
index a228bc1..0000000
--- a/toolchain/uClibc/uClibc-0.9.32-Fix-e500-fpu-libm-build.patch
+++ /dev/null
@@ -1,31 +0,0 @@
->From 826984dee547b41238dc9572a1c756506a3c9148 Mon Sep 17 00:00:00 2001
-From: Jason Woodward <jason.woodward@timesys.com>
-Date: Sat, 11 Jun 2011 19:09:53 -0400
-Subject: [PATCH] Fix e500 fpu libm build
-
-Define libm_ARCH_fpu_OUT in libm/powerpc/e500/Makefile.arch as it is used
-in libm/powerpc/e500/fpu/Makefile.arch
-
- libm_ARCH_OBJ:=$(patsubst $(libm_ARCH_fpu_DIR)/%.c,$(libm_ARCH_fpu_OUT)/%.o,$(libm_ARCH_SRC))
-
-This appears to have been broken since cd3a494e99fa4bcad1c2a621b71361005528bead
-
-Signed-off-by: Jason Woodward <jason.woodward@timesys.com>
----
- libm/powerpc/e500/Makefile.arch |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/libm/powerpc/e500/Makefile.arch b/libm/powerpc/e500/Makefile.arch
-index 912ce7f..febde67 100644
---- a/libm/powerpc/e500/Makefile.arch
-+++ b/libm/powerpc/e500/Makefile.arch
-@@ -6,5 +6,6 @@
- #
- 
- libm_ARCH_fpu_DIR := $(libm_SUBARCH_DIR)/fpu
-+libm_ARCH_fpu_OUT := $(libm_SUBARCH_OUT)/fpu
- -include $(libm_ARCH_fpu_DIR)/Makefile.arch
- 
--- 
-1.7.0.4
-
diff --git a/toolchain/uClibc/uClibc-0.9.32-fix-daylight-saving-time-handling.patch b/toolchain/uClibc/uClibc-0.9.32-fix-daylight-saving-time-handling.patch
deleted file mode 100644
index 5a96113..0000000
--- a/toolchain/uClibc/uClibc-0.9.32-fix-daylight-saving-time-handling.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 47f3da1cf49377c25772bb54d07db55225bbb142 Mon Sep 17 00:00:00 2001
-From: Guillaume Bourcier <guillaumebourcier@free.fr>
-Date: Tue, 11 Oct 2011 13:45:33 +0200
-Subject: [PATCH] libc: fix daylight saving time handling
-
-The algorithm computing daylight saving time incorrectly adds a day for
-each month after January for leap years. The clock shift from/to DST can
-be delayed if the last Sunday of a transition month is exactly seven
-days before the first of the following month.
-
-This change adds a day for the February month only.
-
-Signed-off-by: Guillaume Bourcier <guillaumebourcier@free.fr>
-Signed-off-by: Richard Braun <rbraun@sceen.net>
-Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- libc/misc/time/time.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/libc/misc/time/time.c b/libc/misc/time/time.c
-index 19d68e1..8e2ebf1 100644
---- a/libc/misc/time/time.c
-+++ b/libc/misc/time/time.c
-@@ -689,7 +689,7 @@ static int tm_isdst(register const struct tm *__restrict ptm,
- 					++day;
- 				}
- 				monlen = 31 + day_cor[r->month -1] - day_cor[r->month];
--				if (isleap && (r->month > 1)) {
-+				if (isleap && (r->month == 2)) {
- 					++monlen;
- 				}
- 				/* Wweekday (0 is Sunday) of 1st of the month
--- 
-1.7.3.4
-
diff --git a/toolchain/uClibc/uClibc-0.9.32-honor-UCLIBC_HAS_FENV-for-e500.patch b/toolchain/uClibc/uClibc-0.9.32-honor-UCLIBC_HAS_FENV-for-e500.patch
deleted file mode 100644
index c90c34c..0000000
--- a/toolchain/uClibc/uClibc-0.9.32-honor-UCLIBC_HAS_FENV-for-e500.patch
+++ /dev/null
@@ -1,28 +0,0 @@
->From 69d9cf20955d0222a5a2631021bc10854ea98128 Mon Sep 17 00:00:00 2001
-From: Jason Woodward <jason.woodward@timesys.com>
-Date: Sat, 11 Jun 2011 20:39:33 -0400
-Subject: [PATCH] honor UCLIBC_HAS_FENV for e500
-
-Signed-off-by: Jason Woodward <jason.woodward@timesys.com>
----
- libm/powerpc/e500/fpu/Makefile.arch |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
-
-diff --git a/libm/powerpc/e500/fpu/Makefile.arch b/libm/powerpc/e500/fpu/Makefile.arch
-index 8f00e09..904561e 100644
---- a/libm/powerpc/e500/fpu/Makefile.arch
-+++ b/libm/powerpc/e500/fpu/Makefile.arch
-@@ -6,8 +6,10 @@
- #
- 
- 
-+ifeq ($(UCLIBC_HAS_FENV),y)
- libm_ARCH_SRC:=$(wildcard $(libm_ARCH_fpu_DIR)/*.c)
- libm_ARCH_OBJ:=$(patsubst $(libm_ARCH_fpu_DIR)/%.c,$(libm_ARCH_fpu_OUT)/%.o,$(libm_ARCH_SRC))
-+endif
- 
- libm_ARCH_OBJS:=$(libm_ARCH_OBJ)
- 
--- 
-1.7.0.4
-
diff --git a/toolchain/uClibc/uClibc-0.9.32-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch b/toolchain/uClibc/uClibc-0.9.32.1-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.32-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch
rename to toolchain/uClibc/uClibc-0.9.32.1-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch
diff --git a/toolchain/uClibc/uClibc-0.9.32-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch b/toolchain/uClibc/uClibc-0.9.32.1-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.32-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
rename to toolchain/uClibc/uClibc-0.9.32.1-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
diff --git a/toolchain/uClibc/uClibc-0.9.32-linuxthreads-errno-fix.patch b/toolchain/uClibc/uClibc-0.9.32.1-linuxthreads-errno-fix.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.32-linuxthreads-errno-fix.patch
rename to toolchain/uClibc/uClibc-0.9.32.1-linuxthreads-errno-fix.patch
diff --git a/toolchain/uClibc/uClibc-0.9.32-sparc-errno-fix.patch b/toolchain/uClibc/uClibc-0.9.32.1-sparc-errno-fix.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.32-sparc-errno-fix.patch
rename to toolchain/uClibc/uClibc-0.9.32.1-sparc-errno-fix.patch
diff --git a/toolchain/uClibc/uClibc-0.9.32-unshare.patch b/toolchain/uClibc/uClibc-0.9.32.1-unshare.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.32-unshare.patch
rename to toolchain/uClibc/uClibc-0.9.32.1-unshare.patch
