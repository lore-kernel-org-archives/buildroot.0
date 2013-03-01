From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Mar 2013 10:08:44 +0100
Subject: [Buildroot] [PATCH] Add Qt5 packages
In-Reply-To: <513011C9.8030301@je-eigen-domein.nl>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <513011C9.8030301@je-eigen-domein.nl>
Message-ID: <20130301100844.2f7b014a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Fri, 01 Mar 2013 03:26:17 +0100, Floris Bos wrote:

> Nice job.
> Gave it a try, and it seems to work, except some minor issues:

Wah, thank you very much for taking the time to test all this. This is
really appreciated, thanks!

> - declarative and webkit depend on gui

Ok.

> - build error when using an ARM buildroot/uClibc toolchain:
> 
> ../3rdparty/v8/src/platform-linux.cc: In function 'void 
> v8::internal::ProfilerSignalHandler(int, siginfo_t*, void*)':
> ../3rdparty/v8/src/platform-linux.cc:1034:51: error: 'mcontext_t' has no 
> member named 'gregs'
> ../3rdparty/v8/src/platform-linux.cc:1035:51: error: 'mcontext_t' has no 
> member named 'gregs'
> ../3rdparty/v8/src/platform-linux.cc:1036:51: error: 'mcontext_t' has no 
> member named 'gregs'
> make[3]: *** [.obj/release-shared/platform-linux.o] Error 1
> 
> ==
> #if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
>    sample->pc = reinterpret_cast<Address>(mcontext.gregs[R15]);
>    sample->sp = reinterpret_cast<Address>(mcontext.gregs[R13]);
>    sample->fp = reinterpret_cast<Address>(mcontext.gregs[R11]);
> #else
>    sample->pc = reinterpret_cast<Address>(mcontext.arm_pc);
>    sample->sp = reinterpret_cast<Address>(mcontext.arm_sp);
>    sample->fp = reinterpret_cast<Address>(mcontext.arm_fp);
> #endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
> ==
> 
> For testing purposes I changed it to #if (0) to let it use 
> mcontext.arm_pc and that compiles fine.

Ok, that's easy enough to fix.

> - At runtime:
> 
> QFontDatabase: Cannot find font directory /usr/lib/fonts - is Qt 
> installed correctly?
> 
> Seems no fonts installed with Qt.
> Selected "liberation" package, but that installs the fonts to 
> /usr/share/fonts
> Worked around by making a symlink from /usr/lib/fonts to there.

I suspect this comes from:

$ cat mkspecs/features/qpa/genericunixfontdatabase.prf 
CONFIG += qpa/basicunixfontdatabase
contains(QT_CONFIG, fontconfig) {
    DEFINES += Q_FONTCONFIGDATABASE
    LIBS += -lfontconfig
} else {
    fonts.path = $$[QT_INSTALL_LIBS]/fonts
    fonts.files = $$QT_SOURCE_TREE/lib/fonts/*
    INSTALLS += fonts
}

So I suspect you didn't had fontconfig support enabled. Is this correct?

If so, then I can include a path that makes fonts.path be
$$[QT_INSTALL_PREFIX]/share/fonts/.

But Qt has some fonts in lib/fonts/, so maybe we should research how to
install them, at least optionally, because they have some fonts in the
special Qt format, which may be useful if you don't have a TTF font
renderer available.

> - When building for a Raspberry Pi (eglfs plugin), applications fails to 
> start at runtime:
> 
> assertion 
> failure:/hdd/max/dev/qtbuildroot/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/interface/vmcs_host/vc_vchi_dispmanx.c:84:lock_obtain():dispmanx_client.initialised
> Aborted
> 
> Library does not seem to get initialised properly.
> Looks like there is rPi specific glue code that is supposed to call 
> bcm_host_init() in 
> qt5base-5.0.0/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
> 
> But it did not compile that file.
> 
> buildroot/output/build/qt5base-5.0.0$ find . |grep eglfshooks |grep \\.o
> ./src/plugins/platforms/eglfs/.obj/release-shared/qeglfshooks_stub.o

Aah, yes, the platform glue code. That's not easy to handle because the
way I pass the cross-compiler path and al. is by using a custom
"-device buildroot", which works by providing our own
mkspecs/devices/linux-buildroot-g++/qmake.conf and
mkspecs/devices/linux-buildroot-g++/qplatformdefs.h files. But a few
platforms have some custom code in mkspecs/devices/linux-<something>/.
But their qmake.conf often is horrible. For example, the RasberryPi one
hardcodes path to /opt/vc/ for the OpenGL libraries, but Buildroot
installs them in /usr/.

Not sure how to handle this problem... The Qt5 way of doing things
seems really strange to me: it mixes "configuration" (defining where
the libraries are, what are the compiler flags and so on), with the
real code (in this case, the glue code for a particular platform).

Ideas?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
