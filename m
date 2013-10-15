From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Oct 2013 19:31:07 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-10-14
In-Reply-To: <A9D235D0-F376-428F-A49F-E315294C4B5D@layer-7.net>
References: <20131015063009.2086B52C1A0@lolut.humanoidz.org>
 <A9D235D0-F376-428F-A49F-E315294C4B5D@layer-7.net>
Message-ID: <20131015193107.33e234f5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael Rommel,

On Tue, 15 Oct 2013 19:16:16 +0200, Michael Rommel wrote:

> I had a look at this error and tried to compare that with currently
> running builds. As far as I can see, a default build on a i586 with
> the included toolchain works fine and does not need linking with
> libpcre. Also a nm on the mentioned file (sysroot/usr/lib/crt1.o)
> reveals no _gp symbol on an i586 whereas with the external nios
> toolchain, _gp is referenced as symbol.
> 
> rommel at pelican:/var/nfs/software/initrds/uclibc/buildroot-clean-i586/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib$
> nm crt1.o 00000000 D __data_start
>          U __uClibc_main
>          U _fini
>          U _init
> 00000000 T _start
> 00000000 W data_start
>          U main
> 
> Yes, if I include -lpcre on the linker line, the nios2 compile
> completes, but I have no way of testing, whether the result works. I
> also could not find any direct dependency from aiccu to the pcre,
> neither a function call that starts with pcre_, nor an inclusion of a
> pcre.h header file. And, yes, If I include -lpcre on the commandline,
> also the resulting i586 binary works, but unless someone convinces me
> that his is really a missing dependency of aiccu, I am hesitant to
> change anything right now, as most other builds went okay.
> 
> I tend to think, that this is a problem not related to aiccu, but if
> anyone else can confirm this, I fell better :-)

I do agree that blindly linking with pcre does not seem like a good
option. A quick Google search about NIOS and gp indicates that gp is a
special register used to access global data. So I believe this _gp
symbol is more likely related to some toolchain internals rather than
to pcre.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
