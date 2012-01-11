From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 11 Jan 2012 16:23:16 +0000
Subject: [Buildroot] [PATCH] Static build changes
In-Reply-To: <201201110801.36481.arnout@mind.be>
References: <F9C551623D2CBB4C9488801D14F864C60E4498@ex-mb1.corp.adtran.com>
 <201201090812.57114.arnout@mind.be>
 <F9C551623D2CBB4C9488801D14F864C60EF684@ex-mb1.corp.adtran.com>
 <201201110801.36481.arnout@mind.be>
Message-ID: <F9C551623D2CBB4C9488801D14F864C60F039F@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  The thing is, everything that you put in the e-mail will end up in
> the
> git commit as well.  To add comments in the mail that should not be
> in
> the commit message, add something like
> ---
> additional comment
> ---
> between the commit message (first part) and the first diff.

I'll try to keep this in mind.

> 
> > > > @@ -7,4 +7,8 @@
> > > >  ETHTOOL_VERSION = 3.0
> > > >  ETHTOOL_SITE =
> $(BR2_KERNEL_MIRROR)/software/network/ethtool/
> > > >
> > > > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > > > +ETHTOOL_CONF_ENV += LDFLAGS+=-static
> > > > +endif
> > >
> > >  Wouldn't it be more convenient if this was added globally to
> > > TARGET_LDFLAGS in Makefile.in?  The -static is anyway just a
> hint,
> > > it doesn't force the linker to link statically.
> >
> > To quote Bill Cosby:  "I hadn't thought of that."
> 
>  That's why we have reviews :-)

Right on.  That's the same thing that Peter said in an
e-mail that came out after I started working on this reply.

So, to that end, I guess I should scrap this patch, then
attempt a new on for this later.  The problem is, I don't
have time to revisit this right now (big push for a Q1/Q2
release).  If I get a "round toit", perhaps I'll be able to
attempt such a patch later next month.

>  GNU autoconf will give a warning about unsupported options.  One
> of the
> global options is actually unsupported for most platforms:
> --disable-gtk-doc.
> 
>  If some package has a custom configure script that errors out, it
> should override $(PKG)_CONFIGURE_CMDS.

Okay, so, I've exposed an error in the ncurses.mk file.
For me to make ncurses "work" the way I want it to, I have
to patch the file in this manner.  Do I have to correct
_all_ errors with any given Makefile when patching towards a
specific goal in order to satisfy the hive?  If that is the
case, I then have the question of Who decides what is
correct and what is broken for any given patch that I may need
to create?

> > So, the original design I had done was to add top-level config
> option
> > under PREFER_STATIC as BUILD_ONLY_STATIC.  I guessed that this
> would not
> > be well received by the hive.  Perhaps that would have been a
> better
> > thing to do.  PREFER_STATIC seems to be misleading (based upon my
> > expectations) given that if you _PREFER_ to use static libraries,
> then
> > shouldn't the system ONLY USE static libraries and never install
> the
> > shared objects?  I mean, if I ask my contractor to use screws to
> build
> > something, and he uses nails, that isn't what I asked for.  But
> again,
> > perhaps I have the wrong expectations for PREFER_STATIC.
> 
>  I guess this is because some packages don't know how to build
> static
> libraries, or how to link with them.  Such packages would have to
> depend
> on !BUILD_ONLY_STATIC.  But I think that it is a lot of work to
> maintain
> that option, with little benefit.

Eh, I had about 30 lines of text to discuss, "little benefit", but
deleted those.  Got wrapped around the axel on that one.  It isn't
little to me, be essential.  I'll look (later, probably two months)
at putting this back in and putting the params in the top level
make files.  We'll discuss again then.  For now, I'll continue to
use my patch.  I concede and withdraw the patch.

Andy
