From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 22:50:06 +0200
Subject: [Buildroot] [PATCH 4/8] gdb: needs host-ncurses on the host
In-Reply-To: <1410814210-10002-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1410814210-10002-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1410814210-10002-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 2474fb0bf1a786f3a170631f3dbce8b38092f986 ("host-gdb: enable
terminal user interface support") has added TUI support to host gdb,
and therefore added a dependency on host-ncurses when TUI support is
enabled.

However, host-ncurses is not only needed for TUI support, it is needed
for gdb in all cases as well, so this commit adds a dependency of
host-gdb to host-ncurses.

Fixes:

  http://autobuild.buildroot.org/results/153/153dbdc42103074f7a0895e8871e2eee4eae3325/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 07f6ba3..41d3689 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -40,8 +40,9 @@ GDB_DEPENDENCIES = ncurses
 endif
 
 # For the host variant, we really want to build with XML support,
-# which is needed to read XML descriptions of target architectures.
-HOST_GDB_DEPENDENCIES = host-expat
+# which is needed to read XML descriptions of target architectures. We
+# also need ncurses.
+HOST_GDB_DEPENDENCIES = host-expat host-ncurses
 
 # Apply the Xtensa specific patches
 XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
@@ -127,7 +128,6 @@ HOST_GDB_CONF_OPT = \
 	--disable-sim
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
-	HOST_GDB_DEPENDENCIES += host-ncurses
 	HOST_GDB_CONF_OPT += --enable-tui
 else
 	HOST_GDB_CONF_OPT += --disable-tui
-- 
2.0.0
