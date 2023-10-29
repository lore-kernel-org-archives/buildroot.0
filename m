Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9514EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 15:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9B16400A6;
	Sun, 29 Oct 2023 15:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9B16400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHw9yoxt1yum; Sun, 29 Oct 2023 15:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49A6C42F08;
	Sun, 29 Oct 2023 15:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49A6C42F08
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A3D71BF36E
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 15:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10F368500E
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 15:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F368500E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mWQqC65W30-3 for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 15:24:07 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BACC8500A
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 15:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BACC8500A
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-509109104e2so1352680e87.3
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698593044; x=1699197844;
 h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
 :date:cc:subject:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AD0s/cN+JFT2KXFB8ew+nl6jv9g4c8jWoZpvqND1PiY=;
 b=pmS8Kh62cmVnHbNDMQCJIsWDB+U6hKwyLDzj+LlQ9EgizejDNK5GJs4SOgrpLMUtj4
 eEmkl5G4RtlRMQUEK+dn68ZshNIRga+FdtpMu+Z2vOHIEdN3t27lpWrIj7I0TimRQxfd
 gbu+oc6rjRIY3Bls6THeqvbeag+WVOlN0SYpU/ncVuhW6S2fRARAJyMj0H0ubdLke0Za
 cR+NzrS1F5xRyl5S8298a9Fk9rw0oJDDfDATObRICuDLaz6sgaXLN7V/ko90z6Uahgvk
 QVsxLqrkU7msW7+3LeTMKZb3o98mCloxHc0vYlOq0C4qE6bpLW0NJRgqV4WTcX9YYE5n
 BRPw==
X-Gm-Message-State: AOJu0YzOk99NmHhk+FrOGSNJB4Z+nUyv6eP5R7ZrPQ04LgIlth6it9kA
 JIPlMVGzBkKTY4xUen4CowLAwYbKFco=
X-Google-Smtp-Source: AGHT+IGjOc1EPalYZqvUdIFWgxUJfsJsV4LdBmCevA38Gko64YUhk9/eT885PBENh/LbIno9i1BwPQ==
X-Received: by 2002:a05:6512:709:b0:500:ac0b:8d58 with SMTP id
 b9-20020a056512070900b00500ac0b8d58mr5525969lfs.18.1698593043909; 
 Sun, 29 Oct 2023 08:24:03 -0700 (PDT)
Received: from [192.168.7.144] (epd88.neoplus.adsl.tpnet.pl. [83.20.45.88])
 by smtp.gmail.com with ESMTPSA id
 c34-20020a05651223a200b004fba82dde47sm1066866lfv.123.2023.10.29.08.24.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Oct 2023 08:24:02 -0700 (PDT)
From: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
To: "Edgar Bonet" <bonet@grenoble.cnrs.fr>
Date: Sun, 29 Oct 2023 15:24:01 +0000
Message-Id: <emb9a3bd28-b4d1-4bc8-afa1-921689dee1ec@9e2fe6c2.com>
In-Reply-To: <em6bc2a225-6a20-4539-86d0-076745906717@9e2fe6c2.com>
References: <em9eec97a0-87a4-4352-9e89-03948b436830@9e2fe6c2.com>
 <61e80819-c901-486c-afdd-1e69441821e2@grenoble.cnrs.fr>
 <em6bc2a225-6a20-4539-86d0-076745906717@9e2fe6c2.com>
User-Agent: eM_Client/9.2.2093.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698593044; x=1699197844; darn=buildroot.org;
 h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
 :date:cc:subject:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AD0s/cN+JFT2KXFB8ew+nl6jv9g4c8jWoZpvqND1PiY=;
 b=hiLGINF+gsOEF/4bQB41PTXvKFFG+sR8opf/z2I6qc71g9xVBp9oF5z8xBdIH3trNk
 sAxy1bncwGx2f38qVso+ecE+i3+uisLsHfFFQ7jaQd/8NFjBIy5JTfiV55hxrApwAHf5
 Ny/kj6DLkt7Oikcmy5uBvrFnbu+A5TTlMI8rR/iEFNUL4V7KXGzE17k2MjwVR2i2yGgF
 0tTj2HjJnFWbzSRvhgZ2QC0ytq0QjyCKAHjWB36Uv7aigojmzUr98MuHvhYoD5T2o2PS
 u3+my1dtott8Ksbc9wtQcGweAewun7zZPp3HD2Y9DFdxVAZawZS22AbIlP02VBfsevdD
 dIlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hiLGINF+
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
Content-Type: multipart/mixed; boundary="===============0168477933592471539=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0168477933592471539==
Content-Type: multipart/alternative;
 boundary="------=_MBC9B028F6-1B61-431B-B460-25C5F3D1F687"

--------=_MBC9B028F6-1B61-431B-B460-25C5F3D1F687
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Edgar and all,
Edgar, as you suggested, I went with the beaglebone_defconfig as a=20
template- when booted, I could normally export the GPIOs via sysfs.=20
Again, I do not understand why this was not possible in the "virgin"=20
buildroot system...

Right now I am trying to figure out how to provide a device tree overlay=20
on this system, that would define my specific baseboard (or cape, or=20
hat...). What I do need to do is:
Disable the HDMI pins,
I think I dont need to do anything with pins that I need to use as=20
outputs- I can just work with sysfs and userspace for these,
Configure specific pins as belonging to PRU0 or PRU1,
Enable the ethernet phy with DHCP by default (not sure if this is to be=20
defined in the overlay).
So question is: how to create such a DTO and make buildroot compile it=20
and then later uBoot automatically load it, so the booted system has all=20
the HW ready to be used?

I would appreciate all further feedback!

--
=C5=81ukasz Przenios=C5=82o


------ Original Message ------
From "=C5=81ukasz Przenios=C5=82o" <bremenpl@gmail.com>
To "Edgar Bonet" <bonet@grenoble.cnrs.fr>
Cc buildroot@buildroot.org
Date 2023-10-28 23:04:22
Subject Re[2]: [Buildroot] Help with DTO

>Hi Edgar and thank you for the answer!
>
>This tutorial walks you through a manual configuration. Note that
>Buildroot ships a ready-made configuration you can use:
>
>     make beaglebone_defconfig  # load the ready-made defconfig
>     make menuconfig            # if you want to tweak it
>     make
>I see, so this is like a more proper template for BBB specifically,=20
>thanks! I started from scratch, because I wanted to try to learn as=20
>much as possible + the fact that I do not need the HDMI pins.=20
>Furthermore, I need to reuse them as gpio outputs and PRU inputs- for=20
>these, I think I need to configure the pins in specific mode 5 (PRU1)=20
>or 6 (PRU0).
>
>I do not understand why you need a device tree overlay. The tutorial
>gets you a kernel together with the am335x-boneblack device tree. This
>device tree already defines four GPIO chips. Can't you see them? Try
>
>     ls /dev/gpiochip*
>Yes, I do see them:
>
># ls /dev/gpiochip*
>/dev/gpiochip0  /dev/gpiochip1  /dev/gpiochip2  /dev/gpiochip3
>
>My problem was that I was unable to export any of the gpios:
>
># pwd
>/sys/class/gpio
># echo 66 > export
>[23448.896503] export_store: invalid GPIO 66
>sh: write error: Invalid argument
>
>I thought that these cannot be exported due to incorrect DTS- no?
>
>If you want to play with the GPIOs, I suggest you install the tools that
>come with libgpiod: in Target packages / Libraries / Hardware handling,
>select =E2=80=9Clibgpiod=E2=80=9D, then =E2=80=9Cinstall tools=E2=80=9D. T=
hen, on the booted system,
>type
>Here, do you mean to choose all this in the make menuconfig dialog?
>
>Thanks already and in advance!
>
>--
>=C5=81ukasz Przenios=C5=82o
>
>
>------ Original Message ------
>From "Edgar Bonet" <bonet@grenoble.cnrs.fr>
>To "=C5=81ukasz Przenios=C5=82o" <bremenpl@gmail.com>; buildroot@buildroot=
.org
>Date 2023-10-28 20:58:38
>Subject Re: [Buildroot] Help with DTO
>
>>Hello!
>>
>>=C5=81ukasz Przenios=C5=82o wrote, about the BeagleBone:
>>>  So I have the HW and virgin working Buildroot image baked thanks to
>>>  this tutorial.
>>>  (https://blog.billvanleeuwen.ca/creating-a-minimal-linux-system-for-th=
e-beaglebone-black-with-buildroot)
>>
>>This tutorial walks you through a manual configuration. Note that
>>Buildroot ships a ready-made configuration you can use:
>>
>>     make beaglebone_defconfig  # load the ready-made defconfig
>>     make menuconfig            # if you want to tweak it
>>     make
>>
>>>  What I wanted to do next is to create a device tree overlay for all
>>>  required GPIOs that would be compiled at kernel build time.
>>
>>I do not understand why you need a device tree overlay. The tutorial
>>gets you a kernel together with the am335x-boneblack device tree. This
>>device tree already defines four GPIO chips. Can't you see them? Try
>>
>>     ls /dev/gpiochip*
>>
>>If you want to play with the GPIOs, I suggest you install the tools that
>>come with libgpiod: in Target packages / Libraries / Hardware handling,
>>select =E2=80=9Clibgpiod=E2=80=9D, then =E2=80=9Cinstall tools=E2=80=9D.=
 Then, on the booted system,
>>type
>>
>>     gpiodetect
>>     gpioinfo
>>
>>You should see all the available GPIO chips, then all the GPIO lines.
>>
>>Regards,
>>
>>Edgar.
--------=_MBC9B028F6-1B61-431B-B460-25C5F3D1F687
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head>

<style type=3D"text/css"><!--#xd26d2fb6be86498 blockquote.cite
{margin-left: 5px; margin-right: 0px; padding-left: 10px; padding-right: 0p=
x; border-left: 1px solid rgb(204, 204, 204);}
#xd26d2fb6be86498 blockquote.cite2
{margin-left: 5px; margin-right: 0px; padding-left: 10px; padding-right: 0p=
x; border-left: 1px solid rgb(204, 204, 204); margin-top: 3px; padding-top: =
0px;}
#xd26d2fb6be86498
{font-family: Verdana; font-size: 12pt;}
#xd26d2fb6be86498 .quote
{margin-left: 1em; margin-right: 1em; border-left: 5px solid rgb(235, 235,=
 235); padding-left: 0.3em;}
--></style><style id=3D"css_styles" type=3D"text/css"><!--blockquote.cite { =
margin-left: 5px; margin-right: 0px; padding-left: 10px; padding-right:0px=
; border-left: 1px solid #cccccc }
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
<body><div>Hi Edgar and all,</div><div>Edgar, as you suggested, I went with =
the beaglebone_defconfig as a template- when booted, I could normally expo=
rt the GPIOs via sysfs. Again, I do not understand why this was not possibl=
e in the "virgin" buildroot system...</div><div><br /></div><div>Right now=
 I am trying to figure out how to provide a device tree overlay on this syst=
em, that would define my specific baseboard (or cape, or hat...). What I do =
need to do is:</div><div><ul style=3D"list-style-type: disc;"><li>Disable=
 the HDMI pins,</li><li>I think I dont need to do anything with pins that I=
 need to use as outputs- I can just work with sysfs and userspace for these,=
</li><li>Configure specific pins as belonging to PRU0 or PRU1,</li><li>Enab=
le the ethernet phy with DHCP by default (not sure if this is to be defined =
in the overlay).</li></ul></div>
<div>So question is: how to create such a DTO and make buildroot compile it =
and then later uBoot automatically load it, so the booted system has all t=
he HW ready to be used?</div><div><br /></div><div>I would appreciate all f=
urther feedback!</div><div><br /></div><div id=3D"signature_old" style=3D"c=
lear:both">--<div>=C5=81ukasz Przenios=C5=82o</div></div><div style=3D"clea=
r:both"><br /></div>
<div><br /></div>
<div>
<div>------ Original Message ------</div>
<div>From "=C5=81ukasz Przenios=C5=82o" &lt;<a href=3D"mailto:bremenpl@gmai=
l.com">bremenpl@gmail.com</a>&gt;</div>
<div>To "Edgar Bonet" &lt;<a href=3D"mailto:bonet@grenoble.cnrs.fr">bonet@g=
renoble.cnrs.fr</a>&gt;</div>
<div>Cc <a href=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.org<=
/a></div>
<div>Date 2023-10-28 23:04:22</div>
<div>Subject Re[2]: [Buildroot] Help with DTO</div></div><div><br /></div>
<div id=3D"xd26d2fb6be86498"><blockquote cite=3D"em6bc2a225-6a20-4539-86d0-=
076745906717@9e2fe6c2.com" type=3D"cite" class=3D"cite2">
<div>Hi Edgar and thank you for the answer!</div><div><br /><div class=3D"q=
uote"><div id=3D"xf92eab7c6cd542c39809342847b01392"><div class=3D"plain_lin=
e" style=3D"background-color:rgba(0,0,0,0);margin:3px 0px 16px 5px;">This t=
utorial walks you through a manual configuration. Note that</div>
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


</blockquote></div>
</body></html>
--------=_MBC9B028F6-1B61-431B-B460-25C5F3D1F687--


--===============0168477933592471539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0168477933592471539==--

