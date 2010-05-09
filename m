From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 10 May 2010 01:11:12 +0200
Subject: [Buildroot] [PATCH 3/6] toolchain: move makefile includes
In-Reply-To: <20100509230759.16258.48956.stgit@roazhon.bzh.lan>
References: <20100509230759.16258.48956.stgit@roazhon.bzh.lan>
Message-ID: <20100509231112.16258.40408.stgit@roazhon.bzh.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

Including a bunch of Makefiles with wildcard makes it impossible
to add new toolchain backends. Avoid that by namely including
needed files.

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
---
 Makefile                         |   17 ++---------------
 toolchain/toolchain-buildroot.mk |   15 +++++++++++++++
 toolchain/toolchain-external.mk  |   16 ++++++++++++++++
 3 files changed, 33 insertions(+), 15 deletions(-)
 create mode 100644 toolchain/toolchain-buildroot.mk
 create mode 100644 toolchain/toolchain-external.mk

diff --git a/Makefile b/Makefile
index 899ec58..e947e9b 100644
--- a/Makefile
+++ b/Makefile
@@ -291,22 +291,9 @@ include .config.cmd
 # each selected package to TARGETS if that package was selected
 # in the .config file.
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-# avoid pulling in external toolchain which is broken for toplvl parallel builds
-# Explicit ordering:
-include toolchain/dependencies/dependencies.mk
-include toolchain/binutils/binutils.mk
-include toolchain/ccache/ccache.mk
-include toolchain/elf2flt/elf2flt.mk
-include toolchain/gcc/gcc-uclibc-3.x.mk
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
 
 ifeq ($(BR2_PACKAGE_LINUX),y)
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
new file mode 100644
index 0000000..da94b42
--- /dev/null
+++ b/toolchain/toolchain-buildroot.mk
@@ -0,0 +1,15 @@
+# Include files required for the internal toolchain backend
+
+# avoid pulling in external toolchain which is broken for toplvl parallel builds
+# Explicit ordering:
+include toolchain/dependencies/dependencies.mk
+include toolchain/binutils/binutils.mk
+include toolchain/ccache/ccache.mk
+include toolchain/elf2flt/elf2flt.mk
+include toolchain/gcc/gcc-uclibc-3.x.mk
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
