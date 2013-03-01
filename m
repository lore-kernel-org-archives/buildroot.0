From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 01 Mar 2013 03:26:17 +0100
Subject: [Buildroot] [PATCH] Add Qt5 packages
In-Reply-To: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <513011C9.8030301@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/28/2013 12:25 AM, Thomas Petazzoni wrote:
> Here is a set of patches that add Qt5 support in Buildroot. I have
> built a number of different combinations, but there are some many
> different possibilities, that I obviously couldn't test all of
> them. Some testing will be appreciated, but for sure, only the
> autobuilders will really help in getting a good build coverage of all
> this.

Nice job.
Gave it a try, and it seems to work, except some minor issues:

- declarative and webkit depend on gui
- build error when using an ARM buildroot/uClibc toolchain:

../3rdparty/v8/src/platform-linux.cc: In function 'void 
v8::internal::ProfilerSignalHandler(int, siginfo_t*, void*)':
../3rdparty/v8/src/platform-linux.cc:1034:51: error: 'mcontext_t' has no 
member named 'gregs'
../3rdparty/v8/src/platform-linux.cc:1035:51: error: 'mcontext_t' has no 
member named 'gregs'
../3rdparty/v8/src/platform-linux.cc:1036:51: error: 'mcontext_t' has no 
member named 'gregs'
make[3]: *** [.obj/release-shared/platform-linux.o] Error 1

==
#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
   sample->pc = reinterpret_cast<Address>(mcontext.gregs[R15]);
   sample->sp = reinterpret_cast<Address>(mcontext.gregs[R13]);
   sample->fp = reinterpret_cast<Address>(mcontext.gregs[R11]);
#else
   sample->pc = reinterpret_cast<Address>(mcontext.arm_pc);
   sample->sp = reinterpret_cast<Address>(mcontext.arm_sp);
   sample->fp = reinterpret_cast<Address>(mcontext.arm_fp);
#endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
==

For testing purposes I changed it to #if (0) to let it use 
mcontext.arm_pc and that compiles fine.


- At runtime:

QFontDatabase: Cannot find font directory /usr/lib/fonts - is Qt 
installed correctly?

Seems no fonts installed with Qt.
Selected "liberation" package, but that installs the fonts to 
/usr/share/fonts
Worked around by making a symlink from /usr/lib/fonts to there.


- When building for a Raspberry Pi (eglfs plugin), applications fails to 
start@runtime:

assertion 
failure:/hdd/max/dev/qtbuildroot/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/interface/vmcs_host/vc_vchi_dispmanx.c:84:lock_obtain():dispmanx_client.initialised
Aborted

Library does not seem to get initialised properly.
Looks like there is rPi specific glue code that is supposed to call 
bcm_host_init() in 
qt5base-5.0.0/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp

But it did not compile that file.

buildroot/output/build/qt5base-5.0.0$ find . |grep eglfshooks |grep \\.o
./src/plugins/platforms/eglfs/.obj/release-shared/qeglfshooks_stub.o


Yours sincerely,

Floris Bos
