Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8542C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A161842F5C;
	Sat, 28 Oct 2023 21:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A161842F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZhNhfHOqUTfu; Sat, 28 Oct 2023 21:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B4B942F84;
	Sat, 28 Oct 2023 21:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B4B942F84
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB4CE1BF20B
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C42B483C63
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C42B483C63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 88FGgc88zxQE for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:04:26 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A12483C5D
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A12483C5D
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507b96095abso4591361e87.3
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 14:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698527064; x=1699131864;
 h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
 :date:cc:subject:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RwWQh/VZr5AhNhWvYvihved5VFeWb2BvL48zWEH4ziA=;
 b=ZOQSJMlUSHYplPpPl6ewkPZI5czjkunOLXcKKmvt1tvn/DRfM8n7mOccfMCnHLkzq7
 YqSh5hx7oNJf0T3QzJPpZMnM18vEcfRECPr1jCHvYy505GdQAkd4XYlNtl5cuAj/6oyN
 8UP0ui1xkrixcWl07J5ufg7s594zYRb5COWmgSx8NYM5aAFDrWxCFgX5RDfBURY4ABsS
 wZNWqY3efup03Vw+aJYgu8QnGnqopdfu36myCgKhaqmWFV1X1UPAV6oCr+P6sUz5RU0C
 LaSOjCENqR5OxWCDYW5NoiQbVS9vlLE5t523yZpchYnuskq3vnCBXegS21QYfEWuLJ35
 l34Q==
X-Gm-Message-State: AOJu0Yw3BK2xvji6tpJfwytZuyQLk28X4qfLxIbFka4GZx4khOzAmysf
 LaeRqUy0R5z/f5v3qO5IsHaUKekAUBY=
X-Google-Smtp-Source: AGHT+IH7AYvLcTyI23pgznJdkXoSC44jiAyXx6PyhWj65QprAdn6Les/eIpSG9NrZL9dd0wnGKo3Bg==
X-Received: by 2002:a05:6512:230a:b0:508:11c3:c8ca with SMTP id
 o10-20020a056512230a00b0050811c3c8camr5522886lfu.7.1698527063909; 
 Sat, 28 Oct 2023 14:04:23 -0700 (PDT)
Received: from [192.168.7.144] (epd88.neoplus.adsl.tpnet.pl. [83.20.45.88])
 by smtp.gmail.com with ESMTPSA id
 j26-20020ac253ba000000b00507b085e995sm770767lfh.44.2023.10.28.14.04.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 28 Oct 2023 14:04:23 -0700 (PDT)
From: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
To: "Edgar Bonet" <bonet@grenoble.cnrs.fr>
Date: Sat, 28 Oct 2023 21:04:22 +0000
Message-Id: <em6bc2a225-6a20-4539-86d0-076745906717@9e2fe6c2.com>
In-Reply-To: <61e80819-c901-486c-afdd-1e69441821e2@grenoble.cnrs.fr>
References: <em9eec97a0-87a4-4352-9e89-03948b436830@9e2fe6c2.com>
 <61e80819-c901-486c-afdd-1e69441821e2@grenoble.cnrs.fr>
User-Agent: eM_Client/9.2.2093.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698527064; x=1699131864; darn=buildroot.org;
 h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
 :date:cc:subject:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RwWQh/VZr5AhNhWvYvihved5VFeWb2BvL48zWEH4ziA=;
 b=U1kXsjBKyIOzp2rKNYWxU7GSFYyls/sES7hQeMDDwwjRNi0KHr7+E2AcUbvcVPCXaf
 /KQeXjTrx8GFIVPAPkK8h3wwYSfyD9imVrWH9gON7rQzFIWKbr4EEnm60iD18GaW7sE6
 NJ+ed87/BILVCDXqFlk+hE3FKvQtcK91uWPrRmbqfeJrTfGCRdBhG7f4IWEBO3UkvdF3
 FGXljh8e9tEQwC8JYyPIgolYR1VHwlD4aB6OowRNAoXSWv8Tp242qAv+713IhS0iKSPR
 xF2eJJ+T6xfRLQozDV7HEb2Wcp71C2jB6Y/eGTz5wfBjxMhpHDdLDv5znibjM24gKV/I
 i2tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U1kXsjBK
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
Content-Type: multipart/mixed; boundary="===============5266585384793530136=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5266585384793530136==
Content-Type: multipart/alternative;
 boundary="------=_MBD5D7C253-C672-46A4-9DA8-AF98D679A082"

--------=_MBD5D7C253-C672-46A4-9DA8-AF98D679A082
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Edgar and thank you for the answer!

This tutorial walks you through a manual configuration. Note that
Buildroot ships a ready-made configuration you can use:

     make beaglebone_defconfig  # load the ready-made defconfig
     make menuconfig            # if you want to tweak it
     make
I see, so this is like a more proper template for BBB specifically,=20
thanks! I started from scratch, because I wanted to try to learn as much=20
as possible + the fact that I do not need the HDMI pins. Furthermore, I=20
need to reuse them as gpio outputs and PRU inputs- for these, I think I=20
need to configure the pins in specific mode 5 (PRU1) or 6 (PRU0).

I do not understand why you need a device tree overlay. The tutorial
gets you a kernel together with the am335x-boneblack device tree. This
device tree already defines four GPIO chips. Can't you see them? Try

     ls /dev/gpiochip*
Yes, I do see them:

# ls /dev/gpiochip*
/dev/gpiochip0  /dev/gpiochip1  /dev/gpiochip2  /dev/gpiochip3

My problem was that I was unable to export any of the gpios:

# pwd
/sys/class/gpio
# echo 66 > export
[23448.896503] export_store: invalid GPIO 66
sh: write error: Invalid argument

I thought that these cannot be exported due to incorrect DTS- no?

If you want to play with the GPIOs, I suggest you install the tools that
come with libgpiod: in Target packages / Libraries / Hardware handling,
select =E2=80=9Clibgpiod=E2=80=9D, then =E2=80=9Cinstall tools=E2=80=9D. Th=
en, on the booted system,
type
Here, do you mean to choose all this in the make menuconfig dialog?

Thanks already and in advance!

--
=C5=81ukasz Przenios=C5=82o


------ Original Message ------
From "Edgar Bonet" <bonet@grenoble.cnrs.fr>
To "=C5=81ukasz Przenios=C5=82o" <bremenpl@gmail.com>; buildroot@buildroot.=
org
Date 2023-10-28 20:58:38
Subject Re: [Buildroot] Help with DTO

>Hello!
>
>=C5=81ukasz Przenios=C5=82o wrote, about the BeagleBone:
>>  So I have the HW and virgin working Buildroot image baked thanks to
>>  this tutorial.
>>  (https://blog.billvanleeuwen.ca/creating-a-minimal-linux-system-for-the=
-beaglebone-black-with-buildroot)
>
>This tutorial walks you through a manual configuration. Note that
>Buildroot ships a ready-made configuration you can use:
>
>     make beaglebone_defconfig  # load the ready-made defconfig
>     make menuconfig            # if you want to tweak it
>     make
>
>>  What I wanted to do next is to create a device tree overlay for all
>>  required GPIOs that would be compiled at kernel build time.
>
>I do not understand why you need a device tree overlay. The tutorial
>gets you a kernel together with the am335x-boneblack device tree. This
>device tree already defines four GPIO chips. Can't you see them? Try
>
>     ls /dev/gpiochip*
>
>If you want to play with the GPIOs, I suggest you install the tools that
>come with libgpiod: in Target packages / Libraries / Hardware handling,
>select =E2=80=9Clibgpiod=E2=80=9D, then =E2=80=9Cinstall tools=E2=80=9D. T=
hen, on the booted system,
>type
>
>     gpiodetect
>     gpioinfo
>
>You should see all the available GPIO chips, then all the GPIO lines.
>
>Regards,
>
>Edgar.
--------=_MBD5D7C253-C672-46A4-9DA8-AF98D679A082
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
<body><div>Hi Edgar and thank you for the answer!</div><div><br /><div clas=
s=3D"quote"><div id=3D"xf92eab7c6cd542c39809342847b01392"><div class=3D"pla=
in_line" style=3D"background-color:rgba(0,0,0,0);margin:3px 0px 16px 5px;">=
This tutorial walks you through a manual configuration. Note that</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">Buildroot ships a ready-made configuration you can use:</d=
iv>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">=C2=A0</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">    make beaglebone_defconfig  # load the ready-made defco=
nfig</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">    make menuconfig            # if you want to tweak it</=
div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">    make</div></div></div></div>
<div>I see, so this is like a more proper template for BBB specifically, th=
anks! I started from scratch, because I wanted to try to learn as much as p=
ossible + the fact that I do not need the HDMI pins. Furthermore, I need to =
reuse them as gpio outputs and PRU inputs- for these, I think I need to co=
nfigure the pins in specific mode 5 (PRU1) or 6 (PRU0).=C2=A0</div><div><br =
/><div class=3D"quote"><div id=3D"x9e72c06aa8614a78a362b741093aae35"><div=
 class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3px 0px =
16px 5px;">I do not understand why you need a device tree overlay. The tut=
orial</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">gets you a kernel together with the am335x-boneblack devic=
e tree. This</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">device tree already defines four GPIO chips. Can't you see =
them? Try</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">=C2=A0</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">    ls /dev/gpiochip*</div></div></div></div><div>Yes, I d=
o see them:</div><div><br /></div><div><font face=3D"Consolas" size=3D"2" s=
tyle=3D"font-size: 10pt;"># ls /dev/gpiochip*
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">/dev/gpiochip0=C2=A0 /dev/gpiochip1=C2=A0 /dev/gpiochip2=C2=A0 /dev/gp=
iochip3
</font></div><div><br /></div><div>My problem was that I was unable to expo=
rt any of the gpios:</div><div><br /></div><div><font face=3D"Consolas" siz=
e=3D"2" style=3D"font-size: 10pt;"># pwd
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">/sys/class/gpio
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;"># echo 66 &gt;=C2=A0export
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">[23448.896503] export_store: invalid GPIO 66
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">sh: write error: Invalid argument
</font></div><div><br /></div><div>I thought that these cannot be exported=
 due to incorrect DTS- no?</div><div><br /><div class=3D"quote"><div id=3D"x=
fcda051123e441dabbb1433090a9c8a1"><div class=3D"plain_line" style=3D"backgr=
ound-color:rgba(0,0,0,0);margin:3px 0px 16px 5px;">If you want to play with =
the GPIOs, I suggest you install the tools that</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">come with libgpiod: in Target packages / Libraries / Hardw=
are handling,</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">select =E2=80=9Clibgpiod=E2=80=9D, then =E2=80=9Cinstall t=
ools=E2=80=9D. Then, on the booted system,</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">type</div></div></div></div><div>Here, do you mean to choo=
se all this in the make menuconfig dialog?</div><div><br /></div><div>Thank=
s already and in advance!</div><div><br /></div><div id=3D"signature_old" s=
tyle=3D"clear:both">--<div>=C5=81ukasz Przenios=C5=82o</div></div><div styl=
e=3D"clear:both"><br /></div>
<div><br /></div>
<div>
<div>------ Original Message ------</div>
<div>From "Edgar Bonet" &lt;<a href=3D"mailto:bonet@grenoble.cnrs.fr">bonet=
@grenoble.cnrs.fr</a>&gt;</div>
<div>To "=C5=81ukasz Przenios=C5=82o" &lt;<a href=3D"mailto:bremenpl@gmail.=
com" style=3D"">bremenpl@gmail.com</a>&gt;; <a href=3D"mailto:buildroot@bui=
ldroot.org">buildroot@buildroot.org</a></div>
<div>Date 2023-10-28 20:58:38</div>
<div>Subject Re: [Buildroot] Help with DTO</div></div><div><br /></div>
<div id=3D"x05283e394a49435" class=3D"plain"><blockquote cite=3D"61e80819-c=
901-486c-afdd-1e69441821e2@grenoble.cnrs.fr" type=3D"cite" class=3D"cite2">

<div class=3D"plain_line">Hello!</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">=C5=81ukasz Przenios=C5=82o wrote, about the Beag=
leBone:</div>
<blockquote type=3D"cite" class=3D"cite">
<div class=3D"plain_line"> So I have the HW and virgin working Buildroot im=
age baked thanks to</div>
<div class=3D"plain_line"> this tutorial.</div>
<div class=3D"plain_line"> (<a href=3D"https://blog.billvanleeuwen.ca/creat=
ing-a-minimal-linux-system-for-the-beaglebone-black-with-buildroot" style=
=3D"">https://blog.billvanleeuwen.ca/creating-a-minimal-linux-system-for-th=
e-beaglebone-black-with-buildroot</a>)</div>
</blockquote>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">This tutorial walks you through a manual configur=
ation. Note that</div>
<div class=3D"plain_line">Buildroot ships a ready-made configuration you ca=
n use:</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">    make beaglebone_defconfig  # load the ready-m=
ade defconfig</div>
<div class=3D"plain_line">    make menuconfig            # if you want to t=
weak it</div>
<div class=3D"plain_line">    make</div>
<div class=3D"plain_line">=C2=A0</div>
<blockquote type=3D"cite" class=3D"cite2">
<div class=3D"plain_line"> What I wanted to do next is to create a device t=
ree overlay for all</div>
<div class=3D"plain_line"> required GPIOs that would be compiled at kernel=
 build time.</div>
</blockquote>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">I do not understand why you need a device tree ov=
erlay. The tutorial</div>
<div class=3D"plain_line">gets you a kernel together with the am335x-bonebl=
ack device tree. This</div>
<div class=3D"plain_line">device tree already defines four GPIO chips. Can'=
t you see them? Try</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">    ls /dev/gpiochip*</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">If you want to play with the GPIOs, I suggest you =
install the tools that</div>
<div class=3D"plain_line">come with libgpiod: in Target packages / Librarie=
s / Hardware handling,</div>
<div class=3D"plain_line">select =E2=80=9Clibgpiod=E2=80=9D, then =E2=80=9C=
install tools=E2=80=9D. Then, on the booted system,</div>
<div class=3D"plain_line">type</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">    gpiodetect</div>
<div class=3D"plain_line">    gpioinfo</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">You should see all the available GPIO chips, then =
all the GPIO lines.</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">Regards,</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">Edgar.</div>
</blockquote></div>


</body></html>
--------=_MBD5D7C253-C672-46A4-9DA8-AF98D679A082--


--===============5266585384793530136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5266585384793530136==--

