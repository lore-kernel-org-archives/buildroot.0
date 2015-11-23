From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:01 +0100
Subject: [Buildroot] [PATCH 31/51] package/gdb: use the Xtensa variables
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <8ca09e5468f0b87f7d8a4ec76abd4aca20afb297.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... instead of re-computing them over-and-over-again.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 15f394c..44e8240 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -41,11 +41,9 @@ endif
 HOST_GDB_DEPENDENCIES = host-expat host-ncurses
 
 # Apply the Xtensa specific patches
-XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
-ifneq ($(XTENSA_CORE_NAME),)
+ifneq ($(ARCH_XTENSA_CORE_NAME),)
 define GDB_XTENSA_PRE_PATCH
-	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(XTENSA_CORE_NAME).tar \
-		-C $(@D) --strip-components=1 gdb
+	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gdb
 endef
 GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
-- 
1.9.1
