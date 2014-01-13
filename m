From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jan 2014 08:26:13 +0200
Subject: [Buildroot] [PATCH v2 2/3] uclibc: xtensa: fix posix_spawn autoconf
	detection
In-Reply-To: <cover.1389594195.git.baruch@tkos.co.il>
References: <cover.1389594195.git.baruch@tkos.co.il>
Message-ID: <dc000d1809a9e23ee01cfc2741341065cb5118e7.1389594195.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

posix_spawn is a new feature in uClibc development branch. Move posix_spawn
implementation from librt to libc so that gnulib can detect it correctly.

Fixes
http://autobuild.buildroot.net/results/ab1/ab1250c3d402ec3fbaf22eeffd07de218ffafb22/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---

This a more correct alternative to http://patchwork.ozlabs.org/patch/305872/.
---
 .../0001-spawn-move-from-librt-to-libc.patch       | 142 +++++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0001-spawn-move-from-librt-to-libc.patch

diff --git a/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0001-spawn-move-from-librt-to-libc.patch b/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0001-spawn-move-from-librt-to-libc.patch
new file mode 100644
index 000000000000..d47a06fa4768
--- /dev/null
+++ b/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0001-spawn-move-from-librt-to-libc.patch
@@ -0,0 +1,142 @@
+From 7dbb2e43f34f53305d7807018865691c430efe5e Mon Sep 17 00:00:00 2001
+Message-Id: <7dbb2e43f34f53305d7807018865691c430efe5e.1389164521.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 8 Jan 2014 07:43:49 +0200
+Subject: [PATCH 1/3] spawn: move from librt to libc
+
+This makes uClibc compatible with glibc, and allows gnulib autoconf macros to
+correctly detect posix_spawn support.
+
+Patch status: posted upstream
+(http://lists.uclibc.org/pipermail/uclibc/2014-January/048160.html)
+
+Cc: Ismael Luceno <ismael.luceno@gmail.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ libc/Makefile.in                               |  1 +
+ libc/spawn/Makefile                            | 13 +++++++++++++
+ libc/spawn/Makefile.in                         | 25 +++++++++++++++++++++++++
+ {librt => libc/spawn}/spawn.c                  |  0
+ {librt => libc/spawn}/spawn_faction_addclose.c |  0
+ {librt => libc/spawn}/spawn_faction_adddup2.c  |  0
+ {librt => libc/spawn}/spawn_faction_addopen.c  |  0
+ {librt => libc/spawn}/spawn_faction_init.c     |  0
+ {librt => libc/spawn}/spawn_int.h              |  0
+ librt/Makefile.in                              |  7 -------
+ 10 files changed, 39 insertions(+), 7 deletions(-)
+ create mode 100644 libc/spawn/Makefile
+ create mode 100644 libc/spawn/Makefile.in
+ rename {librt => libc/spawn}/spawn.c (100%)
+ rename {librt => libc/spawn}/spawn_faction_addclose.c (100%)
+ rename {librt => libc/spawn}/spawn_faction_adddup2.c (100%)
+ rename {librt => libc/spawn}/spawn_faction_addopen.c (100%)
+ rename {librt => libc/spawn}/spawn_faction_init.c (100%)
+ rename {librt => libc/spawn}/spawn_int.h (100%)
+
+diff --git a/libc/Makefile.in b/libc/Makefile.in
+index 3b6a17b..4dd980b 100644
+--- a/libc/Makefile.in
++++ b/libc/Makefile.in
+@@ -37,6 +37,7 @@ include $(libc_DIR)/inet/Makefile.in
+ include $(libc_DIR)/signal/Makefile.in
+ include $(libc_DIR)/stdlib/Makefile.in
+ include $(libc_DIR)/unistd/Makefile.in
++include $(libc_DIR)/spawn/Makefile.in
+ 
+ ifeq ($(DOPIC),y)
+ libc-a-y = $(libc-y:.o=.os) $(libc-static-y:.o=.os)
+diff --git a/libc/spawn/Makefile b/libc/spawn/Makefile
+new file mode 100644
+index 0000000..11f362a
+--- /dev/null
++++ b/libc/spawn/Makefile
+@@ -0,0 +1,13 @@
++# Makefile for uClibc
++#
++# Copyright (C) 2000-2005 Erik Andersen <andersen@uclibc.org>
++#
++# Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++#
++
++top_srcdir=../../
++top_builddir=../../
++all: objs
++include $(top_builddir)Rules.mak
++include Makefile.in
++include $(top_srcdir)Makerules
+diff --git a/libc/spawn/Makefile.in b/libc/spawn/Makefile.in
+new file mode 100644
+index 0000000..8a06309
+--- /dev/null
++++ b/libc/spawn/Makefile.in
+@@ -0,0 +1,25 @@
++# Makefile for uClibc
++#
++# Copyright (C) 2000-2008 Erik Andersen <andersen@uclibc.org>
++#
++# Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++#
++
++subdirs += libc/spawn
++
++CSRC-y :=
++CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) := spawn.c spawn_faction_addclose.c \
++	spawn_faction_adddup2.c spawn_faction_addopen.c spawn_faction_init.c
++
++SPAWN_DIR := $(top_srcdir)libc/spawn
++SPAWN_OUT := $(top_builddir)libc/spawn
++
++SPAWN_SRC := $(patsubst %.c,$(SPAWN_DIR)/%.c,$(CSRC-y))
++SPAWN_OBJ := $(patsubst %.c,$(SPAWN_OUT)/%.o,$(CSRC-y))
++
++libc-y += $(SPAWN_OBJ)
++
++objclean-y += CLEAN_libc/spawn
++
++CLEAN_libc/spawn:
++	$(do_rm) $(addprefix $(SPAWN_OUT)/*., o os)
+diff --git a/librt/spawn.c b/libc/spawn/spawn.c
+similarity index 100%
+rename from librt/spawn.c
+rename to libc/spawn/spawn.c
+diff --git a/librt/spawn_faction_addclose.c b/libc/spawn/spawn_faction_addclose.c
+similarity index 100%
+rename from librt/spawn_faction_addclose.c
+rename to libc/spawn/spawn_faction_addclose.c
+diff --git a/librt/spawn_faction_adddup2.c b/libc/spawn/spawn_faction_adddup2.c
+similarity index 100%
+rename from librt/spawn_faction_adddup2.c
+rename to libc/spawn/spawn_faction_adddup2.c
+diff --git a/librt/spawn_faction_addopen.c b/libc/spawn/spawn_faction_addopen.c
+similarity index 100%
+rename from librt/spawn_faction_addopen.c
+rename to libc/spawn/spawn_faction_addopen.c
+diff --git a/librt/spawn_faction_init.c b/libc/spawn/spawn_faction_init.c
+similarity index 100%
+rename from librt/spawn_faction_init.c
+rename to libc/spawn/spawn_faction_init.c
+diff --git a/librt/spawn_int.h b/libc/spawn/spawn_int.h
+similarity index 100%
+rename from librt/spawn_int.h
+rename to libc/spawn/spawn_int.h
+diff --git a/librt/Makefile.in b/librt/Makefile.in
+index 8555e94..abaa8ca 100644
+--- a/librt/Makefile.in
++++ b/librt/Makefile.in
+@@ -35,13 +35,6 @@ librt_filter_SRC += clock_nanosleep.c clock_getcpuclockid.c clock_gettime.c
+ librt_SSRC :=
+ endif
+ 
+-librt_filter_SRC += $(if $(UCLIBC_HAS_ADVANCED_REALTIME),, \
+-	spawn.c \
+-	spawn_faction_addclose.c \
+-	spawn_faction_adddup2.c \
+-	spawn_faction_addopen.c \
+-	spawn_faction_init.c)
+-
+ librt_SRC := $(filter-out $(librt_filter_SRC),$(librt_SRC))
+ 
+ librt_OBJ := $(patsubst %.c,$(librt_OUT)/%.o,$(librt_SRC))
+-- 
+1.8.5.2
+
-- 
1.8.5.2
