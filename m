From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  5 Jul 2016 18:02:29 +0200
Subject: [Buildroot] [PATCH] package/gdb: add dependency on host-textinfo
Message-ID: <1467734549-2767-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with gdb 7.10, gdb wants to re-generate its documentation.
We were trying to avoid that by patching the Makefiles, but it wasn't
working in all situations. So, we simply add a dependency on
host-texinfo in all case.

Fixes:
http://autobuild.buildroot.net/results/f72/f72eac3e2f995e93f0e8f215e68ce4356a696dcb

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gdb/gdb.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 6d70955..3941b45 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -35,7 +35,12 @@ endif
 # For the host variant, we really want to build with XML support,
 # which is needed to read XML descriptions of target architectures. We
 # also need ncurses.
-HOST_GDB_DEPENDENCIES = host-expat host-ncurses
+# Starting with gdb 7.10, gdb wants to re-generate its documentation.
+# We were trying to avoid that by patching the Makefiles, but it wasn't
+# working in all situations. So, we simply add a dependency on
+# host-texinfo in all case.
+HOST_GDB_DEPENDENCIES += host-expat host-ncurses host-texinfo
+GDB_DEPENDENCIES += host-texinfo
 
 # Apply the Xtensa specific patches
 XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
@@ -49,8 +54,8 @@ HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 endif
 
 ifeq ($(GDB_FROM_GIT),y)
-GDB_DEPENDENCIES += host-texinfo host-flex host-bison
-HOST_GDB_DEPENDENCIES += host-texinfo host-flex host-bison
+GDB_DEPENDENCIES += host-flex host-bison
+HOST_GDB_DEPENDENCIES += host-flex host-bison
 endif
 
 # When gdb sources are fetched from the binutils-gdb repository, they
-- 
2.5.5
