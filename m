Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBCDC982D6
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 16:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FB7B810B0;
	Thu, 17 Sep 2026 16:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuXiCyIFui69; Thu, 17 Sep 2026 16:12:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 26DB2810B4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789661520;
	b=WgNaiRwZU9EaCPe4MUHeA5nkwcEkaEDCSgo28UvDThTi3kVda+SX7z5ZgiBjy/vr2YMf
	 7PbvuQ6PAfTQbHLCfcxA608DHBRhdk6HbLkBg+Z/Os3hqD59w5uM74eNX//BsTq/fIoES
	 ssOZcx2dyLFepzbIgk8VwUNg3ffoKS1OoYu0Di/LQZCt2N+8AYuaTbiD7i99NGMV76NKs
	 5PdOhuXJKWTh2ZH8pvkq67JuCBesvmo8YKufr40Y2rO15BDwwSYnQeqWk0U+D7WtO4iCZ
	 qmNybr+S3OYGJDJs7K4IGDiMlMdRvBSu3wyoMNZhnsQpKmFhPPZvj/VutT6eax7U0wA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789661520;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:From:To:Cc:In-Reply-To:References:
	 Organization:Date:MIME-Version:User-Agent:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=tbFWjez7O9UKP9ow3kzqOtbsVFPRKGCOSJM0A02fJVQ=;
	b=L+VR/uu7gypqR2EE9D5il/Cn1WEkhmK0SXyvZ2NAF5ahq6y2C6lRqLkChHlTRPG/0VQ3
	 ajRTZ0n1eNu0GJVNdcA27AH3QLQihj2qnFanV0MSjyY5k0C5zr1wEZbUS3ygg3tZIf71Y
	 rCdmPb6BJUc3ODV2NXeAVL5V8Oq5HCXsVSeZk9pN8DGFLBvwpTxtZtHvQ21Y+qn5MEvx4
	 PUbXUJysqPip2QrYwOOWwhZr1zenrXJdi6UQbhFsrpP/a7R6yFYPQboP8fEU+jFn05Fly
	 vRfuqJo04mh+hlhqo/TSTnhhydcf+ti9P2xMMJpYY3xuupNjTBqWr5OGVZ+R+FF4pDw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=btY7hIVW;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789661520;
	bh=tbFWjez7O9UKP9ow3kzqOtbsVFPRKGCOSJM0A02fJVQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CnByZRLOjQlbF5Fr+Nmwi14FN+ghuK/M7LcnplU2osuVJuJ6yHtgUZrBFW/D8OdiF
	 AniCGyXs3COjVpwEODRdAJhdZr/u/MIyOjzpWw+JWD7fRBB2e+XN1AbAEVtrTyVBwq
	 3GSOfS0TiHyYh7OT0RGbESgh2jH+7X0zxYFNSMsQkxQrGQ1srZfpQmxNswHSuIAQo3
	 PbqsRgIYXmqcg+D4g4vz3/w5OKLdBVGCrHNHG6CAejO/xSQBh6IIsKsTA+FBxTDYWy
	 RXTw6P0soQ0vsfZFKx9DOMk+0ZKgeeB7Why4KkO/1uuZmjTfUc9GFEG4oCVxSoULL5
	 1U5xOBGSar+mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26DB2810B4;
	Thu, 17 Sep 2026 16:12:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D805C465
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C91F0810B4
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mF_kuLjD5GSF for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 16:11:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A4EBB810A4
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789661518;
 b=AHl2LEljz/ikNl25VL8kZxuTiRXFKNEJ35/uS84b8sjUUSTgpVAjiWRhOfv42QgJQU7m
 fT84HlkFT/BhX22BJKJGJBW1nrU57wcthjdvQG1U6DII27QrRiFwBSDJKyq987qE0FvKZ
 3aOwJPlTvrzQ5K9svMY3kuiKPaEkoYtrFS2BJC38OOgaDEz+3bTCISxQGuhNVsnblO5J7
 Gwf0sV1DMIXRDLhn7YnLDni//QQylUG3wXslr9nKH86D/PRLY7E5y5dv+aaDnbv5x55UQ
 4ilg1HPJmlJLdWkr6KLl3i/08z+tHg8BnYQtDAE1zodLhFSjoBnD0J7hpelqmUk1/Dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789661518;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
 From:To:Cc:In-Reply-To:References:Organization:Content-Type:Date:
 MIME-Version:User-Agent;
 bh=kaCe2VK7G/2GT9dEEl0luWce6nRo2NlwRsxqXa5EhM4=;
 b=Xla7rS3Y8QC/CggeSFj3UaKx+xMJMjS+wAt4MSUzRoKvxPARvhLzGRiIg2J+KUciJS6c
 qa50hpmxjpRnm/Lm6No8HZYmOQj3D8nfDtHYxTuE2POulSwcMcvWA845/K8N9uCW07H51
 r+NUMbc6rCQREPP/krOl8/YKsWXgRlzCZ0Gzjc+7YrljpRDskBygZRGsaBX+3hmggRAxo
 1sNgY84fHPisu/t9oUGF/3kOsUZhWcZEMaLJJWL4R+3TGQ8EvF2OpKXGnpXpOaiIFgnkb
 Aqqo+idCvaO035jkPmXHUXa1hYndRJLaSlPsO3GO3GuCEq1bty/YkncVEHOxwP1gInQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=btY7hIVW; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=btY7hIVW
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4EBB810A4
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:11:57 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c2940ff2313so70964166b.1
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789661515; x=1790266315; darn=buildroot.org;
 h=user-agent:mime-version:date:content-type:organization:references
 :in-reply-to:cc:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kaCe2VK7G/2GT9dEEl0luWce6nRo2NlwRsxqXa5EhM4=;
 b=btY7hIVW5TdfUQkRqpTChLJmE9BxlKS3BOe0t5cFUFuS27JAIU5KUTlpCapdqs9f6s
 AwAkRG3hUGKHRdXv7gw6x8BBcQn/LsLr/LJwBrBaLjEFHcwIE0sBELZQQTDJIqUosOgp
 We4nsxb4N5cEKUOmsuYrAh00M9EmolMMgPIfXAdFYv8HGhRU+Y1ooTdxx+8UtVjaiJtt
 N6S+4O3Js/86kSMH/vTcmr4fuWHGxC87mrIlwYmzDTr/DuWtRDxfaQSYmXbUSBseQ9TM
 gLi4YGhzKsyuwsKPv6CexOOKCufqrowXO0gdmL5TJyhD6vRCSAg3fVsaoL+shDi1gDLt
 93RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789661515; x=1790266315;
 h=user-agent:mime-version:date:content-type:organization:references
 :in-reply-to:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kaCe2VK7G/2GT9dEEl0luWce6nRo2NlwRsxqXa5EhM4=;
 b=R5C069jA5z38DcyA8l84hKrB0XL6FKotSml3RD/xurcp0rcc9f4Z3w7oKLs5gqdKHI
 go7dn9SdxBUTBTOrpJ16a0JpapsEcID6ImNGj/JwGfWD9XX0x24pZi+JMjvXfV841aPO
 bqrTNaHUtXyXVBIyF2zDmb0FIWexf/LJc4iNAS6JfoYhpf2d0DC0AjVgGa0LvzuCgzan
 sumV5gs+JQC1tkmtGutrTwtZ408RuBKhe35WZMr36Mp3Zf09qRmhqWIkt0/z3nIaDkBP
 ky23W0rcn9/67qbGaSjbT2YjVSKipYMi2NXUN1yRxBHNH5JrwyBlDOOJ5ublqfa8ZaHw
 PR5Q==
X-Gm-Message-State: AFuF++kI9AJvRV2JbWqLyWsXa8qQrOQN6o+ExdKwP5Jgr6xk3QvCM1OH
 8k3M2cKnyJT3Fvu9J/ZBQ7q9BlYXSh3kR0AwBrg/h/bwguk1rxgQtvVp4ug8OA==
X-Gm-Gg: AYBFou3j/L/4t/3IOQwxxQdv2hpJqr2LdziZu6o+DahIbSz0ouIbCRTFQg/OeNEQGGf
 8D1EfkKBvYe7tBsD97XYREpdJKZ+T4O10fsPAtmritF99LyMlhGv+ACb89mNFWoWtUuOwzbD/kX
 doGA+XP3HydP/WIm7u4DY0pMf4WPrQdd7xenVmfa4J8GYj4OUCauQILb/KUa90Jr7Ffk1s/clu3
 sgiByniaJ7BKsyaMoaeufrKRoruW5yTD1cR40t1lPl3HAumBODK0um1LoKUGKxYR97A4LhJLlRT
 C9RnkAbR0tY713DnfNhRWt0gdqnQgLqpNDxK7ffllpNatyKmEz9+lVODp+hg4ozs3OhwOxU7GoT
 Nbis0yFaiKLvtOihap7JhH8vf7oVeXGOufl2YOmjlwidB5mz863eCEjHqO/YwkGtRNzyTPAGuEt
 RKfM+splIpxg5D61BeyAq0IZppDVCB0sFnm1Tz91z00BaHrSFA+Cjx4fmnT/CdDMTciMK+HmUvM
 CTgfY92W9NQXzWy3B3rhIWawG0lqcSRGSv6Z94yHi5Gjhs=
X-Received: by 2002:a17:907:6d22:b0:c25:f7db:4bf0 with SMTP id
 a640c23a62f3a-c29f54f1522mr332689666b.22.1789661515125; 
 Thu, 17 Sep 2026 09:11:55 -0700 (PDT)
Received: from [192.168.0.200] (h-158-174-22-6.NA.cust.bahnhof.se.
 [158.174.22.6]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29de0851ebsm305622666b.4.2026.09.17.09.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:11:54 -0700 (PDT)
Message-ID: <4a5cbe52b2fe626cfafd978465a5e9ce5d4c353e.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260917160543.243218-2-troglobit@gmail.com>
References: <20260914103020.3485030-1-troglobit@gmail.com>
 <20260917160543.243218-2-troglobit@gmail.com>
Organization: wires.se
Date: Thu, 17 Sep 2026 18:11:53 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Subject: Re: [Buildroot] [PATCH v2 1/2] package/lldpd: security bump to
 version 1.0.22
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8966020743928368643=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8966020743928368643==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-WkDS2UjIYqoLJaq0fdc7"


--=-WkDS2UjIYqoLJaq0fdc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oups,

this has already been merged, please ignore.

Sorry for the noise this creates! I somehow messed up my patch queue.

/Joachim

On Thu, 2026-09-17 at 18:05 +0200, Joachim Wiberg wrote:
> https://github.com/lldpd/lldpd/releases/tag/1.0.22
> https://github.com/lldpd/lldpd/releases/tag/1.0.21
>=20
> Fixes CVE-2026-46433, an out-of-bound read access when removing the
> VLAN tag.=C2=A0 1.0.21 fixes path traversal vulnerabilities and arbitrary
> file deletion in the privileged process.
>=20
> GPG signature verified with key
> AEF2348766F371C689A7360095A42FE8353525F9,
> LICENSE hash unchanged.
>=20
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> =C2=A0package/lldpd/lldpd.hash | 6 +++---
> =C2=A0package/lldpd/lldpd.mk=C2=A0=C2=A0 | 2 +-
> =C2=A02 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
> index f3cefe7b73..46f2b9b476 100644
> --- a/package/lldpd/lldpd.hash
> +++ b/package/lldpd/lldpd.hash
> @@ -1,6 +1,6 @@
> =C2=A0# Locally computed after checking gpg key
> -# https://media.luffy.cx/files/lldpd/lldpd-1.0.20.tar.gz.gpg
> +# https://media.luffy.cx/files/lldpd/lldpd-1.0.22.tar.gz.gpg
> =C2=A0# using key AEF2348766F371C689A7360095A42FE8353525F9
> -# gpg --verify lldpd-1.0.20.tar.gz.gpg lldpd-1.0.20.tar.gz
> -sha256=C2=A0
> 61b8cb22d4879e68f7825a2fb8e1e92abb4aba4773977cf0258bc32ed9f55450=C2=A0
> lldpd-1.0.20.tar.gz
> +# gpg --verify lldpd-1.0.22.tar.gz.gpg lldpd-1.0.22.tar.gz
> +sha256=C2=A0
> 9587940ed2314a86774c5499f3dfb13a8eb86232a62d243a83a1f09886848e03=C2=A0
> lldpd-1.0.22.tar.gz
> =C2=A0sha256=C2=A0
> 0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d=C2=A0
> LICENSE
> diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
> index a3015e9e7d..f0cbc7e436 100644
> --- a/package/lldpd/lldpd.mk
> +++ b/package/lldpd/lldpd.mk
> @@ -4,7 +4,7 @@
> =C2=A0#
> =C2=A0###################################################################=
##
> ###########
> =C2=A0
> -LLDPD_VERSION =3D 1.0.20
> +LLDPD_VERSION =3D 1.0.22
> =C2=A0LLDPD_SITE =3D https://media.luffy.cx/files/lldpd
> =C2=A0LLDPD_DEPENDENCIES =3D \
> =C2=A0	$(if $(BR2_PACKAGE_CHECK),check) \


--=-WkDS2UjIYqoLJaq0fdc7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEShHhOTSGNO9JnOys7Kgmo3tsdAkFAmqsEUgACgkQ7Kgmo3ts
dAk8bg/+IpHzaighJJ+yGwyWg69mlzWkRCsgUbq5AQFnqjTiBUxPZpv1LzfaTCTP
2BqYRDIW7MudQjRklX2sgcFoe55ta8vOcVxYdjhXaP72XFL2kd/L+YW0I3y9w7tJ
5dlfd2Fj2vQ9py73TzOfne4H99w5gJ6hYRJ1LsYsnjNeaEWQN8tfJzvwHBSAg2dL
zbAR/K6QL2leTQ1xDxpOCTrahZ4pEDvsWeK6tWAqgIM3coxYrKrqDWe6h5l9MBES
djmBF2Eo7r2yMDsPyXf26A04UBZQsB+NG/GS9V+8H0DkZMpqUjIRC65/DFZQHU5L
2efT9L0Z5xoRGRIrzzfneAsDP2SsJTNsaNvdTYUTFE3Uk67/uFp0vOlrpVXyhAIu
0B/OZrZEQy2zvlI5X8RX3KSJuzSMF1kp72v/JMCPHORzK4MKVi2FEq/1GY1jHlSM
7O1wgnIXE9k4hKoVk913kowbsiPv5iwMEX2y8mCHOfZ5QxXiuG17wtA6Gjp0hftW
+g/h0GO7IfH72YZ3X2he//KcXco0xZeFmTDyJMQNapaHiw5ZOyqkqBnWwEjqcXip
7ZrzG3XIm0FH35UzhGEMsmRXid7IhoxlEv7LTeS/bBPCQ8IVUTtNzIz/4WDBcEkG
pe/iBHZg5rSu76QtmTl78jrF1eKTrK7iQOOIh7LMZq7iDZ15rhs=
=DEBb
-----END PGP SIGNATURE-----

--=-WkDS2UjIYqoLJaq0fdc7--

--===============8966020743928368643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8966020743928368643==--
