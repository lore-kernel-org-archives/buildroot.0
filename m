From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Dec 2018 10:08:17 +0100
Subject: [Buildroot] [PATCH] swupdate: pass full TARGET_CONFIGURE_OPTS
In-Reply-To: <87y38n19wu.fsf@dell.be.48ers.dk>
References: <20181217234301.7111-1-arnout@mind.be>
 <8736qv2q5i.fsf@dell.be.48ers.dk> <87y38n19wu.fsf@dell.be.48ers.dk>
Message-ID: <b6eed3cd-2693-bf7d-9bb6-56aeb367083c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/12/2018 10:06, Peter Korsgaard wrote:
>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
>  >> Although we set CONFIG_CROSS_COMPILE to TARGET_CROSS in swupdate's
>  >> .config file, swupdate's build system just appends 'cc' to it, not
>  >> 'gcc'. Some external toolchains don't provide a cc -> gcc symlink,
>  >> leading to errors like:
> 
>  >> /bin/sh: .../host/bin/arm-none-linux-gnueabi-cc: No such file or directory
> 
>  >> We can just pass TARGET_CONFIGURE_OPTS which explicitly sets CC=, like
>  >> we do for all other packages.
> 
>  > Hmm, wait - This also passes LD="$(TARGET_LD)", whereas swupdate used CC
>  > to link. Is that really working?

 Crap. I did think of that but not hard enough. Mental note: next time test
mipsel...

 Regards,
 Arnout

> 
> No it doesn't:
> 
>   LD      core/built-in.o
> /home/peko/source/buildroot/output-sw/host/bin/mips-img-linux-gnu-ld: core/swupdate.o: compiled for a little endian system and target is big endian
> 
> scripts/Makefile.build:224: recipe for target 'core/built-in.o' failed
> make[3]: *** [core/built-in.o] Error 1
> Makefile:480: recipe for target 'core' failed
> make[2]: *** [core] Error 2
> 
> With this defconfig:
> BR2_mipsel=y
> BR2_mips_32r6=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_SWUPDATE=y
> 
> I will change it to explicitly pass CC="$(TARGET_CC)" LD="$(TARGET_CC)"
> instead.
> 
