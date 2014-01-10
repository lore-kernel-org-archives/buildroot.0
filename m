From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2014 15:03:53 +0100
Subject: [Buildroot] [git commit] deprecated handling: introduce
	BR2_DEPRECATED_SINCE_xxxx_xx
Message-ID: <20140110141524.1307C9C420@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba4ad9d27c4ddf9f2d1368a978f622bd66850e72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to keep better track of when a feature got deprecated, and hence
when it can be removed, a new set of symbols BR2_DEPRECATED_SINCE_xxxx_xx is
introduced. These symbols are automatically selected when BR2_DEPRECATED is
selected, and thus are transparent to the user.
A deprecated feature will no longer depend on BR2_DEPRECATED directly, but
rather on the appropriate BR2_DEPRECATED_SINCE_xxxx_xx. If that symbol does
not yet exist, it has to be created in Config.in.
When removing a deprecated feature, one should also check whether this was
the last feature using the BR2_DEPRECATED_SINCE_xxxx_xx symbol, in which
case the latter can be removed from Config.in.

A followup patch will make sure the overview is added to the list of
deprecated features in the manual, so that a buildroot core developer can
easily determine which features to remove in a given development cycle.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                              |   42 +++++++++++++++++++++++++++++++-
 arch/Config.in.mips                    |    8 +++---
 fs/squashfs/Config.in                  |    2 +-
 package/autoconf/Config.in             |    2 +-
 package/automake/Config.in             |    2 +-
 package/bison/Config.in                |    4 ++-
 package/busybox/Config.in              |    2 +-
 package/ccache/Config.in               |    2 +-
 package/flex/Config.in                 |    3 +-
 package/gcc/Config.in.host             |    4 +-
 package/gdb/Config.in.host             |    4 +-
 package/gob2/Config.in                 |    3 +-
 package/linux-headers/Config.in.host   |   14 +++++-----
 package/lzma/Config.in                 |    4 +-
 package/m4/Config.in                   |    3 +-
 package/squashfs3/Config.in            |    4 +-
 package/ttcp/Config.in                 |    2 +-
 package/vala/Config.in                 |    4 +-
 package/xstroke/Config.in              |    2 +-
 support/scripts/gen-manual-lists.py    |    4 ++-
 toolchain/toolchain-external/Config.in |    8 +++---
 21 files changed, 85 insertions(+), 38 deletions(-)

diff --git a/Config.in b/Config.in
index d55e57c..b523b76 100644
--- a/Config.in
+++ b/Config.in
@@ -254,6 +254,46 @@ config BR2_DEPRECATED
 	help
 	  This option hides outdated/obsolete versions of packages.
 
+if BR2_DEPRECATED
+
+config BR2_DEPRECATED_SINCE_2010_05
+	bool
+	default y
+
+config BR2_DEPRECATED_SINCE_2010_11
+	bool
+	default y
+
+config BR2_DEPRECATED_SINCE_2012_05
+	bool
+	default y
+
+config BR2_DEPRECATED_SINCE_2012_11
+	bool
+	default y
+
+config BR2_DEPRECATED_SINCE_2013_02
+	bool
+	default y
+
+config BR2_DEPRECATED_SINCE_2013_05
+	bool
+	default y
+
+config BR2_DEPRECATED_SINCE_2013_08
+	bool
+	default y
+
+config BR2_DEPRECATED_SINCE_2013_11
+	bool
+	default y
+
+config BR2_DEPRECATED_SINCE_2014_02
+	bool
+	default y
+
+endif
+
 config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
 	help
@@ -443,7 +483,7 @@ config BR2_PREFER_STATIC_LIB
 config BR2_HAVE_DOCUMENTATION
 	bool "documentation on the target"
 	# We no longer want to support a toolchain on the target
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2012_11
 	help
 	  Install the documentation, including manual pages and info
 	  pages, on the target.
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 9b3fff4..d9c0c02 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -11,16 +11,16 @@ choice
 
 config BR2_mips_1
 	bool "mips I (generic)"
-	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED
+	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED_SINCE_2013_11
 config BR2_mips_2
 	bool "mips II"
-	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED
+	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED_SINCE_2013_11
 config BR2_mips_3
 	bool "mips III"
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2013_11
 config BR2_mips_4
 	bool "mips IV"
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2013_11
 config BR2_mips_32
 	bool "mips 32"
 	depends on !BR2_ARCH_IS_64
diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index fb696bd..ff3b884 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -15,7 +15,7 @@ config BR2_TARGET_ROOTFS_SQUASHFS4
 	bool "4.x"
 
 config BR2_TARGET_ROOTFS_SQUASHFS3
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2010_05
 	bool "3.x"
 
 endchoice
diff --git a/package/autoconf/Config.in b/package/autoconf/Config.in
index 60128e9..27f24e4 100644
--- a/package/autoconf/Config.in
+++ b/package/autoconf/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_AUTOCONF
 	bool "autoconf"
 	# We no longer support a toolchain on the target
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2012_11
 	select BR2_PACKAGE_PERL
 	help
 	  Extensible program for developing configure scripts.  These
diff --git a/package/automake/Config.in b/package/automake/Config.in
index e2f6cc7..ed5060e 100644
--- a/package/automake/Config.in
+++ b/package/automake/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake"
 	# We no longer support a toolchain on the target
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2012_11
 	select BR2_PACKAGE_AUTOCONF
 	select BR2_PACKAGE_PERL
 	help
diff --git a/package/bison/Config.in b/package/bison/Config.in
index cd0dbc4..8d88430 100644
--- a/package/bison/Config.in
+++ b/package/bison/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_BISON
 	# m4 uses fork()
 	depends on BR2_USE_MMU
 	# development tool, useless on the target
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2014_02
 	help
 	  General-purpose parser generator that converts a
 	  grammar description for an LALR context-free grammar into a C
@@ -14,4 +14,6 @@ config BR2_PACKAGE_BISON
 	  http://www.gnu.org/software/bison/
 
 comment "bison needs a toolchain w/ wchar"
+	depends on BR2_DEPRECATED_SINCE_2014_02
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 66c0673..d2d8fa0 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -19,7 +19,7 @@ choice
 
 	config BR2_BUSYBOX_VERSION_1_19_X
 		bool "BusyBox 1.19.x"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED_SINCE_2014_02
 
 	config BR2_BUSYBOX_VERSION_1_20_X
 		bool "BusyBox 1.20.x"
diff --git a/package/ccache/Config.in b/package/ccache/Config.in
index accebf5..28d9468 100644
--- a/package/ccache/Config.in
+++ b/package/ccache/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_CCACHE
 	# needs fork()
 	depends on BR2_USE_MMU
 	# We no longer support a toolchain on the target
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2013_02
 	help
 	  ccache is a compiler cache. It speeds up recompilation by
 	  caching previous compilations and detecting when the same
diff --git a/package/flex/Config.in b/package/flex/Config.in
index 6af9951..194b6a2 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -16,12 +16,13 @@ config BR2_PACKAGE_FLEX_BINARY
 	# runtime dependency
 	select BR2_PACKAGE_M4
 	# development tool, useless on the target
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2014_02
 	depends on BR2_USE_WCHAR # m4
 	help
 	  Install the flex binary tool in the target filesystem.
 
 comment "flex binary needs a toolchain w/ wchar"
+	depends on BR2_DEPRECATED_SINCE_2014_02
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 186ba80..87543d9 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -124,7 +124,7 @@ comment "C++ support broken in uClibc with locale enabled with gcc 4.2"
 config BR2_INSTALL_OBJC
 	bool "Enable Objective-C support"
 	depends on !BR2_avr32
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2013_11
 	help
 	  Enable the support for the Objective-C language in the
 	  cross-compiler, and install the Objective-C runtime to the
@@ -133,7 +133,7 @@ config BR2_INSTALL_OBJC
 config BR2_INSTALL_FORTRAN
 	bool "Enable Fortran support"
 	depends on !BR2_avr32
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2013_11
 	select BR2_PACKAGE_LIBMPFR
 	help
 	  Enable the support for the Fortran language in the
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index de0e0be..d5e7814 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -34,12 +34,12 @@ choice
 	config BR2_GDB_VERSION_7_2
 		bool "gdb 7.2.x"
 		depends on !BR2_bfin
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED_SINCE_2013_02
 
 	config BR2_GDB_VERSION_7_3
 		bool "gdb 7.3.x"
 		depends on !BR2_bfin
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED_SINCE_2013_02
 
 	config BR2_GDB_VERSION_7_4
 		bool "gdb 7.4.x"
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index faeb8b3..bd9ba1f 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_GOB2
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_BISON
 	# development tool, useless on the target
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2014_02
 	help
 	  GOB (GTK+ Object Builder) is a preprocessor which simplifies
 	  the writing of GObjects in C.
@@ -16,4 +16,5 @@ config BR2_PACKAGE_GOB2
 
 comment "gob2 needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
+	depends on BR2_DEPRECATED_SINCE_2014_02
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f628a74..6d7b447 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -20,7 +20,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_1
 		bool "Linux 3.1.x kernel headers"
-		depends on BR2_DEPRECATED && !BR2_arc
+		depends on BR2_DEPRECATED_SINCE_2013_02 && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_2
 		bool "Linux 3.2.x kernel headers"
@@ -28,7 +28,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_3
 		bool "Linux 3.3.x kernel headers"
-		depends on BR2_DEPRECATED && !BR2_arc
+		depends on BR2_DEPRECATED_SINCE_2013_02 && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_4
 		bool "Linux 3.4.x kernel headers"
@@ -36,23 +36,23 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_5
 		bool "Linux 3.5.x kernel headers"
-		depends on BR2_DEPRECATED && !BR2_arc
+		depends on BR2_DEPRECATED_SINCE_2013_02 && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_6
 		bool "Linux 3.6.x kernel headers"
-		depends on BR2_DEPRECATED && !BR2_arc
+		depends on BR2_DEPRECATED_SINCE_2013_05 && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_7
 		bool "Linux 3.7.x kernel headers"
-		depends on BR2_DEPRECATED && !BR2_arc
+		depends on BR2_DEPRECATED_SINCE_2013_05 && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_8
 		bool "Linux 3.8.x kernel headers"
-		depends on BR2_DEPRECATED && !BR2_arc
+		depends on BR2_DEPRECATED_SINCE_2013_08 && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_9
 		bool "Linux 3.9.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED_SINCE_2013_11
 
 	config BR2_KERNEL_HEADERS_3_10
 		bool "Linux 3.10.x kernel headers"
diff --git a/package/lzma/Config.in b/package/lzma/Config.in
index 5a55103..d7e8827 100644
--- a/package/lzma/Config.in
+++ b/package/lzma/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LZMA
 	bool "lzma"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2010_11
 	help
 	  Lempel Ziv compression method (LZMA) is a compression
 	  algorithm with high compression ratio.
@@ -9,5 +9,5 @@ config BR2_PACKAGE_LZMA
 	  http://tukaani.org/lzma/
 
 comment "lzma needs a toolchain w/ C++"
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2010_11
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/m4/Config.in b/package/m4/Config.in
index 7830b22..e2ce5b3 100644
--- a/package/m4/Config.in
+++ b/package/m4/Config.in
@@ -4,12 +4,13 @@ config BR2_PACKAGE_M4
 	# uses fork()
 	depends on BR2_USE_MMU
 	# development tool, useless on the target
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2014_02
 	help
 	  An implementation of the traditional Unix macro processor.
 
 	  http://www.gnu.org/software/m4/m4.html
 
 comment "m4 needs a toolchain w/ wchar"
+	depends on BR2_DEPRECATED_SINCE_2014_02
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/squashfs3/Config.in b/package/squashfs3/Config.in
index 365eb6a..201af05 100644
--- a/package/squashfs3/Config.in
+++ b/package/squashfs3/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SQUASHFS3
 	bool "squashfs3"
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2010_05
 	depends on BR2_LARGEFILE
 	help
 	  Tools to generate SquashFS 3.x filesystems.
@@ -8,5 +8,5 @@ config BR2_PACKAGE_SQUASHFS3
 	  http://squashfs.sourceforge.net/
 
 comment "squashfs3 needs a toolchain w/ largefile"
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2010_05
 	depends on !BR2_LARGEFILE
diff --git a/package/ttcp/Config.in b/package/ttcp/Config.in
index cf68eff..53b1c32 100644
--- a/package/ttcp/Config.in
+++ b/package/ttcp/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TTCP
 	bool "ttcp"
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2012_05
 	help
 	  Benchmarking tool for determining TCP and UDP performance.
 
diff --git a/package/vala/Config.in b/package/vala/Config.in
index b9477bf..239c003 100644
--- a/package/vala/Config.in
+++ b/package/vala/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_VALA
 	bool "vala"
 	# We no longer support a toolchain on the target
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2013_05
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
@@ -14,6 +14,6 @@ config BR2_PACKAGE_VALA
 	  http://live.gnome.org/Vala
 
 comment "vala needs a toolchain w/ wchar, threads"
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2013_05
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/xstroke/Config.in b/package/xstroke/Config.in
index 4f3f5f6..813c074 100644
--- a/package/xstroke/Config.in
+++ b/package/xstroke/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_XSTROKE
 	bool "xstroke"
 	depends on BR2_PACKAGE_XORG7
 	# dead upstream, probably not many users
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2013_02
 	select BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXPM
diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index 4562d7e..94f403e 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -234,7 +234,9 @@ class Buildroot:
         """ Return True if the symbol is marked as deprecated, otherwise False.
 
         """
-        return self._deprecated in symbol.get_referenced_symbols()
+        # This also catches BR2_DEPRECATED_SINCE_xxxx_xx
+        return bool([ symbol for x in symbol.get_referenced_symbols()
+            if x.get_name().startswith(self._deprecated.get_name()) ])
 
     def _is_package(self, symbol):
         """ Return True if the symbol is a package or a host package, otherwise
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f5a5c0f..e3d4bb9 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -721,7 +721,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
 	depends on BR2_microblazeel
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2014_02
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -735,7 +735,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	depends on BR2_microblazeel
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2014_02
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
@@ -747,7 +747,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
 	depends on BR2_microblazebe
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2014_02
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -761,7 +761,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	depends on BR2_microblazebe
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_DEPRECATED
+	depends on BR2_DEPRECATED_SINCE_2014_02
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
