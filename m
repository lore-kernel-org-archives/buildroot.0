Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_KAM_HTML_FONT_INVALID,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A7EC4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:18:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E42361038
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E42361038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 689C883B65;
	Fri, 13 Aug 2021 13:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TaC9tRSkfoeo; Fri, 13 Aug 2021 13:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01B4F83B6A;
	Fri, 13 Aug 2021 13:18:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 064F21BF2C5
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02C5E60C14
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGE_sqQOHi9l for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:17:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90BC960C00
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:17:44 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id w5so18255308ejq.2
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 06:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SEJA7t69t88u+Trdfd/F5imwBrkOcYdJ+VI/Sr/pP74=;
 b=L2aBNDEKaCFjk1tVPgEtYfg9LT2MYOuXfuK+aGLs5GLkVy+hD97HIIqHgHUXi9eDZS
 GjC+xEGFSbkgEXmEkWzz4/VaT7Rn2mMEnQGwB5VEWpDwQdG2gD7fZ6lYF1tXCK3ChI5Y
 VyLbsXoHU1Xjzp8Dw4V81TBwRGhXWtEtTCik8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SEJA7t69t88u+Trdfd/F5imwBrkOcYdJ+VI/Sr/pP74=;
 b=P2Mk4rStOCbYobDla2KJ1WzMDoSiN1dmKxs3z8iP/v80j31J/EHoINaDWNm9HDnx5D
 yrubajWeg47TUctWib0n85Hrlayj6J2qu3WNpXnaWjtJi/DmuGCi5lN7q7/Yzp1EiQsn
 SoUFjVS8GC3GXjr4q9qs7Fsh6mpe+OhbaYaNn5m5f8ruXEbHJo9BUXmaCyZzvvot85fa
 XBb1mkIn6shrmX3aZ+0W6dGZPpGMlrL2BdsaqGrpdwJG4GMXekB07oNvfE8U38XKKmgO
 sZUhqhEldfXyVfX9cer+BaWLTkyoM7SOZ09dDKWCxVGsqivuKvH3CH25iapZOt2SqzcC
 QGeA==
X-Gm-Message-State: AOAM531Fd0dIizyEgOyMCPjVgt4QeLfR+jj6/vDy52f+cif2riP88OVD
 n0EPhbZkn1hfSCtdmNlsWtJ4/qdSTU0/W/ojblPIVg==
X-Google-Smtp-Source: ABdhPJwEhypAUULDr24ieDkt4mim469weXV8A5BVWJiiFUMwIz53MwKQ+cp7RzMg2g9575WvuzkNTBl/R9igvYBfnhQ=
X-Received: by 2002:a17:906:72ce:: with SMTP id
 m14mr2359368ejl.394.1628860662759; 
 Fri, 13 Aug 2021 06:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210809215214.19401-1-angelo@amarulasolutions.com>
 <20210813150839.73810e25@windsurf>
In-Reply-To: <20210813150839.73810e25@windsurf>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 13 Aug 2021 15:17:06 +0200
Message-ID: <CA+_SqVZNeKxMxbhEwBEO_w3R+o8mjdifWb2M6_9gQpGEQTUT0A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/2] linux: bump CIP kernel to version
 4.19.198-cip54
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7378241338723405158=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7378241338723405158==
Content-Type: multipart/alternative; boundary="000000000000315b4805c970ad38"

--000000000000315b4805c970ad38
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 13, 2021 at 3:08 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Angelo,
>
> On Mon,  9 Aug 2021 23:52:13 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > This patch bumps Linux CIP to version 4.19.198-cip54.
> >
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> > ---
> >  linux/Config.in | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Are you sure changes to linux.hash are not necessary ?
>

Right, I'm going to resend asap!


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--000000000000315b4805c970ad38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 13, 2021 at 3:08 PM Thoma=
s Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.peta=
zzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello Angelo,<br>
<br>
On Mon,=C2=A0 9 Aug 2021 23:52:13 +0200<br>
Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.com" targe=
t=3D"_blank">angelo@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; This patch bumps Linux CIP to version 4.19.198-cip54.<br>
&gt; <br>
&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarula=
solutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 linux/Config.in | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
Are you sure changes to linux.hash are not necessary ?<br></blockquote><div=
><br></div><div>Right, I&#39;m going to resend asap!</div><div> <br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre-wrap"></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:50=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">Software Engineer</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:angelo@am=
arulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(241,194,50);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">__________________________________</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubun=
tu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:500=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Via le Canevare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">T. +39 (0)42 243 5310</span><span style=3D"font-size:10pt;font-famil=
y:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@=
amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.co=
m/" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">www.=
amarulasolutions.com</span></a></p><div>[`as] <a href=3D"https://www.amarul=
asolutions.com" target=3D"_blank">https://www.amarulasolutions.com</a>|</di=
v></div></div></div>

--000000000000315b4805c970ad38--

--===============7378241338723405158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7378241338723405158==--
