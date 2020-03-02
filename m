From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Mar 2020 23:12:41 +0100
Subject: [Buildroot] [git commit] package/qt5tools: hide qdoc with llvm
 dependencies
Message-ID: <20200302220158.538C38F15D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=546a4e1c1f5e219566469511c998ec7c7152e5ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building qdoc requires a llvm and clang for the host.

However, there is a limitation in the llvm and clang packages in
Buildroot, which makes it impossible to have a host variant without
a target variant.

So, propagate the dependencies of the target llvm and clang, to ensure
we can only have a host-llvm and -clang packages that are correctly
built.

Note that we do propagate all of the dependencies (instead of just the
architecture part), to be consistent.

Reported-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5tools/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
index 14178abc29..60106c1ee3 100644
--- a/package/qt5/qt5tools/Config.in
+++ b/package/qt5/qt5tools/Config.in
@@ -19,6 +19,16 @@ config BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
 
 config BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
 	bool "qdoc host tool"
+	# Needs llvm-config and libclang for the host, which is not
+	# currently supported in Buildroot, unless the target is
+	# already supported by llvm.
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm, clang
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # llvm, clang
+	depends on BR2_TOOLCHAIN_HAS_THREADS # llvm, clang
+	depends on BR2_INSTALL_LIBSTDCPP # llvm, clang
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # llvm, clang
+	depends on !BR2_STATIC_LIBS # llvm, clang
+	depends on BR2_USE_WCHAR # llvm, clang
 	help
 	  This option enables the qdoc host tool.
 
