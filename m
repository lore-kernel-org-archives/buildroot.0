From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 11 Oct 2016 14:02:32 +0200
Subject: [Buildroot] [PATCH v3 1/3] gdb: get rid of host-texinfo dependency
Message-ID: <1476187354-13966-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

The host-texinfo dependency in gdb/host-gdb was added because gdb insisted
in building info documentation in recent versions, and we want to avoid
'makeinfo' to be present on the build system.

However, there is another solution that does not require actually building
host-texinfo: instruct the makefiles to use a dummy makeinfo command
('true').

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/gdb/gdb.mk | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

v2: use INSTALL_TARGET_OPTS for target packages iso INSTALL_OPTS
(INSTALL_STAGING_OPTS not needed: INSTALL_STAGING != YES)
v3: fix INSTALL_TARGET_OPTS to include the actual 'install' make target

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 1c778e9..68a91f1 100644
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
+GDB_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) MAKEINFO=true install
+HOST_GDB_MAKE_OPTS += MAKEINFO=true
+HOST_GDB_INSTALL_OPTS += MAKEINFO=true install
 
 # Apply the Xtensa specific patches
 XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
-- 
2.7.3
