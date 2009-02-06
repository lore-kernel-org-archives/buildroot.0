From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 06 Feb 2009 07:16:34 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <d6cda7730902051828if9915d3u31cf79bf5a68fcac@mail.gmail.com>
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<d6cda7730902041833r5e5af2ax26c0eebb48df19a4@mail.gmail.com>
	<87vdrpaug2.fsf@macbook.be.48ers.dk>
	<1233866252.4148.12.camel@elrond.atmel.com>
	<d6cda7730902051828if9915d3u31cf79bf5a68fcac@mail.gmail.com>
Message-ID: <1233900994.26426.10.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-02-06 klockan 00:28 -0200 skrev Thiago A. Corr?a:
> On Thu, Feb 5, 2009 at 6:37 PM, Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
> >>  Thiago> It will use the rootfs suffix if one is specified for the kernel, but
> >>  Thiago> if none is supplied, we get default kernel names. Then you can get
> >>  Thiago> both rootfs and kernel with your board names, dates, etc. And both
> >>  Thiago> rootfs and kernel names will always match.
> >>
> >
> >
> > And you have no clue about the kernel version.
> > And you have to modify the suffix for every project.
> > Much better to just create the link to uImage etc.
> >
> > Then you have both.
> 
> But if you use the rootfs suffix, not only you have both, but you also
> can disable it.
> Following your argument, I might just as well want to have rootfs in
> /tftpboot, and if the names match (same suffix) then I know which
> kernel is inside each rootfs image.
> 

?The AT91 uboot patches and autoscripts rely on this very exact naming,
so if you commit your patch, you break the at91 support.

If you add KERNEL_VERSION to the root fs name
you do things automatically, if you dont
then everything is manually, and you have
a risk of mismatch between name and actual version.
I would not mind that the rootfs contains
kernel version, but it will break the at91 u-boot
autoscripts which means that it should avoided
at this point, and introduced in a future buildroot.


To avoid bugs due to people forgetting to update onfig the kernel name
needs to depend BOTH on PROJECT and LINUX_VERSION.

> The $(DATE) seams to be default to rootfs suffix already, all you have
> to do is change it per project to include the project or board name.

I think your major problem is that the DATE changes.
I think it is fair to allow DATE to be in the rootfs suffix.

but I still think your needs are best accomodated by 

ln -s $(LINUX_KERNEL_NAME) uImage

Then You do not have to change your u-boot configuration
and  You do not break the at91 build.


> You have to touch your projects at some point to change things anyway,
> otherwise they would always build the same thing, so that's not a very
> good argument against.
> 
> You can have the same functionality as before, but with added flexibility.
> 
> I'm just trying to test it out before commiting. Since I can't build
> my usual platform, avr32, I'm giving arm a try.
> 
BR



> Kind Regards,
>    Thiago A. Correa
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
