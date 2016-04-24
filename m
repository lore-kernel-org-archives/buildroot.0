From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Sun, 24 Apr 2016 15:15:16 +0000
Subject: [Buildroot] [PATCH v5] package/radlib: new package
In-Reply-To: <57195C19.3070307@mind.be>
References: <1460563603-3748-1-git-send-email-ray.kinsella@intel.com>
 <1460563603-3748-2-git-send-email-ray.kinsella@intel.com>
 <57195C19.3070307@mind.be>
Message-ID: <1461510916.5247.21.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Arnout, 

See inline. 

On Fri, 2016-04-22 at 01:02 +0200, Arnout Vandecappelle wrote:
>   Please generate patches with the -N option; the 1/3 becomes invalid
> when a 4th 
> patch is added, or when some of the patches are accepted upstream.


ok then, so it should be a git format-patch -N. I see what you mean,
you may want to remove the patches independently as they get
upstreamed, so that would muck up the numbering. 

> Given 
> upstream's lack of updates the latter isn't very likely :-) Did you
> try to 
> submit the patches upstream?

Haven't submitted them upstream yet, on my to do list. 

>   Since the AM_CONDITIONAL is defined just above, it's better to use
> AM_COND_IF:
> 
> AM_COND_IF([PGRESQL],
>    PKG_CHECK_MODULES([POSTGRESQL], [libpq])
> )

ok, thanks for the tip.

> 
> (untested, of course).
> 
> > ++  PKG_CHECK_MODULES([POSTGRESQL], [libpq])
> > ++fi
> > +
> > + AC_ARG_ENABLE(sqlite,
> > + [  --enable-sqlite                include radlib sqlite database
> > support],
> > +@@ -32,6 +35,9 @@ AC_ARG_ENABLE(sqlite,
> > +   *) sqlite=false ;;
> > + esac],[sqlite=false])
> > + AM_CONDITIONAL(SQLITE, test x$sqlite = xtrue)
> > ++if test x$sqlite = xtrue; then
> 
>   Same here.

ok

> 
>   Same, use AM_COND_IF

ok

>   I guess there should be an error in the else branch?

makes sense.

>   I think this should be the first patch; our autoreconf will not be
> happy 
> without subdir-objects.

autoreconf does complain without the subdir-objects. The removal of the
CROSS_COMPILE in the same patch is important as the linker breaks
without it. It won't even get to linking stage if it can't find the
various database libraries fixed in the two previous patches.

Suggest a new first patch to fix sudir-objects (patch number 4.), but
then leave the other patches as they are. So the flow would be.

1. Fix subdir-objects
2. Fix sqlite + postgresql
3. Fix mysql
4. Fix the linker (CROSS_COMPILE).

What do you think?

+
> > + AM_INIT_AUTOMAKE([radlib],[2.12.0])
> 
>   Shouldn't this one be removed?
yup

>   Lines in help text should be wrapped at 72 columns, where tab
> counts for 8.

ok - I will investigate

>   I'm not really happy with this choice, I'd prefer an automatic
> selection. But 
> it's true, if both mysql and postgresql are selected it's hard to
> decide which 
> one should be used...

sent a seperate email on this.
mysql and postgresql are mutually exclusive.
sqlite lite can be safely enabled/disable depending on
BR2_PACKAGE_SQLITE.

> 
>   Err, I see sha1 and md5 there, but not sha256. So you should take
> the md5 and 
> sha1 from sourceforge and add the locally-calculated sha256.

ok 


> > +sha256 
> >  82b98bb5e08a500dea1e4252843b9c772fa1fb67ac8ab89ed64abdd5e22eca66 
> >  radlib-2.12.0.tar.gz
> RADLIB_DEPENDENCIES += sqlite
> else
> RADLIB_CONF_OPTS += --disable-sqlite

ok

> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_RADLIB_MYSQL),y)
> > +RADLIB_CONF_ENV=ac_cv_path_MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/my
> > sql_config"
> > +RADLIB_CONF_OPTS += --enable-mysql
> 
>   Same here

ok

> 
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_RADLIB_POSTGRESQL),y)
> > +RADLIB_CONF_OPTS += --enable-pgresql
> 
>   Same here

ok

Thanks,

Ray K
