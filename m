Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,WEIRD_PORT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41542C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 18:21:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAD1E60F55
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 18:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAD1E60F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2B314027E;
	Sun,  8 Aug 2021 18:21:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zW7UyUnCseyD; Sun,  8 Aug 2021 18:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E3C4027F;
	Sun,  8 Aug 2021 18:21:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35C291BF4D8
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 18:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23952400F2
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 18:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7LlcrGr0DVMO for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 18:21:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D361400AE
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 18:21:51 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id i7so17871892iow.1
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 11:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=3HIRjv9pWAD44NbrdYQz3gAKmzA2ni91tDVTDde0Nxo=;
 b=kUzgjk1q37ttFQ/dWaA9IAMHgua5l3fga3WKMWQQJopk7Ltrr7BeTXgG3Wv/gmybG/
 q2KBacwy3SqpSGnebifd4Nv+wuslLm+tlNOI3U6IDLyx5qqZOrkufNV5gGtCRpozhegT
 Q/k9JmohTMXwYePznZUfZ9ZzUOQjiz76KSZNelBPtVsOXFyQlEVgpG0z8WPZ1rVvIz+7
 kyAwR9sBJp79vXIUiT8uAW6y5ZkyT2wq0KJJZwQfVvzpZewuNi0RtKVSYAcQRtCLvkFz
 /3rCTHncG2FCX4b8HmzUuPpSrqspxjpXH1smZNeQ8CMRUO3jXs4bYvP18oQGu042jTGQ
 w8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=3HIRjv9pWAD44NbrdYQz3gAKmzA2ni91tDVTDde0Nxo=;
 b=c7ups0pD+d8hrI7SO/osSnD8C7IByf0jqNU3r94h6pz6oVk+SaQqks3qxlTG7Pb8D3
 IvLKC9MlXk2T7BlkBfwu2uKKuOZ9exdEMESckaasmY5BSgA7tLnuuZuZ3LrqIzNq6u5P
 ZgvNBEaClLIzNNNyRHFCK5wLMkCEAOCIEO7Lu1J4eDuWjyOdqt48mCQ5qzDcxDLY5CYG
 In6hsLC0J35ghLkPdF+M91XwIBKsvmmAIpPsDw5Yr/WocP3S1LO078S2eApeQinwT/YS
 AU5OrzrJA6YjSniDtfY2Tlei8s6j746Fj1wz0XzNiQjWq2QkaqKXS+RAhMPsn46gbGS8
 gFzw==
X-Gm-Message-State: AOAM530TukqGQ16Ur5PxJQqhqw0L+nvRLeqe50zG7+cBJgWUdGYsRugJ
 As0vnS+ZkhwWqGxju6LIYBEfxNWh3kxy+lDuMSvTSer4xN3cixEq
X-Google-Smtp-Source: ABdhPJz3jdlZuDv0CDtd4RXIk5enD59EY5nl1o4Wa7BOFNMBgcoJ7Lz2otZuDfqJH3OI5vhVOeLymyGyHAZWaeeAS78=
X-Received: by 2002:a6b:ea18:: with SMTP id m24mr552480ioc.76.1628446910307;
 Sun, 08 Aug 2021 11:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAHdaamO=-SY7qERamRwb+R7J3W8_71p8eeqF4MVzAA=Y=zeOww@mail.gmail.com>
 <CACjc_5o7x_zwo+bQa2ZT5YWZkWTvTthRmxLtJvZK3B9mwrQYHw@mail.gmail.com>
In-Reply-To: <CACjc_5o7x_zwo+bQa2ZT5YWZkWTvTthRmxLtJvZK3B9mwrQYHw@mail.gmail.com>
From: Ernie Carp <erniecarp2018@gmail.com>
Date: Sun, 8 Aug 2021 11:21:39 -0700
Message-ID: <CAHdaamNJF3hQsvQz5rGxn7xVkA0s+SvOowycWCaJRP1vmz1M9w@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] build error at91bootstrap3-custom
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5066522414547618536=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============5066522414547618536==
Content-Type: multipart/alternative; boundary="0000000000009fe44605c910576d"

--0000000000009fe44605c910576d
Content-Type: text/plain; charset="UTF-8"

Thank you Marecelo!

Removing  -nostartfiles  from the at91bootstrap3-custom Makefile fixed the
build error.

Again, thank you.
Regards,
Ernie.

On Sun, Aug 8, 2021 at 10:38 AM Marcelo Roberto Jimenez <
marcelo.jimenez@gmail.com> wrote:

> Hi Ernie,
>
> This is a recent change from binutils, please look at:
>
>
> https://github.com/linux4sam/at91bootstrap/commit/3207586a79aba527bbf20560930089b800f191ac
>
> Maybe also read this thread:
>
> https://github.com/linux4sam/at91bootstrap/issues/127
>
> Regards,
> Marcelo.
>
>
> On Sun, Aug 8, 2021 at 2:21 PM Ernie Carp <erniecarp2018@gmail.com> wrote:
>
>> Hello,
>>
>> I have encountered a build error when building on Centos8 for
>> atmel_sama5d27_som1_ek_mmc_dev_defconfig
>>
>> What I did was:
>>
>> git clone git://git.buildroot.net/buildroot
>> cd /buildroot
>> make atmel_sama5d27_som1_ek_mmc_dev_defconfig
>> make
>>
>> The error is below.
>>
>> >>> at91bootstrap3 custom Building
>> /usr/bin/make -j17
>> CROSS_COMPILE=/home/ernie/test/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-
>> DESTDIR=/home/ernie/test/buildroot/output/images -C
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom
>> CC
>> ========
>>   AS
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/crt0_gnu.S
>> /home/ernie/test/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
>> 10.3.0
>>
>> as FLAGS
>> ========
>> -g -Os -Wall
>> -I/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/board/sama5d27_som1_ek
>> -Iinclude -Icontrib/include -DJUMP_ADDR=0x23f00000 -DTOP_OF_MEMORY=0x210000
>> -DMACH_TYPE=9999 -DLINK_ADDR=0x200000 -Dsama5d27_som1_ek -DMACH_TYPE=9999
>> -DTOP_OF_MEMORY=0x210000 -DCRYSTAL_24_000MHZ -DSAMA5D2 -mcpu=cortex-a5
>> -mtune=cortex-a5 -DCONFIG_CPU_V7 -DCONFIG_SAMA5D27_SOM1_EK
>> -DCONFIG_PMC_COMMON
>>
>> gcc FLAGS
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/main.c
>> =========
>> -nostdinc -isystem
>> /home/ernie/test/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/10.3.0/include
>> -ffunction-sections -g -Os -Wall -mno-unaligned-access -fno-stack-protector
>> -fno-common -fno-builtin -fno-jump-tables -fno-pie
>> -I/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/board/sama5d27_som1_ek
>> -Icontrib/include -Iinclude -Ifs/include
>> -I/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/config/at91bootstrap-config
>> -DAT91BOOTSTRAP_VERSION="3.9.2" -DCOMPILE_TIME="Sat Aug  7 19:04:54 PDT
>> 2021" -DIMG_ADDRESS= -DIMG_SIZE= -DJUMP_ADDR=0x23f00000 -DOF_OFFSET=
>> -DOF_ADDRESS= -DMEM_BANK=0x20000000 -DMEM_SIZE=0x8000000
>> -DIMAGE_NAME="u-boot.bin" -DCMDLINE="" -DCMDLINE_FILE=""
>> -DTOP_OF_MEMORY=0x210000 -DMACH_TYPE=9999 -DCONFIG_DEBUG
>> -DBANNER="\n\nAT91Bootstrap " AT91BOOTSTRAP_VERSION " (" COMPILE_TIME
>> ")\n\n" -DCONFIG_HW_DISPLAY_BANNER -DCONFIG_HW_INIT -Dsama5d27_som1_ek
>> -DMACH_TYPE=9999 -DTOP_OF_MEMORY=0x210000 -DCRYSTAL_24_000MHZ -DSAMA5D2
>> -mcpu=cortex-a5 -mtune=cortex-a5 -DCONFIG_SCLK -DCONFIG_CRYSTAL_24_000MHZ
>> -DCONFIG_CPU_CLK_492MHZ -DCONFIG_BUS_SPEED_164MHZ -DCONFIG_CPU_V7
>> -DCONFIG_MATRIX -DCONFIG_REDIRECT_ALL_INTS_AIC -DCPU_HAS_H32MXDIV
>> -DCONFIG_SAMA5D27_SOM1_EK -DCONFIG_DDRC -DCONFIG_DDR2 -DCONFIG_RAM_128MB
>> -DCONFIG_SDCARD -DCONFIG_PMC_COMMON -DCONFIG_PMC_V1
>> -DCONFIG_PMC_PCLK_SAM9X5 -DCONFIG_PMC_GENERIC_CLK -DCONFIG_PMC_UTMI_CLK
>> -DCONFIG_PMC_PLL_CLK -DBOOTSTRAP_DEBUG_LEVEL=DEBUG_INFO
>> -DCONFIG_DISABLE_WATCHDOG -DCPU_HAS_PIO4 -DCONFIG_SDHC -DCONFIG_SDHC0
>> -DCONFIG_USART -DCONFIG_RSTC
>>
>> ld FLAGS
>> ========
>> -nostartfiles
>> -Map=/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/binaries/sama5d27_som1_ek-sdcardboot-uboot-3.9.2.map
>> --cref -static -T elf32-littlearm.lds --gc-sections -Ttext 0x200000
>>
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/board/sama5d27_som1_ek/sama5d27_som1_ek.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/string.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/eabi_utils.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/div.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/consttime_memequal.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/debug.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_slowclk.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/common.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_pio.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/common.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/periph-clk-sam9x5.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/generic-clk.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/utmi-clk.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/pll-clk.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_pit.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_wdt.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_usart.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_rstc.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/lp310_l2cc.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/ddramc.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/sdhc.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/mci_media.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/sdcard.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/matrix.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_aicredir.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/fs/src/ff.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/fs/src/diskio.c
>>   CC
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/fs/src/option/ccsbcs.c
>> mkdir -p
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/binaries
>>   LD        sama5d27_som1_ek-sdcardboot-uboot-3.9.2.elf
>> /home/ernie/test/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld:
>> Error: unable to disambiguate: -nostartfiles (did you mean --nostartfiles ?)
>> make[2]: *** [Makefile:328:
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/binaries/sama5d27_som1_ek-sdcardboot-uboot-3.9.2.bin]
>> Error 1
>> make[1]: *** [package/pkg-generic.mk:270:
>> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/.stamp_built]
>> Error 2
>> make: *** [Makefile:84: _all] Error 2
>> [ernie@BuildRootC8 buildroot]$
>>
>>
>> I cannot find where to fix this and could use a little help please.
>>
>> Thank you,
>> Ernie.
>>
>>
>>
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>

--0000000000009fe44605c910576d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Thank you Marecelo!<div>=
<br></div><div>Removing=C2=A0=C2=A0<span style=3D"color:rgb(36,41,46);font-=
family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot=
;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre;background-=
color:rgb(255,238,240)">-</span><span class=3D"gmail-x gmail-x-first gmail-=
x-last" style=3D"box-sizing:border-box;border-radius:0.2em;color:rgb(36,41,=
46);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Conso=
las,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre">n=
ostartfiles</span>=C2=A0 from the=C2=A0at91bootstrap3-custom=C2=A0Makefile =
fixed the build error.</div><div><br></div><div>Again, thank you.</div><div=
>Regards,</div><div>Ernie.</div></div></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 8, 2021 at 10:38 AM=
 Marcelo Roberto Jimenez &lt;<a href=3D"mailto:marcelo.jimenez@gmail.com">m=
arcelo.jimenez@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=C2=A0Erni=
e,</div><div><br></div><div>This is a recent change from binutils, please l=
ook at:</div><div><br></div><a href=3D"https://github.com/linux4sam/at91boo=
tstrap/commit/3207586a79aba527bbf20560930089b800f191ac" target=3D"_blank">h=
ttps://github.com/linux4sam/at91bootstrap/commit/3207586a79aba527bbf2056093=
0089b800f191ac</a><br><div><br></div><div>Maybe also read this thread:</div=
><div><br></div><div><a href=3D"https://github.com/linux4sam/at91bootstrap/=
issues/127" target=3D"_blank">https://github.com/linux4sam/at91bootstrap/is=
sues/127</a><br></div><div><br></div><div>Regards,</div><div>Marcelo.</div>=
<div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Aug 8, 2021 at 2:21 PM Ernie Carp &lt;<a href=3D"ma=
ilto:erniecarp2018@gmail.com" target=3D"_blank">erniecarp2018@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr">Hello,<div><br></div><div>I have encountered a build error when build=
ing on Centos8 for atmel_sama5d27_som1_ek_mmc_dev_defconfig</div><div><br><=
/div><div>What I did was:</div><div><br></div><div>git clone git://<a href=
=3D"http://git.buildroot.net/buildroot" target=3D"_blank">git.buildroot.net=
/buildroot</a><br></div><div>cd /buildroot</div><div>make atmel_sama5d27_so=
m1_ek_mmc_dev_defconfig<br></div><div>make</div><div><br></div><div>The err=
or is below.</div><div><br></div><div><div>&gt;&gt;&gt; at91bootstrap3 cust=
om Building</div><div>/usr/bin/make -j17 CROSS_COMPILE=3D/home/ernie/test/b=
uildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf- DESTDIR=3D/ho=
me/ernie/test/buildroot/output/images -C /home/ernie/test/buildroot/output/=
build/at91bootstrap3-custom</div><div>CC</div><div>=3D=3D=3D=3D=3D=3D=3D=3D=
</div><div>=C2=A0 AS=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/=
output/build/at91bootstrap3-custom/crt0_gnu.S</div><div>/home/ernie/test/bu=
ildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc 10.3.0</div=
><div><br></div><div>as FLAGS</div><div>=3D=3D=3D=3D=3D=3D=3D=3D</div><div>=
-g -Os -Wall -I/home/ernie/test/buildroot/output/build/at91bootstrap3-custo=
m/board/sama5d27_som1_ek -Iinclude -Icontrib/include -DJUMP_ADDR=3D0x23f000=
00 -DTOP_OF_MEMORY=3D0x210000 -DMACH_TYPE=3D9999 -DLINK_ADDR=3D0x200000 -Ds=
ama5d27_som1_ek -DMACH_TYPE=3D9999 -DTOP_OF_MEMORY=3D0x210000 -DCRYSTAL_24_=
000MHZ -DSAMA5D2 -mcpu=3Dcortex-a5 -mtune=3Dcortex-a5 -DCONFIG_CPU_V7 -DCON=
FIG_SAMA5D27_SOM1_EK -DCONFIG_PMC_COMMON</div><div><br></div><div>gcc FLAGS=
</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/=
output/build/at91bootstrap3-custom/main.c</div><div>=3D=3D=3D=3D=3D=3D=3D=
=3D=3D</div><div>-nostdinc -isystem /home/ernie/test/buildroot/output/host/=
lib/gcc/arm-buildroot-linux-uclibcgnueabihf/10.3.0/include -ffunction-secti=
ons -g -Os -Wall -mno-unaligned-access -fno-stack-protector -fno-common -fn=
o-builtin -fno-jump-tables -fno-pie -I/home/ernie/test/buildroot/output/bui=
ld/at91bootstrap3-custom/board/sama5d27_som1_ek -Icontrib/include -Iinclude=
 -Ifs/include -I/home/ernie/test/buildroot/output/build/at91bootstrap3-cust=
om/config/at91bootstrap-config -DAT91BOOTSTRAP_VERSION=3D&quot;3.9.2&quot; =
-DCOMPILE_TIME=3D&quot;Sat Aug=C2=A0 7 19:04:54 PDT 2021&quot; -DIMG_ADDRES=
S=3D -DIMG_SIZE=3D -DJUMP_ADDR=3D0x23f00000 -DOF_OFFSET=3D -DOF_ADDRESS=3D =
-DMEM_BANK=3D0x20000000 -DMEM_SIZE=3D0x8000000 -DIMAGE_NAME=3D&quot;u-boot.=
bin&quot; -DCMDLINE=3D&quot;&quot; -DCMDLINE_FILE=3D&quot;&quot; -DTOP_OF_M=
EMORY=3D0x210000 -DMACH_TYPE=3D9999 -DCONFIG_DEBUG -DBANNER=3D&quot;\n\nAT9=
1Bootstrap &quot; AT91BOOTSTRAP_VERSION &quot; (&quot; COMPILE_TIME &quot;)=
\n\n&quot; -DCONFIG_HW_DISPLAY_BANNER -DCONFIG_HW_INIT -Dsama5d27_som1_ek -=
DMACH_TYPE=3D9999 -DTOP_OF_MEMORY=3D0x210000 -DCRYSTAL_24_000MHZ -DSAMA5D2 =
-mcpu=3Dcortex-a5 -mtune=3Dcortex-a5 -DCONFIG_SCLK -DCONFIG_CRYSTAL_24_000M=
HZ -DCONFIG_CPU_CLK_492MHZ -DCONFIG_BUS_SPEED_164MHZ -DCONFIG_CPU_V7 -DCONF=
IG_MATRIX -DCONFIG_REDIRECT_ALL_INTS_AIC -DCPU_HAS_H32MXDIV -DCONFIG_SAMA5D=
27_SOM1_EK -DCONFIG_DDRC -DCONFIG_DDR2 -DCONFIG_RAM_128MB -DCONFIG_SDCARD -=
DCONFIG_PMC_COMMON -DCONFIG_PMC_V1 -DCONFIG_PMC_PCLK_SAM9X5 -DCONFIG_PMC_GE=
NERIC_CLK -DCONFIG_PMC_UTMI_CLK -DCONFIG_PMC_PLL_CLK -DBOOTSTRAP_DEBUG_LEVE=
L=3DDEBUG_INFO -DCONFIG_DISABLE_WATCHDOG -DCPU_HAS_PIO4 -DCONFIG_SDHC -DCON=
FIG_SDHC0 -DCONFIG_USART -DCONFIG_RSTC</div><div><br></div><div>ld FLAGS</d=
iv><div>=3D=3D=3D=3D=3D=3D=3D=3D</div><div>-nostartfiles -Map=3D/home/ernie=
/test/buildroot/output/build/at91bootstrap3-custom/binaries/sama5d27_som1_e=
k-sdcardboot-uboot-3.9.2.map --cref -static -T elf32-littlearm.lds --gc-sec=
tions -Ttext 0x200000</div><div><br></div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/bo=
ard/sama5d27_som1_ek/sama5d27_som1_ek.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom=
/lib/string.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/te=
st/buildroot/output/build/at91bootstrap3-custom/lib/eabi_utils.c</div><div>=
=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/buil=
d/at91bootstrap3-custom/lib/div.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/co=
nsttime_memequal.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ern=
ie/test/buildroot/output/build/at91bootstrap3-custom/driver/debug.c</div><d=
iv>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/b=
uild/at91bootstrap3-custom/driver/at91_slowclk.c</div><div>=C2=A0 CC=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3=
-custom/driver/common.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /hom=
e/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_pio.c=
</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/=
output/build/at91bootstrap3-custom/driver/pmc/common.c</div><div>=C2=A0 CC=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91boo=
tstrap3-custom/driver/pmc/periph-clk-sam9x5.c</div><div>=C2=A0 CC=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-cu=
stom/driver/pmc/generic-clk.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pm=
c/utmi-clk.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/tes=
t/buildroot/output/build/at91bootstrap3-custom/driver/pmc/pll-clk.c</div><d=
iv>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/b=
uild/at91bootstrap3-custom/driver/at91_pit.c</div><div>=C2=A0 CC=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-cu=
stom/driver/at91_wdt.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home=
/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_usart.=
c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot=
/output/build/at91bootstrap3-custom/driver/at91_rstc.c</div><div>=C2=A0 CC=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91boo=
tstrap3-custom/driver/lp310_l2cc.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver=
/ddramc.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/b=
uildroot/output/build/at91bootstrap3-custom/driver/sdhc.c</div><div>=C2=A0 =
CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91b=
ootstrap3-custom/driver/mci_media.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/drive=
r/sdcard.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/=
buildroot/output/build/at91bootstrap3-custom/driver/matrix.c</div><div>=C2=
=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/a=
t91bootstrap3-custom/driver/at91_aicredir.c</div><div>=C2=A0 CC=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-cu=
stom/fs/src/ff.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie=
/test/buildroot/output/build/at91bootstrap3-custom/fs/src/diskio.c</div><di=
v>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/bu=
ild/at91bootstrap3-custom/fs/src/option/ccsbcs.c</div><div>mkdir -p /home/e=
rnie/test/buildroot/output/build/at91bootstrap3-custom/binaries</div><div>=
=C2=A0 LD=C2=A0 =C2=A0 =C2=A0 =C2=A0 sama5d27_som1_ek-sdcardboot-uboot-3.9.=
2.elf</div><div>/home/ernie/test/buildroot/output/host/bin/arm-buildroot-li=
nux-uclibcgnueabihf-ld: Error: unable to disambiguate: -nostartfiles (did y=
ou mean --nostartfiles ?)</div><div>make[2]: *** [Makefile:328: /home/ernie=
/test/buildroot/output/build/at91bootstrap3-custom/binaries/sama5d27_som1_e=
k-sdcardboot-uboot-3.9.2.bin] Error 1</div><div>make[1]: *** [package/<a hr=
ef=3D"http://pkg-generic.mk:270" target=3D"_blank">pkg-generic.mk:270</a>: =
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/.stamp_built]=
 Error 2</div><div>make: *** [Makefile:84: _all] Error 2</div><div>[ernie@B=
uildRootC8 buildroot]$=C2=A0</div></div><div><br></div><div><br></div><div>=
I cannot find where to fix this and could use a little help please.</div><d=
iv><br></div><div>Thank you,</div><div>Ernie.</div><div><br></div><div><br>=
</div><div><br></div><div><br></div><div><br></div></div></div></div></div>=
</div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">buildroot@busybo=
x.net</a><br>
<a href=3D"http://lists.busybox.net/mailman/listinfo/buildroot" rel=3D"nore=
ferrer" target=3D"_blank">http://lists.busybox.net/mailman/listinfo/buildro=
ot</a><br>
</blockquote></div>
</div>
</blockquote></div>

--0000000000009fe44605c910576d--

--===============5066522414547618536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============5066522414547618536==--
