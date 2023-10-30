Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033EEC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 09:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 953E342E83;
	Mon, 30 Oct 2023 09:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 953E342E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEu-ooRH70xC; Mon, 30 Oct 2023 09:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B8A54EBB9;
	Mon, 30 Oct 2023 09:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B8A54EBB9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 380751BF4D5
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 09:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10DA2855E5
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 09:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10DA2855E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ObGmlnUUOwg5 for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 09:44:13 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7588855E1
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 09:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7588855E1
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c50305c5c4so61289031fa.1
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 02:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698659050; x=1699263850;
 h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
 :date:cc:subject:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4oZynCZ4QlOv3mAipujXsFsR8G6nQ//RE3y70KSkZTo=;
 b=OgbPRkx5gIxQU5ZnBULzIcU1Axss1Ixh3s58F04HR81QwbmHxIDpDUuOW1vaAVLXM/
 o8Z/OXOoEgJxMuv74RhtO64lAJcVjYHnLiQMvgG/8/EMdjf+r4YyNWc9GxfPxbmGeArd
 ixmEwc6P1FVjAyDNFtcKppA2OaizN20zSNq8VxCEvCVjcStMSyGTcoKcpkFzxsuI3yt1
 sG8c5S4F7yOG+71aZiesrMZtdGSDOZT+Ydglw6e6QoHzsubKnE6y48GfoXdUjDVRflDW
 qMhlVYIWrd0ssZpTElHtMnfPm+r3Emg5IPusX8gPO39jE72zYCOuhfWjtPFLitWnB+MB
 tqNA==
X-Gm-Message-State: AOJu0YzEKBCROQIyXPqJEZj9WjuTwnUvumbHIqOaBMO4dTDxqYkN3lmt
 NVoczVMLdsUFlKncJ2kM8p0=
X-Google-Smtp-Source: AGHT+IG0EN4exGWqhfGJeKgSRgxV8qVIAYfe9ZIWleLhxiemvkRjrnfRWwIVmy1GwcBQY3se27smJA==
X-Received: by 2002:a05:651c:2203:b0:2c5:1e70:7d30 with SMTP id
 y3-20020a05651c220300b002c51e707d30mr8414828ljq.30.1698659049976; 
 Mon, 30 Oct 2023 02:44:09 -0700 (PDT)
Received: from [192.168.7.144] (epd88.neoplus.adsl.tpnet.pl. [83.20.45.88])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a2eb16e000000b002c17fc97071sm1186169ljm.87.2023.10.30.02.44.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Oct 2023 02:44:09 -0700 (PDT)
From: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
To: "Edgar Bonet" <bonet@grenoble.cnrs.fr>
Date: Mon, 30 Oct 2023 09:44:07 +0000
Message-Id: <emb9adeb81-8b8a-4de4-8b7f-ab650c3ba302@9e2fe6c2.com>
In-Reply-To: <47321b8a-6e6a-43a2-b38c-bcc1defcb5c1@grenoble.cnrs.fr>
References: <em9eec97a0-87a4-4352-9e89-03948b436830@9e2fe6c2.com>
 <61e80819-c901-486c-afdd-1e69441821e2@grenoble.cnrs.fr>
 <em29cb4aaa-8ce7-4449-986c-81c594d64587@9e2fe6c2.com>
 <47321b8a-6e6a-43a2-b38c-bcc1defcb5c1@grenoble.cnrs.fr>
User-Agent: eM_Client/9.2.2093.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698659050; x=1699263850; darn=buildroot.org;
 h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
 :date:cc:subject:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4oZynCZ4QlOv3mAipujXsFsR8G6nQ//RE3y70KSkZTo=;
 b=fdjwjMc7HuyMlP4cE0dIYs67TrY3UEop6Y9JliN1Bu+v82v5ervDXK8f+CWblBAO77
 ijjDuyPlFag5Ueh29xP9wV67F1zKLFIH1LwW4gose+sWdT5kGqT6Q2995DD2CibXtLsk
 ojOaGmHB5xaFgu25Fuf3FV5V0gMsqFlhz+qYZ+SrLUQs0AWpPPPd3RAs3WNQlm288MQy
 fwrkxIXvJOOaUaUEfoK5n5CHGDyBqYlzXlxveHVipvhlPKVRMzK+Kyr3ONwA7VsJzw/b
 1SV39cOuOsWKygXzQPymsKfBdXGNuo2/2gf68QjBFkWIewDGYk62rBn0bzw6ufOhKVca
 zNlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fdjwjMc7
Subject: Re: [Buildroot] Help with DTO
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
Reply-To: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7808694351906212657=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7808694351906212657==
Content-Type: multipart/alternative;
 boundary="------=_MB1E2E0517-8E53-4321-8BD1-B9985A929F30"

--------=_MB1E2E0517-8E53-4321-8BD1-B9985A929F30
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Edgar and all,

One notable difference between them
that the latter uses the Beagleboard Linux kernel from GitHub, whereas
the former uses mainline Linux 6.0. I wonder whether this may make a
difference for you.
This was a good guess. I have re-run the config as per the tutorial,=20
from scratch, with latest kernel. The gpiodetect and gpioinfo now work:

# gpiodetect
gpiochip0 [gpio-0-31] (32 lines)
gpiochip1 [gpio-32-63] (32 lines)
gpiochip2 [gpio-64-95] (32 lines)
gpiochip3 [gpio-96-127] (32 lines)
# gpioinfo
gpiochip0 - 32 lines:
         line   0: "P8_25 [mmc1_dat0]" unused input active-high
         line   1: "[mmc1_dat1]" unused input active-high
         line   2: "P8_5 [mmc1_dat2]" unused input active-high
         line   3: "P8_6 [mmc1_dat3]" unused input active-high
         line   4: "P8_23 [mmc1_dat4]" unused input active-high
         line   5: "P8_22 [mmc1_dat5]" unused input active-high
         line   6: "P8_3 [mmc1_dat6]" unused input active-high
         line   7: "P8_4 [mmc1_dat7]" unused input active-high
         line   8:         "NC"       unused   input  active-high
         line   9:         "NC"       unused   input  active-high
         line  10:         "NC"       unused   input  active-high
         line  11:         "NC"       unused   input  active-high
         line  12:      "P8_12"       unused   input  active-high
         line  13:      "P8_11"       unused   input  active-high
         line  14:      "P8_16"       unused   input  active-high
         line  15:      "P8_15"       unused   input  active-high
         line  16:     "P9_15A"       unused   input  active-high
         line  17:      "P9_23"       unused   input  active-high
         line  18: "P9_14 [ehrpwm1a]" unused input active-high
         line  19: "P9_16 [ehrpwm1b]" unused input active-high
         line  20: "[emmc rst]"       unused   input  active-high
         line  21: "[usr0 led]"       unused   input  active-high
         line  22: "[usr1 led]"       unused   input  active-high
         line  23: "[usr2 led]"       unused   input  active-high
         line  24: "[usr3 led]"       unused   input  active-high
         line  25: "[hdmi irq]"       unused   input  active-high
         line  26: "[usb vbus oc]" unused input active-high
         line  27: "[hdmi audio]" "enable" output active-high [used]
         line  28:      "P9_12"       unused   input  active-high
         line  29:      "P8_26"       unused   input  active-high
         line  30: "P8_21 [emmc]" unused input active-high
         line  31: "P8_20 [emmc]" unused input active-high
gpiochip1 - 32 lines:
         line   0:     "P9_15B"       unused   input  active-high
         line   1:      "P8_18"       unused   input  active-high
         line   2:       "P8_7"       unused   input  active-high
         line   3:       "P8_8"       unused   input  active-high
         line   4:      "P8_10"       unused   input  active-high
         line   5:       "P8_9"       unused   input  active-high
         line   6: "P8_45 [hdmi]" unused input active-high
         line   7: "P8_46 [hdmi]" unused input active-high
         line   8: "P8_43 [hdmi]" unused input active-high
         line   9: "P8_44 [hdmi]" unused input active-high
         line  10: "P8_41 [hdmi]" unused input active-high
         line  11: "P8_42 [hdmi]" unused input active-high
         line  12: "P8_39 [hdmi]" unused input active-high
         line  13: "P8_40 [hdmi]" unused input active-high
         line  14: "P8_37 [hdmi]" unused input active-high
         line  15: "P8_38 [hdmi]" unused input active-high
         line  16: "P8_36 [hdmi]" unused input active-high
         line  17: "P8_34 [hdmi]" unused input active-high
         line  18: "[rmii1_rxd3]" unused input active-high
         line  19: "[rmii1_rxd2]" unused input active-high
         line  20: "[rmii1_rxd1]" unused input active-high
         line  21: "[rmii1_rxd0]" unused input active-high
         line  22: "P8_27 [hdmi]" unused input active-high
         line  23: "P8_29 [hdmi]" unused input active-high
         line  24: "P8_28 [hdmi]" unused input active-high
         line  25: "P8_30 [hdmi]" unused input active-high
         line  26: "[mmc0_dat3]" unused input active-high
         line  27: "[mmc0_dat2]" unused input active-high
         line  28: "[mmc0_dat1]" unused input active-high
         line  29: "[mmc0_dat0]" unused input active-high
         line  30: "[mmc0_clk]"       unused   input  active-high
         line  31: "[mmc0_cmd]"       unused   input  active-high
gpiochip2 - 32 lines:
         line   0:  "[mii col]"       unused   input  active-high
         line   1:  "[mii crs]"       unused   input  active-high
         line   2: "[mii rx err]" unused input active-high
         line   3: "[mii tx en]" unused input active-high
         line   4: "[mii rx dv]" unused input active-high
         line   5: "[i2c0 sda]"       unused   input  active-high
         line   6: "[i2c0 scl]"       unused   input  active-high
         line   7: "[jtag emu0]" unused input active-high
         line   8: "[jtag emu1]" unused input active-high
         line   9: "[mii tx clk]" unused input active-high
         line  10: "[mii rx clk]" unused input active-high
         line  11:         "NC"       unused   input  active-high
         line  12:         "NC"       unused   input  active-high
         line  13: "[usb vbus en]" unused input active-high
         line  14: "P9_31 [spi1_sclk]" unused input active-high
         line  15: "P9_29 [spi1_d0]" unused input active-high
         line  16: "P9_30 [spi1_d1]" unused input active-high
         line  17: "P9_28 [spi1_cs0]" unused input active-high
         line  18: "P9_42B [ecappwm0]" unused input active-high
         line  19:      "P9_27"       unused   input  active-high
         line  20:     "P9_41A"       unused   input  active-high
         line  21:      "P9_25"       unused   input  active-high
         line  22:         "NC"       unused   input  active-high
         line  23:         "NC"       unused   input  active-high
         line  24:         "NC"       unused   input  active-high
         line  25:         "NC"       unused   input  active-high
         line  26:         "NC"       unused   input  active-high
         line  27:         "NC"       unused   input  active-high
         line  28:         "NC"       unused   input  active-high
         line  29:         "NC"       unused   input  active-high
         line  30:         "NC"       unused   input  active-high
         line  31:         "NC"       unused   input  active-high
gpiochip3 - 32 lines:
         line   0: "[mdio_data]" unused input active-high
         line   1: "[mdio_clk]"       unused   input  active-high
         line   2: "P9_22 [spi0_sclk]" unused input active-high
         line   3: "P9_21 [spi0_d0]" unused input active-high
         line   4: "P9_18 [spi0_d1]" unused input active-high
         line   5: "P9_17 [spi0_cs0]" unused input active-high
         line   6:  "[mmc0_cd]"         "cd"   input   active-low [used]
         line   7: "P8_42A [ecappwm0]" unused input active-high
         line   8: "P8_35 [lcd d12]" unused input active-high
         line   9: "P8_33 [lcd d13]" unused input active-high
         line  10: "P8_31 [lcd d14]" unused input active-high
         line  11: "P8_32 [lcd d15]" unused input active-high
         line  12: "P9_20 [i2c2_sda]" unused input active-high
         line  13: "P9_19 [i2c2_scl]" unused input active-high
         line  14: "P9_26 [uart1_rxd]" unused input active-high
         line  15: "P9_24 [uart1_txd]" unused input active-high
         line  16: "[rmii1_txd3]" unused input active-high
         line  17: "[rmii1_txd2]" unused input active-high
         line  18: "[usb0_drvvbus]" unused input active-high
         line  19: "[hdmi cec]"       unused   input  active-high
         line  20:     "P9_41B"       unused   input  active-high
         line  21: "[rmii1_txd1]" unused input active-high
         line  22: "P8_19 [ehrpwm2a]" unused input active-high
         line  23: "P8_13 [ehrpwm2b]" unused input active-high
         line  24:         "NC"       unused   input  active-high
         line  25:         "NC"       unused   input  active-high
         line  26:      "P8_14"       unused   input  active-high
         line  27:      "P8_17"       unused   input  active-high
         line  28: "[rmii1_txd0]" unused input active-high
         line  29: "[rmii1_refclk]" unused input active-high
         line  30: "P9_11 [uart4_rxd]" unused input active-high
         line  31: "P9_13 [uart4_txd]" unused input active-high

Also it is possible to use the given tools to manipulate the GPIOs, as=20
opposed to sysfs in this build... Any idea who to inform about the=20
broken lingpiod in the beaglebone_defconfig?

--
=C5=81ukasz Przenios=C5=82o


------ Original Message ------
From "Edgar Bonet" <bonet@grenoble.cnrs.fr>
To "=C5=81ukasz Przenios=C5=82o" <bremenpl@gmail.com>
Cc buildroot@buildroot.org
Date 2023-10-29 21:51:12
Subject Re: [Buildroot] Help with DTO

>Hello!
>
>=C5=81ukasz Przenios=C5=82o wrote:
>>  The problem is that thse mentioned commands [gpiodetect, gpioinfo...]
>>  provide no output in my shell (here run one by one with no output):
>
>I find it weird that `ls` sees /dev/gpiochip*, yet `gpiodetect` does not
>detect anything. Are you using the configuration from the tutorial or
>Buildroot's beaglebone_defconfig? One notable difference between them
>that the latter uses the Beagleboard Linux kernel from GitHub, whereas
>the former uses mainline Linux 6.0. I wonder whether this may make a
>difference for you.
>
>Regarding the DT overlay, I have never tried something similar. I found
>a tutorial from Bootlin.[1] According to it, the overlay is managed just
>like the defconfig itself. If you write such an overlay, Buildroot
>should compile it if, on `make menuconfig`, you list it under
>
>     Kernel / Out-of-tree Device Tree Source file paths
>
>Regards,
>
>Edgar.
>
>[1] https://bootlin.com/blog/using-device-tree-overlays-example-on-beagleb=
one-boards/
--------=_MB1E2E0517-8E53-4321-8BD1-B9985A929F30
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head>

<style id=3D"css_styles" type=3D"text/css"><!--blockquote.cite { margin-lef=
t: 5px; margin-right: 0px; padding-left: 10px; padding-right:0px; border-le=
ft: 1px solid #cccccc }
blockquote.cite2 {margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc; margin-top: 3px; padding=
-top: 0px; }
a img { border: 0px; }
li[style=3D'text-align: center;'], li[style=3D'text-align: center; '], li[s=
tyle=3D'text-align: right;'], li[style=3D'text-align: right; '] {  list-sty=
le-position: inside;}
body { font-family: Verdana; font-size: 12pt; }
.quote { margin-left: 1em; margin-right: 1em; border-left: 5px #ebebeb soli=
d; padding-left: 0.3em; }
--></style></head>
<body><div>Hi Edgar and all,</div><div><br /><div class=3D"quote"><div id=
=3D"xec512e7e414c4e7d947f6cbdda2a381c"><div class=3D"plain_line" style=3D"b=
ackground-color:rgba(0,0,0,0);margin:3px 0px 16px 5px;">One notable differe=
nce between them</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">that the latter uses the Beagleboard Linux kernel from Git=
Hub, whereas</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">the former uses mainline Linux 6.0. I wonder whether this=
 may make a</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">difference for you.</div></div></div></div><div>This was a =
good guess. I have re-run the config as per the tutorial, from scratch, wi=
th latest kernel. The gpiodetect and gpioinfo now work:</div><div><br /></d=
iv><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8pt;"># gpio=
detect
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">gpiochip0 [gpio-0-31] (32 lines)
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">gpiochip1 [gpio-32-63] (32 lines)
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">gpiochip2 [gpio-64-95] (32 lines)
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">gpiochip3 [gpio-96-127] (32 lines)
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;"># gpioinfo
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">gpiochip0 - 32 lines:
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A00: "P8_25 [mmc1_dat0]" unu=
sed input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A01: "[mmc1_dat1]" unused in=
put active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A02: "P8_5 [mmc1_dat2]" unus=
ed input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A03: "P8_6 [mmc1_dat3]" unus=
ed input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A04: "P8_23 [mmc1_dat4]" unu=
sed input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05: "P8_22 [mmc1_dat5]" unu=
sed input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A06: "P8_3 [mmc1_dat6]" unus=
ed input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A07: "P8_4 [mmc1_dat7]" unus=
ed input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A08:=C2=A0 =C2=A0=C2=A0 =C2=
=A0=C2=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=
=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A09:=C2=A0 =C2=A0=C2=A0 =C2=
=A0=C2=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=
=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 10:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 11:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 12:=C2=A0 =C2=A0=C2=A0 =C2=A0"P8=
_12"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 13:=C2=A0 =C2=A0=C2=A0 =C2=A0"P8=
_11"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 14:=C2=A0 =C2=A0=C2=A0 =C2=A0"P8=
_16"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 15:=C2=A0 =C2=A0=C2=A0 =C2=A0"P8=
_15"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 16:=C2=A0 =C2=A0=C2=A0 "P9_15A"=
=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 17:=C2=A0 =C2=A0=C2=A0 =C2=A0"P9=
_23"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 18: "P9_14 [ehrpwm1a]" unused in=
put active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 19: "P9_16 [ehrpwm1b]" unused in=
put active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 20: "[emmc rst]"=C2=A0 =C2=A0=C2=
=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 21: "[usr0 led]"=C2=A0 =C2=A0=C2=
=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 22: "[usr1 led]"=C2=A0 =C2=A0=C2=
=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 23: "[usr2 led]"=C2=A0 =C2=A0=C2=
=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 24: "[usr3 led]"=C2=A0 =C2=A0=C2=
=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 25: "[hdmi irq]"=C2=A0 =C2=A0=C2=
=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 26: "[usb vbus oc]" unused input =
active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 27: "[hdmi audio]" "enable" outp=
ut active-high [used]
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 28:=C2=A0 =C2=A0=C2=A0 =C2=A0"P9=
_12"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 29:=C2=A0 =C2=A0=C2=A0 =C2=A0"P8=
_26"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 30: "P8_21 [emmc]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 31: "P8_20 [emmc]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">gpiochip1 - 32 lines:
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A00:=C2=A0 =C2=A0=C2=A0 "P9_=
15B"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A01:=C2=A0 =C2=A0=C2=A0 =C2=
=A0"P8_18"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-=
high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A02:=C2=A0 =C2=A0=C2=A0 =C2=
=A0 "P8_7"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-=
high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A03:=C2=A0 =C2=A0=C2=A0 =C2=
=A0 "P8_8"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-=
high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A04:=C2=A0 =C2=A0=C2=A0 =C2=
=A0"P8_10"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-=
high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05:=C2=A0 =C2=A0=C2=A0 =C2=
=A0 "P8_9"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-=
high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A06: "P8_45 [hdmi]" unused i=
nput active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A07: "P8_46 [hdmi]" unused i=
nput active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A08: "P8_43 [hdmi]" unused i=
nput active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A09: "P8_44 [hdmi]" unused i=
nput active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 10: "P8_41 [hdmi]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 11: "P8_42 [hdmi]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 12: "P8_39 [hdmi]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 13: "P8_40 [hdmi]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 14: "P8_37 [hdmi]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 15: "P8_38 [hdmi]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 16: "P8_36 [hdmi]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 17: "P8_34 [hdmi]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 18: "[rmii1_rxd3]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 19: "[rmii1_rxd2]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 20: "[rmii1_rxd1]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 21: "[rmii1_rxd0]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 22: "P8_27 [hdmi]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 23: "P8_29 [hdmi]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 24: "P8_28 [hdmi]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 25: "P8_30 [hdmi]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 26: "[mmc0_dat3]" unused input a=
ctive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 27: "[mmc0_dat2]" unused input a=
ctive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 28: "[mmc0_dat1]" unused input a=
ctive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 29: "[mmc0_dat0]" unused input a=
ctive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 30: "[mmc0_clk]"=C2=A0 =C2=A0=C2=
=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 31: "[mmc0_cmd]"=C2=A0 =C2=A0=C2=
=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">gpiochip2 - 32 lines:
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A00:=C2=A0 "[mii col]"=C2=A0 =
=C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A01:=C2=A0 "[mii crs]"=C2=A0 =
=C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A02: "[mii rx err]" unused i=
nput active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A03: "[mii tx en]" unused in=
put active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A04: "[mii rx dv]" unused in=
put active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05: "[i2c0 sda]"=C2=A0 =C2=
=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A06: "[i2c0 scl]"=C2=A0 =C2=
=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A07: "[jtag emu0]" unused in=
put active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A08: "[jtag emu1]" unused in=
put active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A09: "[mii tx clk]" unused i=
nput active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 10: "[mii rx clk]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 11:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 12:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 13: "[usb vbus en]" unused input =
active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 14: "P9_31 [spi1_sclk]" unused i=
nput active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 15: "P9_29 [spi1_d0]" unused inp=
ut active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 16: "P9_30 [spi1_d1]" unused inp=
ut active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 17: "P9_28 [spi1_cs0]" unused in=
put active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 18: "P9_42B [ecappwm0]" unused i=
nput active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 19:=C2=A0 =C2=A0=C2=A0 =C2=A0"P9=
_27"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 20:=C2=A0 =C2=A0=C2=A0 "P9_41A"=
=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 21:=C2=A0 =C2=A0=C2=A0 =C2=A0"P9=
_25"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 22:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 23:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 24:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 25:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 26:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 27:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 28:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 29:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 30:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 31:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">gpiochip3 - 32 lines:
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A00: "[mdio_data]" unused in=
put active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A01: "[mdio_clk]"=C2=A0 =C2=
=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A02: "P9_22 [spi0_sclk]" unu=
sed input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A03: "P9_21 [spi0_d0]" unuse=
d input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A04: "P9_18 [spi0_d1]" unuse=
d input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05: "P9_17 [spi0_cs0]" unus=
ed input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A06:=C2=A0 "[mmc0_cd]"=C2=A0 =
=C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0"cd"=C2=A0 =C2=A0input=C2=A0 =C2=A0active-=
low [used]
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A07: "P8_42A [ecappwm0]" unu=
sed input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A08: "P8_35 [lcd d12]" unuse=
d input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A09: "P8_33 [lcd d13]" unuse=
d input active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 10: "P8_31 [lcd d14]" unused inp=
ut active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 11: "P8_32 [lcd d15]" unused inp=
ut active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 12: "P9_20 [i2c2_sda]" unused in=
put active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 13: "P9_19 [i2c2_scl]" unused in=
put active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 14: "P9_26 [uart1_rxd]" unused i=
nput active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 15: "P9_24 [uart1_txd]" unused i=
nput active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 16: "[rmii1_txd3]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 17: "[rmii1_txd2]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 18: "[usb0_drvvbus]" unused inpu=
t active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 19: "[hdmi cec]"=C2=A0 =C2=A0=C2=
=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 20:=C2=A0 =C2=A0=C2=A0 "P9_41B"=
=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 21: "[rmii1_txd1]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 22: "P8_19 [ehrpwm2a]" unused in=
put active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 23: "P8_13 [ehrpwm2b]" unused in=
put active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 24:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 25:=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=
=A0 =C2=A0"NC"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 act=
ive-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 26:=C2=A0 =C2=A0=C2=A0 =C2=A0"P8=
_14"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 27:=C2=A0 =C2=A0=C2=A0 =C2=A0"P8=
_17"=C2=A0 =C2=A0=C2=A0 =C2=A0 unused=C2=A0 =C2=A0input=C2=A0 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 28: "[rmii1_txd0]" unused input=
 active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 29: "[rmii1_refclk]" unused inpu=
t active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 30: "P9_11 [uart4_rxd]" unused i=
nput active-high
</font></div><div><font face=3D"Consolas" size=3D"1" style=3D"font-size: 8p=
t;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 31: "P9_13 [uart4_txd]" unused i=
nput active-high
</font></div><div><br /></div><div>Also it is possible to use the given too=
ls to manipulate the GPIOs, as opposed to sysfs in this build... Any idea w=
ho to inform about the broken lingpiod in the beaglebone_defconfig?</div>
<div><br /></div><div id=3D"signature_old" style=3D"clear:both">--<div>=C5=
=81ukasz Przenios=C5=82o</div></div><div style=3D"clear:both"><br /></div>
<div><br /></div>
<div>
<div>------ Original Message ------</div>
<div>From "Edgar Bonet" &lt;<a href=3D"mailto:bonet@grenoble.cnrs.fr">bonet=
@grenoble.cnrs.fr</a>&gt;</div>
<div>To "=C5=81ukasz Przenios=C5=82o" &lt;<a href=3D"mailto:bremenpl@gmail.=
com">bremenpl@gmail.com</a>&gt;</div>
<div>Cc <a href=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.org<=
/a></div>
<div>Date 2023-10-29 21:51:12</div>
<div>Subject Re: [Buildroot] Help with DTO</div></div><div><br /></div>
<div id=3D"x0440c2f8d50c4b3" class=3D"plain"><blockquote cite=3D"47321b8a-6=
e6a-43a2-b38c-bcc1defcb5c1@grenoble.cnrs.fr" type=3D"cite" class=3D"cite2">

<div class=3D"plain_line">Hello!</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">=C5=81ukasz Przenios=C5=82o wrote:</div>
<blockquote type=3D"cite" class=3D"cite">
<div class=3D"plain_line"> The problem is that thse mentioned commands [gpi=
odetect, gpioinfo...]</div>
<div class=3D"plain_line"> provide no output in my shell (here run one by o=
ne with no output):</div>
</blockquote>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">I find it weird that `ls` sees /dev/gpiochip*, ye=
t `gpiodetect` does not</div>
<div class=3D"plain_line">detect anything. Are you using the configuration=
 from the tutorial or</div>
<div class=3D"plain_line">Buildroot's beaglebone_defconfig? One notable dif=
ference between them</div>
<div class=3D"plain_line">that the latter uses the Beagleboard Linux kernel =
from GitHub, whereas</div>
<div class=3D"plain_line">the former uses mainline Linux 6.0. I wonder whet=
her this may make a</div>
<div class=3D"plain_line">difference for you.</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">Regarding the DT overlay, I have never tried some=
thing similar. I found</div>
<div class=3D"plain_line">a tutorial from Bootlin.[1] According to it, the=
 overlay is managed just</div>
<div class=3D"plain_line">like the defconfig itself. If you write such an o=
verlay, Buildroot</div>
<div class=3D"plain_line">should compile it if, on `make menuconfig`, you l=
ist it under</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">    Kernel / Out-of-tree Device Tree Source file=
 paths</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">Regards,</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">Edgar.</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">[1] <a href=3D"https://bootlin.com/blog/using-dev=
ice-tree-overlays-example-on-beaglebone-boards/">https://bootlin.com/blog/u=
sing-device-tree-overlays-example-on-beaglebone-boards/</a></div>
</blockquote></div>


</body></html>
--------=_MB1E2E0517-8E53-4321-8BD1-B9985A929F30--



--===============7808694351906212657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7808694351906212657==--



