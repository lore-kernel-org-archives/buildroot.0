Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6EAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 21:01:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF95F61AFF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 21:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF95F61AFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63F77607B5;
	Mon, 15 Nov 2021 21:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g3XVNA_ZMQQR; Mon, 15 Nov 2021 21:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5AC8605CE;
	Mon, 15 Nov 2021 21:01:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2A061BF3D9
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 21:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC626400CE
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 21:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mWqFT8rppC4 for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 21:01:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B221A40012
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 21:01:08 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id v15so38438926ljc.0
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 13:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=1cOOX4Ggn5jA/XO9HrtBOiV4IIS8n8sRCgCk2RQ6z0Q=;
 b=P5a9vfLlnjp4FkcGt/Yhk/VT9jR9KMRM4wU+yxyvpBmzTKMgwntaAO6a8IoZnKfB0u
 lQwHJCVDiwiW92XfWDnh1NYphNnOz054BUiVcrMXR2fjY/QsrrbPXHHQoQUJHeWHr5yd
 1wZFxtSEUgD3++O6xz+NH1ZilYAAALbidCp3hlIxsBTdlT90ZRoMwPSLwyXMW54vV+nu
 3UixcgsF6CGzeL4aO+RHJl9N+IH0IxKP8GDJ4sZtxfrlE1pLbj+woGw5j2mCauhaTJK/
 xKCoRQSi2ozYomBFxmBiWjODcz52U2ddY23VfJ2vpcpIzly0ZvfNWfI3WlJScjO3nSy0
 EHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=1cOOX4Ggn5jA/XO9HrtBOiV4IIS8n8sRCgCk2RQ6z0Q=;
 b=qBi4VXMUcGJCEphitrWBtiQyjRJ47CcMJrbnLjl9qwrhwaPXT5fDzw9a8iV5iUrrhX
 eLdHyuo6vw5n4NgC4rIxkdeyyls2D+1D4Q98R5LWilX1J5OhDh672fKI0hydhZpCIDbB
 qBEYPwaanMRiAd4eQT7sumDpzXBqJ7nWVNrwHt+UiKZFfa9FdBNzcxpqMWOg9bWrPGCZ
 vBg6p2k0OpWSh1UXPB7sB2WzM3AOZAWdJAnnm4eRb1fP3jh9f1l6xCLFEIwlItewhD1p
 TE+me+9IMud2AjEg8KH1KD+ulXkcC/2WvoWZYuEncMnrn4Uw7res+90Pfy761JAm0wYM
 6E0g==
X-Gm-Message-State: AOAM531QzZKc5kG40wK2+k29YsTj3+uwB/J9FhtVnAe0fkbE2liR/Bma
 NjD+TNWe/Be6r54IxHQIbrJpZfKasgY=
X-Google-Smtp-Source: ABdhPJwLoUTgmvFmY6RY74ljzxdvudfTU0r8KvMySl68i6i6Y3deZrj6oXZpfqEEmnHs4qpnCAH8lQ==
X-Received: by 2002:a05:651c:2103:: with SMTP id
 a3mr1514428ljq.435.1637010066317; 
 Mon, 15 Nov 2021 13:01:06 -0800 (PST)
Received: from [10.0.196.136] ([176.10.248.197])
 by smtp.googlemail.com with ESMTPSA id e7sm1601824ljk.24.2021.11.15.13.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 13:01:05 -0800 (PST)
To: Peter Seiderer <ps.report@gmx.net>
References: <20211115134205.4176891-1-troglobit@gmail.com>
 <20211115161851.0897fb8b@gmx.net>
 <CANP3Sck2vX1GV=T9+AUXLaQxE5bzMjoYp8pwSxh-oc4gx_qioQ@mail.gmail.com>
 <20211115205356.264286e5@gmx.net>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <7969a0af-313e-ac79-14b5-e1ea674a146a@gmail.com>
Date: Mon, 15 Nov 2021 22:01:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211115205356.264286e5@gmx.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump version to
 v5.15.0
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
Content-Type: multipart/mixed; boundary="===============8652547121936698319=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8652547121936698319==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SeMyegTxb3dSWIEWPU9zndSEp7ZIvY7N2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SeMyegTxb3dSWIEWPU9zndSEp7ZIvY7N2
Content-Type: multipart/mixed; boundary="gi5H6yc3Nr5oO0MgT05EjKKZ93iriA3bB";
 protected-headers="v1"
From: Joachim Wiberg <troglobit@gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
Message-ID: <7969a0af-313e-ac79-14b5-e1ea674a146a@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump version to v5.15.0
References: <20211115134205.4176891-1-troglobit@gmail.com>
 <20211115161851.0897fb8b@gmx.net>
 <CANP3Sck2vX1GV=T9+AUXLaQxE5bzMjoYp8pwSxh-oc4gx_qioQ@mail.gmail.com>
 <20211115205356.264286e5@gmx.net>
In-Reply-To: <20211115205356.264286e5@gmx.net>

--gi5H6yc3Nr5oO0MgT05EjKKZ93iriA3bB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/15/21 8:53 PM, Peter Seiderer wrote:
> Hello Joachim,
> On Mon, 15 Nov 2021 19:10:57 +0100, Joachim Nilsson <troglobit@gmail.co=
m> wrote:
>> How does next vs master work?
> Take a look at (for a short description):
> 	https://buildroot.org/downloads/manual/manual.html#RELENG

Oh dear lord ... that's the biggest slice of humble pie I've been served
in my lifetime LOL

    git show de2b78143c4

:-D

Best regards
 /Joachim
_______
I changed my last name the summer of 2020.


--gi5H6yc3Nr5oO0MgT05EjKKZ93iriA3bB--

--SeMyegTxb3dSWIEWPU9zndSEp7ZIvY7N2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE3gkxgy2/gzkZH7KyLCqwqW4MR1gFAmGSypEFAwAAAAAACgkQLCqwqW4MR1ju
wgf/ZR4GqaCMZLnBFFnNSYqSpXUEs96hr299J4ZQ5KAxnffME+x9NTedPRxVTrznTGtZAoyBttmB
gLLjr4s3dF/NKbvNNJD4revfBu6WsG86Bcr1nfG6lG7Iqh9DrOea9HOTh6YgRnaHSa0uYXzdllf3
4wxIDxE2bD3pWxawgR2e5Ra51+XGT4to9qWlP0+aov4sb2jY8+aIGWvjqgQf0iE4PTQ+Bs7FOe9r
qDKqpXC4E4L1SnGJmoGMBlZ3ja/eycFlYMnbiRp/4npwG8wyP21JdYm/d9aOOknkvHj2Xjl6Ud1A
YDSDeoBpypGD96FrVAdCbp2V7qs8YFAzWvtOFmmIsg==
=dllB
-----END PGP SIGNATURE-----

--SeMyegTxb3dSWIEWPU9zndSEp7ZIvY7N2--

--===============8652547121936698319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8652547121936698319==--
