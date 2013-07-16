From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 16 Jul 2013 10:06:22 -0500
Subject: [Buildroot] [PATCHv3 08/14] configs: use new EABIhf option for
	beaglebone_defconfig
In-Reply-To: <20130716154704.35933a60@skate>
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <8761wa1w3b.fsf@dell.be.48ers.dk> <20130716153258.1f2c3201@skate>
 <87bo62zks8.fsf@dell.be.48ers.dk> <20130716154704.35933a60@skate>
Message-ID: <CAEBucnDrCWq5-B2N9=CEY3OSuu+w+x3ve-uh801Q8om73wF6zQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

>
>>  Thomas> Yes, I tried beaglebone_defconfig, which uses an internal toolchain...
>>  Thomas> which would not exhibit this problem.
>>
>> Ok, good. Then I'll commit it.
>>
>>
>>  Thomas> Unfortunately, I'm not sure how to fix this particular problem. It's
>>  Thomas> gcc that is too stupid to understand that -msoft-float appearing in the
>>  Thomas> command line after -mfloat-abi=hard should take precedence over
>>  Thomas> -mfloat-abi=hard. I believe we already had this case in the past, maybe
>>  Thomas> not specifically with those options, but with other options.
>>
>>  Thomas> One solution I see to this is not very nice:
>>
>>  Thomas>      if (gcc command line contains -msoft-float) {
>>  Thomas>              do not pass -mfloat-abi and -mfpu arguments
>>  Thomas>      }
>>
>> You mean in the toolchain wrapper? Yddrk.
>
> Yes, I meant in the toolchain wrapper. I'm pretty sure we had a similar
> discussion not long ago about an incompatibility between options
> hard-coded into the wrapper and additional options passed to the
> compiler.

FWIW; The following thread explains the situation for UBoot

http://u-boot.10912.n7.nabble.com/U-Boot-RFC-PATCH-ARMV7-Patch-to-fix-hard-float-build-issues-td22107.html

In summary, uboot will keep -msoft-float and will not accept the patch
for reasons of preventing possible floating point assembly being
generated.

IMHO: the simple solution could be to just do a CFLAGS=$(filter
-mfloat-abi=hard, $(TARGET_CFLAGS)) when passing to uboot as uboot
should not generate any float code at all.

>>  Thomas> The other solution is to simply not pass -mfloat-abi=hard, assuming the
>>  Thomas> toolchain would by default generate such binaries, which should be the
>>  Thomas> case because EABI and EABIhf are not compatible. However, we should
>>  Thomas> still pass -mfloat-abi=soft/softfp as needed.
>>
>> That could work, but also doesn't sound really nice. Presumably gcc
>> doesn't complain about -mfloat-abi=softfp -mfloat-abi=soft as those are
>> compatible.
>
> $ arm-linux-gnueabihf-gcc -mfloat-abi=hard -msoft-float -c toto.c
> arm-linux-gnueabihf-gcc: erreur: -mfloat-abi=soft and -mfloat-abi=hard may not be used together
> $ arm-linux-gnueabihf-gcc -mfloat-abi=soft -msoft-float -c toto.c
> $ arm-linux-gnueabihf-gcc -mfloat-abi=softfp -msoft-float -c toto.c
> $ arm-linux-gnueabihf-gcc -mfloat-abi=softfp -mfloat-abi=soft -msoft-float -c toto.c
> $
>
> So I'm not sure how to handle that.
>
>>  Thomas> That makes me think that I should maybe add a check that ensures that
>>  Thomas> the ABI selection (EABI/EABIhf) matches the one provided by the
>>  Thomas> external toolchain (which is useful when custom external toolchains are
>>  Thomas> used).
>>
>> That would be a nice addition, yes.
>
> Indeed, I'll try to cook a patch for this.

Thanks,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
