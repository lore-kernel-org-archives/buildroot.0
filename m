Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97904C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 18:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1904761089;
	Wed, 21 Dec 2022 18:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1904761089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZF1_7Z2NFZZ; Wed, 21 Dec 2022 18:56:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F7CF61093;
	Wed, 21 Dec 2022 18:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F7CF61093
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E21B1BF3A6
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6881181E71
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6881181E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDL3Qit55d2V for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 18:56:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 661B681E68
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 661B681E68
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 18:56:54 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id r26so23292041edc.10
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 10:56:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+I6n1GJbP6IvfCrY7HZldPpKqSyCfrd82csdoBPUZic=;
 b=t2OPLNXvyEtd18HC9YHG9zavLOZSCTFzv2J0JcpGQSXylzyUEDQtW/la02dn0LTOBt
 G+znXSKz0owk1gm01t3Cde9Tb3tLBUpw8JQs/lZ02AcRI0K766j2NdFq4VI96ziNI2g7
 BwHXkZE+IwicDiBk4Oo5GL1zf19z+d/ZCPLr2kXNoCY12IfCmnJE9UfduTGbpcUkOldl
 DM5qR984ZM/9pT9E7AHlslXZBwjv9Q5RXQ87FN2kUbI+b4iKujkpOEQYXZynhJxP+PtJ
 yq7spDRdT3HpD6VZu6ztwawM1UMKLvX8tQssr1gDpB3dKHRJF8EisCuvfLvGzJpD7cmQ
 xsNQ==
X-Gm-Message-State: AFqh2krhK6sbSBOq9W0Ru3IN5PPS5m1DpYqM+8IVkLqlt5bDPj21CZNt
 qdJvS7bLKOkeGIpJGFMQrkURwVOeRrfrk31/
X-Google-Smtp-Source: AMrXdXtSpfBW+8GCPTDhfSIYwyYIwVH48jWJ5sUaGiMK7Ss/bO7unPlq5sHK1YFJVGrdJ0wfzfIpCw==
X-Received: by 2002:a05:6402:e09:b0:479:3ffb:9243 with SMTP id
 h9-20020a0564020e0900b004793ffb9243mr2455372edh.25.1671649012214; 
 Wed, 21 Dec 2022 10:56:52 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 f13-20020a170906738d00b007c0c1e18e28sm7355397ejl.124.2022.12.21.10.56.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 10:56:51 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id u9so658329ejo.0
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 10:56:51 -0800 (PST)
X-Received: by 2002:a17:907:c388:b0:7c1:8fa0:527 with SMTP id
 tm8-20020a170907c38800b007c18fa00527mr369448ejc.180.1671649010810; Wed, 21
 Dec 2022 10:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20221218005546.1793522-1-christian@paral.in>
 <CAJpxd04zbzD3+QP2Vh-3GDJuASjLs7m5g+6sj4WAz-1RdFf-VA@mail.gmail.com>
In-Reply-To: <CAJpxd04zbzD3+QP2Vh-3GDJuASjLs7m5g+6sj4WAz-1RdFf-VA@mail.gmail.com>
Date: Wed, 21 Dec 2022 10:56:40 -0800
X-Gmail-Original-Message-ID: <CA+h8R2qZCKtU9u=e2xD481KZUEXPe++c_wtzycjUYhgv6r-Hbw@mail.gmail.com>
Message-ID: <CA+h8R2qZCKtU9u=e2xD481KZUEXPe++c_wtzycjUYhgv6r-Hbw@mail.gmail.com>
To: bryce.schober@gmail.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+I6n1GJbP6IvfCrY7HZldPpKqSyCfrd82csdoBPUZic=;
 b=TWTHUKFqPj58/9Al9MUHaKJI+nChJANp00qtHoes5BVfVSpz3o7pdsqBr3D0zB6MEG
 xfkBpo1AFu7XhUNK6sKIk04DEkhrFlbXPrUwtG14+3iFgIgLMlz0Zs//kfUEZcDXgB4B
 VOiFUQ/C9Udc1xf5Nie0TvBNTAWDepc7cOFDK9DGZD0t9ISZMaQR0ZM7c4WbF3QKx1fO
 aVOi4yhr5KsT4xSditALqC7KxlNK+Mvb+W1+4wZmWlV/+G4JaJbBoVq0XLzWpBF7zgNt
 Mlt8tyJVqGc2HjczrhmfUsbXG5Z+G9BsEIMyYaCYUtD7US7HpUx9kIbZuCg0p6fMV8iW
 uiTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=TWTHUKFq
Subject: Re: [Buildroot] [PATCH v4 1/1] package/rtl8821cu: new package
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5945853847153235671=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5945853847153235671==
Content-Type: multipart/alternative; boundary="0000000000007a844105f05b1d7e"

--0000000000007a844105f05b1d7e
Content-Type: text/plain; charset="UTF-8"

Bryce,

On Wed, Dec 21, 2022, 10:26 AM <bryce.schober@gmail.com> wrote:

> Hi Christian,
>
> I apologize if I've missed something, but the package config description
> (and your email intro) don't match the github source repo.
>

Good catch, thanks, yes the link in Config.in is incorrect and should be
this instead:

https://github.com/morrownr/8821cu-20210118

Thanks,
Christian

--0000000000007a844105f05b1d7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Bryce,<br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Dec 21, 2022, 10:26 AM  &lt;<a href=3D"m=
ailto:bryce.schober@gmail.com">bryce.schober@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"></div>=
Hi Christian,<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr"><br></div><div class=3D"gmail_attr">I apologize if I&#39;ve missed s=
omething, but the package config description (and your email intro) don&#39=
;t match the github source repo.</div></div></div></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Good catch, thanks, yes the l=
ink in Config.in is incorrect and should be this instead:</div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><a href=3D"https://github.com/morrownr/88=
21cu-20210118">https://github.com/morrownr/8821cu-20210118</a><br></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">C=
hristian</div></div>

--0000000000007a844105f05b1d7e--

--===============5945853847153235671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5945853847153235671==--
