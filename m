From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Apr 2018 16:37:55 +0200
Subject: [Buildroot] [git commit] Config.in: add -Ofast option
In-Reply-To: <3fafe5de-1c7b-801c-9c14-291ebcfdc264@microchip.com>
References: <20180326201918.157AC83C5E@busybox.osuosl.org>
 <3fafe5de-1c7b-801c-9c14-291ebcfdc264@microchip.com>
Message-ID: <20180407143755.GB2341@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joshua, All,

On 2018-04-05 14:46 -0700, Joshua Henderson spake thusly:
> On 03/26/2018 01:19 PM, Thomas Petazzoni wrote:
> > commit: https://git.buildroot.net/buildroot/commit/?id=ed6a7e18af8f4dfddee6e6b144f20dfaf6926315
> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> > 
> > -Ofast (introduced in GCC 4.6) It combines the existing optimization level -O3
> > with options that can affect standards compliance but result in better optimized
> > code. For example, -Ofast enables -ffast-math.
> > 
> > Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> >  Config.in           | 11 +++++++++++
> >  package/Makefile.in |  3 +++
> >  2 files changed, 14 insertions(+)
> > 
> > diff --git a/Config.in b/Config.in
> > index 0002df5176..037ea2265b 100644
> > --- a/Config.in
> > +++ b/Config.in
> > @@ -527,6 +527,17 @@ config BR2_OPTIMIZE_S
> >  	  -ftree-vect-loop-version
> >  	  This is the default.
> >  
> > +config BR2_OPTIMIZE_FAST
> > +	bool "optimize for fast"
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
> > +	help
> > +	  Optimize for fast. Disregard strict standards
> > +	  compliance. -Ofast enables all -O3 optimizations. It also
> > +	  enables optimizations that are not valid for all
> > +	  standard-compliant programs. It turns on -ffast-math and the
> > +	  Fortran-specific -fstack-arrays, unless -fmax-stack-var-size
> > +	  is specified, and -fno-protect-parens.
> > +
> >  endchoice
> For reference, I just found an unfriendly package with this option.
> sqlite3.c: In function ?sqlite3IsNaN?:
> sqlite3.c:28554:3: error: #error SQLite will not work correctly with the -ffast-math option of GCC.
>  # error SQLite will not work correctly with the -ffast-math option of GCC.
>    ^
> Makefile:541: recipe for target 'sqlite3.lo' failed
> 
> sqlite3 refuses to be built with -ffast-math (a side effect of -Ofast) when it
> falls back to implementing its own isnan() function.  From what I can see,
> SQLITE_HAVE_ISNAN can be defined [1] to make it use the system library isnan().
> But, how to tell if the system library supports a proper isnan() seems to open
> up a whole new can of worms.  Thoughts?

Assuming those packages are not too many, I'd say we go to overriding
the CFLAGS for those, with code something like:

    SQLITE_CFLAGS = $(subst -Ofast,-O3,$(TARGET_CFLAGS))

If it turns out that the number of broken packages is too high, then we
can come up with an alternate solution...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
