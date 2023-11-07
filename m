Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F936C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 15:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FF1E41F4E;
	Tue,  7 Nov 2023 15:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FF1E41F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-vutLhpyYVG; Tue,  7 Nov 2023 15:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B77A41F44;
	Tue,  7 Nov 2023 15:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B77A41F44
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CC3F1BF32E
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 15:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7621460A94
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 15:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7621460A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qR1hnp-P3XWI for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 15:47:39 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53FEB605E9
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 15:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53FEB605E9
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5409bc907edso9704934a12.0
 for <buildroot@buildroot.org>; Tue, 07 Nov 2023 07:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699372057; x=1699976857;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Be8jr5yUE4SYw0nb3UhDBrgoBRcE73ruXpUuZ81V2ww=;
 b=uwNt0a7etCLATZ5k+gd+H7+PoFA6NzM19JdAWGa6H34L6YJE61mJrj6sJycdslWqjv
 XbKHjacblOeVJJFNJUGh1jmTplHqFxJ/DhkCylvUD4hXIJWVPBOpir86CR8zJMbT/Cik
 OVPob8Gs4Iv1hoq3OW6JiWkmjJapi/r0McnizKw1PNv5KZZ3HQl7pUng9EL2BvXdvCLr
 nqLaGF59BADNaJKdYOBYK//gMVsWKBK2zFFfrLqWUZ/Ey6HgRcCmK1IhpYU5o0nKglMl
 Pn6zBtaHatudi6+jDYliXT9NgdE1uqQhNvIBC/+aXNTZdUJziMfXSAVVz6M1moKDtDHc
 WXsg==
X-Gm-Message-State: AOJu0YyBPOiuq8sret/GkTB1r9gbDTJ70wiyg831glHWGqN2z6XQ7VoE
 ax4hkpbAhfv2O5SZ4PRbhkXkSabnemmWQUKe/HoXI6SW8mHyRnz0
X-Google-Smtp-Source: AGHT+IEy1dM6zdvoSLZulySDM+1X0IpTJ7OuAB8e+kdU67p/4KgPnqKihKzsafvYA3/TTq8SCibeWLLUHZ350Si8F6Y=
X-Received: by 2002:a17:906:144f:b0:9db:9c5e:a9d7 with SMTP id
 q15-20020a170906144f00b009db9c5ea9d7mr9769161ejc.33.1699372057430; Tue, 07
 Nov 2023 07:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20231017104015.1492775-1-adam.duskett@amarulasolutions.com>
 <20231017104015.1492775-2-adam.duskett@amarulasolutions.com>
 <20231102180158.5696121f@windsurf>
In-Reply-To: <20231102180158.5696121f@windsurf>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 7 Nov 2023 08:47:27 -0700
Message-ID: <CAHDQB6Nx-Yp-9aVBD3tBUVxq2CGHBVxjgU+y2CWAVoq50P7Mmg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699372057; x=1699976857;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Be8jr5yUE4SYw0nb3UhDBrgoBRcE73ruXpUuZ81V2ww=;
 b=c1MNFd99SaKyCpb1MhQShxJ3WmiF4pCyKreF1GmWC+fkJG9WY30ftn15PJZikH45Z4
 5lrmZdR1FozaHf5wko9mOfVXpvb9Mh4mNHHOmARZM5b8nYEmYoNXHMTgDIpE6lyWGS71
 R/TUaWMuT0E6R3y8xsMWU6czGbS5WLQszNDQ0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=c1MNFd99
Subject: Re: [Buildroot] [PATCH 2/5] package/mender-grubenv: Fix per-package
 building
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3796488202230526745=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3796488202230526745==
Content-Type: multipart/alternative; boundary="000000000000d323e9060991e39d"

--000000000000d323e9060991e39d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oops! Yes! That is correct!

Thanks Thomas!

Adam Duskett

Senior Embedded Systems Developer

M. +1208-515-8102

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Thu, Nov 2, 2023 at 11:02=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Tue, 17 Oct 2023 12:40:12 +0200
> Adam Duskett <adam.duskett@amarulasolutions.com> wrote:
>
> > -define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
> > -     $(MENDER_GRUBENV_INSTALL_I386_CFG)
> > -     $(MENDER_GRUBENV_INSTALL_EFI_CFG)
> > -endef
>
> So presumably MENDER_GRUBENV_INSTALL_IMAGES =3D YES is no longer needed?
>
> (No need to resend for that: can be fixed when applying, I just want a
> confirmation)
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000d323e9060991e39d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oops! Yes! That is correct!<div><br></div><div>Thanks Thom=
as!</div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature=
" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" =
style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;vertical-align:baseline;white-space:pre-wrap"=
>Adam Duskett</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999=
998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-fa=
mily:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:tr=
ansparent;vertical-align:baseline;white-space:pre-wrap">Senior Embedded Sys=
tems Developer</span></p><p dir=3D"ltr" style=3D"line-height:1.799999999999=
9998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-f=
amily:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:t=
ransparent;vertical-align:baseline;white-space:pre-wrap">M. +1208-515-8102<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubu=
ntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vert=
ical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:adam.duskett@am=
arulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>=
</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ub=
untu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;ver=
tical-align:baseline;white-space:pre-wrap">________________________________=
__</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;=
Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;v=
ertical-align:baseline;white-space:pre-wrap"><br></span><span style=3D"font=
-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-color:=
transparent;vertical-align:baseline;white-space:pre-wrap">Amarula Solutions=
 BV</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot=
;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;=
vertical-align:baseline;white-space:pre-wrap">Joop Geesinkweg 125, 1114 AB,=
 Amsterdam, NL</span></p><p dir=3D"ltr" style=3D"line-height:1.799999999999=
9998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-f=
amily:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:t=
ransparent;vertical-align:baseline;white-space:pre-wrap">T. +31 (0)85 111 9=
170</span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;=
,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:bas=
eline;white-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-f=
amily:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:t=
ransparent;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:=
info@amarulasolutions.com" target=3D"_blank">info@amarulasolutions.com</a><=
/span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top=
:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.com/" target=
=3D"_blank"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quo=
t;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:b=
aseline;white-space:pre-wrap">www.amarulasolutions.com</span></a></p><div><=
br></div></span></div></div></div><br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 2, 2023 at 11:02=E2=
=80=AFAM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.co=
m">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, 17 Oct 2023 12:40:12 +0200<br>
Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com" targe=
t=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; -define MENDER_GRUBENV_INSTALL_IMAGES_CMDS<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(MENDER_GRUBENV_INSTALL_I386_CFG)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(MENDER_GRUBENV_INSTALL_EFI_CFG)<br>
&gt; -endef<br>
<br>
So presumably MENDER_GRUBENV_INSTALL_IMAGES =3D YES is no longer needed?<br=
>
<br>
(No need to resend for that: can be fixed when applying, I just want a<br>
confirmation)<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000d323e9060991e39d--

--===============3796488202230526745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3796488202230526745==--
