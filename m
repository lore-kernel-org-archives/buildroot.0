Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12CDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 08:52:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33B960F4B
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 08:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A33B960F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72E9D404CA;
	Sun, 10 Oct 2021 08:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HakHizvPWSp5; Sun, 10 Oct 2021 08:52:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF5AB404C5;
	Sun, 10 Oct 2021 08:52:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2376F1BF285
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 08:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F8A3827C9
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 08:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LNFOEUr0QqkT for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 08:52:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7D7382725
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 08:52:52 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j5so59507893lfg.8
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 01:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=fo30dEkvG3AAo4CAFs2iVQ7LsAYq7E6Sevi+MQWLssk=;
 b=pNfxT63XPo3PxyloU5vfL60XHv0ketjrOvszbdIEi7H6imssqlxLuz8BPdosT7q0AG
 u6qzdnwmc1Dstl7KWED0ZjM0F1uki2PTNqlIzOHjDLJVZ5y1YEdWj52jjD7oMZcORAfg
 pIgq6PLS3xHyku6pk9OhJ5PbhCMxNkDE3QIXTS0btkGujDfdLIWY7bV0lBJ8h8776Nnn
 rjyahK2SmPJyfyWNcyeak7rktn1TDhJ0/a8bI64QaVp9tjb9GW32yP0nzrIIW1kskmvS
 E2cTOcG1OMzVCFx89aksW0+H8z8EYwCus2LC+h5Y995plbCaWUKbL+0O8n15TqSXXa3z
 L9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=fo30dEkvG3AAo4CAFs2iVQ7LsAYq7E6Sevi+MQWLssk=;
 b=p1akA6FAgHLS7EwJRU/97SVc0DV6b28v4udocpxzjh3YHT7EZmZJ71vFS9xKF5norJ
 3mQ19zYlbkEtJSNqHyUUgmfhqF7mfS4SC135cHw062yTtao1HRlOJPECoKIHVY3JtEdE
 1Low0Vh6VnCrY16bwc5wwwNPae6a832bWED54sA2jY23WcitRPwqrkFYlCEjalk0xDxo
 Pwu4qKDYJUeXRXF9w85yvGa0kc4afK9mC2rEsnEtGux0tWukWGJrvLE/2Sm6L8iyQDMU
 9TFTIe+IbXsKeEMK47PsZEec4xsDuz0j7HHbZHtsyHVvlv/zf73f5+mlKUjgDeB1Fu4C
 8MEA==
X-Gm-Message-State: AOAM532gttBsIA8xn0PIMValkjU52la0qJOLThIxsNt1zQZq8ttlxydq
 bJJc/CswM6T7PGwYzCbNTrs=
X-Google-Smtp-Source: ABdhPJzI/dYFOOFY+jhqvI3RYO/gm3hdCMlfsX5LOS2OEUXvODRwL9NLXZ8IBnGnZqv37ckTj/eAoQ==
X-Received: by 2002:ac2:4f01:: with SMTP id k1mr21745725lfr.266.1633855970660; 
 Sun, 10 Oct 2021 01:52:50 -0700 (PDT)
Received: from [10.0.196.136] ([94.254.51.197])
 by smtp.googlemail.com with ESMTPSA id a21sm487011lji.135.2021.10.10.01.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Oct 2021 01:52:50 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
References: <20211009094144.130161-1-troglobit@gmail.com>
 <877dels2p4.fsf@dell.be.48ers.dk>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <43da32e2-6d83-ab1b-4b8e-1aa287e0e699@gmail.com>
Date: Sun, 10 Oct 2021 10:52:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <877dels2p4.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH 1/1] package/libuev: bump version to v2.4.0
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5061545479321431454=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5061545479321431454==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LAtfnvE9mFU6ybceeY3aeqvkJXpSIgoH0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LAtfnvE9mFU6ybceeY3aeqvkJXpSIgoH0
Content-Type: multipart/mixed; boundary="CoUIWbrvjgOt7y6WXxUYmZBWNyznexBHR";
 protected-headers="v1"
From: Joachim Wiberg <troglobit@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Peter Seiderer <ps.report@gmx.net>
Message-ID: <43da32e2-6d83-ab1b-4b8e-1aa287e0e699@gmail.com>
Subject: Re: [PATCH 1/1] package/libuev: bump version to v2.4.0
References: <20211009094144.130161-1-troglobit@gmail.com>
 <877dels2p4.fsf@dell.be.48ers.dk>
In-Reply-To: <877dels2p4.fsf@dell.be.48ers.dk>

--CoUIWbrvjgOt7y6WXxUYmZBWNyznexBHR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Peter!

On 10/10/21 10:29 AM, Peter Korsgaard wrote:
>>>>>> "Joachim" =3D=3D Joachim Wiberg <troglobit@gmail.com> writes:
>  > This update is critical for linking against GLIBC v2.34, due to the
>  > changes related to 64-bit time_t on 32-bit systems.  See ChangeLog
>  > for details:
>  >   https://github.com/troglobit/libuev/releases/tag/v2.4.0
>  > Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> This presumably also affect musl, which moved to 64 bit time_t back in
> 1.2.0. I don't see any autobuilder issues related to older libuev
> versions (or uredir, as it probably only triggers when a dependency
> tries to link with it)?

The change is only related to GLIBC, which from v2.34 requires an
additional build flag to enable 64-bit time_t.  The latest libuev
release adds the following to the .pc file (and it's test suite):

    -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64

I don't think musl needs anything other than recompiling from source,
which we do already.  At least from what I can see from this page:

    https://musl.libc.org/time64.html

> What about uclibc-ng, which still uses 32bit time_t?

Absolute time in a future after 2038 on systems with 32-bit time_t is
pretty much undefined.  Fortunately, most common use-cases with libuev
involves periodic or oneshot (monotonic) timers that are relative to
their individual start, which as far as I know are not affected.

Best regards
 /Joachim





--CoUIWbrvjgOt7y6WXxUYmZBWNyznexBHR--

--LAtfnvE9mFU6ybceeY3aeqvkJXpSIgoH0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE3gkxgy2/gzkZH7KyLCqwqW4MR1gFAmFiqeEFAwAAAAAACgkQLCqwqW4MR1h9
Uwf/Yeh7bbg/Np1WW7eO5fn1dXd49PlyybXqMtDILweNVv+XkpBhqiokOuf2opEpqYZxzlb+JTVG
czabz/xd1uPDWT1EeWZTuKRUzZvbQ3P6T4O/mvKgtiTb1Sxc2jtMNK5iYbZiKEkNP2wgbmeZGcge
zIzZr4AaDK00sDzSBYsY3R7ebp7WVfb7WI3GlgAMo4O6YjVNpsgwfBZazvf1CiszMljTDSZLjfxV
P13EhaJrsYTisf52EXAsuxp5y3562krinxFaAw5gXHKgxkNv54TCFwQuNppLf6QxIZG4BvIkn/58
8ISpmIeZnj862bpaafy3uirLdGHmzNQg7stOnMtjJw==
=x8EJ
-----END PGP SIGNATURE-----

--LAtfnvE9mFU6ybceeY3aeqvkJXpSIgoH0--

--===============5061545479321431454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5061545479321431454==--
