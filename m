From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 2 Oct 2014 12:10:12 +0200 (CEST)
Subject: [Buildroot] Raspaudio : how to use buildroot as a git submodule
In-Reply-To: <CAM+bi4smyLzhBoDcU2+DT_6edX+Dxr440sNTK1+EFBzCQo8LyQ@mail.gmail.com>
Message-ID: <825058379.26083702.1412244610243.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi!
> 
> I've been thinking about the need for different overlays.
> Even though that's how I firstly organized my setup, I am now
> thinking
> it may not be the best course of action.
> 
> I've realized that in my setup, the two not-equal overlays are, in
> fact, equal except for a couple directories and /etc/inittab.
> I believe that it may be a better solution to just create a package
> that installs these big demo files I need on the demo machine,
> and simply select that package on the demo defconfig, instead of
> having two almost equal overlays.
> 
> I would still have to solve the differences in /etc/inittab, but
> maybe
> this file can be selected via a post build script.
> 
> What do you think?
> 

That would work and would indeed solve your problem, but I still need
to think the big picture through...

I have been reorganising/writing down how to use buildroot-submodule
for various use-cases, and I sould push something soon. I will 
probably change the project to focus on the "single variant" case 
while documenting when and how to have multiple variants.

If we stay with the use-case we have outlined so far (one logical 
project on multiple architectures) then we need multiple overlays.
Having different configuration files for different machines seems
a really needed feature. I can autogenerate some Config.in or .mk
files to automatically have things being configurable per-variant
or globally (wip) but there is only one overlay directory and no
easy way to "merge" multiple overlay directories from within BR

I need to think about that part some more, i'm open to suggestion


> 
> 2014-10-01 16:37 GMT+02:00 Jeremy Rosen <jeremy.rosen@openwide.fr>:
> >
> > ----- Mail original -----
> >> Hi, Jeremy
> >>
> >> Well, maybe I went all crazy splitting everything for each
> >> project,
> >> but there's some reason behind it.
> >
> > that's what I expected and why I asked :)
> >
> >>
> >> My main project is destined to run in a very specific hardware,
> >> with
> >> external devices that pass information to the system. A real
> >> example
> >> is a GPS device.
> >>
> >> On the other hand, I have a x86 machine which I use as a
> >> demo-machine
> >> with no external hardware attached (no GPS, for example). This
> >> requires that the information that is typically received from
> >> these
> >> external devices must be emulated by some piece of software.
> >>
> >> So, in my case, of course dl/ directoy is common, Config.in and
> >> external.mk are shared. I believe local.mk can also be shared,
> >> although in my current layout it is not.
> >
> > there is no point in not sharing it, since external.mk fullfills
> > the
> > same purpose and is already shared
> >
> >>It seems possible that some
> >> patches could be different, but I guess they could also be shared.
> >>
> >> I need, however, to have different overlays, such as, for example,
> >> a
> >> 'gpsd' emulator can run instead of the real gpsd. I manage this
> >> with
> >> a
> >> different inittab file and different configuration files that I
> >> place
> >> on each project's overlay. Alongside this trivial differences, I
> >> must
> >> load into the demo-machine some big files (a couple of GB) that
> >> emulate the data that, in the real machine, is received from
> >> external
> >> sources. These files would not even fit on the storage of the real
> >> machine.
> >>
> >> Well, all in all, I think only the overlays may need to be
> >> different,
> >> so there's that.
> >>
> >
> >
> > hmm.. ok, that complicates things a bit... I'll look into the BR
> > internal
> > to see if it's possible to have two overlays (one automatically set
> > by
> > BR2_EXTERNAL and one set via the configuration menu) and if the
> > project is
> > ready to accept that...
> >
> > the only think we can't easily double would be Config.in beacause
> > that file
> > needs to exist prior to menuconfig. The only way to do it would be
> > to specify
> > it in the make command line (the internal one we generate, not the
> > toplevel
> > one) and again see if buildroot is interested... I'll see what I
> > can do
> >
> > I also added an "anonymous" project for the common use-case where
> > you
> > only need one subproject, and i'm working on a README...
> >
> >
> >> Regards
> >>
> >>
> >> 2014-10-01 16:08 GMT+02:00 Jeremy Rosen
> >> <jeremy.rosen@openwide.fr>:
> >> >
> >> >
> >> > Looking into it a bit deeper, I have a couple of questions for
> >> > you..
> >> >
> >> > in your current layout
> >> >
> >> > * BR2_EXTERNAL is shared, so Config.in is shared and external.mk
> >> > is shared
> >> > * each project has its own overlay
> >> > * each project has its own local.mk
> >> > * each project has its own patch subdirectory...
> >> > * dl is shared
> >> >
> >> > so I need to understand your use-case a little more.
> >> > As I said my use case is "same project, but different hardware"
> >> > so
> >> > my favorite layout would be
> >> >
> >> > * shared BR2_EXTERNAL
> >> > * shared overlay
> >> > * shared patches
> >> > * different config files
> >> > * don't care about local.mk, might as well make it different
> >> >
> >> > This layout makes more sense to me (shared overlay and shared
> >> > patches)
> >> > but I want to make sure it fits your use-case before I do the
> >> > change
> >> >
> >> > It makes little sense to me to have completely different
> >> > projects
> >> > which are just sharing dl/ since dl is not saved in git and it's
> >> > more handy to have completely separate git repo in this case...
> >> >
> >> >
> >> > If you can tell me a little more, I'll see how I adapt this...
> >>
> >>
> >>
> >> --
> >> ?lvaro G?mez Machado
> >>
> 
> 
> 
> --
> ?lvaro G?mez Machado
> 
