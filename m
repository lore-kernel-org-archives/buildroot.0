From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Aug 2020 23:20:56 +0200
Subject: [Buildroot] [git commit] package/qt5: needs host gcc >= 5.0 for
 full C++11
Message-ID: <20200823211400.0037883A66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47349e4561a67f6f29ea930bc16390f96f2b9bc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building qmake requires full C++11, which boils down to gcc >= 5.0,
which is what upstream advertises as a requirement anyway:

    https://doc.qt.io/qt-5.15/supported-platforms.html

    Distribution   | Architecture     | Compiler
    Generic Linux  | x86 and x86_64   | GCC (5 or later), ICC 18.x

Fixes:
    http://autobuild.buildroot.org/results/c3e/c3ee971a72f268e72b69a647e8fd00a8cee7dc91/
    http://autobuild.buildroot.org/results/89c/89c9a88b4e1195e952528574263201d4fbc27570/
    [...]

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pinentry/Config.in  | 5 +++--
 package/qt5/Config.in       | 5 +++--
 package/wireshark/Config.in | 6 ++++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 40e5b3eedd..586ffea295 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -61,6 +61,7 @@ config BR2_PACKAGE_PINENTRY_QT5
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_HOST_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on !BR2_arc
 	depends on !BR2_STATIC_LIBS
@@ -70,10 +71,10 @@ config BR2_PACKAGE_PINENTRY_QT5
 	help
 	  The pinentry-qt5 tool
 
-comment "pinentry-qt5 needs a toolchain w/ wchar, NPTL, gcc >= 5.0, C++, dynamic library"
+comment "pinentry-qt5 needs a host gcc >= 5.0, and a toolchain w/ wchar, NPTL, gcc >= 5.0, C++, dynamic library"
 	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_5
 
 endif
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 5c544ecec4..e897c7cbcb 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -11,18 +11,19 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	# ARM needs BLX, so v5t+
 	depends on !BR2_ARM_CPU_ARMV4
 
-comment "Qt5 needs a toolchain w/ gcc >= 5.0, wchar, NPTL, C++, dynamic library"
+comment "Qt5 needs host g++ >= 5.0, and a toolchain w/ gcc >= 5.0, wchar, NPTL, C++, dynamic library"
 	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_HOST_GCC_AT_LEAST_5 || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 menuconfig BR2_PACKAGE_QT5
 	bool "Qt5"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_HOST_GCC_AT_LEAST_5 # Full C++11
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11, GCC_BUG_57694
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index e3a9b01991..b26aa7a3df 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	bool "Qt5 GUI"
 	default y
 	depends on BR2_INSTALL_LIBSTDCPP # qt5
+	depends on BR2_HOST_GCC_AT_LEAST_5 # qt5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qt5
 	depends on !BR2_arc # qt5
@@ -35,10 +36,11 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	help
 	  Enable Qt5 GUI
 
-comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, gcc >= 5.0"
+comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, host gcc >= 5.0, gcc >= 5.0"
 	depends on !BR2_arc
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
+		!BR2_HOST_GCC_AT_LEAST_5
 
 endif # BR2_PACKAGE_WIRESHARK
 
