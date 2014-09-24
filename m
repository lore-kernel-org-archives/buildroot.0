From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 24 Sep 2014 08:43:04 +0200
Subject: [Buildroot] [PATCH 3/4] lttng-libust: bump to version 2.5.0
In-Reply-To: <1411540985-22792-1-git-send-email-jezz@sysmic.org>
References: <1411540985-22792-1-git-send-email-jezz@sysmic.org>
Message-ID: <1411540985-22792-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch
was upstreamed

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 ...iblttng-ust-dl-if-dlinfo-is-not-available.patch | 79 ----------------------
 package/lttng-libust/lttng-libust.mk               |  2 +-
 2 files changed, 1 insertion(+), 80 deletions(-)
 delete mode 100644 package/lttng-libust/lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch

diff --git a/package/lttng-libust/lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch b/package/lttng-libust/lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch
deleted file mode 100644
index dd00f37..0000000
--- a/package/lttng-libust/lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 44316d0214425f5ae0d8af07099caae3e95ac890 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Tue, 8 Apr 2014 22:15:27 +0200
-Subject: [PATCH 1/1] Fix: disable liblttng-ust-dl if dlinfo is not available
- in C library
-
-According to uClibc commit [1], dlinfo is not available in recent uClibc (>0.9.33),
-but is available in older version of uClibc (<=0.9.33) whith a different prototype
-than dlinfo() in glibc.
-
-To be able to use LTTng UST with uClibc, we need to disable the Dynamic Linker
-Tracing functionality [2].
-
-A specific test on dlinfo() prototype is performed to enable or disable this
-functionality.
-
-[1] http://git.uclibc.org/uClibc/commit/?id=f3c9dc499c5c787ddd8c4320f2d44d2ae6e40c22
-[2] http://lists.lttng.org/pipermail/lttng-dev/2014-February/022423.html
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Makefile.am  |  5 ++++-
- configure.ac | 18 ++++++++++++++++++
- 2 files changed, 22 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index b79d2dd..c907ff1 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -4,11 +4,14 @@ SUBDIRS = . include snprintf libringbuffer liblttng-ust-comm \
- 		liblttng-ust \
- 		liblttng-ust-ctl \
- 		liblttng-ust-fork \
--		liblttng-ust-dl \
- 		liblttng-ust-libc-wrapper \
- 		liblttng-ust-cyg-profile \
- 		tools
- 
-+if HAVE_DLINFO
-+SUBDIRS += liblttng-ust-dl
-+endif
-+
- if BUILD_JNI_INTERFACE
- SUBDIRS += liblttng-ust-java liblttng-ust-jul
- endif
-diff --git a/configure.ac b/configure.ac
-index b04d4e3..f4b499b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -119,8 +119,26 @@ AC_CHECK_LIB([dl], [dlopen],
- 		AC_MSG_ERROR([Cannot find dlopen in libdl nor libc. Use [LDFLAGS]=-Ldir to specify their location.])
- 	])
- ])
-+AS_IF([test "$x$have_libdl" = "yes" || test "x$have_libc_dl" = "xyes"],
-+	[AC_MSG_CHECKING([for dlinfo()])
-+		# Ensure the check is covered by the LIBS variable
-+		LIBS="$LIBS -ldl"
-+		AC_LINK_IFELSE(
-+			[AC_LANG_PROGRAM([[#define _GNU_SOURCE /* Required on Linux to get GNU extensions */
-+							#include <dlfcn.h>]],
-+				[[dlinfo(0, 0, 0);]])],
-+			[AC_MSG_RESULT([yes])
-+				dlinfo_ok=yes;
-+			],
-+			[AC_MSG_RESULT([no])
-+				AC_MSG_WARN([dlinfo() is not available, the Dynamic Linker Tracing functionality is disabled.])
-+				dlinfo_ok=no;
-+			])
-+	],
-+	[dlinfo_ok=no])
- AM_CONDITIONAL([LTTNG_UST_BUILD_WITH_LIBDL], [test "x$have_libdl" = "xyes"])
- AM_CONDITIONAL([LTTNG_UST_BUILD_WITH_LIBC_DL], [test "x$have_libc_dl" = "xyes"])
-+AM_CONDITIONAL([HAVE_DLINFO], [test "dlinfo_ok" = "yes"])
- 
- AC_CHECK_LIB([pthread], [pthread_create])
- 
--- 
-1.9.0
-
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 0322780..53981c1 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.4.1
+LTTNG_LIBUST_VERSION = 2.5.0
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
-- 
1.9.1
