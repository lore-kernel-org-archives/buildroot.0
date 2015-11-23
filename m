From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:12 +0100
Subject: [Buildroot] [PATCH 42/51] package/gdb: extract Xtensa overlay as
	post-extract hook
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <02ada6989e253e945f37a4b1bff06636262cf332.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... like it is done for gcc.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 8455f88..e50bf13 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -42,16 +42,16 @@ HOST_GDB_DEPENDENCIES = host-expat host-ncurses
 
 # Apply the Xtensa specific patches
 ifneq ($(ARCH_XTENSA_CORE_NAME),)
-define GDB_XTENSA_PRE_PATCH
+define GDB_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),gdb)
 endef
-GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
-HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
-define GDB_XTENSA_LEGAL_INFO
+GDB_PRE_PATCH_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
+HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
+define GDB_XTENSA_OVERLAY_LEGAL_INFO
 	$(call arch-xtensa-overlay-legal-info,$($(PKG)_REDIST_SOURCES_DIR))
 endef
-GDB_POST_LEGAL_INFO_HOOKS += GDB_XTENSA_LEGAL_INFO
-HOST_GDB_POST_LEGAL_INFO_HOOKS += GDB_XTENSA_LEGAL_INFO
+GDB_POST_LEGAL_INFO_HOOKS += GDB_XTENSA_OVERLAY_LEGAL_INFO
+HOST_GDB_POST_LEGAL_INFO_HOOKS += GDB_XTENSA_OVERLAY_LEGAL_INFO
 endif
 
 # Prevent gdb to build the documentation
-- 
1.9.1
