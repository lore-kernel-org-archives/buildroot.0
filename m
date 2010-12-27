From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 27 Dec 2010 12:15:29 -0600
Subject: [Buildroot] oprofile "requires" gmp???
In-Reply-To: <20101224090517.0c935c19@surf>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com><20101223082740.3a8e44c4@surf><9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com>
	<20101224090517.0c935c19@surf>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA2689B@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Andy,
> 
> (Could you please avoid top-posting ? Thanks!)

I could try, though, if the brain is in the wrong mode, probably not ;).

> On Thu, 23 Dec 2010 13:03:15 -0600
> ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wrote:
> 
> > Okay, I've done some tracking and have found the issue, but I don't
> know
> > Mips asm that great (only 2 months into mips).
> >
> > The code that it pukes at for building gmp for the native toolchain
> is:
> >
> > #define umul_ppmm(w1, w0, u, v) \
> > __asm__ ("multu %2,%3" : "=l" (w0), "=h" (w1) : "d" (u), "d" (v))
> >
> > (defined in longlong.h under the root of gmp-4.2.4)
> >
> > The error given is:
> > dive_1.c:114:4: error: impossible constraint in 'asm'
> > dive_1.c:114 is: umul_ppmm (h, dummy, l, divisor);
> 
> Hum, maybe this has been fixed in more recent versions of gmp. Could
> you try Gustavoz's toolchain-rework branch ? It bumps gmp to version
> 5.0.1, it's really the first thing to test before trying to fix an old
> gmp version.
> 
> Gustavo's repository is at git://repo.or.cz/buildroot-gz.git, the
> branch is toolchain-rework. Or you can get the individual patches at
>
http://lists.busybox.net/pipermail/buildroot/2010-December/039804.html.

After doing a:
git clone git://repo.or.cz/buildroot-gz.git

I get worse results.  There are no dependencies for gmp now in the
toolchain for the target (IIRC, the previous version does select gmp
when target tool chain is selected -- though, that was last Thursday and
minus christmas eve, I've slept since then).  The toolchain is still not
required for building oprofile, though it does attempt to build it.

Did I perhaps use git incorrectly to not get the correct changes you
mentioned?  The gmp version was still 4.2.4 and I could find no place in
the config to change it to 5.0.1.

Thanks,
Andy
