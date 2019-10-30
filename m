From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 30 Oct 2019 23:26:42 +0100
Subject: [Buildroot] [PATCH 2/2] package/libv4l: link with libatomic
 when needed
In-Reply-To: <20191030113040.474a31f9@windsurf>
References: <20191030065303.22948-1-bernd.kuhls@t-online.de>
 <20191030065303.22948-2-bernd.kuhls@t-online.de>
 <20191030113040.474a31f9@windsurf>
Message-ID: <20191030232618.5cd32feb@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Wed, 30 Oct 2019 11:30:40 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Wed, 30 Oct 2019 07:53:03 +0100
> Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> > On some architectures, atomic operations are provided by the libatomic
> > library from gcc. Linking with libatomic is therefore necessary,
> > otherwise the build fails with:
> >
> > /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
> >  qv4l2-qv4l2.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
> >
> > This is often for example the case on sparcv8 32 bit.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/089/08952dbf89bf3c49da7697943441cee411940420/
>
> The LIBV4L_AUTORECONF = YES that was kept in
> d0f3c9de49bfe3f8ac6e75a706540eefcc1afc07 was intended to fix this
> libatomic linking issue, so I'm a bit confused.

Strange, this worked (when tested 3./4. October)..., now with buildroot master
I can reproduce the libatomic link failure even with the 'LIBV4L_AUTORECONF = YES'...

The working version link command (and output) was (and clearly using the *.la files):

/bin/sh ../../libtool  --tag=CXX   --mode=link /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/sparc-linux-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -std=c++11 -L/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lQt5Widgets -lQt5Gui -lQt5Core  -L/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lasound  -pthread  -o qv4l2 qv4l2-qv4l2.o qv4l2-general-tab.o qv4l2-ctrl-tab.o qv4l2-vbi-tab.o qv4l2-capture-win.o qv4l2-tpg-tab.o qv4l2-capture-win-qt.o qv4l2-capture-win-gl.o qv4l2-alsa_stream.o qv4l2-raw2sliced.o qv4l2-v4l2-tpg-core.o qv4l2-v4l2-tpg-colors.o qv4l2-moc_qv4l2.o qv4l2-moc_general-tab.o qv4l2-moc_capture-win.o qv4l2-moc_vbi-tab.o qv4l2-qrc_qv4l2.o ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la ../libv4l2util/libv4l2util.la ../libmedia_dev/libmedia_dev.la -largp
libtool: warning: library '/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Widgets.la' was moved.
libtool: warning: library '/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Gui.la' was moved.
libtool: warning: library '/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Gui.la' was moved.
libtool: warning: library '/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Core.la' was moved.
libtool: warning: library '/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Core.la' was moved.
libtool: warning: library '/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Widgets.la' was moved.
libtool: warning: library '/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Gui.la' was moved.
libtool: warning: library '/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Gui.la' was moved.
libtool: warning: library '/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Core.la' was moved.
libtool: warning: library '/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Core.la' was moved.
libtool: link: /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/sparc-linux-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -std=c++11 -pthread -o qv4l2 qv4l2-qv4l2.o qv4l2-general-tab.o qv4l2-ctrl-tab.o qv4l2-vbi-tab.o qv4l2-capture-win.o qv4l2-tpg-tab.o qv4l2-capture-win-qt.o qv4l2-capture-win-gl.o qv4l2-alsa_stream.o qv4l2-raw2sliced.o qv4l2-v4l2-tpg-core.o qv4l2-v4l2-tpg-colors.o qv4l2-moc_qv4l2.o qv4l2-moc_general-tab.o qv4l2-moc_capture-win.o qv4l2-moc_vbi-tab.o qv4l2-qrc_qv4l2.o  -L/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Widgets.so /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Gui.so /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Core.so -latomic /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libasound.so -ldl ../../lib/libv4l2/.libs/libv4l2.so -lpthread /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/build/libv4l-1.18.0/lib/libv4lconvert/.libs/libv4lconvert.so ../../lib/libv4lconvert/.libs/libv4lconvert.so -lrt -lm /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libjpeg.so ../libv4l2util/.libs/libv4l2util.a ../libmedia_dev/.libs/libmedia_dev.a -largp -pthread -Wl,-rpath -Wl,/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -Wl,-rpath -Wl,/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib -Wl,-rpath -Wl,/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/build/libv4l-1.18.0/lib/libv4l2/.libs -Wl,-rpath -Wl,/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/build/libv4l-1.18.0/lib/libv4lconvert/.libs -Wl,-rpath -Wl,/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -Wl,-rpath -Wl,/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib

The actual/failing link command looks like the following:

/bin/sh ../../libtool  --tag=CXX   --mode=link /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/sparc-linux-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -std=c++11 -lQt5Widgets -lQt5Gui -lQt5Core  -lasound  -pthread  -o qv4l2 qv4l2-qv4l2.o qv4l2-general-tab.o qv4l2-ctrl-tab.o qv4l2-vbi-tab.o qv4l2-capture-win.o qv4l2-tpg-tab.o qv4l2-capture-win-qt.o qv4l2-capture-win-gl.o qv4l2-alsa_stream.o qv4l2-raw2sliced.o qv4l2-v4l2-tpg-core.o qv4l2-v4l2-tpg-colors.o qv4l2-moc_qv4l2.o qv4l2-moc_general-tab.o qv4l2-moc_capture-win.o qv4l2-moc_vbi-tab.o qv4l2-qrc_qv4l2.o ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la ../libv4l2util/libv4l2util.la ../libmedia_dev/libmedia_dev.la -largp
libtool: link: /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/sparc-linux-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -std=c++11 -pthread -o qv4l2 qv4l2-qv4l2.o qv4l2-general-tab.o qv4l2-ctrl-tab.o qv4l2-vbi-tab.o qv4l2-capture-win.o qv4l2-tpg-tab.o qv4l2-capture-win-qt.o qv4l2-capture-win-gl.o qv4l2-alsa_stream.o qv4l2-raw2sliced.o qv4l2-v4l2-tpg-core.o qv4l2-v4l2-tpg-colors.o qv4l2-moc_qv4l2.o qv4l2-moc_general-tab.o qv4l2-moc_capture-win.o qv4l2-moc_vbi-tab.o qv4l2-qrc_qv4l2.o  -lQt5Widgets -lQt5Gui -lQt5Core -lasound ../../lib/libv4l2/.libs/libv4l2.so -lpthread /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/build/libv4l-1.18.0/lib/libv4lconvert/.libs/libv4lconvert.so ../../lib/libv4lconvert/.libs/libv4lconvert.so -lrt -lm -ljpeg ../libv4l2util/.libs/libv4l2util.a ../libmedia_dev/.libs/libmedia_dev.a -largp -pthread -Wl,-rpath -Wl,/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/build/libv4l-1.18.0/lib/libv4l2/.libs -Wl,-rpath -Wl,/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/build/libv4l-1.18.0/lib/libv4lconvert/.libs
/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: qv4l2-qv4l2.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

And is not using the Qt5 *.la files (checked using strace)...

Adding the (missing?) '-L/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib'
libtool command line parameter fixes the linking for the actual build...

Any hint which (buildroot?) change triggered the remove of the link/library path removal?

Regards,
Peter

>
> Could you discuss this with Peter Seiderer (in Cc) ?
>
> Thanks,
>
> Thomas
