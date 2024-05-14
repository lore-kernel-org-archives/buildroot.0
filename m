Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E960C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 11:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A0BE82FB1;
	Tue, 14 May 2024 11:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjavVcNblytu; Tue, 14 May 2024 11:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC14582FC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC14582FC9;
	Tue, 14 May 2024 11:40:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E01B01BF2A5
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 11:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCC8E40292
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 11:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrjKtQNZbZfS for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 11:40:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C5AD401B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C5AD401B2
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C5AD401B2
 for <buildroot@buildroot.org>; Tue, 14 May 2024 11:40:02 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so6419117e87.0
 for <buildroot@buildroot.org>; Tue, 14 May 2024 04:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715686800; x=1716291600;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5BIT0ywOCLGN69RXlb2YyIcS2uelhF2tvvPRbqBC9QE=;
 b=NVg5AcUVzgazluz0Hr6OD8JcyGJaA9flyHdDWTBI7J9DWuvLp1dyNwl39sFxq8rDLf
 X8GT+SUAGlveo/mjH9RUT5Hfd9sqWQuYXJMeQQyEXIO78/hOvOKS4Tl6KiShvgKhWsCD
 f2hbSn/SbQYKOOLPmUolZ8uRmruUka0eAmvkbJy9b/DRXbsh0ihxIp0Wk+IfW+LVRm85
 PFdaiX8yDFnKW2pN2XhpVZq7xvVAuqGiXa2Zq25CnTrQH/tnkwL2U2Ge2FB8dN8/IlQM
 fFNlhmgtSC4WCL0SUy6BPnIAf94oHd5upelUXdpaUeAZHaUROYs0M/7TqxcULrxJ8HAd
 Si0Q==
X-Gm-Message-State: AOJu0YwOgzvBDvs6G/HrHPNvpFXr/a/jCi3Wu2NeaoWzI5e5QS0nijts
 MwtEmC9Sk3zhzqLfoCUQhkK90/Uw0eZ4Qmph/Hfimyktv7+sThsAosjXRsMTE6GBvfalN2onPGF
 6etk=
X-Google-Smtp-Source: AGHT+IGKTBSmuu2448Y0lvK856TGS6cmz+kh4C0oLGNbliLy64Y6Ti4JvLB7ozZmj8pd4IF2V9JIMw==
X-Received: by 2002:a19:914d:0:b0:522:80d:5dc5 with SMTP id
 2adb3069b0e04-5220fb746e2mr7795244e87.27.1715686798341; 
 Tue, 14 May 2024 04:39:58 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ba8f1sm2163732e87.85.2024.05.14.04.39.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 04:39:57 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2e27277d2c1so73413151fa.2
 for <buildroot@buildroot.org>; Tue, 14 May 2024 04:39:56 -0700 (PDT)
X-Received: by 2002:a19:914d:0:b0:522:80d:5dc5 with SMTP id
 2adb3069b0e04-5220fb746e2mr7795185e87.27.1715686796527; Tue, 14 May 2024
 04:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240307015107.2908128-1-christian@aperture.us>
 <20240514102318.1cdeba18@windsurf>
In-Reply-To: <20240514102318.1cdeba18@windsurf>
Date: Tue, 14 May 2024 04:39:46 -0700
X-Gmail-Original-Message-ID: <CA+h8R2peXHHtzBXdg-uW7bptT8mmGY+kgzbvPNFW9MQy3xOJhQ@mail.gmail.com>
Message-ID: <CA+h8R2peXHHtzBXdg-uW7bptT8mmGY+kgzbvPNFW9MQy3xOJhQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1715686800; x=1716291600; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5BIT0ywOCLGN69RXlb2YyIcS2uelhF2tvvPRbqBC9QE=;
 b=XnqNy6UkD8ur6aPX346ruAjKH8ov+lEuGTq/UYnRATG4A33rYXXQXiwee4WQKNp+7o
 TIIhRtYe8b2niepDaOH5vB38prPmr4P+d2Ave+Cax29+BzDP1OV+rU4XDc7WEY7+8mjl
 FDSHi6Y/yu/A8xoo22qN5+Z6pvCIjH0HFiH4c1JDfKss20ebBWPZSyMo/wC5AwB/O8NK
 o2EpAlJlvmz0/++Xl+U5L7O6wZ3o92mzJufdQC/gTNQAxFarbPxZX+pZX5yd0JRiXZQm
 AT4VF5Gdz4Rcc0jkL2J/fO04j1+oBYos2Pa9zjG0laVnnB2Vx6FIngCsTQKuiU/cuSyS
 686g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=XnqNy6Uk
Subject: Re: [Buildroot] [PATCH v1 1/3] package/go-bootstrap-stage2: bump
 version to go1.19.13
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3139384140458067811=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3139384140458067811==
Content-Type: multipart/alternative; boundary="0000000000000d99b80618687630"

--0000000000000d99b80618687630
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Tue, May 14, 2024, 1:23=E2=80=AFAM Thomas Petazzoni <thomas.petazzoni@bo=
otlin.com>
wrote:

> Hello Christian,
>
> On Wed,  6 Mar 2024 17:51:05 -0800
> Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
>
> > Update to the latest 1.19.x version available.
> >
> > Signed-off-by: Christian Stewart <christian@aperture.us>
> > ---
> >  package/go-bootstrap-stage2/go-bootstrap-stage2.hash | 2 +-
> >  package/go-bootstrap-stage2/go-bootstrap-stage2.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> I don't think it's this patch causing the issue, but we have a Go build
> failure in our Gitlab CI:
>
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6833307823
>
> Could you have a look?
>

This looks like we need to pass -buildvcs=3Dfalse to Go. I'll have a look a=
t
submitting a patch for this.

Thanks,
Christian Stewart

--0000000000000d99b80618687630
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Thomas,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, May 14, 2024, 1:23=E2=80=AFAM Thomas=
 Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petaz=
zoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hel=
lo Christian,<br>
<br>
On Wed,=C2=A0 6 Mar 2024 17:51:05 -0800<br>
Christian Stewart via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.o=
rg" target=3D"_blank" rel=3D"noreferrer">buildroot@buildroot.org</a>&gt; wr=
ote:<br>
<br>
&gt; Update to the latest 1.19.x version available.<br>
&gt; <br>
&gt; Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@apert=
ure.us" target=3D"_blank" rel=3D"noreferrer">christian@aperture.us</a>&gt;<=
br>
&gt; ---<br>
&gt;=C2=A0 package/go-bootstrap-stage2/go-bootstrap-stage2.hash | 2 +-<br>
&gt;=C2=A0 package/go-bootstrap-stage2/<a href=3D"http://go-bootstrap-stage=
2.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">go-bootstrap-stage2.m=
k</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
I don&#39;t think it&#39;s this patch causing the issue, but we have a Go b=
uild<br>
failure in our Gitlab CI:<br>
<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/6833307823" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/buildroot.=
org/buildroot/-/jobs/6833307823</a><br>
<br>
Could you have a look?<br></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">This looks like we need to pass -buildvcs=3Dfalse to =
Go. I&#39;ll have a look at submitting a patch for this.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Christian S=
tewart</div></div>

--0000000000000d99b80618687630--

--===============3139384140458067811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3139384140458067811==--
