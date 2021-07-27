Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84859C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 12:46:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20AA960FC0
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 12:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20AA960FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4887403E4;
	Tue, 27 Jul 2021 12:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vz9evvdfnOKw; Tue, 27 Jul 2021 12:46:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E73DC403D9;
	Tue, 27 Jul 2021 12:46:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E37271BF42C
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 12:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2739607EC
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 12:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AqYgzfwhlRDo for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 12:46:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB315607E7
 for <buildroot@uclibc.org>; Tue, 27 Jul 2021 12:46:30 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id hb6so21805089ejc.8
 for <buildroot@uclibc.org>; Tue, 27 Jul 2021 05:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wOitpuQeX+T2kj+ZW0wpTi0PBDAr1Lrh0tiY+lRhTkA=;
 b=wNI0HnULtYSP8X/Vn0OOfYKAkYALVrpuy4sizJCwIGYS94/UcNa5DVMLXahwhNVmQR
 9ks5CsbsimIwwO54ISk+tHnvKC3EPGjbT4yrrmWYcvdtOS8edfNk8msCgyOCgENOvMhb
 LEXI34gkgv1AwZzPkWjtnD86tqwnmlNHX+VXqQXI4VlS6dQP5qQzO9H4rYEhJJXrdt/i
 oI4ZVN7rrFEZfGFY/7qoc9J0vVsOkv2W6WVG5Sm3yMzwfSnzxhdtO59+x9nzrlNunNPs
 4zzbxxdletnrpT7A8vi8j0V36WmjW2cW7z/WtX+kAzbgBD/q2Ll8WUIucQVnmeJblLF0
 sRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wOitpuQeX+T2kj+ZW0wpTi0PBDAr1Lrh0tiY+lRhTkA=;
 b=DoRpC8WMwVumDYzdOw1z5CL92UGZ3VCkdB9y7C1neYbNe60bB7kRdRQKpQa5nxLkmm
 neM1bnWb/lm341fnPDTpO/Q1TgDkuYKC0/ZB7WeNbFjqeYQE8L0Idjv1x9rtwKxfd1MM
 /UixruyZ4azPspOGDL4qwKjg0HMkIQfe1MmVCr4MKeQX9RAgyBXUc+0rnKs/AbIHSmgo
 G1InkkZbafkNh0MKAiDN7ZrLllnmmJe2VG7c4r52WuFrWOTzrB6pDthgn9CW4QQynUfA
 seRJ/TlfYhJhUvGjN2LJ52K13VyWa5FZBUwrSeqzRmAtPbGFhwtYnIpmCYkpq2S+gO9N
 Tf0Q==
X-Gm-Message-State: AOAM530tN9ciEUpDYcEi9lhQc1QwgAuH/+HyHR9XbBrcvrTwAQ9Xy0yj
 qvy/VpZXSVRPj4HT/nVQchOcxuh5JIvY+RrixJVdag==
X-Google-Smtp-Source: ABdhPJwAyQGt3rvLDmZl8BrtjhwWMp8lLxTDY+0tTtQDxvfIFv4eEYu4NPvrWFOJXlcvvAlCLlAB4hzR+0uAd1D3XQA=
X-Received: by 2002:a17:906:d54c:: with SMTP id
 cr12mr17953799ejc.227.1627389988624; 
 Tue, 27 Jul 2021 05:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210723095113.26189-1-jose.pekkarinen@unikie.com>
 <20210724233820.75126717@windsurf>
 <CAJPV9MpuxCHXRAf2zTeuZnHB1FjiwtJHA6-UxEvHFFJ8WWg4gw@mail.gmail.com>
 <20210727144340.7fecf359@windsurf>
In-Reply-To: <20210727144340.7fecf359@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Tue, 27 Jul 2021 15:46:18 +0300
Message-ID: <CAJPV9MpZ9p2m-+B2u5GET4XUB3RfLcRvj=9td4m8E3c-U3rqpg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] Remove deprecated matchpathcon calls
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
Cc: "buildroot@uclibc.org" <buildroot@uclibc.org>
Content-Type: multipart/mixed; boundary="===============3934432941916865614=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3934432941916865614==
Content-Type: multipart/alternative; boundary="0000000000002ef19905c81a423f"

--0000000000002ef19905c81a423f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 3:43 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Jos=C3=A9,
>
> On Tue, 27 Jul 2021 15:21:21 +0300
> Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com> wrote:
>
> > Thanks for quickly addressing this Thomas. If I may, as this is a
> > fix, is there any process to backport it to the stable versions? Perhap=
s
> > I have to resend it to the mailing list with another label? My customer
> > would be glad to take it from there.
>
> Our process to backport to stable versions is that Peter Korsgaard (one
> of the Buildroot co-maintainers) reviews the entire set of commits that
> go into master, and whenever a commit is a security bump or a fix, it
> gets backported to 2021.02.x.
>
> I have Cc'ed Peter on your request to make sure it is clear to him that
> commit 90dd1d6178b01f6da3e59e43d0c7efdf984a72d8 is a fix that should be
> backported to 2021.02.x.
>

Fantastic! Thanks!


Jos=C3=A9.

--0000000000002ef19905c81a423f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 27, 2021 at 3:43 PM Thoma=
s Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.peta=
zzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello Jos=C3=A9,<br>
<br>
On Tue, 27 Jul 2021 15:21:21 +0300<br>
Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com" targ=
et=3D"_blank">jose.pekkarinen@unikie.com</a>&gt; wrote:<br>
<br>
&gt; Thanks for quickly addressing this Thomas. If I may, as this is a<br>
&gt; fix, is there any process to backport it to the stable versions? Perha=
ps<br>
&gt; I have to resend it to the mailing list with another label? My custome=
r<br>
&gt; would be glad to take it from there.<br>
<br>
Our process to backport to stable versions is that Peter Korsgaard (one<br>
of the Buildroot co-maintainers) reviews the entire set of commits that<br>
go into master, and whenever a commit is a security bump or a fix, it<br>
gets backported to 2021.02.x.<br>
<br>
I have Cc&#39;ed Peter on your request to make sure it is clear to him that=
<br>
commit 90dd1d6178b01f6da3e59e43d0c7efdf984a72d8 is a fix that should be<br>
backported to 2021.02.x.<br></blockquote></div><div><br></div><div><blockqu=
ote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Fantastic! Tha=
nks!</div></blockquote></div><br><div dir=3D"ltr" class=3D"gmail_signature"=
><div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px 40px;border:none;=
padding:0px">Jos=C3=A9.</blockquote></div></div></div>

--0000000000002ef19905c81a423f--

--===============3934432941916865614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3934432941916865614==--
