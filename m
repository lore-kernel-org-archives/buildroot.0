From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 21:39:24 +0200
Subject: [Buildroot] [PATCH 1/3] Experimental addition of the newlib
 library
In-Reply-To: <20150915175354.GA3650@free.fr>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <20150913101738.238ebc06@free-electrons.com>
 <CAOudHSVcePTAq7PLON-0Zig-JkJtTNnu-RzHtkYf0f00pe8atw@mail.gmail.com>
 <20150915093523.0597731f@free-electrons.com>
 <20150915175354.GA3650@free.fr>
Message-ID: <20150915213924.62547101@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Peter, Chris,

On Tue, 15 Sep 2015 19:53:54 +0200, Yann E. MORIN wrote:

> > I'm adding Yann in Cc. Yann, have you experienced such thing when
> > adding bare-metal/newlib support in Crosstool-NG? I've quickly looked
> > at the Crosstool-NG code, and I don't see the vendor part of the tuple
> > being skipped specifically for bare metal/newlib toolchains, but maybe
> > I missed it.
> 
> In fact, that's not the 'vendor' part that is to be removed; it's the
> 'kernel' part.
> 
> A canonical tuple is usually a three-part tuple: arch-vendor-os. But in
> the case of linux, the 'os' field is split in two: the 'kernel' and
> 'userland', like so:  arch-vendor-kernel-userland.
> 
> But really, the 'os' or 'userland' fields mostly denote the ABI being
> used.
> 
> So we end up with things like:
> 
>   - targets for running Linux:
>     - i386-blabla-linux-gnu
>     - powerpc-unknown-linux-gnuspe
>     - arm-none-linux-gnueabihf
>     - and so on...
> 
>   - targets running bare-metal:
>     - i386-blabla-elf
>     - powerpc-unknown-spe
>     - arm-none-eabihf
>     - and so on...
> 
> So, for bare-metal:
> 
>   - tuples are made of only three-part (in fact the historical canonical
>     form),
> 
>   - the part that is "omitted" from the four-part variant is not the
>     vendor string; rather the 'kernel' and 'userland' fields are merged
>     into one.

Thanks a lot for this explanation! It makes a lot more sense now. So,
Chris, I guess you have to rework your patch set in this direction:
it's not the vendor part of the tuple that is omitted.

> However, I'm not sure it is possible to run newlib as the C library
> under Linux (i.e. as a replacement for glibc/uClibc/musl). IIRC, newlib
> really targets kernel-less systems. It seems there are linux support
> files in the newlib source, but I doubt tht is often tested or even
> compeltely supported; a cursory look at the interwebs does not return
> promissing results...
> 
> And in nay case, I'm afraid a lot of packages would not build against
> newlib.
> 
> All that to say that I need to look at the patch, and I otherwise do not
> see the point for having newlib in Buildroot...

Chris is the person who submitted the support for the NuttX operating
system, which is another operating system kernel than Linux. In this
context, newlib is the C library of choice.

Now, there is indeed the question of how to handle all the existing
packages that would anyway only build with a normal Linux C library.
It's an open debate.

Maybe we first need to get an agreement on whether we want to merge
something such a newlib toolchain support and NuttX support. On my
side, I believe I am quite favorable to that, but I was also favorable
to Luca's patch series on the mdev stuff without devtmpfs, which is why
Luca started working on this, but in the end, it got turned down. So
this time around, it would be better if Peter could have a look at the
original patch from Chris (which definitely wasn't mergeable as is, but
was giving an idea of what was needed), and give his opinion on whether
we want something like this in Buildroot or not.

My view is that Buildroot is probably easier to use than Crosstool-NG,
even to build a simple bare-metal toolchain. Crosstool-NG has too many
options, and too many combinations that fail to build. There is a
discussion on-going on the crossgcc@ mailing list about that, but I can
see the interest in having a simpler to use tool to build bare-metal
toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
