Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4664C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 20:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5645981319;
	Tue, 13 Dec 2022 20:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5645981319
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 92D1X3y4ICHj; Tue, 13 Dec 2022 20:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C28EB812C1;
	Tue, 13 Dec 2022 20:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C28EB812C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0FA91BF301
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BDEB812C1
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BDEB812C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cpmAfdvIFZGo for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 20:10:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BEB4812BE
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BEB4812BE
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 20:10:07 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id b2so39420394eja.7
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 12:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YAb3oSrdwbXyjPRQeJwXwQuAfp7jGuwiZcd6yrct9hg=;
 b=ElaSucvAkKc0GUsG3y38eW6x4ALcxrwjzveeH5fH9XpJGlRAXq1xbHArqwguDhzcfQ
 q04X2+UZ+UMBCVYRqp/yWUx6f/CzkBorTqElsoz6d9r8D2iJiSx2a8gxpN3QT1uzGWrO
 M6jvpnEll9V6FztGhbGf0Q2/yKKvyevOVWYr75iagcH9EtKpUPo9H4RJlkAcuAhF3uOL
 IROrCpAySIO/U7LS/RYVsraJcGYzLZipkLHirEtM4YLiu1jK5b6FRsLdoxWZ74+SPY4x
 iq65hzIiST6eXLaJ2rJNDJt6Tz9wQCuhWW5JD3t1VFGjUa49L/mTx9IrWn3Zu5p/gS4M
 ojwA==
X-Gm-Message-State: ANoB5plB/wlG7EhcdFiJyo7CTW/Kb0tv8H8b5GvrRPrQXBIN3lX5l69l
 gC/Gu2rXh3RQeMR8/OOuAXYCVAyzemAXdkZQp54M1agd
X-Google-Smtp-Source: AA0mqf77HS0H50bHN4opur71MaSk+AqCjHzUPU1qKMuiLg5IW2iagD8I3283rxrVJpWZoqEY/creH6OUaHQUToOhBLY=
X-Received: by 2002:a17:906:bce9:b0:7ad:960d:3a4d with SMTP id
 op9-20020a170906bce900b007ad960d3a4dmr62121658ejb.522.1670962205402; Tue, 13
 Dec 2022 12:10:05 -0800 (PST)
MIME-Version: 1.0
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
 <87359lytkg.fsf@dell.be.48ers.dk>
 <_Xy-l8Ny6TGT7WRiixo_CPZYHzdUIuGYexyAlFzMnPCN0loQWU_ydtPGjnGDOAPHohUUzztFqL1rbhYa5bVk7cO2NN6fK_cUPe8cL4MiTMo=@troodon-software.com>
 <87pmcoy07y.fsf@dell.be.48ers.dk>
In-Reply-To: <87pmcoy07y.fsf@dell.be.48ers.dk>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Tue, 13 Dec 2022 22:09:54 +0200
Message-ID: <CA+fTLhg18JH_4FzrFQP2cEQEmG3=CKBc3wntbYhrd9nT+_0Pow@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YAb3oSrdwbXyjPRQeJwXwQuAfp7jGuwiZcd6yrct9hg=;
 b=RQfGBRNwJQ5yRod2r1NEA9Crd/CzftejKNBUu1RT+ZEVovv2skXqC+jcIEUM33TPec
 HdZblyzhVFwTMyoWNVZUA5+MAq+LZZQylh0vG8gluOg277lqp4/v3CKSVGzYsXhD03Vx
 hdflZohX/QFvG5AmN5aIKhb8OPeqG+p0vIa0tj2fBwLLZImfu92Hdi7J8DrX59H2ch54
 gOrMor5GgHjIkWpSnINNNSF/KaDvifj7QLZJ1wFq5OoUczWbGyRQv5x2qH9fKQj6jD02
 5ybwdPpR1lW7PiM2imDOiarG0F2zcjtCYMR4VZXsbdwN9C4Du+afVOPkIvJLe4AFNs0f
 T88A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RQfGBRNw
Subject: Re: [Buildroot] [PATCH 1/5] configs/nezha_defconfig: bump versions
 for uboot, sbi and linux kernel
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8332777965369809179=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8332777965369809179==
Content-Type: multipart/alternative; boundary="000000000000afabe005efbb34b2"

--000000000000afabe005efbb34b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Peter Korsgaard (<peter@korsgaard.com>) kirjutas kuup=C3=A4eval E, =
12.
detsember 2022 kell 19:56:

> >>>>> "Frank" =3D=3D Frank Hunleth <fhunleth@troodon-software.com> writes=
:
>
> Hi,
>
>  >> >>>>> "Indrek" =3D=3D Indrek Kruusa indrek.kruusa@gmail.com writes:
>  >>
>  >> > BR2_TARGET_OPENSBI=3Dy
>  >>
>  >> > BR2_TARGET_OPENSBI_CUSTOM_TARBALL=3Dy
>  >>
>  >> > -BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=3D"$(call
>  >> >
> github,smaeul,opensbi,e6793dc36a71537023f078034fe795c64a9992a3)/opensbi-e=
6793dc36a71537023f078034fe795c64a9992a3.tar.gz"
>  >>
>  >> > +BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=3D"$(call
>  >> >
> github,smaeul,opensbi,5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3)/opensbi-5=
307908fb651a01cc6a2f3fd9fc7b9b471bbccb3.tar.gz"
>  >>
>  >>
>  >> Why still use this custom opensbi? There is D1 support in version 1.1
> as
>  >> mentioned on https://linux-sunxi.org/Allwinner_Nezha
>  >>
>
>  > Just in case it helps, I've been testing both the Korsgaard and Kruusa
>  > patches on a MangoPI MQ Pro. This board is close, but not exactly like
>  > the Nezha, so I expect differences.
>
>  > Using OpenSBI 1.1 results in a non-booting Linux kernel for me. Here's
> the error:
>
> Just to be sure, is this with the 5.19 based kernel we used to use
> (fe178cf0153d98b71cb01a46c8cc050826a17e77) or the "new" 6.1-rc3 based
> one (ca67838d84af4c9f85d06311c9e98e1adf46308f)?
>
>
>  > Unhandled exception: Store/AMO access fault
>  > EPC: 000000005ff8f838 RA: 000000005ffb6346 TVAL: 0000000040040000
>  > EPC: 0000000042e01838 RA: 0000000042e28346 reloc adjusted
>
>  > Code: b383 0385 be03 0405 be83 0485 bf03 0505 (e110)
>
> Sounds like access to an invalid address to me. When does this trigger?
> Early doing Linux boot?
>
> I see the mangopi mq-pro only has 512MB RAM. 0x5xxx.xxxx is at the very
> end of that (memory starts at 0x4xxx.xxxx), did you update the memory
> size in the device tree passed to OpenSBI?
>
> I just did a clean rebuild of nezha_defconfig here, and it boots without
> any issues:
>
> U-Boot SPL 2022.10 (Dec 12 2022 - 17:20:45 +0100)
> sunxi_ram_probe: dram-controller@3102000: probing
> DRAM only have internal ZQ!!
> ddr_efuse_type: 0x0
> [AUTO DEBUG] two rank and full DQ!
> ddr_efuse_type: 0x0
> [AUTO DEBUG] rank 0 row =3D 15
> [AUTO DEBUG] rank 0 bank =3D 8
> [AUTO DEBUG] rank 0 page size =3D 2 KB
> [AUTO DEBUG] rank 1 row =3D 15
> [AUTO DEBUG] rank 1 bank =3D 8
> [AUTO DEBUG] rank 1 page size =3D 2 KB
> rank1 config same as rank0
> DRAM BOOT DRIVE INFO: V0.24
> DRAM CLK =3D 792 MHz
> DRAM Type =3D 3 (2:DDR2,3:DDR3)
> DRAMC ZQ value: 0x7b7bfb
> DRAM ODT value: 0x42.
> ddr_efuse_type: 0x0
> DRAM SIZE =3D1024 M
> DRAM simple test OK.
> mxstatus=3D0xc0408000 mhcr=3D0x00000109 mcor=3D0x00000003 mhint=3D0x00004=
000
> Trying to boot from MMC1
> PLL reg =3D 0xf8216300, freq =3D 1200000000
> SPL size =3D 81920, sector =3D 160
> sunxi_ram_get_info: dram-controller@3102000: getting info
>
> OpenSBI v1.1
>    ____                    _____ ____ _____
>   / __ \                  / ____|  _ \_   _|
>  | |  | |_ __   ___ _ __ | (___ | |_) || |
>  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>  | |__| | |_) |  __/ | | |____) | |_) || |_
>   \____/| .__/ \___|_| |_|_____/|____/_____|
>         | |
>         |_|
>
> Platform Name             : Allwinner D1 Nezha
> Platform Features         : medeleg
> Platform HART Count       : 1
> Platform IPI Device       : ---
> Platform Timer Device     : --- @ 0Hz
> Platform Console Device   : uart8250
> Platform HSM Device       : sun20i-d1-ppu
> Platform Reboot Device    : sunxi-wdt-reset
> Platform Shutdown Device  : ---
> Firmware Base             : 0x40000000
> Firmware Size             : 288 KB
> Runtime SBI Version       : 1.0
>
> Domain0 Name              : root
> Domain0 Boot HART         : 0
> Domain0 HARTs             : 0*
> Domain0 Region00          : 0x0000000040000000-0x000000004007ffff ()
> Domain0 Region01          : 0x0000000000000000-0xffffffffffffffff (R,W,X)
> Domain0 Next Address      : 0x0000000042e00000
> Domain0 Next Arg1         : 0x0000000042e8b978
> Domain0 Next Mode         : S-mode
> Domain0 SysReset          : yes
>
> Boot HART ID              : 0
> Boot HART Domain          : root
> Boot HART Priv Version    : v1.11
> Boot HART Base ISA        : rv64imafdcvx
> Boot HART ISA Extensions  : time
> Boot HART PMP Count       : 8
> Boot HART PMP Granularity : 2048
> Boot HART PMP Address Bits: 38
> Boot HART MHPM Count      : 0
> Boot HART MIDELEG         : 0x0000000000000222
> Boot HART MEDELEG         : 0x000000000000b109
> sunxi_set_gate: (CLK#24) unhandled
>
>
> U-Boot 2022.10 (Dec 12 2022 - 17:20:45 +0100) Allwinner Technology
>
> ..
>
> Starting kernel ...
>
> [    0.000000] Linux version 6.1.0-rc3 (peko@dell)
> (riscv64-buildroot-linux-gnu-gcc.br_real (Buildroot
> 2022.11-477-g5cb74c92f7) 11.3.0, GNU ld (GNU Binutils) 2.38) #1 PREEMPT M=
on
> Dec 12 17:28:21 CET 2022
>
> ..
>
> # uptime
>  00:07:05 up 6 min,  load average: 0.00, 0.00, 0.00
>

I also did a clean build with Peter's patches and the Lichee RV dock is
fine with it. Some snippets from output below. I will drop my patch series
as Peter's series is superior.

U-Boot SPL 2022.10 (Dec 13 2022 - 21:00:50 +0200)
sunxi_ram_probe: dram-controller@3102000: probing
DRAM only have internal ZQ!!
ddr_efuse_type: 0x0
[AUTO DEBUG] single rank and full DQ!
ddr_efuse_type: 0x0
[AUTO DEBUG] rank 0 row =3D 15
[AUTO DEBUG] rank 0 bank =3D 8
[AUTO DEBUG] rank 0 page size =3D 2 KB
DRAM BOOT DRIVE INFO: V0.24
DRAM CLK =3D 792 MHz
DRAM Type =3D 3 (2:DDR2,3:DDR3)
DRAMC ZQ value: 0x7b7bfb
DRAM ODT value: 0x42.
ddr_efuse_type: 0x0
DRAM SIZE =3D512 M
DRAM simple test OK.
mxstatus=3D0xc0408000 mhcr=3D0x00000109 mcor=3D0x00000003 mhint=3D0x0000400=
0
Trying to boot from MMC1
PLL reg =3D 0xf8216300, freq =3D 1200000000
SPL size =3D 81920, sector =3D 160
sunxi_ram_get_info: dram-controller@3102000: getting info

OpenSBI v1.1
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name             : Allwinner D1 Nezha
Platform Features         : medeleg
Platform HART Count       : 1
Platform IPI Device       : ---
Platform Timer Device     : --- @ 0Hz
Platform Console Device   : uart8250
Platform HSM Device       : sun20i-d1-ppu
Platform Reboot Device    : sunxi-wdt-reset
Platform Shutdown Device  : ---
Firmware Base             : 0x40000000
Firmware Size             : 288 KB
Runtime SBI Version       : 1.0

...

U-Boot 2022.10 (Dec 13 2022 - 21:00:50 +0200) Allwinner Technology

DRAM:  512 MiB
sunxi_set_gate: (CLK#24) unhandled
Core:  54 devices, 20 uclasses, devicetree: separate

...

Moving Image from 0x41000000 to 0x40200000, end=3D4162d000
## Flattened Device Tree blob at 5fd3e320
   Booting using the fdt blob at 0x5fd3e320
Working FDT set to 5fd3e320
   Loading Device Tree to 0000000042df2000, end 0000000042dffa9f ... OK
Working FDT set to 42df2000

Starting kernel ...

[    0.000000] Linux version 6.1.0-rc3 (indrek@stuudio)
(riscv64-buildroot-linux-gnu-gcc.br_real (Buildroot
2022.11-518-gd3d1d5a2da-dirty) 11.3.0, GNU ld (GNU Binutils) 2.38) #1
PREEMPT Tue Dec 13 21:06:48 EET 2022
[    0.000000] OF: fdt: Ignoring memory range 0x40000000 - 0x40200000
[    0.000000] Machine model: Allwinner D1 Nezha

...

# uptime
 00:32:39 up 32 min,  load average: 0.00, 0.00, 0.00

# cat /proc/iomem
02000000-020007ff : 2000000.pinctrl pinctrl@2000000
02000c00-02000fff : 2000c00.pwm pwm@2000c00
02001000-02001fff : 2001000.clock-controller clock-controller@2001000
02008000-020083ff : 2008000.led-controller led-controller@2008000
02009400-020097ff : 2009400.temperature-sensor temperature-sensor@2009400
02009800-02009bff : 2009800.keys keys@2009800
02010000-0201ffff : 2010000.iommu iommu@2010000
02030000-02030fff : 2030000.audio-codec audio-codec@2030000
02500000-0250001f : serial
02500400-0250041f : serial
02502800-02502bff : 2502800.i2c i2c@2502800
03000000-03000fff : 3000000.syscon syscon@3000000
03002000-03002fff : 3002000.dma-controller dma-controller@3002000
03006000-03006fff : 3006000.efuse efuse@3006000
03040000-030407ff : 3040000.crypto crypto@3040000
04020000-04020fff : 4020000.mmc mmc@4020000
04021000-04021fff : 4021000.mmc mmc@4021000
04025000-04025fff : 4025000.spi spi@4025000
04026000-04026fff : 4026000.spi spi@4026000
04100000-041003ff : usb@4100000
  04100000-041003ff : musb-hdrc.4.auto usb@4100000
04100400-041004ff : 4100400.phy phy_ctrl
04101000-041010ff : 4101000.usb usb@4101000
04101400-041014ff : 4101400.usb usb@4101400
04101800-041018ff : 4100400.phy pmu0
04200000-042000ff : 4200000.usb usb@4200000
04200400-042004ff : 4200400.usb usb@4200400
04200800-042008ff : 4100400.phy pmu1
05000000-0500ffff : 5000000.clock-controller clock-controller@5000000
05100000-051fffff : 5100000.mixer mixer@5100000
05200000-052fffff : 5200000.mixer mixer@5200000
05451000-05451fff : 5451000.phy phy@5451000
05460000-05460fff : 5460000.tcon-top tcon-top@5460000
05461000-05461fff : 5461000.lcd-controller lcd-controller@5461000
05470000-05470fff : 5470000.lcd-controller lcd-controller@5470000
05500000-0550ffff : 5500000.hdmi hdmi@5500000
05510000-0551ffff : 5510000.phy phy@5510000
06011000-0601101f : 6011000.watchdog watchdog@6011000
07010000-070103ff : 7010000.clock-controller clock-controller@7010000
07090000-070903ff : 7090000.rtc rtc@7090000
40000000-4007ffff : Reserved
40200000-5fffffff : System RAM
  40202000-4162c4cb : Kernel image
    40202000-409df031 : Kernel code
    40e00000-411fffff : Kernel rodata
    41400000-415dafff : Kernel data
    415db000-4162c4cb : Kernel bss



>
> --
> Bye, Peter Korsgaard
>

--000000000000afabe005efbb34b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Kontakt Peter Korsgaard (&lt;<a href=3D"m=
ailto:peter@korsgaard.com" target=3D"_blank">peter@korsgaard.com</a>&gt;) k=
irjutas kuup=C3=A4eval E, 12. detsember 2022 kell 19:56:<br></div><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;&gt=
;&gt;&gt;&gt; &quot;Frank&quot; =3D=3D Frank Hunleth &lt;<a href=3D"mailto:=
fhunleth@troodon-software.com" target=3D"_blank">fhunleth@troodon-software.=
com</a>&gt; writes:<br>
<br>
Hi,<br>
<br>
=C2=A0&gt;&gt; &gt;&gt;&gt;&gt;&gt; &quot;Indrek&quot; =3D=3D Indrek Kruusa=
 <a href=3D"mailto:indrek.kruusa@gmail.com" target=3D"_blank">indrek.kruusa=
@gmail.com</a> writes:<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; &gt; BR2_TARGET_OPENSBI=3Dy<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; &gt; BR2_TARGET_OPENSBI_CUSTOM_TARBALL=3Dy<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; &gt; -BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=3D&quot;$(c=
all<br>
=C2=A0&gt;&gt; &gt; github,smaeul,opensbi,e6793dc36a71537023f078034fe795c64=
a9992a3)/opensbi-e6793dc36a71537023f078034fe795c64a9992a3.tar.gz&quot;<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; &gt; +BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=3D&quot;$(c=
all<br>
=C2=A0&gt;&gt; &gt; github,smaeul,opensbi,5307908fb651a01cc6a2f3fd9fc7b9b47=
1bbccb3)/opensbi-5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3.tar.gz&quot;<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; Why still use this custom opensbi? There is D1 support in ve=
rsion 1.1 as<br>
=C2=A0&gt;&gt; mentioned on <a href=3D"https://linux-sunxi.org/Allwinner_Ne=
zha" rel=3D"noreferrer" target=3D"_blank">https://linux-sunxi.org/Allwinner=
_Nezha</a><br>
=C2=A0&gt;&gt; <br>
<br>
=C2=A0&gt; Just in case it helps, I&#39;ve been testing both the Korsgaard =
and Kruusa<br>
=C2=A0&gt; patches on a MangoPI MQ Pro. This board is close, but not exactl=
y like<br>
=C2=A0&gt; the Nezha, so I expect differences.<br>
<br>
=C2=A0&gt; Using OpenSBI 1.1 results in a non-booting Linux kernel for me. =
Here&#39;s the error:<br>
<br>
Just to be sure, is this with the 5.19 based kernel we used to use<br>
(fe178cf0153d98b71cb01a46c8cc050826a17e77) or the &quot;new&quot; 6.1-rc3 b=
ased<br>
one (ca67838d84af4c9f85d06311c9e98e1adf46308f)?<br>
<br>
<br>
=C2=A0&gt; Unhandled exception: Store/AMO access fault<br>
=C2=A0&gt; EPC: 000000005ff8f838 RA: 000000005ffb6346 TVAL: 000000004004000=
0<br>
=C2=A0&gt; EPC: 0000000042e01838 RA: 0000000042e28346 reloc adjusted<br>
<br>
=C2=A0&gt; Code: b383 0385 be03 0405 be83 0485 bf03 0505 (e110)<br>
<br>
Sounds like access to an invalid address to me. When does this trigger?<br>
Early doing Linux boot?<br>
<br>
I see the mangopi mq-pro only has 512MB RAM. 0x5xxx.xxxx is at the very<br>
end of that (memory starts at 0x4xxx.xxxx), did you update the memory<br>
size in the device tree passed to OpenSBI?<br>
<br>
I just did a clean rebuild of nezha_defconfig here, and it boots without<br=
>
any issues:<br>
<br>
U-Boot SPL 2022.10 (Dec 12 2022 - 17:20:45 +0100)<br>
sunxi_ram_probe: dram-controller@3102000: probing<br>
DRAM only have internal ZQ!!<br>
ddr_efuse_type: 0x0<br>
[AUTO DEBUG] two rank and full DQ!<br>
ddr_efuse_type: 0x0<br>
[AUTO DEBUG] rank 0 row =3D 15<br>
[AUTO DEBUG] rank 0 bank =3D 8<br>
[AUTO DEBUG] rank 0 page size =3D 2 KB<br>
[AUTO DEBUG] rank 1 row =3D 15<br>
[AUTO DEBUG] rank 1 bank =3D 8<br>
[AUTO DEBUG] rank 1 page size =3D 2 KB<br>
rank1 config same as rank0<br>
DRAM BOOT DRIVE INFO: V0.24<br>
DRAM CLK =3D 792 MHz<br>
DRAM Type =3D 3 (2:DDR2,3:DDR3)<br>
DRAMC ZQ value: 0x7b7bfb<br>
DRAM ODT value: 0x42.<br>
ddr_efuse_type: 0x0<br>
DRAM SIZE =3D1024 M<br>
DRAM simple test OK.<br>
mxstatus=3D0xc0408000 mhcr=3D0x00000109 mcor=3D0x00000003 mhint=3D0x0000400=
0<br>
Trying to boot from MMC1<br>
PLL reg =3D 0xf8216300, freq =3D 1200000000<br>
SPL size =3D 81920, sector =3D 160<br>
sunxi_ram_get_info: dram-controller@3102000: getting info<br>
<br>
OpenSBI v1.1<br>
=C2=A0 =C2=A0____=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 _____ ____ _____<br>
=C2=A0 / __ \=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 / ____|=C2=A0 _ \_=C2=A0 =C2=A0_|<br>
=C2=A0| |=C2=A0 | |_ __=C2=A0 =C2=A0___ _ __ | (___ | |_) || |<br>
=C2=A0| |=C2=A0 | | &#39;_ \ / _ \ &#39;_ \ \___ \|=C2=A0 _ &lt; | |<br>
=C2=A0| |__| | |_) |=C2=A0 __/ | | |____) | |_) || |_<br>
=C2=A0 \____/| .__/ \___|_| |_|_____/|____/_____|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |_|<br>
<br>
Platform Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: Allwinner D1=
 Nezha<br>
Platform Features=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: medeleg<br>
Platform HART Count=C2=A0 =C2=A0 =C2=A0 =C2=A0: 1<br>
Platform IPI Device=C2=A0 =C2=A0 =C2=A0 =C2=A0: ---<br>
Platform Timer Device=C2=A0 =C2=A0 =C2=A0: --- @ 0Hz<br>
Platform Console Device=C2=A0 =C2=A0: uart8250<br>
Platform HSM Device=C2=A0 =C2=A0 =C2=A0 =C2=A0: sun20i-d1-ppu<br>
Platform Reboot Device=C2=A0 =C2=A0 : sunxi-wdt-reset<br>
Platform Shutdown Device=C2=A0 : ---<br>
Firmware Base=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0x40000000<b=
r>
Firmware Size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 288 KB<br>
Runtime SBI Version=C2=A0 =C2=A0 =C2=A0 =C2=A0: 1.0<br>
<br>
Domain0 Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : root<br>
Domain0 Boot HART=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0<br>
Domain0 HARTs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0*<br>
Domain0 Region00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 0x0000000040000000-0x0=
00000004007ffff ()<br>
Domain0 Region01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 0x0000000000000000-0xf=
fffffffffffffff (R,W,X)<br>
Domain0 Next Address=C2=A0 =C2=A0 =C2=A0 : 0x0000000042e00000<br>
Domain0 Next Arg1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0x0000000042e8b978<br>
Domain0 Next Mode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: S-mode<br>
Domain0 SysReset=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : yes<br>
<br>
Boot HART ID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 0<br>
Boot HART Domain=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : root<br>
Boot HART Priv Version=C2=A0 =C2=A0 : v1.11<br>
Boot HART Base ISA=C2=A0 =C2=A0 =C2=A0 =C2=A0 : rv64imafdcvx<br>
Boot HART ISA Extensions=C2=A0 : time<br>
Boot HART PMP Count=C2=A0 =C2=A0 =C2=A0 =C2=A0: 8<br>
Boot HART PMP Granularity : 2048<br>
Boot HART PMP Address Bits: 38<br>
Boot HART MHPM Count=C2=A0 =C2=A0 =C2=A0 : 0<br>
Boot HART MIDELEG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0x0000000000000222<br>
Boot HART MEDELEG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0x000000000000b109<br>
sunxi_set_gate: (CLK#24) unhandled<br>
<br>
<br>
U-Boot 2022.10 (Dec 12 2022 - 17:20:45 +0100) Allwinner Technology<br>
<br>
..<br>
<br>
Starting kernel ...<br>
<br>
[=C2=A0 =C2=A0 0.000000] Linux version 6.1.0-rc3 (peko@dell) (riscv64-build=
root-linux-gnu-gcc.br_real (Buildroot 2022.11-477-g5cb74c92f7) 11.3.0, GNU =
ld (GNU Binutils) 2.38) #1 PREEMPT Mon Dec 12 17:28:21 CET 2022<br>
<br>
..<br>
<br>
# uptime<br>
=C2=A000:07:05 up 6 min,=C2=A0 load average: 0.00, 0.00, 0.00<br></blockquo=
te><div><br></div><div>I also did a clean build with Peter&#39;s patches an=
d the Lichee RV dock is fine with it. Some snippets from output below. I wi=
ll drop my patch series as Peter&#39;s series is superior.=C2=A0</div><div>=
<br></div><div>U-Boot SPL 2022.10 (Dec 13 2022 - 21:00:50 +0200)<br>sunxi_r=
am_probe: dram-controller@3102000: probing<br>DRAM only have internal ZQ!!<=
br>ddr_efuse_type: 0x0<br>[AUTO DEBUG] single rank and full DQ!<br>ddr_efus=
e_type: 0x0<br>[AUTO DEBUG] rank 0 row =3D 15<br>[AUTO DEBUG] rank 0 bank =
=3D 8<br>[AUTO DEBUG] rank 0 page size =3D 2 KB<br>DRAM BOOT DRIVE INFO: V0=
.24<br>DRAM CLK =3D 792 MHz<br>DRAM Type =3D 3 (2:DDR2,3:DDR3)<br>DRAMC ZQ =
value: 0x7b7bfb<br>DRAM ODT value: 0x42.<br>ddr_efuse_type: 0x0<br>DRAM SIZ=
E =3D512 M<br>DRAM simple test OK.<br>mxstatus=3D0xc0408000 mhcr=3D0x000001=
09 mcor=3D0x00000003 mhint=3D0x00004000<br>Trying to boot from MMC1<br>PLL =
reg =3D 0xf8216300, freq =3D 1200000000<br>SPL size =3D 81920, sector =3D 1=
60<br>sunxi_ram_get_info: dram-controller@3102000: getting info<br><br>Open=
SBI v1.1<br>=C2=A0 =C2=A0____ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0_____ ____ _____<br>=C2=A0 / __ \ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ ____| =C2=A0_ \_ =C2=A0 _|<b=
r>=C2=A0| | =C2=A0| |_ __ =C2=A0 ___ _ __ | (___ | |_) || |<br>=C2=A0| | =
=C2=A0| | &#39;_ \ / _ \ &#39;_ \ \___ \| =C2=A0_ &lt; | |<br>=C2=A0| |__| =
| |_) | =C2=A0__/ | | |____) | |_) || |_<br>=C2=A0 \____/| .__/ \___|_| |_|=
_____/|____/_____|<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | |<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |_|<br><br>Platform Name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 : Allwinner D1 Nezha<br>Platform Features =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=
 medeleg<br>Platform HART Count =C2=A0 =C2=A0 =C2=A0 : 1<br>Platform IPI De=
vice =C2=A0 =C2=A0 =C2=A0 : ---<br>Platform Timer Device =C2=A0 =C2=A0 : --=
- @ 0Hz<br>Platform Console Device =C2=A0 : uart8250<br>Platform HSM Device=
 =C2=A0 =C2=A0 =C2=A0 : sun20i-d1-ppu<br>Platform Reboot Device =C2=A0 =C2=
=A0: sunxi-wdt-reset<br>Platform Shutdown Device =C2=A0: ---<br>Firmware Ba=
se =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 0x40000000<br>Firmware Size =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 288 KB<br>Runtime SBI Version =
=C2=A0 =C2=A0 =C2=A0 : 1.0<br><br>...<br><br>U-Boot 2022.10 (Dec 13 2022 - =
21:00:50 +0200) Allwinner Technology<br><br>DRAM: =C2=A0512 MiB<br>sunxi_se=
t_gate: (CLK#24) unhandled<br>Core: =C2=A054 devices, 20 uclasses, devicetr=
ee: separate<br><br>...<br><br>Moving Image from 0x41000000 to 0x40200000, =
end=3D4162d000<br>## Flattened Device Tree blob at 5fd3e320<br>=C2=A0 =C2=
=A0Booting using the fdt blob at 0x5fd3e320<br>Working FDT set to 5fd3e320<=
br>=C2=A0 =C2=A0Loading Device Tree to 0000000042df2000, end 0000000042dffa=
9f ... OK<br>Working FDT set to 42df2000<br><br>Starting kernel ...<br><br>=
[ =C2=A0 =C2=A00.000000] Linux version 6.1.0-rc3 (indrek@stuudio) (riscv64-=
buildroot-linux-gnu-gcc.br_real (Buildroot 2022.11-518-gd3d1d5a2da-dirty) 1=
1.3.0, GNU ld (GNU Binutils) 2.38) #1 PREEMPT Tue Dec 13 21:06:48 EET 2022<=
br>[ =C2=A0 =C2=A00.000000] OF: fdt: Ignoring memory range 0x40000000 - 0x4=
0200000<br>[ =C2=A0 =C2=A00.000000] Machine model: Allwinner D1 Nezha<br><b=
r>...<br><br># uptime<br>=C2=A000:32:39 up 32 min, =C2=A0load average: 0.00=
, 0.00, 0.00<br></div><div><br></div><div># cat /proc/iomem<br>02000000-020=
007ff : 2000000.pinctrl pinctrl@2000000<br>02000c00-02000fff : 2000c00.pwm =
pwm@2000c00<br>02001000-02001fff : 2001000.clock-controller clock-controlle=
r@2001000<br>02008000-020083ff : 2008000.led-controller led-controller@2008=
000<br>02009400-020097ff : 2009400.temperature-sensor temperature-sensor@20=
09400<br>02009800-02009bff : 2009800.keys keys@2009800<br>02010000-0201ffff=
 : 2010000.iommu iommu@2010000<br>02030000-02030fff : 2030000.audio-codec a=
udio-codec@2030000<br>02500000-0250001f : serial<br>02500400-0250041f : ser=
ial<br>02502800-02502bff : 2502800.i2c i2c@2502800<br>03000000-03000fff : 3=
000000.syscon syscon@3000000<br>03002000-03002fff : 3002000.dma-controller =
dma-controller@3002000<br>03006000-03006fff : 3006000.efuse efuse@3006000<b=
r>03040000-030407ff : 3040000.crypto crypto@3040000<br>04020000-04020fff : =
4020000.mmc mmc@4020000<br>04021000-04021fff : 4021000.mmc mmc@4021000<br>0=
4025000-04025fff : 4025000.spi spi@4025000<br>04026000-04026fff : 4026000.s=
pi spi@4026000<br>04100000-041003ff : usb@4100000<br>=C2=A0 04100000-041003=
ff : musb-hdrc.4.auto usb@4100000<br>04100400-041004ff : 4100400.phy phy_ct=
rl<br>04101000-041010ff : 4101000.usb usb@4101000<br>04101400-041014ff : 41=
01400.usb usb@4101400<br>04101800-041018ff : 4100400.phy pmu0<br>04200000-0=
42000ff : 4200000.usb usb@4200000<br>04200400-042004ff : 4200400.usb usb@42=
00400<br>04200800-042008ff : 4100400.phy pmu1<br>05000000-0500ffff : 500000=
0.clock-controller clock-controller@5000000<br>05100000-051fffff : 5100000.=
mixer mixer@5100000<br>05200000-052fffff : 5200000.mixer mixer@5200000<br>0=
5451000-05451fff : 5451000.phy phy@5451000<br>05460000-05460fff : 5460000.t=
con-top tcon-top@5460000<br>05461000-05461fff : 5461000.lcd-controller lcd-=
controller@5461000<br>05470000-05470fff : 5470000.lcd-controller lcd-contro=
ller@5470000<br>05500000-0550ffff : 5500000.hdmi hdmi@5500000<br>05510000-0=
551ffff : 5510000.phy phy@5510000<br>06011000-0601101f : 6011000.watchdog w=
atchdog@6011000<br>07010000-070103ff : 7010000.clock-controller clock-contr=
oller@7010000<br>07090000-070903ff : 7090000.rtc rtc@7090000<br>40000000-40=
07ffff : Reserved<br>40200000-5fffffff : System RAM<br>=C2=A0 40202000-4162=
c4cb : Kernel image<br>=C2=A0 =C2=A0 40202000-409df031 : Kernel code<br>=C2=
=A0 =C2=A0 40e00000-411fffff : Kernel rodata<br>=C2=A0 =C2=A0 41400000-415d=
afff : Kernel data<br>=C2=A0 =C2=A0 415db000-4162c4cb : Kernel bss<br></div=
><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div>

--000000000000afabe005efbb34b2--

--===============8332777965369809179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8332777965369809179==--
