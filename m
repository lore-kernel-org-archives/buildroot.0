From: Patrick Noffke <patrick@noffke.me>
Date: Mon, 23 Jun 2014 14:10:50 -0500
Subject: [Buildroot] Qt 5.3.0 fails to build with eglfs (ti-glx) enabled,
	ARM platform (beaglebone black)
Message-ID: <4081522.HPB2TGLcVe@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to build Qt 5.3.0 within buildroot, using the ti-gfx package and 
starting with the beaglebone black defconfig.

The build fails when trying to link libQt5Widgets.5.3.0.  This page 
(https://codereview.qt-project.org/#/c/79783/) made me think I might have 
success by enabling neon, which I did by editing the qt5base-0002-mkspecs-
files.patch file as follows:

+QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS} -mfpu=neon -march=armv7-a
+QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS} -mfpu=neon -march=armv7-a
+CONFIG                 += nostrip neon

but it fails the same way with or without these changes.

Has anyone else had this issue or found some way around it?  Portions of my 
build log follow.

Thanks,
Patrick


(cd /home/pnoffke/projects/s12s19/buildroot/output/build/qt5base-5.3.0; 
PKG_CONFIG="/home/pnoffke/projects/s12s19/buildroot/output/host/usr/bin/pkg-
config" 
PKG_CONFIG_LIBDIR="/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-
buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig" 
PKG_CONFIG_SYSROOT_DIR="/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-
buildroot-linux-gnueabihf/sysroot" MAKEFLAGS=" -j2" ./configure -v -prefix /usr 
-hostprefix /home/pnoffke/projects/s12s19/buildroot/output/host/usr -headerdir 
/usr/include/qt5 -sysroot 
/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-buildroot-linux-
gnueabihf/sysroot -plugindir /usr/lib/qt/plugins -examplesdir 
/usr/lib/qt/examples -no-rpath -nomake tests -device buildroot -device-option 
CROSS_COMPILE=" 
/home/pnoffke/projects/s12s19/buildroot/output/host/usr/bin/arm-buildroot-
linux-gnueabihf-" -device-option BR_COMPILER_CFLAGS="-D_LARGEFILE_SOURCE -
D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os " -device-option 
BR_COMPILER_CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -
D_FILE_OFFSET_BITS=64  -pipe -Os " -device-option 
EGLFS_PLATFORM_HOOKS_SOURCES="" -no-c++11 -optimized-qmake -no-kms -no-cups -
no-nis -no-iconv -system-zlib -system-pcre -no-pch -release -shared -largefile 
-opensource -confirm-license -no-sql-mysql -plugin-sql-sqlite   -gui -widgets 
--enable-linuxfb -no-directfb -no-xcb -opengl es2 -eglfs -no-openssl -
fontconfig  -system-libjpeg -system-libpng -no-dbus -tslib -no-glib -no-icu -
nomake examples )

...


   Configure summary

Building on:   linux-g++ (x86_64, CPU features: mmx sse sse2)
Building for:  devices/linux-buildroot-g++ (arm, CPU features:)
Platform notes:

            - Also available for Linux: linux-kcc linux-icc linux-cxx
        
qmake vars .......... styles += mac fusion windows DEFINES += QT_NO_MTDEV 
QMAKE_INCDIR_OPENGL_ES2 =  
"/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-buildroot-linux-
gnueabihf/sysroot/usr/include" QMAKE_LIBDIR_OPENGL_ES2 =  
"/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-buildroot-linux-
gnueabihf/sysroot/usr/lib" QMAKE_LIBS_OPENGL_ES2 =  "-
L/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-buildroot-linux-
gnueabihf/sysroot/usr/lib" "-lGLESv2" "-lGLES_CM" "-lsrv_um" "-lusc" "-lEGL" 
"-lIMGegl" QMAKE_CFLAGS_FONTCONFIG = -
I/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-buildroot-linux-
gnueabihf/sysroot/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-
buildroot-linux-gnueabihf/sysroot/usr/include/freetype2 -
I/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-buildroot-linux-
gnueabihf/sysroot/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-
buildroot-linux-gnueabihf/sysroot/usr/include  -
I/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-buildroot-linux-
gnueabihf/sysroot/usr/include/freetype2 -
I/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-buildroot-linux-
gnueabihf/sysroot/usr/include   QMAKE_LIBS_FONTCONFIG = -lfontconfig -
L/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-buildroot-linux-
gnueabihf/sysroot/usr/lib -lfreetype   DEFINES += QT_NO_LIBUDEV 
QMAKE_INCDIR_EGL = /home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-
buildroot-linux-gnueabihf/sysroot/usr//include   QMAKE_LIBS_EGL = -
L/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-buildroot-linux-
gnueabihf/sysroot/usr//lib -lEGL -lGLESv2 -lIMGegl   QMAKE_CFLAGS_EGL =   sql-
drivers =  sql-plugins =  sqlite qmake switches ......... 

Build options:
  Configuration .......... accessibility audio-backend clock-gettime clock-
monotonic compile_examples concurrent cross_compile egl eglfs evdev eventfd 
fontconfig full-config getaddrinfo getifaddrs inotify ipv6ifname large-config 
largefile linuxfb medium-config minimal-config mremap no-harfbuzz opengl 
opengles2 png posix_fallocate qpa qpa reduce_exports release shared small-
config system-freetype system-jpeg system-png system-zlib 
  Build parts ............ libs
  Mode ................... release
  Using C++11 ............ no
  Using PCH .............. no
  Target compiler supports:
    iWMMXt/Neon .......... no/auto

Qt modules and options:
  Qt D-Bus ............... no
  Qt Concurrent .......... yes
  Qt GUI ................. yes
  Qt Widgets ............. yes
  Large File ............. yes
  QML debugging .......... yes
  Use system proxies ..... no

Support enabled for:
  Accessibility .......... yes
  ALSA ................... no
  CUPS ................... no
  Evdev .................. yes
  FontConfig ............. yes
  FreeType ............... yes (system library)
  Glib ................... no
  GTK theme .............. no
  HarfBuzz ............... no
  Iconv .................. no
  ICU .................... no
  Image formats: 
    GIF .................. yes (plugin, using bundled copy)
    JPEG ................. yes (plugin, using system library)
    PNG .................. yes (in QtGui, using system library)
  journald ............... no
  mtdev .................. no
  Networking: 
    getaddrinfo .......... yes
    getifaddrs ........... yes
    IPv6 ifname .......... yes
    OpenSSL .............. no
  NIS .................... no
  OpenGL / OpenVG: 
    EGL .................. yes
    OpenGL ............... yes (OpenGL ES 2.x)
    OpenVG ............... no
  PCRE ................... system
  pkg-config ............. yes 
  PulseAudio ............. no
  QPA backends: 
    DirectFB ............. no
    EGLFS ................ yes
    KMS .................. no
    LinuxFB .............. yes
    XCB .................. no
  Session management ..... yes
  SQL drivers: 
    DB2 .................. no
    InterBase ............ no
    MySQL ................ no
    OCI .................. no
    ODBC ................. no
    PostgreSQL ........... no
    SQLite 2 ............. no
    SQLite ............... yes (plugin, using bundled copy)
    TDS .................. no
  udev ................... no
  xkbcommon .............. no
  zlib ................... yes (system library)

...

/home/pnoffke/projects/s12s19/buildroot/output/host/usr/bin/arm-buildroot-
linux-gnueabihf-g++ --
sysroot=/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-buildroot-
linux-gnueabihf/sysroot -Wl,--no-undefined -Wl,-O1 -shared -Wl,-
soname,libQt5Widgets.so.5 -o libQt5Widgets.so.5.3.0 .obj/qaction.o 
.obj/qactiongroup.o .obj/qapplication.o .obj/qwidgetbackingstore.o 
.obj/qboxlayout.o .obj/qformlayout.o .obj/qgridlayout.o .obj/qlayout.o 
.obj/qlayoutengine.o .obj/qlayoutitem.o .obj/qshortcut.o .obj/qstackedlayout.o 
.obj/qtooltip.o .obj/qwhatsthis.o .obj/qwidget.o .obj/qwidgetaction.o 
.obj/qgesture.o .obj/qstandardgestures.o .obj/qgesturerecognizer.o 
.obj/qgesturemanager.o .obj/qdesktopwidget.o .obj/qwidgetsvariant.o 
.obj/qapplication_qpa.o .obj/qdesktopwidget_qpa.o .obj/qwidget_qpa.o 
.obj/qwidgetwindow.o .obj/qwindowcontainer.o .obj/qopenglwidget.o 
.obj/qdrawutil.o .obj/qstyle.o .obj/qstyleanimation.o .obj/qstylefactory.o 
.obj/qstyleoption.o .obj/qstyleplugin.o .obj/qstylehelper.o 
.obj/qcommonstyle.o .obj/qproxystyle.o .obj/qstylepainter.o 
.obj/qstylesheetstyle.o .obj/qstylesheetstyle_default.o .obj/qwindowsstyle.o 
.obj/qfusionstyle.o .obj/qabstractbutton.o .obj/qabstractslider.o 
.obj/qabstractspinbox.o .obj/qcalendarwidget.o .obj/qcheckbox.o 
.obj/qcombobox.o .obj/qcommandlinkbutton.o .obj/qdatetimeedit.o .obj/qdial.o 
.obj/qdialogbuttonbox.o .obj/qdockwidget.o .obj/qdockarealayout.o 
.obj/qeffects.o .obj/qfontcombobox.o .obj/qframe.o .obj/qgroupbox.o 
.obj/qkeysequenceedit.o .obj/qlabel.o .obj/qlcdnumber.o .obj/qlineedit_p.o 
.obj/qlineedit.o .obj/qmainwindow.o .obj/qmainwindowlayout.o .obj/qmdiarea.o 
.obj/qmdisubwindow.o .obj/qmenu.o .obj/qmenubar.o .obj/qprogressbar.o 
.obj/qpushbutton.o .obj/qradiobutton.o .obj/qrubberband.o .obj/qscrollbar.o 
.obj/qsizegrip.o .obj/qslider.o .obj/qspinbox.o .obj/qsplashscreen.o 
.obj/qsplitter.o .obj/qstackedwidget.o .obj/qstatusbar.o .obj/qtabbar.o 
.obj/qtabwidget.o .obj/qtextedit.o .obj/qtextbrowser.o .obj/qtoolbar.o 
.obj/qtoolbarlayout.o .obj/qtoolbarextension.o .obj/qtoolbarseparator.o 
.obj/qtoolbox.o .obj/qtoolbutton.o .obj/qabstractscrollarea.o 
.obj/qwidgetresizehandler.o .obj/qfocusframe.o .obj/qscrollarea.o 
.obj/qwidgetanimator.o .obj/qwidgettextcontrol.o .obj/qwidgetlinecontrol.o 
.obj/qtoolbararealayout.o .obj/qplaintextedit.o .obj/qcolordialog.o 
.obj/qdialog.o .obj/qerrormessage.o .obj/qfiledialog.o .obj/qfontdialog.o 
.obj/qinputdialog.o .obj/qmessagebox.o .obj/qprogressdialog.o .obj/qsidebar.o 
.obj/qfilesystemmodel.o .obj/qfileinfogatherer.o .obj/qwizard.o 
.obj/qaccessiblewidget.o .obj/qabstractitemview.o .obj/qheaderview.o 
.obj/qlistview.o .obj/qbsptree.o .obj/qtableview.o .obj/qtreeview.o 
.obj/qabstractitemdelegate.o .obj/qitemdelegate.o .obj/qdirmodel.o 
.obj/qlistwidget.o .obj/qtablewidget.o .obj/qtreewidget.o 
.obj/qitemeditorfactory.o .obj/qtreewidgetitemiterator.o 
.obj/qdatawidgetmapper.o .obj/qfileiconprovider.o .obj/qcolumnview.o 
.obj/qcolumnviewgrip.o .obj/qstyleditemdelegate.o .obj/qgraphicsgridlayout.o 
.obj/qgraphicsitem.o .obj/qgraphicsitemanimation.o .obj/qgraphicslayout.o 
.obj/qgraphicslayout_p.o .obj/qgraphicslayoutitem.o 
.obj/qgraphicslinearlayout.o .obj/qgraphicsproxywidget.o .obj/qgraphicsscene.o 
.obj/qgraphicsscene_bsp.o .obj/qgraphicsscenebsptreeindex.o 
.obj/qgraphicssceneevent.o .obj/qgraphicssceneindex.o 
.obj/qgraphicsscenelinearindex.o .obj/qgraphicstransform.o 
.obj/qgraphicsview.o .obj/qgraphicswidget.o .obj/qgraphicswidget_p.o 
.obj/qgraphicslayoutstyleinfo.o .obj/qgraphicsgridlayoutengine.o 
.obj/qsimplex_p.o .obj/qgraphicsanchorlayout_p.o .obj/qgraphicsanchorlayout.o 
.obj/qsystemtrayicon.o .obj/qcolormap.o .obj/qcompleter.o .obj/qscroller.o 
.obj/qscrollerproperties.o .obj/qflickgesture.o .obj/qundogroup.o 
.obj/qundostack.o .obj/qundoview.o .obj/qsystemtrayicon_qpa.o 
.obj/qguistatemachine.o .obj/qkeyeventtransition.o 
.obj/qmouseeventtransition.o .obj/qbasickeyeventtransition.o 
.obj/qbasicmouseeventtransition.o .obj/qgraphicseffect.o .obj/qpixmapfilter.o 
.obj/qrc_qstyle.o .obj/qrc_qmessagebox.o .obj/moc_qwidgetbackingstore_p.o 
.obj/moc_qboxlayout.o .obj/moc_qformlayout.o .obj/moc_qgridlayout.o 
.obj/moc_qlayout.o .obj/moc_qshortcut.o .obj/moc_qsizepolicy.o 
.obj/moc_qstackedlayout.o .obj/moc_qdesktopwidget_qpa_p.o 
.obj/moc_qwidgetwindow_qpa_p.o .obj/moc_qwindowcontainer_p.o 
.obj/moc_qopenglwidget_p.o .obj/moc_qstyle.o .obj/moc_qstyleanimation_p.o 
.obj/moc_qstyleplugin.o .obj/moc_qproxystyle.o .obj/moc_qwindowsstyle_p.o 
.obj/moc_qfusionstyle_p.o .obj/moc_qbuttongroup.o .obj/moc_qabstractbutton.o 
.obj/moc_qabstractslider.o .obj/moc_qcalendartextnavigator_p.o 
.obj/moc_qcheckbox.o .obj/moc_qcombobox_p.o .obj/moc_qcommandlinkbutton.o 
.obj/moc_qdatetimeedit_p.o .obj/moc_qdial.o .obj/moc_qdockwidget_p.o 
.obj/moc_qframe.o .obj/moc_qkeysequenceedit.o .obj/moc_qlcdnumber.o 
.obj/moc_qlineedit_p.o .obj/moc_qmainwindow.o .obj/moc_qmainwindowlayout_p.o 
.obj/moc_qprogressbar.o .obj/moc_qradiobutton.o .obj/moc_qrubberband.o 
.obj/moc_qscrollbar.o .obj/moc_qslider.o .obj/moc_qspinbox.o 
.obj/moc_qsplashscreen.o .obj/moc_qsplitter.o .obj/moc_qstackedwidget.o 
.obj/moc_qstatusbar.o .obj/moc_qtabbar_p.o .obj/moc_qtoolbarlayout_p.o 
.obj/moc_qtoolbarextension_p.o .obj/moc_qtoolbarseparator_p.o 
.obj/moc_qwidgetresizehandler_p.o .obj/moc_qfocusframe.o 
.obj/moc_qscrollarea.o .obj/moc_qwidgetanimator_p.o 
.obj/moc_qwidgetlinecontrol_p.o .obj/moc_qerrormessage.o .obj/moc_qsidebar_p.o 
.obj/moc_qfileinfogatherer_p.o .obj/moc_qlistview.o 
.obj/moc_qabstractitemdelegate.o .obj/moc_qlistwidget_p.o 
.obj/moc_qtablewidget_p.o .obj/moc_qtreewidget_p.o 
.obj/moc_qitemeditorfactory_p.o .obj/moc_qcolumnviewgrip_p.o 
.obj/moc_qgraphicsitemanimation.o .obj/moc_qgraphicsscenelinearindex_p.o 
.obj/moc_qgraphicswidget.o .obj/moc_qgraphicsanchorlayout.o 
.obj/moc_qcompleter_p.o .obj/moc_qsystemtrayicon_p.o .obj/moc_qscroller.o 
.obj/moc_qscroller_p.o .obj/moc_qflickgesture_p.o .obj/moc_qundogroup.o 
.obj/moc_qundostack.o .obj/moc_qundostack_p.o .obj/moc_qundoview.o 
.obj/moc_qkeyeventtransition.o .obj/moc_qmouseeventtransition.o 
.obj/moc_qbasickeyeventtransition_p.o .obj/moc_qbasicmouseeventtransition_p.o 
.obj/moc_qgraphicseffect.o .obj/moc_qgraphicseffect_p.o 
.obj/moc_qpixmapfilter_p.o  -
L/home/pnoffke/projects/s12s19/buildroot/output/host/usr/arm-buildroot-linux-
gnueabihf/sysroot/usr/lib -
L/home/pnoffke/projects/s12s19/buildroot/output/build/qt5base-5.3.0/lib -
lQt5Gui -lQt5Core -lrt -ldl -lpthread -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL 
-lIMGegl 
.obj/qwidgetbackingstore.o: In function 
`findTextureWidgetsRecursively(QWidget*, QWidget*, QPlatformTextureList*)':
qwidgetbackingstore.cpp:(.text+0x148): undefined reference to 
`QPlatformTextureList::appendTexture(unsigned int, QRect const&)'
.obj/qwidgetbackingstore.o: In function 
`QPlatformTextureListWatcher::watch(QPlatformTextureList*)':
qwidgetbackingstore.cpp:(.text+0xf40): undefined reference to 
`QPlatformTextureList::isLocked() const'
.obj/qwidgetbackingstore.o: In function `QWidgetBackingStore::flush(QWidget*)':
qwidgetbackingstore.cpp:(.text+0x1004): undefined reference to 
`QPlatformTextureList::count() const'
.obj/qwidgetbackingstore.o: In function `QWidgetBackingStore::doSync()':
qwidgetbackingstore.cpp:(.text+0x1e94): undefined reference to 
`QPlatformTextureList::QPlatformTextureList(QObject*)'
.obj/qwidgetbackingstore.o: In function `QWidgetBackingStore::sync()':
qwidgetbackingstore.cpp:(.text+0x238c): undefined reference to 
`QPlatformTextureList::isLocked() const'
qwidgetbackingstore.cpp:(.text+0x23f0): undefined reference to 
`QPlatformTextureList::isLocked() const'
.obj/qwidgetbackingstore.o: In function 
`QPlatformTextureListWatcher::onLockStatusChanged(bool)':
qwidgetbackingstore.cpp:(.text+0x2864): undefined reference to 
`QPlatformTextureList::isLocked() const'
qwidgetbackingstore.cpp:(.text+0x28c8): undefined reference to 
`QPlatformTextureList::isLocked() const'
.obj/qwidget.o: In function `QWidgetPrivate::shareContext() const':
qwidget.cpp:(.text+0x16c84): undefined reference to 
`QOpenGLContext::QOpenGLContext(QObject*)'
qwidget.cpp:(.text+0x16c88): undefined reference to 
`QOpenGLContextPrivate::globalShareContext()'
qwidget.cpp:(.text+0x16c94): undefined reference to 
`QOpenGLContext::setShareContext(QOpenGLContext*)'
qwidget.cpp:(.text+0x16cbc): undefined reference to 
`QOpenGLContext::setFormat(QSurfaceFormat const&)'
qwidget.cpp:(.text+0x16ccc): undefined reference to `QOpenGLContext::create()'
.obj/qwidget_qpa.o: In function `QWidgetPrivate::deleteTLSysExtra()':
qwidget_qpa.cpp:(.text+0x1614): undefined reference to 
`QOpenGLContext::doneCurrent()'
qwidget_qpa.cpp:(.text+0x1638): undefined reference to 
`QOpenGLContext::makeCurrent(QSurface*)'
.obj/qopenglwidget.o: In function `QOpenGLWidgetPrivate::initialize()':
qopenglwidget.cpp:(.text+0x110): undefined reference to 
`QOpenGLContext::setShareContext(QOpenGLContext*)'
qopenglwidget.cpp:(.text+0x144): undefined reference to 
`QOpenGLContext::setFormat(QSurfaceFormat const&)'
qopenglwidget.cpp:(.text+0x154): undefined reference to 
`QOpenGLContext::create()'
qopenglwidget.cpp:(.text+0x174): undefined reference to 
`QOpenGLContext::makeCurrent(QSurface*)'
.obj/qopenglwidget.o: In function `QOpenGLWidget::resizeEvent(QResizeEvent*)':
qopenglwidget.cpp:(.text+0x1fc): undefined reference to 
`QOpenGLContext::makeCurrent(QSurface*)'
qopenglwidget.cpp:(.text+0x2d0): undefined reference to 
`QOpenGLFramebufferObject::QOpenGLFramebufferObject(QSize const&, 
QOpenGLFramebufferObject::Attachment, unsigned int, unsigned int)'
qopenglwidget.cpp:(.text+0x2dc): undefined reference to 
`QOpenGLFramebufferObject::bind()'
qopenglwidget.cpp:(.text+0x2e4): undefined reference to 
`QOpenGLContext::functions() const'
qopenglwidget.cpp:(.text+0x2ec): undefined reference to 
`QOpenGLFramebufferObject::texture() const'
.obj/qopenglwidget.o: In function `QOpenGLWidget::QOpenGLWidget(QWidget*, 
QFlags<Qt::WindowType>)':
qopenglwidget.cpp:(.text+0x434): undefined reference to 
`QOpenGLContext::QOpenGLContext(QObject*)'
.obj/qopenglwidget.o: In function `QOpenGLWidget::isValid() const':
qopenglwidget.cpp:(.text+0x508): undefined reference to 
`QOpenGLContext::isValid() const'
.obj/qopenglwidget.o: In function `QOpenGLWidget::makeCurrent()':
qopenglwidget.cpp:(.text+0x534): undefined reference to 
`QOpenGLContext::makeCurrent(QSurface*)'
qopenglwidget.cpp:(.text+0x540): undefined reference to 
`QOpenGLFramebufferObject::bind()'
.obj/qopenglwidget.o: In function `QOpenGLWidget::doneCurrent()':
qopenglwidget.cpp:(.text+0x54c): undefined reference to 
`QOpenGLContext::doneCurrent()'
.obj/qopenglwidget.o: In function `QOpenGLWidget::defaultFramebufferObject() 
const':
qopenglwidget.cpp:(.text+0x59c): undefined reference to 
`QOpenGLFramebufferObject::handle() const'
.obj/qopenglwidget.o: In function `QOpenGLWidget::updateGL()':
qopenglwidget.cpp:(.text+0x5d0): undefined reference to 
`QOpenGLContext::functions() const'
.obj/qopenglwidget.o: In function `QOpenGLWidgetPrivate::textureId() const':
qopenglwidget.cpp:
(.text._ZNK20QOpenGLWidgetPrivate9textureIdEv[_ZNK20QOpenGLWidgetPrivate9textureIdEv]+0xc): 
undefined reference to `QOpenGLFramebufferObject::texture() const'
.obj/qopenglwidget.o: In function 
`QOpenGLWidgetPrivate::~QOpenGLWidgetPrivate()':
qopenglwidget.cpp:
(.text._ZN20QOpenGLWidgetPrivateD2Ev[_ZN20QOpenGLWidgetPrivateD5Ev]+0x18): 
undefined reference to `QOpenGLContext::~QOpenGLContext()'
.obj/qopenglwidget.o: In function 
`QOpenGLWidgetPrivate::~QOpenGLWidgetPrivate()':
qopenglwidget.cpp:
(.text._ZN20QOpenGLWidgetPrivateD0Ev[_ZN20QOpenGLWidgetPrivateD0Ev]+0x18): 
undefined reference to `QOpenGLContext::~QOpenGLContext()'
collect2: error: ld returned 1 exit status
make[3]: *** [../../lib/libQt5Widgets.so.5.3.0] Error 1
make[3]: Leaving directory 
`/home/pnoffke/projects/s12s19/buildroot/output/build/qt5base-5.3.0/src/widgets'
make[2]: *** [sub-widgets-make_first] Error 2
make[2]: Leaving directory 
`/home/pnoffke/projects/s12s19/buildroot/output/build/qt5base-5.3.0/src'
make[1]: *** [sub-src-make_first] Error 2
make[1]: Leaving directory 
`/home/pnoffke/projects/s12s19/buildroot/output/build/qt5base-5.3.0'
make: *** 
[/home/pnoffke/projects/s12s19/buildroot/output/build/qt5base-5.3.0/.stamp_built] 
Error 2
