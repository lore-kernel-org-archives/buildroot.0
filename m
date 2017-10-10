From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 10 Oct 2017 15:52:08 -0400
Subject: [Buildroot] [PATCH v2 4/5] checkpolicy: bump to 2.7
In-Reply-To: <20171010195209.24074-1-aduskett@gmail.com>
References: <20171010195209.24074-1-aduskett@gmail.com>
Message-ID: <20171010195209.24074-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove patch, as it's in this release.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - None

 .../0001-checkpolicy-remove-lfl-from-LDLIBS.patch  | 58 ----------------------
 package/checkpolicy/checkpolicy.hash               |  2 +-
 package/checkpolicy/checkpolicy.mk                 |  4 +-
 3 files changed, 3 insertions(+), 61 deletions(-)
 delete mode 100644 package/checkpolicy/0001-checkpolicy-remove-lfl-from-LDLIBS.patch

diff --git a/package/checkpolicy/0001-checkpolicy-remove-lfl-from-LDLIBS.patch b/package/checkpolicy/0001-checkpolicy-remove-lfl-from-LDLIBS.patch
deleted file mode 100644
index c0b6de8a5a..0000000000
--- a/package/checkpolicy/0001-checkpolicy-remove-lfl-from-LDLIBS.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4d215a1e8111e14f6074f7abe2559800b6f4838c Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Adamduskett@outlook.com>
-Date: Sat, 20 May 2017 11:01:08 -0400
-Subject: [PATCH] checkpolicy: remove -lfl from LDLIBSlogin
-
-When building checkpolicy/test, the linker reports the following error:
-cc   dispol.o  -lfl /usr/src/selinux/DESTDIR/usr/lib/libsepol.a
--L/usr/src/selinux/DESTDIR/usr/lib -o dispol
-/usr/lib/gcc/x86_64-pc-linux-gnu/6.2.1/../../../../lib/libfl.so:
-undefined reference to `yylex'
-collect2: error: ld returned 1 exit status
-
-According to flex documentation
-(https://github.com/westes/flex/blob/master/doc/flex.texi), -lfl is used
-to provide an implementation for yywrap(). However every flex file now
-uses "%option noyywrap", which makes -lfl no longer mandatory. Remove
-this option from checkpolicy Makefiles.
-
-
-Backported from:
-https://patchwork.kernel.org/patch/9450549/
-
-Original author: Nicolas Iooss <nicolas.iooss@m4x.org>
-Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
----
- Makefile      | 2 +-
- test/Makefile | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 53a3074..875cf00 100644
---- a/Makefile
-+++ b/Makefile
-@@ -20,7 +20,7 @@ CHECKOBJS = y.tab.o lex.yy.o queue.o module_compiler.o parse_util.o \
- CHECKPOLOBJS = $(CHECKOBJS) checkpolicy.o
- CHECKMODOBJS = $(CHECKOBJS) checkmodule.o
- 
--LDLIBS=$(LIBDIR)/libsepol.a -lfl
-+LDLIBS=$(LIBDIR)/libsepol.a
- 
- GENERATED=lex.yy.c y.tab.c y.tab.h
- 
-diff --git a/test/Makefile b/test/Makefile
-index c2367e1..e7bd717 100644
---- a/test/Makefile
-+++ b/test/Makefile
-@@ -9,7 +9,7 @@ INCLUDEDIR ?= $(PREFIX)/include
- CFLAGS ?= -g -Wall -W -Werror -O2 -pipe
- override CFLAGS += -I$(INCLUDEDIR)
- 
--LDLIBS=-lfl $(LIBDIR)/libsepol.a -L$(LIBDIR)
-+LDLIBS=$(LIBDIR)/libsepol.a -L$(LIBDIR)
- 
- all: dispol dismod
- 
--- 
-2.9.3
-
diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index 6208d7749c..7397393a76 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,2 +1,2 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 0bebd18688ca8027b1b3b4ff1532c0626f1fe49883ae6cb74d9d385940e74157  checkpolicy-2.6.tar.gz
+sha256 5413479f1dcde866c19896b4dbfec315d822aa431606e1d03c944408984c3201  checkpolicy-2.7.tar.gz
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index f0cca593d3..c1fb43da4d 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 2.6
-CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
+CHECKPOLICY_VERSION = 2.7
+CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = COPYING
 
-- 
2.13.6
