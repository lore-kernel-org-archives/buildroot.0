From: Pawel Sikora <sikor6@gmail.com>
Date: Mon, 10 Apr 2017 00:51:56 +0200
Subject: [Buildroot] [PATCH 1/1] xenomai: Add choice for Cobalt/Mercury
	core
In-Reply-To: <2fa9e5f3-79a9-090e-76ed-457be2e6e49a@mind.be>
References: <20170406234139.31532-1-sikor6@gmail.com>
 <20170406234139.31532-2-sikor6@gmail.com>
 <20170408153452.54837e4c@free-electrons.com>
 <2fa9e5f3-79a9-090e-76ed-457be2e6e49a@mind.be>
Message-ID: <CAKfV1CaoGUPmL6W5xT61YECuVvN3_RthyD7sw8Cw54e_RMOYCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2017-04-08 16:22 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

>
>
> On 08-04-17 15:34, Thomas Petazzoni wrote:
> > Hello,
> >
> > On Fri,  7 Apr 2017 01:41:39 +0200, Pawel Sikora wrote:
> >
> >> +choice
> >> +    prompt "Xenomai core"
> >> +    default BR2_PACKAGE_XENOMAI_MERCURY
> >> +    help
> >> +      Manually select the Xenomai core. Default option depends if
> >> +      you selected BR2_LINUX_KERNEL_EXT_XENOMAI.
> >> +      If yes, then default option will be Cobalt.
> >> +      Otherwise you can use just the Mercury core with the
> >> +      native Linux kernel.
> >> +
> >> +config BR2_PACKAGE_XENOMAI_MERCURY
> >> +    bool "Mercury"
> >> +    depends on !BR2_LINUX_KERNEL_EXT_XENOMAI
> >> +    help
> >> +      Select Mercury core for the Xenomai userspace.
> >> +      If you want Cobalt core, you need to enable
> >> +      BR2_LINUX_KERNEL_EXT_XENOMAI in the Linux Kernel ->
> >> +      Linux Kernel Extensions menu.
> >> +
> >> +config BR2_PACKAGE_XENOMAI_COBALT
> >> +    bool "Cobalt"
> >> +    depends on BR2_LINUX_KERNEL_EXT_XENOMAI
> >> +    help
> >> +      Select Cobalt core for the Xenomai userspace.
> >> +      If you want Mercury core, you need to disable
> >> +      BR2_LINUX_KERNEL_EXT_XENOMAI in the Linux Kernel ->
> >> +      Linux Kernel Extensions menu.
> >
> > Does it really make sense to have a "choice" when in fact it's
> > impossible to have both options of the choice visible at the same time?
> > One option depends on !BR2_LINUX_KERNEL_EXT_XENOMAI and the other
> > option depends on BR2_LINUX_KERNEL_EXT_XENOMAI.
>
>
Taking into considerations Arnout's suggestions that Cobalt indeed does not
need to have dependency from BR2_LINUX_KERNEL_EXT_XENOMAI
you can really choose between Mercury/Cobalt. So now this makes sense ;-)


> > I'm not sure how to handle this. Do we automatically switch between
> > Cobalt and Mercury depending on whether the Xenomai kernel extension is
> > enabled?
> >
> > Do we use Mercury by default, and offer a sub-option to explicitly
> > enable Cobalt when the Linux kernel extension is available?
>
>  The mercury option certainly only makes sense when the Xenomai extension
> in the
> kernel is NOT selected, so that can be kept.
>
>  However, the cobalt option still makes sense if the Xenomai extension is
> not
> selected. For starters, it's possible that the kernel is built outside of
> Buildroot. But also it's possible that we use a custom kernel that is
> already
> Xenomai-patched, in which case the Xenomai extension is not used.
>
>  So just remove the dependency from cobalt.
>
>  I think indeed it does make sense to use Mercury by default, except when
> the
> Xenomai extension is selected.
>
>  Regards,
>  Arnout
>
--
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

Right Arnout, thanks guys for pointing that - I changed it as you proposed.
I added also an explicit choice for cobalt in an else statement as Thomas
De Schampheleire suggested.

Checked in compile time in Configure, based on output from message:
"checking whether we build for Cobalt or Mercury core... cobalt"

Btw. Guys:

What about support for Xenomai 2.6? Should we split Xenomai into two
packages
for both versions? As it needs different patches that are currently for 3.x
version
and now if someone want to build 2.x will need to take these patches
manually.
So doesn't it really mean now, that the option with prompt for Xenomai
version
will work only for Xenomai >3.x?

What do you think?

Regards,
Pawel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170410/5b774cc7/attachment.html>
