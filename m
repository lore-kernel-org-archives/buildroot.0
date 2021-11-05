Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF92EC433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:50:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5128060E08
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5128060E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F251D8291A;
	Fri,  5 Nov 2021 21:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUAadJyXDlS5; Fri,  5 Nov 2021 21:50:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 080858275A;
	Fri,  5 Nov 2021 21:50:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8191A1BF5B5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DCFA61579
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MJcc7o5boAgh for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:50:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 302F1606CF
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:50:26 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id v15so10050993ljc.0
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 14:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=4A6ed5Q+Z7i8xQhvSkNlTzSzWUic+hJh/cd4zoK3r+o=;
 b=gRlxxh3i0lXZENzWJYZ0TK8g7CiL8OjUqZn4q9G6O6QxO1TCrkG9fakFBT5ukohuSr
 xC9sI6MakOs9+/NdQHuWur5zD+/mA6hXhBKWe3YCBz9ChltDgAVLGJM2AuTmOuuG55vc
 4tw8Vmddz3fGB3l2zPBkBeoKqxBLKx59yjEkFz6geclPCkwO9UQO3D9TfK5H0S4WoY5y
 Q/oNn3xfpUW3QFDXtLK9HJNsQIZan9pJf2uvlLK9iXNHja/17OEvA6gQWl//hEG7Yh/P
 /VI0NdpPYzNmcQspCXyEIqRtGfX7vwyutp6Lo/bZX2BxNQK0VB/HX3CyArjjVfDXtFkV
 ShWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=4A6ed5Q+Z7i8xQhvSkNlTzSzWUic+hJh/cd4zoK3r+o=;
 b=RCVaT1ZUEZh1NOoHJk+4inVwpZAmVzvAyyA/dReVPGWfOYuhsXxBY91HUO9aDwNLF7
 jxpFwRSMdlnsVCpYyOBm2F/OIEtZR3pUXp8j7Hu3lxvpudqyagRu5t2OaoUwAIwl1hsY
 LyXJc51A+Tc27LNhPEFZUhrxiCXwCJ8v+sLgtSd530xXtIZiHMLShWLA769PGs+S9zLi
 94KaR38MKKOCqGCiTCLWohpIpnEGMO8BoWxqlETMeIx3kgmgECy1/eARdThG1yv+Xxh6
 uQXjGtkr/QP6bmW40Je8IQBEpj2UO46nje1kHC9RTZxkd3s/MoRnalZhleJJlO1fXgG3
 w0gg==
X-Gm-Message-State: AOAM532ysGqyunHbfdlr6qT7jZ2bitmxji5IqUo2UVeQCyGE1zqHmCj/
 dBqno08PyeUdkzL7QykQBEeoPSQPCUA=
X-Google-Smtp-Source: ABdhPJyCvcCS+K+PlxjM1wJ6Fn8PDRSbeFuAEfLQ3p1UKdLlWHtfrFmL1lIl7yugiZxbVk8NP67GyQ==
X-Received: by 2002:a2e:9090:: with SMTP id l16mr5053979ljg.213.1636149023740; 
 Fri, 05 Nov 2021 14:50:23 -0700 (PDT)
Received: from [10.0.196.136] ([176.10.248.197])
 by smtp.googlemail.com with ESMTPSA id n1sm874564ljj.79.2021.11.05.14.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 14:50:22 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211105213116.2589815-1-fontaine.fabrice@gmail.com>
 <20211105214147.GJ2400@scaer>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <7c9886f3-f9be-64c7-4526-732eb9059245@gmail.com>
Date: Fri, 5 Nov 2021 22:50:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105214147.GJ2400@scaer>
Subject: Re: [Buildroot] [PATCH 1/1] package/libteam: drop
 LIBTEAM_CPE_ID_VENDOR
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8586131783450008875=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8586131783450008875==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WPiOdiohrF5FsiTRkzwWiya8oH3jioCCN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WPiOdiohrF5FsiTRkzwWiya8oH3jioCCN
Content-Type: multipart/mixed; boundary="g3tf4zJhetsA6Wn85Ran7VCRlTSfonS41";
 protected-headers="v1"
From: Joachim Wiberg <troglobit@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <7c9886f3-f9be-64c7-4526-732eb9059245@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libteam: drop
 LIBTEAM_CPE_ID_VENDOR
References: <20211105213116.2589815-1-fontaine.fabrice@gmail.com>
 <20211105214147.GJ2400@scaer>
In-Reply-To: <20211105214147.GJ2400@scaer>

--g3tf4zJhetsA6Wn85Ran7VCRlTSfonS41
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 11/5/21 10:41 PM, Yann E. MORIN wrote:
> On 2021-11-05 22:31 +0100, Fabrice Fontaine spake thusly:
>> LIBTEAM_CPE_ID_VENDOR was wrongly set since the addition of the packag=
e
>> cpe:2.3:a:libteam:libteam is not a valid CPE identifier for this
> Joachim, what made you think libteam was appropriate?

I really have no answer for that, cut-and-paste+replace mistake,
maybe.  I was sure I checked it before submitting, but it must
have been some other package.

Sorry about the messup!

Best regards
 /Joachim



--g3tf4zJhetsA6Wn85Ran7VCRlTSfonS41--

--WPiOdiohrF5FsiTRkzwWiya8oH3jioCCN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE3gkxgy2/gzkZH7KyLCqwqW4MR1gFAmGFpx4FAwAAAAAACgkQLCqwqW4MR1h5
xgf/dPhTBbi3aAco4PBvRtcIgC8BfsShq/XmwsgmzS45b88iyXbYNhU0yMgyiHNVid6SyQ9v/cBE
7A0P1OTYH7QfvE015isCYjux1lHptIPsz5Gh25Xf6PF5jEjml+RSLjsRQ6EoyWBssxhQyMLFZCkY
8SxnanYXHD6qYXUpZPxBTF5ngeaac6XWyFbuJnQnWIOMoiPY12vgBlkf0k9/VKRS1I730yZAVrmT
7qG6OYSRpIkk0fYsTPGnDeVGM0Oe2oy9yqfUuZY/7p+fpAVI3OoiP1TtI83pI1f7zEjzPQ6goCAQ
YweizMxcWszHeA7yBiSsvesdDRmnmbUqFRWYNM/PCw==
=WDtm
-----END PGP SIGNATURE-----

--WPiOdiohrF5FsiTRkzwWiya8oH3jioCCN--

--===============8586131783450008875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8586131783450008875==--
