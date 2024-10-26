Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BA6D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 17:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0F3A408B2;
	Sat, 26 Oct 2024 17:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJtHdrYR9ilI; Sat, 26 Oct 2024 17:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 572F0408A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 572F0408A7;
	Sat, 26 Oct 2024 17:37:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9A825C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 17:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AAA64088A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 17:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCDT6PEy3ydF for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 17:37:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1787740800
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1787740800
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1787740800
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 17:37:14 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5ebc5b4190eso1662865eaf.3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729964234; x=1730569034;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6G6fbq9+DFOuHsolKPdy0VlXupLXbSmuWC8vwQzednQ=;
 b=UUboMGNtxQIdn4V1rgldN4ak8ewX+ygII3lshxn1v/SS25CN7JFGazEPWXQIF+Fr9u
 udkeaSV4lGsRyBVJDyCfhNSjMx58CAzty6ed/HKgcSunI+XQe9ontOUvDFKTxJsUqsig
 L5JUsfR+nP4laBMUOdtMDwghvS0qUZb32LWd3tqJYftcluhH/Rewn5beO9wQhGfqZzxc
 9TRb9f2qhRV8jGzy9gwO2tQ7AnfaofmHjAwiTQYFIijArHuwofchAp09WYX0TORf8hTo
 3fRwTfV2tYdqyQxjp71QetcsX+WxD1J7Y9jSPub+L6lWfZdXkTusg5+XYbh/FSzfxsWb
 FzYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2SpukWTp2R2ewcCTW1eUTcRQH0a7phGIBmgp7pTfPLaiNP83TVUvMLHwRTg54R/2UMg5c5Ho6+KU=@buildroot.org
X-Gm-Message-State: AOJu0YwkT0UsoToxXdRlNUKJ0xTDo8Ex+zc//dsZOVmcgQlHwhDp4sG5
 SfZGpyew7+378zBg2Hn5gKgDcGt4JJQ1bncp01lk4+7k2438j7ZSaQgbNZIloWg8fyej20kpRHq
 r/ik=
X-Google-Smtp-Source: AGHT+IHlhHosS9WNp6o/LOVzwP1zKRqzXdZw6k4KytdI/2DFVzHxuCIRHaEfYsn0/WW1xJs+Lhr12w==
X-Received: by 2002:a05:6820:16a5:b0:5eb:c72e:e29b with SMTP id
 006d021491bc7-5ec23a4404fmr1864855eaf.7.1729964233654; 
 Sat, 26 Oct 2024 10:37:13 -0700 (PDT)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com.
 [209.85.161.42]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5ec186fbffasm796267eaf.31.2024.10.26.10.37.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Oct 2024 10:37:13 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5ebc5b4190eso1662828eaf.3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:37:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU68X3WP763LGclvUszc+rl+v53QmGnFdBNK3cJsLyoqcAQDi+OjPyUoiMdWPSyCqU8yFvjWlhaTl8=@buildroot.org
X-Received: by 2002:a05:6870:5686:b0:288:563b:e48d with SMTP id
 586e51a60fabf-29051ace3famr2544067fac.10.1729964232637; Sat, 26 Oct 2024
 10:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1699547993.git.yann.morin@orange.com>
 <20241026184414.5924bc56@windsurf>
In-Reply-To: <20241026184414.5924bc56@windsurf>
Date: Sat, 26 Oct 2024 10:37:01 -0700
X-Gmail-Original-Message-ID: <CA+h8R2r2TFm67Vb4+uzNx0g52nZqwm4ex4m3L+rnhxOcxVfuWg@mail.gmail.com>
Message-ID: <CA+h8R2r2TFm67Vb4+uzNx0g52nZqwm4ex4m3L+rnhxOcxVfuWg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: yann.morin@orange.com, Buildroot Mailing List <buildroot@buildroot.org>, 
 Vincent Fazio <vfazio@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729964234; x=1730569034; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6G6fbq9+DFOuHsolKPdy0VlXupLXbSmuWC8vwQzednQ=;
 b=iicaFz5kt7tlDGzRJ5sog/rmgHJ45lCyW5kujeH7+AxJtpjy0W8anUu4jr0CA+fZ7n
 6lFkd3FQ/dWnW8ReN4dR5ry3QIHg/HhuJHK9zZzzehbvNGJ8r2fYzNjZQt9tWXnYIR7L
 9q6iIvx056cDeeGuYSsAiOf3Pzzjc/UBpydZIjr3HtUqs6q8AJt4QmNUyQU+e6hbRCCp
 p1p2FtNRmFSwI5F+GX9pkMRa82ap0EUExrjKhjaqU3o0K5fUwQ5p00t6QbXvJ7RzQom/
 TRVD0J+iBfpAame+BmSlm0OcdIxa0jUJ4+OHngjOdUFP94F5UoP5P7I38PD+XP4SV4L0
 b2xQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=iicaFz5k
Subject: Re: [Buildroot] [PATCH 0/2] package/filebeat: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: multipart/mixed; boundary="===============1339591314318681732=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1339591314318681732==
Content-Type: multipart/alternative; boundary="0000000000008f8f04062564af06"

--0000000000008f8f04062564af06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Sat, Oct 26, 2024, 9:44=E2=80=AFAM Thomas Petazzoni <thomas.petazzoni@bo=
otlin.com>
wrote:

> Hello,
>
> +Cc Christian Steward.
>
> On Thu, 9 Nov 2023 17:39:54 +0100
> <yann.morin@orange.com> wrote:
>
> > This two-patch series introduces filebeat, an ElasticSearch-related too=
l
> > to grab local log files and send them to a remote ElasticSearch server.
> >
> > It is a bit convoluted (see commit log), and requires a little extensio=
n
> > in our golang-package infrastructure, which we introduce as the first
> > patch in the series.
>
> Christian, could you review this patch series, and especially PATCH
> 1/2, which touches the golang-package infrastructure?
>

This one looks good to me:

https://patchwork.ozlabs.org/project/buildroot/patch/876f3a7bb6a2375193fc8f=
06ab856d2449f83727.1699547993.git.yann.morin@orange.com/

As does the other, but I haven't tested it / built it. It looks fine from
an initial review.

https://patchwork.ozlabs.org/project/buildroot/patch/46f20e86fa6c17ada33ede=
672ffe4229d8bf26a3.1699547993.git.yann.morin@orange.com/

Best regards,
Christian Stewart

--0000000000008f8f04062564af06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Thomas,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Sat, Oct 26, 2024, 9:44=E2=80=AFAM Thomas=
 Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petaz=
zoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hel=
lo,<br>
<br>
+Cc Christian Steward.<br>
<br>
On Thu, 9 Nov 2023 17:39:54 +0100<br>
&lt;<a href=3D"mailto:yann.morin@orange.com" target=3D"_blank" rel=3D"noref=
errer">yann.morin@orange.com</a>&gt; wrote:<br>
<br>
&gt; This two-patch series introduces filebeat, an ElasticSearch-related to=
ol<br>
&gt; to grab local log files and send them to a remote ElasticSearch server=
.<br>
&gt; <br>
&gt; It is a bit convoluted (see commit log), and requires a little extensi=
on<br>
&gt; in our golang-package infrastructure, which we introduce as the first<=
br>
&gt; patch in the series.<br>
<br>
Christian, could you review this patch series, and especially PATCH<br>
1/2, which touches the golang-package infrastructure?<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">This one looks good to=
 me:</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://=
patchwork.ozlabs.org/project/buildroot/patch/876f3a7bb6a2375193fc8f06ab856d=
2449f83727.1699547993.git.yann.morin@orange.com/">https://patchwork.ozlabs.=
org/project/buildroot/patch/876f3a7bb6a2375193fc8f06ab856d2449f83727.169954=
7993.git.yann.morin@orange.com/</a></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">As does the other, but I haven&#39;t tested it / built it. It l=
ooks fine from an initial review.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/4=
6f20e86fa6c17ada33ede672ffe4229d8bf26a3.1699547993.git.yann.morin@orange.co=
m/">https://patchwork.ozlabs.org/project/buildroot/patch/46f20e86fa6c17ada3=
3ede672ffe4229d8bf26a3.1699547993.git.yann.morin@orange.com/</a></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"aut=
o">Christian Stewart=C2=A0</div></div>

--0000000000008f8f04062564af06--

--===============1339591314318681732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1339591314318681732==--
