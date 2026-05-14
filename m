Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AE3CD37AC
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 19:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF38060FBD;
	Thu, 14 May 2026 19:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfZ9_llvTFed; Thu, 14 May 2026 19:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C42260FC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778786552;
	bh=IN4iR+3uPXfx1cXFa2XWA2gN6ILf07OJklITDVoW2lo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dTb+FhEkVgw/uVUyW/gE3jdEhFYwdqTk4ZvkViawU8ldPEJ0dqWi7scDdMkaVfG5c
	 EF13phTM2v1Z4i+z+8oYEqnRXrx/jQov2n92QjFXZsGzicSCRFd9/5x1gle62Gun3G
	 nEd9Kj/vmIfrLQ7/S0c0TLiije+6qBBgMOLOHbiMLfMz3EojpmhfIv0rFH+Ycr+g2y
	 GOiJQiBYFB5tTHWptDsX9rr6AUsV9gvgrSxiP8EStx6uCCgynG1FV4Dv9UTo09qv96
	 3vqfTzLUTCDSyz/AtTT70OmBdxY0ufNphidUua/dMuprZnHx1ydXXJCCzuExw+Ed/L
	 /oUk/DwwIDcxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C42260FC9;
	Thu, 14 May 2026 19:22:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DFA137D
 for <buildroot@buildroot.org>; Thu, 14 May 2026 19:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F1F460FBD
 for <buildroot@buildroot.org>; Thu, 14 May 2026 19:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unORX2_HYaB4 for <buildroot@buildroot.org>;
 Thu, 14 May 2026 19:22:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68C4C60FC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68C4C60FC7
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68C4C60FC7
 for <buildroot@buildroot.org>; Thu, 14 May 2026 19:22:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso74149375e9.3
 for <buildroot@buildroot.org>; Thu, 14 May 2026 12:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778786539; cv=none;
 d=google.com; s=arc-20240605;
 b=J2dUOvuNtQ38oCFIW89d9ko9DrDV8SN3MHPFt60kkyu5lF6TAsIxGApyoS7V/cNDuo
 J0/FwFso33Dw8Nw0GEq+25K9emPZUM5F/wYWArYGiTprSbWg865XccFEgfo0TU15htKP
 dnXwfMeSSfjY2cAzq5/gHovYXNQkkEup7gvy47GS0Iu1qhOSE0k7pjcsowYvYJbnXscS
 eXb2/BSgDlb2nvoib+vbh5jpBUw4ZexSZ3MjjI3Br31yfP9R4ZvRF0gLtJ9i9HfQEOzc
 s02j7FpTu0urgBFECMHPohv0+4GTCHD+S10zGBa/hpzvSIFsqg96xekU7Beevy+D3qRZ
 6zxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zviwffxDA7uIBLC4r7sHqidGnvBgLueU3hSw25EMj5s=;
 fh=d9QhtXMWw3CkccEaSPV65r3BMqzHa/EYAfkbtMNsYRA=;
 b=c5gnZsKmiWYWRzcBLsgjl9RLrJSS7wlrTihxl3OYQuIZJsAwLxAFyR9NWpckjrew+Q
 kfPLFjI2XSJBrCI8hQNjheRMs9rDGK76axQgeioQpAZxfqPduNlRpjGaDvkaAavYpJKp
 f4kd2+ROapBLKViH5kJVhD0PSlpW27eusHc9vorvAu4KVaQvtz0h8Eppv7t/eNeMW1bN
 RLB7oLmZf3sQJ1IdAyj0DXjBZYEbmdv4erN7ETNxs80jNNLWPeALS361KnrEOJOIpDBx
 FzRohCgoHtbroxD2s8Xex3LZxnZ5ILunW2s33dZHfFxAqAjkcvgZY6NwCxS4ZPaPsIN9
 w5VA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778786539; x=1779391339;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zviwffxDA7uIBLC4r7sHqidGnvBgLueU3hSw25EMj5s=;
 b=LR+SoPQ/eOjTqnXiyS8fjZYXCt890KtCCqS6ouF7bhwRFgNDGk4qDLZRQx1ZkHx10h
 kMO8onWC1EIrXiREo9NGyBvq2UNuVSc2Xu55cMAVgBKl0UnnwFX+cJNHLYy41Oz3ww4m
 A3bG6NTmUMRobnqoW3p4KVlyK9Uq3xEvI9HNSZZNY+Fq6Rysbt0a/zjJVJGYStt6VtRr
 c9LTZnR99sjOfNS2qpS9J1WUhgNrPZ59OiPkpHALBCG7LfYKed4j/yynx1JbpBMuDHGz
 Wyn3txjQAACx1oUsHurWJ2qMtAF+1/E421eCASseRt3Sf3sZVPsJ+TRJ+3NWqlE6gK7c
 b2HA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9pwqWS5ODjRpWZVZDAEwTzbt8oT+UZLE8zxhlm+QrwAo42wr9jCE5Az8Jbh/AYeXtrOD8zbAiCALg=@buildroot.org
X-Gm-Message-State: AOJu0YwofNw7w3Pk57ZIxCyI4v2gT09E0GrcAen3+TfPgZjP71N2pXoE
 W0hBYnD51c9Dl00N3XOusi7sWgw/Hcillg7sJzJeu0zZJkTyO9//lQsZQExjEcXcz1o6pmxHQfN
 htaEuPaQWmi/APq/HP/E3jbvNHVOLIaQ=
X-Gm-Gg: Acq92OFJqGNZMSERiN7U89J/wOBchKy2FhCy8QpERedV/rZWzfskpGaw0uz/vNuAI2Z
 +KLYgERYYDosR34BZWAbIE8pMeZ2g3ZPWn0q4DW4LglCmDH7aic/4cBusWyelk47RTM78i8bL6A
 pxvMyp8koHuA5Ev5oIU6ljSg6lM93Yb/zsL60TxrdlzPJggRcEufcuWYFdS+VVO9Md61YllXn/a
 WakIDRLimlQPD3a9g95bXnBzIklE4N6eNZgSeiVvWOu4io8BBaVTW37Swd+PAVTW6R/FXCJc9dH
 v2jXlrB2uvriYJQ=
X-Received: by 2002:a05:600c:c10e:b0:48a:65a5:750f with SMTP id
 5b1f17b1804b1-48fe63265ddmr7715275e9.21.1778786539346; Thu, 14 May 2026
 12:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260513-qemu-v11-0-0-v2-1-de2e8e3c5869@anodize.com>
 <0d4d323b-b155-46b4-9a2b-3618db3ae2a5@smile.fr>
 <CAMWSM7hMjP87oZsiTwnB5=scv3jnL8KoYzFqMxynfg=1znw8FA@mail.gmail.com>
 <ce3ec0f2-c97a-4734-baf0-385751556e17@smile.fr>
In-Reply-To: <ce3ec0f2-c97a-4734-baf0-385751556e17@smile.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 14 May 2026 12:21:40 -0700
X-Gm-Features: AVHnY4I9kBnf50wI9ab2kr5IG6W7L48veVRGIX9mPJM0fU47oX8PI-i96iNRTcw
Message-ID: <CAMWSM7i7OOBmuxbmby4-R-OQN+ReT+gdyKNZH5Fku8a_mYS2Pg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Joseph Kogut <joseph@anodize.com>, buildroot@buildroot.org, 
 Romain Naour <romain.naour@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778786539; x=1779391339; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zviwffxDA7uIBLC4r7sHqidGnvBgLueU3hSw25EMj5s=;
 b=tH92HCjSFYI+33LJ7Bmz3Jl+BaTVb6Px1WLEupjecWwde+Dk+2Q9JXJBurc71b0/p2
 hrLzH7kmP97mieWpX/gdCDh0myDkzQ27eropA0MA68ogaNUY0qcVPiPkzm8zw5lcgO8C
 W4l/Bn72rzWD8Ml40nYTSi86lDPBvdCw7QDLN529ESHiq2WC67u6lqdPa/EB8UDHseyN
 Xba0gxDczTsIMuKqelmZ4LLwKtcWjbzt8ZbBHf57V7D90OWtTGFrMQ6VplQ8jBhfe4/M
 DceLmLAW6cuyJhKqsuOymMB8PtLqGo3dkbe4C9KPk/ZB14OMl1CuIIi4TIhRd2Vc1M/X
 mrQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=tH92HCjS
Subject: Re: [Buildroot] [PATCH v2] package/qemu: bump to version 11.0.0
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

SGVsbG8gUm9tYWluLAoKT24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMTE6NDXigK9BTSBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4KPiBMZSAxNC8wNS8yMDI2IMOg
IDAwOjMzLCBKb3NlcGggS29ndXQgYSDDqWNyaXQgOgo+ID4gT24gV2VkLCBNYXkgMTMsIDIwMjYg
YXQgMjo0NOKAr1BNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToK
PiA+Cj4gPiBJIGhhdmVuJ3QgdGVzdGVkIHRoZSBxZW11IGRlZmNvbmZpZ3MsIGlzIHRoaXMgc29t
ZXRoaW5nIEkgc2hvdWxkIGRvCj4gPiBsb2NhbGx5PyBJcyB0aGVyZSBhbiBhdXRvbWF0aW9uIGZv
ciBpdCBvdXRzaWRlIG9mIEdpdExhYj8KPgo+IEFjdHVhbGx5LCBhbGwgaG9zdC1xZW11IGZhaWwg
dG8gYnVpbGQ6Cj4KPiBodHRwczovL2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL2pvYnMv
MTQzNzExMTEwOTgKPgo+IFRoZSBRZW11IGJ1aWxkIHN5c3RlbSB0cnkgdG8gZG93bmxvYWQgYW5k
IGluc3RhbGwgYSBweXRob24gbW9kdWxlIGJ5IGl0c2VsZiAoYW5kCj4gZmFpbGluZyB0byBkbyBz
bykKPgo+IEFkZGluZyAtLWRpc2FibGUtZG93bmxvYWQgdG8gUUVNVV9DT05GSUdVUkVfQ01EUyBh
bmQgSE9TVF9RRU1VX0NPTkZJR1VSRV9DTURTCj4gZml4IHRoaXMgaXNzdWUuIENhbiB5b3UgZG91
YmxlIGNoZWNrIGlmIHRoZXJlIGlzIGFueSBvdGhlciBuZXcgYnVpbGQgc3lzdGVtIGNoYW5nZT8K
PgoKR29vZCBjYXRjaCwgSSB0aG91Z2h0IHRoaXMgd2FzIGFuIGluY29tcGF0aWJpbGl0eSB3aXRo
CnB5dGhvbi1zZXR1cHRvb2xzLiBUaGlzIGNoYW5nZSBhcHBlYXJzIHRvIHN0ZW0gZnJvbSB0aGlz
IGNvbW1pdC4KCmh0dHBzOi8vZ2l0aHViLmNvbS9xZW11L3FlbXUvY29tbWl0LzRlNTViYjRiZTUz
YmM3YTVlM2ZlMTQyOWFmMTJkMmUzMDkwMDQ5YTUKCkl0IHNlZW1zIHdlIG1heSB3YW50IHRvIGFk
ZCBweXRob24tc2V0dXB0b29scyBhbmQgcHl0aG9uLXdoZWVsIGFzIGRlcGVuZGVuY2llcy4KCj4g
SSdtIHVzaW5nIG15IEdpdGxhYiBhY2NvdW50IHRvIHJ1biB0aGUgYnVpbGQgdXNpbmcgZnJlZSAo
c2hhcmVkKSBHaXRsYWIgcnVubmVyczoKPgo+IEFsbCBydW50aW1lIHRlc3QgcGFzc2VkOgo+IGh0
dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzI1MjU1ODk2OTgK
Pgo+IChSdW5uaW5nIGFsbCBkZWZjb25maWdzIGxvY2FsbHkgdGFrZXMgYSBsb3Qgb2YgdGltZSwg
aXQgZWFzaWVyIGFuZCBmYXN0ZXIgdG8gZG8KPiBpdCBvbiBHaXRsYWIpLgo+CgpCZXN0LApKb3Nl
cGgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
