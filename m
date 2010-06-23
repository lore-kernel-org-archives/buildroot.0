From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 11:20:22 +0200
Subject: [Buildroot] Host libraries - status
In-Reply-To: <20100623090015.199dd823@surf>
References: <201006230045.23043.yann.morin.1998@anciens.enib.fr>
	<20100623090015.199dd823@surf>
Message-ID: <20100623112022.4bb9cab0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Jun 2010 09:00:15 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> > - fix fakeroot, so it works with rpath. Might require a huge amount
> > of work.
> 
> I'm not sure what the exact problem with fakeroot is. Maybe we should
> dig into this.

Ok, I took the time to investigate this. I tried:

HOST_LDFLAGS += -Wl,-rpath -Wl,$(HOST_DIR)/usr/lib

and I could reproduce the fakeroot problem: "preload library not
found". This happens because libfakeroot.so doesn't get compiled. This
in turn happens because ./configure detects that LD doesn't support
shared libraries, which in turn happens because ./configure detects
that LD isn't GNU LD, which happens because for ld, "-Wl,-rpath
-Wl,$(HOST_DIR)/usr/lib" are incorrect options. And it's true, since
the ld option is just "-rpath", the -Wl thing being here to tell gcc to
pass these options down to ld.

So, I decided to try :

HOST_LDFLAGS += -rpath $(HOST_DIR)/usr/lib

unfortunately, it breaks host-genext2fs, because this stupid guy passes
those LDFLAGS directly to gcc :

configure:2562: checking for C compiler default output file name
configure:2589: /usr/bin/gcc -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/include -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/include -I/home/test/outputs/arm-2009q
3-2010-06-23-08-58-40/output/host/include -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/include  -L/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/lib -L/home/test/outputs
/arm-2009q3-2010-06-23-08-58-40/output/host/usr/lib -rpath /home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/lib conftest.c  >&5
gcc: /home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/lib: No such file or directory
gcc: unrecognized option '-rpath'

I have therefore looked at the ./configure options and environment we
are passing to host-genext2fs ./configure script, and we *never* pass
the -rpath option in CFLAGS. Here is the full command line that is used
to run host-genext2fs ./configure, formatted for readability:

(
cd /home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/build/host-genext2fs-1.4/ && rm -rf config.cache;
PATH=/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/bin:/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
AR="/usr/bin/ar"
AS="/usr/bin/as"
LD="/usr/bin/ld -L/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/lib -L/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/lib -rpath /home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/lib"
NM="/usr/bin/nm"
CC="/usr/bin/gcc -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/include -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/include"
GCC="/usr/bin/gcc -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/include -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/include"
CXX="/usr/bin/g++ -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/include -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/include"
CPP="/usr/bin/cpp -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/include -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/include"
AR_FOR_BUILD="/usr/bin/ar"
AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc"
GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++"
LD_FOR_BUILD="/usr/bin/ld"
FC_FOR_BUILD="/usr/bin/ld"
CFLAGS_FOR_BUILD="-I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/include -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/include -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/lib -L/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/lib -rpath /home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-ar"
AS_FOR_TARGET="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-as"
CC_FOR_TARGET="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-gcc"
LD_FOR_TARGET="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-ld"
NM_FOR_TARGET="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-nm"
RANLIB_FOR_TARGET="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-ranlib"
STRIP_FOR_TARGET="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-strip"
OBJCOPY_FOR_TARGET="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-objcopy"
OBJDUMP_FOR_TARGET="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-objdump"
DEFAULT_ASSEMBLER="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-as"
DEFAULT_LINKER="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-ld"
ORIGINAL_AS_FOR_TARGET="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-as"
ORIGINAL_LD_FOR_TARGET="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-ld"
ORIGINAL_NM_FOR_TARGET="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-nm"
ORIGINAL_OBJDUMP_FOR_TARGET="/home/test/arm-2009q3/bin/arm-none-linux-gnueabi-objdump"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG="/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/bin/pkg-config"
PKG_CONFIG_LIBDIR="/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/lib/pkgconfig"
PERLLIB="/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/lib/perl"
LD_LIBRARY_PATH="/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/lib:"
CFLAGS="-I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/include -I/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/include"
LDFLAGS="-L/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/lib -L/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/lib -rpath /home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr/lib"
./configure
--verbose
--prefix="/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/usr"
--sysconfdir="/home/test/outputs/arm-2009q3-2010-06-23-08-58-40/output/host/etc"
)

Do you see anything wrong here ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
