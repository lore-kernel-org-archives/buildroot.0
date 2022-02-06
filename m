Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67783C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 11:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D68460D7B;
	Sun,  6 Feb 2022 11:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HjsA9nGsp2Ab; Sun,  6 Feb 2022 11:07:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45FD260D6E;
	Sun,  6 Feb 2022 11:07:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73CAC1BF5F8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6107E401ED
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mhc2PpZbGhXE for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 11:07:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CAF8400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 11:07:41 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id f17so6651482edd.2
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 03:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=wqGF3GOJLvycnP5+Z0TbBFM3OIVK4F0Arf0UUWmSJNk=;
 b=Sa713wDmask0A0mKZsHWb32XNhk45qXXJdFz9FxljnSCdOLNBENVlJyfYacC2nVRLI
 WGhuCW5w/g9rSfpzkIZh1vZ4JIcuChe2eZbtys/y3X6mGcPZLaawdJ5LoGje8OmbDbEl
 mdnxC0GrWIpSwVerT4kMCQzZx1n6Cmr8KRd5hKTrcMDtF04U8q9f48Yitd6hj2cwkEKv
 Oy+cW0HCxaUckv77WqVK6yKg8xWxWGybq8NtepGW2WbFfiIh96GX44lopEsXvMwW8H1G
 dIcYq1sRw9cSRS4PJeBC3FIO35HScZ40Lrymi5KGwCAQ39OmykenkUZPNPiwghe9Go/B
 rimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=wqGF3GOJLvycnP5+Z0TbBFM3OIVK4F0Arf0UUWmSJNk=;
 b=zIV5tcVCy7RZiJad8B7PXllEyHj9jHCgpMLeZRXIsOP/aCwnKjfk3FYABVdPm3TM61
 L1iGB7QiUjr40EiuP+vLaMghaOTDdRXycHaJqjr/5Vp3hurKULcPzNKRnFwBgTdRxPSq
 KVuFA/bQqhvFoRiRFbj3VQWTdN06UYPLiG1WJkgvo5C9kS38wb14qbXl7qhkILzVQaj6
 t9p5Sb4hiItUjK5CqX9OZ3ApOrzOVatwXgtZ1UwVDH5TLUnfUs0LzPdHq5M1Qq0CM3Rd
 0xo74pdrYifS+gq07zdhgsvMmRSVjG8MxdCXqq0QjYeW+adCrdEQvv7TLZ0GRMVG2kL3
 Fylw==
X-Gm-Message-State: AOAM531mGkmkTk81Oy86h+s84nwX3NQ1aFqW8DgWvKhCns2pU0nu/owZ
 1gtYagBRQKhWSNmwP/BM/a+ZUjOY7VTufg==
X-Google-Smtp-Source: ABdhPJxpCUjWRUku/qMEt/ff6aeOAfW4qfqcruQtVteyZUuUc4kKz5DrnqWHFSeGqe4z5jorbFKVmQ==
X-Received: by 2002:a05:6402:3594:: with SMTP id
 y20mr8774001edc.386.1644145659343; 
 Sun, 06 Feb 2022 03:07:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jt17sm2460007ejb.161.2022.02.06.03.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 03:07:38 -0800 (PST)
Message-ID: <d4610ab0-ae34-d1a1-3267-cb9578505dbd@mind.be>
Date: Sun, 6 Feb 2022 12:07:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20220206094504.11415-1-peter@korsgaard.com>
 <20220206094504.11415-2-peter@korsgaard.com>
 <89d065e4-5745-8b6a-4aed-d03b26c112f2@mind.be>
Organization: Essensium/Mind
In-Reply-To: <89d065e4-5745-8b6a-4aed-d03b26c112f2@mind.be>
Subject: Re: [Buildroot] [PATCH 2/2] package/avahi: add pygobject support,
 move to python3
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA2LzAyLzIwMjIgMTI6MDUsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAwNi8wMi8yMDIyIDEwOjQ1LCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4+IFRoZSBweXRob24g
c3VwcG9ydCBpbiBhdmFoaSBuZWVkcyBweWdvYmpldCB0byBkbyBhbnl0aGluZzoKPj4KPj4gQnVp
bGRpbmcgYXZhaGktcHl0aG9uOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vwqDCoCAoWW91
IG5lZWQgcHl0aG9uLCBweWdvYmplY3QgYW5kIAo+PiBweXRob24tZGJ1cyEpCj4KPiDCoFNvLCBk
b2Vzbid0IHRoYXQgbWVhbiB0aGF0Li4uCj4KPj4KPj4gU28gYWRkIG9wdGlvbmFsIHN1cHBvcnQg
Zm9yIGl0LsKgIFB5dGhvbi1nb2JqZWN0IGlzIG9ubHkgYXZhaWxhYmxlIGZvcgo+PiBweXRob24z
LCBzbyBjaGFuZ2UgdGhlIHB5dGhvbiBsb2dpYyB0byB1c2UgcHl0aG9uIDMuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KPj4gLS0tCj4+
IMKgIHBhY2thZ2UvYXZhaGkvYXZhaGkubWsgfCAyMiArKysrKysrKysrKysrKy0tLS0tLS0tCj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hdmFoaS9hdmFoaS5tayBiL3BhY2thZ2UvYXZhaGkvYXZh
aGkubWsKPj4gaW5kZXggMDRjNDE2NGFmNi4uMTk5MjY2OWE5MiAxMDA2NDQKPj4gLS0tIGEvcGFj
a2FnZS9hdmFoaS9hdmFoaS5tawo+PiArKysgYi9wYWNrYWdlL2F2YWhpL2F2YWhpLm1rCj4+IEBA
IC00MCw3ICs0MCw2IEBAIEFWQUhJX0NPTkZfT1BUUyA9IFwKPj4gwqDCoMKgwqDCoCAtLWRpc2Fi
bGUtZ3RrIFwKPj4gwqDCoMKgwqDCoCAtLWRpc2FibGUtZ3RrMyBcCj4+IMKgwqDCoMKgwqAgLS1k
aXNhYmxlLWdkYm0gXAo+PiAtwqDCoMKgIC0tZGlzYWJsZS1weWdvYmplY3QgXAo+PiDCoMKgwqDC
oMKgIC0tZGlzYWJsZS1tb25vIFwKPj4gwqDCoMKgwqDCoCAtLWRpc2FibGUtbW9ub2RvYyBcCj4+
IMKgwqDCoMKgwqAgLS1kaXNhYmxlLXN0YWNrLXByb3RlY3RvciBcCj4+IEBAIC0xMDQsMTYgKzEw
MywxNiBAQCBlbHNlCj4+IMKgIEFWQUhJX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtZ2xpYiAtLWRp
c2FibGUtZ29iamVjdAo+PiDCoCBlbmRpZgo+PiDCoCAtaWZlcSAoJChCUjJfUEFDS0FHRV9QWVRI
T04pLHkpCj4+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1BZVEhPTjMpLHkpCj4KPiAuLi4gdGhpcyBj
b25kaXRpb24gc2hvdWxkIGJlCj4KPiBpZmVxICgkKEJSMl9QQUNLQUdFX1BZVEhPTl9HT0JKRUNU
KSQoQlIyX1BBQ0tBR0VfUFlUSE9OX0RCVVNfTkVYVCkseXkpCj4KPiAocHl0aG9uMyBpcyBpbXBs
aWVkIGJ5IHB5dGhvbi1nb2JqZWN0KS4KPgo+IMKgSWYgd2hhdCBJJ20gc2F5aW5nIGlzIHRydWUs
IHRoZW4gYWN0dWFsbHkgSSdkIGdvIGEgYml0IGZ1cnRoZXIgdGhhbiB0aGF0IGFuZCBhZGQKPgo+
IMKgwqDCoMKgc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9EQlVTX05FWFQgaWYgQlIyX1BBQ0tB
R0VfUFlUSE9OX0dPQkpFQ1QKCiDCoEFjdHVhbGx5LCB3ZSBjb3VsZCBtYWtlIGl0CgoKIMKgwqDC
oCBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0dPQkpFQ1QgaWYgQlIyX1BBQ0tBR0VfUFlUSE9O
MyAmJiAKQlIyX1BBQ0tBR0VfR09CSkVDVF9JTlRST1NQRUNUSU9OCgogwqDCoMKgIHNlbGVjdCBC
UjJfUEFDS0FHRV9QWVRIT05fREJVU19ORVhUIGlmIEJSMl9QQUNLQUdFX1BZVEhPTjMgJiYgCkJS
Ml9QQUNLQUdFX0dPQkpFQ1RfSU5UUk9TUEVDVElPTgoKKHdpdGggcHJvYmFibHkgc29tZSBjb21t
ZW50IHRvIGV4cGxhaW4gd2h5IHRoZSB3ZWlyZCBkZXBlbmRlbmNpZXMpCgogwqBSZWdhcmRzLAog
wqBBcm5vdXQKCj4KPiB0byBDb25maWcuaW4uIEF1dG9tYXRpY2FsbHkgc2VsZWN0aW5nIHB5dGhv
bi1nb2JqZWN0IHdvdWxkIGdvIGEgbGl0dGxlIHRvbyBmYXIgCj4gc2luY2UgaXQgZGVwZW5kcyBv
biBnb2JqZWN0LWludHJvc3BlY3Rpb24gYW5kIHdlIHJlYWxseSBkb24ndCB3YW50IHRvIGVuYWJs
ZSAKPiB0aGF0IGJlYXN0IHVubGVzcyBpdCdzIHJlYWxseSBuZWVkZWQuLi4KPgo+IMKgUmVnYXJk
cywKPiDCoEFybm91dAo+Cj4+IMKgIEFWQUhJX0NPTkZfRU5WICs9IFwKPj4gLcKgwqDCoCBhbV9j
dl9wYXRobGVzc19QWVRIT049cHl0aG9uIFwKPj4gLcKgwqDCoCBhbV9jdl9weXRob25fdmVyc2lv
bj0kKFBZVEhPTl9WRVJTSU9OKSBcCj4+IC3CoMKgwqAgYW1fY3ZfcHl0aG9uX3BsYXRmb3JtPWxp
bnV4MiBcCj4+IC0gYW1fY3ZfcHl0aG9uX3B5dGhvbmRpcj0vdXNyL2xpYi9weXRob24kKFBZVEhP
Tl9WRVJTSU9OX01BSk9SKS9zaXRlLXBhY2thZ2VzIFwKPj4gLSBhbV9jdl9weXRob25fcHlleGVj
ZGlyPS91c3IvbGliL3B5dGhvbiQoUFlUSE9OX1ZFUlNJT05fTUFKT1IpL3NpdGUtcGFja2FnZXMg
XAo+PiArwqDCoMKgIGFtX2N2X3BhdGhsZXNzX1BZVEhPTj1weXRob24zIFwKPj4gK8KgwqDCoCBh
bV9jdl9weXRob25fdmVyc2lvbj0kKFBZVEhPTjNfVkVSU0lPTikgXAo+PiArwqDCoMKgIGFtX2N2
X3B5dGhvbl9wbGF0Zm9ybT1saW51eDUgXAo+PiArIGFtX2N2X3B5dGhvbl9weXRob25kaXI9L3Vz
ci9saWIvcHl0aG9uJChQWVRIT04zX1ZFUlNJT05fTUFKT1IpL3NpdGUtcGFja2FnZXMgXAo+PiAr
IGFtX2N2X3B5dGhvbl9weWV4ZWNkaXI9L3Vzci9saWIvcHl0aG9uJChQWVRIT04zX1ZFUlNJT05f
TUFKT1IpL3NpdGUtcGFja2FnZXMgXAo+PiDCoMKgwqDCoMKgIHB5X2N2X21vZF9zb2NrZXRfPXll
cwo+PiDCoCAtQVZBSElfREVQRU5ERU5DSUVTICs9IHB5dGhvbgo+PiArQVZBSElfREVQRU5ERU5D
SUVTICs9IHB5dGhvbjMKPj4gwqAgQVZBSElfQ09ORl9PUFRTICs9IC0tZW5hYmxlLXB5dGhvbgo+
PiDCoCBlbHNlCj4+IMKgIEFWQUhJX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtcHl0aG9uCj4+IEBA
IC0xMjcsNiArMTI2LDEzIEBAIGVsc2UKPj4gwqAgQVZBSElfQ09ORl9PUFRTICs9IC0tZGlzYWJs
ZS1weXRob24tZGJ1cwo+PiDCoCBlbmRpZgo+PiDCoCAraWZlcSAoJChCUjJfUEFDS0FHRV9QWVRI
T05fR09CSkVDVCkseSkKPj4gK0FWQUhJX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1weWdvYmplY3QK
Pj4gK0FWQUhJX0RFUEVOREVOQ0lFUyArPSBweXRob24tZ29iamVjdAo+PiArZWxzZQo+PiArQVZB
SElfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1weWdvYmplY3QKPj4gK2VuZGlmCj4+ICsKPj4gwqAg
QVZBSElfQ09ORl9FTlYgKz0gQ0ZMQUdTPSIkKEFWQUhJX0NGTEFHUykiCj4+IMKgIMKgIEFWQUhJ
X01BS0VfT1BUUyArPSBMSUJTPSQoVEFSR0VUX05MU19MSUJTKQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
