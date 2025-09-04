Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1053CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 05:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ED6F616FD;
	Thu,  4 Sep 2025 05:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEyhHmN8x8RH; Thu,  4 Sep 2025 05:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E2BB61B6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E2BB61B6F;
	Thu,  4 Sep 2025 05:00:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A42930
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 05:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD33684C78
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 05:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uI8li-wsf-Jp for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 05:00:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FB4984C7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FB4984C7E
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FB4984C7E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 05:00:36 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-71d71bcab6fso6352547b3.0
 for <buildroot@buildroot.org>; Wed, 03 Sep 2025 22:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756962035; x=1757566835;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6PdeG8myCWe0mGjMnRNPx9xrfgc0N6Vf70u0h8JO8BA=;
 b=VqX9/Wd5PElMh2OfLy5vkl6z5KaJ2Q2UWnjmh8esQ4C0CC9+TvYxf2/GeraZxC/wU3
 FqnQ/T69l8mNYThm7BC+3uw20sdFSoLvjDNccVWSGmWlPtsWdTxMNhrk4jwR6cbnY80o
 l6HrElpFFvRSsVtU9eIOmvnUMhOK7D9DnnrskD4qfWdkr0kc35WluvJN9l/pB4J6eYYI
 zUTjcixxRVZjyjh87S34g/9zDxMGh0VQpkNiG1MH04Ur5OAKzNkp0j0SioYTSl978ajo
 pNc6wbjK3UrFLqM0TfVYE3dHI1wBILAOpPBSWtzAE52XBTGeF8U2FDdUFpPHo+P74Hv/
 ZJ4g==
X-Gm-Message-State: AOJu0YwSkzQL9/Opi25dklOzQzQEBOOVlLXRNYHk0Q5GVtuzJi+YxsM2
 hMzBP2Mpj8hyYT/c2CuVM99DJvp6s5VtO2StbtsMtIjI3npO7WHZzKnp9MvR8Q3cXTQd8pLF5si
 pQUhLL856qdwMCO9gVxr4Ipp2pJPB5NW0mQ==
X-Gm-Gg: ASbGncvAlzBdJ0EMqsLTCtGXGrrvd/WdvFOdCgivjWjlftO1kTwQ5Vpe62Ms0dRfCkP
 bvU+8KLLkG6i+3dUaYA+Gm5d4TZo71CmfTUWZw+7ndSNuS1NvfQDzdI67olRe1FQpxBnSJ1yPYq
 JRr0t+HqWmg+QD55K5ywqrzunJNKS3wQTgB2C+PYdvUnpiak8JWSZrbs90xZ2wVrdHiL6u+a8Fu
 aUt5eIBmdCXtOSAUQ==
X-Google-Smtp-Source: AGHT+IG4wzgddGQFysx78C9HaAjFrIO6mvAqXbkuSBWVmynllieupowepa0nOyzT2rUcM7CYdjqnzV48Dya3agKdUVQ=
X-Received: by 2002:a05:690c:2702:b0:71f:f8a0:4d4 with SMTP id
 00721157ae682-722763ba241mr193793747b3.13.1756962034999; Wed, 03 Sep 2025
 22:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250831123953.391803-1-clg@kaod.org>
 <20250831123953.391803-4-clg@kaod.org>
 <CACPK8Xc8VDPhYstx_snAOWLM721rS5nW48_g_iNg1EU6BMg=5Q@mail.gmail.com>
 <bb8c5947-1219-4bde-99e8-c2205aa05aa1@kaod.org>
In-Reply-To: <bb8c5947-1219-4bde-99e8-c2205aa05aa1@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Sep 2025 14:30:23 +0930
X-Gm-Features: Ac12FXyOpK6bbH9e_jolqSRRt9h2IaPdvyL2wsMzJH4UDuEgiFdV3stGbttLn_A
Message-ID: <CACPK8XfMkuZHfgqBowtvu3dG1voY4T35Z1PU5z+4c+Z0bZZZTg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1756962035; x=1757566835; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6PdeG8myCWe0mGjMnRNPx9xrfgc0N6Vf70u0h8JO8BA=;
 b=Z5q74qYw7ZrSu3essdHsM53gpJklp1Qa1UpXQo4hArGmUxlwqJgHXAUixS0ayC22Ch
 A/KgQosn4bGiYWx1gt//Z1NrySPKfeIWhrUnmG4rzApZguTtQjaegxQx1OwKWz4wMM4O
 /qT8OWyXrbXBcEvILPAQB18NeufgVDvLbgzB4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jms.id.au
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Z5q74qYw
Subject: Re: [Buildroot] [PATCH 3/4] configs/aspeed_ast2600evb_defconfig:
 bump U-Boot to commit 66672e5af36f
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

T24gV2VkLCAzIFNlcHQgMjAyNSBhdCAxNDozNCwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4gd3JvdGU6Cj4KPiBPbiA5LzMvMjUgMDE6MDMsIEpvZWwgU3RhbmxleSB3cm90ZToKPiA+
IE9uIFN1biwgMzEgQXVnIDIwMjUgYXQgMjI6MTEsIEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2Fv
ZC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gVXNlIGEgbmV3ZXIgY29tbWl0IElEICgyMDIzLTA3LTI0
KS4gV2hpbGUgbm90IHRoZSBsYXRlc3QsIHRoaXMgY29tbWl0Cj4gPj4gbWFya3MgYSBzaWduaWZp
Y2FudCBtaWxlc3RvbmUgaW4gdGhlIG9uZ29pbmcgZGV2ZWxvcG1lbnQgYW5kIHN1cHBvcnQKPiA+
PiBvZiBBU1QyNjAwIFNvQyBib2FyZHMuCj4gPgo+ID4gV2h5IG5vdCB0aGUgbGF0ZXN0Pwo+Cj4g
VGhlIGNoYW5nZXMgYWZ0ZXIgNjY2NzJlNWFmMzZmZTI5NGRmNTZmOGU3OTQyMDY5ZTM5MDlmMzc5
MCBhcmUKPiBub3QgcmVsYXRlZCB0byB0aGUgRVZCIEFGQUlDVCBhbmQgSSBoYXZlIG5vdCB0ZXN0
ZWQgdGhlbSwgRldJVyA6KQoKT2hoIEkgbWlzc2VkIHRoYXQgdGhpcyBpc24ndCB0aGUgdXBzdHJl
YW0gcWVtdS4gQm9vLgoKRmFpciBlbm91Z2ggdGhlbi4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
