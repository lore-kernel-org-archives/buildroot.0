From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Oct 2019 12:23:06 +0100
Subject: [Buildroot] [PATCH] arc/riscv: get rid of immediate-assignment
Message-ID: <20191027112306.346-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Mark Corbin <mark.corbin@embecosm.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - add MArk in Cc
  - further simplify the code  (Arnout)
---
 arch/arch.mk.riscv | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index f3bf2b3467..204e78a57f 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -5,26 +5,16 @@
 
 ifeq ($(BR2_riscv),y)
 
-ifeq ($(BR2_RISCV_64),y)
-GCC_TARGET_ARCH := rv64i
-else
-GCC_TARGET_ARCH := rv32i
-endif
-
-ifeq ($(BR2_RISCV_ISA_RVM),y)
-GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)m
-endif
-ifeq ($(BR2_RISCV_ISA_RVA),y)
-GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)a
-endif
-ifeq ($(BR2_RISCV_ISA_RVF),y)
-GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)f
-endif
-ifeq ($(BR2_RISCV_ISA_RVD),y)
-GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)d
-endif
-ifeq ($(BR2_RISCV_ISA_RVC),y)
-GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
-endif
+GCC_TARGET_ARCH = \
+	$(subst $(space),, \
+		rv \
+		$(if $(BR2_RISCV_64),64,32) \
+		i \
+		$(if $(BR2_RISCV_ISA_RVM),m) \
+		$(if $(BR2_RISCV_ISA_RVA),a) \
+		$(if $(BR2_RISCV_ISA_RVF),f) \
+		$(if $(BR2_RISCV_ISA_RVD),d) \
+		$(if $(BR2_RISCV_ISA_RVC),c) \
+	)
 
 endif
-- 
2.20.1
