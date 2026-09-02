Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499C2C624D0
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 11:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A710B607B0;
	Wed,  2 Sep 2026 11:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IasEYqfl7f5Z; Wed,  2 Sep 2026 11:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788348986;
	bh=Vp3WyMJxqucqUUXGg/Ayp99ikt7LMK9sRcggBmTFNE8=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FmXLXS0Llva5//k32+Zc5wMdnXuFoJM+50l+GSB3RMJskkfx3i+tjT6pFuH6xB6nr
	 XuJS7CPdFTfbm3ibv/rAaF+7s00liKL7rnSsFzLgjx/WKg5BDc61ubQy1OTK8BUlkh
	 fHGlLbvSaycTJsz0UIJoDRtm4Vs0Oc8ubsHNePTgfn5A/5MU252h6AoOyGG9/x35lH
	 DMNuAHzNFq8YFT87Xwm9v0KEOe+AaHm1j7iILYSEMzcBunGvGxBgGs0zMmX6f/+fVu
	 ZxSsnnjMygR7q0OlWY5577rOy/LCncuX2tiN2whIBcP+kp6zGUt/gmbpEf96xm7at5
	 Xb8AwIFFjck+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C4A6072A;
	Wed,  2 Sep 2026 11:36:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 075E21DE
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 11:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 046526076B
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 11:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQ4v1imaBokW for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 11:36:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=155.212.184.193;
 helo=mail.rulkc.org; envelope-from=viper@landau.one; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=landau.one
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=landau.one header.i=@landau.one header.a=rsa-sha256
 header.s=dkim header.b=HW/KRplI
Received: from mail.rulkc.org (mail.rulkc.org [155.212.184.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 812D760726
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 11:36:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BD4711024A2
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 14:36:14 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landau.one; s=dkim;
 t=1788348977; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=/Hx4lhO9mx37Zy/tl0pwOcyW0IgZpMJ+1zhDlS7VKmU=;
 b=HW/KRplIXshf5FNnIYIRLM0qCVRfrmHYwSXwfPSKN/vcgUNgbLp0DHA3laaZJJPUj7MzgY
 Xx0yxjjQlSGa1e9qme6AWFjRwpeD65Yq1D32v8ANGXWlcksfpk/FumprbsR7nq3EFw12/m
 hd/BYoam31ImHSUDHkyfnmDWMaLcZm5/7D9YUjSwyj0n59qBuEtLm3RUkLPMuWtV0rcXfs
 HpFSF7qdagOK/ORtcxV5FJquqG4yU6a4RfyyylD+Jh/rnhURJSNCStbw35cFI2+nv9iUBd
 w3vMNZPZd8MDe0fHt+rZk0iI58gIt1SEf9kL4a/kkt4jpP2dz5uDdZWtVSjClA==
Message-ID: <77c20e65-4837-4b44-9aeb-7fce7c3e5ee2@landau.one>
Date: Wed, 2 Sep 2026 14:35:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20260801222945.1612760-1-viper@landau.one>
 <946cece6-2a40-409b-86e1-44102d4a6138@landau.one>
Content-Language: en-US
From: Konstantin Menyaev <viper@landau.one>
In-Reply-To: <946cece6-2a40-409b-86e1-44102d4a6138@landau.one>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/mtd: build with -fPIC when
 shared libraries are enabled
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOC85LzI2IDExOjI2LCBLb25zdGFudGluIE1lbnlhZXYgd3JvdGU6Cj4gT24gOC8yLzI2IDAx
OjI5LCB2aXBlckBsYW5kYXUub25lIHdyb3RlOgo+PiBGcm9tOiBLb25zdGFudGluIE1lbnlhZXYg
PHZpcGVyQGxhbmRhdS5vbmU+Cj4+Cj4+IEhpc3RvcmljYWxseSwgbXRkLXV0aWxzIG9ubHkgcHJv
dmlkZWQgc3RhdGljIGxpYnJhcmllcywgc28gdGhleSBhcmUKPj4gYnVpbHQgd2l0aG91dCAtZlBJ
Qy4KPj4KPj4gVGhpcyBiZWNvbWVzIGFuIGlzc3VlIGZvciBjb25maWdzIHdpdGggc2hhcmVkIGxp
YnJhcmllcywKPj4gd2hlcmUgYXBwcyBtYXkgbmVlZCB0byBsaW5rIGxpYm10ZC5hIG9yIGxpYnVi
aS5hCj4+IGludG8gc2hhcmVkIG9iamVjdHMsIHJlc3VsdGluZyBpbiByZWxvY2F0aW9uIGVycm9y
cy4KPj4KPj4gQnVpbGQgdGhlIE1URCBwYWNrYWdlIHdpdGggLWZQSUMgd2hlbiBzaGFyZWQgbGli
cmFyaWVzIGFyZSBlbmFibGVkLAo+PiB3aGlsZSBrZWVwaW5nIHN0YXRpYy1vbmx5IGJ1aWxkcyB1
bmNoYW5nZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEtvbnN0YW50aW4gTWVueWFldiA8dmlwZXJA
bGFuZGF1Lm9uZT4KPj4gLS0tCj4+IMKgIHBhY2thZ2UvbXRkL210ZC5tayB8IDcgKysrKysrLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL210ZC9tdGQubWsgYi9wYWNrYWdlL210ZC9tdGQubWsKPj4g
aW5kZXggMmE2MjVmY2NjZS4uZDY3NzcwZDViYSAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9tdGQv
bXRkLm1rCj4+ICsrKyBiL3BhY2thZ2UvbXRkL210ZC5tawo+PiBAQCAtMTQsOCArMTQsMTMgQEAg
TVREX0NQRV9JRF9QUk9EVUNUID0gbXRkLXV0aWxzCj4+IMKgIE1URF9JTlNUQUxMX1NUQUdJTkcg
PSBZRVMKPj4gwqAgTVREX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZgo+PiArTVREX0NGTEFH
UyA9ICQoVEFSR0VUX0NGTEFHUykKPj4gwqAgTVREX0xERkxBR1MgPSAkKFRBUkdFVF9MREZMQUdT
KQo+PiAraWZlcSAoJChCUjJfU0hBUkVEX0xJQlMpJChCUjJfU1RBVElDX1NIQVJFRF9MSUJTKSx5
KQo+PiArTVREX0NGTEFHUyArPSAtZlBJQwo+PiArZW5kaWYKPj4gKwo+PiDCoCBpZmVxICgkKEJS
Ml9QQUNLQUdFX0xJQkVYRUNJTkZPKSx5KQo+PiDCoCBNVERfREVQRU5ERU5DSUVTICs9IGxpYmV4
ZWNpbmZvCj4+IMKgIE1URF9MREZMQUdTICs9IC1sZXhlY2luZm8KPj4gQEAgLTM1LDcgKzQwLDcg
QEAgZWxzZQo+PiDCoCBNVERfQ09ORl9PUFRTICs9IC0td2l0aG91dC16bGliCj4+IMKgIGVuZGlm
Cj4+IC1NVERfQ09ORl9FTlYgKz0gTERGTEFHUz0iJChNVERfTERGTEFHUykiCj4+ICtNVERfQ09O
Rl9FTlYgKz0gQ0ZMQUdTPSIkKE1URF9DRkxBR1MpIiBMREZMQUdTPSIkKE1URF9MREZMQUdTKSIK
Pj4gwqAgaWZlcSAoJChCUjJfUEFDS0FHRV9NVERfSkZGU19VVElMUykseSkKPj4gwqAgTVREX0NP
TkZfT1BUUyArPSAtLXdpdGgtamZmcwo+IAo+IGtpbmRseSBwaW5nCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCnJlbWluZGluZy4uLiBwYWNrYWdlIGlzIGJyb2tl
biB3aXRoIHNoYXJlZCBsaWJyYXJ5IGxpbmthZ2Ugbm93Li4uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
