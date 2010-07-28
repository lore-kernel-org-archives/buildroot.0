From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 28 Jul 2010 16:27:09 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain: move makefile
	includes
Message-ID: <20100728152234.D79CC8345A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ed0200993e38194314c44f3eb6952fca25b2255a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Including a bunch of Makefiles with wildcard makes it impossible to add
new toolchain backends. Avoid that by namely including needed files.

The external toolchain still needs to include all the toolchain/*/*.mk
sub-makefiles, as they are needed to build a toolchain that runs on the
target. It is to be noted that the cross-toolchain is not built in this
case, as the make-targets to build the cross-toolchain are not present
in the $(BASE_TARGETS) variable, which is later used to create the
dependency rules.

Also, the comment 'Explicit ordering' has been removed, as it is mis-
leading. It is make's responsibility to create the proper ordering based
on the dependency rules it finds in the Makefiles

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                         |   16 ++--------------
 toolchain/toolchain-buildroot.mk |   12 ++++++++++++
 toolchain/toolchain-external.mk  |   14 ++++++++++++++
 3 files changed, 28 insertions(+), 14 deletions(-)
 create mode 100644 toolchain/toolchain-buildroot.mk
 create mode 100644 toolchain/toolchain-external.mk

diff --git a/Makefile b/Makefile
index b1d5079..619d8ea 100644
--- a/Makefile
+++ b/Makefile
@@ -294,21 +294,9 @@ all: world
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
index 0000000..d879697
--- /dev/null
+++ b/toolchain/toolchain-buildroot.mk
@@ -0,0 +1,12 @@
+# Include files required for the internal toolchain backend
+
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
index 0000000..6f1f641
--- /dev/null
+++ b/toolchain/toolchain-external.mk
@@ -0,0 +1,14 @@
+# Required includes for the external toolchain backend
+
+include toolchain/helpers.mk
+include toolchain/binutils/binutils.mk
+include toolchain/ccache/ccache.mk
+include toolchain/dependencies/dependencies.mk
+include toolchain/elf2flt/elf2flt.mk
+include toolchain/gcc/gcc-uclibc-4.x.mk
+include toolchain/gdb/gdb.mk
+include toolchain/kernel-headers/kernel-headers.mk
+include toolchain/mklibs/mklibs.mk
+include toolchain/sstrip/sstrip.mk
+include toolchain/toolchain-external/ext-tool.mk
+include toolchain/uClibc/uclibc.mk
-- 
1.7.1
