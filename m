From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Jul 2016 22:23:36 +0200
Subject: [Buildroot] [PATCH] package/acpitool: not available for bfin
In-Reply-To: <20160718215151.4948f20d@free-electrons.com>
References: <1468778160-32413-1-git-send-email-yann.morin.1998@free.fr>
 <CAK4VdL1HipqOpg5CuYi+KDZiyrLBZQvNLYcDsECLHNC+pqsAiA@mail.gmail.com>
 <20160718183059.GA12720@free.fr>
 <20160718215151.4948f20d@free-electrons.com>
Message-ID: <20160718202336.GB12720@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-07-18 21:51 +0200, Thomas Petazzoni spake thusly:
> On Mon, 18 Jul 2016 20:30:59 +0200, Yann E. MORIN wrote:
> 
> > > I have then also picked one other C++ package at random to test with
> > > this toolchain, called "bellagio". It also shows the same "configure:
> > > error: C++ compiler cannot create executables" error with the
> > > autobuilder toolchain.  
> > 
> > That's because Bellagio also checks for AC_PROG_CXX before AC_PROG_CC:
> > 
> >     https://sourceforge.net/p/omxil/omxil/ci/master/tree/configure.ac
> > 
> >     129 # Check for a working C compiler
> >     130 AC_PROG_CXX
> >     131 AC_PROG_CC
> > 
> > If you inverse the checks (i.e. AC_PROG_CC then AC_PROG_CXX) it works.
> > I also tried that with acpitool, and it indeed fixes the configure issue
> > (but then there was the build issue, at which point I bailed out).
> 
> Is having AC_PROG_CC called before AC_PROG_CXX a requirement of
> autoconf, or a bug in the toolchain?

Ok, so nothing in autoconf states that AC_PROG_CC should be before
AC_PROG_CXX.

So, I tried to autoreconf acpitool without changing the ordering. And it
still breaks at the same location, but for another reason:

    [...]
    checking host system type... bfin-buildroot-linux-uclibc
    checking whether the C++ compiler works... no
    configure: error: in `/home/ymorin/dev/buildroot/O/build/acpitool-0.5.1':
    configure: error: C++ compiler cannot create executables
    See `config.log' for more details

And config.log says:

    configure:3032: checking whether the C++ compiler works
    configure:3054: /home/ymorin/dev/buildroot/O/host/usr/bin/bfin-linux-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.cpp  >&5
    /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld: a.out: hidden symbol `___udivsi3' in /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/libgcc.a(_udivsi3.o) is referenced by DSO
    /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld: final link failed: Bad value
    collect2: error: ld returned 1 exit status
    configure:3058: $? = 1
    configure:3096: result: no

So. Their configure file is borked. It was generated with autoconf 2.63,
if that is of any importance.

However, what's weird is that, if I change configure.in to call
AC_PROG_CC before AC_PROG_CXX, then I don't see this failure:

    [...]
    checking host system type... bfin-buildroot-linux-uclibc
    checking for bfin-buildroot-linux-uclibc-gcc... /home/ymorin/dev/buildroot/O/host/usr/bin/bfin-linux-gcc
    checking whether the C compiler works... yes
    checking for C compiler default output file name... a.out
    checking for suffix of executables...
    checking whether we are cross compiling... yes
    checking for suffix of object files... o
    checking whether we are using the GNU C compiler... yes
    checking whether /home/ymorin/dev/buildroot/O/host/usr/bin/bfin-linux-gcc accepts -g... yes
    checking for /home/ymorin/dev/buildroot/O/host/usr/bin/bfin-linux-gcc option to accept ISO C89... none needed
    checking whether /home/ymorin/dev/buildroot/O/host/usr/bin/bfin-linux-gcc understands -c and -o together... yes
    checking for style of include used by make... GNU
    checking dependency style of /home/ymorin/dev/buildroot/O/host/usr/bin/bfin-linux-gcc... none
    checking whether we are using the GNU C++ compiler... yes
    checking whether /home/ymorin/dev/buildroot/O/host/usr/bin/bfin-linux-g++ accepts -g... yes
    checking dependency style of /home/ymorin/dev/buildroot/O/host/usr/bin/bfin-linux-g++... none
    checking for dirent.h that defines DIR... yes
    checking for library containing opendir... none required
    checking how to run the C preprocessor... /home/ymorin/dev/buildroot/O/host/usr/bin/bfin-linux-cpp
    checking for grep that handles long lines and -e... /home/ymorin/bin/grep
    [...]

> > > Not sure why the autobuilders haven't ever
> > > reported this one, though.  
> > 
> > There are:
> > 
> >     http://autobuild.buildroot.org/?reason=bellagio-0.9.3
> >     http://autobuild.buildroot.org/results/e9b/e9b18697e3c519d38ea3666f69bed5cf008d772d/
> >     http://autobuild.buildroot.org/results/05f/05fa9cb522514e9e5b9e81893f145aab00abd803/
> > 
> > There's even one such failure on ARM:
> >     http://autobuild.buildroot.org/results/f6d/f6db9a9072e19d0632c8e6d64f67248e90f227ce/
> 
> I can't even find this toolchain configuration in our history of
> autobuilder toolchain configs. Maybe it predates that.
> 
> > 
> > And on ARC:
> >     http://autobuild.buildroot.org/results/203/203eb72ead23ea7930dc1a55dd54a8b3eea5c576/
> >     http://autobuild.buildroot.org/results/5d5/5d5fd738f10697985adbc6ed58e6c52ee95b8b33/
> 
> Is it reproducible on ARC ?

I'll try to rebuild it...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
