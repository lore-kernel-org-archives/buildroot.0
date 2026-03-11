Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7F1112587E
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 19:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1F048484E;
	Wed, 11 Mar 2026 19:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cc2afNYAPNNb; Wed, 11 Mar 2026 19:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6E1E8484B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773257481;
	bh=keXLvacr9cfDFu2CSjsWj3Ziur6tXEYd9hFGMxomk2Y=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XBi8f6DP1GZyrFHJAOVsf3wMovyqhaBHCa6TTljFIWIkdyYGJ7NmHojVgJiSjKKNZ
	 iYwKDnSwbSqCxRRkhHVNaJnlRBRQpY/SQsAaTO6YXxIccUgHTrZhPCmQ6wcY3QoKqc
	 V5jAXkok/LIKP0qcXlK0seDQzoNfl4ZbZMh8kuoMc8w/1oB3lsmuSFGx5TdHmuK41w
	 YHLLGMDcvRGEFX1MxtQuzkO5VAuW+HgMMz/dsgf2gbSTyLkkJS91t8/Mf9qPqFcVjJ
	 Cni3DT4NRZyW8KXvJVNhZPgGevQ2wtuwTUHrmhb/2iLoanUJFTANXBfv/g1mX/pFHz
	 FARdjXrotXJFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6E1E8484B;
	Wed, 11 Mar 2026 19:31:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75B09228
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 19:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AE14617A5
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 19:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQFJz6U2eI85 for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 19:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 534A5617A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 534A5617A1
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 534A5617A1
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 19:31:19 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-67bb0267a2bso120544eaf.3
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 12:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773257478; cv=none;
 d=google.com; s=arc-20240605;
 b=TMnfson3rrsYIljTOLq63fXx9kCVzXoLFmrsqslWP4ffbYtADCm/dKlb07IisjpDcB
 Cc8gmokwt3hIbqas+e1VOrZcCGz+4gSGoQhAO4Uy4KXbEwercy0tKRdEavt4ycxc9jty
 zvcK32xc+820FcaEL6A2nIEOreMsyOO8d6JEn39raL+k/ucli5M0lXRMww8J5ubOnQRV
 BqEvjMqlXPcp1BorFhFUUbbEjrLQwV4YiOSqRtySrNfrJBBEupHjHcQLvcSGdwEwsfRC
 zEPKO1iJcDlH26d3ClsDfqZAepYrYbI76S0UoZMhheanj0N73iulrZB8CjKukJRVPn9p
 PGBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=g6ycn62THpyC8FjqD1ZTtZqvU9YCepVLaMsSG95WNvY=;
 fh=9aE4kYJHUXB0Q/RgUjMJoD3+eLM006Q+KG3uSBCcSC8=;
 b=jKqQDkjhVoUAtiZ78B2o2iziMXwVaH3oMxjw//yQE1lUNl7T+5g8uYzzJpMNAUS4qx
 TugEX4cOqbsIihMSRMoBfFZnuJ8zqpvS6HWs84eggFuR3AOXzWe8BVs7YgxQXgBPkqww
 HUI7vw06JyYem+kbCx31GUxOg0dL0H77Z1MLl+/huqQa6+MMjqm9repAWn5Cor1kZT5y
 YTNgT4AwQqH9KOiW2/YPYYqtj22yH6Yh6gEfK9ychwCcfxHtd6zh9v+3EXdQ2Ot3zedc
 zvgpPplqfZBw6hN0wFGY2HAmjec3UypyHF/zl73kyOeFpXxWJ3fomJqRmXArtZx40YoG
 Je6A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773257478; x=1773862278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g6ycn62THpyC8FjqD1ZTtZqvU9YCepVLaMsSG95WNvY=;
 b=lSeKmTzgvZfGH75R6qYnDNIpRdZ7zHSDIC0dT+tP/q1k30UIasIQ1/p8KIVsdtSmhD
 yy3ruIS8MIZ6pUHGvhLgX7UJC447iBO4RfxphOm+y+I7Zim03JuY/oL84odu0V5KlR+V
 TXBAM53A1PqiX6DL6lrgEGe6tusG1or26llLj3YGEtIzMGeBSnSP2MwnjRicN463c6tG
 5E4/siKmi+fG1+sIdXnzZfFVUZMNlGouUHdZHX8AZ/4HPk3BqRDrf4cnjhtB5Z4pIfQy
 M+WHOg56hWy+l//G8SdEXGeBPmwjYvA0X2s6MlweypsO9M7yWPGzVKAue1QKRlw5Vgx4
 fnIQ==
X-Gm-Message-State: AOJu0YwJQ0QJpFS805GsnZZMCdl6nqjrvVSnd0V11jIq6Nn30NNPoSYw
 +FJHXQNzIlUmW9RBFlH7x50fiZdBlOGnAhsuKkaIwsfLJz60YEK6vlUac2HrFJLwzgKTmA8YQVZ
 Kv4fE+4c1aVR69K8N6Kco3Dt3y7zG9oc=
X-Gm-Gg: ATEYQzwKigKyiVwl4svtM4hYYQVlXT3bkEK/ZxdFqpFZqFZgSO+PZxr9buK+xhfiOZX
 1AGFND7vjlfPvQEwnFtsNOO9/+KIwDciNW48jA4hhyXn0OWvPmDcCgOh5xQi1EQgKiz2dKmgRcX
 qSKwp6NVyivITosl6dUrS4GM7ZjmhWbcZNwtnsp6B0GpsLsq47xesmIgl22eRe3eCDL4k81ssQo
 N3kuiks4US7tNNSRUheu357QihSLrw6NKaBVbQ866u+k3zw+/vxXAwR0mZ2nmyqwDu78a6QFy6i
 6PQwgA==
X-Received: by 2002:a05:6820:a01:b0:67b:ade6:b880 with SMTP id
 006d021491bc7-67bc88782c6mr2430555eaf.12.1773257477999; Wed, 11 Mar 2026
 12:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260219-virglrenderer-v3-0-e2ff1a23be3f@gmail.com>
 <20260219-virglrenderer-v3-2-e2ff1a23be3f@gmail.com>
 <d67eee31-3ab8-4b2a-9fa6-b0fd849614e2@smile.fr>
In-Reply-To: <d67eee31-3ab8-4b2a-9fa6-b0fd849614e2@smile.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 11 Mar 2026 12:30:42 -0700
X-Gm-Features: AaiRm52d57QfdH8X8N8jXGTGlCWKl-MuwB_3Ra0l7T3M6yLvrJSIDz_E1RFjEEM
Message-ID: <CAMWSM7hb8sP3GewSd3jWR78BQX=5TomDpVLyXdnUnLjx6rCPHA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, Adam Ford <aford173@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773257478; x=1773862278; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g6ycn62THpyC8FjqD1ZTtZqvU9YCepVLaMsSG95WNvY=;
 b=BAtzCHq/d9WmEMx6ZcSaal69zR3ch7jh9WJ5tWyliWGdkISdQ7TXXUhTKAk8GjlCuC
 +CcDsd53IKi7Pej7S014dPnONXKT85lZtVGPSG//10vpFZgMk3x+AdY2mL4Tm3gT8QGG
 Y9jRcKHrgHXP+qcz37noYnJQn/6hb+Ugc5zSOi3GPl71+uK6Y8hrrGGq6e0rK1sgI1ha
 MrHzH4ONUMioGq//l5nDhJYMTPolqzQnKJgZJYKyferftIQQuOt5g/Wt5XVxC8nkb9c5
 5sD56E9JjgHWgNJetCqLFAgaVZ1EUoNqGhCoXijhZJHGBGRP0oRtm66uDxmAsFPt9MgJ
 ifCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BAtzCHq/
Subject: Re: [Buildroot] [PATCH v3 2/2] package/qemu: add virglrenderer
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

SGVsbG8gUm9tYWluLAoKT24gV2VkLCBNYXIgNCwgMjAyNiBhdCAyOjI54oCvUE0gUm9tYWluIE5h
b3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+Cj4gSGVsbG8gSm9zZXBoLCBBbGws
Cj4KPiBMZSAyMC8wMi8yMDI2IMOgIDAyOjIzLCBKb3NlcGggS29ndXQgYSDDqWNyaXQgOgo+ID4g
QWRkIG9wdGlvbmFsIHZpcmdscmVuZGVyZXIgc3VwcG9ydCwgYWxvbmcgd2l0aCBlbmFibGluZyBP
cGVuR0wgd2hlbgo+ID4gbmVjZXNzYXJ5Lgo+ID4KPiA+IGh0dHBzOi8vcWVtdS5yZWFkdGhlZG9j
cy5pby9lbi92MTAuMC4zL3N5c3RlbS9kZXZpY2VzL3ZpcnRpby1ncHUuaHRtbCN2aXJ0aW8tZ3B1
LXZpcmdscmVuZGVyZXIKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3NlcGggS29ndXQgPGpvc2Vw
aC5rb2d1dEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3FlbXUvQ29uZmlnLmluIHwg
MjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIHBhY2thZ2UvcWVtdS9xZW11Lm1r
ICAgfCAxNSArKysrKysrKysrKysrKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L0Nv
bmZpZy5pbiBiL3BhY2thZ2UvcWVtdS9Db25maWcuaW4KPiA+IGluZGV4IGUxNmVhZmU0NDYuLjI1
OTIxMzY4ZTkgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCj4gPiArKysg
Yi9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCj4gPiBAQCAtMTE2LDYgKzExNiwzNCBAQCBjb25maWcg
QlIyX1BBQ0tBR0VfUUVNVV9TREwKPiA+ICAgICAgICAgU2F5ICd5JyB0byBlbmFibGUgdGhlIFNE
TCBmcm9udGVuZCwgdGhhdCBpcywgYSBncmFwaGljYWwKPiA+ICAgICAgICAgd2luZG93IHByZXNl
bnRpbmcgdGhlIFZNJ3MgZGlzcGxheS4KPiA+Cj4gPiArY29tbWVudCAiT3BlbkdMIGFuZCB2aXJn
bHJlbmRlcmVyIG5lZWQgYW4gT3BlbkdMIGFuZC9vciBPcGVuR0wgRUdMIGJhY2tlbmQiCj4gPiAr
ICAgICBkZXBlbmRzIG9uICEoQlIyX1BBQ0tBR0VfSEFTX0xJQkVHTCB8fCBCUjJfUEFDS0FHRV9I
QVNfTElCR0wpCj4KPiBPbmUgY29tbWVudCBwZXIgb3B0aW9uLCBlc3BlY2lhbGx5IHNpbmNlIEJS
Ml9QQUNLQUdFX1ZJUkdMUkVOREVSRVIgYWN0dWFsbHkKPiBkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X0hBU19MSUJHTCBvbmx5IChzZWUgYmVsbG93KS4KPgo+ID4gKwo+ID4gK2NvbmZpZyBCUjJfUEFD
S0FHRV9RRU1VX09QRU5HTAo+ID4gKyAgICAgYm9vbCAiRW5hYmxlIE9wZW5HTCIKPiA+ICsgICAg
IGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX0xJQkVHTCB8fCBCUjJfUEFDS0FHRV9IQVNfTElC
R0wgIyBsaWJlcG94eQo+ID4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkVQT1hZCj4gPiAr
ICAgICBoZWxwCj4gPiArICAgICAgIFNheSAneScgdG8gZW5hYmxlIE9wZW5HTCBhY2NlbGVyYXRl
ZCBkaXNwbGF5IGZyb250ZW5kIHN1cHBvcnQuCj4gPiArICAgICAgIFRoaXMgaXMgbmVjZXNzYXJ5
IHRvIGVmZmljaWVudGx5IGRpc3BsYXkgZnJhbWVzIHJlbmRlcmVkIGluIGEKPiA+ICsgICAgICAg
Z3Vlc3Qgb24gdGhlIGhvc3QuCj4gPiArCj4gPiArICAgICAgIFJ1biBxZW11IHdpdGggYC1kaXNw
bGF5IHNkbCxnbD1vbmAKPgo+IFRoZSB0d28gbmV3IG9wdGlvbiBzaG91bGQgYmUgYWRkZWQgaW4g
dHdvIHNlcGFyYXRlIGNvbW1pdC4KPgoKR29vZCBzdWdnZXN0aW9uLCB0aGF0J3MgYSBjbGVhbmVy
IHN0cnVjdHVyZS4KCj4gPiArCj4gPiArY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfVklSR0xSRU5E
RVJFUgo+ID4gKyAgICAgYm9vbCAiRW5hYmxlIHZpcmdscmVuZGVyZXIiCj4gPiArICAgICBkZXBl
bmRzIG9uIEJSMl9QQUNLQUdFX0hBU19MSUJFR0wgfHwgQlIyX1BBQ0tBR0VfSEFTX0xJQkdMICMg
dmlyZ2xyZW5kZXJlcj4gKyAgIHNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VX09QRU5HTAo+ID4gKyAg
ICAgc2VsZWN0IEJSMl9QQUNLQUdFX1ZJUkdMUkVOREVSRVIKPgo+IElmIEJSMl9QQUNLQUdFX1FF
TVVfVklSR0xSRU5ERVJFUiBpcyBzZWxlY3RlZCB3aXRoIG9ubHkgQlIyX1BBQ0tBR0VfSEFTX0xJ
QkdMCj4gZW5hYmxlZCwgeW91IGNhbid0IHNlbGVjdCBCUjJfUEFDS0FHRV9WSVJHTFJFTkRFUkVS
IGhlcmUgc2luY2UgaXQgZGVwZW5kcyBvbgo+IGxpYmVnbCBvbmx5Lgo+Cj4gImxpYmVnbCBpcyBp
biB0aGUgZGVwZW5kZW5jeSBjaGFpbiBvZiB2aXJnbHJlbmRlcmVyIHRoYXQgaGFzIGFkZGVkIGl0
IHRvIGl0cwo+IF9ERVBFTkRFTkNJRVMgdmFyaWFibGUgd2l0aG91dCBzZWxlY3RpbmcgaXQgb3Ig
ZGVwZW5kaW5nIG9uIGl0IGZyb20gQ29uZmlnLmluLiIKPgoKVGhhbmtzIGZvciBwb2ludGluZyB0
aGlzIG91dCwgSSBtaXNzZWQgdGhhdC4gSSdsbCBmb2xsb3cgdXAgc2hvcnRseS4KClRoYW5rcyBm
b3IgdGhlIHJldmlldy4KCkJlc3QsCkpvc2VwaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
