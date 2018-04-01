From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Apr 2018 19:53:57 +0200
Subject: [Buildroot] [v3 12/13] download: add flock call before
 dl-wrapper
In-Reply-To: <20180401140951.GE2613@scaer>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
 <20180331142407.9522-12-maxime.hadjinlian@gmail.com>
 <20180401140951.GE2613@scaer>
Message-ID: <20180401175357.GJ2613@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2018-04-01 16:09 +0200, Yann E. MORIN spake thusly:
> On 2018-03-31 16:24 +0200, Maxime Hadjinlian spake thusly:
> > In order to introduce the cache mechanisms, we need to have a lock on
> > the $(LIBFOO_DL_DIR), otherwise it would be impossible to do parallel
> > download (a shared DL_DIR for two buildroot instances).
> > 
> > To make sure the directory exists, the mkdir call has been removed from
> > the dl-wrapper and put in the infrastructure.
> > 
> > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> > ---
> >  package/pkg-download.mk     | 4 +++-
> >  support/download/dl-wrapper | 1 -
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> > index 23f3403098..dff52007e6 100644
> > --- a/package/pkg-download.mk
> > +++ b/package/pkg-download.mk
> > @@ -19,6 +19,7 @@ SSH := $(call qstrip,$(BR2_SSH))
> >  export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
> >  
> >  DL_WRAPPER = support/download/dl-wrapper
> > +FLOCK = flock $($(PKG)_DL_DIR)/
> 
> This means that two downloads running in two concurrent Buildroot
> builds, doing a wget from different tarballs from the same package
> (eg. foo-1.tar and foo-2.tar) will not be able to complete in parallel,
> and will be sequential, while we curently can do that, and it *is* safe
> to do so.
> 
> We have a few objects we can flock, in  a generic manner:
> 
>   - the .stamp_downloaded stanp file: this would allow concurrent
>     Buildroot builds of wget downloads, but would not protect against
>     concurrent git clones;
> 
>   - the $($(PKG)_DL_DIR): would protect against concurrent git clones,
>     but forbids concurrent wget of the same package;
> 
> And a third and fourth further options:
> 
>   - $($(PKG)_DL_DIR)/git: which would be the best of both world, but
>     would need to be handled by the dl-wrapper itself when it calls
>     the git backend (or hg, svn, cvs... when we later support those).

After a lie discussion, we've in fact decided to later go that route,
because it is not so complex to do afterall:

  - in pkg-generic.mk: based on the _SITE_METHOD, set:
        $(PKG)_SITE_LOCK = YES

  - in pkg-download.mk, in macro DOWNLOAD, when calling dl-wrapper,
    add something like:
        $(if $($(PKG)_SITE_LOCK),-L $($PKG)_DL_DIR))

  - in dl-wrapper, accept a new option, -L with as argument the resource
    to lock, in which case dl-wrapper would lock it when calling the
    wrapper, otherwise it would directly call the wrapper.

But as also said live, this can be an improvement for *after* this
series is applied.

Regards,
Yann E. MORIN.

>   - push the flock even further down into each individual backends,
>     which would each be responsible to flock only the individual
>     commands that require locking.
> 
> For the fourth solution, we may be able to shoe-horn the flock call into
> the internals _XXX wrappers (e.g. the _git() function of the git
> backend).
> 
> TBH, I believe that what you propsoe is Good Enough (TM), because the
> third, optimised solution, is just getting a bit more complex, as there
> is no resource (file or directory) that we can flock, besides the
> package's own download dir. The fourth is pusshing into too fine-grained
> for being entirely reliable...
> 
> So, I'm happy that we go with your proposed patch. But maybe expand the
> commit log to explain a bit that restriction.
> 
> Regards,
> Yann E. MORIN.
> 
> >  # DL_DIR may have been set already from the environment
> >  ifeq ($(origin DL_DIR),undefined)
> > @@ -91,7 +92,8 @@ endif
> >  
> >  define DOWNLOAD
> >  	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),BR_NO_CHECK_HASH_FOR=$(notdir $(1));) \
> > -	$(EXTRA_ENV) $(DL_WRAPPER) \
> > +	$(Q)mkdir -p $($(PKG)_DL_DIR)/
> > +	$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
> >  		-c $($(PKG)_DL_VERSION) \
> >  		-f $(notdir $(1)) \
> >  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> > diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> > index 49caf3717b..67e9742767 100755
> > --- a/support/download/dl-wrapper
> > +++ b/support/download/dl-wrapper
> > @@ -50,7 +50,6 @@ main() {
> >      if [ -z "${output}" ]; then
> >          error "no output specified, use -o\n"
> >      fi
> > -    mkdir -p "$(dirname "${output}")"
> >  
> >      # If the output file already exists and:
> >      # - there's no .hash file: do not download it again and exit promptly
> > -- 
> > 2.16.2
> > 
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
