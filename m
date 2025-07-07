Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A6BC83F03
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 01:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A73F840A0A;
	Mon,  7 Jul 2025 01:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqp96Q0eO5pc; Mon,  7 Jul 2025 01:31:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2F66413D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2F66413D6;
	Mon,  7 Jul 2025 01:31:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79B9415F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 01:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60166613F8
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 01:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3EYqfSEVSsn for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 01:31:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=jdknight@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94535613F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94535613F6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94535613F6
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 01:31:01 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-60c01f70092so4081528a12.3
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 18:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751851859; x=1752456659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p8/hsHMKV0hus3ot06Vbh3jJ3kzHXcvDDV9HqIWHsRM=;
 b=iWEaNZKBEif3OgLAcyZ57NXk0w3L92MwTRPnuKAUlx+XBr9C1PghHfQlqrREM86V4n
 IIHFX7u6dj2XWKLhjkBaXUE3BfBLUfdhACjvYSELhOXzl2JC+PXBa4pCnec2rao/K6aS
 4AMIx1iyGrngL6C17h0BMlWc9+vrh+EmoJe62sPLdcsLytx3AwNGmIHaFHd2jgot5RPR
 mdu7JrfJN1lIVobBiJgut5HswbFt0YTDKGjHaJi+KoQ/gAf+0gHhZPZ9tIGDwWJKOk2P
 yJGPxM2S1wu/0yWSu4jBOZlJG1OL2Zt2qX0rFw30XfkBfc59PVBVRSwGGS/ZsXuz06ff
 jK9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfC4+FRBJkHO3Gzbilk/9Ze0+EP7iMcsBBHTS/VLbHZDMOmb/OBt1WbeZGvBnIexZgKRW7YkwbliU=@buildroot.org
X-Gm-Message-State: AOJu0YxE7OCHoFC64ypfzDik/sV3uGdC/70AnPThHux/PdlMyp64UAFQ
 5iuFP9tCxEf/z9UaPVL6V6xG4fVou0s738/8stA5YB14XIbgr6mZc+Qhw/sjrAar6nSqmHVL0MW
 BN4ZLhhvx3dl33D9PZZOGi2h2WuW7X/YaAFbL3gcYXtaJ2Q4gxWOos5cW8uab
X-Gm-Gg: ASbGncsKnE0QrprQoYxYClg/QnpYZRRj2A3wVJc1on4jPLQswrApeASlvcZISeTdQh8
 4C0aAgvPdxbO5aSK2Ddfz3f3HYn0LbTDwCrXizlWP5X5S5MuDXnLfSbP5qc31fGZpjndmuc55Nl
 Uy33kT+Au0x0N9vZkVj9JA2G5zxtpgz5o5o0nXETZsOw4=
X-Google-Smtp-Source: AGHT+IHIYtmRi1++ZqSMHrT27Hkdi2iJ1tfqI3CuLRk41NgVXexljIr6yBktdoZd2g7MY1AH9HZ9FGr+NaCHK3Zf/KQ=
X-Received: by 2002:a05:6402:1d4e:b0:60c:3f77:3f4a with SMTP id
 4fb4d7f45d1cf-60ff3819fbemr5742007a12.4.1751851858714; Sun, 06 Jul 2025
 18:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250630023826.1163-1-git@jdknight.me>
 <31743c58-5e15-4d2a-935c-6945fca4edd9@rnout.be>
In-Reply-To: <31743c58-5e15-4d2a-935c-6945fca4edd9@rnout.be>
From: James Knight <git@jdknight.me>
Date: Sun, 6 Jul 2025 21:30:46 -0400
X-Gm-Features: Ac12FXyMpI_gsYilPSyXx1NA7gigm6n_A6MvDfozgEVoRxunEreKyr7I-S7cblI
Message-ID: <CALAjcgUnqK2Keehu3tAx=cdwAki6pzrqx0AEJFb5f7Xr-Au5hQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: James Knight <git@jdknight.me>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1751851859; x=1752456659;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8/hsHMKV0hus3ot06Vbh3jJ3kzHXcvDDV9HqIWHsRM=;
 b=Pu2agSmc2GYi4sZNDSPTf3QJXSAMJyY80LXSL9iSQCXAD7weKfo8XKs+E5j31RC2fm
 SdMsqedpDe9puXKRh6H/61eh0Nru5039F4MTZHNeYyXGO2U+fbeVYUH/Xpcft985n8EQ
 jsGBe/GfN8UkErkBLV1teXUAHcc2nP/RSrBLJeakv+nUaiDnqBhxg2y3+PUKUeA7VKqa
 mAX8opx/pxmkRWLEmML9glfR20kR4va+zbv39KRSWP/FvAKYIzROQH9nIUsqek3ZQUOs
 9E0Tj4+++i0WjDwbbJprEjTepK7K37DrwTgdT5aNcat9MDxpMVqvGsx+8257paEuF+4S
 DjFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Pu2agSmc
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: ignore configs/ prefix on
 configuration events
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

QXJub3V0LAoKT24gVHVlLCBKdWwgMSwgMjAyNSBhdCAzOjAy4oCvQU0gQXJub3V0IFZhbmRlY2Fw
cGVsbGUgPGFybm91dEBybm91dC5iZT4gd3JvdGU6Cj4gV2UgZG9uJ3QgdXNlIHRoaXMga2luZCBv
ZiBzdWJzdGl0dXRpb24sIGluc3RlYWQgdXNlIHBhdHN1YnN0LgoKSWYgdXNpbmcgcGF0aHN1YnN0
IGlzIHByZWZlcnJlZCAoZS5nLiAiJCh3aWxkY2FyZCAkKGQpL2NvbmZpZ3MvJChjYWxsCnBhdGhz
dWJzdCxjb25maWdzLywsJEApKSIpLCBvciB1c2luZyB0aGUgb3RoZXIgc3VnZ2VzdGVkIHZhcmlh
bnQ6Cgo+ICAgICAgICAgJCh3aWxkY2FyZCAkKGQpL2NvbmZpZ3MvJEAgJChkKS8kQCkKCkxldCBt
ZSBrbm93IGFuZCBJIGNhbiBzZXQgdXAgYSBwYXRjaCBmb3IgaXQgKGlmIGRlc2lyZWQpLgoKPiAu
Li4gSSB3YW50IHRvIHRoaW5rIGEgbGl0dGxlIG1vcmUgYWJvdXQgdGhlIGltcGxpY2F0aW9ucyBp
biBjb3JuZXIgY2FzZXMuLi4KCkFuZCBubyB3b3JyaWVzIGlmIHN1Y2ggYSBtb2RpZmljYXRpb24g
aXMgbm90IGRlc2lyZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
