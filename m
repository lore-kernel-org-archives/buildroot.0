From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Jan 2012 12:08:57 +0100
Subject: [Buildroot] [PATCH] Static build changes
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C60F039F@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C60E4498@ex-mb1.corp.adtran.com>
 <201201110801.36481.arnout@mind.be>
 <F9C551623D2CBB4C9488801D14F864C60F039F@ex-mb1.corp.adtran.com>
Message-ID: <201201121208.57520.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 11 January 2012 17:23:16 ANDY KENNEDY wrote:
> So, to that end, I guess I should scrap this patch, then
> attempt a new on for this later.  The problem is, I don't
> have time to revisit this right now (big push for a Q1/Q2
> release).  If I get a "round toit", perhaps I'll be able to
> attempt such a patch later next month.

 Let this be an invitation for other volunteers to pick up the patch!

> >  GNU autoconf will give a warning about unsupported options.  One
> > of the
> > global options is actually unsupported for most platforms:
> > --disable-gtk-doc.
> > 
> >  If some package has a custom configure script that errors out, it
> > should override $(PKG)_CONFIGURE_CMDS.
> 
> Okay, so, I've exposed an error in the ncurses.mk file.
> For me to make ncurses "work" the way I want it to, I have
> to patch the file in this manner.  Do I have to correct
> _all_ errors with any given Makefile when patching towards a
> specific goal in order to satisfy the hive?  If that is the
> case, I then have the question of Who decides what is
> correct and what is broken for any given patch that I may need
> to create?

 No, you misunderstood me: I didn't mean that you should override
$(PKG)_CONFIGURE_CMDS; I meant it as general advise for packagers.

 I you patch an existing package, like you do, it is nice if you can
fix some brokenness, but it is not required.

 In the case of ncurses, the simplest is to remove the redundant configure
options from ncurses.mk.

 In the case of htop, if the default solution doesn't work for whatever
reason, then adding something specific is fine of course.  [I quickly
tried it and just adding -static to LDFLAGS isn't sufficient for htop.]


> > > So, the original design I had done was to add top-level config
> > option
> > > under PREFER_STATIC as BUILD_ONLY_STATIC.  I guessed that this
> > would not
> > > be well received by the hive.  Perhaps that would have been a
> > better
> > > thing to do.  PREFER_STATIC seems to be misleading (based upon my
> > > expectations) given that if you _PREFER_ to use static libraries,
> > then
> > > shouldn't the system ONLY USE static libraries and never install
> > the
> > > shared objects?  I mean, if I ask my contractor to use screws to
> > build
> > > something, and he uses nails, that isn't what I asked for.  But
> > again,
> > > perhaps I have the wrong expectations for PREFER_STATIC.
> > 
> >  I guess this is because some packages don't know how to build
> > static
> > libraries, or how to link with them.  Such packages would have to
> > depend
> > on !BUILD_ONLY_STATIC.  But I think that it is a lot of work to
> > maintain
> > that option, with little benefit.
> 
> Eh, I had about 30 lines of text to discuss, "little benefit", but
> deleted those.  Got wrapped around the axel on that one.  It isn't
> little to me, be essential.  I'll look (later, probably two months)
> at putting this back in and putting the params in the top level
> make files.  We'll discuss again then.  For now, I'll continue to
> use my patch.  I concede and withdraw the patch.

 If there is a BUILD_ONLY_STATIC option that really makes sure that
no dynamic libraries can be used, then the benefit is clear.  But I'm
afraid that there is a big risk that some programs are accidentally
linked dynamically after all, and that you create a rootfs that doesn't
work.  In that case, the benefit compared to PREFER_STATIC is pretty
small IMO.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
