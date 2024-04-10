Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C866CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 08:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEF1C6071A;
	Wed, 10 Apr 2024 08:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BnvpLNp_csQM; Wed, 10 Apr 2024 08:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8C1C60761
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8C1C60761;
	Wed, 10 Apr 2024 08:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 446B71BF3AF
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 08:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E57A60761
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 08:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnXWkZHD-0YB for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 08:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DFE186071A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFE186071A
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFE186071A
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 08:06:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3465921600dso572095f8f.3
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 01:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712736371; x=1713341171;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1rulsFjz/s4H4oQ3yJ8OQnSlcv0/ywUmUahmBFwygMo=;
 b=VLuLjefb09xmyw6C+2qw+wOA01JFM8hoS+3Nl2v8h3XVTj6HSSr8H/uMYQoH3+8d/W
 +XoPu5v4QaCjXJ8ngyDjjC/PxvEVdDtX1OsPzorTsw5OBC6NaTkFp0RzAELd21IpbHTu
 xYVdxKHkMzdbs7pN3dixLXYCcauSszz906lWbD0TYYDb86NU5rQIWQZdkTEYYlnIDdQv
 FAcveCXKZhWyIjZd00KQONQtpxEVd6FV1DzjrmDPd+R5f77p7vQL3jPMSmXuzOMqG4aj
 obmjkw+rWuOaK/0/dBYIevW1UM4BjGkaIvPheR0MSpTNpBTrJjVD5yh1TIVEfYTXBr7d
 29gg==
X-Gm-Message-State: AOJu0YzQH8d0/zB5/8t1Qg27gwwpj6CahnTe5NrsBorZgwjjcUVT++DV
 G8ISMVnjmkiGjgrB/l17CAHnB9/BONnojNK08l6meyRX6QBosWN578C7IgyYWSt38u+4FIhkeCo
 O
X-Google-Smtp-Source: AGHT+IHuveicg8W31WMuihNhCg9C4mhsbcSUwf3jP1vCDd7Yhkfz9MIgVjH7Jtg94Vat0/s4/u0SDA==
X-Received: by 2002:adf:fd42:0:b0:346:41a8:2ac5 with SMTP id
 h2-20020adffd42000000b0034641a82ac5mr1153954wrs.60.1712736371281; 
 Wed, 10 Apr 2024 01:06:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a056000111100b0034658db39d7sm1513969wrw.8.2024.04.10.01.06.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 01:06:10 -0700 (PDT)
Message-ID: <f76b797d-b9f3-4a40-bc99-8ef057b9aaeb@mind.be>
Date: Wed, 10 Apr 2024 10:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240305070452.183573-1-karthikeyan@linumiz.com>
 <9b60fd4d-7a0e-47da-a37a-9690b4ac84db@mind.be>
 <20240407203807.GB13509@Apollo>
Content-Language: en-GB
In-Reply-To: <20240407203807.GB13509@Apollo>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712736371; x=1713341171; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1rulsFjz/s4H4oQ3yJ8OQnSlcv0/ywUmUahmBFwygMo=;
 b=X6MDlMUtdwLLbu7TdVYNAhRm3wAKDKU1vKgN463SDlan1m3Z0Ap7i+GiwOXgx2D2/e
 knF+tzOWYTxKYaHNdIsTULAn4lVFe/9A0J0XlxUrwOjuz6jEcQrfoJRc58tCSzGqKRGb
 rlmYT0NfwNhG6bsjHsUxYO9KyMErZ5RQSLBz0czJi3xyvVCWZkjwUweCmHiGozOiGM1B
 rOKvpcDEka3fUajJFQIjAuSB/Jh/m0jQEFp144zAfBWEITlGlbXDozZQWLNm8TvrGuPQ
 f40U4uDhCgclFKiUpvkIQhLTwYMEND6ZjUI4FyWw4V0NcM92RnQfZ5Fc9ECqxfxJy6yX
 b/Hg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=X6MDlMUt
Subject: Re: [Buildroot] [PATCH] package: linux-firmware: update linux fw
 bluetooth package for rtl88xx
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNy8wNC8yMDI0IDIyOjM4LCBHZXJvIFNjaHfDpHJpY2tlIHdyb3RlOgo+IE9uIFN1biwg
QXByIDA3LCAyMDI0IGF0IDA1OjUwOjUwUE0gKzAyMDAsIEFybm91dCBWYW5kZWNhcHBlbGxlIHZp
YSBidWlsZHJvb3Qgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDA1LzAzLzIwMjQgMDg6MDQsIEthcnRoaWtl
eWFuIEtyaXNobmFzYW15IHdyb3RlOgo+Pj4gYWRkIHJlYWx0ZWsgODgyMWNzIGJsdWV0b290aCBm
aXJtd2FyZSBpbiBsaW51eCBmaXJtd2FyZSBwYWNrYWdlLAo+Pj4gQlIyX1BBQ0tBR0VfTElOVVhf
RklSTVdBUkVfUlRMXzg4WFhfQlQgY29uZmlnIGZvciByZWFsdGVrIDg4eHggZmFtaWx5LAo+Pj4g
bm90IGRldmljZSBzcGVjaWZpYyBjb25maWcgdG8gZW5hYmxlLCBhZGQgZncncyBpbiByZWFsdGVr
IDg4eHggZmFtaWx5Cj4+PiBpbiBidWlsZCBpbnN0ZWFkIG9mIGFkZGluZyB0aGVtIHNlcGFyYXRl
bHkuCj4+Cj4+ICAgSSByZXdvcmRlZCB0aGlzIGFzIGZvbGxvd3MuCj4+Cj4+ICAgICAgcGFja2Fn
ZS9saW51eC1maXJtd2FyZTogUlRMXzg4WFhfQlQ6IGluc3RhbGwgYWxsIGZpcm13YXJlCj4+Cj4+
ICAgICAgSW5zdGVhZCBvZiBlbnVtZXJhdGluZyBlYWNoIGJpbmFyeSwgd2hpY2ggaXMgY3VtYmVy
c29tZSBhbmQgbWF5IG1pc3MKPj4gICAgICBzb21lIG9mIHRoZW0sIHNpbXBseSBpbnN0YWxsIGFs
bCBiaW5hcmllcyBzdGFydGluZyB3aXRoIHJ0bDg4Lgo+Pgo+Pgo+PiAgIEFwcGxpZWQgdG8gbWFz
dGVyLCB0aGFua3MuCj4+Cj4+ICAgUmVnYXJkcywKPj4gICBBcm5vdXQKPiAKPiBIaSwKPiAKPiBq
dXN0IHNhdyB0aGlzIGNvbW1pdC4gSW4gZWZmZWN0IGl0IGFkZGVkIG5ldyBmaXJtd2FyZSBibG9i
cyBmb3IKPiBydGw4ODIxY3MgYW5kIHJ0bDg4NTJidHUsIGJ1dCBhbHNvIHJlbW92ZWQgb25lIGZv
ciBydGw4ODUyY3UsIHdhcyB0aGlzCj4gaW50ZW50aW9uYWw/Cj4gCj4gICAgJCBkaWZmIG9sZCBu
ZXcKPiAgICA0YTUsNgo+ICAgID4gcnRsODgyMWNzX2NvbmZpZy5iaW4KPiAgICA+IHJ0bDg4MjFj
c19mdy5iaW4KPiAgICAxNGExNywxOAo+ICAgID4gcnRsODg1MmJ0dV9jb25maWcuYmluCj4gICAg
PiBydGw4ODUyYnR1X2Z3LmJpbgoKICBUaGlzIGlzIHRoZSBwdXJwb3NlIG9mIHRoZSBwYXRjaC4K
Cj4gICAgMThkMjEKPiAgICA8IHJ0bDg4NTJjdV9md192Mi5iaW4KCiAgVGhpcyBpcyBkZWZpbml0
ZWx5IG5vdCBpbnRlbnRpb25hbC4gSSBjbGVhcmx5IGRpZG4ndCB0ZXN0IHRoZSBwYXRjaCBlbm91
Z2ggCmJlZm9yZSBhcHBseWluZyA6LSgKCiAgQ2FyZSB0byBzZW5kIGEgZml4PyAgSSB0aGluayB0
aGUgZWFzaWVzdCBpcyB0byBjaGFuZ2UgdGhlIHBhdHRlcm4gdG8gCnJ0bDg4Ki5iaW4sIGJ1dCBp
dCBuZWVkcyB0byBiZSB2ZXJpZmllZC4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gQmVzdCwK
PiBHZXJvCj4gCj4+Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogS2FydGhpa2V5YW4gS3Jpc2huYXNh
bXkgPGthcnRoaWtleWFuQGxpbnVtaXouY29tPgo+Pj4gLS0tCj4+PiAgICBwYWNrYWdlL2xpbnV4
LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIHwgMTEgKy0tLS0tLS0tLS0KPj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTAgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsgYi9wYWNrYWdl
L2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rCj4+PiBpbmRleCA2MGU4ODYxYWJlLi43
ZTFlNWNmNmYyIDEwMDY0NAo+Pj4gLS0tIGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZS5tawo+Pj4gKysrIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZS5tawo+Pj4gQEAgLTkwLDE2ICs5MCw3IEBAIGVuZGlmCj4+PiAgICAjIFJlYWx0ZWsgODh4eCBC
bHVldG9vdGgKPj4+ICAgIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfUlRMXzg4
WFhfQlQpLHkpCj4+PiAgICBMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBcCj4+PiAtCXJ0bF9idC9y
dGw4ODEyYWVfZncuYmluIHJ0bF9idC9ydGw4ODIxYV9mdy5iaW4gXAo+Pj4gLQlydGxfYnQvcnRs
ODgyMWNfY29uZmlnLmJpbiBydGxfYnQvcnRsODgyMWNfZncuYmluIFwKPj4+IC0JcnRsX2J0L3J0
bDg4MjJiX2NvbmZpZy5iaW4gcnRsX2J0L3J0bDg4MjJiX2Z3LmJpbiBcCj4+PiAtCXJ0bF9idC9y
dGw4ODIyY3NfY29uZmlnLmJpbiBydGxfYnQvcnRsODgyMmNzX2Z3LmJpbiBcCj4+PiAtCXJ0bF9i
dC9ydGw4ODIyY3VfY29uZmlnLmJpbiBydGxfYnQvcnRsODgyMmN1X2Z3LmJpbiBcCj4+PiAtCXJ0
bF9idC9ydGw4ODUxYnVfZncuYmluIHJ0bF9idC9ydGw4ODUxYnVfY29uZmlnLmJpbiBcCj4+PiAt
CXJ0bF9idC9ydGw4ODUyYXVfZncuYmluIHJ0bF9idC9ydGw4ODUyYXVfY29uZmlnLmJpbiBcCj4+
PiAtCXJ0bF9idC9ydGw4ODUyYnVfZncuYmluIHJ0bF9idC9ydGw4ODUyYnVfY29uZmlnLmJpbiBc
Cj4+PiAtCXJ0bF9idC9ydGw4ODUyY3VfZncuYmluIHJ0bF9idC9ydGw4ODUyY3VfY29uZmlnLmJp
biBcCj4+PiAtCXJ0bF9idC9ydGw4ODUyY3VfZndfdjIuYmluCj4+PiArCXJ0bF9idC9ydGw4OCpf
ZncuYmluIHJ0bF9idC9ydGw4OCpfY29uZmlnLmJpbgo+Pj4gICAgTElOVVhfRklSTVdBUkVfQUxM
X0xJQ0VOU0VfRklMRVMgKz0gTElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dAo+Pj4gICAgZW5k
aWYKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
