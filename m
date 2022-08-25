Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF3BECAA25
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 16:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A22140A20;
	Thu, 25 Aug 2022 16:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A22140A20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hwbITxHAvZI2; Thu, 25 Aug 2022 16:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9675F40A83;
	Thu, 25 Aug 2022 16:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9675F40A83
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A67CF1BF34F
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 16:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87B6982F20
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 16:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87B6982F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FUjA2L62NZlt for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 16:25:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5132982E29
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5132982E29
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 16:25:52 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id u6so21735390eda.12
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 09:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=hdnhRDwnpPOmN1yGkQtWb2CX8esur7KvwepdCp5XeIA=;
 b=Hh2zQhciBy6EDnanAouzRw/Qlj60L2LhaUxxWLeBwGmHtWScm7BjLPjYSNFcrgAi6r
 1CQ8RSo0s78ommYHqbMum96r69TvsEeZtpQ1dBzS0489poFi/tHz2CYuyMvYKT/wtHuK
 KXR76ArmCgRYB0DJVCo/0vfJInxzIjqEi3OJhOgF8KNdaiRhBHAJ4Om4/9ZWRubztXA6
 ryQH24CGhYm/KlDIaaV5ssQkLBDK3d79rp/RIVp6VjIwB7mlHAdATAAINX7J9hcLGQTR
 m6dpSQ97i/heur+2OluzKSUKhTuoeVlo0Rfabs1iugIAdlp1jAgPW2MbTowIklNGh3+k
 fp5w==
X-Gm-Message-State: ACgBeo0/3+umMJ8r9+fdVpendfFlrToSdROnfNhY8ofEfq65zI8F0Jbe
 YVWpYZfEutlKi+bjkM5/7xR+o2FvuL2BxtO3
X-Google-Smtp-Source: AA6agR5ZMXFGmRl0LtUKrlEUrc9XcY5Cv2BhlXHLNfdzDG9K5zs+RkPnz8L+TbgP9sa67K0v+okefg==
X-Received: by 2002:aa7:c611:0:b0:447:844d:e5a2 with SMTP id
 h17-20020aa7c611000000b00447844de5a2mr3980824edq.10.1661444750361; 
 Thu, 25 Aug 2022 09:25:50 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51]) by smtp.gmail.com with ESMTPSA id
 l5-20020a170906a40500b0073100dfa7b0sm2704923ejz.8.2022.08.25.09.25.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 09:25:48 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id bj12so23528364ejb.13
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 09:25:47 -0700 (PDT)
X-Received: by 2002:a17:906:dc89:b0:731:67eb:b60b with SMTP id
 cs9-20020a170906dc8900b0073167ebb60bmr2936892ejc.614.1661444747697; Thu, 25
 Aug 2022 09:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <38884503-637d-7c23-5a02-be8f8c3a522a@free.fr>
 <20220823164040.GH2167049@scaer>
 <f882f86c-31f2-55b4-e3f4-9a64e93bd0e9@theobroma-systems.com>
In-Reply-To: <f882f86c-31f2-55b4-e3f4-9a64e93bd0e9@theobroma-systems.com>
Date: Thu, 25 Aug 2022 09:25:38 -0700
X-Gmail-Original-Message-ID: <CA+h8R2p0u-FerHf0y=QtQWo9s9HLBD0MxyCXGLmcCagD1Om4Xg@mail.gmail.com>
Message-ID: <CA+h8R2p0u-FerHf0y=QtQWo9s9HLBD0MxyCXGLmcCagD1Om4Xg@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=hdnhRDwnpPOmN1yGkQtWb2CX8esur7KvwepdCp5XeIA=;
 b=X8EQwm3Q7iFvw+6PV3S3E2cJX4T76cCReKM/TEm8OzCXtPA+0GW8HyOQilc1e3ftG/
 2lN8msJGyliQXGVtFJ1dJhgq4ZD9fuur7fPFrOfr6Tq00NxdaygCPO+58bpm8xyYtO1D
 0kn2Oh0Etyz6CbHtDRhiWcDBlbBaofe0lYZe0uhlLBhBQjYCXp9WZhtPWSp5V+iEOMMD
 otxcz+tqmXw7HsWBeX5vNEJ4hIPQHOd2exCVST3q8fAWYmEocUY4ncBYkH4gNRpTjHlT
 j0o6VSqSSXbdmtZI92hiQawOd7H5yCiut12Qvti4fbON4oPJOpspi/CdZvMKQcseRZd/
 yJCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=X8EQwm3Q
Subject: Re: [Buildroot] Docker container for 2022.02.x release
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thierry GUIBERT <thierry.guibert@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2434003504003441685=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2434003504003441685==
Content-Type: multipart/alternative; boundary="00000000000000276d05e7134083"

--00000000000000276d05e7134083
Content-Type: text/plain; charset="UTF-8"

I recommend using quay.io instead to avoid the rate limit.

Best,
Christian Stewart

On Wed, Aug 24, 2022, 9:20 AM Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Hi Yann,
>
> On 8/23/22 18:40, Yann E. MORIN wrote:
> > Thierry, All,
> >
> > On 2022-08-23 15:13 +0200, Thierry GUIBERT spake thusly:
> >> I'm using buildroot to build raspberry pi rootfs for the french red
> cross.
> >
> > A noble endeavour, thank you!
> >
> >> Is there any reason for buildroot/base:20220206.1756 not to be
> published in
> >> the docker hub ?
> >
> > The rationale behind our docker image, is to be able to run our own CI
> > jobs, that runs in gitlab-CI. Since Docker hub now limits the number of
> > downloads permonth per image (on fre etier), the CI was very often
>
> Could Buildroot fit the Docker Open Source Program criteria by any
> chance? https://www.docker.com/community/open-source/application/
>
> That would remove those limitations.
>
> If that is not possible or not wanted by the project, I guess that
> pushing to hub.docker.com but have the Overview page state that this is
> pull-limited and recommend using the gitlab registry instead?
> https://hub.docker.com/r/buildroot/base
>
> Cheers,
> Quentin
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000000276d05e7134083
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I recommend using <a href=3D"http://quay.io">quay.io</a> =
instead to avoid the rate limit.=C2=A0<div dir=3D"auto"><br></div><div dir=
=3D"auto">Best,</div><div dir=3D"auto">Christian Stewart=C2=A0</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 Aug 24, 2022, 9:20 AM Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@=
theobroma-systems.com">quentin.schulz@theobroma-systems.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi Yann,<br>
<br>
On 8/23/22 18:40, Yann E. MORIN wrote:<br>
&gt; Thierry, All,<br>
&gt; <br>
&gt; On 2022-08-23 15:13 +0200, Thierry GUIBERT spake thusly:<br>
&gt;&gt; I&#39;m using buildroot to build raspberry pi rootfs for the frenc=
h red cross.<br>
&gt; <br>
&gt; A noble endeavour, thank you!<br>
&gt; <br>
&gt;&gt; Is there any reason for buildroot/base:20220206.1756 not to be pub=
lished in<br>
&gt;&gt; the docker hub ?<br>
&gt; <br>
&gt; The rationale behind our docker image, is to be able to run our own CI=
<br>
&gt; jobs, that runs in gitlab-CI. Since Docker hub now limits the number o=
f<br>
&gt; downloads permonth per image (on fre etier), the CI was very often<br>
<br>
Could Buildroot fit the Docker Open Source Program criteria by any <br>
chance? <a href=3D"https://www.docker.com/community/open-source/application=
/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.docker.com/c=
ommunity/open-source/application/</a><br>
<br>
That would remove those limitations.<br>
<br>
If that is not possible or not wanted by the project, I guess that <br>
pushing to <a href=3D"http://hub.docker.com" rel=3D"noreferrer noreferrer" =
target=3D"_blank">hub.docker.com</a> but have the Overview page state that =
this is <br>
pull-limited and recommend using the gitlab registry instead? <br>
<a href=3D"https://hub.docker.com/r/buildroot/base" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://hub.docker.com/r/buildroot/base</a><br>
<br>
Cheers,<br>
Quentin<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"norefer=
rer">buildroot@buildroot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman=
/listinfo/buildroot</a><br>
</blockquote></div>

--00000000000000276d05e7134083--

--===============2434003504003441685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2434003504003441685==--
