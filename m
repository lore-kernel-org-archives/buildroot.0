From: Heyendal, Carl <CHeyendal@stanleyworks.com>
Date: Wed, 16 Mar 2011 16:08:41 -0400
Subject: [Buildroot] Buildroot in use
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
	<20110315180743.5e34890b@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
	<20110315192211.3c59f861@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>
	<20110315210538.1973f87f@surf>
	<779935.72384.qm@web161802.mail.bf1.yahoo.com> 
Message-ID: <1D6034426110564DA0DEA9EE9793B3835815B5144E@NBE-MBX01.americas.swk.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

...at least for the kernel anyways. Maybe not for busybox.

> -----Original Message-----
> From: Heyendal, Carl
> Sent: March 16, 2011 3:22 PM
> To: 'Steve Calfee'
> Subject: RE: [Buildroot] Buildroot in use
> 
> Good advice Steve. Thanks for the tip.
> 
> Another thing I've noticed when I do 'make clean' from Buildroot home
> directory is that the configuration changes back to its defaults for
> both the kernel and busybox. Any changes I made are gone after a make
> clean. Should I need to copy my .config's before a rebuild?
> 
> /carl h.
> 
> 
> 
> > -----Original Message-----
> > From: buildroot-bounces at busybox.net [mailto:buildroot-
> > bounces at busybox.net] On Behalf Of Steve Calfee
> > Sent: March 16, 2011 12:44 PM
> > To: Thomas Petazzoni; buildroot at busybox.net
> > Subject: [Buildroot] Buildroot in use
> >
> > ----- Original Message ----
> >
> > > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > >
> > > Hello,
> > >
> > > On Tue, 15 Mar 2011 14:32:07 -0400
> > > "Heyendal, Carl" <CHeyendal@stanleyworks.com>  wrote:
> > >
> > > > Really!! 'make clean' from Buildroot directory? That's a
> complete
> > > > rebuild!!
> > >
> > > Yes, it is. For now, Buildroot is "nothing"  more but a tool that
> > > automates the process of building an embedded Linux  system. It is
> > not
> > > very smart, so it cannot remove packages that have been  installed,
> > or
> > > revert changes that have been made to the target  filesystem.
> > >
> > > My view on this: Buildroot has been more or less abandonned  until
> > late
> > > 2008/early 2009, when Peter took over the maintainership of  the
> > > project. Since that time, our main goal was to clean up the
> existing
> > > code base, keeping the existing feature set (in fact, we added a
> > bunch
> > > of features as well, but we didn't fundamentaly changed how
> > Buildroot
> > > works). Now that this cleanup process is mostly over, I'd say  that
> > > solving the issue you're facing here is now on the top priorities
> of
> > > the project. At least it's where it is on my own Buildroot TODO
> > list.
> > > But there a fairly huge and complex amount of work to do here, so
> it
> > > isn't going to happen overnight.
> > >
> >
> > I think a general discussion of how we use buildroot and what we
> would
> > like to
> > see is in order. It seems the framework is stabilizing and useful
> > (thanks guys).
> >
> > It seems in my use that I am either working on the kernel or
> > configuring a
> > system with packages (rootfs). make clean is unbearable where it
> > removes the
> > toolchain etc.
> >
> >
> > So what I do is I git pull one tree just for my toolchain and
> compiler.
> > I
> > configure and build it without bootstraps, busybox, kernel etc. If I
> > need to
> > change a toolchain option I go back to this tree and fix it. This
> build
> > becomes
> > my "external toolchain".
> >
> > I then git pull another tree which uses that external toolchain. Make
> > clean is
> > now much less painful.
> >
> > During development it is common to want to change stuff in the
> > "skeleton"
> > filesystem - add scripts, configure things etc. This is kind of
> painful
> > from
> > within the buildroot framework, with no clear way to force an update
> to
> > the
> > rootfs image etc. So what I do is I create a skeleton directory for
> my
> > board. In
> > the post build script I copy my skeleton on top of the existing
> > buildroot
> > constructed skeleton. In this way I only have the files I care about
> in
> > my board
> > skeleton, they are updated every build etc.
> >
> > I have not moved my bsp to the new board/company/bsp file system yet,
> > but here
> > is my post install script:
> > #!/bin/bash
> > #
> > # script which runs before creating rootfs
> > #
> > #
> > MAINDIR=${1}/../../
> > SRCDIR=${MAINDIR}"target/device/beagleboard/skeleton/*"
> > DESTDIR=${1}
> > echo "***************patching some stuff in " ${DESTDIR} from
> ${SRCDIR}
> > #echo "DESTDIR " ${DESTDIR}
> > #echo "SRCDIR " ${SRCDIR}
> > #ls -l ${SRCDIR} ${SRCDIR}"/etc"
> > cp -rv ${SRCDIR} ${DESTDIR}
> > echo "end of userdefined script before packing rootfs"
> >
> >
> > I am curious how people do development with cutting edge kernels like
> > linux-next? Do you do it completely removed from buildroot and just
> use
> > the
> > external tools? Do you use some kind of sym-link to point to the
> other
> > kernel
> > git tree?
> >
> > Regards, Steve
> >
> >
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
