From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 22:02:37 +0200
Subject: [Buildroot] TestIso9660GrubExternal and TestIso9660GrubInternal
	failing
In-Reply-To: <5974e7554c7c_30a1600b705951e@ultri3.mail>
References: <20170723092643.GE2917@scaer>
 <5974e7554c7c_30a1600b705951e@ultri3.mail>
Message-ID: <20170723200237.GJ26998@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-07-23 15:13 -0300, Ricardo Martincoski spake thusly:
> On Sun, Jul 23, 2017 at 06:26 AM, Yann E. MORIN wrote:
> > On 2017-07-23 09:58 +0200, Thomas Petazzoni spake thusly:
> >> On Sun, 23 Jul 2017 00:50:16 +0200, Yann E. MORIN wrote:
> >> > > The patches fixing them are here:
> >> > > 
> >> > >   http://patchwork.ozlabs.org/patch/783135/
> >> > >   http://patchwork.ozlabs.org/patch/783137/
> >> > >   http://patchwork.ozlabs.org/patch/783136/
> >> > > 
> >> > > and nobody reviews them.  
> >> > 
> >> > I gave them a spin here, and they indeed fix the build, but the tests
> >> > are still broken because qemu can't boot the resulting system...
> >> > 
> >> > I'll investigate that tomorrow...
> >> 
> >> Hum, weird, because I'm pretty sure I tested the test cases with those
> >> patches. I'll test again, maybe I missed something.
> > 
> > So, to rule out any sleep-deprivation issue while testign yesterday
> > evening, I re-spawn the tests here this morning, and they still do not
> > run.
> > 
> > Maybe it is my qemu version?
> > 
> > I'll try and bisect them between July the 1st and now.
> 
> Since you are investigating this, let me provide some data I hope is useful.

Thanks for the feedback! :-)

So I was not even capable of running it on a snashot of July (at the
time the patches were made). It already failed to boot.

> My local computer has:
> binutils 2.26.1
> qemu 2.5.0

I have Ubuntu 17.04:
    GNU ar (GNU Binutils for Ubuntu) 2.28
    QEMU emulator version 2.8.0(Debian 1:2.8+dfsg-3ubuntu2.3)

> Using my local computer the tests TestIso9660GrubExternal and
> TestIso9660GrubInternal always pass, in current master and also with the 3 grub
> patches applied.

It is ex[ected that the build suceeds without the patches on your
machine, because it is binutils 2.28 that broke the build.

However, that you were ablt to run is interesting. I'll spawn that on my
server, which is a 16.04 as well.

> Using the image buildroot/base I can reproduce the problems:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/23825707
> GRUB requires a working absolute objcopy; upgrade your binutils
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/23831270
> ==> System does not boot

So, it would look like it is either:
  - a qemu issue,
  - a binutils regression we have not identified (maybe another Debian
    patch is required?),
  - a grub regression.

> If you need me to check versions for other tools in my local computer (Ubuntu
> 16.04.2, not plain vanilla), feel free to ask.

I plan on doign those tests;

  - build on 16.04, run on 16.04
  - build on 16.04, run on 17.04
  - build on 17.04, run on 16.04

This should identify if qemu is the culprit (the second would not work),
or if binutils is the culprit (the third would not work).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
