From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 12 Jul 2013 09:47:49 +0300
Subject: [Buildroot] [PATCH] Raspberry Pi - WiringPi Library Package
In-Reply-To: <20130712043056.GA9929@enterprise.localdomain>
References: <20130711053359.GC4338@tarshish>
 <20130711060008.GA5570@enterprise.localdomain>
 <20130711060419.GD4338@tarshish>
 <20130711063845.GA7655@enterprise.localdomain>
 <51DE61E4.7030400@googlemail.com>
 <20130711175530.GA16506@enterprise.localdomain>
 <20130711180603.GG4338@tarshish>
 <20130711182258.GA17081@enterprise.localdomain>
 <20130712032430.GI4338@tarshish>
 <20130712043056.GA9929@enterprise.localdomain>
Message-ID: <20130712064749.GJ4338@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillermo,
On Thu, Jul 11, 2013 at 09:30:56PM -0700, Guillermo Amaral wrote:
> On Fri, Jul 12, 2013 at 06:24:30AM +0300, Baruch Siach wrote:
> > On Thu, Jul 11, 2013 at 11:22:58AM -0700, Guillermo Amaral wrote:
> > > On Thu, Jul 11, 2013 at 09:06:03PM +0300, Baruch Siach wrote:
> > > > On Thu, Jul 11, 2013 at 10:55:30AM -0700, Guillermo Amaral wrote:
> > > > > The Raspberry Pi doesn't go down to 2.6.y, the oldest supported version is
> > > > > 3.2.27. :)
> > > > 
> > > > If this is the case, then there is no reason to make O_CLOEXEC a no-op.
> > > > 
> > > > > So there should be no need to do the kernel check, since the package is RPi
> > > > > specific.
> > > > > 
> > > > > The problem here was that O_CLOEXEC was not defined with the default uclibc
> > > > > and older versions of glibc.
> > > > 
> > > > The O_CLOEXEC define comes with the kernel headers used to build the 
> > > > toolchain, not from the C library.
> > > 
> > > I didn't say it didn't. I'll clarify, if __USE_GNU and/or __USE_XOPEN2K8 don't
> > > get defined at some point O_CLOEXEC is not getting defined. My guess is that
> > > they get defined by *libc, feel free to correct me if I'm wrong.
> > 
> > The code below builds just fine on my machine:
> > 
> > #include <sys/types.h>
> > #include <sys/stat.h>
> > #include <fcntl.h>
> > 
> > void func(void) { open("f", O_RDWR | O_CLOEXEC); }
> 
> Congratulations, I'm very proud. Have a beer on me! (B)
> 
> G
> 
> P.S.
> 
> $ host/usr/bin/arm-linux-gcc -c x.c
> x.c: In function ?func?:
> x.c:5:38: error: ?O_CLOEXEC? undeclared (first use in this function)
> x.c:5:38: note: each undeclared identifier is reported only once for each
> function it appears in
> 
> $ cat x.c
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <fcntl.h>
> 
> void func(void) { open("f", O_RDWR | O_CLOEXEC); }

And does defining __USE_GNU and/or __USE_XOPEN2K8 improves the situation?

My point is that the existence of O_CLOEXEC at build time is determined by the 
version of the kernel headers in the toolchain. At run time, O_CLOEXEC is 
effective when the running kernel supports it. The toolchain you are using is 
based on on old kernel headers, so you need to define O_CLOEXEC yourself, 
which is fine. The kernel running on a Raspberry Pi should always be recent 
enough to support O_CLOEXEC. So the right solution, in my opinion, is to 
define O_CLOEXEC to its real value.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
