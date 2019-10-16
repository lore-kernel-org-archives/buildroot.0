From: Alistair Francis <alistair.francis@wdc.com>
Date: Wed, 16 Oct 2019 15:55:25 -0700
Subject: [Buildroot] [PATCH v2] boot/opensbi: bump to 0.5
Message-ID: <20191016225525.12804-1-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OpenSBI to the latest version. We need a patch for RV32 to avoid
hard/soft float build failures.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v2:
 - Fixup title
 - Add COPYING.BSD SHA
 - Apply patch to all OpenSBI builds

 ...Makefile-Don-t-specify-mabi-or-march.patch | 37 +++++++++++++++++++
 boot/opensbi/opensbi.hash                     |  3 +-
 boot/opensbi/opensbi.mk                       |  2 +-
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 boot/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch

diff --git a/boot/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch b/boot/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch
new file mode 100644
index 0000000000..5f554a6c24
--- /dev/null
+++ b/boot/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch
@@ -0,0 +1,37 @@
+From f5871e1f3650d6c8a032928cb5d8ca00c275c377 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Fri, 15 Feb 2019 14:57:41 -0800
+Subject: [PATCH] Makefile: Don't specify mabi or march
+
+To avoid
+    can't link double-float modules with soft-float modules
+errors when building 32-bit openSBI don't specify mabi or march.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ Makefile | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ae68f55..10851fc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -145,7 +145,6 @@ GENFLAGS	+=	$(firmware-genflags-y)
+ CFLAGS		=	-g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
+ CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
+ CFLAGS		+=	-mno-save-restore -mstrict-align
+-CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
+ CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
+ CFLAGS		+=	$(GENFLAGS)
+ CFLAGS		+=	$(platform-cflags-y)
+@@ -158,7 +157,6 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
+ ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
+ ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
+ ASFLAGS		+=	-mno-save-restore -mstrict-align
+-ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
+ ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
+ ASFLAGS		+=	$(GENFLAGS)
+ ASFLAGS		+=	$(platform-asflags-y)
+-- 
+2.20.1
+
diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index 21f802bcbc..47d5930ace 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256 d3060bf51af00204ce90fc73106955c694463b59a5b81be64cf780cd32743abf opensbi-0.4.tar.gz
+sha256 bc82f1e63663cafb7976b324d8a01263510cfd816063dc89e0ccffb9763fb1dd opensbi-0.5.tar.gz
+sha256 82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21 COPYING.BSD
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index e202bd0b97..2df746ab00 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSBI_VERSION = 0.4
+OPENSBI_VERSION = 0.5
 OPENSBI_SITE = $(call github,riscv,opensbi,v$(OPENSBI_VERSION))
 OPENSBI_LICENSE = BSD-2-Clause
 OPENSBI_LICENSE_FILES = COPYING.BSD
-- 
2.23.0
