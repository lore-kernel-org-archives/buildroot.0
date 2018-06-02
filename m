From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Jun 2018 20:16:31 +0200
Subject: [Buildroot] [PATCH 1/1] lxc: bump to version 3.0.1
Message-ID: <20180602181631.15522-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove both patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ools-lxc_monitor-include-missing-stddef.h.patch | 40 ------------
 ...tion-with-static-libcap-and-shared-gnutls.patch | 73 ----------------------
 package/lxc/lxc.hash                               |  2 +-
 package/lxc/lxc.mk                                 |  2 +-
 4 files changed, 2 insertions(+), 115 deletions(-)
 delete mode 100644 package/lxc/0001-lxc-tools-lxc_monitor-include-missing-stddef.h.patch
 delete mode 100644 package/lxc/0002-Fix-compilation-with-static-libcap-and-shared-gnutls.patch

diff --git a/package/lxc/0001-lxc-tools-lxc_monitor-include-missing-stddef.h.patch b/package/lxc/0001-lxc-tools-lxc_monitor-include-missing-stddef.h.patch
deleted file mode 100644
index 525d5d72b0..0000000000
--- a/package/lxc/0001-lxc-tools-lxc_monitor-include-missing-stddef.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 77d407537f57c3fb92787bdda1eeaec7941d344f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 20 Apr 2018 12:26:33 +0200
-Subject: [PATCH] lxc/tools/lxc_monitor: include missing <stddef.h>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-lxc_monitor.c uses offsetof(), so it should include
-<stddef.h>. Otherwise the build fails with the musl C library:
-
-tools/lxc_monitor.c: In function ???lxc_abstract_unix_connect???:
-tools/lxc_monitor.c:324:9: warning: implicit declaration of function ???offsetof??? [-Wimplicit-function-declaration]
-         offsetof(struct sockaddr_un, sun_path) + len + 1);
-         ^~~~~~~~
-tools/lxc_monitor.c:324:18: error: expected expression before ???struct???
-         offsetof(struct sockaddr_un, sun_path) + len + 1);
-                  ^~~~~~
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream-status: https://github.com/lxc/lxc/pull/2285
----
- src/lxc/tools/lxc_monitor.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/lxc/tools/lxc_monitor.c b/src/lxc/tools/lxc_monitor.c
-index 72dca8e2..c60e14ff 100644
---- a/src/lxc/tools/lxc_monitor.c
-+++ b/src/lxc/tools/lxc_monitor.c
-@@ -30,6 +30,7 @@
- #include <libgen.h>
- #include <poll.h>
- #include <regex.h>
-+#include <stddef.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.14.3
-
diff --git a/package/lxc/0002-Fix-compilation-with-static-libcap-and-shared-gnutls.patch b/package/lxc/0002-Fix-compilation-with-static-libcap-and-shared-gnutls.patch
deleted file mode 100644
index 04837b3eef..0000000000
--- a/package/lxc/0002-Fix-compilation-with-static-libcap-and-shared-gnutls.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 49bc916b1daa79cffe38fae32059bcdd985c8c8e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 7 Apr 2018 15:48:46 +0200
-Subject: [PATCH] Fix compilation with static libcap and shared gnutls
-
-Commit c06ed219c47098f34485d408410b6ecc94a40877 has broken
-compilation with a static libcap and a shared gnutls.
-This results in a build failure on init_lxc_static if gnutls is
-a shared library as init_lxc_static is built with -all-static option
-(see src/lxc/Makefile.am) and AC_CHECK_LIB adds gnutls to LIBS.
-
-This commit fix the issue by removing default behavior of AC_CHECK_LIB
-and handling manually GNUTLS_LIBS and HAVE_LIBGNUTLS
-
-Fixes:
- - http://autobuild.buildroot.net/results/b655d6853c25a195df28d91512b3ffb6c654fc90
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream-status: https://github.com/lxc/lxc/commit/49bc916b1daa79cffe38fae32059bcdd985c8c8e
----
- configure.ac        | 2 +-
- src/lxc/Makefile.am | 8 ++++++--
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 50c99836..2467bb54 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -263,7 +263,7 @@ AM_CONDITIONAL([ENABLE_GNUTLS], [test "x$enable_gnutls" = "xyes"])
- 
- AM_COND_IF([ENABLE_GNUTLS],
- 	[AC_CHECK_HEADER([gnutls/gnutls.h],[],[AC_MSG_ERROR([You must install the GnuTLS development package in order to compile lxc])])
--	AC_CHECK_LIB([gnutls], [gnutls_hash_fast],[],[AC_MSG_ERROR([You must install the GnuTLS development package in order to compile lxc])])
-+	AC_CHECK_LIB([gnutls], [gnutls_hash_fast],[true],[AC_MSG_ERROR([You must install the GnuTLS development package in order to compile lxc])])
- 	AC_SUBST([GNUTLS_LIBS], [-lgnutls])])
- 
- # SELinux
-diff --git a/src/lxc/Makefile.am b/src/lxc/Makefile.am
-index c8d76836..0662d83d 100644
---- a/src/lxc/Makefile.am
-+++ b/src/lxc/Makefile.am
-@@ -175,6 +175,10 @@ if ENABLE_APPARMOR
- AM_CFLAGS += -DHAVE_APPARMOR
- endif
- 
-+if ENABLE_GNUTLS
-+AM_CFLAGS += -DHAVE_LIBGNUTLS
-+endif
-+
- if ENABLE_SELINUX
- AM_CFLAGS += -DHAVE_SELINUX
- endif
-@@ -196,7 +200,7 @@ liblxc_la_LDFLAGS = \
- 	-Wl,-soname,liblxc.so.$(firstword $(subst ., , at LXC_ABI@)) \
- 	-version-info @LXC_ABI_MAJOR@
- 
--liblxc_la_LIBADD = $(CAP_LIBS) $(SELINUX_LIBS) $(SECCOMP_LIBS)
-+liblxc_la_LIBADD = $(CAP_LIBS) $(GNUTLS_LIBS) $(SELINUX_LIBS) $(SECCOMP_LIBS)
- 
- bin_SCRIPTS=
- 
-@@ -243,7 +247,7 @@ AM_LDFLAGS = -Wl,-E
- if ENABLE_RPATH
- AM_LDFLAGS += -Wl,-rpath -Wl,$(libdir)
- endif
--LDADD=liblxc.la @CAP_LIBS@ @SELINUX_LIBS@ @SECCOMP_LIBS@
-+LDADD=liblxc.la @CAP_LIBS@ @GNUTLS_LIBS@ @SELINUX_LIBS@ @SECCOMP_LIBS@
- 
- if ENABLE_TOOLS
- lxc_attach_SOURCES = tools/lxc_attach.c tools/arguments.c tools/tool_utils.c
--- 
-2.14.1
-
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index e2f9108507..f46b1e1f5e 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	6230224c27f050201b372b18a9f39cd220ed584899c5f0cf73c6b313dabc8d8a	lxc-3.0.0.tar.gz
+sha256	45986c49be1c048fa127bd3e7ea1bd3347e25765c008a09a2e4c233151a2d5db	lxc-3.0.1.tar.gz
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 5a7038f88f..d1487e0e59 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 3.0.0
+LXC_VERSION = 3.0.1
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPL-2.1+
 LXC_LICENSE_FILES = COPYING
-- 
2.14.1
