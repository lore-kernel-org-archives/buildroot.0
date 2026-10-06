Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD6ACA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 21:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F05F60B14;
	Tue,  6 Oct 2026 21:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qakyrfxhBfUF; Tue,  6 Oct 2026 21:49:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 80A8260883
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791323353;
	b=p0z9Ml57McIqLklmpNBsGNFM8Rp/6SAB3KqhOygYlzEyx7sTLga/1kQaWY7heuJFGUJB
	 yNCbskDV0kPG9MRQLZjhJnjkbEF1WBWTMtceD13fEfmCi6Q1msqCzyyDnWYwgf6cuFynK
	 +TufmwvFquBtc525asV9OJ+ixszossbRGpT/Fjho3N8FVB1UffgUkQHpXZzYdNgaP3VHB
	 sWrhvzQQvnbEiTYVu2E3Z34/tF+n6PNREINAaocYDpo+da7MeKW+NeTwqaadolJ0O1O7a
	 AQCVUI3MGPEItBeEkzOB5G14lIxuJ8JqkcctL2bnyxzPNJucLgcE6LqOA8EAMvRFz8g==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791323353;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:MIME-Version:References:In-Reply-To:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=uc3ePhhF2IFI/ffLjP20Ec7y5Sj6LlF2//voBBz76Ec=;
	b=Vej0Ua38XxM+mGqeqheEi2jrPeHzVLqiBFrcRt0ZXxLflUImQHS211ZUnRuX2xibymPt
	 VFuj46dTbreV9+2/jl8Nu3nqoav602Tk4PBzOl+HFiAEk1D8UqePEToPah+1BFbGSu8Ry
	 rtfV5DZYkyxJtskkfN6BNYmExEciP5vbpPSka/aaWV9wlTCBh9UfZ+uVuwRy3kBle7hFf
	 dWqTO7Oo2aUvwNLKprWkURknxwSZe4zJMkTafIff0zvAocmFWagqSrjB2ojIGRQBMYp1W
	 cS/ksLwFBwAnciGxM+m6LTgK4AVdeqyIJBbTKJeNtj2PfdldOyGOZpgRtTFHHjbJkTQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791323353;
	bh=uc3ePhhF2IFI/ffLjP20Ec7y5Sj6LlF2//voBBz76Ec=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s4JKY7zQoHqmTJ0T4j1kmf1yGu7+SbtHQQSrFt4RmsGUxcI2WpPQzKNYdSzfAX7LE
	 XfnZCJLbRbz29oC0bsFTT3hdzidk3PlTZmdr39JrmB1vkTWNw6eEjZygUGwBdKXchD
	 TZFRdL4eNvC704d/9S+haPRzeqGIND1DwBSKkZPiI+qbBwLe+9wxR1zD0g23LHJJD4
	 YC84PoRrkrd+MblSIzbTDmjQMNM0OYmgXy/LvpWkLU63rlONqgjHMDcUHuu+fu7MhL
	 xq551ojha3u2WZjOEp6gMfKqeZP4Y6PyeqtQ//gJoMSm1O9qdEWPABJnwYEGw9se9n
	 mRbGcgGDHlQzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80A8260883;
	Tue,  6 Oct 2026 21:49:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DB9022B
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 21:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FB2B402D6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 21:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0KIF3zrgqa6 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 21:38:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 81F6440210
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791322724;
 b=R4CFUVhGn4duuJX2zzIrGaqM8E+Nqn+BNEvYRMnRTSeXGxnbU1v4VjGADKP18i8PtMVW
 LpdX9hxgntpGR9LJ8z2uBMGLYFRUYcWEm0lDBGfeeHzaSZh3qxE9uNzXBsAUZ/J10k0Rm
 2PyjDtQuHaTikHZ2vvDXckcCKuldlVjuSVYcAOXFcuhOfs4LlojAALOtxO30+txBjQ2rH
 LB8JKbj3KVzpLOJrJIcPEy0/3zobuYGxrkEgQzNR38b5zuE+s+O367HLc3dvkFFHJhf0f
 Y1+ObuD12SL1AY4+tvoc6p59VGz1hy1DwZF8gwOtlL7TQLj2N9IqHw2ZfA9cTPvHm5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791322724;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
 bh=pScaeCSQya6TpEqkx1aoklbY6FEUoLHoMaHgf6ITP/A=;
 b=BBpgaQ92h5YQKFyoQU+WR5dlDjfMUsKUL4L9JXmR2wLEl4clreQjB9qf3myM3Lru8Dqa
 rhRd6lHz4urr/7J0ezUZjDicBzpfnwCrcTwukGKFf/WR3uYfSwvTczTbcsFFu6p3IhrUM
 FecsxYbUBkDYRlxUnhsNtDdcUfEuuX3Yrsut7kT8JlJnDlCIMSWUdx4DGMR6e5Xj1fLp2
 STb305JzuJktluEYtipp3I4grnVz9hZe4exyinTPkKw8ziX3i0tibok9SgYbcdf/G1iFL
 18nra/B1uHEGLzUL/eDWPryzYqVitPZOQ90cGYLKwAs9UYG+miDNEs14zqz4DKb4hrQ==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=Fr2frPNn; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::533"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81F6440210
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 21:38:43 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6a0794669a6so1659018a12.2
 for <buildroot@buildroot.org>; Tue, 06 Oct 2026 14:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791322721; cv=none;
 d=google.com; s=arc-20260327;
 b=BcR+XazlRs3W6r39EL2QSFXUz/bGgSu1O2BSJsZOphqRhzSTrL7GLFKe4smOWNcRc1
 SiwAOE8gOx4eU3vHurHaOOuR1uNv2cO4VVZnX1K/n/OrAxHdn4EsYOc+3EdOhip1nvy8
 79yfgc51rck68H7t7FYrAaF6HiIu9NX7K6NR/z9SQ551s5to6kj/6lmU4dQXKWNKkQE8
 WpvyD7FUUaQVFQy66nxYVdLOFvfZD/XwS9X2P3+yogxeY+m5DJaJ650LV6e6fr3iZTea
 dpYtDjvTMKBD+Sr7p70LuiRf0uUYiK01dSR/X75GE/O1fDI9nF6jbfWvDe9qqp5GC2rg
 55PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pScaeCSQya6TpEqkx1aoklbY6FEUoLHoMaHgf6ITP/A=;
 fh=Lk6tdRNHYXjfpMO6OBxlrUjDsWBdWcxytUIwxsTLMBE=;
 b=K9WkW83+aozlRQV3w33IySbAaHTFVsBAismiqYFn7qXaXO4VPN2kXrPfXFKW8PPMts
 rZyFWZTRYPv2yAW/LPiYuL7pKGcieLLgx2Ap0LzPMgkNvuaBzoNHcqluAmy//Pgdh4If
 A7G4qaY3ILw0CxNtgIstIAfIhAdyaarrHGkanLwo5PJNBKBIajY3uUTTCsy+HAUoqAIH
 qJGyYFwXwhVIA+GwOOpTmwaNfjW84l4A0YMqkD4/kYYSBZPMjB59+Mz3GR3CsGgqvb0L
 xl5w1pkI5GGydxs8GOkDXG/ltvHiy7G19kKnvMo4cLFnCor70LvRx2kbuSzoaot0Xq6L
 FhNQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791322721; x=1791927521;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pScaeCSQya6TpEqkx1aoklbY6FEUoLHoMaHgf6ITP/A=;
 b=YKRE5GQRunGC58uDQEKhKdH0zfVRyQfSidFM+dqTRiJSkhgZyxAb4lrSsdLk79HsH+
 uwCGOJAa4GH/zlQ827C+cv5i0HKRKgYzLfSlM+WiL8pASakmWmj6X1zJ+5gvAVGqbPyl
 HcCjWeHxjT6YJn0X6ZzwvddxGL1ykM6DjZL8/KiAwFNRNuSmAOt1ys61m+W07tL2MDh6
 pRchuo+y2G65sYs1PPpcQQy3FOjsSA9+q7sdkLtMghp788Aroz0/wvZ+KanLen8MqfYS
 zlKUmJJPglD6617TbsvBS0XddJqUz2d3weganwri7YiHSrrieLP/rxv1kqZ33gm0Zk+/
 dW5A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzHs4TmceCZv8VURbLrgOXkCMMaasijqERnqxqUP+khgcyrcCEABVljGsZh5uQvcDT1sX0l6jPdqPw=@buildroot.org
X-Gm-Message-State: AFq9FYJ5bRkji7yWZZ7WgtOZ7x6pyyaN3w/5TPkjROEbLaUp+KaIEke6
 mgoTufE+ogaWy+pIV7wp6QBdCWBUVowtD1QJjuk6mtqmg1fFx3tZLj6hGhDkek+hlx/ujETZf1O
 9NBIhG93vRMVDQ1HNjunm/KaqF3D2e3M=
X-Gm-Gg: AYBFou0wSGHmH8UPKkTNnrcl9DpS61gZsDLNwRTs/vX614NUXHuIirQx6Gsi6c8xYK2
 kIjlnKIPmPrErO+NzGProlMddnJxlMxOxLSsPdh2qH89V/WH0tXhZfjUahjzTvTnfB981IXo8yb
 p00GbqXiQfnL3MEBPeBn1sU1IfmMisAAbGfewW63sYvL0vtWSI3VykNA43W6Idrt9y4HzSXfP9n
 Snry0IhA3qDz0yS9AugDzmR4acIXAy8l+0GNGKerNYTaTuzukU6lNGrSlFDaqcb07FERIkjttG0
 8bDrq7Anuz5PgJBAzanKF9H1iqt0/cK6xR74vUtK73L4u8H2kXO3f3rM
X-Received: by 2002:a05:6402:518b:b0:6a5:f4cd:ae39 with SMTP id
 4fb4d7f45d1cf-6aff397b935mr248488a12.9.1791322721003; Tue, 06 Oct 2026
 14:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260907213335.3492307-1-julien.boibessot@armadeus.com>
 <asEuRjLlq-Q4OvT8@windsurf>
In-Reply-To: <asEuRjLlq-Q4OvT8@windsurf>
Date: Tue, 6 Oct 2026 23:39:07 +0200
X-Gm-Features: AclHuK-C5PpqD4pgchppxHxjjjsuhdQg64LF9n7rQVIZDfdZ4MEkPGxjI6nUfFU
Message-ID: <CAGm1_kt13+72AgYe9CqHsCLA9GUVQsY57r6+v9EG_76rDUDb6g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien BOIBESSOT <julien.boibessot@armadeus.com>, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodbus: bump version to 3.2.0
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjM04oCvUE0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVp
bGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAw
NywgMjAyNiBhdCAxMTozMzozNVBNICswMjAwLCBKdWxpZW4gQk9JQkVTU09UIHdyb3RlOgo+Cj4g
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtb2RidXMvMDAwMS1zcmMtbW9kYnVzLXJ0dS1pbmNs
dWRlLWFzbS1pb2N0bHMuaC1mb3ItdGVybWlvczItcy5wYXRjaCBiL3BhY2thZ2UvbGlibW9kYnVz
LzAwMDEtc3JjLW1vZGJ1cy1ydHUtaW5jbHVkZS1hc20taW9jdGxzLmgtZm9yLXRlcm1pb3MyLXMu
cGF0Y2gKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi4yMWI0
ZWNlYmJkCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdlL2xpYm1vZGJ1cy8wMDAx
LXNyYy1tb2RidXMtcnR1LWluY2x1ZGUtYXNtLWlvY3Rscy5oLWZvci10ZXJtaW9zMi1zLnBhdGNo
Cj4gPiBAQCAtMCwwICsxLDQwIEBACj4gPiArRnJvbSA1ZjZhZjllMGUzZDZhZGViYzEwM2ExZjVh
NDVhNWIwZDljNWE3ZTExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gK0Zyb206IEp1bGll
biBCT0lCRVNTT1QgPGp1bGllbi5ib2liZXNzb3RAYXJtYWRldXMuY29tPgo+ID4gK0RhdGU6IE1v
biwgMDcgU2VwIDIwMjYgMTg6NTQ6MDAgKzAyMDAKPiA+ICtTdWJqZWN0OiBbUEFUQ0hdIHNyYy9t
b2RidXMtcnR1OiBpbmNsdWRlIDxhc20vaW9jdGxzLmg+IGZvciB0ZXJtaW9zMiBzdXBwb3J0Cj4g
PiArCj4gPiArU2luY2UgdjMuMi4wLCBsaWJtb2RidXMgdXNlcyB0aGUgTGludXggdGVybWlvczIg
aW50ZXJmYWNlIChUQ0dFVFMyLAo+ID4gK1RDU0VUUzIpIHRvIHN1cHBvcnQgY3VzdG9tIGJhdWQg
cmF0ZXMuIFRoZSBjb25maWd1cmUgY2hlY2sgZGV0ZWN0cwo+ID4gKyJzdHJ1Y3QgdGVybWlvczIi
IHZpYSA8YXNtL3Rlcm1iaXRzLmg+LCBidXQgdGhlIFRDR0VUUzIvVENTRVRTMiBpb2N0bAo+ID4g
K2NvbnN0YW50cyBhcmUgZGVmaW5lZCBpbiA8YXNtL2lvY3Rscy5oPiwgd2hpY2ggaXMgbm90IGlu
Y2x1ZGVkIGJ5IG11c2wKPiA+ICtsaWJjIHRocm91Z2ggPHN5cy9pb2N0bC5oPi4KPiA+ICsKPiA+
ICtUaGlzIGJyZWFrcyB0aGUgYnVpbGQgb24gbXVzbC1iYXNlZCBzeXN0ZW1zOgo+ID4gKwo+ID4g
KyAgbW9kYnVzLXJ0dS5jOiBlcnJvcjogJ1RDR0VUUzInIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBp
biB0aGlzIGZ1bmN0aW9uKQo+ID4gKyAgbW9kYnVzLXJ0dS5jOiBlcnJvcjogJ1RDU0VUUzInIHVu
ZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ID4gKwo+ID4gK0luY2x1ZGUg
PGFzbS9pb2N0bHMuaD4gYWxvbmdzaWRlIDxzeXMvaW9jdGwuaD4gd2hlbiBIQVZFX1NUUlVDVF9U
RVJNSU9TMgo+ID4gK2lzIGRlZmluZWQgdG8gZXhwb3NlIHRoZSBUQyoyIGlvY3RsIGNvbnN0YW50
cyBvbiBhbGwgTGludXggbGliYy4KPiA+ICsKPiA+ICtVcHN0cmVhbTogbm90IHlldAo+Cj4gVGhh
bmtzIGEgbG90LCBidXQgd2UgbmVlZCBwYXRjaGVzIHRvIGJlIHN1Ym1pdHRlZCBiZWZvcmUgdGhl
eSBjYW4gYmUKPiBhY2NlcHRlZCBpbiBCdWlsZHJvb3QuCj4KPiBJJ20gbm90IDEwMCUgc3VyZSBp
bmNsdWRpbmcgPGFzbS9pb2N0bHMuaD4gaXMgdGhlIHJpZ2h0IHNvbHV0aW9uLCBidXQKPiBJIGhv
bmVzdGx5IGRvbid0IGtub3cuIFRoZXNlIFRDKiBpb2N0bCgpIGFyZSBhIGJpdCBvZiBhIG1lc3Mg
Oi8KClRvIGdldCBzb21lIGRhdGEgb24gdGhlIDxhc20vaW9jdGxzLmg+IHF1ZXN0aW9uLCBJIGJ1
aWx0IGxpYm1vZGJ1cyAzLjIuMAp3aXRoIHRoaXMgcGF0Y2ggdXNpbmcgdHdvIEJvb3RsaW4gbXVz
bCB0b29sY2hhaW5zIChzdGFibGUgMjAyNi4wOC0xKSBvbgphcmNoaXRlY3R1cmVzIHRoYXQgaGF2
ZSB0aGVpciBvd24gaW9jdGwgbnVtYmVycywgaW5zdGVhZCBvZiB0aGUKYXNtLWdlbmVyaWMgb25l
czoKCi0gbWlwczMyIG11c2w6IGNvbmZpZ3VyZSBmaW5kcyBzdHJ1Y3QgdGVybWlvczIsIGFuZCB0
aGUgYnVpbGQgcGFzc2VzCiAgd2l0aG91dCBhbnkgd2FybmluZ3MsIHNvIGluY2x1ZGluZyA8YXNt
L2lvY3Rscy5oPiB0b2dldGhlciB3aXRoCiAgbXVzbCdzIDxzeXMvaW9jdGwuaD4gZG9lc24ndCBj
YXVzZSBtYWNybyByZWRlZmluaXRpb24gd2FybmluZ3MuCiAgV2l0aG91dCB0aGUgcGF0Y2ggaXQg
ZmFpbHMgYXMgZGVzY3JpYmVkIGluIHRoZSBjb21taXQgbG9nOgoKICAgIG1vZGJ1cy1ydHUuYzo2
OTU6MjM6IGVycm9yOiAnVENHRVRTMicgdW5kZWNsYXJlZAogICAgbW9kYnVzLXJ0dS5jOjkxMToy
MzogZXJyb3I6ICdUQ1NFVFMyJyB1bmRlY2xhcmVkCgotIHBvd2VycGMtZTUwMG1jIG11c2w6IGNv
bmZpZ3VyZSBkb2Vzbid0IGZpbmQgc3RydWN0IHRlcm1pb3MyLCBzbyB0aGUKICBuZXcgaW5jbHVk
ZSBpcyBuZXZlciByZWFjaGVkIGFuZCBsaWJtb2RidXMgdXNlcyB0aGUgb2xkIHRlcm1pb3MKICBj
b2RlLiBUaGUgYnVpbGQgcGFzc2VzLgoKT24gZ2xpYmMgYW5kIHVDbGliYywgPHN5cy9pb2N0bC5o
PiBhbHJlYWR5IHB1bGxzIGluIDxhc20vaW9jdGxzLmg+LCBzbwp0aGUgZXh0cmEgaW5jbHVkZSBj
aGFuZ2VzIG5vdGhpbmcgdGhlcmUuCgpZZWdvcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
