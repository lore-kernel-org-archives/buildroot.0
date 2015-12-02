From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Dec 2015 23:16:02 +0100
Subject: [Buildroot] [PATCH 2/2 for 2015.11.x] package/gawk: do not use
 readeline ormpfr in host variant
In-Reply-To: <20151201232249.57de6d15@free-electrons.com>
References: <cover.1449008170.git.yann.morin.1998@free.fr>
 <9cd7b6bdd9790d4105829b278c0e6acba9f103f3.1449008170.git.yann.morin.1998@free.fr>
 <20151201232249.57de6d15@free-electrons.com>
Message-ID: <20151202221602.GK5773@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-01 23:22 +0100, Thomas Petazzoni spake thusly:
> On Tue,  1 Dec 2015 23:19:07 +0100, Yann E. MORIN wrote:
> > gawk has an optional dependency on mpfr (and thus gmp) and readline,
> > and will probe for them. If they are present, they are used; if they
> > are missing, that's not an error. mpfr (and gmp) is used for "BIGNUM"
> > support on gawk; readline is used by the gawk debugger.
> > 
> > However, mpfr (bringing gmp) are also host-packages in Buildroot, but in
> > the standard build order (i.e. a plain 'make'), they are built after
> > gawk. Ditto readline (from ncurses).
> > 
> > If the user has the development files for gmp and mpfr, then gawk is
> > linked to them. Ditto readline.
> > 
> > Now, further on in the build, we build gmp and mpfr (for gcci or guile),
> > so we install them in the host dir. Ditto readline (for gdb, ncurses
> > itself and a few other packages...)
> > 
> > But because we forcibly set an RPATH tag on all our host binaries, our
> > host gawk will now dynamically link with our versions, when it was in
> > fact built against the host ones.
> > 
> > This did not seem to cause any harm dso far, but is far from ideal.
> 
> dso -> so
> 
> > 
> > Since we do not really need BIGNUM or the debugger in our host gawk, we
> > just forcibly disable them and configure gawk without readline or mpfr
> > (there's no switch for gmp, but it;s not a direct dependency, it comes
> 
> it;s -> it's
> 
> > -# We don't have a host-busybox
> > +# We don't have a host-busybox, and we don't want to use mpfr
> 
> Is the comment really important, especially when it talks about mpfr
> but not about readline ?

Or just append 'or readline' to the comment.

Thanks!

Regards,
Yann E. MORIN.

> >  HOST_GAWK_DEPENDENCIES =
> >  
> > +HOST_GAWK_CONF_OPTS = --without-readline --without-mpfr
> > +
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
