From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Apr 2021 22:23:53 +0200
Subject: [Buildroot] [PATCH 1/4] package/{skalibs, execline, s6,
 s6-dns}: change prefix and shared options
In-Reply-To: <df3d4c00-dd75-73f5-ed4a-74d53b9e3467@mind.be>
References: <HbmuNdRmOn2PdMjzu0i70kXEVtJ7gzFTC74uRm0Le50@cp3-web-012.plabs.ch>
 <df3d4c00-dd75-73f5-ed4a-74d53b9e3467@mind.be>
Message-ID: <20210407202353.GA359705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Dick, All,

On 2021-04-07 21:02 +0200, Arnout Vandecappelle spake thusly:
> On 07/04/2021 00:47, Dick Olsson via buildroot wrote:
> > The s6 suite of tools are predominantly used as an init system and for
> > process supervision. It is therefore preferable for these tools to be
> > installed with the default prefix / (as opposed to /usr).

Since one may use s6 as an init system. and now that we have had the s6
family of packages for a while, would it make sense to promote them to
an init system supported by Buildroot?

There was some discussion about that in the past, but I am not sure I
remember the rationale for not making s6 a full-fledged init system,
like we have for busybox, system V, openrc, or systemd.

> > diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
> > index f92859ff26..fe042604c2 100644
> > --- a/package/skalibs/skalibs.mk
> > +++ b/package/skalibs/skalibs.mk
> > @@ -10,12 +10,24 @@ SKALIBS_LICENSE = ISC
> >  SKALIBS_LICENSE_FILES = COPYING
> >  SKALIBS_INSTALL_STAGING = YES
> >  
> > +SKALIBS_DEFAULT_PATH = $(call qstrip,$(BR2_SYSTEM_DEFAULT_PATH))
> >  SKALIBS_CONF_OPTS = \
> > -	--prefix=/usr \
> > -	--with-default-path=/sbin:/usr/sbin:/bin:/usr/bin \
> > +	--prefix=/ \
> > +	--libexecdir=/libexec \
> > +	--with-default-path=$(SKALIBS_DEFAULT_PATH) \
> >  	--with-sysdep-devurandom=yes \
> >  	$(SHARED_STATIC_LIBS_OPTS)
> >  
> > +# This variable can be used by dependant packages.
> > +SHARED_SKALIBS_CONF_OPTS = \
> > +	--prefix=/ \
> > +	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
> > +	--with-include=$(STAGING_DIR)/include \
> > +	--with-dynlib=$(STAGING_DIR)/lib \
> > +	--with-lib=$(STAGING_DIR)/lib/skalibs \
> > +	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
> > +	$(SHARED_STATIC_LIBS_OPTS)
> > +
> 
>  Hm, I'm not sure I like this...

In the state, I too am not too fond of it. However...

>  The good is obviously that it allows you to change all skarnet packages in one
> fell swoop when that is needed.
> 
>  However, there are also some disadvantages.
> 
>  The main disadvantage is that it's harder for people to understand how e.g. the
> execline package is configured. When you look at the execline.mk file, you don't
> see what is the contents of the SHARED_SKALIBS_CONF_OPTS variable.
> 
>  Another disadvantage is that you may introduce a dependency on the order in
> which the different mk files are included. In this case it's fine because the
> variable is only used inside a rule, which is always expanded after all
> makefiles have been processed. But in general it's risky.
> 
>  If there is shared stuff, then I personally prefer to make sure that it is made
> clear by putting the packages that "belong together" in a subdirectory, and have
> the shared stuff in the .mk file of that subdirectory. freescale-imx is an
> example of that.

... *if* the ska-related packages would really benefit from having
shared variables, then we could look at it like we look at qt5, or as
Arnout mentions, like freescale stuff.

> However, we try to avoid subdirectories because it's annoying
> for other reasons, so those are conflicting forces...
> 
>  I'm not really sure about all this, so I put the other maintainers in Cc of
> this mail.

Neither am I; that's only 4 packages impacted, i.e. the library plus
three packages. I am not sure this-few packages deserve shared variables.

So, for me, that's a -1 on a [-2..2] scale...

Regards,
Yann E. MORIN.

>  If this change turns out to be acceptable, there's a small nitpick I'd like to
> add: since SHARED_SKALIBS_CONF_OPTS is not used by this package itself, you
> should put it at the very end of the file, after the generic-package.
> 
>  Oh, and please run check-package on it. SHARED_FOO_ is not allowed, it would
> have to be FOO_SHARED_.
> 
>  Oh, and also the refactoring should be in a separate commit from the change of
> /usr -> /
> 
> 
>  Regards,
>  Arnout
> 
> >  define SKALIBS_CONFIGURE_CMDS
> >  	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(SKALIBS_CONF_OPTS))
> >  endef

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
