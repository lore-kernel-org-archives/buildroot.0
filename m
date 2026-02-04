Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701E2E9D40F
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45175608A3;
	Wed,  4 Feb 2026 16:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3trsqiCOOVnU; Wed,  4 Feb 2026 16:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A2F260F88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770222917;
	bh=cakpd49U3FGtKpqS79o0kjm45kkFFF9+CEcFQWjhOfw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=hlVx56mZDcDTMkMXwpv1eQXHbSAfmSxR+RAkj9amcCpoMUOHqELMKgeWt5eWxLzA8
	 2P0FlBPJlvyVfB6KzKZQ7OQQN3qeaalB+HBvKZHfNYU99quDCbQ/ocAf9p8wuV4hK5
	 0g6tPJn9aLaYNMZ1JPPmS4NleWXahRvVGQyTPLk9A+VF8yYGClRcAUso7RzRXqCA6q
	 X1g9qXEMofYLC/DULbpx/cBWuI/X3YH+HzjZx6rS4wMaLhgfJuesnUHz6B52zoIhey
	 fE3X5YmNUgw9R4T6vMtxTVKeCP487Fp749OD1ENbltMr6sS60h5u4heL0Wdz+muuMY
	 jsbiOIAJcn5Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A2F260F88;
	Wed,  4 Feb 2026 16:35:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC189173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCB6340B1F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfs4PNDlmgBU for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B36C740CF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B36C740CF5
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B36C740CF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:35:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso34305e9.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 08:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770222912; x=1770827712;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SO0F40r/FwaF7EaNPRwgDXe18sRZLrO+pwzB5Afd9bI=;
 b=pWHCLar4ghf/mKadGq6YXSkCyFqhRrihknmu+V3+9t3RGQH55yQEaHETKpS4LXaCDY
 5hLd/8G5sAAaHKVikcjCDw/qR1Rh6/g/75OIUhJxSH0gu3WhBLpn5elCw3juyQDqCTVt
 zaS0B8sdDqarnfaSuT4kX46L0qLej9y3PWIAoyVvIRoyMcv40RoQ+/Mi0g0N7rYxHqdG
 ytC0BbJ6Oeskc1GJeOcPESr/nGctkh72QXN5UmJNAkFULQ/z1wompu9JQAsS3jdbdr5F
 bjPMtMU3+wpU1vrBkZ7IoXkp07hS6A8T+zR6dtpJe4WKA0tKO1gqO35VeXVH/an8Zoel
 LYVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtzsYKyQg2RV4TAAwrUKbqCikz7xYdCLhKOg2w8cIDTorGFUZAErq/QS6LvLfX3zb3xi6rD/lk8b8=@buildroot.org
X-Gm-Message-State: AOJu0Yz1LOP1EZ7dUVDBLYSVu0NTyWg/wueCH3BC8iStjFCXUNsjIHXN
 4RtvcShs3MJmdnOjdIEf+mnMvmVB8jiDv1KSZNUHjCKLsCSIEihsODibnL/gmfeTJtfy/H7eXOx
 Dx53X4NI=
X-Gm-Gg: AZuq6aKV9GapZ4+uOuG2xj1y/cMpiaAN3oB0COGAPiab+ujIdp8kPr1IBfaEIpXxQTa
 PpvDGcxO9UQYD2nHI8MgrzV00ZdOxOUI/1/nLff8PN+Jlws/FhHOPupyONla9wK0QjC22ePvO2s
 w/Uqh41JfRFg8IvLp47tWVLySivsBdToiaIZ70f5AkKt64ufe/Gw3Com3YYqOWP8EYcNQcrnON0
 qDn4Sb42wWCoT0/d45zhYeqSReWQwIfyAbYRYhLrd3DFSSyBMyF881ko4Jpg5Gnx1ZxM6v2nwe0
 gGxUk/imcYsUIY2a3v3tFdk0YIMDXw2YOcoNPQFUsO33AdbZShCqT/uEin1zPYfyXqyuPO0d9Jt
 ekCWdraPLElgYuYNhU8ioG4uQagiTnQB8PyC7w1iQtjFCtokdcUeU1p8nad+P28SvFGQT9SETad
 s0sjsrkWG+p/bJ6unxdiuOjT+2uDBRjEdjQpp1d/LijiQPz17Nqi4Q9EV8gkirU74DvSZAKZkYX
 DmP7WqXazJ9GubOSJVvE+I0G8d1RKW/Fvfwei6YpbXkjnUd98MjHGqehlLAhg==
X-Received: by 2002:a05:600c:34c3:b0:480:1a3a:5ce6 with SMTP id
 5b1f17b1804b1-4830e93ddd9mr48439295e9.14.1770222912484; 
 Wed, 04 Feb 2026 08:35:12 -0800 (PST)
Received: from ?IPV6:2a02:8440:9501:c6d4:a70:6c91:93ab:53a1?
 (2a02-8440-9501-c6d4-0a70-6c91-93ab-53a1.rev.sfr.net.
 [2a02:8440:9501:c6d4:a70:6c91:93ab:53a1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4831088d318sm87090235e9.10.2026.02.04.08.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 08:35:12 -0800 (PST)
Message-ID: <c67b83af-df92-4d69-98c5-b2296707439c@smile.fr>
Date: Wed, 4 Feb 2026 17:35:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <20250626111642.228223-1-alex.bennee@linaro.org>
 <20250626111642.228223-2-alex.bennee@linaro.org>
 <7c6cfb4a-4caf-48fd-a327-a74dbef6e8be@smile.fr>
 <626736c7-d9aa-4333-a883-6943928e31c6@devoogdt.com>
Content-Language: fr, en-US
In-Reply-To: <626736c7-d9aa-4333-a883-6943928e31c6@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770222912; x=1770827712; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SO0F40r/FwaF7EaNPRwgDXe18sRZLrO+pwzB5Afd9bI=;
 b=q9dWIFIpUYff+eHBc+iknpX9KEhpOJMsWGHffozVy4l3CsePv9ozyVDHN8EUNy9Hgm
 XO6XJ84ep0VlQvU4HRwcqKrpMIiWnfPV5QHEiC3jr3Evvnl24AUw3MTHXwrJZsqfhjbe
 HwwsgoXu3WYW+Jc/0ugtkBbFFGLNTrGd738+o=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=q9dWIFIp
Subject: Re: [Buildroot] [RFC PATCH 1/3] package/llvm-project: use ninja to
 build llvm libs
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

SGVsbG8gVGhvbWFzLCBBbGV4LCBBbGwsCgpMZSAwNC8wMi8yMDI2IMOgIDE3OjExLCBUaG9tYXMg
RGV2b29nZHQgYSDDqWNyaXTCoDoKPiBIZWxsbyBBbGV4LCBSb21haW4sIEFsbCwKPiAKPiAKPiBP
biA3LzIvMjUgMjM6NDAsIFJvbWFpbiBOYW91ciB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBIZWxs
byBBbGV4LCBBbGwsCj4+Cj4+IExlIDI2LzA2LzIwMjUgw6AgMTM6MTYsIEFsZXggQmVubsOpZSBh
IMOpY3JpdMKgOgo+Pj4gVXNpbmcgbmluamEgaXMgcmVjb21tZW5kZWQgYXMgaXQgaXMgZmFzdGVy
IHRoYW4gdGhlIGRlZmF1bHQgR05VIG1ha2UKPj4+IGJ1aWxkIG1ldGhvZC4gTWFrZSB0aGUgc3dp
dGNoLgo+PiBOaW5qYSBpcyB1c3VhbGx5IGZhc3RlciBmb3IgaW5jcmVtZW50YWwgYnVpbGRzIChm
b3IgbGx2bSBkZXZlbG9wZXJzIFsxXSkgYnV0Cj4+IHNpbmNlIHdlIHVzdWFsbHkgdXNlIEJ1aWxk
cm9vdCBmb3IgYnVpbGRpbmcgdGFyZ2V0IGltYWdlcyBmcm9tIHNvdXJjZXMgbmluamEgbWF5Cj4+
IG5vdCByZWFsbHkgZmFzdGVyIHRoYW4gTWFrZS4KPj4KPj4gU2luY2Ugd2UgYWRkIGhvc3Qtbmlu
amEgaW4gdGhlIGRlcGVuZGVuY2llcywgaXMgcmVhbGx5IGZhc3RlciBpbiB0aGUgZW5kPwo+PiBO
b3RlOiBvbiBzb21lIGJ1aWxkIG1hY2hpbmUgd2l0aCBhIHJlY2VudCBlbm91Z2ggY21ha2UgdG9v
bCwgdGhlIGhvc3QtY21ha2UgaXMKPj4gbm90IHVzZWQuCj4+Cj4+IFsxXSBodHRwczovL2xsdm0u
b3JnL2RvY3MvR2V0dGluZ1N0YXJ0ZWQuaHRtbAo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQWxleCBC
ZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+Pj4gLS0tCj4+PiDCoCBwYWNrYWdlL2xs
dm0tcHJvamVjdC9sbHZtL2xsdm0ubWsgfCAxMCArKysrKystLS0tCj4+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL2xsdm0ubWsgYi9wYWNrYWdlL2xsdm0tcHJvamVj
dC9sbHZtLwo+Pj4gbGx2bS5tawo+Pj4gaW5kZXggNzU1MmUzNTkwYy4uOGZlN2QxMGZlMCAxMDA2
NDQKPj4+IC0tLSBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tawo+Pj4gKysrIGIv
cGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1rCj4+PiBAQCAtMTMsOCArMTMsMTAgQEAg
TExWTV9DUEVfSURfVkVORE9SID0gbGx2bQo+Pj4gwqAgTExWTV9TVVBQT1JUU19JTl9TT1VSQ0Vf
QlVJTEQgPSBOTwo+Pj4gwqAgTExWTV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPj4+IMKgIC1IT1NU
X0xMVk1fREVQRU5ERU5DSUVTID0gaG9zdC1weXRob24zIGhvc3QtbGx2bS1jbWFrZQo+Pj4gLUxM
Vk1fREVQRU5ERU5DSUVTID0gaG9zdC1sbHZtCj4+PiArSE9TVF9MTFZNX0RFUEVOREVOQ0lFUyA9
IGhvc3QtcHl0aG9uMyBob3N0LWxsdm0tY21ha2UgaG9zdC1uaW5qYQo+Pj4gK0xMVk1fREVQRU5E
RU5DSUVTID0gaG9zdC1sbHZtIGhvc3QtbmluamEKPiAKPiAKPiBXaHkgc2VsZWN0aW5nIGhvc3Qt
bmluamE/IFRoaXMgaXMgaGFuZGxlZCBieSB0aGUgcGFja2FnZS9wa2ctY21ha2UubWsKPiBpbmZy
YXN0cnVjdHVyZSB3aGVuIHNldHRpbmcgdGhlIF9DTUFLRV9CQUNLRU5EIHRvIG5pbmphLgo+IAo+
IAo+Pj4gKwo+Pj4gK0xMVk1fQ01BS0VfQkFDS0VORCA9IG5pbmphCj4+IFdoYXQgYWJvdXQgb3Ro
ZXIgbGx2bS1wcm9qZWN0IHJlbGF0ZWQgcGFja2FnZSBzdWNoIENsYW5nPwo+Pgo+PiBCZXN0IHJl
Z2FyZHMsCj4+IFJvbWFpbgo+Pgo+Pgo+Pj4gwqAgwqAgIyBQYXRoIHRvIGNtYWtlIG1vZHVsZXMg
ZnJvbSBob3N0LWxsdm0tY21ha2UKPj4+IMKgIEhPU1RfTExWTV9DT05GX09QVFMgKz0gLURDTUFL
RV9NT0RVTEVfUEFUSD0kKEhPU1RfRElSKS9saWIvY21ha2UvbGx2bQo+Pj4gQEAgLTE2Niw4ICsx
NjgsOCBAQCBMTFZNX0NPTkZfT1BUUyArPSAtRExMVk1fSEFWRV9URkxJVEU9IiIKPj4+IMKgICMg
RGVmYXVsdCBpcyBEZWJ1ZyBidWlsZCwgd2hpY2ggcmVxdWlyZXMgY29uc2lkZXJhYmx5IG1vcmUg
ZGlzayBzcGFjZSBhbmQKPj4+IMKgICMgYnVpbGQgdGltZS4gUmVsZWFzZSBidWlsZCBpcyBzZWxl
Y3RlZCBmb3IgaG9zdCBhbmQgdGFyZ2V0IGJlY2F1c2UgdGhlIGxpbmtlcgo+Pj4gwqAgIyBjYW4g
cnVuIG91dCBvZiBtZW1vcnkgaW4gRGVidWcgbW9kZS4KPj4+IC1IT1NUX0xMVk1fQ09ORl9PUFRT
ICs9IC1EQ01BS0VfQlVJTERfVFlQRT1SZWxlYXNlCj4+PiAtTExWTV9DT05GX09QVFMgKz0gLURD
TUFLRV9CVUlMRF9UWVBFPVJlbGVhc2UKPj4+ICtIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1EQ01B
S0VfQlVJTERfVFlQRT1SZWxlYXNlIC1HIE5pbmphCj4+PiArTExWTV9DT05GX09QVFMgKz0gLURD
TUFLRV9CVUlMRF9UWVBFPVJlbGVhc2UgLUcgTmluamEKPiAKPiAKPiBXaHkgd291bGQgaXQgYmUg
bmVlZGVkIHRvIGFkZCAtR05pbmphLCB0aGlzIHNob3VsZCBiZSBoYW5kbGVkIGJ5IHRoZSBwYWNr
YWdlLwo+IHBrZy1jbWFrZS5tayBpbmZyYXN0cnVjdHVyZS4KCkknbGwgbWFyayB0aGlzIHBhdGNo
IGFzICJDaGFuZ2VzIHJlcXVlc3RlZCIuCgpBbGV4LCBtYXliZSB5b3UgY2FuIHRyeSB0byBzZXQg
J0hPU1RfTExWTV9DTUFLRV9CQUNLRU5EID0gbmluamEnIGluc3RlYWQgPwoKQmVzdCByZWdhcmRz
LApSb21haW4KCgo+IAo+IAo+Pj4gwqAgwqAgIyBDb21waWxlIGxsdm0gd2l0aCB0aGUgQysrMTQg
KElTTyBDKysgMjAxNCBzdGFuZGFyZCkuCj4+PiDCoCBIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1E
Q01BS0VfQ1hYX1NUQU5EQVJEPTE0Cj4gCj4gCj4gS3IsCj4gCj4gCj4gVGhvbWFzIERldm9vZ2R0
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
