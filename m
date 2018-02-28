From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 28 Feb 2018 06:47:52 -0500
Subject: [Buildroot] [git commit] qt5wayland: fix build issue with
 mesa3d w/out xcb
In-Reply-To: <87zi3tlj4q.fsf@dell.be.48ers.dk>
References: <20180227210121.125F78137A@busybox.osuosl.org>
 <20180227231125.528dcbf9@windsurf.lan>
 <87zi3tlj4q.fsf@dell.be.48ers.dk>
Message-ID: <20180228114752.h66a7qpvfug3dn3g@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter,

On Wed, Feb 28, 2018 at 07:32:05AM +0100, Peter Korsgaard wrote:
> ...
> 
> Yes, you had already discussed this on IRC and I agree, but that fix
> does not look like it will be ready in time for 2018.02, so I've added
> these fixes for now.
> 
> But indeed, please continue to work on the real upstreamable pkg-config
> fix.
>

I have backported the patch[1] pointed by Peter Seiderer and the build
of qt5multimedia, qt5wayland and qt5webkit passed successfully on next
branch where the workaround is not preset (+ qt5.10).

As you can see, the -DMESA_EGL_NO_X11_HEADERS flag is passed to the
compiler.

	/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/bin/x86_64-buildroot-linux-gnu-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot -O2 -O3 -std=c++1z -fvisibility=hidden -fvisibility-inlines-hidden -fno-exceptions -Wall -W -Wvla -Wdate-time -Wshift-overflow=2 -Wduplicated-cond -D_REENTRANT -fPIC -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_PLUGIN -DQT_WAYLANDCLIENT_LIB -DQT_SERVICE_SUPPORT_LIB -DQT_EGL_SUPPORT_LIB -DQT_GUI_LIB -DQT_CORE_LIB -DMESA_EGL_NO_X11_HEADERS -I. -I../../../../hardwareintegration/client/wayland-egl -I../../../../../include/QtWaylandClient/5.10.1 -I../../../../../include/QtWaylandClient/5.10.1/QtWaylandClient -I../../../../../include -I../../../../../include/QtWaylandClient -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5 -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtServiceSupport -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtServiceSupport/5.10.1 -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtServiceSupport/5.10.1/QtServiceSupport -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtEglSupport -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtEglSupport/5.10.1 -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtEglSupport/5.10.1/QtEglSupport -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtGui/5.10.1 -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtGui/5.10.1/QtGui -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtGui -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.10.1 -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.10.1/QtCore -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore -I.moc -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include -I/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/mkspecs/devices/linux-buildroot-g++ -o .obj/qwaylandglcontext.o ../../../../hardwareintegration/client/wayland-egl/qwaylandglcontext.cpp

So sorry for the noise; I finally found the time (copy a simple patch
and start a build). I can send a patch serie today for master that
reverts my workaround.

Note: It is not tested on other EGL platform without XCB and MESA3D/EGL
with XCB.

[1]: https://codereview.qt-project.org/#/c/198906/

Regards,
Gael
