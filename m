From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 20:15:14 +0200
Subject: [Buildroot] [git commit] package/gdb: add dependency on
	host-textinfo
Message-ID: <20160706181531.9BF9D819DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4384278a2031b05f19ed3d11ebabe5c64dd3d2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with gdb 7.10, gdb wants to re-generate its documentation.
We were trying to avoid that by patching the Makefiles, but it wasn't
working in all situations. So, we simply add a dependency on
host-texinfo in all case.

Fixes:
http://autobuild.buildroot.net/results/f72/f72eac3e2f995e93f0e8f215e68ce4356a696dcb

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 6d70955..1e23e5a 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -37,6 +37,13 @@ endif
 # also need ncurses.
 HOST_GDB_DEPENDENCIES = host-expat host-ncurses
 
+# Starting with gdb 7.10, gdb wants to re-generate its documentation.
+# We were trying to avoid that by patching the Makefiles, but it wasn't
+# working in all situations. So, we simply add a dependency on
+# host-texinfo in all case.
+GDB_DEPENDENCIES += host-texinfo
+HOST_GDB_DEPENDENCIES += host-texinfo
+
 # Apply the Xtensa specific patches
 XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
 ifneq ($(XTENSA_CORE_NAME),)
@@ -49,8 +56,8 @@ HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 endif
 
 ifeq ($(GDB_FROM_GIT),y)
-GDB_DEPENDENCIES += host-texinfo host-flex host-bison
-HOST_GDB_DEPENDENCIES += host-texinfo host-flex host-bison
+GDB_DEPENDENCIES += host-flex host-bison
+HOST_GDB_DEPENDENCIES += host-flex host-bison
 endif
 
 # When gdb sources are fetched from the binutils-gdb repository, they
