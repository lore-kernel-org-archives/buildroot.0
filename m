From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Jul 2018 09:36:23 +0200
Subject: [Buildroot] [PATCH] toolchain: improve musl check to support
 static toolchains
In-Reply-To: <2a850fef-a581-170d-0945-e8a4182b4347@mind.be>
References: <20180704214257.6849-1-thomas.petazzoni@bootlin.com>
 <2a850fef-a581-170d-0945-e8a4182b4347@mind.be>
Message-ID: <20180706093623.5a647d7f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 6 Jul 2018 00:25:11 +0200, Arnout Vandecappelle wrote:

>  Well, the most obvious indicator is the output of gcc -dumpmachine... Is there
> any reason why we wouldn't be able to treat that as reliable? AFAIU, hundreds of
> autotools package will fail if the dumpmachine tuple is not something sane...
> 
>  BTW, we do all these checks for libc etc., but we don't even check for the
> architecture... E.g. trying to use an arm compiler with BR2_armeb gives the
> rather unhelpful:
> 
> Cannot execute cross-compiler '.../opt/ext-toolchain/bin/armeb-linux-gcc.br_real'
> 
> So, if you're a little bit savvy, you notice that the toolchain prefix is wrong,
> so you set BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX to arm-linux- instead of
> $(ARCH)-linux. And it all works! Happily generating little-endian binaries...
> 
>  Bottom line: perhaps we should just check the tuple. That way we check the
> arch, we check that it's a hosted linux toolchain, we check libc, and we can
> even check the ARM ABI, all in one fell swoop...

That's a good idea indeed.

Another thing I noticed is that we don't check the static/shared
capabilities of the toolchain. For example if you try to use a
static-only external toolchain, by you keep the default of
BR2_SHARED_LIBS=y, things don't work very well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
