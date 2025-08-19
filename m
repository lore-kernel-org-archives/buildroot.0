Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D6BCA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 20:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B203681836;
	Tue, 19 Aug 2025 20:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36J4VjbiFlAM; Tue, 19 Aug 2025 20:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 824E1817AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 824E1817AF;
	Tue, 19 Aug 2025 20:43:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F2FB4DE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E51AA40D0E
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfkMqDt1k6a1 for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 20:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A25C40B94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A25C40B94
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A25C40B94
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:42:57 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-244581c3b43so50989305ad.2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 13:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755636177; x=1756240977;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yH40GagjjB6A9OQpl17ORJAVIMABpcrbiKvDkr4oXAs=;
 b=I76OB9Q1N6Vh7xuxEnXPY9wJKjUkgnv4UU3kVEmDnMRLObKFuDpJAoFSqxYMn088Hq
 FIm5Rcqyir34Lc6TspGAwYPAMO+i/UzbUK9thPYnyW1n1Nb1ActfakV8920RZRHknqhL
 TfVG0v5s1NunuHbCQjGRnlheImYoFw3oh7puISUMSue5PJk7Iw5oyb8x+Mpjr3afmIN+
 QerHh+3uk095x5j7FUQN7IHC7cfwGiVBTPczLnnndZqZnToQEBsRc37X+5e1kZ92iM/h
 9UDXfxf5d0jPsqqdLzx5fcL+mmQKkQRX0N7J+JppoE+4KxNP3fUACA4koY6jd1M9ByqP
 ESlA==
X-Gm-Message-State: AOJu0Yx3WhArICh+bWUgsV4bMzlmQGFxALX9yVGdPTf5tKCyZQgTpL6E
 iBFNYlogQT3zZEvRwiibfzqAQySz3o8tyBusNp0R+W93Wh4G6/BBdUaUaadum0yP7rBjv1gCIsP
 DpsdvrfIiH3E0no3uasT3O3T6MXY/WlP/7eMjTkxj9Q==
X-Gm-Gg: ASbGncuSU+dBuxyr8Z93ho7DsofvmuSZtkq3wUjUKdSNPqbwxEPhzD/I4EnPojPmOyz
 xRd5pRwVKjCXZUV6eRSNi4fjViLp07UHYTfCL1BIPhsbU/pGhxYbaKPqv3qgrXUhV8gVvtKF7GF
 8GX8MN1LMh878aCKJfGKGx50FKGCz2yF9CmNGUoiUHEkEDK8Q9/cp5RSDXTwuNHSuO0WIAp51ii
 jrtHS4=
X-Google-Smtp-Source: AGHT+IFVEeCh7dIZZ6dlbjW6TKTXkvM7sKeVzDoRbbyEmZ314LR8f7CsmHuln0lErpqVlTeDb7utB06Yh7aG8OC2fxQ=
X-Received: by 2002:a17:903:230c:b0:243:12d5:db43 with SMTP id
 d9443c01a7336-245eee73daemr4061135ad.0.1755636177205; Tue, 19 Aug 2025
 13:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250819181451.3012126-1-michael@amarulasolutions.com>
 <20250819181451.3012126-3-michael@amarulasolutions.com>
 <20250819222524.5682cbc2@windsurf>
In-Reply-To: <20250819222524.5682cbc2@windsurf>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 22:42:43 +0200
X-Gm-Features: Ac12FXy3aQ-Emz0Ph_Wcqdc6wpA83x19--EkxpglkI0E3kClvkYGiTT0l7fnFW8
Message-ID: <CAOf5uwmXu97UQHFLY0wwXhS57FFHWtwkpxSm48oWKbvOeANUbA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Jagan Teki <jagan@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755636177; x=1756240977;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yH40GagjjB6A9OQpl17ORJAVIMABpcrbiKvDkr4oXAs=;
 b=QLpOjN5JX8mIWqwW7K9P7WtxNPhk8vyeSy7bjSgcn3ivcwpshiABjUzGMD+XJRn4LP
 ckN9lLHHbIo27BAD46ZFbwh4Tsi3YpEjcLlpwrj2XC4DRV7DimQQSsq2RRPA0i5e8KZZ
 SuuhHtHKwK88aY+9bFIkhoQO9L0xbEav47lGQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QLpOjN5J
Subject: Re: [Buildroot] [PATCH 2/6]
 configs/engicam_imx6qdl_icore_defconfig: bump Linux to 6.12.36 and U-Boot
 to 2025.07
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
Content-Type: multipart/mixed; boundary="===============2405748726142504293=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2405748726142504293==
Content-Type: multipart/alternative; boundary="000000000000b290de063cbde607"

--000000000000b290de063cbde607
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas

On Tue, Aug 19, 2025 at 10:25=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Michael,
>
> On Tue, 19 Aug 2025 20:14:47 +0200
> Michael Trimarchi <michael@amarulasolutions.com> wrote:
>
> > +BR2_PACKAGE_HOST_E2FSPROGS=3Dy
>
> What do you need this?
>
> > +BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=3Dy
>
> Please do not add this package, we try to keep our defconfigs minimal.
>
> (Comment applies to other patches of course)
>

Fix all of them in the second round.

Michael


> Thanks!
>
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

--000000000000b290de063cbde607
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas</div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 19, 2025 a=
t 10:25=E2=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@=
bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hello Michael,<br>
<br>
On Tue, 19 Aug 2025 20:14:47 +0200<br>
Michael Trimarchi &lt;<a href=3D"mailto:michael@amarulasolutions.com" targe=
t=3D"_blank">michael@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; +BR2_PACKAGE_HOST_E2FSPROGS=3Dy<br>
<br>
What do you need this?<br>
<br>
&gt; +BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=3Dy<br>
<br>
Please do not add this package, we try to keep our defconfigs minimal.<br>
<br>
(Comment applies to other patches of course)<br></blockquote><div><br></div=
><div>Fix all of them in the second round.=C2=A0</div><div><br></div><div>M=
ichael</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Thanks!<br>
<br>
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

--000000000000b290de063cbde607--

--===============2405748726142504293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2405748726142504293==--
