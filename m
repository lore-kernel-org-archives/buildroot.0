From: Mark Corbin <mark.corbin@embecosm.com>
Date: Sun, 28 Apr 2019 15:49:38 +0100
Subject: [Buildroot] [PATCH v2 2/3] boot/riscv-pk: remove hardcoding of the
 ABI
In-Reply-To: <20190428144939.28964-1-mark.corbin@embecosm.com>
References: <20190428144939.28964-1-mark.corbin@embecosm.com>
Message-ID: <20190428144939.28964-3-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The riscv-pk package is currently hardcoded to always use the
softfloat ABI when compiling, i.e. ilp32 for 32-bit and lp64
for 64-bit. The SiFive HiFive Unleashed board has hardware floating
point support, so we need to be able to build riscv-pk with both
softfloat and hardfloat toolchains.

This patch adds the ability to specify the ABI via --with-abi when
configuring riscv-pk. If this option is not provided then the
compiler default ABI setting will be used instead.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 ...-specify-ABI-or-use-compiler-default.patch | 72 +++++++++++++++++++
 boot/riscv-pk/riscv-pk.mk                     |  5 +-
 2 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 boot/riscv-pk/0001-Add-ability-to-specify-ABI-or-use-compiler-default.patch

diff --git a/boot/riscv-pk/0001-Add-ability-to-specify-ABI-or-use-compiler-default.patch b/boot/riscv-pk/0001-Add-ability-to-specify-ABI-or-use-compiler-default.patch
new file mode 100644
index 0000000000..3cee9a4fd6
--- /dev/null
+++ b/boot/riscv-pk/0001-Add-ability-to-specify-ABI-or-use-compiler-default.patch
@@ -0,0 +1,72 @@
+From 0f7e2c2f61c6bb36a33733e89ec8d79f89d618ae Mon Sep 17 00:00:00 2001
+From: Mark Corbin <mark.corbin@embecosm.com>
+Date: Thu, 18 Apr 2019 12:07:02 +0100
+Subject: [PATCH] Add ability to specify ABI or use compiler default
+
+Allow the ABI to be defined using --with-abi. If this option is
+not provided then the compiler default ABI setting will be used.
+
+Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
+---
+ Makefile.in  | 15 +++++++++++----
+ configure.ac |  4 ++++
+ 2 files changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index aeabdc2..d6b988f 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -51,8 +51,7 @@ else
+ endif
+ 
+ # If --with-arch is not specified, it defaults to whatever the compiler's
+-# default is. The -with-abi is not necessary for this project. Unconditionally
+-# compile it with a no-float ABI. i.e., ilp32 for 32-bit and lp64 for 64-bit.
++# default is.
+ 
+ ifeq (@WITH_ARCH@,)
+   march := -march=$(shell @CC@ -v 2>&1 | \
+@@ -60,8 +59,16 @@ ifeq (@WITH_ARCH@,)
+ else
+   march := -march=@WITH_ARCH@
+ endif
+-is_32bit := $(findstring 32,$(march))
+-mabi := -mabi=$(if $(is_32bit),ilp32,lp64)
++
++# If --with-abi is not specified, it defaults to whatever the compiler's
++# default is.
++
++ifeq (@WITH_ABI@,)
++  mabi := -mabi=$(shell @CC@ -v 2>&1 | \
++                    sed 's/ /\n/g' | grep with-abi | awk -F= '{print $$2}')
++else
++  mabi := -mabi=@WITH_ABI@
++endif
+ 
+ # Installation directories
+ 
+diff --git a/configure.ac b/configure.ac
+index 917179f..180a8db 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -83,6 +83,9 @@ AC_ARG_VAR(RISCV, [top-level RISC-V install directory])
+ AC_ARG_WITH([arch], AS_HELP_STRING([--with-arch], [Set the RISC-V architecture]),
+   [AC_SUBST([WITH_ARCH], $with_arch, [Specify architecture to build the project])])
+ 
++AC_ARG_WITH([abi], AS_HELP_STRING([--with-abi], [Set the RISC-V ABI]),
++  [AC_SUBST([WITH_ABI], $with_abi, [Specify ABI to build the project])])
++
+ AC_ARG_ENABLE([print-device-tree], AS_HELP_STRING([--enable-print-device-tree], [Print DTS when booting]))
+ AS_IF([test "x$enable_print_device_tree" == "xyes"], [
+   AC_DEFINE([PK_PRINT_DEVICE_TREE],,[Define if the DTS is to be displayed])
+@@ -95,6 +98,7 @@ AC_SUBST(CFLAGS)
+ AC_SUBST(LDFLAGS)
+ AC_SUBST([LIBS], ["-lgcc"])
+ AC_SUBST(WITH_ARCH)
++AC_SUBST(WITH_ABI)
+ AC_SUBST(host_alias)
+ 
+ #-------------------------------------------------------------------------
+-- 
+2.19.1
+
diff --git a/boot/riscv-pk/riscv-pk.mk b/boot/riscv-pk/riscv-pk.mk
index 8386dfe168..f82520d221 100644
--- a/boot/riscv-pk/riscv-pk.mk
+++ b/boot/riscv-pk/riscv-pk.mk
@@ -9,8 +9,9 @@ RISCV_PK_SITE = git://github.com/riscv/riscv-pk.git
 RISCV_PK_LICENSE = BSD-3-Clause
 RISCV_PK_LICENSE_FILES = LICENSE
 RISCV_PK_DEPENDENCIES = linux
-RISCV_PK_SUBDIR = build
+RISCV_PK_INSTALL_TARGET = NO
 RISCV_PK_INSTALL_IMAGES = YES
+RISCV_PK_AUTORECONF = YES
 
 define RISCV_PK_CONFIGURE_CMDS
 	mkdir -p $(@D)/build
@@ -31,4 +32,4 @@ define RISCV_PK_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/build/bbl.bin $(BINARIES_DIR)/bbl.bin
 endef
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
2.19.1
