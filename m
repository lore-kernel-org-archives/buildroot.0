Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145EFE7C4E7
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 17:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 899AB420F2;
	Wed,  4 Oct 2023 17:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 899AB420F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wN02fBaxi6vc; Wed,  4 Oct 2023 17:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F57A4222B;
	Wed,  4 Oct 2023 17:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F57A4222B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7BB1BF38D
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 17:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36011404A8
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 17:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36011404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGGY_xnndtoz for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 17:38:16 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0782040012
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 17:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0782040012
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9adb9fa7200so31091566b.0
 for <buildroot@buildroot.org>; Wed, 04 Oct 2023 10:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696441094; x=1697045894;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bg7etsCJNT0Xp0VIPnD96JWnMU2GFp58/BBliZ6SlCI=;
 b=UCUGjGurQxRHeZBVosD06zvdD8lRufLB6Kk+m/k/e+4SAQkjL9S8yy9OnRQ72qhuGT
 rZ07F513Z4JIVVavNwsyMq6uNXi03KOdIM16zhv0CNiFsVAAHT9cNFBsnT2HZve8k3av
 hrwo3Nr7d6Jk5P+N/1LbSHnqMxHFoRarH2PyezLeilphByhuLaDPC3RFDTVRFGij9E/B
 /mI+1+crYMCIF5Gw2TbGukTS0Sjl5coFOXcOeS9kK7p9DuD52R2As9krthy6yHoalxZg
 LvdbUgxewwy3WIfbmz0YY5qmYPTxi319wUi8E3DCPUUA6lTTjpJ//S4pt1sf3vYplhrF
 Lg3w==
X-Gm-Message-State: AOJu0YxwQCJL1NNdZdZTvoh9QkomYSqYOaAzyljavYtxfGNKYUGXcW6H
 RORs1J7ePfd57pFBo9O4TFXU3U8ZUlVdjRItKFV+Cw==
X-Google-Smtp-Source: AGHT+IHXWfwKRMXJrm+QHkwm5PYY2zVUI9iMOfdAUICZBs/Cr8VLgJ7o5GRjLiT76IowjMfGD6LWTg==
X-Received: by 2002:a17:907:c0d:b0:9ae:5a56:be32 with SMTP id
 ga13-20020a1709070c0d00b009ae5a56be32mr286145ejc.38.1696441093770; 
 Wed, 04 Oct 2023 10:38:13 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 pj7-20020a170906d78700b00977eec7b7e8sm3180413ejb.68.2023.10.04.10.38.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 10:38:13 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-9b2cee40de8so26361366b.1
 for <buildroot@buildroot.org>; Wed, 04 Oct 2023 10:38:12 -0700 (PDT)
X-Received: by 2002:a17:906:c414:b0:9b8:9217:73f5 with SMTP id
 u20-20020a170906c41400b009b8921773f5mr314744ejz.32.1696441092584; Wed, 04 Oct
 2023 10:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <4642abb656bb8e63ff759d6f2ab6eafeb2e3d39d.1696436249.git.stefan@agner.ch>
In-Reply-To: <4642abb656bb8e63ff759d6f2ab6eafeb2e3d39d.1696436249.git.stefan@agner.ch>
Date: Wed, 4 Oct 2023 10:38:01 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oAsEoD0znjap3nqh5wXvg21b4YFjLnCustovxHKfA=vA@mail.gmail.com>
Message-ID: <CA+h8R2oAsEoD0znjap3nqh5wXvg21b4YFjLnCustovxHKfA=vA@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1696441094; x=1697045894; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bg7etsCJNT0Xp0VIPnD96JWnMU2GFp58/BBliZ6SlCI=;
 b=XS8gGdO9rTEu2y34ZIDN2eOBl2J53EeKfW9+cawQnZYghZK10X2UmXE05o74QAyg3X
 3sLkBrewbA3qiqg+UD+NnlMM1E+J12H4EUMTmdtw/nfuR5qOs1AwvtBiPY6OlxvOSpcC
 d11IMdVbUKyhaVIO5ayIY6wS5N4avVvtKH+a2Wdrh8x1MRXswl1KhdwDolhlTynBnG2r
 RYKw/V3a9acXi1RAH6SSHx9cKCcDa7UL532K10QApsc+OfB0eR1mfy3S2xM2ZZp0ingB
 +SAnYgyH0gZWyiU2tAse1/hnEnzBr3MHfog8wwh7gSw4/w4TqmCtzIm1Sy8NsvTWtvYm
 VXAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=XS8gGdO9
Subject: Re: [Buildroot] [PATCH] package/containerd: add control for
 additional build tags
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU3RlZmFuLAoKCk9uIFdlZCwgT2N0IDQsIDIwMjMgYXQgOToxOOKAr0FNIFN0ZWZhbiBBZ25l
ciA8c3RlZmFuQGFnbmVyLmNoPiB3cm90ZToKPgo+IERpc2FibGUgdGhlIEFVRlMgc25hcHNob3R0
ZXIgYnkgZGVmYXVsdC4gQVVGUyBzdXBwb3J0IGhhcyBiZWVuIGRlcHJlY2F0ZWQKPiBzaW5jZSB2
MS41IGFuZCB3b24ndCBiZSBhdmFpbGFibGUgd2l0aCBjb250YWluZXJkIHYyLjAuCj4KPiBBZGQg
Y29uZmlndXJhdGlvbiBvcHRpb24gZm9yIHRoZSBaRlMgc25hcHNob3R0ZXIgYW5kIGFkZCB0aGUg
cHJvcGVyCj4gcnVudGltZSBkZXBlbmRlbmNpZXMuCj4KPiBBZGQgY29uZmlndXJhdGlvbiBvcHRp
b24gZm9yIEt1YmVybmV0ZXMgQ1JJIHN1cHBvcnQuIE5vdGUgdGhhdCBDUkkKPiBzdXBwb3J0IHJl
cXVpcmVzIGEgd3JpdGVhYmxlIC9ldGMgb3IgYW4gYXBwcm9wcmlhdGUgY29udGFpbmVyZAo+IGNv
bmZpZ3VyYXRpb24uCgpPdmVyYWxsIHRoaXMgbG9va3MgZ29vZCwgYnV0IGNvdWxkIHlvdSBwb3Nz
aWJseSBzcGxpdCB0aGlzIGludG8Kc2VwYXJhdGUgY29tbWl0cz8gSSB0aGluayBpdCBtYWtlcyBz
ZW5zZSB0byBoYXZlIHRocmVlOgoKIC0gcGFja2FnZS9kb2NrZXItZW5naW5lOiBkcm9wIGF1ZnMg
c25hcHNob3R0ZXIKIC0gcGFja2FnZS9kb2NrZXItZW5naW5lOiBhZGQgemZzIHNuYXBzaG90dGVy
CiAtIHBhY2thZ2UvZG9ja2VyLWVuZ2luZTogYWRkIG9wdGlvbiBmb3IgazhzIGNyaSBzdXBwb3J0
CgpUaGFua3MhCkNocmlzdGlhbiBTdGV3YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
