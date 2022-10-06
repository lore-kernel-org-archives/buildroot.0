Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D2EC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 01:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FA294187A;
	Thu,  6 Oct 2022 01:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FA294187A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uIf1T1tGnAra; Thu,  6 Oct 2022 01:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5773E41872;
	Thu,  6 Oct 2022 01:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5773E41872
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A30A61BF3F6
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 01:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7819B408F0
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 01:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7819B408F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L0W7NOwWdYqk for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 01:11:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A92FC401B3
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A92FC401B3
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 01:11:22 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id g130so411836oia.13
 for <buildroot@buildroot.org>; Wed, 05 Oct 2022 18:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ILi2S5czbVFMqNcs12znHz+WMw31NXXH/VfkC+iXi0=;
 b=TYFwbjVBaLqqWOSrF5ZwWr4m8/21KVmBPvQesmWY5yZ0Q2qkCUYDuu8aU9t6c/9Sna
 P/69pRbrE5XAZd+0x5M9ev/0BCOnjkORu3F8hFtd3foaYZR2jrdW6C+gbpkpACenxxag
 wajzEdn5jRSEhNXkLxw9HEcYdLIHiq64wxAl7NSLNFiJnUBm49kak6PXVoewDfp2gd6b
 aSOY5UtTJXH1Owc+9oAIrCyXVCIrutWHlT1VKvz50u7rdS78bFdgnZMEqF4iOVFkbvhG
 Hf1sWR7HYoMa329MhgP9rbzDVZHrBavcIgfcoufWjKRCO7alf/pNvnrOMbZ76UWxqW6+
 i6Ng==
X-Gm-Message-State: ACrzQf1QDqGPDVqnY/kaNajHq+ayojavXEpuSHsvzDFP3mbphnNSO6Ev
 yPWZNdsfuAtukgSkK++/U83VGR0RUqDNZMJdnBKrmloo3FpaEw==
X-Google-Smtp-Source: AMsMyM49nnX/mE9cxMzfxTJdo8K8S4gspaapRYuyWPJMW07L6N0xt1yAYk4S0N4w4+6KaH5MuHdpR22S8Y7tNiZOu4Q=
X-Received: by 2002:aca:1117:0:b0:350:42c:55ba with SMTP id
 23-20020aca1117000000b00350042c55bamr1263854oir.113.1665018681640; Wed, 05
 Oct 2022 18:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <CACw=RXKvmdHDVc5bk1qZ6-d6ebbeJqEWGaNk9pOdn1YoYoVX6w@mail.gmail.com>
In-Reply-To: <CACw=RXKvmdHDVc5bk1qZ6-d6ebbeJqEWGaNk9pOdn1YoYoVX6w@mail.gmail.com>
From: Cem Sezer <cps@microplex.com>
Date: Wed, 5 Oct 2022 18:11:11 -0700
Message-ID: <CACw=RX+iZgqvPaU+C1i7BE331VRs9qwdUOD8smUc2uYgAwtvVg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microplex.com; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5ILi2S5czbVFMqNcs12znHz+WMw31NXXH/VfkC+iXi0=;
 b=w5yfZfBl6uIClpzMv6Ivju/iJcgCsqXbw87sPVqfYYevbR5v7OgVIdNcb+RGYtRNOm
 HKQd0EA6Chtmi2bDsXoKj23Q5JiNKyduxao5s/NA6CiRihrKljABAq62Yi2YbzoTsGgm
 AAhpR5WWDk24doThsiCO92sPHwcXSWSHNxXW2QQPnm6XPFfy1A1S+4gX4HBf+Io//2G+
 xA2CXwV+O5IFCeyqnSErV+sj+6cwTCTZcO5IjnszRXbd0lAFOtCx7GM+QAdEE25gJy9v
 8Ii9N7VVDDPDiiyK83ti2KppL/fq98cagDtXMVHcahkuga9HVuk/thHfLMRgb8HgNg56
 n1lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=microplex.com header.i=@microplex.com
 header.a=rsa-sha256 header.s=google header.b=w5yfZfBl
Subject: Re: [Buildroot] wpa_supplicant: TLSv1: No TLS version allowed
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
Content-Type: multipart/mixed; boundary="===============6883368315906650579=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6883368315906650579==
Content-Type: multipart/alternative; boundary="000000000000105e9c05ea535f88"

--000000000000105e9c05ea535f88
Content-Type: text/plain; charset="UTF-8"

Hello,

I updated to the newly released buildroot-2022.08.01 released a few days
ago and it fixed the TLSv1.0 issue and it started using TLSv1.2. However,
now I get the error "EAP-PEAP: TLS processing failed". Additionally, my
radius server outputs "eap_peap: ERROR: TLS Alert read:fatal:bad
certificate".Not sure how to proceed here.

Thanks,

Cem

On Wed, Oct 5, 2022 at 4:28 PM Cem Sezer <cps@microplex.com> wrote:

> Hello,
>
> On a new build, when I run wpa_supplicant, it seems to only allow TLSv1.0.
> When I specify the supplicant to use a newer version of TLS in
> wpa_supplicant.conf under phase1, it fails and the debug output says
> "TLSv1: No TLS version allowed". Am I missing something? When I don't
> specify, it defaults to using TLSv1.0. I included all parts of
> wpa_supplicant, openssl, and libcurl when using menuconfig. I'm using
> buildroot-2022.08. The version of wpa_supplicant is v2.10 and openssl
> version 1.1.1.q
>
> Thanks in advance,
>
> Cem
>

--000000000000105e9c05ea535f88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I updated to the newly released =
buildroot-2022.08.01 released a few days ago and it fixed the TLSv1.0 issue=
 and it started using TLSv1.2. However, now I get the error &quot;EAP-PEAP:=
 TLS processing failed&quot;. Additionally, my radius server outputs &quot;=
eap_peap: ERROR: TLS Alert read:fatal:bad certificate&quot;.Not sure how to=
 proceed here.<br><br>Thanks,</div><div><br></div><div>Cem</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct=
 5, 2022 at 4:28 PM Cem Sezer &lt;<a href=3D"mailto:cps@microplex.com">cps@=
microplex.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div>Hello,</div><div><br></div><div>On a new=
 build, when I run wpa_supplicant, it seems to only allow TLSv1.0. When I s=
pecify the supplicant to use a newer version of TLS in wpa_supplicant.conf =
under phase1, it fails and the debug output says &quot;TLSv1: No TLS versio=
n allowed&quot;. Am I=C2=A0missing something? When I don&#39;t specify, it =
defaults to using TLSv1.0. I included all parts=C2=A0of wpa_supplicant, ope=
nssl, and libcurl when using menuconfig. I&#39;m using buildroot-2022.08. T=
he version of wpa_supplicant is v2.10 and openssl version 1.1.1.q=C2=A0<br>=
</div><div><br></div><div>Thanks in advance,</div><div><br></div><div>Cem</=
div></div>
</blockquote></div>

--000000000000105e9c05ea535f88--

--===============6883368315906650579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6883368315906650579==--
