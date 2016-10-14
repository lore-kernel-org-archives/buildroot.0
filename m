From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 19:32:43 +0200
Subject: [Buildroot] [git commit] gdb: unbreak host/target install step
Message-ID: <20161014181012.92CCC822CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ae8d1162d92f14a0445fc497f473fde0aee6c3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 12306a81f8edc (gdb: get rid of host-texinfo dependency) tried to
append MAKEINFO=true to the host/target make install arguments, but as the
default values for these are only added when (host-)autotools-package is
evaluated (and only if empty), this effectively drops the default values and
we ended up without the 'install' target and nothing got installed.

To fix this, specify the full install arguments.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 0e7abfd..ccf9e49 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -39,9 +39,9 @@ HOST_GDB_DEPENDENCIES = host-expat host-ncurses
 
 # Disable building documentation
 GDB_MAKE_OPTS += MAKEINFO=true
-GDB_INSTALL_TARGET_OPTS += MAKEINFO=true
+GDB_INSTALL_TARGET_OPTS += MAKEINFO=true DESTDIR=$(TARGET_DIR) install
 HOST_GDB_MAKE_OPTS += MAKEINFO=true
-HOST_GDB_INSTALL_OPTS += MAKEINFO=true
+HOST_GDB_INSTALL_OPTS += MAKEINFO=true install
 
 # Apply the Xtensa specific patches
 XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
