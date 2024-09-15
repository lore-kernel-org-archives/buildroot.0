Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3458CC3ABA1
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 16:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74E79404D4;
	Sun, 15 Sep 2024 16:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83JHeQVUsnMi; Sun, 15 Sep 2024 16:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D4BC404E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D4BC404E2;
	Sun, 15 Sep 2024 16:01:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7432B1BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 16:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62F324034A
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 16:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5W9fkdkyv-L for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 16:01:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7341D40136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7341D40136
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7341D40136
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 16:01:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42ca6ba750eso23190925e9.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 09:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726416078; x=1727020878;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RnnAN/Jsvs2/hCL4N9X4278akBIbvZhaWTzrkFK7dCU=;
 b=H84KVhLvAkhqzOJV8YIzNBaD9t7q/mbyTR754Gf1FFq4aeAgwAKwRAumDEKo4pKEct
 hZAhGM+1lkkbtrAPMv6bzZoGBkXQUav2eQ9FmmufoNKTaI3wXKIQWkeJstNpXfOvSRtk
 4iFxWDPlwJJmXJCg1Bcu4wqQTvnEmCn/7QF5pbUolmDEWt7aaqrtDiUl0vhaJDIh16TJ
 jrtzCFFSqtDx6QvgHGqTctrFJyXlVis+4oxnRCqrDTkQRh5j5DGwHTcB+a7DQGz/0/5D
 O3upMnpHPNJbMmj5egm2x9YBFV2rGgWGFVctSHM7+RjRCVX837uR5/1VWVxG+WrkSNZC
 tCAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk6MTUn1NnOI0l5m66RtSqtFOT72Tw8us2cakZe2eKcOcwI0xPj9FCX/h/LYzV/8hkHP7//pK0BOU=@buildroot.org
X-Gm-Message-State: AOJu0YyOZCZJOYbkUd1vQ8Qzz0bOJ46HgqKxeVnl+PxYlfN8iy+j4Wn0
 dGKh4NRdODuaNG6cGvbbO+ssssijYgZ1aUqBe3BYR72LjXG7S7WGylq6ANHPxldJV9izTkOvAG1
 w
X-Google-Smtp-Source: AGHT+IFwV1yiC3qELWKwbWOSu++sNu0Z0VYrvABYuGbiMK/YnG6K1/h0m5Q+Sbvq+cQQPqANlBwcPw==
X-Received: by 2002:a05:600c:8707:b0:426:64c1:8388 with SMTP id
 5b1f17b1804b1-42cdcbca65amr70212335e9.17.1726416077631; 
 Sun, 15 Sep 2024 09:01:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b194005sm85777745e9.40.2024.09.15.09.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 09:01:17 -0700 (PDT)
Message-ID: <a561aef2-5db9-4bc6-b3fb-4f2d61f0c9ea@smile.fr>
Date: Sun, 15 Sep 2024 18:01:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZubuMtvyrh/8Nj/W@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <ZubuMtvyrh/8Nj/W@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1726416078; x=1727020878; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RnnAN/Jsvs2/hCL4N9X4278akBIbvZhaWTzrkFK7dCU=;
 b=ek1P0YIedFEIARjeQcv1fy0fjmLrqGu40sXG6semY89jhLxZD72thvX0QpsOKhnUUH
 k+c0DV7R3zGCD9Yze4RVovFoF+q8zqDcz4n+9cJV8KQFeAm3DhXzr8WgjRCS2sBpxNHu
 e6vGjgvMdqTkLrjupEYPpvIua5BqUhnI7eeec=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ek1P0YIe
Subject: Re: [Buildroot] [PATCH 2/2] package/qemu: update to 9.1.0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gV2FsZGVtYXIsCgpMZSAxNS8wOS8yMDI0IMOgIDE2OjI0LCBXYWxkZW1hciBCcm9ka29y
YiBhIMOpY3JpdMKgOgo+IFNlZSBoZXJlIGZvciBjaGFuZ2VzOgo+IGh0dHBzOi8vd2lraS5xZW11
Lm9yZy9DaGFuZ2VMb2cvOS4xCj4gCj4gVGhlIHN1cHBvcnQgZm9yIHRoZSBuaW9zMiBhcmNoaXRl
Y3R1cmUgZ290IHJlbW92ZWQuCgpIb3cgZGlkIHlvdSB0ZXN0IHRoaXMgdmVyc2lvbiBidW1wPwoK
SSB3b3VsZCByZWNvbW1lbmQgdG8gdXNlIGdpdGxhYi1jaSBhbmQgcHVzaCBhIGJyYW5jaCB3aXRo
IGEgc3BlY2lmaWMgbmFtZTogPHFlbXUKdmVyc2lvbj4tZGVmY29uZmlncy1xZW11IChzZWUgWzFd
WzJdWzNdKS4KCk5vdGU6IFdpdGggdGhlIGdpdGxhYi1jaSBmcmVlIHRpZXIgKHVzaW5nIHNoYXJl
ZCBnaXRsYWItY2kgcnVubmVycyksIGRlZmNvbmZpZ3MKbGlrZSB0aGUgcWVtdV9hYXJjaDY0X3Ni
c2FfZGVmY29uZmlnIHRha2VzIHRvbyBsb25nIHRvIGJ1aWxkIGFuZCByZWFjaCB0aGUgNmgKam9i
IHRpbWVvdXQgb3IgZmlsZXN5c3RlbSBzaXplIGxpbWl0LgoKWzFdIGh0dHBzOi8vZ2l0bGFiLmNv
bS9rdWJ1OTMvYnVpbGRyb290Ly0vY29tbWl0cy9xZW11LTguMi4xLWRlZmNvbmZpZ3MtcWVtdQpb
Ml0gaHR0cHM6Ly9naXRsYWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9waXBlbGluZXMvMTE2Nzg2
Njc5MApbM10gaHR0cHM6Ly93d3cubGludXhlbWJlZGRlZC5mci8yMDIyLzAxL2J1aWxkcm9vdC1n
aXRsYWItY2ktdGVzdGluZwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBXYWxkZW1hciBCcm9ka29yYiA8
d2J4QG9wZW5hZGsub3JnPgo+IC0tLQo+ICBwYWNrYWdlL3FlbXUvQ29uZmlnLmluICAgICAgfCA1
IC0tLS0tCj4gIHBhY2thZ2UvcWVtdS9Db25maWcuaW4uaG9zdCB8IDEgLQo+ICBwYWNrYWdlL3Fl
bXUvcWVtdS5oYXNoICAgICAgfCAyICstCj4gIHBhY2thZ2UvcWVtdS9xZW11Lm1rICAgICAgICB8
IDIgKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWVtdS9Db25maWcuaW4gYi9wYWNrYWdlL3FlbXUv
Q29uZmlnLmluCj4gaW5kZXggNjA4ZTRkNDI5ZC4uMmQxNWFiMWVhOSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL3FlbXUvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbgo+IEBA
IC0yNTIsMTEgKzI1Miw2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9RRU1VX1RBUkdFVF9NSVBTTjMy
RUwKPiAgCWhlbHAKPiAgCSAgTUlQUyBOMzIgYXJjaGl0ZWN0dXJlLCBsaXR0bGUtZW5kaWFuLgo+
ICAKPiAtY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfVEFSR0VUX05JT1MyCj4gLQlib29sICJuaW9z
MiIKPiAtCWhlbHAKPiAtCSAgTmlvcyBJSSBhcmNoaXRlY3R1cmUuCgpSZW1vdmluZyB0aGlzIG9w
dGlvbiBuZWVkcyBsZWdhY3kgaGFuZGxpbmcgaW4gQ29uZmlnLmluLmxlZ2FjeS4KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiAtCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9RRU1VX1RBUkdFVF9PUjFL
Cj4gIAlib29sICJvcjFrIgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1FFTVVfRkRUIGlmIEJSMl9Q
QUNLQUdFX1FFTVVfU1lTVEVNCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWVtdS9Db25maWcuaW4u
aG9zdCBiL3BhY2thZ2UvcWVtdS9Db25maWcuaW4uaG9zdAo+IGluZGV4IDhkZDBjN2QxMWIuLjRk
YjExNDQ5MGEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9xZW11L0NvbmZpZy5pbi5ob3N0Cj4gKysr
IGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbi5ob3N0Cj4gQEAgLTksNyArOSw2IEBAIGNvbmZpZyBC
UjJfUEFDS0FHRV9IT1NUX1FFTVVfQVJDSF9TVVBQT1JUUwo+ICAJZGVmYXVsdCB5IGlmIEJSMl9t
aWNyb2JsYXplYmUKPiAgCWRlZmF1bHQgeSBpZiBCUjJfbWlwcwo+ICAJZGVmYXVsdCB5IGlmIEJS
Ml9taXBzZWwKPiAtCWRlZmF1bHQgeSBpZiBCUjJfbmlvczIKPiAgCWRlZmF1bHQgeSBpZiBCUjJf
b3Ixawo+ICAJZGVmYXVsdCB5IGlmIEJSMl9wb3dlcnBjCj4gIAlkZWZhdWx0IHkgaWYgQlIyX3Bv
d2VycGM2NAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvcWVtdS5oYXNoIGIvcGFja2FnZS9x
ZW11L3FlbXUuaGFzaAo+IGluZGV4IDQxOWRkMGQxYjMuLjE2OWZlMDUwNjggMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9xZW11L3FlbXUuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcWVtdS9xZW11Lmhhc2gK
PiBAQCAtMSw0ICsxLDQgQEAKPiAgIyBMb2NhbGx5IGNvbXB1dGVkLCB0YXJiYWxsIHZlcmlmaWVk
IHdpdGggR1BHIHNpZ25hdHVyZQo+IC1zaGEyNTYgIGE4YzNmNTk2YWVjZTk2ZGEzYjAwY2FmYjc0
YmFhZmEwZDE0NTE1ZWFmYjhlZDFlZTNmN2Y1YzJkMGViZjAyYjYgIHFlbXUtOS4wLjIudGFyLnh6
Cj4gK3NoYTI1NiAgODE2YjcwMjJhOGJhN2MyYWMzMGUyZTBjZjk3M2U4MjZmNmJjYzg1MDUzMzk2
MDMyMTJjNWVkZThlOTRkNzgzNCAgcWVtdS05LjEuMC50YXIueHoKPiAgc2hhMjU2ICA2ZjA0YWU4
MzY0ZDAwNzlhMTkyYjE0NjM1ZjRiMWRhMjk0Y2UxODcyNGMwMzRjMzlhNmE0MWQxYjA5ZGY2MTAw
ICBDT1BZSU5HCj4gIHNoYTI1NiAgZGM2MjY1MjBkY2Q1M2EyMmY3MjdhZjNlZTQyYzc3MGU1NmM5
N2E2NGZlM2FkYjA2Mzc5OWQ4YWIwMzJmZTU1MSAgQ09QWUlORy5MSUIKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9xZW11L3FlbXUubWsgYi9wYWNrYWdlL3FlbXUvcWVtdS5tawo+IGluZGV4IDE2Y2Zm
MTNkMTguLmU5ZjY1MjBkODkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9xZW11L3FlbXUubWsKPiAr
KysgYi9wYWNrYWdlL3FlbXUvcWVtdS5tawo+IEBAIC02LDcgKzYsNyBAQAo+ICAKPiAgIyBXaGVu
IHVwZGF0aW5nIHRoZSB2ZXJzaW9uLCBjaGVjayB3aGV0aGVyIHRoZSBsaXN0IG9mIHN1cHBvcnRl
ZCB0YXJnZXRzCj4gICMgbmVlZHMgdG8gYmUgdXBkYXRlZC4KPiAtUUVNVV9WRVJTSU9OID0gOS4w
LjIKPiArUUVNVV9WRVJTSU9OID0gOS4xLjAKPiAgUUVNVV9TT1VSQ0UgPSBxZW11LSQoUUVNVV9W
RVJTSU9OKS50YXIueHoKPiAgUUVNVV9TSVRFID0gaHR0cHM6Ly9kb3dubG9hZC5xZW11Lm9yZwo+
ICBRRU1VX1NFTElOVVhfTU9EVUxFUyA9IHFlbXUgdmlydAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
