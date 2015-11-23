From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:15 +0100
Subject: [Buildroot] [PATCH 45/51] package/gdb: use the Xtensa macro
	generators
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <75f1261459e0c4927ca7ba4b378ce8203fc6b46f.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index e50bf13..a0380ae 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -40,19 +40,10 @@ endif
 # also need ncurses.
 HOST_GDB_DEPENDENCIES = host-expat host-ncurses
 
-# Apply the Xtensa specific patches
-ifneq ($(ARCH_XTENSA_CORE_NAME),)
-define GDB_XTENSA_OVERLAY_EXTRACT
-	$(call arch-xtensa-overlay-extract,$(@D),gdb)
-endef
-GDB_PRE_PATCH_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
-HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
-define GDB_XTENSA_OVERLAY_LEGAL_INFO
-	$(call arch-xtensa-overlay-legal-info,$($(PKG)_REDIST_SOURCES_DIR))
-endef
-GDB_POST_LEGAL_INFO_HOOKS += GDB_XTENSA_OVERLAY_LEGAL_INFO
-HOST_GDB_POST_LEGAL_INFO_HOOKS += GDB_XTENSA_OVERLAY_LEGAL_INFO
-endif
+GDB_ARCH_XTENSA_OVERLAY_COMPONENT = gdb
+HOST_GDB_ARCH_XTENSA_OVERLAY_COMPONENT = gdb
+$(eval $(arch-xtensa-overlay))
+$(eval $(host-arch-xtensa-overlay))
 
 # Prevent gdb to build the documentation
 define GDB_DISABLE_DOC
-- 
1.9.1
