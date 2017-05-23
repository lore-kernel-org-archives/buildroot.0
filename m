From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 15:50:39 +0200
Subject: [Buildroot] [git commit] checkpolicy: add patch to fix flex related
	build failure
Message-ID: <20170601202854.BD95B807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b869760f11f148a06027e63c0d0bbccb55a217f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building checkpolicy/test, the linker reports the following error:

    cc   dispol.o  -lfl /usr/src/selinux/DESTDIR/usr/lib/libsepol.a -L/usr/src/selinux/DESTDIR/usr/lib -o dispol
    /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.1/../../../../lib/libfl.so: undefined reference to `yylex'
    collect2: error: ld returned 1 exit status

According to flex documentation
(https://github.com/westes/flex/blob/master/doc/flex.texi), -lfl is used
to provide an implementation for yywrap(). However every flex file now
uses "%option noyywrap", which makes -lfl no longer mandatory. Remove
this option from checkpolicy Makefiles.

Patch taken from https://patchwork.kernel.org/patch/9450549/

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-checkpolicy-remove-lfl-from-LDLIBS.patch  | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/checkpolicy/0001-checkpolicy-remove-lfl-from-LDLIBS.patch b/package/checkpolicy/0001-checkpolicy-remove-lfl-from-LDLIBS.patch
new file mode 100644
index 0000000..c0b6de8
--- /dev/null
+++ b/package/checkpolicy/0001-checkpolicy-remove-lfl-from-LDLIBS.patch
@@ -0,0 +1,58 @@
+From 4d215a1e8111e14f6074f7abe2559800b6f4838c Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Sat, 20 May 2017 11:01:08 -0400
+Subject: [PATCH] checkpolicy: remove -lfl from LDLIBSlogin
+
+When building checkpolicy/test, the linker reports the following error:
+cc   dispol.o  -lfl /usr/src/selinux/DESTDIR/usr/lib/libsepol.a
+-L/usr/src/selinux/DESTDIR/usr/lib -o dispol
+/usr/lib/gcc/x86_64-pc-linux-gnu/6.2.1/../../../../lib/libfl.so:
+undefined reference to `yylex'
+collect2: error: ld returned 1 exit status
+
+According to flex documentation
+(https://github.com/westes/flex/blob/master/doc/flex.texi), -lfl is used
+to provide an implementation for yywrap(). However every flex file now
+uses "%option noyywrap", which makes -lfl no longer mandatory. Remove
+this option from checkpolicy Makefiles.
+
+
+Backported from:
+https://patchwork.kernel.org/patch/9450549/
+
+Original author: Nicolas Iooss <nicolas.iooss@m4x.org>
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ Makefile      | 2 +-
+ test/Makefile | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 53a3074..875cf00 100644
+--- a/Makefile
++++ b/Makefile
+@@ -20,7 +20,7 @@ CHECKOBJS = y.tab.o lex.yy.o queue.o module_compiler.o parse_util.o \
+ CHECKPOLOBJS = $(CHECKOBJS) checkpolicy.o
+ CHECKMODOBJS = $(CHECKOBJS) checkmodule.o
+ 
+-LDLIBS=$(LIBDIR)/libsepol.a -lfl
++LDLIBS=$(LIBDIR)/libsepol.a
+ 
+ GENERATED=lex.yy.c y.tab.c y.tab.h
+ 
+diff --git a/test/Makefile b/test/Makefile
+index c2367e1..e7bd717 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -9,7 +9,7 @@ INCLUDEDIR ?= $(PREFIX)/include
+ CFLAGS ?= -g -Wall -W -Werror -O2 -pipe
+ override CFLAGS += -I$(INCLUDEDIR)
+ 
+-LDLIBS=-lfl $(LIBDIR)/libsepol.a -L$(LIBDIR)
++LDLIBS=$(LIBDIR)/libsepol.a -L$(LIBDIR)
+ 
+ all: dispol dismod
+ 
+-- 
+2.9.3
+
