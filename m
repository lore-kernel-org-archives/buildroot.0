From: Ignacy =?iso-8859-2?Q?Gaw=EAdzki?= <ignacy.gawedzki@green-communications.fr>
Date: Mon, 6 Feb 2017 20:37:29 +0100
Subject: [Buildroot] [PATCH] Don't disable dependency tracking if using
 <pkg>_OVERRIDE_SRCDIR.
In-Reply-To: <2a135f21-ffe1-06b8-37d3-e78f7a51798f@gmail.com>
References: <20170201135310.3ghqvpqww25jfzm2@zenon.in.qult.net>
 <2a135f21-ffe1-06b8-37d3-e78f7a51798f@gmail.com>
Message-ID: <20170206193729.i3epqqqekvlgiime@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 06, 2017 at 07:39:00PM +0100, thus spake Romain Naour:
> Hi Ignacy,
> 
> Le 01/02/2017 ? 14:53, Ignacy Gaw?dzki a ?crit :
> > Include the --disable-dependency-tracking option in
> > <pkg>_CONFIGURE_CMDS only on the condition that <pkg>_OVERRIDE_SRCDIR
> > is empty.  Dependency tracking is very welcome while developing in
> > order to properly rebuild when calling make <pkg>-rebuild for
> > instance.
> > 
> > Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> > ---
> >  package/pkg-autotools.mk | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> > index f7b8488..e8579f4 100644
> > --- a/package/pkg-autotools.mk
> > +++ b/package/pkg-autotools.mk
> > @@ -199,7 +199,8 @@ define $(2)_CONFIGURE_CMDS
> >  		--disable-documentation \
> >  		--with-xmlto=no \
> >  		--with-fop=no \
> > -		--disable-dependency-tracking \
> > +		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),, \
> > +		   --disable-dependency-tracking) \
> >  		--enable-ipv6 \
> >  		$$(DISABLE_NLS) \
> >  		$$(SHARED_STATIC_LIBS_OPTS) \
> > @@ -232,7 +233,8 @@ define $(2)_CONFIGURE_CMDS
> >  		--disable-debug \
> >  		--with-xmlto=no \
> >  		--with-fop=no \
> > -		--disable-dependency-tracking \
> > +		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),, \
> > +		   --disable-dependency-tracking) \
> 
> You're likely working on the target variant, so probably you can let the
> dependency tracking enabled for the host?

Dependency tracking was initially *disabled* for both target and host.
I suppose that <pkg>_OVERRIDE_SRCDIR works for both target and host,
so I don't see why we should leave it disabled for one and not the
other.

Regards,

Ignacy

-- 
Ignacy Gaw?dzki
R&D Engineer
Green Communications
