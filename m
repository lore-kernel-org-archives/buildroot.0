Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE20FC4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 16:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B3294035F;
	Mon, 17 Oct 2022 16:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B3294035F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uxk04vpunW_8; Mon, 17 Oct 2022 16:14:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACAD640917;
	Mon, 17 Oct 2022 16:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACAD640917
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 821B81BF331
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 16:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BE21408EB
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 16:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BE21408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UYFfOrJgZYpq for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 16:14:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24B374148F
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24B374148F
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 16:14:08 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id y14so26028331ejd.9
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 09:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EM8zR36yv9NZk1NrzeajcMRQv48cZMnSIbyy3J2C1mA=;
 b=0sdC9+3qdxC0Kk93sAgzEEAngIdL1KbvM0jftX7s6zCOs9qJ0Ko2S77v8pu01whYu9
 4m8HzYLB3A3weQ+LpGWKZC7jd7yVYinqaiUMUGFLB6AO3eypePLZPTqxxylOAPT0okCk
 D5J0+15CqgWMwRaYbhPpglW9LP7NlbO4K7MtcTsoPuOa2Z3Y9c/E1wJhzkF9pgHMf1a8
 zFzYtQu73W3zfHjECQBbqOwiTXHgdauK9YO0LTIdRfbr4dMKSQRtW7u3JbtWuahxBvHW
 NiQy6EhGFomyC1di7cXhE/7roQdgYvxi4EV+cYOr4zYs7Wkn+Wvt1UE413Cd8vFXeC58
 JlnA==
X-Gm-Message-State: ACrzQf1Qmbg+T/qm5COvDzjlW4q3njiXDFsRxSo02kIXGoBPkXltUySw
 vTR33haxkuaHIK8VlpglTbAc+HXnN8vVvTEUsik=
X-Google-Smtp-Source: AMsMyM6cVAxdo22+H1P3ohg9lF765pY/tkhwNTm3+IFnVt8k5VtPbzjb3XuE/y+XuNep7nGhW1U0nA==
X-Received: by 2002:a17:907:971e:b0:78d:e7ed:7585 with SMTP id
 jg30-20020a170907971e00b0078de7ed7585mr9092269ejc.258.1666023246008; 
 Mon, 17 Oct 2022 09:14:06 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 sd42-20020a1709076e2a00b00722e50dab2csm6328041ejc.109.2022.10.17.09.14.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 09:14:05 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id s30so16797695eds.1
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 09:14:05 -0700 (PDT)
X-Received: by 2002:a05:6402:348b:b0:45c:b22b:c4a9 with SMTP id
 v11-20020a056402348b00b0045cb22bc4a9mr11195089edc.65.1666023245039; Mon, 17
 Oct 2022 09:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221017143125.41622-1-thomas.perale@mind.be>
 <20221017143125.41622-4-thomas.perale@mind.be>
In-Reply-To: <20221017143125.41622-4-thomas.perale@mind.be>
Date: Mon, 17 Oct 2022 09:13:54 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pNnYsj9Yz0Do_UKQz+XWiz4LTxPrLz_aQgGEg1LsZsOg@mail.gmail.com>
Message-ID: <CA+h8R2pNnYsj9Yz0Do_UKQz+XWiz4LTxPrLz_aQgGEg1LsZsOg@mail.gmail.com>
To: Thomas Perale <thomas.perale@essensium.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EM8zR36yv9NZk1NrzeajcMRQv48cZMnSIbyy3J2C1mA=;
 b=SYYCsK+flZPl2BfPYl7Q47S0SGs6lk87LExnIb5lTz9gafeWqa/XkVmBSlDj/z+XW+
 aQaG62ZfCz7QqIHw9c+EJ77d/grnOF9af6CXhJ2aZ274qGuu/1UKhwOJOVP6UoDqVt1v
 lI0vmCJx34NCVo2vPL/VitrUrq07ypoVZyX2o6TMZAICTpiiZ8rcHT1pvb2Onf9+0w/b
 okYQAMecSfHTzLI8VguaPFzUvHlOL+Niog9JZ0CteF1+icR/nunxr+cf0JhRnare60Yf
 +IrIxTmE2AjkF/LBP9i5pDsp94gRlD2omftCuuWMmvEUosvOJkgBM7k0N5ARxiDoPOWu
 L7lQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=SYYCsK+f
Subject: Re: [Buildroot] [PATCH 3/4] package/go-bin: new package
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
Cc: Christian Stewart <christian@paral.in>, Geoff Levand <geoff@infradead.org>,
 Anisse Astier <anisse@astier.eu>, Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============2218610162129182529=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2218610162129182529==
Content-Type: multipart/alternative; boundary="000000000000b5502e05eb3d43f1"

--000000000000b5502e05eb3d43f1
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Mon, Oct 17, 2022, 7:31 AM Thomas Perale <thomas.perale@essensium.com>
wrote:

> This package provides a pre-built version of the go compiler for the
> host target.
> This enable the user to select between the pre-built and the compiled
> version of the go compiler. The pre-built version will be used by
> default when a go compiler is required.
>
> The virtual package 'goc' creates a menu that let the user select which
> variant of the go compiler to use.
>
> The supported host platform for the pre-built compiler are actually the
> same as the one for 'go-bootstrap' no further verification are required
> than the one already in place.
>
> For now GO_BIN_VERSION and GO_VERSION are set the same by hand but in
> next version this variable should be in common. Because the order of the
> '.mk' file is not guaranteed this will be investigated in a next patch.
>

Instead of adding new packages...

Continue using "host-go" and add parameters under a menu config for it.
Then you can simply use a single variable - GO_VERSION - rather than 2 new
packages.

I'm happy to send a prototype of this if you need.

Thanks,
Christian Stewart

--000000000000b5502e05eb3d43f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Thomas,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Oct 17, 2022, 7:31 AM Thomas Perale =
&lt;<a href=3D"mailto:thomas.perale@essensium.com">thomas.perale@essensium.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This package pro=
vides a pre-built version of the go compiler for the<br>
host target.<br>
This enable the user to select between the pre-built and the compiled<br>
version of the go compiler. The pre-built version will be used by<br>
default when a go compiler is required.<br>
<br>
The virtual package &#39;goc&#39; creates a menu that let the user select w=
hich<br>
variant of the go compiler to use.<br>
<br>
The supported host platform for the pre-built compiler are actually the<br>
same as the one for &#39;go-bootstrap&#39; no further verification are requ=
ired<br>
than the one already in place.<br>
<br>
For now GO_BIN_VERSION and GO_VERSION are set the same by hand but in<br>
next version this variable should be in common. Because the order of the<br=
>
&#39;.mk&#39; file is not guaranteed this will be investigated in a next pa=
tch.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Instead of adding new packages...</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Continue using &quot;host-go&quot; and add parameters under a=
 menu config for it. Then you can simply use a single variable - GO_VERSION=
 - rather than 2 new packages.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">I&#39;m happy to send a prototype of this if you need.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Christ=
ian Stewart=C2=A0</div><div dir=3D"auto"><br></div></div>

--000000000000b5502e05eb3d43f1--

--===============2218610162129182529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2218610162129182529==--
