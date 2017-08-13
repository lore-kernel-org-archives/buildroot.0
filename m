From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sun, 13 Aug 2017 09:56:49 -0400
Subject: [Buildroot] [PATCH v7 2/3] qt5webengine: new package
In-Reply-To: <20170813135650.14067-1-gael.portay@savoirfairelinux.com>
References: <20170813135650.14067-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170813135650.14067-3-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is based on works [1] and [2].

The chromium.inc has been generated using the following command.

	( echo 'CHROMIUM_LICENSE_FILES = \' &&
	  cd output/build/qt5webengine-5.9.1/ && \
	  find "src/3rdparty/chromium/" -type f -iname "*LICENSE*" -o -iname "*COPYING*" -o -iname "*GPL*" | \
	  sed -e '/\.asm$/d' \
	      -e '/\.h$/d' \
	      -e '/\.c$/d' \
	      -e '/\.cc$/d' \
	      -e '/\.cpp$/d' \
	      -e '/\.pyc\?$/d' \
	      -e '/\.pl$/d' \
	      -e '/\.sha1$/d' \
	      -e '/\.patch$/d' \
	      -e '/licensecheck/d' \
	      -e 's,^,\t,' \
	      -e 's,$, \\,' | \
	  sort && \
	  echo '' ) >package/qt5/qt5webengine/chromium.inc

[1]: http://lists.busybox.net/pipermail/buildroot/2015-July/132010.html
[2]: https://patchwork.ozlabs.org/patch/640633/

Cc: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 DEVELOPERS                                         |   1 +
 package/qt5/Config.in                              |   1 +
 .../0001-Always-compile-QWebEnginePage-print.patch | 244 ++++++++++++++++
 package/qt5/qt5webengine/Config.in                 |  75 +++++
 package/qt5/qt5webengine/chromium.inc              | 310 +++++++++++++++++++++
 package/qt5/qt5webengine/qt5webengine.hash         |   2 +
 package/qt5/qt5webengine/qt5webengine.mk           |  80 ++++++
 7 files changed, 713 insertions(+)
 create mode 100644 package/qt5/qt5webengine/5.9.1/0001-Always-compile-QWebEnginePage-print.patch
 create mode 100644 package/qt5/qt5webengine/Config.in
 create mode 100644 package/qt5/qt5webengine/chromium.inc
 create mode 100644 package/qt5/qt5webengine/qt5webengine.hash
 create mode 100644 package/qt5/qt5webengine/qt5webengine.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f3944e274..a6f84e77e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -630,6 +630,7 @@ F:	package/zxing-cpp/
 
 N:	Ga?l Portay <gael.portay@savoirfairelinux.com>
 F:	package/qt5/qt5virtualkeyboard/
+F:	package/qt5/qt5webengine/
 
 N:	Gary Bisson <gary.bisson@boundarydevices.com>
 F:	board/boundarydevices/
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index abaa58499..f2a1f378c 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -79,6 +79,7 @@ source "package/qt5/qt5tools/Config.in"
 source "package/qt5/qt5virtualkeyboard/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5webkit/Config.in"
+source "package/qt5/qt5webengine/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5webengine/5.9.1/0001-Always-compile-QWebEnginePage-print.patch b/package/qt5/qt5webengine/5.9.1/0001-Always-compile-QWebEnginePage-print.patch
new file mode 100644
index 000000000..b807011d7
--- /dev/null
+++ b/package/qt5/qt5webengine/5.9.1/0001-Always-compile-QWebEnginePage-print.patch
@@ -0,0 +1,244 @@
+From 085c2c529473bbe9dd7c8c5698a45053520cc423 Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?J=C3=BCri=20Valdmann?= <juri.valdmann@qt.io>
+Date: Tue, 20 Jun 2017 15:36:43 +0200
+Subject: [PATCH 1/1] Always compile QWebEnginePage::print
+
+- Remove two out of five layers of ifdefs around and inside this method.
+- Now always compiled but will yield an error if printing is disabled.
+- Remove printing-related ifdefs from demobrowser.
+
+Task-number: QTBUG-61510
+Change-Id: I79781189d3d3fb62db0a2216b2b989e3fa1d1f86
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+Reviewed-by: Rolf Eike Beer <eb@emlix.com>
+---
+ examples/webenginewidgets/demobrowser/browsermainwindow.cpp | 12 ------------
+ examples/webenginewidgets/demobrowser/browsermainwindow.h   |  6 ------
+ examples/webenginewidgets/demobrowser/printtopdfdialog.cpp  |  7 -------
+ src/webenginewidgets/api/qwebenginepage.cpp                 | 10 ++--------
+ src/webenginewidgets/api/qwebenginepage.h                   |  8 --------
+ 5 files changed, 2 insertions(+), 41 deletions(-)
+
+diff --git a/examples/webenginewidgets/demobrowser/browsermainwindow.cpp b/examples/webenginewidgets/demobrowser/browsermainwindow.cpp
+index 327d7a9d..14d49f7f 100644
+--- a/examples/webenginewidgets/demobrowser/browsermainwindow.cpp
++++ b/examples/webenginewidgets/demobrowser/browsermainwindow.cpp
+@@ -109,9 +109,7 @@ BrowserMainWindow::BrowserMainWindow(QWidget *parent, Qt::WindowFlags flags)
+     , m_historyForward(0)
+     , m_stop(0)
+     , m_reload(0)
+-#ifndef QT_NO_PRINTER
+     , m_currentPrinter(nullptr)
+-#endif
+ {
+     setToolButtonStyle(Qt::ToolButtonFollowStyle);
+     setAttribute(Qt::WA_DeleteOnClose, true);
+@@ -312,9 +310,7 @@ void BrowserMainWindow::setupMenu()
+ #if defined(QWEBENGINEPAGE_PRINT)
+     fileMenu->addAction(tr("P&rint Preview..."), this, SLOT(slotFilePrintPreview()));
+ #endif
+-#ifndef QT_NO_PRINTER
+     fileMenu->addAction(tr("&Print..."), this, SLOT(slotFilePrint()), QKeySequence::Print);
+-#endif
+     fileMenu->addAction(tr("&Print to PDF..."), this, SLOT(slotFilePrintToPDF()));
+     fileMenu->addSeparator();
+ 
+@@ -702,23 +698,19 @@ void BrowserMainWindow::slotFileOpen()
+ 
+ void BrowserMainWindow::slotFilePrintPreview()
+ {
+-#ifndef QT_NO_PRINTPREVIEWDIALOG
+     if (!currentTab())
+         return;
+     QPrintPreviewDialog *dialog = new QPrintPreviewDialog(this);
+     connect(dialog, SIGNAL(paintRequested(QPrinter*)),
+             currentTab(), SLOT(print(QPrinter*)));
+     dialog->exec();
+-#endif
+ }
+ 
+ void BrowserMainWindow::slotFilePrint()
+ {
+-#ifndef QT_NO_PRINTER
+     if (!currentTab())
+         return;
+     printRequested(currentTab()->page());
+-#endif
+ }
+ 
+ void BrowserMainWindow::slotHandlePdfPrinted(const QByteArray& result)
+@@ -751,7 +743,6 @@ void BrowserMainWindow::slotFilePrintToPDF()
+     currentTab()->page()->printToPdf(invoke(this, &BrowserMainWindow::slotHandlePdfPrinted), dialog->pageLayout());
+ }
+ 
+-#ifndef QT_NO_PRINTER
+ void BrowserMainWindow::slotHandlePagePrinted(bool result)
+ {
+     Q_UNUSED(result);
+@@ -763,7 +754,6 @@ void BrowserMainWindow::slotHandlePagePrinted(bool result)
+ 
+ void BrowserMainWindow::printRequested(QWebEnginePage *page)
+ {
+-#ifndef QT_NO_PRINTDIALOG
+     if (m_currentPrinter)
+         return;
+     m_currentPrinter = new QPrinter();
+@@ -774,9 +764,7 @@ void BrowserMainWindow::printRequested(QWebEnginePage *page)
+         return;
+     }
+     page->print(m_currentPrinter, invoke(this, &BrowserMainWindow::slotHandlePagePrinted));
+-#endif
+ }
+-#endif
+ 
+ void BrowserMainWindow::slotPrivateBrowsing()
+ {
+diff --git a/examples/webenginewidgets/demobrowser/browsermainwindow.h b/examples/webenginewidgets/demobrowser/browsermainwindow.h
+index 91e1c1d2..5bbbb292 100644
+--- a/examples/webenginewidgets/demobrowser/browsermainwindow.h
++++ b/examples/webenginewidgets/demobrowser/browsermainwindow.h
+@@ -56,9 +56,7 @@
+ #include <QtCore/QUrl>
+ 
+ QT_BEGIN_NAMESPACE
+-#ifndef QT_NO_PRINTER
+ class QPrinter;
+-#endif
+ class QWebEnginePage;
+ QT_END_NAMESPACE
+ 
+@@ -142,10 +140,8 @@ private slots:
+     void slotSwapFocus();
+     void slotHandlePdfPrinted(const QByteArray&);
+ 
+-#ifndef QT_NO_PRINTER
+     void slotHandlePagePrinted(bool result);
+     void printRequested(QWebEnginePage *page);
+-#endif
+     void geometryChangeRequested(const QRect &geometry);
+     void updateToolbarActionText(bool visible);
+     void updateBookmarksToolbarActionText(bool visible);
+@@ -180,9 +176,7 @@ private:
+     QAction *m_restoreLastSession;
+     QAction *m_addBookmark;
+ 
+-#ifndef QT_NO_PRINTER
+     QPrinter *m_currentPrinter;
+-#endif
+ 
+     QIcon m_reloadIcon;
+     QIcon m_stopIcon;
+diff --git a/examples/webenginewidgets/demobrowser/printtopdfdialog.cpp b/examples/webenginewidgets/demobrowser/printtopdfdialog.cpp
+index 0f3b1765..50a8bb91 100644
+--- a/examples/webenginewidgets/demobrowser/printtopdfdialog.cpp
++++ b/examples/webenginewidgets/demobrowser/printtopdfdialog.cpp
+@@ -52,10 +52,8 @@
+ #include "ui_printtopdfdialog.h"
+ 
+ #include <QtCore/QDir>
+-#ifndef QT_NO_PRINTER
+ #include <QtPrintSupport/QPageSetupDialog>
+ #include <QtPrintSupport/QPrinter>
+-#endif // QT_NO_PRINTER
+ #include <QtWidgets/QFileDialog>
+ 
+ PrintToPdfDialog::PrintToPdfDialog(const QString &filePath, QWidget *parent) :
+@@ -66,11 +64,8 @@ PrintToPdfDialog::PrintToPdfDialog(const QString &filePath, QWidget *parent) :
+     ui->setupUi(this);
+     setWindowFlags(windowFlags() & ~Qt::WindowContextHelpButtonHint);
+     connect(ui->chooseFilePathButton, &QToolButton::clicked, this, &PrintToPdfDialog::onChooseFilePathButtonClicked);
+-#ifndef QT_NO_PRINTER
+     connect(ui->choosePageLayoutButton, &QToolButton::clicked, this, &PrintToPdfDialog::onChoosePageLayoutButtonClicked);
+-#else
+     ui->choosePageLayoutButton->hide();
+-#endif // QT_NO_PRINTER
+     updatePageLayoutLabel();
+     setFilePath(filePath);
+ }
+@@ -82,7 +77,6 @@ PrintToPdfDialog::~PrintToPdfDialog()
+ 
+ void PrintToPdfDialog::onChoosePageLayoutButtonClicked()
+ {
+-#ifndef QT_NO_PRINTER
+     QPrinter printer;
+     printer.setPageLayout(currentPageLayout);
+ 
+@@ -92,7 +86,6 @@ void PrintToPdfDialog::onChoosePageLayoutButtonClicked()
+     currentPageLayout.setPageSize(printer.pageLayout().pageSize());
+     currentPageLayout.setOrientation(printer.pageLayout().orientation());
+     updatePageLayoutLabel();
+-#endif // QT_NO_PRINTER
+ }
+ 
+ void PrintToPdfDialog::onChooseFilePathButtonClicked()
+diff --git a/src/webenginewidgets/api/qwebenginepage.cpp b/src/webenginewidgets/api/qwebenginepage.cpp
+index 2cdb0116..6042b9fd 100644
+--- a/src/webenginewidgets/api/qwebenginepage.cpp
++++ b/src/webenginewidgets/api/qwebenginepage.cpp
+@@ -80,11 +80,9 @@
+ #include <QMenu>
+ #include <QMessageBox>
+ #include <QMimeData>
+-#if defined(QT_PRINTSUPPORT_LIB)
+-#ifndef QT_NO_PRINTER
++#ifdef ENABLE_PRINTING
+ #include <QPrinter>
+-#endif //QT_NO_PRINTER
+-#endif //QT_PRINTSUPPORT_LIB
++#endif
+ #include <QStandardPaths>
+ #include <QStyle>
+ #include <QTimer>
+@@ -2051,8 +2049,6 @@ void QWebEnginePage::printToPdf(const QWebEngineCallback<const QByteArray&> &res
+ #endif // if defined(ENABLE_PDF)
+ }
+ 
+-#if defined(QT_PRINTSUPPORT_LIB)
+-#ifndef QT_NO_PRINTER
+ /*!
+     \fn void QWebEnginePage::print(QPrinter *printer, FunctorOrLambda resultCallback)
+     Renders the current content of the page into a temporary PDF document, then prints it using \a printer.
+@@ -2089,8 +2085,6 @@ void QWebEnginePage::print(QPrinter *printer, const QWebEngineCallback<bool> &re
+     d->m_callbacks.invokeDirectly(resultCallback, false);
+ #endif // if defined(ENABLE_PDF)
+ }
+-#endif // if defined(QT_NO_PRINTER)
+-#endif // if defined(QT_PRINTSUPPORT_LIB)
+ 
+ /*!
+     \since 5.7
+diff --git a/src/webenginewidgets/api/qwebenginepage.h b/src/webenginewidgets/api/qwebenginepage.h
+index c7d5a19e..5619639c 100644
+--- a/src/webenginewidgets/api/qwebenginepage.h
++++ b/src/webenginewidgets/api/qwebenginepage.h
+@@ -55,11 +55,7 @@
+ 
+ QT_BEGIN_NAMESPACE
+ class QMenu;
+-#if defined(QT_PRINTSUPPORT_LIB)
+-#ifndef QT_NO_PRINTER
+ class QPrinter;
+-#endif // QT_NO_PRINTER
+-#endif // QT_PRINTSUPPORT_LIB
+ 
+ class QWebChannel;
+ class QWebEngineContextMenuData;
+@@ -294,15 +290,11 @@ public:
+     void printToPdf(const QWebEngineCallback<const QByteArray&> &resultCallback, const QPageLayout &layout = QPageLayout(QPageSize(QPageSize::A4), QPageLayout::Portrait, QMarginsF()));
+ #endif
+ 
+-#if defined(QT_PRINTSUPPORT_LIB)
+-#ifndef QT_NO_PRINTER
+ #ifdef Q_QDOC
+     void print(QPrinter *printer, FunctorOrLambda resultCallback);
+ #else
+     void print(QPrinter *printer, const QWebEngineCallback<bool> &resultCallback);
+ #endif // QDOC
+-#endif // QT_NO_PRINTER
+-#endif // QT_PRINTSUPPORT_LIB
+ 
+     const QWebEngineContextMenuData &contextMenuData() const;
+ 
+-- 
+2.13.2
+
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
new file mode 100644
index 000000000..3d9a16c24
--- /dev/null
+++ b/package/qt5/qt5webengine/Config.in
@@ -0,0 +1,75 @@
+config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_arm || \
+		BR2_i386 || BR2_x86_64 || \
+		BR2_mips || BR2_mips64
+
+comment "qt5webengine needs an Open(E)GL-capable backend"
+	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || !BR2_PACKAGE_HAS_LIBEGL
+
+comment "qt5webengine is not yet buildable with Qt 5.6"
+	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_QT5_VERSION_5_6
+
+config BR2_PACKAGE_QT5WEBENGINE
+	bool "qt5webengine"
+	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
+	depends on !BR2_BINFMT_FLAT # qt5base-icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # qt5base-icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5base-icu
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
+	depends on BR2_USE_MMU # libglib2, qt5base-dbus
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_PACKAGE_HAS_LIBEGL # qt5base-eglfs
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
+	depends on !BR2_PACKAGE_QT5_VERSION_5_6
+	# For 32-bits targets, v8 (a chromium 3rd-party) adds -m32 flag to build
+	# internal host-tools.
+	# https://github.com/v8/v8/blob/5.6.326.55/gypfiles/toolchain.gypi#L1036-L1037
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64 # v8/chromium
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBVPX
+	select BR2_PACKAGE_OPUS
+	select BR2_PACKAGE_WEBP
+	select BR2_PACKAGE_WEBP_DEMUX
+	select BR2_PACKAGE_QT5BASE_DBUS
+	select BR2_PACKAGE_QT5BASE_EGLFS
+	select BR2_PACKAGE_QT5BASE_FONTCONFIG
+	select BR2_PACKAGE_QT5BASE_ICU
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	select BR2_PACKAGE_QT5WEBCHANNEL
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXI if BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER if BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_QT5BASE_XCB
+	help
+	  The Qt WebEngine module provides a web browser engine that
+	  makes it easy to embed content from the World Wide Web into
+	  your Qt application.
+
+	  Qt WebEngine provides C++ classes and QML types for rendering
+	  HTML, XHTML, and SVG documents, styled using Cascading Style
+	  Sheets (CSS) and scripted with JavaScript. HTML documents can
+	  be made fully editable by the user through the use of the
+	  contenteditable attribute on HTML elements.
+
+	  http://doc.qt.io/qt-5/qtwebengine-index.html
+
+if BR2_PACKAGE_QT5WEBENGINE
+
+config BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS
+	bool "proprietary codecs"
+	help
+	  Qt WebEngine supports the MPEG-4 Part 14 (MP4) file format;
+	  which includes required proprietary audio and video codecs,
+	  such as H.264 and MPEG layer-3 (MP3).
+
+endif
diff --git a/package/qt5/qt5webengine/chromium.inc b/package/qt5/qt5webengine/chromium.inc
new file mode 100644
index 000000000..da709fd5a
--- /dev/null
+++ b/package/qt5/qt5webengine/chromium.inc
@@ -0,0 +1,310 @@
+CHROMIUM_LICENSE_FILES = \
+	src/3rdparty/chromium/base/third_party/dmg_fp/LICENSE \
+	src/3rdparty/chromium/base/third_party/dynamic_annotations/LICENSE \
+	src/3rdparty/chromium/base/third_party/icu/LICENSE \
+	src/3rdparty/chromium/base/third_party/libevent/LICENSE \
+	src/3rdparty/chromium/base/third_party/nspr/LICENSE \
+	src/3rdparty/chromium/base/third_party/superfasthash/LICENSE \
+	src/3rdparty/chromium/base/third_party/symbolize/LICENSE \
+	src/3rdparty/chromium/base/third_party/valgrind/LICENSE \
+	src/3rdparty/chromium/base/third_party/xdg_mime/LICENSE \
+	src/3rdparty/chromium/base/third_party/xdg_user_dirs/LICENSE \
+	src/3rdparty/chromium/buildtools/LICENSE \
+	src/3rdparty/chromium/buildtools/third_party/libc++abi/trunk/LICENSE.TXT \
+	src/3rdparty/chromium/buildtools/third_party/libc++/trunk/LICENSE.TXT \
+	src/3rdparty/chromium/chrome/third_party/chromevox/LICENSE \
+	src/3rdparty/chromium/chrome/third_party/chromevox/third_party/closure-library/LICENSE \
+	src/3rdparty/chromium/LICENSE \
+	src/3rdparty/chromium/LICENSE.chromium_os \
+	src/3rdparty/chromium/mojo/public/LICENSE \
+	src/3rdparty/chromium/net/third_party/mozilla_security_manager/LICENSE \
+	src/3rdparty/chromium/net/third_party/nss/LICENSE \
+	src/3rdparty/chromium/ppapi/LICENSE \
+	src/3rdparty/chromium/sdch/open-vcdiff/COPYING \
+	src/3rdparty/chromium/testing/gmock/LICENSE \
+	src/3rdparty/chromium/testing/gmock/scripts/generator/LICENSE \
+	src/3rdparty/chromium/testing/gtest/LICENSE \
+	src/3rdparty/chromium/third_party/accessibility_test_framework/LICENSE \
+	src/3rdparty/chromium/third_party/afl/src/docs/COPYING \
+	src/3rdparty/chromium/third_party/angle/LICENSE \
+	src/3rdparty/chromium/third_party/angle/src/third_party/compiler/LICENSE \
+	src/3rdparty/chromium/third_party/angle/src/third_party/libXNVCtrl/LICENSE \
+	src/3rdparty/chromium/third_party/angle/src/third_party/murmurhash/LICENSE \
+	src/3rdparty/chromium/third_party/apache-portable-runtime/LICENSE \
+	src/3rdparty/chromium/third_party/apache_velocity/LICENSE \
+	src/3rdparty/chromium/third_party/apple_apsl/LICENSE \
+	src/3rdparty/chromium/third_party/bintrees/LICENSE.txt \
+	src/3rdparty/chromium/third_party/blanketjs/LICENSE \
+	src/3rdparty/chromium/third_party/blimp_fonts/LICENSE \
+	src/3rdparty/chromium/third_party/blimp_fonts/LICENSE.Apache \
+	src/3rdparty/chromium/third_party/blimp_fonts/LICENSE.OFL \
+	src/3rdparty/chromium/third_party/boringssl/src/LICENSE \
+	src/3rdparty/chromium/third_party/boringssl/src/third_party/android-cmake/LICENSE \
+	src/3rdparty/chromium/third_party/bouncycastle/LICENSE \
+	src/3rdparty/chromium/third_party/brotli/LICENSE \
+	src/3rdparty/chromium/third_party/bspatch/LICENSE \
+	src/3rdparty/chromium/third_party/byte_buddy/LICENSE \
+	src/3rdparty/chromium/third_party/ced/LICENSE \
+	src/3rdparty/chromium/third_party/ced/src/LICENSE \
+	src/3rdparty/chromium/third_party/chaijs/LICENSE \
+	src/3rdparty/chromium/third_party/checkstyle/LICENSE \
+	src/3rdparty/chromium/third_party/checkstyle/LICENSE.apache20 \
+	src/3rdparty/chromium/third_party/cld_3/LICENSE \
+	src/3rdparty/chromium/third_party/cld_3/src/LICENSE \
+	src/3rdparty/chromium/third_party/cld/LICENSE \
+	src/3rdparty/chromium/third_party/closure_compiler/compiler/COPYING \
+	src/3rdparty/chromium/third_party/closure_compiler/LICENSE \
+	src/3rdparty/chromium/third_party/closure_linter/LICENSE \
+	src/3rdparty/chromium/third_party/crashpad/crashpad/LICENSE \
+	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/apple_cctools/cctools/APPLE_LICENSE \
+	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/apple_cf/APPLE_LICENSE \
+	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/getopt/LICENSE \
+	src/3rdparty/chromium/third_party/cros_system_api/LICENSE \
+	src/3rdparty/chromium/third_party/cros_system_api/MODULE_LICENSE_BSD \
+	src/3rdparty/chromium/third_party/custom_tabs_client/LICENSE \
+	src/3rdparty/chromium/third_party/d3/src/LICENSE \
+	src/3rdparty/chromium/third_party/decklink/LICENSE \
+	src/3rdparty/chromium/third_party/devscripts/COPYING \
+	src/3rdparty/chromium/third_party/dom_distiller_js/LICENSE \
+	src/3rdparty/chromium/third_party/dpkg-dev/LICENSE \
+	src/3rdparty/chromium/third_party/drmemory/LICENSE \
+	src/3rdparty/chromium/third_party/errorprone/LICENSE \
+	src/3rdparty/chromium/third_party/espresso/LICENSE \
+	src/3rdparty/chromium/third_party/expat/files/COPYING \
+	src/3rdparty/chromium/third_party/ffmpeg/chromium/scripts/license_texts/full_lgpl.txt \
+	src/3rdparty/chromium/third_party/ffmpeg/COPYING.GPLv2 \
+	src/3rdparty/chromium/third_party/ffmpeg/COPYING.GPLv3 \
+	src/3rdparty/chromium/third_party/ffmpeg/COPYING.LGPLv2.1 \
+	src/3rdparty/chromium/third_party/ffmpeg/COPYING.LGPLv3 \
+	src/3rdparty/chromium/third_party/ffmpeg/LICENSE.md \
+	src/3rdparty/chromium/third_party/fips181/COPYING \
+	src/3rdparty/chromium/third_party/flac/COPYING.FDL \
+	src/3rdparty/chromium/third_party/flac/COPYING.GPL \
+	src/3rdparty/chromium/third_party/flac/COPYING.LGPL \
+	src/3rdparty/chromium/third_party/flac/COPYING.Xiph \
+	src/3rdparty/chromium/third_party/flatbuffers/LICENSE \
+	src/3rdparty/chromium/third_party/flatbuffers/src/LICENSE.txt \
+	src/3rdparty/chromium/third_party/flot/LICENSE.txt \
+	src/3rdparty/chromium/third_party/fontconfig/LICENSE \
+	src/3rdparty/chromium/third_party/fontconfig/src/COPYING \
+	src/3rdparty/chromium/third_party/freetype2/src/docs/GPLv2.TXT \
+	src/3rdparty/chromium/third_party/freetype2/src/docs/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/gardiner_mod/LICENSE \
+	src/3rdparty/chromium/third_party/gif_player/LICENSE \
+	src/3rdparty/chromium/third_party/glslang/LICENSE \
+	src/3rdparty/chromium/third_party/grpc/LICENSE \
+	src/3rdparty/chromium/third_party/grpc/src/node/health_check/LICENSE \
+	src/3rdparty/chromium/third_party/grpc/src/php/ext/grpc/LICENSE \
+	src/3rdparty/chromium/third_party/grpc/third_party/nanopb/LICENSE.txt \
+	src/3rdparty/chromium/third_party/grpc/third_party/rake-compiler-dock/LICENSE.txt \
+	src/3rdparty/chromium/third_party/guava/LICENSE \
+	src/3rdparty/chromium/third_party/gvr-android-sdk/LICENSE \
+	src/3rdparty/chromium/third_party/haha/LICENSE \
+	src/3rdparty/chromium/third_party/hamcrest/LICENSE \
+	src/3rdparty/chromium/third_party/harfbuzz-ng/COPYING \
+	src/3rdparty/chromium/third_party/hunspell/COPYING \
+	src/3rdparty/chromium/third_party/hunspell/COPYING.LGPL \
+	src/3rdparty/chromium/third_party/hunspell/COPYING.MPL \
+	src/3rdparty/chromium/third_party/hunspell/src/hunspell/license.hunspell \
+	src/3rdparty/chromium/third_party/hunspell/src/hunspell/license.myspell \
+	src/3rdparty/chromium/third_party/hwcplus/LICENSE \
+	src/3rdparty/chromium/third_party/iaccessible2/LICENSE \
+	src/3rdparty/chromium/third_party/iccjpeg/LICENSE \
+	src/3rdparty/chromium/third_party/icu4j/LICENSE \
+	src/3rdparty/chromium/third_party/icu/LICENSE \
+	src/3rdparty/chromium/third_party/icu/license.html \
+	src/3rdparty/chromium/third_party/icu/scripts/LICENSE \
+	src/3rdparty/chromium/third_party/ijar/LICENSE \
+	src/3rdparty/chromium/third_party/inspector_protocol/LICENSE \
+	src/3rdparty/chromium/third_party/intellij/LICENSE \
+	src/3rdparty/chromium/third_party/isimpledom/LICENSE \
+	src/3rdparty/chromium/third_party/javax_inject/LICENSE \
+	src/3rdparty/chromium/third_party/jinja2/LICENSE \
+	src/3rdparty/chromium/third_party/jmake/LICENSE \
+	src/3rdparty/chromium/third_party/jsoncpp/LICENSE \
+	src/3rdparty/chromium/third_party/jstemplate/COPYING \
+	src/3rdparty/chromium/third_party/khronos/LICENSE \
+	src/3rdparty/chromium/third_party/leakcanary/LICENSE \
+	src/3rdparty/chromium/third_party/leveldatabase/src/LICENSE \
+	src/3rdparty/chromium/third_party/libaddressinput/LICENSE \
+	src/3rdparty/chromium/third_party/libaddressinput/src/cpp/LICENSE.chromium \
+	src/3rdparty/chromium/third_party/libaddressinput/src/LICENSE \
+	src/3rdparty/chromium/third_party/libFuzzer/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/libjpeg/LICENSE \
+	src/3rdparty/chromium/third_party/libjpeg_turbo/LICENSE.md \
+	src/3rdparty/chromium/third_party/libpng/LICENSE \
+	src/3rdparty/chromium/third_party/libsecret/LICENSE \
+	src/3rdparty/chromium/third_party/libsrtp/LICENSE \
+	src/3rdparty/chromium/third_party/libsync/LICENSE \
+	src/3rdparty/chromium/third_party/libudev/LICENSE \
+	src/3rdparty/chromium/third_party/libusb/src/COPYING \
+	src/3rdparty/chromium/third_party/libva/COPYING \
+	src/3rdparty/chromium/third_party/libvpx/source/libvpx/LICENSE \
+	src/3rdparty/chromium/third_party/libvpx/source/libvpx/third_party/googletest/src/LICENSE \
+	src/3rdparty/chromium/third_party/libvpx/source/libvpx/third_party/libwebm/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/libvpx/source/libvpx/third_party/x86inc/LICENSE \
+	src/3rdparty/chromium/third_party/libwebm/source/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/libwebp/LICENSE \
+	src/3rdparty/chromium/third_party/libxml/src/COPYING \
+	src/3rdparty/chromium/third_party/libXNVCtrl/LICENSE \
+	src/3rdparty/chromium/third_party/libxslt/linux/COPYING \
+	src/3rdparty/chromium/third_party/libyuv/LICENSE \
+	src/3rdparty/chromium/third_party/libyuv/LICENSE_THIRD_PARTY \
+	src/3rdparty/chromium/third_party/libyuv/third_party/gflags/LICENSE \
+	src/3rdparty/chromium/third_party/lzma_sdk/LICENSE \
+	src/3rdparty/chromium/third_party/mach_override/LICENSE \
+	src/3rdparty/chromium/third_party/markupsafe/LICENSE \
+	src/3rdparty/chromium/third_party/mesa/LICENSE \
+	src/3rdparty/chromium/third_party/mesa/src/docs/COPYING \
+	src/3rdparty/chromium/third_party/mesa/src/docs/license.html \
+	src/3rdparty/chromium/third_party/mesa/src/src/gallium/drivers/radeon/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/minigbm/LICENSE \
+	src/3rdparty/chromium/third_party/mocha/LICENSE \
+	src/3rdparty/chromium/third_party/mockito/LICENSE \
+	src/3rdparty/chromium/third_party/modp_b64/LICENSE \
+	src/3rdparty/chromium/third_party/molokocacao/LICENSE \
+	src/3rdparty/chromium/third_party/motemplate/LICENSE \
+	src/3rdparty/chromium/third_party/mozilla/LICENSE \
+	src/3rdparty/chromium/third_party/mt19937ar/LICENSE \
+	src/3rdparty/chromium/third_party/netty4/LICENSE \
+	src/3rdparty/chromium/third_party/netty-tcnative/LICENSE \
+	src/3rdparty/chromium/third_party/objenesis/LICENSE \
+	src/3rdparty/chromium/third_party/ocmock/License.txt \
+	src/3rdparty/chromium/third_party/openh264/src/LICENSE \
+	src/3rdparty/chromium/third_party/openmax_dl/LICENSE \
+	src/3rdparty/chromium/third_party/opus/src/COPYING \
+	src/3rdparty/chromium/third_party/ots/LICENSE \
+	src/3rdparty/chromium/third_party/ow2_asm/LICENSE \
+	src/3rdparty/chromium/third_party/pdfium/LICENSE \
+	src/3rdparty/chromium/third_party/pdfium/third_party/bigint/LICENSE \
+	src/3rdparty/chromium/third_party/pdfium/third_party/pymock/LICENSE.txt \
+	src/3rdparty/chromium/third_party/pexpect/LICENSE \
+	src/3rdparty/chromium/third_party/ply/LICENSE \
+	src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer/LICENSE.txt \
+	src/3rdparty/chromium/third_party/proguard/LICENSE \
+	src/3rdparty/chromium/third_party/protobuf/LICENSE \
+	src/3rdparty/chromium/third_party/pycoverage/LICENSE \
+	src/3rdparty/chromium/third_party/pyelftools/elftools/construct/LICENSE \
+	src/3rdparty/chromium/third_party/pyelftools/LICENSE \
+	src/3rdparty/chromium/third_party/pyftpdlib/src/LICENSE \
+	src/3rdparty/chromium/third_party/pymock/LICENSE.txt \
+	src/3rdparty/chromium/third_party/python_gflags/COPYING \
+	src/3rdparty/chromium/third_party/Python-Markdown/LICENSE.md \
+	src/3rdparty/chromium/third_party/py_trace_event/src/LICENSE \
+	src/3rdparty/chromium/third_party/pywebsocket/src/LICENSE \
+	src/3rdparty/chromium/third_party/qcms/src/COPYING \
+	src/3rdparty/chromium/third_party/qunit/LICENSE \
+	src/3rdparty/chromium/third_party/re2/LICENSE \
+	src/3rdparty/chromium/third_party/re2/src/LICENSE \
+	src/3rdparty/chromium/third_party/requests/LICENSE \
+	src/3rdparty/chromium/third_party/robolectric/LICENSE \
+	src/3rdparty/chromium/third_party/robolectric/licenses/extreme.indiana.edu.license.txt \
+	src/3rdparty/chromium/third_party/robolectric/licenses/javolution.license.txt \
+	src/3rdparty/chromium/third_party/robolectric/licenses/pivotal.labs.license.txt \
+	src/3rdparty/chromium/third_party/sfntly/COPYING.txt \
+	src/3rdparty/chromium/third_party/sfntly/src/cpp/COPYING.txt \
+	src/3rdparty/chromium/third_party/sfntly/src/java/COPYING \
+	src/3rdparty/chromium/third_party/shaderc/LICENSE \
+	src/3rdparty/chromium/third_party/shaderc/src/LICENSE \
+	src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.glslang \
+	src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.spirv-tools \
+	src/3rdparty/chromium/third_party/simplejson/LICENSE.txt \
+	src/3rdparty/chromium/third_party/sinonjs/LICENSE \
+	src/3rdparty/chromium/third_party/skia/LICENSE \
+	src/3rdparty/chromium/third_party/skia/platform_tools/android/third_party/ashmem/LICENSE \
+	src/3rdparty/chromium/third_party/skia/third_party/etc1/LICENSE \
+	src/3rdparty/chromium/third_party/skia/third_party/gif/LICENSE \
+	src/3rdparty/chromium/third_party/skia/third_party/libpng/LICENSE \
+	src/3rdparty/chromium/third_party/smhasher/LICENSE \
+	src/3rdparty/chromium/third_party/snappy/src/COPYING \
+	src/3rdparty/chromium/third_party/SPIRV-Tools/LICENSE \
+	src/3rdparty/chromium/third_party/SPIRV-Tools/src/LICENSE \
+	src/3rdparty/chromium/third_party/sqlite4java/LICENSE \
+	src/3rdparty/chromium/third_party/sqlite/LICENSE \
+	src/3rdparty/chromium/third_party/sqlite/sqlite-src-3100200/autoconf/tea/license.terms \
+	src/3rdparty/chromium/third_party/sqlite/src/autoconf/tea/license.terms \
+	src/3rdparty/chromium/third_party/sudden_motion_sensor/LICENSE \
+	src/3rdparty/chromium/third_party/swiftshader/LICENSE.txt \
+	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/autoconf/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/include/llvm/Support/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/projects/sample/autoconf/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/swiftshader/third_party/llvm-subzero/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/swiftshader/third_party/LLVM/utils/unittest/googletest/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/swiftshader/third_party/PowerVR_SDK/License.txt \
+	src/3rdparty/chromium/third_party/tcmalloc/LICENSE \
+	src/3rdparty/chromium/third_party/tcmalloc/vendor/COPYING \
+	src/3rdparty/chromium/third_party/tlslite/LICENSE \
+	src/3rdparty/chromium/third_party/typ/LICENSE \
+	src/3rdparty/chromium/third_party/ub-uiautomator/LICENSE \
+	src/3rdparty/chromium/third_party/usb_ids/LICENSE \
+	src/3rdparty/chromium/third_party/usrsctp/LICENSE \
+	src/3rdparty/chromium/third_party/usrsctp/usrsctplib/LICENSE.md \
+	src/3rdparty/chromium/third_party/v4l2capture/LICENSE \
+	src/3rdparty/chromium/third_party/v4l-utils/COPYING.libv4l \
+	src/3rdparty/chromium/third_party/visualmetrics/src/LICENSE \
+	src/3rdparty/chromium/third_party/vulkan/LICENSE \
+	src/3rdparty/chromium/third_party/wayland/LICENSE \
+	src/3rdparty/chromium/third_party/wayland-protocols/LICENSE \
+	src/3rdparty/chromium/third_party/wayland-protocols/src/COPYING \
+	src/3rdparty/chromium/third_party/wayland/src/COPYING \
+	src/3rdparty/chromium/third_party/wds/LICENSE \
+	src/3rdparty/chromium/third_party/wds/src/COPYING \
+	src/3rdparty/chromium/third_party/web-animations-js/LICENSE \
+	src/3rdparty/chromium/third_party/web-animations-js/sources/COPYING \
+	src/3rdparty/chromium/third_party/webdriver/COPYING \
+	src/3rdparty/chromium/third_party/webdriver/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/LICENSE_FOR_ABOUT_CREDITS \
+	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-APPLE \
+	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-LGPL-2 \
+	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-LGPL-2.1 \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/audits2_worker/lighthouse/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/cm/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/cm/LICENSE_python \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/cm_modes/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/formatter_worker/acorn/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/gonzales/MIT-LICENSE.txt \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/terminal/xterm.js/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/scripts/closure/COPYING \
+	src/3rdparty/chromium/third_party/WebKit/Source/wtf/dtoa/COPYING \
+	src/3rdparty/chromium/third_party/WebKit/Source/wtf/dtoa/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/mod_pywebsocket/COPYING \
+	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/wpt/wpt/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/wpt/wpt/tools/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/wpt/wpt/tools/six/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/wpt/wpt/tools/wptserve/LICENSE \
+	src/3rdparty/chromium/third_party/webpagereplay/COPYING \
+	src/3rdparty/chromium/third_party/webpagereplay/third_party/dns/LICENSE \
+	src/3rdparty/chromium/third_party/webpagereplay/third_party/ipaddr/COPYING \
+	src/3rdparty/chromium/third_party/webpagereplay/third_party/ipfw_win32/LICENSE \
+	src/3rdparty/chromium/third_party/webpagereplay/third_party/jsmin/LICENSE.txt \
+	src/3rdparty/chromium/third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE \
+	src/3rdparty/chromium/third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE.md \
+	src/3rdparty/chromium/third_party/webrtc/examples/objc/AppRTCMobile/third_party/SocketRocket/LICENSE \
+	src/3rdparty/chromium/third_party/webrtc/LICENSE \
+	src/3rdparty/chromium/third_party/webrtc/LICENSE_THIRD_PARTY \
+	src/3rdparty/chromium/third_party/webtreemap/src/COPYING \
+	src/3rdparty/chromium/third_party/woff2/LICENSE \
+	src/3rdparty/chromium/third_party/x86inc/LICENSE \
+	src/3rdparty/chromium/third_party/xdg-utils/LICENSE \
+	src/3rdparty/chromium/third_party/yasm/source/patched-yasm/COPYING \
+	src/3rdparty/chromium/third_party/yasm/source/patched-yasm/GNU_GPL-2.0 \
+	src/3rdparty/chromium/third_party/yasm/source/patched-yasm/GNU_LGPL-2.0 \
+	src/3rdparty/chromium/third_party/zlib/LICENSE \
+	src/3rdparty/chromium/tools/gn/out/Release/obj/third_party/widevine/cdm/widevine_test_license_server.ninja \
+	src/3rdparty/chromium/tools/gyp/LICENSE \
+	src/3rdparty/chromium/tools/origin_trials/third_party/ed25519/LICENSE \
+	src/3rdparty/chromium/tools/page_cycler/acid3/LICENSE \
+	src/3rdparty/chromium/tools/symsrc/COPYING-pefile \
+	src/3rdparty/chromium/tools/win/ChromeDebug/ChromeDebug/LICENSE \
+	src/3rdparty/chromium/url/third_party/mozilla/LICENSE.txt \
+	src/3rdparty/chromium/v8/LICENSE \
+	src/3rdparty/chromium/v8/LICENSE.fdlibm \
+	src/3rdparty/chromium/v8/LICENSE.strongtalk \
+	src/3rdparty/chromium/v8/LICENSE.v8 \
+	src/3rdparty/chromium/v8/LICENSE.valgrind \
+	src/3rdparty/chromium/v8/src/third_party/valgrind/LICENSE \
+	src/3rdparty/chromium/v8/src/third_party/vtune/LICENSE \
+	src/3rdparty/chromium/v8/third_party/inspector_protocol/LICENSE \
+
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
new file mode 100644
index 000000000..d45500c44
--- /dev/null
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -0,0 +1,2 @@
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebengine-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 f6a37eeb9188474a16d29ede498fce959396ab80329a0a83eaeb925251686401  qtwebengine-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
new file mode 100644
index 000000000..cc229d252
--- /dev/null
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -0,0 +1,80 @@
+################################################################################
+#
+# qt5webengine
+#
+################################################################################
+
+QT5WEBENGINE_VERSION = $(QT5_VERSION)
+QT5WEBENGINE_SITE = $(QT5_SITE)
+QT5WEBENGINE_SOURCE = qtwebengine-opensource-src-$(QT5WEBENGINE_VERSION).tar.xz
+QT5WEBENGINE_DEPENDENCIES = qt5base ffmpeg libglib2 libvpx opus webp \
+	qt5declarative qt5webchannel host-bison host-flex host-gperf \
+	host-pkgconf host-python
+QT5WEBENGINE_INSTALL_STAGING = YES
+
+include package/qt5/qt5webengine/chromium.inc
+QT5WEBENGINE_LICENSE = GPL-2.0 or LGPL-3.0 or GPL-3.0 or GPL-3.0 with exception
+QT5WEBENGINE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT \
+	LICENSE.GPLv3 LICENSE.LGPL3 $(CHROMIUM_LICENSE_FILES)
+
+ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
+QT5WEBENGINE_DEPENDENCIES += xlib_libXScrnSaver xlib_libXcomposite \
+	xlib_libXcursor xlib_libXi xlib_libXrandr xlib_libXtst
+endif
+
+QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_system_ffmpeg
+
+ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
+QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_proprietary_codecs
+endif
+
+# QtWebengine's build system uses python, but only supports python2. We work
+# around this by forcing python2 early in the PATH, via a python->python2
+# symlink.
+QT5WEBENGINE_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
+define QT5WEBENGINE_PYTHON2_SYMLINK
+	mkdir -p $(@D)/host-bin
+	ln -sf $(HOST_DIR)/bin/python2 $(@D)/host-bin/python
+endef
+QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_PYTHON2_SYMLINK
+
+define QT5WEBENGINE_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/usr/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
+endef
+
+define QT5WEBENGINE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5WEBENGINE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+define QT5WEBENGINE_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebEngine $(TARGET_DIR)/usr/qml/
+endef
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5WEBENGINE_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webengine* $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+ifneq ($(BR2_STATIC_LIBS),y)
+define QT5WEBENGINE_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebEngine*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/libexec/QtWebEngineProcess $(TARGET_DIR)/usr/libexec/
+	cp -dpfr $(STAGING_DIR)/usr/resources/ $(TARGET_DIR)/usr/
+	mkdir -p $(TARGET_DIR)/usr/translations/qtwebengine_locales/
+	cp -dpfr $(STAGING_DIR)/usr/translations/qtwebengine_locales $(TARGET_DIR)/usr/translations/qtwebengine_locales/
+endef
+endif
+
+define QT5WEBENGINE_INSTALL_TARGET_CMDS
+	$(QT5WEBENGINE_INSTALL_TARGET_LIBS)
+	$(QT5WEBENGINE_INSTALL_TARGET_QMLS)
+	$(QT5WEBENGINE_INSTALL_TARGET_EXAMPLES)
+endef
+
+$(eval $(generic-package))
-- 
2.13.2
