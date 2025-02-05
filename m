Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90DFC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 09:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58DA2811BF;
	Wed,  5 Feb 2025 09:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZgziJYyyPUM; Wed,  5 Feb 2025 09:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6EDF811A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6EDF811A0;
	Wed,  5 Feb 2025 09:00:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1107412A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0154E81133
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35hcM6wzUMa4 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 09:00:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A8F081183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A8F081183
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A8F081183
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:00:38 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3bbb0f09dso11460602a12.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 01:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738746037; x=1739350837;
 h=user-agent:mime-version:date:organization:autocrypt:references
 :in-reply-to:cc:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0e7cubNWVuM79y1IiSmbgxffpwOL86alXc2YgNrX5yo=;
 b=K58wbQMILLZw8no4AWDe471fhYEdFu6ECEI1Wyq5DAvw44L60pG8l7bFH/SZG3/Joe
 M+GI3Al953FlmoaCWYpwWEA32QdG17iDe2C09VV50/pPTKPXvsmc/lU753/QuaWr2HpD
 +trkkUlDOAPZCivmA255sPqNQM5hNg3qdv87E1c5yFvuFwK7PDE8xTLArcyf2W/Ts/Dc
 gUWGIHsdnTKUNImFuJ6qLJGpR6DdIEHAUq5/JrFGH/IyZv9dauH44peVUrMG+uyb6BjQ
 QTHM5lOhOc4AxpFWImb/RirSNO0M+bqrDpQnyz4TIehc4R2/LXknFaftsKaoWD/E7vKZ
 qqDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqt0jwXgI3n6+KKG9NQQ1oARWIxkq/bniqn/Mc99JiEtaHOfNxv/ESJNTK085qg6+64nQguqlE+Uc=@buildroot.org
X-Gm-Message-State: AOJu0YzfVR9IeCvwVTuasXE8OJ8f/3oXDNZ7ldhfdt7y/+Wb01JQKAd+
 IS/r1WJS8ihQ/ibrAhUATIKZNs8BZme53cIORR4b8PCNh60+NLse
X-Gm-Gg: ASbGncsQ+3QESsACeoL6uyb/ZGgEsG8URPe0CoxThc9+PP79zdeE5rNPc0vwMn8k5mr
 K2aoSLZAx/uCw/Hsbqv6W+y98SKW4/H3LNXDef6Pd8HD2aBwmExelIHcyeQjkqwPlaVVNTLZ5/M
 fkYN8+ZT8YwgFzFAJdR8nPZjNVM20HKFC+IiEg6DtNH4fA+eeHHTbvEkkg59v/OKpKrRMSFCuVu
 DBpGnVVVWVxF+Di9s8wFbo2ogbAEy4Qrl+2QyyHWcIOrf9Aor32QHEE0VMObBpGiLorKCaRnP16
 PUsGSXmUxOC5+urokhsmwLBDNfjK7aq2og7vuOsd5bOyo+Qe53HGaw==
X-Google-Smtp-Source: AGHT+IHz5zUnBvG/A9jXajNYUnSHiH+gZGYZdQmjkOicvgNhosSNUM/Y/Tnju83IyW8CL22AjX9KZQ==
X-Received: by 2002:a05:6402:520d:b0:5d0:e563:4475 with SMTP id
 4fb4d7f45d1cf-5dcdb77a449mr1870774a12.29.1738746036471; 
 Wed, 05 Feb 2025 01:00:36 -0800 (PST)
Received: from [172.31.21.208] (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc723ea218sm10623511a12.31.2025.02.05.01.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 01:00:35 -0800 (PST)
Message-ID: <f096c87c2793ce8f1b9920f0d59e4a3da7eafadc.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>, Vincent Jardin <vjardin@free.fr>
In-Reply-To: <54979566-2f3c-44e4-bc5d-9b343e7729fe@mind.be>
References: <20250106203459.2875914-1-troglobit@gmail.com>
 <54979566-2f3c-44e4-bc5d-9b343e7729fe@mind.be>
Autocrypt: addr=troglobit@gmail.com; prefer-encrypt=mutual;
 keydata=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
Organization: wires.se
Date: Wed, 05 Feb 2025 10:00:35 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738746037; x=1739350837; darn=buildroot.org;
 h=user-agent:mime-version:date:organization:autocrypt:references
 :in-reply-to:cc:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0e7cubNWVuM79y1IiSmbgxffpwOL86alXc2YgNrX5yo=;
 b=Zxv7WqqpLbEVDL2RP5Saf1MO1MoVvzi7YpjYL8txM0klh4j9sROlcA7mmnjNIBfHF/
 QAz+vrZcNQO7xadDCyzZyDyooAZWCyZCUBIulZF1DYBOz9iHV14cKC9odBZd5dfUhUF3
 EPNIkRmpcd/K5gnEow8PkQWwof3Be8P2/UNswLfOCeJm5Y2wlOFP9ONHYFPrwj949nPn
 PdKauV1Z4pWMtBYcXx2pn/kUqiY5ZguEaZP4ghTW2Qt6xqC+I4FSTdIlLX6HkMCI6xcb
 9yS8g0kvezrOzf/UPbMoElLtSCx2GDGaCRiR/lEjt1WoHkJK4vILY2I9cO+2msksV7dx
 u7YQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zxv7Wqqp
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: make vtysh group
 configurable
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
Content-Type: multipart/mixed; boundary="===============0180380088645912859=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0180380088645912859==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Jm9bPOQTgj/FMFobMwad"


--=-Jm9bPOQTgj/FMFobMwad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2025-02-05 at 09:51 +0100, Arnout Vandecappelle wrote:
> On 06/01/2025 21:34, Joachim Wiberg wrote:
> > Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> =C2=A0 After some back-and-forth we didn't reach find the use case
> compelling enough, so I've marked this patch as Rejected.

OK, that's fine.  It was worth a try, and now I've learned a bit more
about policy and how you reason about things like this in Buildroot.  So
thank you! =F0=9F=99=82

> BTW in the future, please make sure to include in the commit message=20
> an explanation _why_ this patch is needed (unless it's obvious, like
> for version bumps, new packages, or fixes).

Understood.

Best regards
 /Joachim


--=-Jm9bPOQTgj/FMFobMwad
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEShHhOTSGNO9JnOys7Kgmo3tsdAkFAmejKLAACgkQ7Kgmo3ts
dAn70xAArCNv2mVLrajTebnzEkSIpFX1MQRFvs58pHe9UoLqI7qV4caDuRDAbtz7
UpRINIsQUjJmLz/FMH6Ftm1vo34apyWg3ZJUHrHfxHafidn5L8D5XrfHUwVcqFfr
8r0nzcwREc8D8HuIp99ubec+QUPyag6awFnj+p+8w9UleVaen1IVpptPxrk5vyob
O4yoRGe7i+CqHTLsPYI7eAG7RAl0GBBeq5KM9UU5K9XF8S9AsjiGPM8iUwAUcNZL
/egZVTTPeO99FxC0B0/RJtMCeQCrWf5Th/zInaHT3goClrvQKCLqWHzyCjPqrdmq
YyOESX2MWc/RxBBBu+1+FszAzJkod9Yp2TA/5xz8hELZ9rrDKnRRoHZqvzLwgX5u
MnRTT4hVbATTdVGDBnUCFYeSyi4zp+W2AlqQctuMN99SrPFCuaY1KiAfFqTAfoap
0dfVUtNKqm86nQvUzWL7sD4zJMSxRvqp9nxlo2CkMMOMUQiB7oPHLatNhhtcZqL5
WWrfHyYBkbUGo41g0VlZe0rQpG34CGGCGnm+gLBLudd++pbuYixlGDloELr23evT
XnDNjYsAlbQKhVl18MQAH0EU89zud/tnN2L+BmAds2ujQLRAhLCSv493xP3UXp/x
DRlgyA8LDJdjsAZdAsaMdWmLHYnDKTZqA9yuaE1dwLY1HgQw/E8=
=y+i5
-----END PGP SIGNATURE-----

--=-Jm9bPOQTgj/FMFobMwad--

--===============0180380088645912859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0180380088645912859==--
