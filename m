From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Aug 2017 17:42:51 +0200
Subject: [Buildroot] [PATCH] toolchain/internal: not aailable for a few
 mips cores
In-Reply-To: <ba40526d-508b-c2bb-64da-8f926429e8a0@mind.be>
References: <20170817202647.26738-1-yann.morin.1998@free.fr>
 <ba40526d-508b-c2bb-64da-8f926429e8a0@mind.be>
Message-ID: <20170818154251.GA3426@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-08-18 00:20 +0200, Arnout Vandecappelle spake thusly:
> On 17-08-17 22:26, Yann E. MORIN wrote:
> > Commit 1b974425 (MIPS: add support for M6201 cores) xplained that the
> > new core was not supported by upstream gcc, and as of gcc-8-trunk that's
> > stil lthe case.
> > 
> > Ditto for 3cfbeb83 (MIPS: add support for P6600 cores).
> > 
> > This means that we currently elect to build an internal tolchain for
> > those cores, yet we have no suitable gcc version.
> > 
> > Disable the internal backend in this case.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  package/gcc/Config.in.host | 7 +------
> >  toolchain/Config.in        | 2 ++
> >  2 files changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> > index 485755a15d..77ea8ff374 100644
> > --- a/package/gcc/Config.in.host
> > +++ b/package/gcc/Config.in.host
> > @@ -50,8 +50,7 @@ config BR2_GCC_VERSION_5_X
> >  	# musl ppc64 unsupported
> >  	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
> >  	# Unsupported MIPS cores
> > -	depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && \
> > -		!BR2_mips_m6250 && !BR2_mips_i6400 && !BR2_mips_p6600
> > +	depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && !BR2_mips_i6400
> 
>  I wouldn't remove the conditions here. If these cores are supported in GCC 8,
> then we would have to re-introduce them...

I disagree:

  - for the existing exclusions, there is no corresponding exclusions in
    the gcc choice, so we'll have to add them should a newer gcc
    supports them;

  - and for those, it will actually be easier: we'll have this commit to
    just revert. And not evem that, because my ultimate goal is that
    each architecture defines what minimum gcc version it requires:
        https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/aarch64-cpus
    with the change to gcc and ARM:
        https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/aarch64-cpus&id=95fec656d85fbed488cc666848ecacf011850a93
        https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/aarch64-cpus&id=18d10caf174129479e47df3c04d799e285870db3

But until then, this patch is still needed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
