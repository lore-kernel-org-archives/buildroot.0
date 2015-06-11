From: Michal Gonda <gonda.miso@gmail.com>
Date: Thu, 11 Jun 2015 16:39:53 +0200
Subject: [Buildroot] Kernel zImage under 1MB
In-Reply-To: <87lhfsj7ro.fsf@dell.be.48ers.dk>
References: <CADMiy=KWH-W4VGUjaMF8mmFTSRUxT13xbTeoWigo=gme8GDwKw@mail.gmail.com>
 <87pp54jzw1.fsf@dell.be.48ers.dk>
 <CADMiy=JZSro09MASQy51wKeDy2uES0D-kWwNgtL95s6z1AmxrA@mail.gmail.com>
 <87lhfsj7ro.fsf@dell.be.48ers.dk>
Message-ID: <CADMiy=JBW02jQ2wfEJGR8i5TyjRq8_Q62k2VttP0xADn9_w9zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 10, 2015 at 10:18 AM, Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Michal" == Michal Gonda <gonda.miso@gmail.com> writes:
>
>  > Thank you Yegor for link.
>  > Hi Peter,
>
>  > Yes I ment 1MB, sorry for the typo :)
>  > To specify little bit more the setup. Altera SoC cyclon 5 arm 9.
>  > 1GB sdRam but unfortunatelly just around ~6MB qspi flash for kernel +
>  > rootfs image.
>
> 6MB? I thought you said 1MB for kernel+rootfs? 6MB is a lot more doable
> with minimal effort.
>

No around 1MB for kernel and than I would like to have more space for
rootfs (aplications and services like openVPN, zeroMQ, less crippled
busybox etc.)
And since I dont need support for all the optional drivers why not to
remove them (but I was not sure how to do that, now it is much more clearer)

>
>  > But what you described is exactly what I need to accomplish.
>  > A static uClibc based build with busybox +
>  > dropbear as smallest possible image is perfect.
>  > As you said I can drop probably more later on but few kB here and there
> if
>  > kernel is ~1MB is perfect.
>  > Even better ~450kB as you did.
>
> Notice that the 450KB was for the rootfs. I don't know how big your
> socfgpa kernel image is, but I would guess it is significantly bigger
> than 1MB even with XZ compression?


If I build it with default settings, uImage is 3,5MB and rootfs around 5MB.
I am tinkering around but getting kernel panic :D


>  > If you have a time could you briefly point out the steps and parts I
> should
>  > focused on ?
>
> For the kernel? Basically just turn off all options that you don't need
> and compress the kernel with XZ (config KERNEL_XZ).
>
> For Buildroot just enable static linking (Build
> options->libraries->static only) and only busybox+dropbear. For
> filesystem you can either use an initramfs embedded in the kernel or
> squashfs (with XZ compression).
>

I will look at those options.


>  > As a question aside, Is it enough just
>  > "make manuconfig" and "make" rebuild the kernel and rootfs or do i need
> to
>
> Buildroot doesn't track changes in the configuration file / what files
> were added by a package, so it will not remove a package if you do a
> build and then use menuconfig to remove the package again.
>
> It WILL rebuild the kernel or busybox after you used make
> linux-menuconfig or make busybox-menuconfig to tweak the configuration.
>
> --
> Venlig hilsen,
> Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150611/cbf10d95/attachment.html>
