From: David du Colombier <0intro@gmail.com>
Date: Sun, 5 Oct 2014 18:26:33 +0200
Subject: [Buildroot] [PATCH v3 1/2] x264: new package
In-Reply-To: <20141005145348.2913eb46@free-electrons.com>
References: <1412326439-12230-1-git-send-email-0intro@gmail.com>
 <20141005145348.2913eb46@free-electrons.com>
Message-ID: <20141005182633.18741d81@zinc.9fans.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > +if BR2_PACKAGE_X264
> > +
> > +config BR2_PACKAGE_X264_CLI
> > +	bool "CLI"
> > +	default n
> 
> default n is not needed, as the default for a boolean option is to be
> disabled.

Done.

> > +	help
> > +	  Command Line Interface
> 
> Maybe more text would be needed here.

Done.

> When you're on ARM, CFLAGS is added to ASFLAGS. However, the CFLAGS
> passed by Buildroot contain options that are not suitable for AS.
> Basically, what x264 is doing here is completely stupid: assuming that
> all compiler flags can be passed as assembler flags.

It seems this issue has already been fixed in the x264
master branch.

http://git.videolan.org/gitweb.cgi/x264.git/?a=commit;h=716ee56d0b35e512e8e0ae1a3e71f26e65e86be3

I've imported the patch in the x264 package.

> Also, the "else" condition above is interesting: the assembly code is
> only valid for ARMv6+. So in your x264.mk file, the following snippet
> is wrong:
> 
> ifeq ($(BR2_arm)$(BR2_i386)$(BR2_powerpc)$(BR2_x86_64),)
>         X264_CONF_OPTS += --disable-asm
> endif
> 
> Because if you're on ARMv5, we will *not* pass --disable-asm, while we
> should. So this logic should be refined to take into account variants
> of the ARM architecture.

It seems the ARM assembly files aren't compatible with the
GNU assembler, so I finally chose to enable assembly files
on x86 only.

> Could you look into this and send an updated version?

I'll send a v4 patch.

-- 
David du Colombier
