Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B928AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:13:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E83360EB9
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E83360EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B22A403AC;
	Wed,  3 Nov 2021 21:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0aYrMcScGHdf; Wed,  3 Nov 2021 21:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C20140398;
	Wed,  3 Nov 2021 21:13:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA81A1BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A50860730
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R6PL0EZrVPvc for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:13:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DECEC606B3
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:13:43 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id x27so7781020lfu.5
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 14:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=cWdb+prkgLxMeFB/Qp6Wfc6MnFHAPLMm8umcQddtJOI=;
 b=OZQK5SXXlQkxrmb1z9Zg8fDwpJoEqsJBDsIZld331vYr8x4/Luo+FarRQz3AJdDvqo
 +e4mmU0geiTgwDAyTF2zZQhS08IHKwAXYBFE1Ich8vdNjs7fUEZoRoXLEOyWGqMFpSpn
 QbgOAG9i3Az4ma1CdznnMu5cPV5A0xSN1o9UED9Zr5P9JF0nmhNEh4eJWipYD4RBtaXg
 6Glq98QaCczfGcy8EBRIIhAzhlJzjRA4r8/7yja6TUVpCO85+zuOR+knF7IxHBKWN6PT
 vYgs9HFmhoO0pVO5HozynnbHDYurMkc6WdNaX755VoPcjYM7zbCiVl46d4K74vHPO+P4
 yBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=cWdb+prkgLxMeFB/Qp6Wfc6MnFHAPLMm8umcQddtJOI=;
 b=VfG1Qdpd9x/FAkrztgqnxEPvLcvBi8Fk2B0YDvzhevdR+0PU2IyzJeo7ZWkgeVcG0E
 Lkuri4/Bh4mdODlG7mu1+FsSgfB1YBDtIl8DHUGhRiDQ0QkkW5blKz50+ackbnLwvaui
 doC/EbnI4mBcJvbj7Ols/EaDnXwS5d200ajuXZOlGId+TAFnA7gV1vgOj4ONoI26/lGX
 olzcL59JlQGRia5fSNa2DiAnaPQVmS4KulU8H4YmESmxyvifapMHLsKX//AeuHa0tp62
 T293NPqw4UiME7xQKtUP/E04TTYYIR14BEh/eF3M5xB8drwHgqyrOtQI57bOdt8cKcYN
 y1Rw==
X-Gm-Message-State: AOAM532oupK3+YzVXpFTZxpHBlZ1hy59XQ4HQbtK9fMoXBj2vItGlaH+
 VpQiVxC/aAV6feVIDrwsqwQ=
X-Google-Smtp-Source: ABdhPJwNEsdcTVNRPGRZEqgK8DQGW30mcWlwhZfG+t6cz2dkSoXkkiRavVBMZzyA7PRT3QFntnceiw==
X-Received: by 2002:a05:6512:694:: with SMTP id
 t20mr20392230lfe.341.1635974021893; 
 Wed, 03 Nov 2021 14:13:41 -0700 (PDT)
Received: from [10.0.196.136] ([176.10.248.197])
 by smtp.googlemail.com with ESMTPSA id z26sm35326lji.110.2021.11.03.14.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 14:13:41 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211103123411.3116067-1-troglobit@gmail.com>
 <20211103123411.3116067-2-troglobit@gmail.com>
 <20211103184552.32325c55@windsurf>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <6325ade0-9dc1-fa42-5829-b044ab1f3804@gmail.com>
Date: Wed, 3 Nov 2021 22:13:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211103184552.32325c55@windsurf>
Subject: Re: [Buildroot] [PATCH 1/2] package/mrouted: bump version to v4.4
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0224330157112173434=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0224330157112173434==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZZUMXLcTNg8BdBHdwrd9tgybcLPrWklhF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZZUMXLcTNg8BdBHdwrd9tgybcLPrWklhF
Content-Type: multipart/mixed; boundary="G5b4EtvwMWvldI77IBNG2wHoto4z1q3bD";
 protected-headers="v1"
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Matt Weber <matthew.weber@collins.com>
Message-ID: <6325ade0-9dc1-fa42-5829-b044ab1f3804@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/mrouted: bump version to v4.4
References: <20211103123411.3116067-1-troglobit@gmail.com>
 <20211103123411.3116067-2-troglobit@gmail.com>
 <20211103184552.32325c55@windsurf>
In-Reply-To: <20211103184552.32325c55@windsurf>

--G5b4EtvwMWvldI77IBNG2wHoto4z1q3bD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/3/21 6:45 PM, Thomas Petazzoni wrote:
> On Wed,  3 Nov 2021 13:34:09 +0100 Joachim Wiberg <troglobit@gmail.com>=
 wrote:
>> -config BR2_PACKAGE_MROUTED_RSRR
>> -	bool "enable RSRR for RSVP"
> When an option gets removed, we normally add an entry in
> Config.in.legacy to let the user know.

Ah, of course.  I'll send a v2 later.

Q: that option is behind a condition (only if BR2_PACKAGE_MROUTED),
   how is this normally handled?  I see no such constructs in the
   Config.in.legacy file


Best regards
 /Joachim




--G5b4EtvwMWvldI77IBNG2wHoto4z1q3bD--

--ZZUMXLcTNg8BdBHdwrd9tgybcLPrWklhF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE3gkxgy2/gzkZH7KyLCqwqW4MR1gFAmGC+4QFAwAAAAAACgkQLCqwqW4MR1jd
qgf/ZAROa0UtN1u1FYbeW8FNGBeou/Xjh7fNW32z9jBTXnzpJfeoyJql6j/fxOGn7Vm3EBkxmabl
HHViTRd3qic8A1kEUIjvZBSP6ysz4Hi9kbCsdCMJU11QEIhyApum764G1FuAM9D05OfYatYZFbxQ
iAUfyWAHey/V8udFFLBK1pj8GQKinXz3QqX4EyU67r6Yo/ShvEuBADW+9lpLJp6td1xuMZrdk7+C
jvlMmRrUOKg40cRDkJKptKDEYqa7usgkyA6RbB95dxcutWgolIK2gdPUKbRLWN4xxI15hgx1Zojt
z+CcEnSVagFLuXSlfc6ytgop3RveXoz+3xc76W0cVA==
=jfX/
-----END PGP SIGNATURE-----

--ZZUMXLcTNg8BdBHdwrd9tgybcLPrWklhF--

--===============0224330157112173434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0224330157112173434==--
