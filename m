From: Espen Frimann Koren <espenfk@gmail.com>
Date: Tue, 17 Sep 2013 09:37:46 +0200
Subject: [Buildroot] Fix to Qt5base-build
Message-ID: <CA+csPL67CJSJHgfhgnJJfBcw+LUszPWT3VwFCEFw5n3Oy4jN1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

I have found a solution to why Qt5 does not find either OpenGL ES2 or EGL
during configuration.

In the file package/qt5/qt5base/qt5base-mkspecs-files.patch, two files are
created in output/build/qt5base-5.0.2/mkspecs/devices/linux-buildroot-g++.
In my opinion the following lines must be included in the file (from the
patch):

QMAKE_LIBS_EGL         += -lEGL
QMAKE_LIBS_OPENGL_ES2  += -lEGL -lGAL

QMAKE_CFLAGS           += -DEGL_API_FB=1
QMAKE_CXXFLAGS         += -DEGL_API_FB=1
QMAKE_CFLAGS_DEBUG     += -DEGL_API_FB=1
QMAKE_CXXFLAGS_DEBUG   += -DEGL_API_FB=1

I cannot commit to the buildroot tree, so someone have to do this. There
are other issues in the corresponding file in
output/build/qt5base-5.0.2/mkspecs/devices/linux-imx6-g++/qmake.conf, which
is provided by Qt themselves, that may need to be taken into consideration,
for instance

EGLFS_PLATFORM_HOOKS_SOURCES = $$PWD/qeglfshooks_imx6.cpp

Maybe there should be possible to select Qt device mkspec in the make
menuconfig-system?

Sp1
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130917/c46171b6/attachment.html>
