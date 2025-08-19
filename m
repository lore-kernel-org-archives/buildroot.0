Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F064CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 14:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1278960AC6;
	Tue, 19 Aug 2025 14:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i26TB9Xwii0G; Tue, 19 Aug 2025 14:05:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1924260AB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1924260AB8;
	Tue, 19 Aug 2025 14:05:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EC72E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80B64811A4
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqpr2jwzThNH for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 14:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 389068119C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 389068119C
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 389068119C
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:05:34 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2445824dc27so49380675ad.3
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 07:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755612333; x=1756217133;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZcT5m0IS6tnYTRqyCAREBAEfQjXrbIICHNLGYLbsVIA=;
 b=tzrcQYiJhY9DXC4Y6ZJEo9mTyv3h/GoD2WKG+AbVTBSUd5QVRPGcCZFxTseDmokbyQ
 OuFgLZHUveyUb9+rFc4TxDfXTvAz9MFefExtFQCdOlzcB6ea/qP66GCFT7Bwv3HM8s2i
 i3caG1uB2ZkeHyaYXa7zf+wu+xsvxhCsfyy0T1XU9OHjm8HXg5uCWSOdqB7uGsmH9Qr7
 u/a/gQ6yTOgqMCDRdLYeNIaFgc3HzHBhOofCi+XYeHa8puE/EpiGrhf7MpCrwaDk3izk
 lUoW5tOpuEOvyznMbwgaWZu3WjsVe63x4b+amZGul5pC6r/duANNven+k/PRodQnw+Ql
 jRew==
X-Gm-Message-State: AOJu0YzLn2bHE+mwADkHkSybvG0ApKQpd+JbLa5sYWJH5fPka2MFVNWR
 BOR4lHv8WMrps0w46aEonOTvajt2nhXpFgHQzwH6YU8fn0zYniTIzkXqGetM3ckel4wMyXX2E4Y
 qYsBIH7JrrejaYU82xJ5hGXOZsLFmRobYtIYXlynsyw==
X-Gm-Gg: ASbGnctx6mAafPJY9EVZfG6JrYiqcjTLgmwOuLh/RuP7FtfsvXYbPR5HwrHBcKrc68I
 3mm6U2xOI+9qPzB8cpFyLzuxfulSvaCyNmoobT9z/U3/zEn1s81u5p0D5xL06bCpmq9h6Ygg+1s
 4pWSflOzK03Txm+BftbuRNED9qUs5UOsY8KgaGJF04Raz4Q08d/AudYbnHNzSodH2wPg52tEqbc
 I/dYgbPiqLCSr5fwEfURpRfMjGPSOBxNk0rVtib
X-Google-Smtp-Source: AGHT+IEPR7rA4HzbLL97+ejkTLUFBolaHaWiOUZe+gjjnofwQ69jWh2WynzwjtE7u026DIFMYrrNr6TXYOJAJq+xkHs=
X-Received: by 2002:a17:902:c410:b0:240:3f43:25f with SMTP id
 d9443c01a7336-245e041d9e0mr31664895ad.23.1755612332928; Tue, 19 Aug 2025
 07:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250818213241.3270409-1-thomas.petazzoni@bootlin.com>
 <CAOf5uwm3V8hsY5YofupxYJufNqSMmAferLhtUrrMC6NtO6RF7w@mail.gmail.com>
 <20250819142521.36865a9c@windsurf>
In-Reply-To: <20250819142521.36865a9c@windsurf>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 16:05:20 +0200
X-Gm-Features: Ac12FXx57IYh6grVSAUvSzfO4FWHJuVA5pzxfBTv-Ys4OFcFa1_k08actOLnti4
Message-ID: <CAOf5uw=Uny0iNhQx3mrJwOt+_Q+XfRxUp-4VEasSrxOF3PHTbQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Meena Murthy <meena.murthy@amarulasolutions.com>, 
 Suniel Mahesh <sunil@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755612333; x=1756217133;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZcT5m0IS6tnYTRqyCAREBAEfQjXrbIICHNLGYLbsVIA=;
 b=CDoo+n8k+QTh+UKVGcNgdm3muiJM3flqJDsXe55JqXvzTsHj0vYGvhwo+u+4Rc76Ga
 iL36DXGLLBnlhafW8fBhLWVJTnKGCAWcV97CqkQjG3yHXTNYGe9RTR88LUKjNjcFqTvA
 4qcN3rUX0EO3qIgcVthRP9gbc0s8f23gIEEqg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=CDoo+n8k
Subject: Re: [Buildroot] [PATCH] configs/engicam_imx6*: remove defconfigs,
 broken
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
Content-Type: multipart/mixed; boundary="===============6418572755352025817=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6418572755352025817==
Content-Type: multipart/alternative; boundary="00000000000077c86d063cb859bb"

--00000000000077c86d063cb859bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Thomas

On Tue, Aug 19, 2025 at 2:25=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Michael,
>
> Thanks for your feedback.
>
> On Tue, 19 Aug 2025 14:00:38 +0200
> Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote:
>
> > We would like to fix them. We need a bit of time up to the end of
> September.
> >
> > Can you please wait?
>
> We have a release scheduled end of August, and those have been broken
> for a long while. I looked, in January 2025 they were already broken,
> and the maintainers of those boards normally received an e-mail telling
> them they were broken.
>
> You can check those jobs from January 2025:
>
>             engicam_imx6qdl_icore |
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262441  |
>         engicam_imx6qdl_icore_qt5 |
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262446  |
>         engicam_imx6qdl_icore_rqs |
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262448  |
>               engicam_imx6ul_geam |
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262452  |
>              engicam_imx6ul_isiot |
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262468  |
>
> So I'm not really willing to do yet another release with broken
> defconfigs that don't even build.
>
>
I will try to make buildable all of them before the end of the month but I
will not able to test for the end of the month

Michael

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
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

--00000000000077c86d063cb859bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>HI Thomas</div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 19, 2025 a=
t 2:25=E2=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@b=
ootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hello Michael,<br>
<br>
Thanks for your feedback.<br>
<br>
On Tue, 19 Aug 2025 14:00:38 +0200<br>
Michael Nazzareno Trimarchi &lt;<a href=3D"mailto:michael@amarulasolutions.=
com" target=3D"_blank">michael@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; We would like to fix them. We need a bit of time up to the end of Sept=
ember.<br>
&gt; <br>
&gt; Can you please wait?<br>
<br>
We have a release scheduled end of August, and those have been broken<br>
for a long while. I looked, in January 2025 they were already broken,<br>
and the maintainers of those boards normally received an e-mail telling<br>
them they were broken.<br>
<br>
You can check those jobs from January 2025:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 engicam_imx6qdl_icore | <a href=
=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262441" rel=3D"no=
referrer" target=3D"_blank">https://gitlab.com/buildroot.org/buildroot/-/jo=
bs/8990262441</a>=C2=A0 |=C2=A0 =C2=A0 =C2=A0 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 engicam_imx6qdl_icore_qt5 | <a href=3D"https://=
gitlab.com/buildroot.org/buildroot/-/jobs/8990262446" rel=3D"noreferrer" ta=
rget=3D"_blank">https://gitlab.com/buildroot.org/buildroot/-/jobs/899026244=
6</a>=C2=A0 |=C2=A0 =C2=A0 =C2=A0 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 engicam_imx6qdl_icore_rqs | <a href=3D"https://=
gitlab.com/buildroot.org/buildroot/-/jobs/8990262448" rel=3D"noreferrer" ta=
rget=3D"_blank">https://gitlab.com/buildroot.org/buildroot/-/jobs/899026244=
8</a>=C2=A0 |=C2=A0 =C2=A0 =C2=A0 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 engicam_imx6ul_geam | <a h=
ref=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262452" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org/buildroot/-=
/jobs/8990262452</a>=C2=A0 |=C2=A0 =C2=A0 =C2=A0 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0engicam_imx6ul_isiot | <a h=
ref=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262468" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org/buildroot/-=
/jobs/8990262468</a>=C2=A0 |=C2=A0 =C2=A0 =C2=A0 <br>
<br>
So I&#39;m not really willing to do yet another release with broken<br>
defconfigs that don&#39;t even build.<br>
<br></blockquote><div><br></div><div>I will try to make buildable all of th=
em before the end of the month but I will not able to test for the end of t=
he month</div><div><br></div><div>Michael=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
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

--00000000000077c86d063cb859bb--

--===============6418572755352025817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6418572755352025817==--
