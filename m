From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  3 Mar 2016 22:12:46 +0100
Subject: [Buildroot] [PATCH 3/3] luaposix: bump to version 33.4.0
In-Reply-To: <1457039566-3326-1-git-send-email-francois.perrad@gadz.org>
References: <1457039566-3326-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1457039566-3326-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...round-glibc-_POSIX_PRIORITY_SCHEDULING-bu.patch | 59 ----------------------
 package/luaposix/Config.in                         | 12 ++---
 package/luaposix/luaposix.mk                       |  6 +--
 3 files changed, 7 insertions(+), 70 deletions(-)
 delete mode 100644 package/luaposix/0001-sched-workaround-glibc-_POSIX_PRIORITY_SCHEDULING-bu.patch

diff --git a/package/luaposix/0001-sched-workaround-glibc-_POSIX_PRIORITY_SCHEDULING-bu.patch b/package/luaposix/0001-sched-workaround-glibc-_POSIX_PRIORITY_SCHEDULING-bu.patch
deleted file mode 100644
index 3853e9f..0000000
--- a/package/luaposix/0001-sched-workaround-glibc-_POSIX_PRIORITY_SCHEDULING-bu.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From de2a9b45e7b4a89affa3ac6d0a010cc627ab4a87 Mon Sep 17 00:00:00 2001
-From: "Gary V. Vaughan" <gary@vaughan.pe>
-Date: Mon, 6 Apr 2015 18:39:46 -0700
-Subject: [PATCH 1/1] sched: workaround glibc _POSIX_PRIORITY_SCHEDULING bug.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Close #223.
-* configure.ac (AC_CHECK_HEADERS): Add sched.h.
-* ext/posix/sched.c: Remove unistd.h; Predicate use of priority
-scheduling APIs on presence of sched.h instead of
-_POSIX_PRIORITY_SCHEDULING macro erroneously defined by glibc on
-Linux.
-Reported by ncopa at github.com.
-
-Backported from: 11cc8a2973569ec7fb1e7c2466dca0282944b124
-
-Signed-off-by: Gary V. Vaughan <gary@vaughan.pe>
-[Backport]
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- configure.ac      | 2 +-
- ext/posix/sched.c | 5 +++--
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index aa18318..89a2feb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -114,7 +114,7 @@ gl_INIT
- 
- ## Check for header files
- AC_HEADER_STDC
--AC_CHECK_HEADERS([crypt.h strings.h sys/statvfs.h])
-+AC_CHECK_HEADERS([crypt.h sched.h strings.h sys/statvfs.h])
- AC_CHECK_HEADERS([net/if.h linux/netlink.h], [], [], [
- #include <sys/socket.h>
- ])
-diff --git a/ext/posix/sched.c b/ext/posix/sched.c
-index 13b196b..f338d73 100644
---- a/ext/posix/sched.c
-+++ b/ext/posix/sched.c
-@@ -21,9 +21,10 @@
- 
- #include <config.h>
- 
--#include <unistd.h>	/* for _POSIX_PRIORITY_SCHEDULING */
-+/* cannot use unistd.h for _POSIX_PRIORITY_SCHEDULING, because on Linux
-+   glibc it is defined even though the APIs are not implemented :-(     */
- 
--#ifdef _POSIX_PRIORITY_SCHEDULING
-+#ifdef HAVE_SCHED_H
- #include <sched.h>
- #endif
- 
--- 
-2.5.2
-
diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 8b24574..9707cde 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,15 +1,13 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1
 	# LuaBitOp is already included in LuaJIT
 	help
-	  luaposix is a POSIX binding, including curses, for Lua 5.1,
-	  5.2 and 5.3; like most libraries it simply binds to C APIs on
-	  the underlying system, so it won't work on non-POSIX
-	  systems. However, it does try to detect the level of POSIX
-	  conformance of the underlying system and bind only available
-	  APIs.
+	  This is a POSIX binding for LuaJIT, Lua 5.1, 5.2 and 5.3;
+	  like most libraries it simply binds to C APIs on the
+	  underlying system, so it won't work on non-POSIX systems.
+	  However, it does try to detect the level of POSIX conformance
+	  of the underlying system and bind only available APIs.
 
 	  https://github.com/luaposix/luaposix
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index 24b567f..ea3af16 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 33.3.1
+LUAPOSIX_VERSION = 33.4.0
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = COPYING
-LUAPOSIX_DEPENDENCIES = luainterpreter host-lua ncurses
-# 0001-sched-workaround-glibc-_POSIX_PRIORITY_SCHEDULING-bu.patch
-LUAPOSIX_AUTORECONF = YES
+LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
 LUAPOSIX_CONF_OPTS = --libdir="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" --datarootdir="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
 
 $(eval $(autotools-package))
-- 
2.5.0
