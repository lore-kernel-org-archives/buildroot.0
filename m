From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 07:49:32 +0200
Subject: [Buildroot] [PATCHv2] linux: may fail to boot for binutils
 2.29+ even without armv7m
In-Reply-To: <b3672758-0d2b-51cd-7eac-cc06158a995b@mind.be>
References: <20180601180157.759-1-yann.morin.1998@free.fr>
 <b3672758-0d2b-51cd-7eac-cc06158a995b@mind.be>
Message-ID: <20180605074932.668ae4e7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Jun 2018 00:10:30 +0200, Arnout Vandecappelle wrote:

> >  comment "Linux kernel may fail to boot with binutils >= 2.29"
> > -	depends on BR2_ARM_CPU_ARMV7M
> > +	depends on BR2_arm || BR2_armeb  
> 
>  I have a bit of a problem with this patch. IMO it's rather unlikely that people
> build the kernel in THUMB mode on non-M CPUs.

Are you sure ? There is definitely support for building a Thumb2 kernel
on ARMv7-A, and I think it's a popular way to reduce a bit the size of
the kernel, no?

> But now we're always showing this
> warning. I think it will confuse a number of people, and I don't think it's very
> likely that it will actually help anyone.

Actually the warning should not have a:

	depends on BR2_arm || BR2_armeb

but instead a:

	depends on BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2

because that's actually what we do in binutils to decide whether we
want to fall back on binutils 2.28 by default or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
