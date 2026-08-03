Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86419C55184
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 12:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2777A4065E;
	Mon,  3 Aug 2026 12:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxQyMuuVd3yj; Mon,  3 Aug 2026 12:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBD8D40652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785761236;
	bh=CSun1b2M2BIiqErBrVBtxmcfSVgz7UXFJlWtqlq7S64=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eRDxQ9OGB1JWQEb5cbIfOOWMtAz8jb6zVqcFmw8BZJtPvhVRKFuJHhl4nuZNCt6bN
	 Ma+uYNimOFSOTB1MRieiWQ73UXl0W/MfLrXEYleEwqx5/IvBcEUUtslNGh7d8NfDNh
	 oO3ONZwqCqkjpdTCwyyJC+4bV5qNpTw6tYSUI2rs20IiPSbItxBqcNB/ov2pnxX2Ht
	 /NucQh3zk2x2eFKtNpLMoGUQ02uCnPLnwmgXaKc1XOrVI+1qGDCcM8UOCGPqXx0grH
	 pzrbXGrch1+VA9A57IZhvOBJIsJXg+WkqU77JUmHUgWmPMtIukBxHnRSJjj5e03m6M
	 /dC6H5/Mlq7Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBD8D40652;
	Mon,  3 Aug 2026 12:47:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE1D6218
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 12:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3D134015C
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 12:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mafh4-mZKTLz for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 12:47:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C0792400A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0792400A0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0792400A0
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 12:47:12 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-39f631dbce3so22300771fa.2
 for <buildroot@buildroot.org>; Mon, 03 Aug 2026 05:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785761230; cv=none;
 d=google.com; s=arc-20260327;
 b=O1eYhRbW7dXDqHZLfe5ZpA7ETAKHdhydlI17b6bey2yqVQB7tnPanB104onbtoV6tC
 7RV/kQ70DyDjgqgjLY89YE15WnnbJAxfJsSwTbqEOR5TdtkabQ96JsNkva1+DIpaodVj
 PYj/bI+9IRwpLzeSaAmfu58wz3JTQLLF1507VOikIq4SHO1mX8mMnsW8ZpEBfKQ6p2DE
 pCEU7Xl3ajsKhoQuyf6x2HDtzd+oSB4rcRpBiWvKUsQYuVLjeO3Of0Db9jqBQvsL5wCS
 f8COllPKQCztov2dnv3Mp9wLSzCcREWX8zAspl3iqJbC9Fw507+BlDfQfLxDy03l9TWD
 nqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QgY68xHKr10rXBqJ3TzK4Hnf+BYLtYu7rWwba7FaBQ4=;
 fh=X8TSX9MW4/Y8TnkTLFN1TouE2o1smZOxwoPUo2TcEiw=;
 b=qwa14vYetmiD0lWUL4iatgoRDPofkwT/GsO9688LgjSkKKDZhzgZfEKVPBboDttQ2N
 cIy/ZwQWjgCe+goTgrtbvlPbfJkrkI0K6oUDVvWwu1qvJ7W5CfOp6b8vPYA8aa28Wyqp
 zfvVJonoaAT+MLjvZ59EEbULDRpbkLGOnxeRMczSZSlKUvqO5Hr4l9af64ooztAHKc+a
 iU1nvrivwBKcKMjiyraP8UEQ+RZ+L0Z10DdwyuccGKdEMwaQCk+6i+BVI4UuhhLnDOQB
 M9S7jzJH4Osd5bfrMWQ0arc/EPiR2RFPAHtbGPbkO8J0SmO77ljoJ39xHEhX+DI97geS
 1qOQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785761230; x=1786366030;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QgY68xHKr10rXBqJ3TzK4Hnf+BYLtYu7rWwba7FaBQ4=;
 b=aO0lOPEXduKOBbUJ73ctMk7Ff2RTLoFKmx7ZyjzIQ10cVuQd8ONNN5BAbcQZljqRWJ
 OMFCxu2FXNTJ+66BXPoE4p96he85ozEvf2Tv2KrIzSg6qWed8w6To65B8GAj8NikF+Lg
 Awx2vXajC6XeNQ7dUaGzNNPWRjlmINGsBo/oNGmkJFwPVoxeAOdWCRuvESs87K7RmCNH
 uaBbSSGf97io9tofbkVsfhvmQbtGjPnkfFdZdmKAQLzMPIbtMS8nfEoSXfFCwroaUjZM
 7pjsDpFIGPmuIg839kDnwyCwKRoYjRPLpSvjdqqRg62jS5jYNaa0YOWPmm0UtN4es+XN
 Dk8A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpB0MLYag18xxGO4gPRiWZWsTERDHbFQ4yAEzlmvfeLg8FcaZ7N9VqFBjweibGg/YK834X++jzMP0M=@buildroot.org
X-Gm-Message-State: AOJu0YzC9Ama/15/+L+qBGLfbsaL37G5fX1AOc0wXu334TzronfWcTm/
 +DkNdFOK/2IMRlvM4Yh4GmaRfyZhUcWmnvOgORB5UP4Y6UfUDaTh66lytP4lwyV1XIahbfRbqlM
 Kcmu0+sr93EMYjc5R3D+idAx/cr51oxg=
X-Gm-Gg: AR+sD10vM9f2cQY2gN97wtRcATLaXh5g4Xe2H+F7ywW+i6On6WXuexVEtLTDtv/J5TF
 g450sdwbFixM6IYmAOhTCd8HN3CVKFFnquiujDJo/SLjygVJuwkuRuPUnLwtii/yCzUy1l0UyPe
 8MkWnE/t3b6Pi9jyEzqlsTF+cJ+jSGSqBn6a4ffgsmClUoGQJKxNgCXK9e0z9ndeFi2rqPSn9z3
 IqiuWD8bWDcfUKg7BGioPf8qaSoQuA2AH6Pm9RhGZHDynoaCzwFy0EGxl2PJHRJ2zHtDxTVQvUI
 SfY7u/pg0Wh6/oGB5l9QQHZ3XR25B/ztDxRV1LV5WIDi0ET+VnrAjMw=
X-Received: by 2002:a2e:9a16:0:b0:39b:ac8:4b41 with SMTP id
 38308e7fff4ca-39f864202afmr20885431fa.32.1785761230091; Mon, 03 Aug 2026
 05:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260611101734.1968785-1-neal.frager@amd.com>
 <b2810e66-cb1b-434f-8991-3bffe94a5d80@actia.se>
 <BL1PR12MB503266705EAD51DC752299B2F0182@BL1PR12MB5032.namprd12.prod.outlook.com>
 <BL1PR12MB5032FE2DD74892018E92A4DCF0D62@BL1PR12MB5032.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5032FE2DD74892018E92A4DCF0D62@BL1PR12MB5032.namprd12.prod.outlook.com>
From: Matthew Weber <matthew.l.weber@gmail.com>
Date: Mon, 3 Aug 2026 07:46:57 -0500
X-Gm-Features: AUfX_mxb9Kg8tpf6NmoYva4_5T4OIvRBq46hW8iKtqp33MToiznIB1_omGjgMPE
Message-ID: <CAFt09wOEYHUdtWHKvqcjLCrtyRhM0m=z9ZHx3h7uOo=eHuLvOg@mail.gmail.com>
To: "Frager, Neal" <neal.frager@amd.com>
Cc: John Ernberg <john.ernberg@actia.se>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>, 
 "matthew.l.weber3@boeing.com" <matthew.l.weber3@boeing.com>, 
 "alistair@alistair23.me" <alistair@alistair23.me>, "Stabellini,
 Stefano" <stefano.stabellini@amd.com>, 
 "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, 
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Saleab,
 Micheal" <Micheal.Saleab@amd.com>, 
 "yann.morin@orange.com" <yann.morin@orange.com>, 
 "brandon.maier@collins.com" <brandon.maier@collins.com>, 
 "brian.j.wood2@boeing.com" <brian.j.wood2@boeing.com>,
 "ju.o@free.fr" <ju.o@free.fr>, 
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, 
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>, 
 "romain.naour@gmail.com" <romain.naour@gmail.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785761230; x=1786366030; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QgY68xHKr10rXBqJ3TzK4Hnf+BYLtYu7rWwba7FaBQ4=;
 b=s/ALWc3sPlMRjXZW65Fb4ke39Zkb3AZVsc+4ou6hJSULnqHJVt1pssLJeGDbSgCf/B
 sQetu2E5j6R4WFvVaOvCCXpJjEvMPq0BhL2OzZUpT9iuhVyqG4ql3blwlp7DINt20Ta8
 68SC5spDYQtzryVx0c5oxEpCDpVGaB/KkV4ofO0i7pg6Sr+s3iKm2odVDABo0nK1fnn3
 HB96hREWC+hTgK0yn93DYWo/EsAb48MJOXW3p3O9rmc4dopVe5GpXOxJccdU9ajFQX3V
 C3zBdkV/7aTJh5KvWBkicOpGesLO9v6y8lasrNZfuN9fZWVA+47sMNHCqIcXCGJr7rMr
 kzRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=s/ALWc3s
Subject: Re: [Buildroot] [PATCH v1 1/3] package/xen: add custom version
 support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TmVhbAoKT24gU3VuLCBBdWcgMiwgMjAyNiBhdCAxMTozN+KAr0FNIEZyYWdlciwgTmVhbCB2aWEg
YnVpbGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KCltzbmlwXQoKPgo+
IEdpdmVuIHRoZXJlIGlzIG5vIGZ1bmN0aW9uYWwgY2hhbmdlIHRvIG15IHBhdGNoIHNlcmllcywg
d291bGQgeW91IGxpa2UgbWUgdG8KPiBrZWVwIHlvdXIgUmV2aWV3ZWQtYnkgYW5kIFRlc3RlZC1i
eSB0YWdzIGluIG15IHYyIHN1Ym1pc3Npb24gb3Igd291bGQgeW91IGxpa2UKPiB0byByZXZpZXcg
YW5kIHRlc3QgYWdhaW4gZmlyc3Q/CgpZb3UgY2FuIGtlZXAgdGhlbSwgYnV0IGxldCBtZSBrbm93
IGlmIGl0IGdvZXMgYmV5b25kIGEgcG9zaXRpb25pbmcgYXMgeW91IG5vdGVkIQoKTWF0dApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
