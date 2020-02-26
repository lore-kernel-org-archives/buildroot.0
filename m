From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 27 Feb 2020 00:22:37 +0100
Subject: [Buildroot] [PATCH] package/qt5/qt5tools: mark qdoc option as broken
Message-ID: <20200226232237.292826-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When qdoc option was added by [1] for Qt 5.12, the host-clang
dependecy was added as if host-clang would provide a host native
compiler.

The host-clang package provide host libclang libraries needed by
the cross-build process for target packages. The default target
arch is set with the target architecture. It would require adding
compiler flag to select the architecture to generate binaries
(host or target).

We can consider adding native build suport by merging the
patch [3]. But it was not merged in time for Buildroot
2020.02.

So in the current state, host-clang is added to qt5tools
dependency without taking into account BR2_PACKAGE_LLVM_ARCH_SUPPORTS.

For some architectures supported by Qt5 (i.e riscv), two
llvm build options are not correcltly set:

-DLLVM_TARGETS_TO_BUILD="" -DLLVM_TARGET_ARCH=

So the build is broken.

But even with host native support in llvm/clang host packages, the
host-clang dependency itself increase a lot the build time.

On a laptop with a i7-8565U CPU @ 1.80GHz, host-llvm takes 1100 sec
(18,3min) to build and host-clang takes 1200 sec (20min) to build.
qt5tools takes 18sec to build.

Increasing the build time by 40min just for the sake of building qdoc
is not great.

Instead we may consider adding a new check in support/dependencies/dependencies.sh
for llvm/clang installed on the build machine.
This llvm/clang would be used for building qdoc (or mabe other host package).

But we need to be careful for the case where host-llvm and host-clang
package are already build.

Then, the qt5tools package would set LLVM_INSTALL_DIR in the
additional environment variables to pass to make in the build step,
to provide the patch to llvm/clang headers and libraries.

Something like:
define QT5TOOLS_BUILD_CMDS
	$(TARGET_MAKE_ENV) LLVM_INSTALL_DIR="`/usr/bin/llvm-config --prefix`" \
		$(MAKE) -C $(@D) sub-src-qmake_all
[...]

Since all possible solution are too late for 2020.02 release, disable
BR2_PACKAGE_QT5TOOLS_QDOC_TOOL option.

Fixes:
http://autobuild.buildroot.net/results/3c0/3c0f27e953fa41bd973003a4b42b768b1636c91a/build-end.log

[1] 57c1d3be4ecadd6802414a0943185c4ab6d82937
[2] https://www.linuxembedded.fr/2018/07/llvmclang-integration-into-buildroot
[3] http://patchwork.ozlabs.org/patch/1204740/

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Yann E. MORIN <yann.morin@orange.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5tools/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
index 14178abc29..5ef85a88b3 100644
--- a/package/qt5/qt5tools/Config.in
+++ b/package/qt5/qt5tools/Config.in
@@ -19,6 +19,9 @@ config BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
 
 config BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
 	bool "qdoc host tool"
+	# Needs llvm-config and libclang installed on the build machine.
+	# host-llvm and host-clang packages doesn't provide a host compiler.
+	depends on BROKEN
 	help
 	  This option enables the qdoc host tool.
 
-- 
2.24.1
