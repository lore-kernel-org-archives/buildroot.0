Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A9AE87852
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 18:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CBB840B79;
	Tue,  3 Feb 2026 18:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfKdb5-vwLvW; Tue,  3 Feb 2026 18:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 238E040B8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770142669;
	bh=4zPkl8TChrL5grKwdwPAzOpb38mUhDNVUE3whtx33Go=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mZWHYIvQeGdLQg7OLKE/Qe6VT51y/k8LZPQUqXdv/UtMFBe82B5cNHcmKVyHRxQAU
	 yVIhqDpGOYmuZittZ1NTihggfMqQCC7N1v7BUdyY1/hVULb7s1AxYqzbLCm52bF2lj
	 m7bRliGP4L6rrhfLJWh0tssiQfqHIhAs1qZ8Zbg5BS24OAac8RyYNCDmlW8b/5wGOD
	 lugv8L88unwMK+abx6EUURH0NfhJWaARWCCx5HgiIxA21ARykn39gpmUP3C/BV1EFA
	 S6kRIonQUr1N0L1Nl9nPCXHxJLtgs1q1BgLLtBZNRqgLwA6esuKQ6PTVgvSfQZYrum
	 pV/iunp8aQ87w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 238E040B8C;
	Tue,  3 Feb 2026 18:17:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30435F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12B88607AC
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKKvO_yZRDSq for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 18:17:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E9A636077D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9A636077D
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9A636077D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:17:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4806e0f6b69so43738755e9.3
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 10:17:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770142665; x=1770747465;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bk3W2z0D2uVdKiAZIFg6sgACn2GoDu/RlWT176pRxxo=;
 b=mvJFC9YgJUb+xckN5Ws6U7D0BjRCxY8l/VRqYUOnrHPKlwAvPJNFchImsaQW9Lg7no
 tqlIfZmw5kBJBfybjuNmBXRyxJfcxg7Cj+RKAyQVznFEHMUymQw6kN47czLcmxLXcl6X
 QYz4n10y4MZEFXG1KSQC92ZhFZzjKDzEfunZyRQCS66wMMhPxXFdYaNdzEjXj64wCqqP
 OzmsxXD53VdyH2BLSRrzVa4GViK5d/pPMaALiuP/0/SM2Rk3z9/c1NpsztVH+fCgJ8Qz
 AKEb20T8QtFkFEeXWZZeFZUCDwmKJtmXNMlzQZaNi18Jku2VVFzn2K5k3tZgPIhWkS1Y
 376A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9DxJHOlvNPZBpkiOrFy3cqrta8tg7W0o21RPZzeV4ZSDfU1tjqbFJkKnN4/XXCPE96ETIsgyO884=@buildroot.org
X-Gm-Message-State: AOJu0Yz3MPV+YA7j5A129RDsJf8xIJjzAV3i9LD0h6U+4iPLrqLVUg80
 krSlYM6qB8VtUm0kqxexzK9Npu2U37+TUn/Vz4DpdbOa2z+3L7DZBj5/J+inwPcyMnF0KnddHCd
 HDW14Ww4=
X-Gm-Gg: AZuq6aJ8zIhyBeMVs1Wr5OhzhPaK/ca3FBFMjQXCPsFaAMUzNfCK5SUKQOrI0Uftcjx
 l5nrzsQONf3S9d4/LizRVZVqdVikB/tGRgKr4uAv8Tym66yYUSTDLpfEsgR0aqVITv9tk4a27op
 /dnuPfM5km0R001vuVGo8qBKEQCaYdBJwnfTcHtg/rqIyxm/M1K0GVkxJPdY/qF6CIAyLDe4p3z
 torlqgsitfzP7rYsW0OQxJEJzxKTFw8uo+mGVPMcZa/446KkJJgK7qMAUG4o5ITwPTG9pPTsqs0
 XjWncrntY8yUen3YfiZM8qPbjxbfTCklJNmdnFrEeBLsLx6VA8tCM7Hg+4NqrvntBL6FOg4u5gq
 HhBJd+DdZwMwJn3sZ+W1v2OpoSw5lJXl2fUwP1Or44uhZidBspC067uB+/sg3r+QdvooS/RPh76
 RnEGk8e86rhppw4jLbDN4UVxgCLi7kpErnUc7qlks1H3wfePutaIG0
X-Received: by 2002:a05:600c:19cf:b0:480:1e8f:d15f with SMTP id
 5b1f17b1804b1-4830e93eab1mr6639545e9.2.1770142664813; 
 Tue, 03 Feb 2026 10:17:44 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830511cc93sm90933625e9.2.2026.02.03.10.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 10:17:44 -0800 (PST)
Message-ID: <63db3773-eea9-4e98-a2ae-c13bb6df9c4f@smile.fr>
Date: Tue, 3 Feb 2026 19:17:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260117104516.87829-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20260117104516.87829-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770142665; x=1770747465; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bk3W2z0D2uVdKiAZIFg6sgACn2GoDu/RlWT176pRxxo=;
 b=R76yf0xC/xKnE8c7KxmDuVeSPpQAFViOvsfK3F+KfCaL9wbFnbXR/ORn2y3aNz/35j
 Ju30aJXmjWRNyrEZ4d+VQsJCb07DFLbyiBNaN4rAMiDBm2NbJ0eEVvMpggjkjX8ASHf6
 LAe0S4pueqj5z1cr68hr+cDa1XHnXilHZvT68=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=R76yf0xC
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: always disable man
 pages and translations
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAxNy8wMS8yMDI2IMOgIDExOjQ1LCBKdWxpZW4gT2xpdmFp
biB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gV2hlbiB0aGUgaG9zdCBzeXN0ZW0gaGFzIGFz
Y2lpZG9jdG9yIGFuZCBwbzRhL3BvbWFuIGluc3RhbGxlZCwKPiB1dGlsLWxpbnV4IGRldGVjdCB0
aGVtIGFuZCBhdXRvbWF0aWNhbGx5IGVuYWJsZSBtYW51YWwgcGFnZXMgYW5kCj4gdGhlaXIgdHJh
bnNsYXRpb25zLiBUaGlzIGNhbiBzaWduaWZpY2FudGx5IGluY3JlYXNlIHRoZSBwYWNrYWdlCj4g
YnVpbGQgdGltZSAoaW4gbXkgY2FzZSwgZnJvbSAyMHMgdG8gMW01MHMpLiBTZWUgdXBzdHJlYW0K
PiBjb21taXQgWzFdIGFuZCBbMl0uCj4gCj4gU2luY2UgbWFudWFsIHBhZ2VzIGFyZSBub3QgbmVl
ZGVkIGluIEJ1aWxkcm9vdCwgdGhpcyBjb21taXQgYWRkcyBpbgo+IF9DT05GX09QVFMgZm9yIGhv
c3QgaG9zdCBhbmQgdGFyZ2V0IHZhcmlhbnRzIHRoZSBvcHRpb25zIHRvIGFsd2F5cwo+IGRpc2Fi
bGUgdGhlIGRldGVjdGlvbiBvZiB0aG9zZSBwcm9ncmFtcyAoLS1kaXNhYmxlLWFzY2lpZG9jCj4g
LS1kaXNhYmxlLXBvbWFuKS4gVGhpcyB3aWxsIGFsd2F5cyBkaXNhYmxlIHRoZSBnZW5lcmF0aW9u
IG9mIG1hbnVhbAo+IHBhZ2VzLgo+IAo+IE5vdGU6IEJ1aWxkcm9vdCBhdHRlbXB0cyB0byBnbG9i
YWxseSBkaXNhYmxlIGRvY3VtZW50YXRpb24gZm9yCj4gYXV0b3Rvb2xzIHBhY2thZ2VzIGJ5IHBh
c3NpbmcgdmFyaW91cyAtLWRpc2FibGUtZG9jcyBjb25maWd1cmUKPiBvcHRpb25zIChzZWUgWzNd
KSwgYnV0IHRob3NlIGFyZSBub3QgcmVjb2duaXplZCBieSB1dGlsLWxpbnV4Lgo+IAo+IFRoaXMg
Y29tbWl0IGFsc28gcmVvcmRlciB0aGUgb3B0aW9ucyBmb3IgVVRJTF9MSU5VWF9DT05GX09QVFMu
Cj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29tbWl0
LzlhY2ZjMzQ5ZTBlYTY4YTkyYmFmODE4Y2M2NTkxMjFmNDBhYjljMDQKPiBbMl0gaHR0cHM6Ly9n
aXRodWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51eC9jb21taXQvMjM2NDIxYTQ5MTAzZWE1MTBi
Y2JhMWU3ZWY5MGI1N2QyNGFlYWI3Ngo+IFszXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjUuMTEvcGFja2FnZS9wa2ctYXV0b3Rvb2xzLm1rI0wx
ODQtMTg2CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4K
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gLS0t
Cj4gIHBhY2thZ2UvdXRpbC1saW51eC91dGlsLWxpbnV4Lm1rIHwgNiArKysrKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3V0aWwtbGludXgvdXRpbC1saW51eC5tayBiL3BhY2thZ2UvdXRpbC1saW51eC91
dGlsLWxpbnV4Lm1rCj4gaW5kZXggZDBhMDNiZTQwNC4uYWY2MDQ0YWYzMiAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL3V0aWwtbGludXgvdXRpbC1saW51eC5tawo+ICsrKyBiL3BhY2thZ2UvdXRpbC1s
aW51eC91dGlsLWxpbnV4Lm1rCj4gQEAgLTQ3LDggKzQ3LDEwIEBAIFVUSUxfTElOVVhfREVQRU5E
RU5DSUVTID0gXAo+ICAjIHN5c3RlbSBpcyBub3QgWTIwMzggY29tcGxpYW50LiB1dGlsLWxpbnV4
IHdpbGwgc3VwcG9ydCB5ZWFyMjAzOCBpZgo+ICAjIHRoZSBzeXN0ZW0gaXMgY29tcGxpYW50IGV2
ZW4gd2l0aCB0aGlzIG9wdGlvbiBwYXNzZWQKPiAgVVRJTF9MSU5VWF9DT05GX09QVFMgKz0gXAo+
IC0JLS1kaXNhYmxlLXJwYXRoIFwKPiArCS0tZGlzYWJsZS1hc2NpaWRvYyBcCj4gIAktLWRpc2Fi
bGUtbWFrZWluc3RhbGwtY2hvd24gXAo+ICsJLS1kaXNhYmxlLXBvbWFuIFwKPiArCS0tZGlzYWJs
ZS1ycGF0aCBcCj4gIAktLWRpc2FibGUteWVhcjIwMzgKPiAgCj4gIFVUSUxfTElOVVhfTElOS19M
SUJTID0gJChUQVJHRVRfTkxTX0xJQlMpCj4gQEAgLTU3LDYgKzU5LDggQEAgSE9TVF9VVElMX0xJ
TlVYX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZgo+ICAKPiAgIyBXZSBhbHNvIGRvbid0IHdh
bnQgdGhlIGhvc3QtcHl0aG9uIGRlcGVuZGVuY3kKPiAgSE9TVF9VVElMX0xJTlVYX0NPTkZfT1BU
UyA9IFwKPiArCS0tZGlzYWJsZS1hc2NpaWRvYyBcCj4gKwktLWRpc2FibGUtcG9tYW4gXAo+ICAJ
LS13aXRob3V0LXN5c3RlbWQgXAo+ICAJLS13aXRoLXN5c3RlbWRzeXN0ZW11bml0ZGlyPW5vIFwK
PiAgCS0td2l0aG91dC1weXRob24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
