From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2017 13:33:26 +0100
Subject: [Buildroot] [PATCH] infra/ccache: avoid color diagnostics with
 GCC older than v4.9
In-Reply-To: <20170212131443.155d5a7d@free-electrons.com>
References: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
 <20170211163845.71459758@free-electrons.com>
 <20170212100800.GC4533@free.fr>
 <20170212131443.155d5a7d@free-electrons.com>
Message-ID: <20170212123326.GA11105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-12 13:14 +0100, Thomas Petazzoni spake thusly:
> On Sun, 12 Feb 2017 11:08:00 +0100, Yann E. MORIN wrote:
> 
> > > Another option would be to adjust this in ccache itself at compile time
> > > (i.e when ccache gets built) rather than having to pass this additional
> > > GCC_COLORS variable in the environment when building things. This way
> > > we would be absolutely sure -fdiagnostics-color will never be passed.
> > > Hence why I'd like the feedback from other developers.  
> > 
> > But there is no config option to disable that in ccache. The behaviour
> > is hard-coded; we would need a patch to disable that.
> 
> We could sed it like we already do in package/ccache/ccache.mk for
> other things.

Something like, maybe:

    diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
    index f174a5d..35d7a7b 100644
    --- a/package/ccache/ccache.mk
    +++ b/package/ccache/ccache.mk
    @@ -31,6 +31,7 @@ HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
     define HOST_CCACHE_PATCH_CONFIGURATION
     	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
     	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/conf.c
    +	sed -i  '/if (getenv("GCC_COLORS")/,+4d' $(@D)/ccache.c
     endef
     
     HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION

Or would we want it to be conditional on gcc < 4.9? In anycase, I think
overridign the environment variable is much easier...

> > And we might need that for the host as well, no?
> > 
> >     ifeq ($(BR2_HOST_GCC_AT_LEAST_4_9),)
> >     HOST_MAKE_ENV += GCC_COLORS=""
> >     endif
> Check Carlos original patch, it was there.

I didn't look; I only saw your own reply...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
