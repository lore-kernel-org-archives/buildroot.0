Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8E1C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 12:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB3294086A;
	Sun,  5 Jul 2026 12:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5kBVqhlQpUq; Sun,  5 Jul 2026 12:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE1AD40871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783254103;
	bh=a+KnXYjDbnxahn1eyQyR/LI88ojMA3Qx2Wt/ebIZgwA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=J6nXqHj9V4b/FjSvArdKX+kIXlFS5c+sk6esOuM2IsINvacCN2yfV8aLCUNJLPSow
	 CbzU6ToueUJFjZPkxXladU2qXG4xTVBeJtxbTwY7+g0RB32JC2DXZUnua4HZlnzs0Q
	 G46i1GYTSN9pxniMVTjR1mSRtbxfEsoN5XeASw05uLsbDAYv1ZrbYCnkcpKTbg6VWa
	 J+OuvX7cDRh8LuR0Cg8JZbF+5yutG6P52RovOtEzvwtC0ja1gYvuS7ZH+HDvi8TF6F
	 I/mPlDpugiSHIb5YEwLeUHhN9QPWGV7IN5+oNj3DMBfC8sM4O6CQcjCpsxKUJGgJ8t
	 xA/REA3PhB5SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE1AD40871;
	Sun,  5 Jul 2026 12:21:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F9D5F2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5470C606EC
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Syz9km1kFrDQ for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 12:21:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 329B6606EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 329B6606EB
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 329B6606EB
 for <buildroot@uclibc.org>; Sun,  5 Jul 2026 12:21:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-474560436c3so2053255f8f.0
 for <buildroot@uclibc.org>; Sun, 05 Jul 2026 05:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783254098; x=1783858898;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1MCnj0r1X1Lk3zZBJQiKPg1aQRvTXULzoqBzFE4UKTI=;
 b=r1NsH14qQf2ahkkx7T+OvK0TzByLjShsN9lJSMu4FxrwqlK/a5i390oLuGnAb7zUHW
 B8VGDbm1xCihnQXr96OI4wQ3WJ4RPZ/PKqT2dWnBajt4Z/MBNVofWcyYU4rSupFnazuf
 skKhX2qk8zLVK3KT/X1K+0nLFlliVHe9bmdk4gLVIlDRwtVSgjIPWd6sheSxRbCRMZpS
 p8m04IagvvvYelD0VgK+A6QPMohlkOYpP7rPFdBm87L2HlaVgQ+qxeuSWU13LhyTtPAi
 ELq8f3JiNUzFfph/zbgAOQAr+6SXSVnfGKurSQRqBDB5Pgo2kDpC5JhTTbXjkJzOeJPs
 P4Uw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqBm9OVpaMr5IcS5/ZDnoEGLVWejim9e4um1UoRkfLz/JIuqOS8LaXEBEKR9X+RAT3uhnvGIbygxDE=@uclibc.org
X-Gm-Message-State: AOJu0Yz8kFmzlVKBWtKRxAjtVOsrHn3a2oUMcGNyZSvbCS5Hw7JUY5xN
 DUvuVgqykO4z3mRy4cmM4/fV/PfHXq54yYGnuXik0CWfTy+1zLXhQCq2fVTxPaeHISE=
X-Gm-Gg: AfdE7cmxbrsS917O6CL9AEdeluK9aLkQnV3WqEAULRWcg1l+1BGL1Olzl0ORvDsmodt
 Oz7FeJJD/oYW9EAo4qF0CSw0o60qosI/pPaeIHRM9bC4cZSy4TPEJGWVqTZs9qpXKB38qlCLn//
 n1OS5xQct5PJoX+B5VbbFPKG2Y72uXAMPks/uJ4mPNnp+46hreXMInlj0jLur3GL8kgh0woCs2x
 LjS2xBNd4ybmPUdEhpfbz2WgYXUL7KgKQ7x1DFVAq4rPOzf62nFd26ur9BV2Th/3EIf8kohPzJ2
 zh75eMxsZFZtFEs53y6gX8Zb9KZERJO4Weciz2AlQaCsbDcrCRS4B/IiDS5Kiq54M/PtGCpfk5e
 kITjABX25jDh+C5JjC+bopxABk9e1LlARkyyNP4d/X6hOcQZs6jH/xZaAo2uDLv6e0+syaiv/QR
 gZBQxovDRHQAvL2EyparUepoiumhrBjimvN4jIj7f0pAbTfQ2XMe0y8VrhpC5SAKERy7D/0DDdR
 FjrOTJ9vs36X2YthwD1PmDFPThh6E+M/43fOk2WF6b5rQyQNr/XuIA=
X-Received: by 2002:a5d:5f55:0:b0:47d:dfc6:b27e with SMTP id
 ffacd0b85a97d-47ddfc6b3c8mr1033148f8f.31.1783254097781; 
 Sun, 05 Jul 2026 05:21:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:5e89:44d0:fdb4:16c6?
 (2a01cb0594a2a2005e8944d0fdb416c6.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:5e89:44d0:fdb4:16c6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1e785sm15454304f8f.8.2026.07.05.05.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jul 2026 05:21:37 -0700 (PDT)
Message-ID: <5be190dc-3c3d-4a7a-a82b-cdfffb5849da@smile.fr>
Date: Sun, 5 Jul 2026 14:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org,
 Fiona Klute <fiona.klute@gmx.de>
References: <20260703180354.600761-1-fiona.klute__3867.25891601003$1783101875$gmane$org@gmx.de>
 <pan$e3369$4de7e227$2d6fda29$7b302be8@ID-313208.user.individual.net>
Content-Language: fr, en-US
In-Reply-To: <pan$e3369$4de7e227$2d6fda29$7b302be8@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1783254098; x=1783858898; darn=uclibc.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1MCnj0r1X1Lk3zZBJQiKPg1aQRvTXULzoqBzFE4UKTI=;
 b=UFAf1I8I7aDuyGA9U6cOkG61o6t8LYD3HEWeaVCjmWiQ9cL/bCdsuAUn4qnF1aHr7A
 zB7xibHl6eENsVIGu9X6fYo7sXM5BjVJBTQpFhx6kDIaxjdTfOip4UP3FNxBtu57bqy5
 Y3BRxM1+KYJZS0gMGClNZBCswUvlTI4isjPMU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=UFAf1I8I
Subject: Re: [Buildroot] [PATCH 1/1] package/apr: fix build failure with GCC
 >= 14
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

SGVsbG8gRmlvbmEsIEJlcm5kLCBBbGwsCgpMZSAwMy8wNy8yMDI2IMOgIDIwOjQ5LCBCZXJuZCBL
dWhscyBhIMOpY3JpdMKgOgo+IEFtIEZyaSwgIDMgSnVsIDIwMjYgMjA6MDM6NTQgKzAyMDAgc2No
cmllYiBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290Ogo+IAo+PiBUaGUgd29ya2Fyb3VuZCBpbiAz
ZDA2NjYxZmMxYmYwZjg4MzU2OTgxYTQ0Y2I5M2I3YjBjNzZhNjY5IGZvciB0aGUKPj4gYnJva2Vu
IEMyMyBjaGVjayB3YXMgaW5jb3JyZWN0OiBXaGVuIG92ZXJyaWRpbmcgYWNfY3ZfcHJvZ19jY19j
MjMgdGhlCj4+IHZhbHVlIG11c3QgZWl0aGVyIGJlICJubyIgKHRvIGluZGljYXRlIHRoYXQgQzIz
IGlzIG5vdCBzdXBwb3J0ZWQpIG9yCj4+IGNvbnRhaW4gdGhlIGNvbW1hbmQgbGluZSBwYXJhbWV0
ZXJzIHRvIGVuYWJsZSBDMjMgd2l0aCB0aGUgQyBjb21waWxlciBpbgo+PiB1c2UgKGUuZy4gIi1z
dGQ9Z251MjMiLCBtYXkgYmUgYW4gZW1wdHkgc3RyaW5nIGlmIGFwcHJvcHJpYXRlKS4gVGhlCj4+
IHdvcmthcm91bmQgc2V0IGl0IHRvICJ5ZXMiIGZvciBob3N0IEdDQyA+PSAxNCwgbWFraW5nIGJ1
aWxkcyBmYWlsLgo+Pgo+PiBIb3dldmVyLCB0aGUgb3JpZ2luYWwgaXNzdWUgd2FzIHRoYXQgYXBy
IG1heSB0cnkgdG8gZW5hYmxlIEMyMyBpbiBob3N0Cj4+IENDIGNhbGxzIGlmIHRoZSB0YXJnZXQg
Q0Mgc3VwcG9ydHMgaXQuIFNvIGluc3RlYWQgb2YgZmlndXJpbmcgb3V0IHRoZQo+PiBjb3JyZWN0
IGFyZ3VtZW50cyBmb3IgR0NDID49IDE0LCB3ZSBjYW4gc2V0IGFjX2N2X3Byb2dfY2NfYzIzPW5v
IG9ubHkKPj4gZm9yIGhvc3QgR0NDIDw9IDEzIGFuZCBsZWF2ZSBpdCB1bnNldCBvdGhlcndpc2Us
IGFzIGluIHRoYXQgY2FzZQo+PiBlbmFibGluZyBDMjMgd2lsbCBkbyBubyBoYXJtLgo+Pgo+PiBG
aXhlczogM2QwNjY2MWZjMWJmMGY4ODM1Njk4MWE0NGNiOTNiN2IwYzc2YTY2OSBGaXhlczoKPj4g
LQo+PiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNzdjLwo+IDc3Y2Q1
NDU2MTY5ZTA0YzJmOTJkYzMyOGM0YjY4Mjg1MTNkMTE5NWYvCj4+IC0KPj4gaHR0cHM6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLwo+IDdhNC83YTRmYjJiMjEwMjdmOThkZjYwNzg3
MWQ5ZmUwZGQyMzRkNDRhZWJiLwo+PiAtCj4+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5u
ZXQvcmVzdWx0cy9hNmMvCj4gYTZjZWY0YzU5NjVmZGViNDBkM2IzOWNiZDQwOTQxMzI5ZjRmYzFj
OC8KPj4gKGFuZCBtb3JlKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSA8ZmlvbmEu
a2x1dGVAZ214LmRlPgo+IAo+IFRlc3RlZC1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5l
dD4KPiBbYnVpbGQtdGVzdGVkLCBwcmV2aW91cyBidWlsZCBlcnJvciBzZWVuIGhlcmUgaXMgbm93
IGZpeGVkXQoKVGhhbmtzIGZvciB0aGUgZml4IQoKVGhlIHVzZSBvZiBhY19jdl9wcm9nX2NjX2My
Mz0nLXN0ZD1nbnUyMycgaW5zdGVhZCBvZiBhY19jdl9wcm9nX2NjX2MyMz15ZXMgaXQKdW5pbnR1
aXRpdmUgc2luY2Ugd2UgY2FuIHVzZSBhY19jdl9wcm9nX2NjX2MyMz1ubyB0byBkaXNhYmxlIHRo
ZSBmZWF0dXJlLgoKQnV0IG9rLCB3ZSAod2l0aCBEb3dhbikgZmFpbGVkIHRvIHRlc3QgdGhlIGlu
aXRpYWwgZml4IHByb3Blcmx5IGR1ZSB0byBhbgpleGNlc3NpdmUgdXNlIG9mIERvY2tlciBlbnZp
cm9ubWVudCA7LSkKCkFwcGxpZWQgdG8gbWFzdGVyLiBUaGFua3MuCgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
