From: Heyendal, Carl <CHeyendal@stanleyworks.com>
Date: Thu, 17 Mar 2011 09:53:26 -0400
Subject: [Buildroot] Buildroot in use
In-Reply-To: <4D81FB3E.7060307@carallon.com>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
	<20110315180743.5e34890b@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
	<20110315192211.3c59f861@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>
	<20110315210538.1973f87f@surf>
	<779935.72384.qm@web161802.mail.bf1.yahoo.com>
	<4D81FB3E.7060307@carallon.com>
Message-ID: <1D6034426110564DA0DEA9EE9793B3835815B51A9B@NBE-MBX01.americas.swk.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If starting from scratch, downloading and building 2 Buildroots (one for the toolchain, and the other for the rest of the stuff) sounds reasonable. But refining the notion a bit more, if you have already built the entire Buildroot tree like I have done already, is it possible to break off the toolchain leg of the tree and move it somewhere else. Then of course configure the external toolchain option after that. 

/carl

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of William Wagner
> Sent: March 17, 2011 8:15 AM
> To: Steve Calfee
> Cc: Thomas Petazzoni; buildroot at busybox.net
> Subject: Re: [Buildroot] Buildroot in use
> 
> On 16/03/2011 16:44, Steve Calfee wrote:
> > ----- Original Message ----
> >
> >> From: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> >>
> >> Hello,
> >>
> >> On Tue, 15 Mar 2011 14:32:07 -0400
> >> "Heyendal, Carl"<CHeyendal@stanleyworks.com>   wrote:
> >>
> >>> Really!! 'make clean' from Buildroot directory? That's a  complete
> >>> rebuild!!
> >> Yes, it is. For now, Buildroot is "nothing"  more but a tool that
> >> automates the process of building an embedded Linux  system. It is
> not
> >> very smart, so it cannot remove packages that have been  installed,
> or
> >> revert changes that have been made to the target  filesystem.
> >>
> >> My view on this: Buildroot has been more or less abandonned  until
> late
> >> 2008/early 2009, when Peter took over the maintainership of  the
> >> project. Since that time, our main goal was to clean up the
> existing
> >> code base, keeping the existing feature set (in fact, we added a
> bunch
> >> of features as well, but we didn't fundamentaly changed how
> Buildroot
> >> works). Now that this cleanup process is mostly over, I'd say  that
> >> solving the issue you're facing here is now on the top priorities
> of
> >> the project. At least it's where it is on my own Buildroot TODO
> list.
> >> But there a fairly huge and complex amount of work to do here, so
> it
> >> isn't going to happen overnight.
> >>
> > I think a general discussion of how we use buildroot and what we
> would like to
> > see is in order. It seems the framework is stabilizing and useful
> (thanks guys).
> >
> > It seems in my use that I am either working on the kernel or
> configuring a
> > system with packages (rootfs). make clean is unbearable where it
> removes the
> > toolchain etc.
> 
> I agree, this is the only part of the build that takes any time. It
> would be great if there was a way of cleaning back to only the
> toolchain
> built. I am getting round this at the moment by using an external
> crosstools-NG toolchain in most projects, which gives much the same
> functionality, just would be easier for a beginner to understand if
> buildroot could do this itself.
> 
> Given how we support external toolchains would it not be possible to be
> able to clean everything but toolchain (Which I think only gets
> produced
> if you have an internal toolchain) and then when you build again it
> does
> the same as for an external toolchain and copies the files into staging
> etc?
> 
> >
> > So what I do is I git pull one tree just for my toolchain and
> compiler. I
> > configure and build it without bootstraps, busybox, kernel etc. If I
> need to
> > change a toolchain option I go back to this tree and fix it. This
> build becomes
> > my "external toolchain".
> >
> > I then git pull another tree which uses that external toolchain. Make
> clean is
> > now much less painful.
> >
> > During development it is common to want to change stuff in the
> "skeleton"
> > filesystem - add scripts, configure things etc. This is kind of
> painful from
> > within the buildroot framework, with no clear way to force an update
> to the
> > rootfs image etc. So what I do is I create a skeleton directory for
> my board. In
> > the post build script I copy my skeleton on top of the existing
> buildroot
> > constructed skeleton. In this way I only have the files I care about
> in my board
> > skeleton, they are updated every build etc.
> 
> I do something very similar. The default skeleton is fine for most
> things, there are just a couple of customisations I want. Recent work
> in
> this area is already adding config options for some of what I want. A
> custom board script can then make any further modifications.
> 
> Would be great to have an example of recommended practice checked in
> for
> people to see/copy. Also would be great to remove the xtensa bits as
> they are just confusing. Perhaps we should convert that over to the new
> scheme?
> 
> 
> Will
> 
> --
> -----------------------------------------------------------------------
> -
> Will Wagner
> will_wagner at carallon.com
> Development Manager                      Office Tel: +44 (0)20 7371
> 2032
> Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14
> 0DA
> -----------------------------------------------------------------------
> -
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
