From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 11:50:00 +0200
Subject: [Buildroot] [git commit] package/opencv: depends on GUI toolkits,
	rather than select them
Message-ID: <20150706095005.AEFC07FC2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6a24e24462e0465364314c1e0bf9dd5a079ac96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we only support either Qt4 or gtk2, but OpenCV also
additionally supports Qt5 or gtk3, making for a choice of four
toolkits, one of: Qt4, Qt5, gtk3, gtk2 (and obviously, none).

Since Buildroot does not support coexistence of Qt4 and Qt5, we
can no longer select one and depend on the other, like so:

    config BR2_PKG_OCV_WITH_QT4
        bool "Qt4"
        depends on !BR2_PKG_QT5
        select BR2_PKG_QT

    config BR2_PKG_OCV_WITH_QT5
        bool "Qt5"
        depends on !BR2_PKG_QT
        select BR2_PKG_QT5

otherwise, we'd get a circular dependency chain in Kconfig, which would
complain with:

  package/opencv/Config.in:57:error: recursive dependency detected!
  package/opencv/Config.in:57:    choice <choice> contains symbol BR2_PKG_OCV_WITH_QT5
  package/opencv/Config.in:111:   symbol BR2_PKG_OCV_WITH_QT5 depends on BR2_PKG_QT
  package/qt/Config.in:5: symbol BR2_PKG_QT is selected by BR2_PKG_OCV_WITH_QT
  package/opencv/Config.in:98:    symbol BR2_PKG_OCV_WITH_QT is part of choice <choice>

Instead, we need to depend on either Qt version.

So, to have a consistent choice, we make all support for GUI toolkits
actually depend on the toolkit, rather than select it.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: split-out the switch-selects-to-depends hunk
 from the add-qt5 hunk]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in |   25 +++++++------------------
 1 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index c3542c4..5dd39ca 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -63,36 +63,25 @@ config BR2_PACKAGE_OPENCV_GUI_NONE
 
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk2"
-	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
-	depends on BR2_USE_MMU # libgtk2 -> libglib2
-	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2
 
-comment "gtk2 needs X.org and a toolchain w/ wchar, threads, C++"
+comment "gtk2 support needs libgtk2"
 	depends on BR2_USE_MMU # libgtk2 -> glib2
 	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
-	depends on !BR2_PACKAGE_XORG7 || \
-		!BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PACKAGE_LIBGTK2
 
 config BR2_PACKAGE_OPENCV_WITH_QT
 	bool "qt4"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # qt
-	select BR2_PACKAGE_QT
+	depends on BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_TEST
 	help
-	  Use Qt with QtTest module and STL support
+	  Use Qt4 with QtTest and QtGui modules and STL support, as GUI toolkit.
 
-comment "qt4 needs a toolchain w/ C++"
+comment "qt4 support needs qt"
 	depends on BR2_USE_MMU # qt
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PACKAGE_QT
 
 endchoice
 
