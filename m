From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 14:57:09 +0200
Subject: [Buildroot] [git commit] package/qt5: bump minimum gcc requirement
 to 5.0
Message-ID: <20200419124252.E3CB38F192@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24c66484e1bb88961042caf690af3e6bf396ab65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As a side effect of avoiding gcc bug 57694 ([1]) through commit
'GCC: revoke constexpr before 5.0' ([2]) for qtbase the minimum
gcc requirement was lifted to 5.0 ([3], [4]), so bump the
buildroot determined one too.

Adjust the two packages (pinentry, wireshark) which are brave enough
to do a 'select BR2_PACKAGE_QT5' accordingly.

Fixes:
  http://autobuild.buildroot.net/results/74f5249d1ee14c1269685af53a65055da7dc2ee6

  ../../include/QtCore/../../src/corelib/thread/qbasicatomic.h:61:4: error: #error "Qt requires C++11 support"
   #  error "Qt requires C++11 support"

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57694
[2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=c61cedcc5475a77fb94ed12788f61039835f8079
[3] https://codereview.qt-project.org/c/qt/qtbase/+/285582
[4] https://bugreports.qt.io/browse/QTBUG-81761

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pinentry/Config.in  | 6 +++---
 package/qt5/Config.in       | 6 +++---
 package/wireshark/Config.in | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index ef70908502..23f532e2e6 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -61,7 +61,7 @@ config BR2_PACKAGE_PINENTRY_QT5
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5_0
 	depends on !BR2_arc
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_QT5
@@ -70,10 +70,10 @@ config BR2_PACKAGE_PINENTRY_QT5
 	help
 	  The pinentry-qt5 tool
 
-comment "pinentry-qt5 needs a toolchain w/ wchar, NPTL, gcc >= 4.8, C++, dynamic library"
+comment "pinentry-qt5 needs a toolchain w/ wchar, NPTL, gcc >= 5.0, C++, dynamic library"
 	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5_0 || \
 		BR2_STATIC_LIBS
 
 endif
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 77dce16038..cd9c93735d 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -11,19 +11,19 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	# ARM needs BLX, so v5t+
 	depends on !BR2_ARM_CPU_ARMV4
 
-comment "Qt5 needs a toolchain w/ gcc >= 4.8, wchar, NPTL, C++, dynamic library"
+comment "Qt5 needs a toolchain w/ gcc >= 5.0, wchar, NPTL, C++, dynamic library"
 	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5_0
 
 menuconfig BR2_PACKAGE_QT5
 	bool "Qt5"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5_0 # C++11, GCC_BUG_57694
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
 	depends on !BR2_arc
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index e52edb9f69..f55cfeb497 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	default y
 	depends on BR2_INSTALL_LIBSTDCPP # qt5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5_0 # qt5
 	depends on !BR2_arc # qt5
 	depends on BR2_PACKAGE_HAS_UDEV # qt5 input
 	select BR2_PACKAGE_QT5
@@ -36,10 +36,10 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	help
 	  Enable Qt5 GUI
 
-comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, gcc >= 4.8"
+comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, gcc >= 5.0"
 	depends on !BR2_arc
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5_0
 
 endif # BR2_PACKAGE_WIRESHARK
 
