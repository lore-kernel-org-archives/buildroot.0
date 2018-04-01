From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Apr 2018 22:19:46 +0200
Subject: [Buildroot] [PATCH 1/1] lxc: bump to version 3.0.0
Message-ID: <20180401201946.13957-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Remove both patches (applied upstream)
 - Remove --disable-python as python support has been removed
 (https://github.com/lxc/lxc/commit/e144a06bd792f99c96395a9d4c16cf7c656fb99d)
 - Remove lua optional dependency as lua support has been removed
 (https://github.com/lxc/lxc/commit/b52a5bef6fa56481a6d817f4c73cb91ed012fe2c)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-compilation-on-toolchain-without-prlimit.patch | 98 ----------------------
 ...-Fix-legacy-PR_-G-S-ET_NO_NEW_PRIVS-handl.patch | 49 -----------
 package/lxc/lxc.hash                               |  2 +-
 package/lxc/lxc.mk                                 | 17 +---
 4 files changed, 3 insertions(+), 163 deletions(-)
 delete mode 100644 package/lxc/0001-Fix-compilation-on-toolchain-without-prlimit.patch
 delete mode 100644 package/lxc/0002-lxc-start.c-Fix-legacy-PR_-G-S-ET_NO_NEW_PRIVS-handl.patch

diff --git a/package/lxc/0001-Fix-compilation-on-toolchain-without-prlimit.patch b/package/lxc/0001-Fix-compilation-on-toolchain-without-prlimit.patch
deleted file mode 100644
index 031f77539f..0000000000
--- a/package/lxc/0001-Fix-compilation-on-toolchain-without-prlimit.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From f48b5fd8ab03c200eaf5e3a9b03bcd01b2659cf3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 2 Nov 2017 16:00:33 +0100
-Subject: [PATCH] Fix compilation on toolchain without prlimit
-
-Some toolchains which are not bionic like uclibc does not support
-prlimit or prlimit64. In this case, return an error.
-Moreover, if prlimit64 is available, use lxc implementation of prlimit.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac        |  4 ++++
- src/lxc/Makefile.am |  6 ++++++
- src/lxc/conf.c      | 12 +++++++++---
- 3 files changed, 19 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 642b78e7..63df7466 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -671,6 +671,10 @@ AC_CHECK_FUNCS([prlimit],
- 	AM_CONDITIONAL(HAVE_PRLIMIT, true)
- 	AC_DEFINE(HAVE_PRLIMIT,1,[Have prlimit]),
- 	AM_CONDITIONAL(HAVE_PRLIMIT, false))
-+AC_CHECK_FUNCS([prlimit64],
-+	AM_CONDITIONAL(HAVE_PRLIMIT64, true)
-+	AC_DEFINE(HAVE_PRLIMIT64,1,[Have prlimit64]),
-+	AM_CONDITIONAL(HAVE_PRLIMIT64, false))
- 
- # Check for some libraries
- AC_SEARCH_LIBS(sem_open, [rt pthread])
-diff --git a/src/lxc/Makefile.am b/src/lxc/Makefile.am
-index fff32ae4..8f0c11ec 100644
---- a/src/lxc/Makefile.am
-+++ b/src/lxc/Makefile.am
-@@ -45,7 +45,10 @@ noinst_HEADERS += \
- 	../include/ifaddrs.h \
- 	../include/openpty.h \
- 	../include/lxcmntent.h
-+endif
-+
- if !HAVE_PRLIMIT
-+if HAVE_PRLIMIT64
- noinst_HEADERS += ../include/prlimit.h
- endif
- endif
-@@ -143,7 +146,10 @@ liblxc_la_SOURCES += \
- 	../include/ifaddrs.c ../include/ifaddrs.h \
- 	../include/openpty.c ../include/openpty.h \
- 	../include/lxcmntent.c ../include/lxcmntent.h
-+endif
-+
- if !HAVE_PRLIMIT
-+if HAVE_PRLIMIT64
- liblxc_la_SOURCES += ../include/prlimit.c ../include/prlimit.h
- endif
- endif
-diff --git a/src/lxc/conf.c b/src/lxc/conf.c
-index 44d97843..8a66f2d0 100644
---- a/src/lxc/conf.c
-+++ b/src/lxc/conf.c
-@@ -97,13 +97,14 @@
- 
- #if IS_BIONIC
- #include <../include/lxcmntent.h>
--#ifndef HAVE_PRLIMIT
--#include <../include/prlimit.h>
--#endif
- #else
- #include <mntent.h>
- #endif
- 
-+#if !defined(HAVE_PRLIMIT) && defined(HAVE_PRLIMIT64)
-+#include <../include/prlimit.h>
-+#endif
-+
- lxc_log_define(lxc_conf, lxc);
- 
- #if HAVE_LIBCAP
-@@ -2399,10 +2400,15 @@ int setup_resource_limits(struct lxc_list *limits, pid_t pid) {
- 			return -1;
- 		}
- 
-+#if HAVE_PRLIMIT || HAVE_PRLIMIT64
- 		if (prlimit(pid, resid, &lim->limit, NULL) != 0) {
- 			ERROR("failed to set limit %s: %s", lim->resource, strerror(errno));
- 			return -1;
- 		}
-+#else
-+		ERROR("Cannot set limit %s as prlimit is missing", lim->resource);
-+		return -1;
-+#endif
- 	}
- 	return 0;
- }
--- 
-2.14.1
-
diff --git a/package/lxc/0002-lxc-start.c-Fix-legacy-PR_-G-S-ET_NO_NEW_PRIVS-handl.patch b/package/lxc/0002-lxc-start.c-Fix-legacy-PR_-G-S-ET_NO_NEW_PRIVS-handl.patch
deleted file mode 100644
index a11f785002..0000000000
--- a/package/lxc/0002-lxc-start.c-Fix-legacy-PR_-G-S-ET_NO_NEW_PRIVS-handl.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 995accccbb07d59381aa60939cd44b41dc092dda Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 6 Nov 2017 09:35:48 +0100
-Subject: [PATCH] lxc/start.c: Fix legacy PR_{G,S}ET_NO_NEW_PRIVS handling
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The configure checks for these use AC_CHECK_DECLS, which define the symbol
-to 0 if not available - So adjust the code to match.  From the autoconf
-manual:
-
-https://www.gnu.org/software/autoconf/manual/autoconf-2.65/html_node/Generic-Declarations.html)
-
-For each of the symbols (comma-separated list), define HAVE_DECL_symbol (in
-all capitals) to ?1? if symbol is declared, otherwise to ?0?.
-
-[Submitted upstream: https://github.com/lxc/lxc/pull/1901]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/lxc/start.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/lxc/start.c b/src/lxc/start.c
-index 2632a9b1..fe76b235 100644
---- a/src/lxc/start.c
-+++ b/src/lxc/start.c
-@@ -52,15 +52,15 @@
- #include <sys/capability.h>
- #endif
- 
--#ifndef HAVE_DECL_PR_CAPBSET_DROP
-+#if !HAVE_DECL_PR_CAPBSET_DROP
- #define PR_CAPBSET_DROP 24
- #endif
- 
--#ifndef HAVE_DECL_PR_SET_NO_NEW_PRIVS
-+#if !HAVE_DECL_PR_SET_NO_NEW_PRIVS
- #define PR_SET_NO_NEW_PRIVS 38
- #endif
- 
--#ifndef HAVE_DECL_PR_GET_NO_NEW_PRIVS
-+#if !HAVE_DECL_PR_GET_NO_NEW_PRIVS
- #define PR_GET_NO_NEW_PRIVS 39
- #endif
- 
--- 
-2.11.0
-
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index d8526e93a3..e2f9108507 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	68663a67450a8d6734e137eac54cc7077209fb15c456eec401a2c26e6386eff6	lxc-2.1.1.tar.gz
+sha256	6230224c27f050201b372b18a9f39cd220ed584899c5f0cf73c6b313dabc8d8a	lxc-3.0.0.tar.gz
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index a65c166664..5a7038f88f 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,17 +4,15 @@
 #
 ################################################################################
 
-LXC_VERSION = 2.1.1
+LXC_VERSION = 3.0.0
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPL-2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
-# We're patching configure.ac
-LXC_AUTORECONF = YES
 
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
-	--disable-python --disable-werror \
+	--disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
@@ -45,15 +43,4 @@ else
 LXC_CONF_OPTS += --disable-selinux
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
-LXC_CONF_OPTS += --enable-lua
-LXC_DEPENDENCIES += luainterpreter
-ifeq ($(BR2_PACKAGE_LUAJIT),y)
-# By default, lxc will only search for lua.pc
-LXC_CONF_OPTS += --with-lua-pc=luajit
-endif
-else
-LXC_CONF_OPTS += --disable-lua
-endif
-
 $(eval $(autotools-package))
-- 
2.14.1
