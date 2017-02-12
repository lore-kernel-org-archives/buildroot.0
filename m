From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2017 14:08:03 +0100
Subject: [Buildroot] [PATCH] infra/ccache: avoid color diagnostics with
 GCC older than v4.9
In-Reply-To: <20170212135914.4a4a0fab@free-electrons.com>
References: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
 <20170211163845.71459758@free-electrons.com>
 <20170212100800.GC4533@free.fr>
 <20170212131443.155d5a7d@free-electrons.com>
 <20170212123326.GA11105@free.fr>
 <20170212135914.4a4a0fab@free-electrons.com>
Message-ID: <20170212130803.GC11105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-12 13:59 +0100, Thomas Petazzoni spake thusly:
> On Sun, 12 Feb 2017 13:33:26 +0100, Yann E. MORIN wrote:
> 
> > Something like, maybe:
> > 
> >     diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> >     index f174a5d..35d7a7b 100644
> >     --- a/package/ccache/ccache.mk
> >     +++ b/package/ccache/ccache.mk
> >     @@ -31,6 +31,7 @@ HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
> >      define HOST_CCACHE_PATCH_CONFIGURATION
> >      	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
> >      	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/conf.c
> >     +	sed -i  '/if (getenv("GCC_COLORS")/,+4d' $(@D)/ccache.c
> >      endef
> >      
> >      HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
> > 
> > Or would we want it to be conditional on gcc < 4.9?
> 
> Yes, it should be conditional on gcc < 4.9.
> 
> > In anycase, I think overridign the environment variable is much
> > easier...
> 
> Right, *but* if we forget to pass TARGET_MAKE_ENV or HOST_MAKE_ENV
> somewhere, then we will get a build failure. As a trivial example,
> package/makedevs/makedevs.mk directly calls $(HOSTCC), which uses
> ccache, but does not use $(HOST_MAKE_ENV). So that one would not pass
> GCC_COLORS="", and would therefore fail to build on machines with gcc <
> 4.9.

But we do a single build of ccache which gets used for both the target
and host compiler. So if we patch ccache, we have to do if any of them
if older than 4.9.

Which is not impossible, by far, but means that an older host gcc will
disable colouring of the target gcc output, and vice-versa.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
