Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372BCC636D7
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 18:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4B284091C;
	Wed,  8 Feb 2023 18:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4B284091C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73rH1p-gkP3I; Wed,  8 Feb 2023 18:19:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C156416E8;
	Wed,  8 Feb 2023 18:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C156416E8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 850291BF5E6
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EDEA81FCF
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EDEA81FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w8QqrzKHlS6X for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 18:19:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54AB981FBE
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54AB981FBE
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 18:19:32 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id bj22so16226476oib.11
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 10:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H8Vf8wHrrIMHPJA1WRONk6tPXGG4wI0R+1Axl1ksIbU=;
 b=cGq3W4xAu6FjYJQL23/SGMzVau/SS570aOnbbE5IKuH0t0SVZXg9DPEu9p/ThjLyYF
 UaBQNuuv1lNGppwf64GPZkcL+SnwuNVzNdQ8rfnpO4vixyODIGkCQHkvk/jg7P1oKLPy
 V5svvaz2l0rZbg+ITgiAxraVHNmNX367obfBOkc3+hTKDvDW4FeYCYX5ZTGweZZrcqVO
 8M1G8OBI+oGgEYUdUAnH1zADVK9uE0C5E5EWtu6t8mZufgvkMJBfAgZG55P7AXDMb22X
 ocPRBbmnD+yhE1l0uMS4eJa9CoIkC0bUtSgNmKovVQPRWoPKkS9djUN2impuGrFIO25b
 TP2A==
X-Gm-Message-State: AO0yUKUQld92YCUWTtg9z9UuZPtXa/Nrg6h2OSII0kPfY06Ny6EC25If
 oPB67hMC3o0A5HdrIP6JAhvsQAC/rtJpRxFlhG4=
X-Google-Smtp-Source: AK7set+A1ldIIIPHtSNt/yu7I2uY3v7uJxrzPXf+vuBmGHNnqz5vV3gHinUhpbNCUOrXL4D0HlstI+IZXO0qmXDQNoc=
X-Received: by 2002:aca:da42:0:b0:367:18a6:eb14 with SMTP id
 r63-20020acada42000000b0036718a6eb14mr277357oig.208.1675880371355; Wed, 08
 Feb 2023 10:19:31 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeSsqfaF0P7g_hxQ2EjSh=zDG9=FTnLrbq5g4+22UNJq-xw@mail.gmail.com>
 <CACHw65+r07g=hU4yv1Xhb3TFVmOVkYdSpRy3dZF9y+U44TK=Qw@mail.gmail.com>
In-Reply-To: <CACHw65+r07g=hU4yv1Xhb3TFVmOVkYdSpRy3dZF9y+U44TK=Qw@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Wed, 8 Feb 2023 19:19:20 +0100
Message-ID: <CADYjeStPWnGcr23XOGnB+61eZ=iZKVj8YkhDKSaw0BUFT7WC-A@mail.gmail.com>
To: Ramon Crichlow <rcrichlow9000@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H8Vf8wHrrIMHPJA1WRONk6tPXGG4wI0R+1Axl1ksIbU=;
 b=Y8oHxIEe7fH8hLWjeot13nrzPcz1cv9sQI/ttszHBzqVFHLFD3gufeUhPknyAGno9Q
 S6WVtgPq4pLZ5yzULzJhKpXlWq2614EqnXXSqsiKtFAkQ83JK7GTMpHCiUBOHh8cTTG6
 hljhlDm5lPvJvMOJ0QYJeaOevUNq9dDZu6hxuc/ZdNkKqe174wW83nIeLzgdk4/RJ2yt
 HgFbGPqUz6/7tjC4r20fBmxfxt2GKUftfEeGjpRZmt8nBqf+E+hFodCqTYHc9GCn+mUh
 sU+mhGVSoSkH7Jy3C/BVAZwWKYcDWldWTh24gMEM1D/vcCKrjPC14PbPx/J0yX4YbZmx
 98aQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Y8oHxIEe
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
Content-Type: multipart/mixed; boundary="===============3323275010630958468=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3323275010630958468==
Content-Type: multipart/alternative; boundary="0000000000003885cc05f4344edf"

--0000000000003885cc05f4344edf
Content-Type: text/plain; charset="UTF-8"

Hello Ramon,

I don't want an external toolchain. Maybe I was not clear. My goal is to
use the program/sdk from here
https://github.com/aws/aws-iot-device-sdk-python-v2 , this is a python
based project. And no package is available for this. Can I use python-pip
to install it?

On Wed, 8 Feb 2023 at 17:15, Ramon Crichlow <rcrichlow9000@gmail.com> wrote:

> You can build an external toolchain with buildroot using make sdk (See
> Section 6.1.3 in buildroot manual
> <https://buildroot.org/downloads/manual/manual.html>)
>
> Also from the manual (Section 11.2)
> It has been decided that support for the native compiler on the target
> would be stopped from the Buildroot-2012.11 release because:
>
> this feature was neither maintained nor tested, and often broken;
> this feature was only available for Buildroot toolchains;
> Buildroot mostly targets small or very small target hardware with limited
> resource onboard (CPU, ram, mass-storage), for which compiling on the
> target does not make much sense;
> Buildroot aims at easing the cross-compilation, making native compilation
> on the target unnecessary.
>
>
> On Wed, Feb 8, 2023 at 10:07 AM Sourabh Hegde <hrsourabh011@gmail.com>
> wrote:
>
>> Hello All,
>>
>> I want to install a sdk on my Buildroot based Linux machine. SDK location
>> https://github.com/aws/aws-iot-device-sdk-python-v2 . They don't have
>> any packages which I can add in Buildroot.
>>
>> On a native Linux machine, it can be done via pip. But how to do this in
>> Buildroot?
>>
>> Thanks in advance
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>

--0000000000003885cc05f4344edf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Ramon,<div><br></div><div>I don&#39;t want an extern=
al toolchain. Maybe I was not clear. My goal is to use the program/sdk from=
 here=C2=A0<a href=3D"https://github.com/aws/aws-iot-device-sdk-python-v2">=
https://github.com/aws/aws-iot-device-sdk-python-v2</a>=C2=A0, this is a py=
thon based project. And no package is available for this. Can I use python-=
pip to install it?=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 8 Feb 2023 at 17:15, Ramon Crichlow &=
lt;<a href=3D"mailto:rcrichlow9000@gmail.com">rcrichlow9000@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr">You can build an external toolchain with buildroot using make sd=
k (See Section 6.1.3 in <a href=3D"https://buildroot.org/downloads/manual/m=
anual.html" target=3D"_blank">buildroot manual</a>)<div><br></div><div>Also=
 from the manual (Section 11.2)</div><div>It has been decided that support =
for the native compiler on the target would be stopped from the Buildroot-2=
012.11 release because:<br><br>this feature was neither maintained nor test=
ed, and often broken;<br>this feature was only available for Buildroot tool=
chains;<br>Buildroot mostly targets small or very small target hardware wit=
h limited resource onboard (CPU, ram, mass-storage), for which compiling on=
 the target does not make much sense;<br>Buildroot aims at easing the cross=
-compilation, making native compilation on the target unnecessary.<br></div=
><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Feb 8, 2023 at 10:07 AM Sourabh Hegde &lt;<a href=
=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank">hrsourabh011@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr">Hello=C2=A0All,<br><div><br></div><div>I want to install a=
 sdk on my Buildroot based Linux machine. SDK location=C2=A0<a href=3D"http=
s://github.com/aws/aws-iot-device-sdk-python-v2" target=3D"_blank">https://=
github.com/aws/aws-iot-device-sdk-python-v2</a>=C2=A0. They don&#39;t have =
any packages which=C2=A0I can add in Buildroot.</div><div><br></div><div>On=
 a native Linux machine, it can be done via pip. But how to do this in Buil=
droot?</div><div><br></div><div>Thanks in advance</div></div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>
</blockquote></div>

--0000000000003885cc05f4344edf--

--===============3323275010630958468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3323275010630958468==--
