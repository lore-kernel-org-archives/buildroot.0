Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0BAC25B76
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 01:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC67F41773;
	Thu,  6 Jun 2024 01:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Htp2cyzyz4hE; Thu,  6 Jun 2024 01:08:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B03141775
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B03141775;
	Thu,  6 Jun 2024 01:08:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CBB441BF5A2
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 01:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B921261066
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 01:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mfig-rrKs0-r for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 01:08:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E7AE608D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E7AE608D3
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E7AE608D3
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 01:08:16 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52b92e73e2fso431151e87.2
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 18:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717636093; x=1718240893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t7H05zeTqp8K+ZkFbfvviAYZbHwowt8rSLZ3Izq9AZI=;
 b=gE+EzIhQ1o/YivN75Ev+t5bnkjSSO0Ctl0s5oXgRMhSbDf1BWy2M35ntj1uS3g7UOS
 tQOXNGjSU9wsgfjrAASyb1ad3gfo4skd9CgCJwvTsHmltsN4L9NiljyKhIIsyoiQ5f74
 8XNRVKg4X1Qj3loEGnYF5dGxJMRKPMhasqeZGR0r+R3YDRWpTAxOn8UXu8ldmws5nHMZ
 cTcKsi1yRYLlI18m4P9boX/kt9jOzfoEHWDV6mZ0hI5PVuX9pA53DDbzxvl29UGgG4PD
 PjB62ZLuspM7d67QA4rMVisknxp5YJh/bcowUicswb9ZozSO9xHuck/N7pW7FrJOHzZR
 u28w==
X-Gm-Message-State: AOJu0Yz1PXrRq8utcQMJB4uGOmJhdqAgdvTU93blsKfGUbLp1q9Urb51
 0GQrLAq5DAPPwKMTI2oY8SPPIhrr61I1KVoN0AvQjw13LP85Kzvises+/GdrfGDmKaRIyOHD8BB
 NlPqfqw==
X-Google-Smtp-Source: AGHT+IHrutfx189lRtuIyPA+RLQD3jH9yYZiMs7zkO/++DHTjf00PTz7a6fYAMhiUMOTEt5duPuazw==
X-Received: by 2002:ac2:58db:0:b0:52b:853e:4d44 with SMTP id
 2adb3069b0e04-52bab4cf6c0mr2131002e87.35.1717636092672; 
 Wed, 05 Jun 2024 18:08:12 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb434dd10sm36892e87.304.2024.06.05.18.08.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 18:08:11 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2e6f2534e41so4362871fa.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 18:08:11 -0700 (PDT)
X-Received: by 2002:a2e:9094:0:b0:2ea:b956:db2b with SMTP id
 38308e7fff4ca-2eac798d145mr22113991fa.7.1717636091105; Wed, 05 Jun 2024
 18:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <a936f689-1972-4f9b-8173-d1260c6ac2d7@athaariq.my.id>
In-Reply-To: <a936f689-1972-4f9b-8173-d1260c6ac2d7@athaariq.my.id>
Date: Wed, 5 Jun 2024 18:07:59 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pCNEK7xKnHKJXExs=AwPMTjkcNVP6M5XMT=BPjNfaEOw@mail.gmail.com>
Message-ID: <CA+h8R2pCNEK7xKnHKJXExs=AwPMTjkcNVP6M5XMT=BPjNfaEOw@mail.gmail.com>
To: Athaariq Ardhiansyah <foss@athaariq.my.id>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1717636093; x=1718240893; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t7H05zeTqp8K+ZkFbfvviAYZbHwowt8rSLZ3Izq9AZI=;
 b=Mk0H4JD23GGu3h7lxCOUjmzOz4/nvNPagwNdzJsPBuX3aaYFJxlWduKr+Vi+mVm92J
 N3rPr5/S2Abb3Oqyry4PXV7OBm+IvQr4s+Ji2hwL/ogA+weY+0/pDp1S/6xf0hq1/Qlq
 QJHKMDeYi5dmhkF+hDmngVEBdEp6TOWCVPAwHCjw4GjWmZWlbQQSPwmNg7QEcXNP/XjC
 kdFDtBUeRKnTKTTlYJWUqZtTX/gW+V7bPNTJvgJqu9hfgluRS9ZU196sJRQ1sB0pPLXH
 1wiXB4tkLTT23h1B/DUi1B3Bbxhv3HuyoQuzUILPEXf9NuxUi3kL8Vp6GqgEz2VUYwPX
 DA8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=Mk0H4JD2
Subject: Re: [Buildroot] [QUESTION] package/go: why not using GCCGO?
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Alexander Egorenkov <egorenar-dev@posteo.net>,
 Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============5005535500297123998=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5005535500297123998==
Content-Type: multipart/alternative; boundary="000000000000106806061a2e5100"

--000000000000106806061a2e5100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jun 5, 2024, 5:06=E2=80=AFPM Athaariq Ardhiansyah <foss@athaariq.my=
.id>
wrote:

> Hello Buildroot Contributors and Maintainers,
>
> Before I'm working on go and go-bin package as mentioned in TODO list,
> I need to know why not build the Go compiler with GCCGO. The urgency of
> this question because multiple stage of builds won't be scalable for
> each version bump. If you're not really understand the reason why not
> scalable, see the version requirement as in the link below.
>
> https://go.dev/doc/install/source#go14
>
> Imagine if we have Go v1.93, that would require a lot of stages :)
> Whereas GCC v12 already has Go v1.18 front-end support. We can directly
> use existing toolchain. For further information, here is the reference:
>
> https://go.dev/doc/install/gccgo


This has been discussed in great detail here, please check;

https://lore.kernel.org/all/20220525234312.643dfc03@windsurf/T/

Indeed using gccgo was one possible avenue.

The problem is not every Buildroot tool chain has gccgo within.
Particularly older pre-built ones.

For now it is easiest to build the C version of the Go compiler with gcc
and then use the bootstrap process to get up the latest Go release.

I have a pending patch which falls back to the Go compiler on the host
machine if we can't bootstrap (like we are on arm64 build host).

https://patchwork.ozlabs.org/project/buildroot/patch/20230711220849.1702358=
-4-christian@aperture.us/

Please also check the next branch. Someone recently merged a PR series
addressing the Todo on the wiki. It might be outdated now. Which Todo are
you actioning?

Thanks,
Christian Stewart

--000000000000106806061a2e5100
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello,<br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Jun 5, 2024, 5:06=E2=80=AFPM Athaariq Ar=
dhiansyah &lt;<a href=3D"mailto:foss@athaariq.my.id" target=3D"_blank" rel=
=3D"noreferrer">foss@athaariq.my.id</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Hello Buildroot Contributors and Maintainers,<br>
<br>
Before I&#39;m working on go and go-bin package as mentioned in TODO list,<=
br>
I need to know why not build the Go compiler with GCCGO. The urgency of<br>
this question because multiple stage of builds won&#39;t be scalable for<br=
>
each version bump. If you&#39;re not really understand the reason why not<b=
r>
scalable, see the version requirement as in the link below.<br>
<br>
<a href=3D"https://go.dev/doc/install/source#go14" rel=3D"noreferrer norefe=
rrer noreferrer" target=3D"_blank">https://go.dev/doc/install/source#go14</=
a><br>
<br>
Imagine if we have Go v1.93, that would require a lot of stages :)<br>
Whereas GCC v12 already has Go v1.18 front-end support. We can directly<br>
use existing toolchain. For further information, here is the reference:<br>
<br>
<a href=3D"https://go.dev/doc/install/gccgo" rel=3D"noreferrer noreferrer n=
oreferrer" target=3D"_blank">https://go.dev/doc/install/gccgo</a></blockquo=
te></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">This has been =
discussed in great detail here, please check;</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><a href=3D"https://lore.kernel.org/all/20220525234312=
.643dfc03@windsurf/T/" target=3D"_blank" rel=3D"noreferrer">https://lore.ke=
rnel.org/all/20220525234312.643dfc03@windsurf/T/</a></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Indeed using gccgo was one possible avenue.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">The problem is not every B=
uildroot tool chain has gccgo within. Particularly older pre-built ones.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">For now it is easiest to b=
uild the C version of the Go compiler with gcc and then use the bootstrap p=
rocess to get up the latest Go release.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I have a pending patch which falls back to the Go compiler =
on the host machine if we can&#39;t bootstrap (like we are on arm64 build h=
ost).</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https:/=
/patchwork.ozlabs.org/project/buildroot/patch/20230711220849.1702358-4-chri=
stian@aperture.us/">https://patchwork.ozlabs.org/project/buildroot/patch/20=
230711220849.1702358-4-christian@aperture.us/</a></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Please also check the next branch. Someone recent=
ly merged a PR series addressing the Todo on the wiki. It might be outdated=
 now. Which Todo are you actioning?</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Thanks,</div><div dir=3D"auto">Christian Stewart</div></div>

--000000000000106806061a2e5100--

--===============5005535500297123998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5005535500297123998==--
