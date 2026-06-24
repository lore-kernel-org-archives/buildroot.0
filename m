Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1CDCDB471
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 11:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1680181EE8;
	Wed, 24 Jun 2026 11:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yY2-OfvRRrVF; Wed, 24 Jun 2026 11:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D7FE81EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782302217;
	bh=gdAaJ4RL3sKYYj4AaRKWz8B4xusFMV3ZK92TQkMa4Bo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l/YA8u+UtGMgBrTIk2Du+9R6Js2dTvtT2dzvpSAMeTIF+HF3uQmE7e5C9NukSDyNV
	 NvVR+AdX8dq2T6VAuAXQnmH1w2kvuvdL2O+Rlx2rV1nbAAb4nDT3AIdOkwxGXjrQCy
	 a+gtylqHaG3vp0ZNYqXoxoTvkhTqYozCmIwt573wFwfOGb9DNlZnvM8TjQBzCmj6gV
	 lgfFFDkKGK7eAnT+0EXzpH5MUOOQNBI2WV+xRKm9LqqhkgpXcog8A6HV5eezX5ZLfJ
	 ENnaeSRgcnYiUOyUeg1evG00VPjKWaCA3Sou4r1d5vIOVuumjLZq/CZFkvMa1kaN+e
	 l7IFgh1yuHZjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D7FE81EE9;
	Wed, 24 Jun 2026 11:56:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF6F5363
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 11:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5A9E404D2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 11:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PweZgR62cdc for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 11:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7CA0140080
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CA0140080
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CA0140080
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 11:56:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4922244f7c7so8665895e9.0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 04:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782302211; x=1782907011;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CkWKqX5rUrcKUQoiJK3145eAA4celuHnX1ZDITiSqYw=;
 b=QA0HhHaSY0pNuqtVHNF9GopsekO4wt3SOCFCfC/wceVMHVV3F0hcFa7Npz5lv7bwUc
 nmueDWLLFSG9cDV00tTgW2cswtfJVlr86lea3uGw/7fVIMLfkGsRVBYowR8CT62SXIC+
 RjJTvFzaUfHbpMOoEuenLtFPrZjlby2JncrnZ0uoUihVCIn9UsYjYQizYgn/mjCmBIVN
 vcqMMjAlkf5LVq0prIX/kMcUV5PsDa7VaJRXPfd8z73Nxth7ApvOZLRUzCbRx5vzdnT2
 LSi5VDBTzfD9wtldleO14P6QSRjUzDygjfVhU0a9fynY3ooTDlph7oSYpkDj1crFV8Uy
 AlVg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8tfpUwNciRITpuYu6EYjXMOD55TM5Z17esbmLPsyZyQVDWEc0sTVaomDKw67KOkzSe3ZNVmwv4Z/M=@buildroot.org
X-Gm-Message-State: AOJu0YxNMH/mKiwa91OUHL1GDG7qrMRm7l1+O3JM2Y9DI30LwbGceGZD
 wKYCiNKlG6LUcA1p3Q6Ws1nmXvl7mPIEetnX2ndCI/tGHA1oxwDJIz02lfZJjDp1P+U=
X-Gm-Gg: AfdE7cl8oz3YhAW3Z0jiiYc1ASwMVby13wuEebNjAS+YfGYmFLTj5m+X+inbYOTuOB6
 BDi+yH8uwVVTMZv8HKq4Fb2+kpG8VYhhZi7H3VJ0wAGaV2VgL/dftX9rhz+P9l1za/j0/FsqQp4
 +Y2KBJPPuDDsdeesIWbvlzLfN629hYfsxaHHWrFPTH4OiAe1q/H5yWSMqK/OkMY0kfAsHCnQ0+X
 Tvxj7ZhQA7Rf2ljwAR8js9e2Oa7U9O3MMnTnpGXOByeF8BT3/krzYyVZJHKZOP6Ctw6Xc3jmVZJ
 cs7CmRsLYzuYqcDtFQV4vrPD4bSe6zBmp7VxMLNGBS5izV0QUluMavSTHDnuyqh7+vt6P7RzDWC
 u2zzDOeVrHVt3Z3I/YouUPAtzRz6b07y0Z9ZFUoujn4a95/Vhu9dZSmwg2+5GyJjpeiXuwt5Pq9
 iHGuXtEK5FojaEcg4ruJEkZ8o/oh9K8KE1XAAOX0aNm+AeZAy6mf/AzMsqi8saaOfCDz0fMYM3f
 8Hg
X-Received: by 2002:a05:600c:c48e:b0:492:437a:a653 with SMTP id
 5b1f17b1804b1-49260879449mr40540035e9.26.1782302211264; 
 Wed, 24 Jun 2026 04:56:51 -0700 (PDT)
Received: from [10.5.90.78]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49249455302sm371268555e9.15.2026.06.24.04.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 04:56:50 -0700 (PDT)
Message-ID: <6f1af640-525e-420a-ae9b-00c64d25865d@smile.fr>
Date: Wed, 24 Jun 2026 13:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: ju.o@free.fr, dowan.gullient@smile.fr
References: <20260621164634.2423931-1-romain.naour@smile.fr>
 <11f625c4-97dd-434b-9ea4-ec82c48031bc@gmx.de>
Content-Language: en-US
In-Reply-To: <11f625c4-97dd-434b-9ea4-ec82c48031bc@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782302211; x=1782907011; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CkWKqX5rUrcKUQoiJK3145eAA4celuHnX1ZDITiSqYw=;
 b=ibyDEEzR33A7kAQo8/brPOH22v+ag3slmGdAWV58DG1ZvYptV2B8ihDW/vIBHDvUhY
 eUkvCl57pNhCv7Aa5/uaKTQyJjH7495A03dNZzEKeW1nBxMoFzoGoQw4GY2cafQWD+V7
 s+Wz4tyyZ0LKl1Ee20iJlCLwxolYy5QZzC4tA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ibyDEEzR
Subject: Re: [Buildroot] [PATCH 1/3] package/iptables: improve kernel
 support for iptables-legacy and iptables-nft
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmlvbmEsIEFsbCwKCkxlIDIzLzA2LzIwMjYgw6AgMDE6MzAsIEZpb25hIEtsdXRlIGEg
w6ljcml0wqA6Cj4gSGkgUm9tYWluIQo+IAo+IEFtIDIxLjA2LjI2IHVtIDE4OjQ2IHNjaHJpZWIg
Um9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3Q6Cj4+IFNpbmNlIGtlcm5lbHMgNi4xNywgc3VwcG9y
dCBmb3IgbmV0ZmlsdGVyIGxlZ2FjeSB0YWJsZXMgd2VyZSBkaXNhYmxlZAo+PiBieSBkZWZhdWx0
IFsxXSBidXQgaXB0YWJsZXMgcGFja2FnZSBuZWVkcyBOZXRmaWx0ZXIgbGVnYWN5IHRhYmxlcwo+
PiBzdXBwb3J0IGVuYWJsZWQgaW4gdGhlIGtlcm5lbCB3aGVuIG5mdGFibGVzIGNvbXBhdCBpcyBu
b3QgZW5hYmxlZC4KPj4KPj4gTWFrZSBzdXJlIHRvIGVuYWJsZSBDT05GSUdfSVBfTkZfSVBUQUJM
RVNfTEVHQUNZIGFuZAo+PiBDT05GSUdfTkVURklMVEVSX1hUQUJMRVNfTEVHQUNZIGZvciBrZXJu
ZWxzID49IDYuMTcuCj4+Cj4+IEZpeGVzOgo+Pgo+PiDCoMKgIFtCUlRFU1QjIGlwdGFibGVzIC0t
Zmx1c2gKPj4gwqDCoCBtb2Rwcm9iZTogbW9kdWxlIGlwX3RhYmxlcyBub3QgZm91bmQgaW4gbW9k
dWxlcy5kZXAKPj4gwqDCoCBpcHRhYmxlcyB2MS44LjExIChsZWdhY3kpOiBjYW4ndCBpbml0aWFs
aXplIGlwdGFibGVzIHRhYmxlIGBmaWx0ZXInOiBUYWJsZQo+PiBkb2VzIG5vdCBleGlzdCAoZG8g
eW91IG5lZWQgdG8gaW5zbW9kPykKPj4gwqDCoCBQZXJoYXBzIGlwdGFibGVzIG9yIHlvdXIga2Vy
bmVsIG5lZWRzIHRvIGJlIHVwZ3JhZGVkLgo+Pgo+PiBPbiB0aGUgb3RoZXIgaGFuZCwgd2hlbiBu
ZnRhYmxlcyBjb21wYXQgKGlwdGFibGVzLW5mdCkgaXMgdXNlZCBieQo+PiBkZWZhdWx0IChCUjJf
UEFDS0FHRV9JUFRBQkxFU19ORlRBQkxFU19ERUZBVUxUPXkpIHdlIGhhdmUgdG8gZW5hYmxlCj4+
IG5mdCBwcm90b2NvbCBzdXBwb3J0IGluIHRoZSBrZXJuZWwuCj4+Cj4+IMKgwqAgaXB0YWJsZXMg
LS12ZXJzaW9uCj4+IMKgwqAgaXB0YWJsZXM6IEZhaWxlZCB0byBpbml0aWFsaXplIG5mdDogUHJv
dG9jb2wgbm90IHN1cHBvcnRlZAo+Pgo+PiBFbmFibGUgQ09ORklHX05GX1RBQkxFUyBhbmQgQ09O
RklHX05GX1RBQkxFU19JTkVUIGFzIGZvcgo+PiBORlRBQkxFU19MSU5VWF9DT05GSUdfRklYVVBT
IGFuZCBjb21wbGV0ZSB0aGUgbGlzdCB3aXRoCj4+IENPTkZJR19ORlRfU09DS0VUIG5lZWRlZCB0
byBwYXNzIHRoZSBUZXN0SXB0YWJsZXMgd2l0aAo+PiBuZnRhYmxlcyBjb21wYXQgKGlwdGFibGVz
LW5mdCkgZW5hYmxlZC4KPj4KPj4gV2l0aG91dCBDT05GSUdfTkZUX1NPQ0tFVDoKPj4KPj4gwqDC
oCBpcHRhYmxlcyAtLXBvbGljeSBJTlBVVCBBQ0NFUFQKPj4gwqDCoCBpcHRhYmxlcyB2MS44LjEx
IChuZl90YWJsZXMpOsKgIFRBQkxFX0FERCBmYWlsZWQgKE9wZXJhdGlvbiBub3Qgc3VwcG9ydGVk
KToKPj4gdGFibGUgZmlsdGVyCj4+Cj4+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/Cj4+IGlkPTlmY2U2
NjU4M2YwNmMyMTJlOTVlNGI3NmRkNjFkODQzMmZmYTU2YjYKPj4KPj4gU2lnbmVkLW9mZi1ieTog
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4+IC0tLQo+PiDCoCBwYWNrYWdl
L2lwdGFibGVzL2lwdGFibGVzLm1rIHwgMTUgKysrKysrKysrKysrKysrCj4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2lwdGFi
bGVzL2lwdGFibGVzLm1rIGIvcGFja2FnZS9pcHRhYmxlcy9pcHRhYmxlcy5tawo+PiBpbmRleCBh
OWQ5MTJmNmNjLi40YWNlMTZkMGVjIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2lwdGFibGVzL2lw
dGFibGVzLm1rCj4+ICsrKyBiL3BhY2thZ2UvaXB0YWJsZXMvaXB0YWJsZXMubWsKPj4gQEAgLTQ5
LDExICs0OSwyNiBAQCBlbHNlCj4+IMKgIElQVEFCTEVTX0NPTkZfT1BUUyArPSAtLWRpc2FibGUt
YnBmLWNvbXBpbGVyIC0tZGlzYWJsZS1uZnN5bnByb3h5Cj4+IMKgIGVuZGlmCj4+IMKgICtpZmVx
ICgkKEJSMl9QQUNLQUdFX0lQVEFCTEVTX05GVEFCTEVTKSx5KQo+PiArZGVmaW5lIElQVEFCTEVT
X0xJTlVYX0NPTkZJR19GSVhVUFNfSVBUQUJMRVNfTkZUX09SX0xFR0FDWQo+PiArwqDCoMKgICQo
Y2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX05GX1RBQkxFUykKPj4gK8KgwqDCoCAkKGNh
bGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19ORl9UQUJMRVNfSU5FVCkKPj4gK8KgwqDCoCAk
KGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19ORlRfU09DS0VUKQo+PiArZW5kZWYKPj4g
K2Vsc2UKPj4gK2RlZmluZSBJUFRBQkxFU19MSU5VWF9DT05GSUdfRklYVVBTX0lQVEFCTEVTX05G
VF9PUl9MRUdBQ1kKPj4gK8KgwqDCoCAjIFtmb3IgTGludXgga2VybmVsIHZlcnNpb25zIDYuMTcg
YW5kIGxhdGVyXQo+PiArwqDCoMKgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0lQ
X05GX0lQVEFCTEVTX0xFR0FDWSkKPj4gK8KgwqDCoCAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BU
LENPTkZJR19ORVRGSUxURVJfWFRBQkxFU19MRUdBQ1kpCj4+ICtlbmRlZgo+PiArZW5kaWYKPiAK
PiBPbiBzeXN0ZW1zIHdoZXJlIGlwdGFibGVzLWxlZ2FjeSBpcyB0aGUgZGVmYXVsdCwgd2UgcHJv
YmFibHkgd2FudCB0byBlbmFibGUgdGhlCj4ga2VybmVsIG9wdGlvbnMgaXQgbmVlZHMgZXZlbiBp
ZiBpcHRhYmxlcy1uZnQgaXMgYWxzbyBidWlsdC4gTWF5YmUgcmVwbGFjZSB0aGUKPiBlbHNlIGJs
b2NrIHdpdGggYSBzZXBhcmF0ZQo+IAo+IGlmbmVxICgkKEJSMl9QQUNLQUdFX0lQVEFCTEVTX05G
VEFCTEVTX0RFRkFVTFQpLHkpCj4gCj4gYmxvY2ssIGFuZCBzcGxpdCB0aGUgZGVmaW5lIGludG8g
SVBUQUJMRVNfTElOVVhfQ09ORklHX0ZJWFVQU19JUFRBQkxFU19ORlQgYW5kCj4gSVBUQUJMRVNf
TElOVVhfQ09ORklHX0ZJWFVQU19JUFRBQkxFU19MRUdBQ1kgc28gb25lIG9yIGJvdGggY2FuIGJl
IGRlZmluZWQ/CgpJbmRlZWQsIHRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uCgpJZiBwb3NzaWJs
ZSwgd2UgcHJlZmVyIHRoZSAicG9zaXRpdmUiIGxvZ2ljOgoKICBpZmVxICgkKEJSMl9QQUNLQUdF
X0lQVEFCTEVTX05GVEFCTEVTX0RFRkFVTFQpLCkKCkknbGwgc2VuZCBhIHYyLgoKQmVzdCByZWdh
cmRzLApSb21haW4KCj4gCj4gQmVzdCByZWdhcmRzLAo+IEZpb25hCj4gCj4+ICsKPj4gwqAgZGVm
aW5lIElQVEFCTEVTX0xJTlVYX0NPTkZJR19GSVhVUFMKPj4gwqDCoMKgwqDCoCAkKGNhbGwgS0NP
TkZJR19FTkFCTEVfT1BULENPTkZJR19JUF9ORl9JUFRBQkxFUykKPj4gwqDCoMKgwqDCoCAkKGNh
bGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19JUF9ORl9GSUxURVIpCj4+IMKgwqDCoMKgwqAg
JChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfTkVURklMVEVSKQo+PiDCoMKgwqDCoMKg
ICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX05FVEZJTFRFUl9YVEFCTEVTKQo+PiAr
wqDCoMKgICQoSVBUQUJMRVNfTElOVVhfQ09ORklHX0ZJWFVQU19JUFRBQkxFU19ORlRfT1JfTEVH
QUNZKQo+PiDCoCBlbmRlZgo+PiDCoCDCoCBkZWZpbmUgSVBUQUJMRVNfSU5TVEFMTF9JTklUX1NZ
U1YKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
