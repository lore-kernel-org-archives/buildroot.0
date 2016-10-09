From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 13:55:08 +0200
Subject: [Buildroot] [git commit] gdb: get rid of host-texinfo dependency
Message-ID: <20161009115538.899F382103@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12306a81f8edc6db84e4e3c5e58e707ba9e4c9f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-texinfo dependency in gdb/host-gdb was added because gdb insisted
in building info documentation in recent versions, and we want to avoid
'makeinfo' to be present on the build system.

However, there is another solution that does not require actually building
host-texinfo: instruct the makefiles to use a dummy makeinfo command
('true').

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 1c778e9..0e7abfd 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -37,12 +37,11 @@ endif
 # also need ncurses.
 HOST_GDB_DEPENDENCIES = host-expat host-ncurses
 
-# Starting with gdb 7.10, gdb wants to re-generate its documentation.
-# We were trying to avoid that by patching the Makefiles, but it wasn't
-# working in all situations. So, we simply add a dependency on
-# host-texinfo in all case.
-GDB_DEPENDENCIES += host-texinfo
-HOST_GDB_DEPENDENCIES += host-texinfo
+# Disable building documentation
+GDB_MAKE_OPTS += MAKEINFO=true
+GDB_INSTALL_TARGET_OPTS += MAKEINFO=true
+HOST_GDB_MAKE_OPTS += MAKEINFO=true
+HOST_GDB_INSTALL_OPTS += MAKEINFO=true
 
 # Apply the Xtensa specific patches
 XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
