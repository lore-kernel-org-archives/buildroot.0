From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 26 Jun 2010 00:15:30 +0200
Subject: [Buildroot] [PATCH 3/5] toolchain: move makefile includes
In-Reply-To: <1277504132-11184-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1277504132-11184-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1277504132-11184-4-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Including a bunch of Makefiles with wildcard makes it impossible
to add new toolchain backends. Avoid that by namely including
needed files.

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
---
 Makefile                         |   16 ++--------------
 toolchain/toolchain-buildroot.mk |   14 ++++++++++++++
 toolchain/toolchain-external.mk  |   16 ++++++++++++++++
 3 files changed, 32 insertions(+), 14 deletions(-)
 create mode 100644 toolchain/toolchain-buildroot.mk
 create mode 100644 toolchain/toolchain-external.mk

diff --git a/Makefile b/Makefile
index fe320df..a167826 100644
--- a/Makefile
+++ b/Makefile
@@ -293,21 +293,9 @@ all: world
 # each selected package to TARGETS if that package was selected
 # in the .config file.
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-# avoid pulling in external toolchain which is broken for toplvl parallel builds
-# Explicit ordering:
-include toolchain/dependencies/dependencies.mk
-include toolchain/binutils/binutils.mk
-include toolchain/ccache/ccache.mk
-include toolchain/elf2flt/elf2flt.mk
-include toolchain/gcc/gcc-uclibc-4.x.mk
-include toolchain/gdb/gdb.mk
-include toolchain/kernel-headers/kernel-headers.mk
-include toolchain/mklibs/mklibs.mk
-include toolchain/sstrip/sstrip.mk
-include toolchain/uClibc/uclibc.mk
+include toolchain/toolchain-buildroot.mk
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-include toolchain/helpers.mk
-include toolchain/*/*.mk
+include toolchain/toolchain-external.mk
 endif
 
 include package/*/*.mk
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
new file mode 100644
index 0000000..1bf714b
--- /dev/null
+++ b/toolchain/toolchain-buildroot.mk
@@ -0,0 +1,14 @@
+# Include files required for the internal toolchain backend
+
+# avoid pulling in external toolchain which is broken for toplvl parallel builds
+# Explicit ordering:
+include toolchain/dependencies/dependencies.mk
+include toolchain/binutils/binutils.mk
+include toolchain/ccache/ccache.mk
+include toolchain/elf2flt/elf2flt.mk
+include toolchain/gcc/gcc-uclibc-4.x.mk
+include toolchain/gdb/gdb.mk
+include toolchain/kernel-headers/kernel-headers.mk
+include toolchain/mklibs/mklibs.mk
+include toolchain/sstrip/sstrip.mk
+include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
new file mode 100644
index 0000000..6c00330
--- /dev/null
+++ b/toolchain/toolchain-external.mk
@@ -0,0 +1,16 @@
+# Required includes for the external toolchain backend
+
+# Explicit ordering:
+include toolchain/helpers.mk
+include toolchain/binutils/binutils.mk
+include toolchain/ccache/ccache.mk
+include toolchain/dependencies/dependencies.mk
+include toolchain/elf2flt/elf2flt.mk
+include toolchain/gcc/gcc-uclibc-3.x.mk
+include toolchain/gcc/gcc-uclibc-4.x.mk
+include toolchain/gdb/gdb.mk
+include toolchain/toolchain-external/ext-tool.mk
+include toolchain/mklibs/mklibs.mk
+include toolchain/sstrip/sstrip.mk
+include toolchain/toolchain-external/ext-tool.mk
+include toolchain/uClibc/uclibc.mk
-- 
1.7.1
