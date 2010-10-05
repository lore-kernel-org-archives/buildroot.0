From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 05 Oct 2010 02:04:05 +0200
Subject: [Buildroot] Libtool work: a tentative summary
In-Reply-To: <AANLkTikJojJrmXr-vY-U1RY--SCaxMAxaabQ9X7=Ko5H@mail.gmail.com>
References: <20100928223652.6dc72083@surf>
	<1286112146.27944.349.camel@coalu.atr> <20101003162219.62ad7888@surf>
	<AANLkTi=KGLw6j0fYTp=ANV8zFGSrMH1xPv=pHM_BEtym@mail.gmail.com>
	<1286149654.27944.363.camel@coalu.atr>
	<AANLkTimOovYkLJg1GVSQzNCyW1h3ZkJ7zbJTH9-JDRLY@mail.gmail.com>
	<AANLkTikJojJrmXr-vY-U1RY--SCaxMAxaabQ9X7=Ko5H@mail.gmail.com>
Message-ID: <1286237045.27944.388.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, it didn't work.

As it's probably going to work just as well as what we have now, we
could integrate Martin's patches, thus avoiding to block others bumps.

Regards,

--
Lionel Landwerlin

Le lundi 04 octobre 2010 ? 10:09 +0200, Lionel Landwerlin a ?crit :
> The libtool script patch prevents libtool to give a direct path an
> host system shared lib path.
> The -L$(STAGING_DIR)... is added to the top of link arguments to
> prevent the linker to use the -L/usr/lib outputted by libtool.
> Finally the sed pass avoids libtool to open the .la files from host system.
> 
> So I'm afraid all those items are required even with libtool 2.4
> (without sysroot support).
> 
> From what I remember, we added the -L$(STAGING_DIR)/lib
> -L$(STAGING_DIR)/usr/lib for a libtool problem (commit
> efb1d8d3f40281645c178c150d992601c8042c1a).
> 
> I'm going to check with your libtool 2.4 sysroot setup.
> 
> Regards,
> 
> --
> Lionel Landwerlin
> 
> 
> On Mon, Oct 4, 2010 at 3:19 AM, Martin Banky <Martin.Banky@gmail.com> wrote:
> > Lionel,
> >      On the first three items, won't we always have to keep these until all
> > of the packages either support autoreconfiguring or start using libtool 2.4?
> > Like I said before, I ran into three packages that wouldn't autoreconfigure,
> > so they would still need the traditional approach. Also, I haven't had a
> > chance to really investigate this, but isn't
> > TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib also needed by
> > gentargets to link to the correct libraries?
> >      As for my setup, the only difference is, I compiled libtool with
> > --with-sysroot (no directory given), and I don't configure the package with
> > it. libtool gets the sysroot directory from gcc's sysroot, if none is
> > specified. Everything else is the same. What kind of problems did you
> > encounter? Was it just the problem with autoreconfiguring packages?
> >
> > Martin
> >
> > On Sun, Oct 3, 2010 at 4:47 PM, Lionel Landwerlin <llandwerlin@gmail.com>
> > wrote:
> >>
> >> As long as we keep the following things, we can bump to 2.2 or 2.4 :
> >>        * sed pass on .la files
> >>        * Add -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib to LDFLAGS
> >>        * patches for encountered libtool versions
> >>
> >> I always took the hypothesis that we wanted to get rid of the first 2,
> >> and wanted to keep the third only for special cases.
> >>
> >> I encountered problem with libtool 2.4 for several packages under the
> >> following conditions :
> >>        * run autoreconf on the package
> >>        * do not apply the libtool patch
> >>        * configure the package with --with-sysroot=$(STAGING_DIR) option
> >>
> >> Martin, did you have the same setup ?
> >>
> >> I guess we're back to the current situation if we don't pass the
> >> --with-sysroot option and we apply a libtool patch for the correct
> >> libtool version.
> >>
> >> Regards,
> >>
> >> --
> >> Lionel Landwerlin
> >>
> >> Le dimanche 03 octobre 2010 ? 15:36 -0700, Martin Banky a ?crit :
> >> > If you want to integrate my patches, I would like to submit a new set
> >> > of patches with some changes in preparation for libtool 2.4, mainly
> >> > with Makefile.autotools.in. I have it setup now to distinguish between
> >> > 1.5.x, 2.2.x, and 2.4. Also, in working on converting the packages to
> >> > either gentargets or autotargets, I've been noticing a lot of packages
> >> > have their own libtool patch. I would like to go through, and clean
> >> > them up. I have a question, why can't we upgrade to libtool 2.4? I've
> >> > been running it now since I first posted the heads up patch, and have
> >> > used it with the sysroot option turned on without any obvious issues.
> >> > If the sysroot option is an issue, we could turn it off for now and
> >> > use the libtool patches until we integrate the sysroot option
> >> > properly, right? The imagemagick patch set that I posted, was first
> >> > done with libtool 2.4 and autoreconfigure turned on. I wanted to make
> >> > sure that it would work properly in this configuration, in preparation
> >> > of the coming changes. It was then actually posted with
> >> > autoreconfigure turned off and using the libtool patch. As a side
> >> > note, I just realized that imagemagick is using libtool 2.2.x, which
> >> > means that it's incorporation is blocked until either I add it's own
> >> > libtool patch or we commit my libtool patch set. Sorry about that. If
> >> > anyone would like me to add the libtool patch to imagemagick, and
> >> > repost, let me know.
> >> >
> >> > Martin
> >> >
> >> > On Sun, Oct 3, 2010 at 7:22 AM, Thomas Petazzoni
> >> > <thomas.petazzoni@free-electrons.com> wrote:
> >> >         Hello,
> >> >
> >> >         On Sun, 03 Oct 2010 15:22:26 +0200
> >> >         Lionel Landwerlin <llandwerlin@gmail.com> wrote:
> >> >
> >> >         > Here is what I would like to us to do for the next
> >> >         releases :
> >> >         >
> >> >         > 1) Bump libtool package to 2.2, more and more packages
> >> >         require libtool
> >> >         > 2.2, and we're stuck to not autoreconfigure them without
> >> >         2.2. This is
> >> >         > already creating problems to Thomas when trying to bump host
> >> >         > libglib/libgtk packages.
> >> >
> >> >
> >> >          1a) Integrate Martin Banky's proposal so that packages using
> >> >         libtool
> >> >              2.2 can work without the need to autoreconfigure them.
> >> >
> >> >         > 2) Eventually integrate some patches to libtool 2.2 to be
> >> >         able to
> >> >         > cross compile autoreconfigured packages.
> >> >         >
> >> >         > 3) When the libtool 2.4 sysroot issue is sorted out, bump to
> >> >         libtool
> >> >         > 2.4 and get rid of the patches integrated in 2).
> >> >         >
> >> >         > I think 1) is mandatory for 2010.11.
> >> >
> >> >
> >> >         And 1a).
> >> >
> >> >         So, I would suggest :
> >> >
> >> >          *) Peter merges Martin Banky's set of patches on libtool
> >> >
> >> >
> >> >  http://lists.busybox.net/pipermail/buildroot/2010-September/037505.html
> >> >
> >> >
> >> >          *) Lionel, could you propose a patch that just bumps libtool
> >> >         to 2.2 ?
> >> >
> >> >         Lionel, Martin, Peter, what do you think ?
> >> >
> >> >         Thanks,
> >> >
> >> >         Thomas
> >> >         --
> >> >         Thomas Petazzoni, Free Electrons
> >> >         Kernel, drivers, real-time and embedded Linux
> >> >         development, consulting, training and support.
> >> >         http://free-electrons.com
> >> >         _______________________________________________
> >> >
> >> >
> >> >         buildroot mailing list
> >> >         buildroot at busybox.net
> >> >         http://lists.busybox.net/mailman/listinfo/buildroot
> >> >
> >> >
> >> > _______________________________________________
> >> > buildroot mailing list
> >> > buildroot at busybox.net
> >> > http://lists.busybox.net/mailman/listinfo/buildroot
> >>
> >>
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
