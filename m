From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 01 Feb 2009 15:00:46 +0100
Subject: [Buildroot] Binary toolchain fails
In-Reply-To: <87hc3ei9wj.fsf@macbook.be.48ers.dk>
References: <1233484479.4147.149.camel@elrond.atmel.com>
	<87hc3ei9wj.fsf@macbook.be.48ers.dk>
Message-ID: <1233496846.5742.19.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2009-02-01 klockan 14:06 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  Ulf> I am testing the binary toolchain, with a toolchain built
>  Ulf> by another buildroot project.
> 
> The external toolchain stuff? That's afaik known to not work.
> 
>  Ulf> Several packages does not build correctly.
> 
>  Ulf> "-lintl" and "-liconv are" not found.
> 
> Strange, so the packages don't respect CFLAGS / LDFLAGS?
> 
>  Ulf> Examples are "e2fsprogs" and "libgpg-error"
> 
>  Ulf> by doing
> 
> 
>  Ulf> ifeq	($(BR2_PACKAGE_LIBICONV),y)
>  Ulf> LIBGPG_ERROR_CONF_OPT += --with-libiconv-prefix=$(STAGING_DIR)/usr
>  Ulf> endif
> 
>  Ulf> ifeq	($(BR2_PACKAGE_LIBINTL),y)
>  Ulf> LIBGPG_ERROR_CONF_OPT += --with-libintl-prefix=$(STAGING_DIR)/usr
>  Ulf> endif
> 
> And what about the 10s of other libraries we have? To me it seems like
> something else is broken in the external toolchain stuff, and this is
> just pampering over it.
> 
>  Ulf> KERNEL HEADERS
>  Ulf> --------------
>  Ulf> If you build just the toolchain to, lets say, /usr/local/arm/gcc-4.3.2, 
>  Ulf> and use this directory as GCCROOT in your external toolchain,
>  Ulf> you have no kernel-headers.
> 
>  Ulf> Should the kernel headers really be installed in
>  Ulf> toolchain_build_ARCH/linux?
>  Ulf> Why not in "$(STAGING_DIR)/usr/include/linux" ?
> 
>  Ulf> If you are not building a toolchain from source, then
>  Ulf> the kernel-headers target is not available.
>  Ulf> I moved them out from the if BUILDROOT_TOOLCHAIN_SOURCE
>  Ulf> clause so they build for me, but I think that
>  Ulf> is the wrong solution and generating the headers in 
>  Ulf> ?"$(STAGING_DIR)/usr/include/linux" is better.
> 
>  Ulf> Comments?
> 
> The kernel headers are pretty closely related to the C library, and
> hence the toolchain, so my initial thought is that it sounds wrong.


I think the kernel headers should be in $(STAGING_DIR)/usr/include/linux
You think this is wrong?

THe other thing is just a workadound!

BR
Ulf Samuelsson

> But if you want to work on making the external toolchain stuff less
> broken AFTER the release, then that's fine as long as it doesn't add
> too much complications and the internal toolchain stuff keeps working.
> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
