Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A028BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 21:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33D874EF49;
	Sun, 29 Oct 2023 21:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33D874EF49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhOSkGOr63D6; Sun, 29 Oct 2023 21:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 394A94EF6B;
	Sun, 29 Oct 2023 21:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 394A94EF6B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D79F41BF3DA
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 21:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBB0D4356A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 21:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBB0D4356A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XuM6LFQ82s8p for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 21:20:28 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12EAC43553
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 21:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12EAC43553
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507cd62472dso5587248e87.0
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 14:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698614426; x=1699219226;
 h=mime-version:subject:user-agent:references:in-reply-to:message-id
 :date:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u03r58i4REfHrJy8W/dCRyHTlwHIYmQJsnmtCTdIIP8=;
 b=Dhuxh9utuiVOPND8sBFj/w6CozMmz7oSoBzlE4ZEUccjIPoGJnJOo2sxlAxlNrYMlw
 mCHlOelRGk9rUC3J3difJehdwHyIbYSKMAUTWFVDlGRYgvMaHrXEamxjj2GfODeyP84D
 86DmV5IaB9T6IkUQQ5jMHkWwW53Grlz0YuDlR3z9Y60LPhqCDvJaAr36Hc2neaLB6ZdA
 0qqkgdIe1b/Pw5rvhcxsxKIB3Yhjddai8LFYtcVEbPbGSVkkCRxS1xNK713vuJ8/EuQG
 LRAhsmq49mins12nIp7tHIgHOwuK4zQzYdXKuWbbaIqeYYFsw2KB4q92g8nZr6QAm1oH
 SzGg==
X-Gm-Message-State: AOJu0YwT2s9bTbMxkAsO0t7G/+OYgHP5XxpoqHyiWYCy16uwQ2s19yJt
 Cb0Tc+fCr0P8jWzwjV1qJm8kIr1mi+g=
X-Google-Smtp-Source: AGHT+IFAfiZjGbQALXazeJfO0TnqeUar00Jf6KuLlomPNW5Jprm8dUfDB9rvr68NZdTK9Qcl4wyh9g==
X-Received: by 2002:a05:6512:4010:b0:507:9b69:6028 with SMTP id
 br16-20020a056512401000b005079b696028mr3037259lfb.24.1698614425395; 
 Sun, 29 Oct 2023 14:20:25 -0700 (PDT)
Received: from [192.168.7.128] (epd88.neoplus.adsl.tpnet.pl. [83.20.45.88])
 by smtp.gmail.com with ESMTPSA id
 eq15-20020a056512488f00b005057a5587f0sm1165904lfb.52.2023.10.29.14.20.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Oct 2023 14:20:24 -0700 (PDT)
From: Bremenpl <bremenpl@gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Sun, 29 Oct 2023 22:20:22 +0100
Message-ID: <18b7d4f29f0.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
In-Reply-To: <47321b8a-6e6a-43a2-b38c-bcc1defcb5c1@grenoble.cnrs.fr>
References: <em9eec97a0-87a4-4352-9e89-03948b436830@9e2fe6c2.com>
 <61e80819-c901-486c-afdd-1e69441821e2@grenoble.cnrs.fr>
 <em29cb4aaa-8ce7-4449-986c-81c594d64587@9e2fe6c2.com>
 <47321b8a-6e6a-43a2-b38c-bcc1defcb5c1@grenoble.cnrs.fr>
User-Agent: AquaMail/1.47.0 (build: 104700356)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698614426; x=1699219226; darn=buildroot.org;
 h=mime-version:subject:user-agent:references:in-reply-to:message-id
 :date:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u03r58i4REfHrJy8W/dCRyHTlwHIYmQJsnmtCTdIIP8=;
 b=Qz2OPiLeWplqIYLGyWw9ltZ2l2C3eQX09J/Z7pxvsgwEfQ9VDxH3ilAapzyEMifUJg
 kY4b7YjC95OaZGyfukrEzDDnrZizBll/KOLr6EtORAv8fDVDo7EsOynnYN63XE4NygB7
 umzymSqRxFZZi3i8rXQ+j6Yj6CmtfwysSQbzO4D3XD8n7KSv0FBOX3dSt7f53gVrrC/3
 cSdyo4EJBvM/lcCCMlWJns3ojFSflPHzUDf78KG5g+/CwyKyCeVa08xFu5Oi5mlCRXMw
 NqOkRgBzAAdSQrrfazgQTPIsMvN8x1QlfWllHAc8hNw2L7QCRGaWl6zA5xYQDXFiy+lB
 K8MQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qz2OPiLe
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5814154022615990605=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============5814154022615990605==
Content-Type: multipart/alternative; boundary="18b7d4f2c011d25284e8e464f7"

This is a multi-part message in MIME format.
--18b7d4f2c011d25284e8e464f7
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Edgar, thanks for the answer.

> I find it weird that `ls` sees /dev/gpiochip*, yet `gpiodetect` does not
> detect anything. Are you using the configuration from the tutorial or
> Buildroot's beaglebone_defconfig? One notable difference between them
> that the latter uses the Beagleboard Linux kernel from GitHub, whereas
> the former uses mainline Linux 6.0. I wonder whether this may make a
> difference for you.

I am using the one from Buildroot's dir (so the latter). I can try again to 
use the one from the tutorial for double checking, but for me it seems more 
as if these tools were broken or there was a problem with stdout? I am 
giving this guess based on the fact that none of them ge erate no output at 
all, not even something that would say "no gpios"- unless that is by design 
for these tools... Do these tools return any output on you BBB with 
Buildroot image?

> Regarding the DT overlay, I have never tried something similar. I found
> a tutorial from Bootlin.[1] According to it, the overlay is managed just
> like the defconfig itself. If you write such an overlay, Buildroot
> should compile it if, on `make menuconfig`, you list it under
>
>    Kernel / Out-of-tree Device Tree Source file paths

Yes, this one has caught my eyes. The issue is that it was too high level 
(or too generic) explanation for me, so I was not able to deduce how to 
actually do what I want to do. I was hoping to find some more noob friendly 
manual/ tutorial.

Either way, I will keep digging/ trying. Thank you a lot!


On October 29, 2023 21:51:14 Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:

> Hello!
>
> Łukasz Przeniosło wrote:
>> The problem is that thse mentioned commands [gpiodetect, gpioinfo...]
>> provide no output in my shell (here run one by one with no output):
>
> I find it weird that `ls` sees /dev/gpiochip*, yet `gpiodetect` does not
> detect anything. Are you using the configuration from the tutorial or
> Buildroot's beaglebone_defconfig? One notable difference between them
> that the latter uses the Beagleboard Linux kernel from GitHub, whereas
> the former uses mainline Linux 6.0. I wonder whether this may make a
> difference for you.
>
> Regarding the DT overlay, I have never tried something similar. I found
> a tutorial from Bootlin.[1] According to it, the overlay is managed just
> like the defconfig itself. If you write such an overlay, Buildroot
> should compile it if, on `make menuconfig`, you list it under
>
>    Kernel / Out-of-tree Device Tree Source file paths
>
> Regards,
>
> Edgar.
>
> [1] 
> https://bootlin.com/blog/using-device-tree-overlays-example-on-beaglebone-boards/


--18b7d4f2c011d25284e8e464f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body style=3D"font-family: Arial, Myriad, 'Liberation Sans', sans-serif;">
<div dir=3D"auto">
<div dir=3D"auto">Hi Edgar, thanks for the answer.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><blockquote type=3D"cite" class=3D"gmail_quote" =
style=3D"padding-left: 0.75ex; border-left-width: 1px; border-left-color: r=
gb(128, 128, 128); font-family: sans-serif; margin: 0px 0px 0px 0.75ex;"><d=
iv dir=3D"auto">I find it weird that `ls` sees /dev/gpiochip*, yet `gpiodet=
ect` does not</div><div dir=3D"auto">detect anything. Are you using the con=
figuration from the tutorial or</div><div dir=3D"auto">Buildroot's beaglebo=
ne_defconfig? One notable difference between them</div><div dir=3D"auto">th=
at the latter uses the Beagleboard Linux kernel from GitHub, whereas</div><=
div dir=3D"auto">the former uses mainline Linux 6.0. I wonder whether this =
may make a</div><div dir=3D"auto">difference for you.</div></blockquote></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">I am using the one from Bu=
ildroot's dir (so the latter). I can try again to use the one from the tuto=
rial for double checking, but for me it seems more as if these tools were b=
roken or there was a problem with stdout? I am giving this guess based on t=
he fact that none of them ge erate no output at all, not even something tha=
t would say "no gpios"- unless that is by design for these tools... Do thes=
e tools return any output on you BBB with Buildroot image?</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><blockquote type=3D"cite" class=3D"gmail=
_quote" style=3D"padding-left: 0.75ex; border-left-width: 1px; border-left-=
color: rgb(128, 128, 128); font-family: sans-serif; margin: 0px 0px 0px 0.7=
5ex;"><div dir=3D"auto">Regarding the DT overlay, I have never tried someth=
ing similar. I found</div><div dir=3D"auto">a tutorial from Bootlin.[1] Acc=
ording to it, the overlay is managed just</div><div dir=3D"auto">like the d=
efconfig itself. If you write such an overlay, Buildroot</div><div dir=3D"a=
uto">should compile it if, on `make menuconfig`, you list it under</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">&nbsp; &nbsp; Kernel / Out-of-tr=
ee Device Tree Source file paths</div></blockquote></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Yes, this one has caught my eyes. The issue is =
that it was too high level (or too generic) explanation for me, so I was no=
t able to deduce how to actually do what I want to do. I was hoping to find=
 some more noob friendly manual/ tutorial.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Either way, I will keep digging/ trying. Thank you a lot=
!</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black; font-family: sans-serif;">
<div dir=3D"auto">On October 29, 2023 21:51:14 Edgar Bonet &lt;bonet@grenob=
le.cnrs.fr&gt; wrote:</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Hello!</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">=C5=81ukasz Przenios=C5=82o wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">The problem is that thse mentioned commands [gpiodetect, =
gpioinfo...]</div>
<div dir=3D"auto">provide no output in my shell (here run one by one with n=
o output):</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I find it weird that `ls` sees /dev/gpiochip*, yet `gpiod=
etect` does not</div>
<div dir=3D"auto">detect anything. Are you using the configuration from the=
 tutorial or</div>
<div dir=3D"auto">Buildroot's beaglebone_defconfig? One notable difference =
between them</div>
<div dir=3D"auto">that the latter uses the Beagleboard Linux kernel from Gi=
tHub, whereas</div>
<div dir=3D"auto">the former uses mainline Linux 6.0. I wonder whether this=
 may make a</div>
<div dir=3D"auto">difference for you.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Regarding the DT overlay, I have never tried something si=
milar. I found</div>
<div dir=3D"auto">a tutorial from Bootlin.[1] According to it, the overlay =
is managed just</div>
<div dir=3D"auto">like the defconfig itself. If you write such an overlay, =
Buildroot</div>
<div dir=3D"auto">should compile it if, on `make menuconfig`, you list it u=
nder</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; &nbsp; Kernel / Out-of-tree Device Tree Source fil=
e paths</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Regards,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Edgar.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">[1] https://bootlin.com/blog/using-device-tree-overlays-e=
xample-on-beaglebone-boards/</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--18b7d4f2c011d25284e8e464f7--


--===============5814154022615990605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5814154022615990605==--

