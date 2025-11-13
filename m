Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2971CCD98F7
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 22:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6DE440CE0;
	Thu, 13 Nov 2025 22:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v2d6G1wEz2rO; Thu, 13 Nov 2025 22:37:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 044BC40C93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 044BC40C93;
	Thu, 13 Nov 2025 22:37:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0559230
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 22:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5BC783B5A
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 22:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEvXTNVbKY8d for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 22:37:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB6C983B54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB6C983B54
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB6C983B54
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 22:37:25 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-5dbcc814b80so568936137.3
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 14:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763073444; x=1763678244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b+iooFp7g/DAlqMvQnmCzvjGLm+n9+vsWgLxS2txYzA=;
 b=sQhENv0Fcf9MTeOkNN3MDvcfiQ1PWdf50iQBgDd7/lwRQBC/ocA8grpJsf5De+csX/
 o3FvhqQMVEwn+XepOW9hLm8oUGdmKa7MApP+lVrua0SzYl8Sq4GDtCW3IlOazl0kV8PY
 wS8WZilo0fCb5MHS898po1HipjJ4s82+SwwJy3Uk9B8hLmSmNBF7a1pRN6xbhlLAkEDa
 7CZYozS5kQxNIrjNj8AXqEVwtSoGH4C6sj5RN9cQrhnyxT45HIhpfkGf0Oyp5okormL9
 GSMBS8ExLGJ2F5YyRmk/tgYSo+XASGnejeMRFiUy4Niv5LU2Gg+B3rO8BIM/HQRFE8aS
 hhQw==
X-Gm-Message-State: AOJu0YxsT2RuKuj7cxOwnCClHchPTmiFqsTm1qg7UJ923npHQdPtYO9K
 gIERnnz4HltbBMmTbhT6MIYG1GJarHk/0az2q8Kfw1PWmvFEKlpfeXTg7MxA1Z9catAh48et3l6
 M0/7JlGkC0KnjQUQi5Bs8cJEF7XAA9uX3zv8O
X-Gm-Gg: ASbGncv2TJzuXf+o213Ze+pJ4WIQRnYQoP3d58O0e2XXO/W6YwudtYot79UvC9xm8TH
 acuk4n8HIOLXeCrTyFqEbHWxtg+iLHd+68N2RhCrS7+TAKvs1hZ7W6wqXL9f2raCBg7cSb7BipM
 mx2CSR/sFX8tgw9LWfOhTdx5F/b+58FSUp9B5FX3uWKaFjmgov3X0rB3GzTCiS5Buk2y9NG5gfK
 IWn+mhhHjFE5mPAG9sJge1xFDrpP2zAIYvQN21hZUJbZNpf1xEBjO63KKlgPbuqOlS7NgC3WTdA
 pZw1pgZuxrrHmtN1nT8=
X-Google-Smtp-Source: AGHT+IHfPKYryvWUoSBJBsL4LiPROPlbh29lEs+b2Xajm6AvZIXuzwPiDFLCPQh0KE9AXQWNV4Tyf8t+oa1AJn3WEJA=
X-Received: by 2002:a05:6102:390d:b0:5db:e0e6:1b47 with SMTP id
 ada2fe7eead31-5dfc55688c8mr573046137.19.1763073444398; Thu, 13 Nov 2025
 14:37:24 -0800 (PST)
MIME-Version: 1.0
References: <20251107012804.2080218-1-james.hilliard1@gmail.com>
 <877bvvrox3.fsf@dell.be.48ers.dk>
In-Reply-To: <877bvvrox3.fsf@dell.be.48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 13 Nov 2025 16:37:13 -0600
X-Gm-Features: AWmQ_bkETcoCi6qlwWQgE2jcS3lSHISAhLCn2VuPeylc_WoNe_f_a7nGNEIkpHk
Message-ID: <CADvTj4qa5P5+jbGv+vFuLAfqLb9sbBC+O-3axpzvZp-b_QHO9w@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763073444; x=1763678244; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b+iooFp7g/DAlqMvQnmCzvjGLm+n9+vsWgLxS2txYzA=;
 b=AecSOmQZgquo/neWEJUha5nMuyDA5ztvf5k0NYGfil+j3soKuojuBS2AwZChRNW3LR
 v8jRlAO0yGV+igRY0lya3eTFQFN9lhsnyqwDZVAoVcYP/rm8skO/dWgvE/JwtKRuX0Io
 Wg+/uBTXPZyocalBPX2sTCPk7TkgjFbs8yUBZLAK7XpmXOA0LJmvoGIVrYPF/AyTYLM5
 bBFVpGN4oZQSAZyL+u/Cyn2aDrME9d+/1bEFOEfmMKhMvsza0ppFdNoU88IBsV/sHEzH
 sEqKt2KVTRiJdtf5Ikq5H4sBJ2Nk6KE9fg6UfkJxSAlEgNUtTNqJG+jy2mQLoiNO0UAQ
 4Ikw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AecSOmQZ
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: add missing config
 fixups
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

T24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgMjoxMuKAr1BNIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJA
a29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4KPiA+Pj4+PiAiSmFtZXMiID09IEphbWVzIEhpbGxpYXJk
IDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cml0ZXM6Cj4KPiAgPiBUaGVyZSBhcmUgYSBu
dW1iZXIgb2Yga2VybmVsIGNvbmZpZyBmaXh1cHMgcmVxdWlyZWQgZm9yIHRhaWxzY2FsZSB0bwo+
ICA+IGZ1bmN0aW9uIHByb3Blcmx5LCB0aGVzZSBhcmUgY29tbW9ubHkgZW5hYmxlZCBieSBkZWZh
dWx0IGluIHZhcmlvdXMKPiAgPiBrZXJuZWwgY29uZmlncyBidXQgbGV0cyBtYWtlIHN1cmUgdGhl
eSBhcmUgYWxsIGVuYWJsZWQgaGVyZSBhcyB3ZWxsLgo+Cj4gID4gU2lnbmVkLW9mZi1ieTogSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4KPiBDb21taXR0ZWQsIHRo
YW5rcy4KPgo+IE91dCBvZiBpbnRlcmVzdCwgd2hlcmUgZGlkIHRoaXMgbGlzdCBvZiBjb25maWcg
b3B0aW9ucyBjb21lIGZyb20/IEkKPiBkaWRuJ3QgZmluZCBhbnl0aGluZyBpbiB0aGUgdGFpbHNj
YWxlIGRvY3VtZW50YXRpb24gZnJvbSBhIHF1aWNrIGxvb2suCgpZZWFoLCBpdCdzIG5vdCByZWFs
bHkgZG9jdW1lbnRlZCBwcm9wZXJseSBhdCBhbGwsIHNvIGl0IHdhcyBhIG1peCBvZiBsb29raW5n
CnRocm91Z2ggdGhlIHRhaWxzY2FsZSBzb3VyY2VzIGFuZCB0ZXN0aW5nIG9wdGlvbnMuCgo+Cj4g
LS0KPiBCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
