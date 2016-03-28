From: Matt Fornero <Matt.Fornero@mathworks.com>
Date: Mon, 28 Mar 2016 15:24:10 +0000
Subject: [Buildroot] [PATCH] toolchain-external: Commonize /lib/<tuple>
 symlinks
In-Reply-To: <56F805B2.40703@mind.be>
References: <a7c3e2bed5654819b3ad564f7d28d233@ex13amer-00-ah.ad.mathworks.com>
 <56F805B2.40703@mind.be>
Message-ID: <30e43b78b0e2471a8a825903433106f8@ex13amer-00-ah.ad.mathworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> 
>   Hi Matt,
> 
>   An external toolchain patch as your first contribution, that's...
> ambitious...
> The external toolchain support is pretty fragile, we are careful about
> touching it, so it could take months before your patch gets applied.

Hi Arnout,

Understood-- there's not a lot of urgency on our side; we generally 
re-sync to upstream every ~6 months. We're using Buildroot to (among
other things) generate images for Altera's SoC FPGA parts, and need to
use the version of the Linaro toolchain they ship. Previously I'd been
hacking the .mk file to properly describe the GCC version, headers
version, etc, while still getting the symlinks-- this seemed cleaner. If
we can get to the point where my co-workers can merge in upstream
changes without having to touch the toolchain files, I'd be happy!

...
> > +config BR2_TOOLCHAIN_EXTERNAL_NEEDS_PREFIX_SYMLINK
> > +	bool
> > +	default y if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM &&
> BR2_HOSTARCH = "x86"
> 
>   The HOSTARCH condition is unnecessary.

Ok-- I wasn't sure about this-- from what I can see the lines in the .mk
file that I'm replacing only install the post-staging hook for x86, was
there a reason for that?

...
> > +	default y if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64 &&
> BR2_HOSTARCH = "x86"
> > +	default y if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB &&
> BR2_HOSTARCH = "x86"
> > +	default y if BR2_TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK
> > +	default n
> 
>   default n is not necessary.

I'll remove the line-- wasn't super familiar with this style of Kconfig

> >
> > +config BR2_TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK
> > +	bool "Symlink /lib/<tuple>?"
> 
>   I would leave out the ? at the end. The HAS options above have it, but
> that's about the only situation we ever have a question mark.
> 

I'll drop the "?" 

>   I was also thinking if we shouldn't just create the symlink
> unconditionally.
> But it's really just the Linaro toolchains that need it, so it doesn't make
> that much sense.

I also looked at modifying / cloning the toolchain_find_libdir and
create_lib_symlinks functions, but these seemed much more fragile. The 
opt-in Kconfig option seemed like the least invasive way to modify the
code at this point.

> 
>   But basically, it looks good to me.

I'll go ahead and submit a v2 of this with the above changes

-Matt
