Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AB7CA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 15:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BF6941196;
	Wed, 20 Aug 2025 15:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIo9UaWuMwXC; Wed, 20 Aug 2025 15:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E71640FAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E71640FAE;
	Wed, 20 Aug 2025 15:41:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF425E0A
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 15:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0D05405ED
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 15:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQZXRDcQSTIy for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 15:41:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD3A04042F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD3A04042F
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD3A04042F
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 15:41:48 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-88432e27c77so184131539f.2
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 08:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755704508; x=1756309308;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Nm8JA7X5UYob37AC3YvIAyP0m4mp6C6bp6oIyyJXPU=;
 b=PWfGfoRfzkwJAapspxKtqoutSszkD92XayjGXFna3jaA4cCOnEFWjmbrIiPy61Qxrm
 8e+v/mQUOFXLpuIOf8mXD73Qa1U5iphasfMBRtQGKLiH87/efXZqOMqy1kyBSUQ5FcCh
 mcxRAH+NaG4zbRItCYP3lKtQgDxCWt1uz3ILYMzM3VxKCXQajgIXRKq10XvZx3+O3VYn
 YHfOmfu6mWmV9RT+PejgOBnqaaLp6/1mKbxhzgjiS6jGXJx3HhDPYAdH6OQ1IDOKPaYO
 pxWCYp028Ab1COOgdfBLkptKyiKGeFgyT6H6owcbcdfAkwdPAQu5IhmvxC6VxroHLOzq
 iXuw==
X-Gm-Message-State: AOJu0Yytn7ajJsvfIz+5ytq2J/V3N6p+RKCTpDAI3VfwXlikVAmliAV5
 BUn4c6oGHmWiOjI2aqZbUziZiFPTjA7oOx1YVT44QzmPaejZCECvIVeNrF/tJNF22SnELI1Eug3
 KuXU/ukblKgJCja2bBCVG6p67As6yICMsSmvW
X-Gm-Gg: ASbGncut+tJJTetQqIQEh8v0nTZ+DvT/crcD/2k37y08Em1d5NqZrG9GBZxmVUgg97E
 eLWjvm/LCJmXUoE9Vk8ksATgurWsOV/7+VTnFuwQt3XhwqHd8Zk5ZBLi1mUFJcTnpTFahZeL4Ul
 +BUHvY8DG0ADwK3B3/gpYjgXFMr8wov0NP8ZlGePn0qysJ09pJMdy8G/oZDahw4pJxPJR5l9Rzj
 UDtC6A=
X-Google-Smtp-Source: AGHT+IEvF22uW+Apb5J05K5ey+bNh1zMYCcp7rrtMuYI6ciphCJaFIszAeO5M5EY3a6gA/RwC+dD+/s+ubgWsK/IFw4=
X-Received: by 2002:a05:6602:3fc1:b0:884:315d:e433 with SMTP id
 ca18e2360f4ac-88471b5f941mr731020639f.12.1755704507574; Wed, 20 Aug 2025
 08:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250819150834.1651775-1-angelo.compagnucci@gmail.com>
 <20250819150834.1651775-6-angelo.compagnucci@gmail.com>
 <fc982bfaa07d96ba7c970f44a88397d4@free.fr>
In-Reply-To: <fc982bfaa07d96ba7c970f44a88397d4@free.fr>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 20 Aug 2025 17:41:11 +0200
X-Gm-Features: Ac12FXyrXQvapsfIiurw4fcNX2IhKHvafoTorFvPD_3e23NdDQa5otPUj9e6KIk
Message-ID: <CA+TH9VnEz=0it_4ghi+Z-KEaV-mnDqtLwfzBdhTX66bP0ndGFw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755704508; x=1756309308; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6Nm8JA7X5UYob37AC3YvIAyP0m4mp6C6bp6oIyyJXPU=;
 b=NL/iWYGV/fCZa8MMk+vkXGP5jQkxsUgqAoPZTw2xZcQjmNfEX3GPIdlDJ6yuA004aW
 vIvTTQhnR+3ArzndeWcAJXTU/F5TWOpWszdpxXzsoP8FX7AB87rVpX2gAVTHn9/djzs6
 BVRy2PnQUa75R+b0eX+UMECPIC63WSwWwaW2Noqxqc0DCQMUqPf7Tq0Gn+ptDcTU/vjo
 dlWBOm6bK0DfO+KbFxDGb0cKVQCD0IfN6N8dcb7heTtVXw8+BvbcSjvxyPO6WeOFEblI
 WPepFoYepZYRYDpwpkDGvPnKqLs1HuF0l3qH2UG1mMikxNDcJURtZNAk/dPZEUmzX2wZ
 L21Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NL/iWYGV
Subject: Re: [Buildroot] [PATCH 5/5] package/cups: bump to version 2.4.12
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
Content-Type: multipart/mixed; boundary="===============8231813896367590540=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8231813896367590540==
Content-Type: multipart/alternative; boundary="000000000000813552063ccdcf39"

--000000000000813552063ccdcf39
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 20 ago 2025 alle ore 16:33 Julien Olivain <ju.o@free.fr> ha
scritto:

> Hi Angelo,
>
> On 19/08/2025 17:08, Angelo Compagnucci wrote:
> > Changelog:
> > https://github.com/OpenPrinting/cups/releases/tag/v2.4.12
> >
> > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> I already applied your first cups bump submission in next:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20250818145555.1039619-1-angelo.compagnucci@gmail.com/
>
> https://gitlab.com/buildroot.org/buildroot/-/commit/f6be007591f504516fef6434e29c2ca9246ac5a7
>
> I checked it was building, but we don't have a runtime test (yet).
>
> Do I need to revert it?
>
> Alternatively, we can wait for this series to be merged.
>

I think the patch in  next is ok, I forget to already have sent it. I'll
respin the series without the cups bump. Cups-filters is not mandatory for
cups.

Best regards,
>
> Julien.
>


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo

--000000000000813552063ccdcf39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno mer 2=
0 ago 2025 alle ore 16:33 Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr=
">ju.o@free.fr</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi Angelo,<br>
<br>
On 19/08/2025 17:08, Angelo Compagnucci wrote:<br>
&gt; Changelog:<br>
&gt; <a href=3D"https://github.com/OpenPrinting/cups/releases/tag/v2.4.12" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/OpenPrinting/cups/r=
eleases/tag/v2.4.12</a><br>
&gt; <br>
&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo.compagn=
ucci@gmail.com" target=3D"_blank">angelo.compagnucci@gmail.com</a>&gt;<br>
<br>
I already applied your first cups bump submission in next:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20250818145=
555.1039619-1-angelo.compagnucci@gmail.com/" rel=3D"noreferrer" target=3D"_=
blank">https://patchwork.ozlabs.org/project/buildroot/patch/20250818145555.=
1039619-1-angelo.compagnucci@gmail.com/</a><br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/f6be007591f5=
04516fef6434e29c2ca9246ac5a7" rel=3D"noreferrer" target=3D"_blank">https://=
gitlab.com/buildroot.org/buildroot/-/commit/f6be007591f504516fef6434e29c2ca=
9246ac5a7</a><br>
<br>
I checked it was building, but we don&#39;t have a runtime test (yet).<br>
<br>
Do I need to revert it?<br>
<br>
Alternatively, we can wait for this series to be merged.<br></blockquote><d=
iv><br></div><div>I think the patch in=C2=A0 next is ok, I forget to alread=
y have sent it. I&#39;ll respin the series without the cups bump. Cups-filt=
ers is not mandatory for cups.<br></div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
Best regards,<br>
<br>
Julien.<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Pr=
ofile: <a href=3D"http://it.linkedin.com/in/compagnucciangelo" target=3D"_b=
lank">http://it.linkedin.com/in/compagnucciangelo</a></div></div>

--000000000000813552063ccdcf39--

--===============8231813896367590540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8231813896367590540==--
