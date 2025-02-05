Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570C0C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 04:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0145E60E15;
	Wed,  5 Feb 2025 04:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8_bpDd2YOcJ; Wed,  5 Feb 2025 04:14:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAAE460F28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAAE460F28;
	Wed,  5 Feb 2025 04:14:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09F1D12F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 04:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF0B140960
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 04:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H530Mcxivkak for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 04:14:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A57CB40445
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A57CB40445
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A57CB40445
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 04:14:14 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-307c13298eeso4770521fa.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 20:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738728852; x=1739333652;
 h=user-agent:mime-version:date:organization:autocrypt:references
 :in-reply-to:cc:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tjyaoe5NHwNCNc2yKU91m9KmG6UfC6nIjmmL1JdpmDI=;
 b=w5jq8fXWT0AilpP+Lhtat+O5dacyhJqItA7ZZwjeoHsKhZzjzD+pw6g7WmoDBEbmkK
 TIjBEF7gKtv2DcU/BHZScO/2iP7mFnAv95gVrhR+c5yBpuhROsxze93JaLn/lw7V47nK
 h7d4npH5HP3pTQgsbDsguRZ5KAXhStFfewWsLb1cEcct6Ux7pb+vZUHULs8GVAXFWbLo
 5cBZgnmNclu9aKaDMC4u4FG433Hi5/erseDaov+JutRjRjolYx69xDzCIUsQi57jhph6
 9JX4Sbc7UAZ7e2qZhWW49S5EQIn/GfebmD2r4A6LPiuTzURsi8uDxZJ1IspMu12Llmhb
 +MkQ==
X-Gm-Message-State: AOJu0Yztmp6BJgWal96JRhuXOILH1/CNTZ+am20U8gLhenZDcaXJ0C55
 NU+7wyutf0MhAH+EcJeidFv5yqWiCHoF0nBCcoBjYXcZgTqrCebvFSYlkA==
X-Gm-Gg: ASbGnctv21j70EXbFpPvPxYGp1V1MhOkuctsdR5flbxcW9nZw5JYkiT0gBMOjmy8NjB
 HrWzzAxW/MOwc/PgzstBhIEeymo1xaVDgROJX7ve1DNrAEnPt+tyci20wk0n72uTDmXIH9SA3+Q
 /ytFv0eLxtihCizUeFbpwGzauVrtY+zs7CPZUAwA3TpYDO49fXKPYm8CgHRElfdUcNbhQMjSSJd
 5CsqWFstKiX1vNC+D56ckwL6IBBq9dNnsW62Y/xDFnMrdqLagXuue9y7z+7wJtlUEpNdw==
X-Google-Smtp-Source: AGHT+IFGpG19xp76CdiCidzIp4mBLsJ6wfhyU6BKq7amsyKtclhCNqFd32zZGKU4qFoSBFb4cgSdsQ==
X-Received: by 2002:a2e:a913:0:b0:2ff:b8f5:5a17 with SMTP id
 38308e7fff4ca-307cf4b27a5mr4170951fa.5.1738728851766; 
 Tue, 04 Feb 2025 20:14:11 -0800 (PST)
Received: from gimli.lan ([2001:9b0:214:3500::522])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a3418e87sm19513361fa.90.2025.02.04.20.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 20:14:09 -0800 (PST)
Message-ID: <f07db2bf9668c00e911ffbc161551d875ffdb96f.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>, 
 thomas.petazzoni@bootlin.com
In-Reply-To: <dq3i7hbdwatnngs4zix4pe3bwnv64fjca4i3krbjr3yccy3b4v@wjik7jr5er7z>
References: <20250106203459.2875914-1-troglobit@gmail.com>
 <dq3i7hbdwatnngs4zix4pe3bwnv64fjca4i3krbjr3yccy3b4v@wjik7jr5er7z>
Autocrypt: addr=troglobit@gmail.com; prefer-encrypt=mutual;
 keydata=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
Organization: wires.se
Date: Wed, 05 Feb 2025 05:14:08 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738728852; x=1739333652; darn=buildroot.org;
 h=user-agent:mime-version:date:organization:autocrypt:references
 :in-reply-to:cc:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tjyaoe5NHwNCNc2yKU91m9KmG6UfC6nIjmmL1JdpmDI=;
 b=m9FIFgs85O8VH4q2IumEuTXBibmVNXaTU9PQf1nlBijtd2+sEHnEfiuvxSJQfMe/O+
 hlof+bynX593fouB65aJO8QNJbv7Bjqs+hcre6qS/0FYtWB9xHVggaIJ7vpQfpXMwbNp
 pfm9E0xF4J1J3uiMDPZlaMfG0flCAN+IdwPLsxqDkmEaERB5Vfm6K76cwP5G/QA0Kb5m
 wBx6N7T388rDDS1bKOdFHTQuyckkZhzOVJLXMv6ysVHJvQ1I6V2Eb+CoeZh/RvonJ288
 8NENPKHAwRWF/yS2Cwk4QymmHCL0oBKzyDlJt9AgCOgCbxkvgVTrxDZWG5l2Qw/WwtCb
 1T4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m9FIFgs8
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
Content-Type: multipart/mixed; boundary="===============8009607471676321337=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8009607471676321337==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ujWjFm9gaB/9CKn1LlRr"


--=-ujWjFm9gaB/9CKn1LlRr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent!

On Wed, 2025-02-05 at 02:28 +0100, Vincent Jardin wrote:

> Why would you enforce a frrvty user to any other value ? Can you
> explain the rational of not using the Buildroot's default value ?

Currently, non-root users of a Buildroot system, that you want to give
administrator privileges to manage the system, i.e., edit system files
and configure Frr daemons using vtysh, need to be member of two groups:
wheel and frrvty.

I propose opening up that so it is up to the Buildroot user (developer)
how they model their end system.

> Even if FRR has such capability, it does not mean we should expose it.

This Frr build-time setting controls the group which an administrator
user in a system must be member of to be able to access vtysh over its
UNIX socket, it cannot be set set or changed in another way after build.

A variant of the same patch that would work for my own use-case, and in
some way align with Buildroot defaults, would be to change what we hard-
code it to:

   --enable-vty-group=3Dwheel

I did not think such a patch would fly at all, in particular since it is
not backwards compatible.  Which is why I went with this approach where
the developer can at least decide the group of users should be able to
manage Frr now that it has shifted to everything-via-vtysh from per-
daemon .conf files as their default.

> Your suggestion starts adding some complexities. Based on the same
> model, if we
> follow it, we should do the same for:
> =C2=A0	--enable-user=3Dfrr
> =C2=A0	--enable-group=3Dfrr
> too. That's why I would be strongly interested in reading your
> rationals for such capability.

I see, well that was not my intention at all to imply.  The latter is
for privilege separation of the daemons themselves, I don't see any
value to a user of Buildroot to be able to change that for any package.


All the best
 /Joachim
=20

--=-ujWjFm9gaB/9CKn1LlRr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEShHhOTSGNO9JnOys7Kgmo3tsdAkFAmei5YsACgkQ7Kgmo3ts
dAmM4xAAgnTF7DI0qnYPOVdVS+t3x6TGBr9idDuEE/GE3WACr6/tlqTd2epSmcMn
Y/IWafHO1KvovvSYnVQ0V9juJT7+ac0r3wSN3Kh1Ebd0Q4UsAJ6vL9eM1UClkEk3
rgI6VR3xM5LuBdKJ38jlUT6WiO6uxG68+oFbkGFiNpRb4PAnBg1dQGlPdLI1q5xQ
HixPUETelQRYxtlwIYde8VegLpsVtb89e8qQ11AS10xc9MgcpRoRPso7wgFXsmrF
sFxgcIUijRcYpmqL8PgRvFx7rF6XEZZ4LIX3xXN14odCvKuZwqaFEtIp6ActOEPX
6cGmB7gsjWP1jKUjkh4T1bBtbyouj7670L6AKzuZfy6r1tQRKuv9025uVH5W3qwM
tUeP6ClQRUCoEkqGT9Xf7F9Avo3DhNfFmMLf8vaPEsJ9B2AsuX84LuptrdclQYNE
uGT0kVSX9mikSQo5T5wBkZpX/scIfAHJOt18wSYE4vD8U05qOhLA1uhx9M/O+n6t
/7eCOY8fzLipHL41TtUNA4G5VnfSCfdURedkW1Gd+7hxLbrhZW/tyiu1tK1TSR6Z
DDLS7Vx/nrfRidJ9Wp/z58mMBWtWSrPkCliOxp3KraLedbKROuZa2hO8VZGU1FSG
dSEFEeElp0/MUEADfCXQmstOnI/CEd/8BkDhV+mVZxFWDWcRzwk=
=JugB
-----END PGP SIGNATURE-----

--=-ujWjFm9gaB/9CKn1LlRr--

--===============8009607471676321337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8009607471676321337==--
