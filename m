Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD6CC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4355B40C2A;
	Wed,  8 Feb 2023 16:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4355B40C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id guL_BPpu0WxU; Wed,  8 Feb 2023 16:15:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FF4240C25;
	Wed,  8 Feb 2023 16:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FF4240C25
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F88D1BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1950E408BC
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1950E408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjY5ff7lX-Ys for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:15:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF112408BA
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF112408BA
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:15:08 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 c10-20020a17090a1d0a00b0022e63a94799so3026708pjd.2
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 08:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dalqKFeLWGol9n5tJfLkLqeEWpfhSKgxCVQDUjSR+xc=;
 b=hgiO02Mh4G4CJ5s42U34e3LTDja8XTatu18kSeU1nz5a0K81G87K/QMXd2E/WJRiQ6
 o7B51HAS9SNkmDFs7AE1dzY6bKzHvXzJPMugHMUi9gDM9mw+X7fn0ENHST/bVZLP6bIF
 BJlf1979tt0NYcKJKpMTpfFtctACX2z/KxZQ4aVSXNlk23EZdC7LdlB1jjOjD0Pmnj3i
 /6pk6tVHZa/n+Oj2bo2cGnDFpziVQRe1LIyNZ97wwSWJUiRO+OwmPEV1I9tXMj12Vx4C
 ROzVGTcNOSnqla/QhvKjOfRaHzwyk2aU8bsishUeuu4QKHKZTpAd6Is6ec2wTUFiJWi7
 QKDw==
X-Gm-Message-State: AO0yUKUWvkD+SzleKYxyKgaiBKz+16zH7Xj48/eHD66XA1QCq7yv3JIk
 33z2U5emxIC+31gnYbNi3KA/ezeoIbsGoinKRk6LlarB9JQ=
X-Google-Smtp-Source: AK7set/fIVYcCSIg8JgJ7RmqiHJ9Qs9IRsb+7vkihGFVKzO5uNCfTHz3Mm5QsS0gzN4Spae7edt089TjtKb1I4RbMM0=
X-Received: by 2002:a17:90a:7282:b0:230:cf7b:d850 with SMTP id
 e2-20020a17090a728200b00230cf7bd850mr816736pjg.50.1675872907539; Wed, 08 Feb
 2023 08:15:07 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeSsqfaF0P7g_hxQ2EjSh=zDG9=FTnLrbq5g4+22UNJq-xw@mail.gmail.com>
In-Reply-To: <CADYjeSsqfaF0P7g_hxQ2EjSh=zDG9=FTnLrbq5g4+22UNJq-xw@mail.gmail.com>
From: Ramon Crichlow <rcrichlow9000@gmail.com>
Date: Wed, 8 Feb 2023 10:14:56 -0600
Message-ID: <CACHw65+r07g=hU4yv1Xhb3TFVmOVkYdSpRy3dZF9y+U44TK=Qw@mail.gmail.com>
To: Sourabh Hegde <hrsourabh011@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dalqKFeLWGol9n5tJfLkLqeEWpfhSKgxCVQDUjSR+xc=;
 b=H6SqL/4T6OFiwL6T2vfbmWl/GNV3Tg9rj8lvv00njW5QWpXCGhXocqhlAAuHxJrST4
 5+9roi/Oxxn4mn/waYsDmpZ/zLm3lqvQTULPzp7hzlhJOTeajHcOwoKlgwPSIzj8gdcG
 exgBDASx9Ul9n+Bj+VjMKmZ2RWSS/pAwP2EkTKafSZw8eoLap5KEv1rrfCG1XWRZBr1k
 JlSg8DS3t6tnwKfxYUGbyiabG/aW1I+xbSroO5b7HOSTwW8byWovgWpmWn85IvaAcbWK
 JKDammRqwl0W2uF5vfvvk/oH5HKqTCMBxzBPmM9jFfK7CD1TY0NEs6QaFiC6X8SDnt0d
 ocsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H6SqL/4T
Subject: Re: [Buildroot] How to install custom sdk in buildroot?
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
Content-Type: multipart/mixed; boundary="===============4967038517579027818=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4967038517579027818==
Content-Type: multipart/alternative; boundary="00000000000057bae505f4329165"

--00000000000057bae505f4329165
Content-Type: text/plain; charset="UTF-8"

You can build an external toolchain with buildroot using make sdk (See
Section 6.1.3 in buildroot manual
<https://buildroot.org/downloads/manual/manual.html>)

Also from the manual (Section 11.2)
It has been decided that support for the native compiler on the target
would be stopped from the Buildroot-2012.11 release because:

this feature was neither maintained nor tested, and often broken;
this feature was only available for Buildroot toolchains;
Buildroot mostly targets small or very small target hardware with limited
resource onboard (CPU, ram, mass-storage), for which compiling on the
target does not make much sense;
Buildroot aims at easing the cross-compilation, making native compilation
on the target unnecessary.


On Wed, Feb 8, 2023 at 10:07 AM Sourabh Hegde <hrsourabh011@gmail.com>
wrote:

> Hello All,
>
> I want to install a sdk on my Buildroot based Linux machine. SDK location
> https://github.com/aws/aws-iot-device-sdk-python-v2 . They don't have any
> packages which I can add in Buildroot.
>
> On a native Linux machine, it can be done via pip. But how to do this in
> Buildroot?
>
> Thanks in advance
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000057bae505f4329165
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You can build an external toolchain with buildroot using m=
ake sdk (See Section 6.1.3 in <a href=3D"https://buildroot.org/downloads/ma=
nual/manual.html">buildroot manual</a>)<div><br></div><div>Also from the ma=
nual (Section 11.2)</div><div>It has been decided that support for the nati=
ve compiler on the target would be stopped from the Buildroot-2012.11 relea=
se because:<br><br>this feature was neither maintained nor tested, and ofte=
n broken;<br>this feature was only available for Buildroot toolchains;<br>B=
uildroot mostly targets small or very small target hardware with limited re=
source onboard (CPU, ram, mass-storage), for which compiling on the target =
does not make much sense;<br>Buildroot aims at easing the cross-compilation=
, making native compilation on the target unnecessary.<br></div><div><br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Feb 8, 2023 at 10:07 AM Sourabh Hegde &lt;<a href=3D"mailto:hrs=
ourabh011@gmail.com">hrsourabh011@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello=C2=A0All,=
<br><div><br></div><div>I want to install a sdk on my Buildroot based Linux=
 machine. SDK location=C2=A0<a href=3D"https://github.com/aws/aws-iot-devic=
e-sdk-python-v2" target=3D"_blank">https://github.com/aws/aws-iot-device-sd=
k-python-v2</a>=C2=A0. They don&#39;t have any packages which=C2=A0I can ad=
d in Buildroot.</div><div><br></div><div>On a native Linux machine, it can =
be done via pip. But how to do this in Buildroot?</div><div><br></div><div>=
Thanks in advance</div></div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--00000000000057bae505f4329165--

--===============4967038517579027818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4967038517579027818==--
