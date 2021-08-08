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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79086C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 17:38:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3850B60F39
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 17:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3850B60F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D233182A83;
	Sun,  8 Aug 2021 17:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BahZ8phJRj6n; Sun,  8 Aug 2021 17:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABFD082AC3;
	Sun,  8 Aug 2021 17:38:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C4C51BF575
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 17:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A09D400FF
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 17:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TV4QbdIvpg7w for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 17:38:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93BAD400F2
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 17:38:08 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id t128so20271631oig.1
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 10:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q9NnJtWVD0WCx9h5g0bLsNrbIUtTfzBAY6jCCNtjjp4=;
 b=AxQodRcijvKUzThXVN7ULcNuLtDSZigq02s9WNFIpEttqEYDcOL4ksTGa2kbsm8ofO
 PMFK7v5YqWdigmjqrD36NGhfWowG3JrqkXNG96yz+Rk9J1BiJ9I07bOYMn6ntKkxwWZl
 pyhfJSKILcJLCb42VDEY8zzrgMowj9YQ3kQelaPybQ1fBztTQwfVzUZr5rSSY9P/tuhc
 eBRc+3Gwy+5VXDm9pXOoIMtMhKYqV3KnvTOVtQ94hNVacerDitRstWXQ5VhptpvJ92Po
 rkcSaMhgRYbKbP3dVPm/AXgXUQLx0wr9wlfrdUhe2DXAhkqanjt1UBSlTd2axplwxn7A
 /B8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q9NnJtWVD0WCx9h5g0bLsNrbIUtTfzBAY6jCCNtjjp4=;
 b=sGvLBGVDK+11sI4sH13l5heUtwOjP5K9JLeG+rIW2FbBxoP2+STFS2vN3pAW4hnpDQ
 LryxAUPkvfLGaKKuXT08UU21lRC19kTHQu/9FxdVncqS+EXszhi1zgrMPGuExKrSICdm
 Rga6BtMcHXHKGF4nxLoOQwRhTLZjdpubEFLYj34Z/JvKoXIa9U/Wbelc4DE3/nQZafNT
 bidmZRkg/mE9gA/yTF0zdSOAvRE4McjqYl2/6PFvMrq8zcbBNkQqUkuAGAUmvh0D5lfm
 HgpxXePchhLAkZUkgP4TORz8sSg7mQd13ugXzMRxLNl2mDtUFBdqT+KPHLFjTOwdWVT9
 iayw==
X-Gm-Message-State: AOAM533oDwFqx7bmIt2Sjkp/noajVGzbZOp5OoGF30YgXB6B2wkZVqMh
 OteJAW337bwt/yFd2Y6+sZMLeppyARklnPeIhFA=
X-Google-Smtp-Source: ABdhPJw+uMf9nxGheoaqyD+/xVqRxWe5NSUXnVa7FMY2leGtTl/cOgbkSAWhLFphpvZE9xDNL9j3MIR+5jxG6wNiUcw=
X-Received: by 2002:a05:6808:2221:: with SMTP id
 bd33mr21253887oib.23.1628444287584; 
 Sun, 08 Aug 2021 10:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHdaamO=-SY7qERamRwb+R7J3W8_71p8eeqF4MVzAA=Y=zeOww@mail.gmail.com>
In-Reply-To: <CAHdaamO=-SY7qERamRwb+R7J3W8_71p8eeqF4MVzAA=Y=zeOww@mail.gmail.com>
From: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Date: Sun, 8 Aug 2021 14:37:41 -0300
Message-ID: <CACjc_5o7x_zwo+bQa2ZT5YWZkWTvTthRmxLtJvZK3B9mwrQYHw@mail.gmail.com>
To: Ernie Carp <erniecarp2018@gmail.com>
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1060209379583995894=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============1060209379583995894==
Content-Type: multipart/alternative; boundary="0000000000004c4dc905c90fbbe6"

--0000000000004c4dc905c90fbbe6
Content-Type: text/plain; charset="UTF-8"

Hi Ernie,

This is a recent change from binutils, please look at:

https://github.com/linux4sam/at91bootstrap/commit/3207586a79aba527bbf20560930089b800f191ac

Maybe also read this thread:

https://github.com/linux4sam/at91bootstrap/issues/127

Regards,
Marcelo.


On Sun, Aug 8, 2021 at 2:21 PM Ernie Carp <erniecarp2018@gmail.com> wrote:

> Hello,
>
> I have encountered a build error when building on Centos8 for
> atmel_sama5d27_som1_ek_mmc_dev_defconfig
>
> What I did was:
>
> git clone git://git.buildroot.net/buildroot
> cd /buildroot
> make atmel_sama5d27_som1_ek_mmc_dev_defconfig
> make
>
> The error is below.
>
> >>> at91bootstrap3 custom Building
> /usr/bin/make -j17
> CROSS_COMPILE=/home/ernie/test/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-
> DESTDIR=/home/ernie/test/buildroot/output/images -C
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom
> CC
> ========
>   AS
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/crt0_gnu.S
> /home/ernie/test/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
> 10.3.0
>
> as FLAGS
> ========
> -g -Os -Wall
> -I/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/board/sama5d27_som1_ek
> -Iinclude -Icontrib/include -DJUMP_ADDR=0x23f00000 -DTOP_OF_MEMORY=0x210000
> -DMACH_TYPE=9999 -DLINK_ADDR=0x200000 -Dsama5d27_som1_ek -DMACH_TYPE=9999
> -DTOP_OF_MEMORY=0x210000 -DCRYSTAL_24_000MHZ -DSAMA5D2 -mcpu=cortex-a5
> -mtune=cortex-a5 -DCONFIG_CPU_V7 -DCONFIG_SAMA5D27_SOM1_EK
> -DCONFIG_PMC_COMMON
>
> gcc FLAGS
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/main.c
> =========
> -nostdinc -isystem
> /home/ernie/test/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/10.3.0/include
> -ffunction-sections -g -Os -Wall -mno-unaligned-access -fno-stack-protector
> -fno-common -fno-builtin -fno-jump-tables -fno-pie
> -I/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/board/sama5d27_som1_ek
> -Icontrib/include -Iinclude -Ifs/include
> -I/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/config/at91bootstrap-config
> -DAT91BOOTSTRAP_VERSION="3.9.2" -DCOMPILE_TIME="Sat Aug  7 19:04:54 PDT
> 2021" -DIMG_ADDRESS= -DIMG_SIZE= -DJUMP_ADDR=0x23f00000 -DOF_OFFSET=
> -DOF_ADDRESS= -DMEM_BANK=0x20000000 -DMEM_SIZE=0x8000000
> -DIMAGE_NAME="u-boot.bin" -DCMDLINE="" -DCMDLINE_FILE=""
> -DTOP_OF_MEMORY=0x210000 -DMACH_TYPE=9999 -DCONFIG_DEBUG
> -DBANNER="\n\nAT91Bootstrap " AT91BOOTSTRAP_VERSION " (" COMPILE_TIME
> ")\n\n" -DCONFIG_HW_DISPLAY_BANNER -DCONFIG_HW_INIT -Dsama5d27_som1_ek
> -DMACH_TYPE=9999 -DTOP_OF_MEMORY=0x210000 -DCRYSTAL_24_000MHZ -DSAMA5D2
> -mcpu=cortex-a5 -mtune=cortex-a5 -DCONFIG_SCLK -DCONFIG_CRYSTAL_24_000MHZ
> -DCONFIG_CPU_CLK_492MHZ -DCONFIG_BUS_SPEED_164MHZ -DCONFIG_CPU_V7
> -DCONFIG_MATRIX -DCONFIG_REDIRECT_ALL_INTS_AIC -DCPU_HAS_H32MXDIV
> -DCONFIG_SAMA5D27_SOM1_EK -DCONFIG_DDRC -DCONFIG_DDR2 -DCONFIG_RAM_128MB
> -DCONFIG_SDCARD -DCONFIG_PMC_COMMON -DCONFIG_PMC_V1
> -DCONFIG_PMC_PCLK_SAM9X5 -DCONFIG_PMC_GENERIC_CLK -DCONFIG_PMC_UTMI_CLK
> -DCONFIG_PMC_PLL_CLK -DBOOTSTRAP_DEBUG_LEVEL=DEBUG_INFO
> -DCONFIG_DISABLE_WATCHDOG -DCPU_HAS_PIO4 -DCONFIG_SDHC -DCONFIG_SDHC0
> -DCONFIG_USART -DCONFIG_RSTC
>
> ld FLAGS
> ========
> -nostartfiles
> -Map=/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/binaries/sama5d27_som1_ek-sdcardboot-uboot-3.9.2.map
> --cref -static -T elf32-littlearm.lds --gc-sections -Ttext 0x200000
>
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/board/sama5d27_som1_ek/sama5d27_som1_ek.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/string.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/eabi_utils.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/div.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/consttime_memequal.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/debug.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_slowclk.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/common.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_pio.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/common.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/periph-clk-sam9x5.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/generic-clk.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/utmi-clk.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/pll-clk.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_pit.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_wdt.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_usart.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_rstc.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/lp310_l2cc.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/ddramc.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/sdhc.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/mci_media.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/sdcard.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/matrix.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_aicredir.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/fs/src/ff.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/fs/src/diskio.c
>   CC
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/fs/src/option/ccsbcs.c
> mkdir -p
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/binaries
>   LD        sama5d27_som1_ek-sdcardboot-uboot-3.9.2.elf
> /home/ernie/test/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld:
> Error: unable to disambiguate: -nostartfiles (did you mean --nostartfiles ?)
> make[2]: *** [Makefile:328:
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/binaries/sama5d27_som1_ek-sdcardboot-uboot-3.9.2.bin]
> Error 1
> make[1]: *** [package/pkg-generic.mk:270:
> /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/.stamp_built]
> Error 2
> make: *** [Makefile:84: _all] Error 2
> [ernie@BuildRootC8 buildroot]$
>
>
> I cannot find where to fix this and could use a little help please.
>
> Thank you,
> Ernie.
>
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

--0000000000004c4dc905c90fbbe6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=C2=A0Ernie,</div><div><br></div><=
div>This is a recent change from binutils, please look at:</div><div><br></=
div><a href=3D"https://github.com/linux4sam/at91bootstrap/commit/3207586a79=
aba527bbf20560930089b800f191ac" target=3D"_blank">https://github.com/linux4=
sam/at91bootstrap/commit/3207586a79aba527bbf20560930089b800f191ac</a><br><d=
iv><br></div><div>Maybe also read this thread:</div><div><br></div><div><a =
href=3D"https://github.com/linux4sam/at91bootstrap/issues/127">https://gith=
ub.com/linux4sam/at91bootstrap/issues/127</a><br></div><div><br></div><div>=
Regards,</div><div>Marcelo.</div><div><br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 8, 2021 at 2:21=
 PM Ernie Carp &lt;<a href=3D"mailto:erniecarp2018@gmail.com" target=3D"_bl=
ank">erniecarp2018@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"l=
tr"><div dir=3D"ltr"><div dir=3D"ltr">Hello,<div><br></div><div>I have enco=
untered a build error when building on Centos8 for atmel_sama5d27_som1_ek_m=
mc_dev_defconfig</div><div><br></div><div>What I did was:</div><div><br></d=
iv><div>git clone git://<a href=3D"http://git.buildroot.net/buildroot" targ=
et=3D"_blank">git.buildroot.net/buildroot</a><br></div><div>cd /buildroot</=
div><div>make atmel_sama5d27_som1_ek_mmc_dev_defconfig<br></div><div>make</=
div><div><br></div><div>The error is below.</div><div><br></div><div><div>&=
gt;&gt;&gt; at91bootstrap3 custom Building</div><div>/usr/bin/make -j17 CRO=
SS_COMPILE=3D/home/ernie/test/buildroot/output/host/bin/arm-buildroot-linux=
-uclibcgnueabihf- DESTDIR=3D/home/ernie/test/buildroot/output/images -C /ho=
me/ernie/test/buildroot/output/build/at91bootstrap3-custom</div><div>CC</di=
v><div>=3D=3D=3D=3D=3D=3D=3D=3D</div><div>=C2=A0 AS=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/crt0_gnu.=
S</div><div>/home/ernie/test/buildroot/output/host/bin/arm-buildroot-linux-=
uclibcgnueabihf-gcc 10.3.0</div><div><br></div><div>as FLAGS</div><div>=3D=
=3D=3D=3D=3D=3D=3D=3D</div><div>-g -Os -Wall -I/home/ernie/test/buildroot/o=
utput/build/at91bootstrap3-custom/board/sama5d27_som1_ek -Iinclude -Icontri=
b/include -DJUMP_ADDR=3D0x23f00000 -DTOP_OF_MEMORY=3D0x210000 -DMACH_TYPE=
=3D9999 -DLINK_ADDR=3D0x200000 -Dsama5d27_som1_ek -DMACH_TYPE=3D9999 -DTOP_=
OF_MEMORY=3D0x210000 -DCRYSTAL_24_000MHZ -DSAMA5D2 -mcpu=3Dcortex-a5 -mtune=
=3Dcortex-a5 -DCONFIG_CPU_V7 -DCONFIG_SAMA5D27_SOM1_EK -DCONFIG_PMC_COMMON<=
/div><div><br></div><div>gcc FLAGS</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/main.c=
</div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div>-nostdinc -isystem /home/e=
rnie/test/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf=
/10.3.0/include -ffunction-sections -g -Os -Wall -mno-unaligned-access -fno=
-stack-protector -fno-common -fno-builtin -fno-jump-tables -fno-pie -I/home=
/ernie/test/buildroot/output/build/at91bootstrap3-custom/board/sama5d27_som=
1_ek -Icontrib/include -Iinclude -Ifs/include -I/home/ernie/test/buildroot/=
output/build/at91bootstrap3-custom/config/at91bootstrap-config -DAT91BOOTST=
RAP_VERSION=3D&quot;3.9.2&quot; -DCOMPILE_TIME=3D&quot;Sat Aug=C2=A0 7 19:0=
4:54 PDT 2021&quot; -DIMG_ADDRESS=3D -DIMG_SIZE=3D -DJUMP_ADDR=3D0x23f00000=
 -DOF_OFFSET=3D -DOF_ADDRESS=3D -DMEM_BANK=3D0x20000000 -DMEM_SIZE=3D0x8000=
000 -DIMAGE_NAME=3D&quot;u-boot.bin&quot; -DCMDLINE=3D&quot;&quot; -DCMDLIN=
E_FILE=3D&quot;&quot; -DTOP_OF_MEMORY=3D0x210000 -DMACH_TYPE=3D9999 -DCONFI=
G_DEBUG -DBANNER=3D&quot;\n\nAT91Bootstrap &quot; AT91BOOTSTRAP_VERSION &qu=
ot; (&quot; COMPILE_TIME &quot;)\n\n&quot; -DCONFIG_HW_DISPLAY_BANNER -DCON=
FIG_HW_INIT -Dsama5d27_som1_ek -DMACH_TYPE=3D9999 -DTOP_OF_MEMORY=3D0x21000=
0 -DCRYSTAL_24_000MHZ -DSAMA5D2 -mcpu=3Dcortex-a5 -mtune=3Dcortex-a5 -DCONF=
IG_SCLK -DCONFIG_CRYSTAL_24_000MHZ -DCONFIG_CPU_CLK_492MHZ -DCONFIG_BUS_SPE=
ED_164MHZ -DCONFIG_CPU_V7 -DCONFIG_MATRIX -DCONFIG_REDIRECT_ALL_INTS_AIC -D=
CPU_HAS_H32MXDIV -DCONFIG_SAMA5D27_SOM1_EK -DCONFIG_DDRC -DCONFIG_DDR2 -DCO=
NFIG_RAM_128MB -DCONFIG_SDCARD -DCONFIG_PMC_COMMON -DCONFIG_PMC_V1 -DCONFIG=
_PMC_PCLK_SAM9X5 -DCONFIG_PMC_GENERIC_CLK -DCONFIG_PMC_UTMI_CLK -DCONFIG_PM=
C_PLL_CLK -DBOOTSTRAP_DEBUG_LEVEL=3DDEBUG_INFO -DCONFIG_DISABLE_WATCHDOG -D=
CPU_HAS_PIO4 -DCONFIG_SDHC -DCONFIG_SDHC0 -DCONFIG_USART -DCONFIG_RSTC</div=
><div><br></div><div>ld FLAGS</div><div>=3D=3D=3D=3D=3D=3D=3D=3D</div><div>=
-nostartfiles -Map=3D/home/ernie/test/buildroot/output/build/at91bootstrap3=
-custom/binaries/sama5d27_som1_ek-sdcardboot-uboot-3.9.2.map --cref -static=
 -T elf32-littlearm.lds --gc-sections -Ttext 0x200000</div><div><br></div><=
div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/=
build/at91bootstrap3-custom/board/sama5d27_som1_ek/sama5d27_som1_ek.c</div>=
<div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output=
/build/at91bootstrap3-custom/lib/string.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom=
/lib/eabi_utils.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/erni=
e/test/buildroot/output/build/at91bootstrap3-custom/lib/div.c</div><div>=C2=
=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/a=
t91bootstrap3-custom/lib/consttime_memequal.c</div><div>=C2=A0 CC=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-cu=
stom/driver/debug.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/er=
nie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_slowclk.c=
</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/=
output/build/at91bootstrap3-custom/driver/common.c</div><div>=C2=A0 CC=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootst=
rap3-custom/driver/at91_pio.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pm=
c/common.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/=
buildroot/output/build/at91bootstrap3-custom/driver/pmc/periph-clk-sam9x5.c=
</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/=
output/build/at91bootstrap3-custom/driver/pmc/generic-clk.c</div><div>=C2=
=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/a=
t91bootstrap3-custom/driver/pmc/utmi-clk.c</div><div>=C2=A0 CC=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custo=
m/driver/pmc/pll-clk.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home=
/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_pit.c<=
/div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/o=
utput/build/at91bootstrap3-custom/driver/at91_wdt.c</div><div>=C2=A0 CC=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootst=
rap3-custom/driver/at91_usart.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at=
91_rstc.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/b=
uildroot/output/build/at91bootstrap3-custom/driver/lp310_l2cc.c</div><div>=
=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/buil=
d/at91bootstrap3-custom/driver/ddramc.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom=
/driver/sdhc.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/t=
est/buildroot/output/build/at91bootstrap3-custom/driver/mci_media.c</div><d=
iv>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/b=
uild/at91bootstrap3-custom/driver/sdcard.c</div><div>=C2=A0 CC=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custo=
m/driver/matrix.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/erni=
e/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_aicredir.c<=
/div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/o=
utput/build/at91bootstrap3-custom/fs/src/ff.c</div><div>=C2=A0 CC=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-cu=
stom/fs/src/diskio.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/e=
rnie/test/buildroot/output/build/at91bootstrap3-custom/fs/src/option/ccsbcs=
.c</div><div>mkdir -p /home/ernie/test/buildroot/output/build/at91bootstrap=
3-custom/binaries</div><div>=C2=A0 LD=C2=A0 =C2=A0 =C2=A0 =C2=A0 sama5d27_s=
om1_ek-sdcardboot-uboot-3.9.2.elf</div><div>/home/ernie/test/buildroot/outp=
ut/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld: Error: unable to disamb=
iguate: -nostartfiles (did you mean --nostartfiles ?)</div><div>make[2]: **=
* [Makefile:328: /home/ernie/test/buildroot/output/build/at91bootstrap3-cus=
tom/binaries/sama5d27_som1_ek-sdcardboot-uboot-3.9.2.bin] Error 1</div><div=
>make[1]: *** [package/<a href=3D"http://pkg-generic.mk:270" target=3D"_bla=
nk">pkg-generic.mk:270</a>: /home/ernie/test/buildroot/output/build/at91boo=
tstrap3-custom/.stamp_built] Error 2</div><div>make: *** [Makefile:84: _all=
] Error 2</div><div>[ernie@BuildRootC8 buildroot]$=C2=A0</div></div><div><b=
r></div><div><br></div><div>I cannot find where to fix this and could use a=
 little help please.</div><div><br></div><div>Thank you,</div><div>Ernie.</=
div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></=
div></div></div></div></div></div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">buildroot@busybo=
x.net</a><br>
<a href=3D"http://lists.busybox.net/mailman/listinfo/buildroot" rel=3D"nore=
ferrer" target=3D"_blank">http://lists.busybox.net/mailman/listinfo/buildro=
ot</a><br>
</blockquote></div>
</div>

--0000000000004c4dc905c90fbbe6--

--===============1060209379583995894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============1060209379583995894==--
