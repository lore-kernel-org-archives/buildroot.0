From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 7 Mar 2017 12:48:26 +0100
Subject: [Buildroot] QT5.8 buid failure on master
In-Reply-To: <trinity-a4f8806b-d789-4dea-928a-2d7bb2fad531-1488871993989@3capp-gmx-bs12>
References: <CAOMZO5D_R7_zEzL-X2zPViU+-SZ060JA3hpnE9S01x2PRazUsQ@mail.gmail.com>
 <trinity-a4f8806b-d789-4dea-928a-2d7bb2fad531-1488871993989@3capp-gmx-bs12>
Message-ID: <20170307114826.lend2f2evnob3lya@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Mar 07, 2017 at 08:33:14AM +0100, Peter Seiderer wrote:
> Hallo Fabio,
> 
> > Gesendet: Montag, 06. M?rz 2017 um 23:41 Uhr
> > Von: "Fabio Estevam" <festevam@gmail.com>
> > An: "Peter Seiderer" <ps.report@gmx.net>
> > Cc: "Jagan Teki" <jagannadh.teki@gmail.com>, "Gary Bisson" <gary.bisson@boundarydevices.com>, buildroot at buildroot.org
> > Betreff: QT5.8 buid failure on master
> >
> > Hi,
> > 
> > Trying to Build QT5.8 with Buildroot master tree causes the following error:
> > 
> > /home/fabio/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++
> > -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> > -D_FILE_OFFSET_BITS=64 -Os
> > --sysroot=/home/fabio/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot
> > -O2 -O3 -std=c++1z -fvisibility=hidden -fvisibility-inlines-hidden
> > -fno-exceptions -Wall -W -Wvla -Wdate-time -D_REENTRANT -fPIC
> > -DQT_EGL_NO_X11 -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE
> > -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_PLUGIN
> > -DQT_EVENTDISPATCHER_SUPPORT_LIB -DQT_FONTDATABASE_SUPPORT_LIB
> > -DQT_EGL_SUPPORT_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I.
> > -I/home/fabio/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
> > -I../../../../include -I../../../../include/QtEventDispatcherSupport
> > -I../../../../include/QtEventDispatcherSupport/5.8.0
> > -I../../../../include/QtEventDispatcherSupport/5.8.0/QtEventDispatcherSupport
> > -I../../../../include/QtFontDatabaseSupport
> > -I../../../../include/QtFontDatabaseSupport/5.8.0
> > -I../../../../include/QtFontDatabaseSupport/5.8.0/QtFontDatabaseSupport
> > -I../../../../include/QtEglSupport
> > -I../../../../include/QtEglSupport/5.8.0
> > -I../../../../include/QtEglSupport/5.8.0/QtEglSupport
> > -I../../../../include/QtGui/5.8.0
> > -I../../../../include/QtGui/5.8.0/QtGui -I../../../../include/QtGui
> > -I../../../../include/QtCore/5.8.0
> > -I../../../../include/QtCore/5.8.0/QtCore -I../../../../include/QtCore
> > -I.moc -I/home/fabio/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
> > -I/home/fabio/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/freetype2
> > -I/home/fabio/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
> > -I/home/fabio/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
> > -I/home/fabio/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/freetype2
> > -I../../../../mkspecs/devices/linux-buildroot-g++ -o
> > .obj/qminimaleglscreen.o qminimaleglscreen.cpp
> > In file included from
> > /home/fabio/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/EGL/egl.h:39:0,
> >                  from
> > ../../../../include/QtEglSupport/5.8.0/QtEglSupport/private/../../../../../src/platformsupport/eglconvenience/qt_egl_p.h:63,
> >                  from
> > ../../../../include/QtEglSupport/5.8.0/QtEglSupport/private/qt_egl_p.h:1,
> >                  from api/qeglfsglobal_p.h:56,
> >                  from api/qeglfsintegration_p.h:54,
> >                  from qeglfsmain.cpp:41:
> > /home/fabio/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/EGL/eglplatform.h:119:22:
> > fatal error: X11/Xlib.h: No such file or directory
> > 
> > The defconfig used to reproduce the problem is available at:
> > http://pastebin.com/qmhnNQXs
> > 
> 
> Try to add (untested):
> 
> # Avoid X11 header collision, use generic EGL native types
> DEFINES += QT_EGL_NO_X11
> 
> to src/plugins/platforms/eglfs/eglfs-plugin.pro (same as all/many other eglfs related
> project files do, even eglfs_x11.pro ;-) )...

Adding that define to eglfs-plugin.pro is sufficient to get qtbase to
build properly.

However when I launch the Cinematic demo I get errors that it can't find
the eglfs_kms device:
# CinematicExperience-demo -platform eglfs
qt.qpa.egldeviceintegration: Failed to load EGL device integration
 "eglfs_kms"
qt.qpa.egldeviceintegration: Failed to load EGL device integration
 "eglfs_kms_egldevice"
...
EGL Error : Could not create the egl surface: error = 0x300b

(note that kmscube is working fine)

I'm trying to understand how it works in Yocto but something definitely
needs fixing.

Regards,
Gary
