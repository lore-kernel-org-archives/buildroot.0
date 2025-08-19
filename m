Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF59CCA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 18:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D19260BB1;
	Tue, 19 Aug 2025 18:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TfnukRos-s7; Tue, 19 Aug 2025 18:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1801A60AFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1801A60AFE;
	Tue, 19 Aug 2025 18:20:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2732EE2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1936D40C1F
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUHFtL7ugTHO for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 18:20:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1935040C31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1935040C31
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1935040C31
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:20:07 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b475dfb4f42so533930a12.0
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 11:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755627607; x=1756232407;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KRds8rFokGdyBMI03M3S6SKlXx+liTDuteNbYo2u8pM=;
 b=wgv6P5kGH6p36SVj7DvxPSXNpfWv9jfBa89bUw0uGgQvVsaeIXUyww+xxpUlzV999g
 /C5uwOp/t/oEYsjjEaSqNlj+JBeutjIk7OMQsBi32cTYQ59ZHrIWXi85uhP1YUaQ6YJD
 SNnPeye6Ipsxjapotua7kbVN+vpONfcfx7Vt7oghyKRLqqJd7v/oFdG5hyewPDzMGdAv
 mf+IbNCWhQiybdeG52YESfUAhuh0HJcZYMnN3iZTciKdtA7HW60ct3GNost6v5DpqYDj
 ZOso6cS/44yEgTY1VKx6VOMC+chFapg4b5szPuD9+9p/W3pg2GpnDyIUG+BuAC2E1Gox
 3NOQ==
X-Gm-Message-State: AOJu0Yy9tlOvsaKrIXaqM+G2YovgXzaZ6vk18Fa1y3VCby2NHWdXQIOV
 aftWoq4QrDluvmh8Lr8EW/Pogd2VjhbYl54fd/tG1sehEu2V4ogXvaBYUcyPGE38l2hqpN+oUV0
 RPF6kfCrey5uRLx/qAR3X2MsG6ikYrR0wJMPBRU+TJ5eFQem+BTlEdWw=
X-Gm-Gg: ASbGncvdxi7tdeLam7PET5hfoUUZIRhTJ3rUO3rZKk97MOzGZhD3atZZLTi9DqBl4Ud
 sQ5vGYGOnU9W+0DkMEV6Q9T/kLZPkqJ0kYlpYE3wx9C9ooBenK4eU8UlddY5yuYcdKyxfwsy/0v
 HMPLK3xIwrBj0A/+TNwkyoKEB+m5+pC2f+0TeHZib9TNw+SerIU2nOaC4EJwxcup/X784qKge7t
 Mi5urQB
X-Google-Smtp-Source: AGHT+IH19kfSUHvnHQOIdzbDqstwuVVHhFFye4T9FcwsBBp5liR9llyWXkn4A7Tx7rA2CcoM7GVAKffu/8L6JnQPX3E=
X-Received: by 2002:a17:902:cccb:b0:241:ff36:552d with SMTP id
 d9443c01a7336-245e02b9ed1mr58859605ad.1.1755627606524; Tue, 19 Aug 2025
 11:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250819181451.3012126-1-michael@amarulasolutions.com>
In-Reply-To: <20250819181451.3012126-1-michael@amarulasolutions.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 20:19:55 +0200
X-Gm-Features: Ac12FXyhdSyztDHEVUhrohWngImdr0jNuBBKjpZ9BJMyHNt8flStXRnZgheGYeM
Message-ID: <CAOf5uw=ubgJk6ikqLFFRdnjrLCTsfeYPjiArjTTy6kHoGUdMug@mail.gmail.com>
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755627607; x=1756232407;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KRds8rFokGdyBMI03M3S6SKlXx+liTDuteNbYo2u8pM=;
 b=BaYKSdK/JLp4JvZrKQOPpdLgx7rpuTprpJe9edQGDW03SrkeO42j0ndKEXyEoCoI0s
 mvo4HPTzW8HEli5AQgVus3FcvqVkbaiY2KCyRVWcXThZpCTbfR7CXtGuDdRNG82+wlkj
 qnmZzZ2NUUgMAGf7mE8LOPvWNWMExOBojhOgw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BaYKSdK/
Subject: Re: [Buildroot] [PATCH 0/6] Update Engicam boards
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0201078099266374094=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0201078099266374094==
Content-Type: multipart/alternative; boundary="000000000000d87b8d063cbbe73b"

--000000000000d87b8d063cbbe73b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas

On Tue, Aug 19, 2025 at 8:14=E2=80=AFPM Michael Trimarchi <
michael@amarulasolutions.com> wrote:

> Migrate all the engicam boards to newest kernel and uboot version.
> This series should fix only the building issue and we plan to test
> next week.
>
>

I have done it tonight. Some of them I will re-spin after a real testing on
some of the boards that we don't have.
I need to know a part of patch 1 that has some order problems. If the
general approach is fine

Michael


> Michael Trimarchi (6):
>   linux: add missing hash for linux 6.12.36
>   configs/engicam_imx6qdl_icore_defconfig: bump Linux to 6.12.36 and
>     U-Boot to 2025.07
>   configs/engicam_imx6qdl_icore_qt5_defconfig: bump Linux to 6.12.36 and
>     U-Boot to 2025.07
>   configs/engicam_imx6qdl_icore_rqs_defconfig: bump Linux to 6.12.36 and
>     U-Boot to 2025.07
>   configs/engicam_imx6ul_geam_defconfig: bump Linux to 6.12.36 and
>     U-Boot to 2025.07
>   configs/engicam_imx6ul_isiot_defconfig: bump Linux to 6.12.36 and
>     U-Boot to 2025.07
>
>  board/engicam/icorem6/linux_qt5.fragment    |  4 ----
>  configs/engicam_imx6qdl_icore_defconfig     | 14 ++++++++++----
>  configs/engicam_imx6qdl_icore_qt5_defconfig | 16 ++++++++++------
>  configs/engicam_imx6qdl_icore_rqs_defconfig | 14 ++++++++++----
>  configs/engicam_imx6ul_geam_defconfig       | 20 ++++++++++++--------
>  configs/engicam_imx6ul_isiot_defconfig      | 20 ++++++++++++--------
>  linux/linux.hash                            |  2 ++
>  7 files changed, 56 insertions(+), 34 deletions(-)
>  delete mode 100644 board/engicam/icorem6/linux_qt5.fragment
>
> --
> 2.43.0
>
>

--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

--000000000000d87b8d063cbbe73b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas<div><br></div></div><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Aug 19, 2025 at 8:14=E2=80=AFPM Michael Trimarchi &lt;<a href=3D"=
mailto:michael@amarulasolutions.com">michael@amarulasolutions.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Migrate al=
l the engicam boards to newest kernel and uboot version.<br>
This series should fix only the building issue and we plan to test<br>
next week.<br>
<br></blockquote><div><br></div><div><br class=3D"gmail-Apple-interchange-n=
ewline">I have done it tonight. Some of them I will re-spin after a real te=
sting on some of the boards that we don&#39;t have.</div><div>I need to kno=
w a part of patch 1 that has some order problems. If the general approach=
=C2=A0is fine</div><div><br></div><div>Michael</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
Michael Trimarchi (6):<br>
=C2=A0 linux: add missing hash for linux 6.12.36<br>
=C2=A0 configs/engicam_imx6qdl_icore_defconfig: bump Linux to 6.12.36 and<b=
r>
=C2=A0 =C2=A0 U-Boot to 2025.07<br>
=C2=A0 configs/engicam_imx6qdl_icore_qt5_defconfig: bump Linux to 6.12.36 a=
nd<br>
=C2=A0 =C2=A0 U-Boot to 2025.07<br>
=C2=A0 configs/engicam_imx6qdl_icore_rqs_defconfig: bump Linux to 6.12.36 a=
nd<br>
=C2=A0 =C2=A0 U-Boot to 2025.07<br>
=C2=A0 configs/engicam_imx6ul_geam_defconfig: bump Linux to 6.12.36 and<br>
=C2=A0 =C2=A0 U-Boot to 2025.07<br>
=C2=A0 configs/engicam_imx6ul_isiot_defconfig: bump Linux to 6.12.36 and<br=
>
=C2=A0 =C2=A0 U-Boot to 2025.07<br>
<br>
=C2=A0board/engicam/icorem6/linux_qt5.fragment=C2=A0 =C2=A0 |=C2=A0 4 ----<=
br>
=C2=A0configs/engicam_imx6qdl_icore_defconfig=C2=A0 =C2=A0 =C2=A0| 14 +++++=
+++++----<br>
=C2=A0configs/engicam_imx6qdl_icore_qt5_defconfig | 16 ++++++++++------<br>
=C2=A0configs/engicam_imx6qdl_icore_rqs_defconfig | 14 ++++++++++----<br>
=C2=A0configs/engicam_imx6ul_geam_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 =
++++++++++++--------<br>
=C2=A0configs/engicam_imx6ul_isiot_defconfig=C2=A0 =C2=A0 =C2=A0 | 20 +++++=
+++++++--------<br>
=C2=A0linux/linux.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A07 files changed, 56 insertions(+), 34 deletions(-)<br>
=C2=A0delete mode 100644 board/engicam/icorem6/linux_qt5.fragment<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Michael Nazzareno Trimarchi<br>Co-Founder &amp; =
Chief Executive Officer<br>M. +39 347 913 2170<br><a href=3D"mailto:michael=
@amarulasolutions.com" target=3D"_blank">michael@amarulasolutions.com</a><b=
r>__________________________________<br><div><br></div><div>Amarula Solutio=
ns BV</div>Joop Geesinkweg 125, 1114 AB, Amsterdam, NL<br>T. +31 (0)85 111 =
9172<br><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info=
@amarulasolutions.com</a><br><a href=3D"http://www.amarulasolutions.com" ta=
rget=3D"_blank">www.amarulasolutions.com</a><br></div></div></div>

--000000000000d87b8d063cbbe73b--

--===============0201078099266374094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0201078099266374094==--
