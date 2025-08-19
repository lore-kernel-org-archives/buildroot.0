Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B66DCA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 08:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03BA7608FC;
	Tue, 19 Aug 2025 08:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOzM1iYjHydc; Tue, 19 Aug 2025 08:53:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ECFD60903
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ECFD60903;
	Tue, 19 Aug 2025 08:53:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0DA7E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D733F81164
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4niVMyQIsUi for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 08:53:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF1AD81161
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF1AD81161
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF1AD81161
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:53:30 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b47052620a6so4717826a12.1
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 01:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755593610; x=1756198410;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wKORt9NoKz2gephoLrPfSPLJ4OsyF16qp87ufkCXhCk=;
 b=GoeezxQyHG2lqDjt9beNWm24XUptUuGM8as/QpjE7x46AMh7cxLn7tjiEc7CwFvQGp
 7hPVj6DIWlz3a3iBuJr5Bd7QTT9fDr+1eycC0xqjEfxhJiD8a6lMxq5ONKrKcRRwVIwV
 YUjotQRNhEORV+c4CP54fpmikeLcqWkorGJg0BCqN36ueol6iuShc9Gu+a9SupdWq0Jf
 Noz5oahduWHqjLmFloPjXEWna4vEaYJSFzoJNuaPR8Y6y83wiU2e8GUlzF8S7/+ATCyK
 hsui+epzNx0LNjDrtdPcbLu6IdxJN0Fb0LL7KKiZSF2Cab3ymU1TZSOUxrEIckMYUBNc
 m6Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbpYB5X0vuXZLhh3SW4IGgXtnvOeRrXlHZiI7rSxzIDhYBvUB1aAk+DlU+ChxsVmaLlHPYzV8bB28=@buildroot.org
X-Gm-Message-State: AOJu0YwX3TZkQMi8oeIFyucFcRVys2wFYqekTSVmayEw9+n1M0haEr3M
 A1pYoESV2xmFgamiKPbXvD73pf6/BbFhvFMEuEORicA7wElHkfnLED96SkDZidFFJXcRV1xgu+e
 4OiGkMOBtDTlyeLKxguZWON5xBOKm1OWRDOmR/0tKjn81OYS9kcM3JeU=
X-Gm-Gg: ASbGncuF24U/wL75uxjMhiwsocbMp0wJZn+oEqWfVsASipUvResfTayRzHRIWiD4ymL
 DWy/SJq/bzMSHMlsp7SjLjOXnV+clvDTv5DKGsa3SlMhrv0bC60G+r/aHOtar6H0XRRNQWIB1fV
 10L4NU3R+S5PmxeD/86BubjTcSJ/NngZ+IIqmffpUAdNX25tJgzj1TJz44XNTlU2HAMndKmS48+
 Q/4pnSx
X-Google-Smtp-Source: AGHT+IFsdQbd3szBaSIfDhDQAkHvyJaRoJ6spQQumxZwu/YGwHOnubsBcLwVb7/9krzRRlzNq7ZhAAI4YQKZs5fyay8=
X-Received: by 2002:a17:903:1205:b0:231:d0da:5e1f with SMTP id
 d9443c01a7336-245e0f2775amr15824325ad.21.1755593609769; Tue, 19 Aug 2025
 01:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250818140518.964728-1-angelo.compagnucci@gmail.com>
 <20250818183349.6373d330@windsurf>
 <CA+TH9VkUgn3y2VthqiKfejas0Fx47yqvVGbgjch3MPyHS4u_2A@mail.gmail.com>
 <20250819102915.7cc03d65@windsurf>
In-Reply-To: <20250819102915.7cc03d65@windsurf>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 10:53:17 +0200
X-Gm-Features: Ac12FXyBRxtTpTWGZTZRobUgh0iAF-DtBd9Xb_hVQxpksdb2GpU96vF-rYBB4dw
Message-ID: <CAOf5uwkt1m2WKk2F4preBmd5zjkMKcs0hJ3jUGwGOiBGTNR-dA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755593610; x=1756198410;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wKORt9NoKz2gephoLrPfSPLJ4OsyF16qp87ufkCXhCk=;
 b=QWYAAURmtK0XI9vPateHNSIPQaE3fFsDHePs9NSwRtEPKSo6lDQSP2ikpjNO9w+Hfv
 6C973TFrMajMMvVhEFYBm2ZFPP3t0Ka6YpYihddU1GV8Me7TGeg4mf1b1SwrS1/3Ry7B
 D9torOSb16B8dHZfLInkq/8hhnbchU6klwddI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QWYAAURm
Subject: Re: [Buildroot] [PATCH] package/mono: remove mono and related
 packages
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
Content-Type: multipart/mixed; boundary="===============6240782520834002393=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6240782520834002393==
Content-Type: multipart/alternative; boundary="0000000000007b1139063cb3fd84"

--0000000000007b1139063cb3fd84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas

On Tue, Aug 19, 2025 at 10:29=E2=80=AFAM Thomas Petazzoni via buildroot <
buildroot@buildroot.org> wrote:

> Hello Angelo,
>
> On Tue, 19 Aug 2025 08:12:55 +0200
> Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:
>
> > > Thanks for this patch. But do we have the Buildroot packages for .NET=
,
> > > which would replace these Mono packages?
> > >
> > > Or should I read your patch as "This mono stuff is no longer
> > > maintained, and if anyone wants to use .NET with Buildroot, they shou=
ld
> > > package .NET instead of using this unmaintained mono stuff" ?
> > >
> >
> > I added the note about the .NET Giulio's patch exactly for that reason.
>
> Sorry but I don't understand your answer. You don't really answer my
> questions, and I don't understand which "note about the .NET Giulio's
> patch" you're referring to.
>
> Could you clarify?
>

I think that he refers to this note in this commit

To the maintainers: while applying this patch, please apply also this patch
from
Giulio

https://patchwork.ozlabs.org/project/buildroot/patch/20240701193420.2119084=
-1-giulio.benetti@benettiengineering.com/

I suspect that you have seen it but anyway...

Michael



> > Technically speaking, while having an infra in builroot to build .NET
> > packages, it's not strictly required: mono can cross compile and produc=
e
> a
> > self contained executable to deploy on the target without any third par=
ty
> > tool.
>
> Perhaps, but it would still make sense to have the necessary tools
> packaged so that the entire build process can be integrated in
> Buildroot, and be reproducible, as opposed to have to separately and
> manually download the .NET "stuff", build your application, copy it to
> the rootfs, etc.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
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

--0000000000007b1139063cb3fd84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas</div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Au=
g 19, 2025 at 10:29=E2=80=AFAM Thomas Petazzoni via buildroot &lt;<a href=
=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Angelo,<br=
>
<br>
On Tue, 19 Aug 2025 08:12:55 +0200<br>
Angelo Compagnucci &lt;<a href=3D"mailto:angelo.compagnucci@gmail.com" targ=
et=3D"_blank">angelo.compagnucci@gmail.com</a>&gt; wrote:<br>
<br>
&gt; &gt; Thanks for this patch. But do we have the Buildroot packages for =
.NET,<br>
&gt; &gt; which would replace these Mono packages?<br>
&gt; &gt;<br>
&gt; &gt; Or should I read your patch as &quot;This mono stuff is no longer=
<br>
&gt; &gt; maintained, and if anyone wants to use .NET with Buildroot, they =
should<br>
&gt; &gt; package .NET instead of using this unmaintained mono stuff&quot; =
?<br>
&gt; &gt;=C2=A0 <br>
&gt; <br>
&gt; I added the note about the .NET Giulio&#39;s patch exactly for that re=
ason.<br>
<br>
Sorry but I don&#39;t understand your answer. You don&#39;t really answer m=
y<br>
questions, and I don&#39;t understand which &quot;note about the .NET Giuli=
o&#39;s<br>
patch&quot; you&#39;re referring to.<br>
<br>
Could you clarify?<br></blockquote><div><br></div><div class=3D"gmail_quote=
 gmail_quote_container">I think that he refers to this note in this commit<=
/div><div class=3D"gmail_quote gmail_quote_container"><br></div>To the main=
tainers: while applying this patch, please apply also this patch from<br>Gi=
ulio<br><br><div><a href=3D"https://patchwork.ozlabs.org/project/buildroot/=
patch/20240701193420.2119084-1-giulio.benetti@benettiengineering.com/">http=
s://patchwork.ozlabs.org/project/buildroot/patch/20240701193420.2119084-1-g=
iulio.benetti@benettiengineering.com/</a></div><div><br></div><div>I suspec=
t that you have seen it but anyway...</div><div><br></div><div>Michael</div=
><div>=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
&gt; Technically speaking, while having an infra in builroot to build .NET<=
br>
&gt; packages, it&#39;s not strictly required: mono can cross compile and p=
roduce a<br>
&gt; self contained executable to deploy on the target without any third pa=
rty<br>
&gt; tool.<br>
<br>
Perhaps, but it would still make sense to have the necessary tools<br>
packaged so that the entire build process can be integrated in<br>
Buildroot, and be reproducible, as opposed to have to separately and<br>
manually download the .NET &quot;stuff&quot;, build your application, copy =
it to<br>
the rootfs, etc.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
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

--0000000000007b1139063cb3fd84--

--===============6240782520834002393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6240782520834002393==--
