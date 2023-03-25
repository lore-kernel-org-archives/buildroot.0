Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992A3C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 16:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0331981CA3;
	Sat, 25 Mar 2023 16:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0331981CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdDGKWMvMATf; Sat, 25 Mar 2023 16:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A55981CA7;
	Sat, 25 Mar 2023 16:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A55981CA7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 062731BF4E4
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 16:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDFDB81CA7
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 16:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDFDB81CA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dVwtGgHprvDr for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 16:54:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ECD081CA3
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5ECD081CA3
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 16:54:28 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id i5so19935929eda.0
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 09:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679763266;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CTenVpWrBfY3gEu3P9nkzq5two7vbLYLG7me09NqNv4=;
 b=Tf5zCUfIhbj4lqIIVXJBAZrqTZCqD9hAUe74p1c9eEToPsQ7c1xRMUnnN0nIvLh8ot
 QrP/k1gV/WwcpJ5OXa+d5djQUpRL8YRF8Vr7BCxUhi20/93dB9g0E7V+5yrhdf31C4+C
 ECMk5I3A5WCodW4juqhifgKY9Y/ND15Hulh0zlBrSvBI+g8QQtG6TINlRw3ihQq9MRET
 yXXnqA3UiWZmmdvhFlb5aWU7nWmRbwooBWWPjjELrFnmDarB7Yq0RInEaNAfERQW4k8p
 Rrga2ISIhaWlMtKZUjSppOtr05Z83317cil828StYHD7MS/lD3Un/BJf/Bj/4000KQWR
 uzKQ==
X-Gm-Message-State: AAQBX9dowwePoMz0jEmdARDpjDXOyTLauQxbw2k8jHPai8bDQA09nZ6P
 REnCCvadKToE4UsK9gFUlsxB83EpOrNlsXY79YDsAQ==
X-Google-Smtp-Source: AKy350be6CtdZqf6/0v5KNXpvHD0KAyQl13/qMqs8Ofbngw6z6SRSHNXQrMMpFQu0p8TDHtK4ZRGmg==
X-Received: by 2002:a05:6402:2c6:b0:4fd:236f:7d4d with SMTP id
 b6-20020a05640202c600b004fd236f7d4dmr6507620edx.18.1679763266029; 
 Sat, 25 Mar 2023 09:54:26 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 c21-20020a50f615000000b004fce9ff4830sm12564947edn.88.2023.03.25.09.54.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Mar 2023 09:54:25 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id eh3so19645032edb.11
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 09:54:25 -0700 (PDT)
X-Received: by 2002:a17:907:1c09:b0:92f:b329:cb75 with SMTP id
 nc9-20020a1709071c0900b0092fb329cb75mr4001045ejc.5.1679763264847; Sat, 25 Mar
 2023 09:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230215073256.186476-1-christian@paral.in>
 <275f7c96-36c9-e6be-f15b-ff164d8445c5@gmail.com>
In-Reply-To: <275f7c96-36c9-e6be-f15b-ff164d8445c5@gmail.com>
Date: Sat, 25 Mar 2023 09:54:15 -0700
X-Gmail-Original-Message-ID: <CA+h8R2q-UF5cSD+5OzKKtUGgHNd+BEi6piYJev_Fu50vbMWmzw@mail.gmail.com>
Message-ID: <CA+h8R2q-UF5cSD+5OzKKtUGgHNd+BEi6piYJev_Fu50vbMWmzw@mail.gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google; t=1679763266;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CTenVpWrBfY3gEu3P9nkzq5two7vbLYLG7me09NqNv4=;
 b=RXBEA51Z5svZQndUobHoMhr8DVV8tmcNBAldFNWAcK57n1PMWpmusSAER3v3OZju0S
 iIcS4bafdBsJjP/YLB+jVEpItfQFy/3aijnOQUMpNbnyxoy9dTAlOs+ggMQTgksRudlu
 FGlq5ylcL/agHHnouo/ug5crxM+zoAV1JgwNQcXeLjHbKyu+jvXfw/eglXscmk6N9VW5
 +9+TYtV/1m9D526BUInthJb8XIBc0wFc+rvyOPDvbOKubd9fYi2MqohdWjxC+hKdoGvt
 5kF2x8tmTbpQOA7cT1XltGkGlNXuZkoQa01y6n7Mj+/5b3Kw7QNWPiePvihzFUBpcjpv
 ntMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=RXBEA51Z
Subject: Re: [Buildroot] [PATCH v3 1/3] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.5
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
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6879201299446886887=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6879201299446886887==
Content-Type: multipart/alternative; boundary="000000000000b546ad05f7bc5c4e"

--000000000000b546ad05f7bc5c4e
Content-Type: text/plain; charset="UTF-8"

Hello,

On Sat, Mar 25, 2023, 6:34 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On 2/15/23 14:32, Christian Stewart via buildroot wrote:
> > Go 1.20 requires a minimum version of go 1.17.13 to bootstrap.
> >
> > https://go.dev/doc/go1.20#bootstrap
> >
> > As Go 1.4 was the previous version that could be compiled with C, there
> is now
> > no way to bootstrap go with a C compiler, unless we use a two-stage
> bootstrap:
> >
> >  - build host-go-bootstrap-1.4-20170531
> >  - build host-go-bootstrap-1.19.5 with host-go-bootstrap-1.4-20170531
> >  - build host-go-1.20 with host-go-bootstrap-1.19.5
> >
>
> I prefer using gccgo to bootstrap Go distribution (on my machine
> it takes circa 15-30 minutes since the majority of time is spent on
> bootstrapping
> stage 1). To do that, I build GCC with --enable-languages=c,c++,go
> and pass LD_LIBRARY_PATH="<gcc prefix>/lib64" to go sources' make.bash.
> I haven't tried bootstrapping using gccgo from cross-compiler, though.
>
> So the bootstrapping flow would have been


> 1. Check if Go version (either from Go distribution or from gccgo) is at
> least
>    minimum required version (for now 1.17.13). If it is lower, bootstrap
>    Go 1.17.3 (I call it bootstrap Go). Otherwise, go to 2.
> 2. Bootstrap Buildroot's Go package.
>


We had a long discussion about this previously, please check there. We
decided to instead use this multi step process for various reasons, or use
a preinstalled host compiler if the bootstrap process is not possible.

Check the original discussions if you'd like to see the reasoning:

https://lore.kernel.org/all/20220525234312.643dfc03@windsurf/T/

Best regards,
Christian Stewart

--000000000000b546ad05f7bc5c4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello,<br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sat, Mar 25, 2023, 6:34 AM Bagas Sanjaya &lt;=
<a href=3D"mailto:bagasdotme@gmail.com">bagasdotme@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On 2/15/23 14:32, Christian Stewar=
t via buildroot wrote:<br>
&gt; Go 1.20 requires a minimum version of go 1.17.13 to bootstrap.<br>
&gt; <br>
&gt; <a href=3D"https://go.dev/doc/go1.20#bootstrap" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://go.dev/doc/go1.20#bootstrap</a><br>
&gt; <br>
&gt; As Go 1.4 was the previous version that could be compiled with C, ther=
e is now<br>
&gt; no way to bootstrap go with a C compiler, unless we use a two-stage bo=
otstrap:<br>
&gt; <br>
&gt;=C2=A0 - build host-go-bootstrap-1.4-20170531<br>
&gt;=C2=A0 - build host-go-bootstrap-1.19.5 with host-go-bootstrap-1.4-2017=
0531<br>
&gt;=C2=A0 - build host-go-1.20 with host-go-bootstrap-1.19.5<br>
&gt; <br>
<br>
I prefer using gccgo to bootstrap Go distribution (on my machine<br>
it takes circa 15-30 minutes since the majority of time is spent on bootstr=
apping<br>
stage 1). To do that, I build GCC with --enable-languages=3Dc,c++,go<br>
and pass LD_LIBRARY_PATH=3D&quot;&lt;gcc prefix&gt;/lib64&quot; to go sourc=
es&#39; make.bash.<br>
I haven&#39;t tried bootstrapping using gccgo from cross-compiler, though.<=
br>
<br>
So the bootstrapping flow would have been</blockquote></div></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
1. Check if Go version (either from Go distribution or from gccgo) is at le=
ast<br>
=C2=A0 =C2=A0minimum required version (for now 1.17.13). If it is lower, bo=
otstrap<br>
=C2=A0 =C2=A0Go 1.17.3 (I call it bootstrap Go). Otherwise, go to 2.<br>
2. Bootstrap Buildroot&#39;s Go package.<br></blockquote></div></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">We had =
a long discussion about this previously, please check there. We decided to =
instead use this multi step process for various reasons, or use a preinstal=
led host compiler if the bootstrap process is not possible.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Check the original discussions if you=
&#39;d like to see the reasoning:</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><a href=3D"https://lore.kernel.org/all/20220525234312.643dfc03@wi=
ndsurf/T/">https://lore.kernel.org/all/20220525234312.643dfc03@windsurf/T/<=
/a></div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,</div><=
div dir=3D"auto">Christian Stewart=C2=A0</div></div>

--000000000000b546ad05f7bc5c4e--

--===============6879201299446886887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6879201299446886887==--
