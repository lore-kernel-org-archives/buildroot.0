From: Sundareson, Prabindh <prabu@ti.com>
Date: Fri, 28 Jun 2013 14:03:05 +0000
Subject: [Buildroot] Issue with Qt5 and PowerVR drivers
In-Reply-To: <20130628143717.3e16fd9c@skate>
References: <20130628143717.3e16fd9c@skate>
Message-ID: <321768C95D21724485BCE784F1BE98473EB5E16F@DBDE04.ent.ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Very glad to see the video. What version of Qt5 was used ?

Qt5 is quite different from Qt4, and the default eglfs port with the TI nullws package is a full-screen implementation, fully rendered with OpenGL ES2 (ie, the full screen image is a quad texture, and cursor is laid as a texture on top of it). However an application is free to generate other sized widgets and display them (but there are some issues as I mentioned in the Qt bug on eglfs). With other platform (non eglfs) implementations, and with a window manager in place, you can get desktop windows. The goal with Qt5 is to really get a touchscreen based single-screen device going with eglfs. If a real desktop implementation is required, better to go with the wayland platform plugin.

/etc/powervr.ini  is still used (that is referred by the GL driver internally).  PVR2D based powervr plugin is not used in Qt5 as it directly uses OpenGL ES2.  But as mentioned above, that is not the reason why you get a full screen view.

The eglErrors in the context shown below are pending in my list of TODOs, and are really indicative of some of the major issues in the current rendering framework in Qt5 relating to eglfs. It is going to take some effort to push all the patches upstream.

regards,
Prabu


-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Friday, June 28, 2013 6:07 PM
To: Sundareson, Prabindh
Cc: buildroot at uclibc.org
Subject: Issue with Qt5 and PowerVR drivers

Hello Prabu,

Over the last few days, I've worked on getting the PowerVR drivers to work with Qt4 and Qt5 to get OpenGL features. Thanks to your blog posts, patches and configuration examples, I managed to get Qt4 running quite well:

  http://free-electrons.com/~thomas/pub/opengl-beagle.mp4

So except the artifact on the text that shows the frame rate, it works properly (if you have informations about this artifact, I'm interested). I've given my patches to Spenser Gilliland so that he can clean them up and submit them for integration in Buildroot.

Then, I worked to do the same on Qt5. I've integrated your eglfswindow patch from https://github.com/prabindh/qt-configs/blob/master/qt5_1.0_Feb13/qeglfswindow.cpp.patch
(note: I had to replace
QPlatformIntegration::Capability::MultipleWindows by QPlatformIntegration::MultipleWindows to get things to build).

The hellogl_es2 application runs, but it only shows the OpenGL part itself, and not the window around it, the menu bar, the status bar and so on. Is this expected? See the following video:

  http://free-electrons.com/~thomas/pub/opengl-beagle-qt5.mp4

Also, when I run an application like the analogclock, with Qt4 it takes only a portion of the screen size (the rest of the screen being green), while with Qt5 the analogclock application is scaled to take the entire screen. I have the feeling that the way windows/widgets are managed is quite different between Qt4 and Qt5.

In Qt4, my understanding is that there is some special integration with the PowerVR drivers with the libpvrQWSWSEGL.so.1 library, which one references from /etc/powervr.ini. However, with Qt5, there is no such thing as far as I understand. Is this the reason why I don't have the
hellogl_es2 application showing all the widgets?

Note that the hellogl_es2 application displays a number of error messages when executed with Qt5:

This plugin does not support propagateSizeHints() This plugin does not support setParent!
This plugin does not support setParent!
This plugin does not support setParent!
This plugin does not support setParent!
This plugin does not support setParent!
This plugin does not support setParent!
This plugin does not support setParent!
This plugin does not support propagateSizeHints()
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QOpenGLContext::swapBuffers() called with non-opengl surface
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QOpenGLContext::swapBuffers() called with non-opengl surface
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QOpenGLContext::swapBuffers() called with non-opengl surface
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QOpenGLContext::swapBuffers() called with non-opengl surface
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QOpenGLContext::swapBuffers() called with non-opengl surface
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QOpenGLContext::swapBuffers() called with non-opengl surface
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QOpenGLContext::swapBuffers() called with non-opengl surface
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f7e8
QOpenGLContext::swapBuffers() called with non-opengl surface 

For reference here is my Qt5 configure line:

./configure -v -prefix /usr -hostprefix /home/test/outputs/xyz/host/usr -sysroot /home/test/outputs/xyz/host/usr/arm-buildroot-linux-gnueabi/sysroot -plugindir /usr/lib/qt/plugins -no-rpath -nomake examples -nomake demos -nomake tests -device buildroot -no-c++11 -optimized-qmake -no-kms -no-cups -no-nis -no-libudev -no-iconv -no-gstreamer -no-gtkstyle -system-zlib -system-pcre -no-pch -release -shared -largefile -opensource -confirm-license -gui -widgets --enable-linuxfb -no-directfb -no-xcb -opengl es2 -eglfs -openssl -no-fontconfig -no-gif -no-libjpeg -no-libpng -no-dbus -glib -no-icu

And here is the list of features that Qt5 has enabled:

qmake vars .......... styles += mac fusion windows QT_CFLAGS_GLIB = -pthread -I/home/test/outputs/xyz/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0 -I/home/test/outputs/xyz/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/glib-2.0/include   QT_L
IBS_GLIB = -lgthread-2.0 -pthread  -lrt -L/home/test/outputs/xyz/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib -lglib-2.0   DEFINES += QT_NO_LIBUDEV DEFINES += QT_NO_XCB PRECOMPILED_DIR = .pch/release-shared OBJECTS_DIR = .obj/release-shared MOC_DIR = .moc/release
-shared RCC_DIR = .rcc/release-shared UI_DIR = .uic/release-shared sql-drivers =  sql-plugins =  sqlite qmake switches ......... 
Build .................. libs
Configuration ..........  cross_compile qpa largefile neon  minimal-config small-config medium-config large-config full-config evdev linuxfb accessibility egl eglfs opengl opengles2 shared qpa reduce_exports reduce_relocations clock-gettime clock-monotonic mremap getaddrin fo ipv6ifname getifaddrs inotify no-jpeg no-png no-gif freetype system-zlib glib openssl concurrent audio-backend v8 release Debug .................. no
C++11 support .......... no
pkg-config ............. yes
Qt D-Bus module ........ no
Qt Concurrent code ..... yes
Qt GUI module .......... yes
Qt Widgets module ...... yes
JavaScriptCore JIT ..... To be decided by JavaScriptCore QML debugging .......... yes PCH support ............ no iWMMXt support ......... no NEON support ........... yes
IPv6 ifname support .... yes
getaddrinfo support .... yes
getifaddrs support ..... yes
Accessibility .......... yes
NIS support ............ no
CUPS support ........... no
Iconv support .......... no
Glib support ........... yes
GStreamer support ...... no
PulseAudio support ..... no
Large File support ..... yes
GIF support ............ no
JPEG support ........... no
PNG support ............ no
zlib support ........... system
Session management ..... auto
libudev support ........ no
Use system proxies ..... no
OpenGL support ......... yes (OpenGL ES 2.x) OpenVG support ......... no XShape support ......... auto XVideo support ......... auto XSync support .......... auto Xinerama support ....... runtime Xcursor support ........ runtime Xfixes support ......... runtime Xrandr support ......... runtime Xi support ............. runtime
Xi2 support ............ auto
MIT-SHM support ........ auto
FontConfig support ..... no
XKB Support ............ auto
GTK theme support ...... no
SQLite support ......... plugin (qt)
OpenSSL support ........ yes (run-time)
Alsa support ........... no
libICU support ......... no
PCRE support ........... system
Xcb support ............ no
Xrender support ........ no
EGLFS support .......... yes
DirectFB support ....... no
LinuxFB support ........ yes
KMS support ............ no

Thanks,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
