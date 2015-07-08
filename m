From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 8 Jul 2015 12:15:26 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-06-28
In-Reply-To: <20150706174356.6d6471c9@free-electrons.com>
References: <20150629063017.4326F10013E@stock.ovh.net>
 <1436194278.3246.42.camel@synopsys.com>
 <20150706174356.6d6471c9@free-electrons.com>
Message-ID: <1436357726.3043.10.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2015-07-06 at 17:43 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> I don't know if your mailer allows that, but if you could avoid
> wrapping the text you are replying to, it would be great. Because
> you're wrapping the quoted text, all URLs to build reports are broken.

Well I used to use Evolution with auto-wrapping on 72 character.
Now I relaxed this limitation to much higher value. Let's see how it goes.

> > >          arc |       binutils-arc-2015.06-rc1 | NOK | 
> > > http://autobuild.buildroot.net/results/53d333850a82f71c4e708926d35190
> > > 93282a6cdf/
> > 
> > I was not able to reproduce that one and from build log I may assume
> > build process was terminated from outside ("ld terminated with signal 6
> > [Aborted]"). Is there a chance that build server was shut down or
> > something?
> 
> Probably not: that build server has an uptime of 215 days. And if a
> sudden shutdown happens, the build result is simply lost and never
> reported.
> 
> However, this machine does have quite a few scary messages in "dmesg",
> so if the problem hasn't reproduced another time, I'd say just forget
> about it.

Let's see indeed it it manifests again.
Probably I was not able to reproduce it because I'm on latest Fedora 22,
while your build machine is something else.

BTW I think we discussed it already - if there's a way to find out details of
a particular build machine? At least it's Linux distro flavor and version.
Preferably output of "gcc -v" and maybe other common tools.

That will allow to reconstruct exactly the same build environment. Remember
we saw a problem with binutils and gdb building that was not reproducible
on Fedora 21/22 but happened on your build machines? 

> > >          arc |                  empty-0.6.19b | NOK | 
> > > http://autobuild.buildroot.net/results/53db871fe076ad96cdb7aecd3930a8
> > > 6092b9833f/
> > >          arc |                  empty-0.6.19b | NOK | http://autobuil
> > > d.buildroot.net/results/943876e5c65707de11cc5890f1ef62537b92b631/
> > 
> > 
> You could make the package just depend on thread support. *But* it does
> build fine with the toolchain at
> http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config.
> So it is a little bit weird.
> 
> Can you investigate by testing with this prebuilt ARM nothread
> toolchain?

Hm, once again it's probably my different build environment but I have
exactly the same failure with this pre-built ARM toolchain.

That's my output of "make savedefconfig". Basically it's
http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config
plus BR2_PACKAGE_EMPTY=y:
------------------------------->8----------------------------
BR2_arm=y
BR2_arm1176jzf_s=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="
http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2015.05-496-g85945aa.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_EMPTY=y
------------------------------->8----------------------------

And here's what I see while building "empty":
------------------------------->8----------------------------
>>> empty 0.6.19b Extracting
gzip -d -c /home/abrodkin/Projects/sources/git/buildroot/dl/empty-0.6.19b.tgz | tar --strip-components=1 -C
/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/build/empty-0.6.19b  -xf -
>>> empty 0.6.19b Patching

Applying 0001-respect-LDFLAGS.patch using patch: 
patching file Makefile
>>> empty 0.6.19b Configuring
>>> empty 0.6.19b Building
/usr/bin/make -j5 PATH="/home/abrodkin/Outputs/buildroot/empty-arm
-nothreads/host/bin:/home/abrodkin/Outputs/buildroot/empty-arm
-nothreads/host/sbin:/home/abrodkin/Outputs/buildroot/empty-arm
-nothreads/host/usr/bin:/home/abrodkin/Outputs/buildroot/empty-arm
-nothreads/host/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/abrodkin/.local/bin:/home/ab
rodkin/bin:/home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin" AR="/home/abrodkin/Outputs/buildroot/empty-arm
-nothreads/host/usr/bin/arm-linux-ar" AS="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux
-as" LD="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-ld"
NM="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-nm"
CC="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-gcc"
GCC="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-gcc"
CPP="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-cpp"
CXX="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-g++"
FC="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-gfortran"
RANLIB="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-ranlib"
READELF="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-readelf"
STRIP="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-strip"
OBJCOPY="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-objcopy"
OBJDUMP="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-objdump" AR_FOR_BUILD="/usr/bin/ar"
AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/lib64/ccache/gcc" GCC_FOR_BUILD="/usr/lib64/ccache/gcc"
CXX_FOR_BUILD="/usr/lib64/ccache/g++" LD_FOR_BUILD="/usr/bin/ld" CPPFLAGS_FOR_BUILD="
-I/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/include" CFLAGS_FOR_BUILD="-O2 
-I/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/include" CXXFLAGS_FOR_BUILD="-O2 
-I/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/include" LDFLAGS_FOR_BUILD="
-L/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/lib -L/home/abrodkin/Outputs/buildroot/empty-arm
-nothreads/host/usr/lib -Wl,-rpath,/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/lib"
FCFLAGS_FOR_BUILD="" DEFAULT_ASSEMBLER="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-as"
DEFAULT_LINKER="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-ld" CPPFLAGS="
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64   -Os " CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os "
LDFLAGS="" FCFLAGS="" PKG_CONFIG="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/pkg-config"
STAGING_DIR="/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot"
INTLTOOL_PERL=/usr/bin/perl -C /home/abrodkin/Outputs/buildroot/empty-arm-nothreads/build/empty-0.6.19b all
/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/host/usr/bin/arm-linux-gcc -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os   empty.c -lutil -o empty
empty.c: In function ?main?:
empty.c:202:14: error: storage size of ?semu? isn?t known
  union semun semu;
              ^
Makefile:19: recipe for target 'all' failed
make[2]: *** [all] Error 1
package/pkg-generic.mk:156: recipe for target '/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/build/empty
-0.6.19b/.stamp_built' failed
make[1]: *** [/home/abrodkin/Outputs/buildroot/empty-arm-nothreads/build/empty-0.6.19b/.stamp_built] Error 2
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2
------------------------------->8----------------------------

-Alexey
