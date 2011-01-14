From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 14 Jan 2011 15:04:55 -0600
Subject: [Buildroot] ssh-keygen seg fault
In-Reply-To: <AANLkTimU=1_RZohLaLaNZDsfYek3Xr8TbWPZUaCDk6ne@mail.gmail.com>
References: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
	<20110114181920.59ba8b8b@surf>
	<AANLkTimU=1_RZohLaLaNZDsfYek3Xr8TbWPZUaCDk6ne@mail.gmail.com>
Message-ID: <201101141504.57536.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri January 14 2011, Kyle Hayes wrote:
> OK, now back to this...
> 
> On Fri, Jan 14, 2011 at 9:19 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hi Kyle,
> >
> > On Fri, 14 Jan 2011 09:00:16 -0800
> > Kyle Hayes <kyle@greenmonitor.com> wrote:
> >> I am currently using a custom distro based on Ubuntu 8.04 with as many
> >> packages trimmed as I can easily do. ?This still makes the base CF
> >> card image more than 400MB. ?Buildroot is making a base image of about
> >> 6MB. ?I intend to use extlinux' ability to concatenate multiple
> >> initramfs files to keep our software (which revs fairly often)
> >> separate from OpenVPN config (which doesn't change too often) separate
> >> from the core root filesystem.
> >
> > Sounds good. Didn't know that extlinux was able to do this kind of
> > things. By the way, do you build extlinux with Buildroot or separatly ?
> > If built with Buildroot, does it work ? Is there anything we should
> > improve on that side ?
> 
> I am using extlinux from the syslinux distribution included with
> Ubuntu 10.04 (my build workstation). I have not tried to build it with
> Buildroot as it is not a tool for the target, but something that I
> used when setting up the CF card.  It isn't the easiest thing to
> figure out (the config file for extlinux has a different _mandatory_
> file extension than the config file for syslinux!), but once you get
> it working, it is pretty slick.
> 
> >> I will try dropbear and see if that works any better. ?OpenSSH works
> >> fine out-of-the box for the Ubuntu 8.04 version so I'm suspicious that
> >> it is something about the way it is built or with the current version
> >> of OpenSSH.
> >
> > Yes, it's definitely something wrong in the build process, and it'd be
> > great to sort it out.
> 
> Dropbear appears to work.  It built RSA and DSA keys without barfing.
> However, there was something else I found, see at the bottom.
> 
> > Would you mind running ssh-keygen under gdbserver+cross-gdb as
> > suggested in my first e-mail ? Or run "ulimit -c unlimited" on your
> > board, get ssh-keygen to crash, and then transfer the core file to your
> > development workstation, and get a backstrace with the cross-gdb. That
> > would immediatly point us to the segfault location, which would really,
> > really help in understanding what the issue is.
> 
> I'll do this when I regress my build options back to where I had them.
>  I have something working and I want to save this configuration so
> that I can come back to it if I need to.
> 
> I was looking for clues in the fact that my previous custom kernel was
> built for a 586, not a 486.  I checked in my old .config files and the
> 586 options, NOT Pentium was checked.  This support AMD K6-2
> processors etc.  I changed Buildroot's configuration to select the
> i386 processor family and Pentium processors as there was not an
> option that matched the kernel exactly.  I tried to build the system
> and then installed it.  The kernel failed to boot saying that it was
> the wrong processor version?!
> 
> I checked the .config file for the kernel and found that Pentium-Pro
> was selected! Huh?  I ran make menuconfig in the kernel build
> directory and reset everything back the way I thought it should be and
> rebuilt.  That worked.  I'm still confused as to how the kernel came
> to be configured for the wrong processor.  I now have a fully working
> base system.  At least as far as I have tested it.  I have not tested
> logging into dropbear remotely.
> 
> I will now start undoing my changes and test to find out where things
> go wrong.  I will first make the selected Buildroot CPU type = i486
> and see what that does to the kernel CPU type.  I will then set it
> back to Pentium to see if that is where the Pentium-Pro selection came
> from.
> 

It seems you are working in the area of processors that do/do not
support sse instructions.

You might check for a "-no-asm" build option on your crypto (sshd) library.
That might fix your ssh-keygen seg faults.

Note: if your using the vortex86dx SoC - the documents I found on-line
for that says it supports the full instruction set of the 80486SX (I.E:
none of the instructions that would be based in the fp co-processor).

PS: How old a kernel version?  Linux dropped support for i386 a long time ago.

Mike
> Best,
> Kyle
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
