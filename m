Return-Path: <SRS0=5uHv=NX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC33C432BE
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 14:59:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D12A60BD3
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 14:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D12A60BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AD33613D8;
	Wed,  1 Sep 2021 14:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yv4ndECAN8sN; Wed,  1 Sep 2021 14:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F5BC613DD;
	Wed,  1 Sep 2021 14:59:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 575B81BF255
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 14:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 476944032F
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 14:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bbjB8vePzc4D for <buildroot@lists.busybox.net>;
 Wed,  1 Sep 2021 14:59:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC7EE401A2
 for <buildroot@buildroot.org>; Wed,  1 Sep 2021 14:59:20 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z19so4190629edi.9
 for <buildroot@buildroot.org>; Wed, 01 Sep 2021 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JueokpGlO/dK0XpN5H1RKYwHcelWv7gG/gug315MIxA=;
 b=Y3dwo8i+mBqdWGbPW2nxV6Ab5aULCi7mGHItg62fy0yWzSxWuiEx7Egdt5xK2rHslJ
 tofA+KIVCje4v35ncqYazKGa6MQvZYQB0TmIQiHN7C5VwttBHITVYiFzv9RyTAmUpQYF
 IwBNV0uQbj5Hp0mFyWv0LY16nE/f36xI9nt4RXmBos5y6bJ04ujjkL4P4YZwCA5uoLXu
 YKEfdlWdYcIKBBq87RjEWeIwZZ2Q4q1nSPJhGiqiLRD1o2Kgxge1ziBExj7gOfkFDwVY
 qWjcgN+531wUwkJz6TEaZmdXUj6lWqbN0mbOcRjsJq0I6H6K/mh335/JgqYwjsxmLbbv
 7xLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JueokpGlO/dK0XpN5H1RKYwHcelWv7gG/gug315MIxA=;
 b=gvPYQhkyGTlqiIJ4LowIs7cPB7B1HVHhb8B29qOBICjkZ6x1r+Jzf+9UIZBWklLsTj
 nEtXDT6p2e94fw4icnLaONA4gDN02yccRrwwvnjfGRh6MykCztduJoLhSva9TGcH3R+v
 ypvG6OUajQ/0iQUcRda3bCrFhfV8uA5T1osAIx6FWh5imwkuOSmAGU0btITX5k/4BGMR
 cYopReyrsWlJmZ2EuO5DELq8pC9NzqOgUuCBMHS1bBL2HTGiPYNrqSuMRwCKEe1oNLd6
 kHxiXECQy8nvEsizvpkhAPIeGJrAaDXDgY8W7jJwQWMQpXe4r/sKY5fYIzEfSy5tWtQI
 DmfA==
X-Gm-Message-State: AOAM533nivUIHeTOCa9nJtiDq6od/GtDhJdHfPOXjaCREZZSscF7ZvB8
 WKVM0gZhakIY1kZ3eVV+N4N7Cl+iC6SH0g==
X-Google-Smtp-Source: ABdhPJw6FuITn17fWzetzeNPZCEmWZymKXZf0fU8pzhpld+BAuOQOBEWkU31xlXJP6+zrxHLeOw4Rg==
X-Received: by 2002:aa7:d986:: with SMTP id u6mr49247eds.156.1630508358832;
 Wed, 01 Sep 2021 07:59:18 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e11sm63881edq.30.2021.09.01.07.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 07:59:18 -0700 (PDT)
To: Krzysztof Kanas <kkanas@fastmail.com>, buildroot@buildroot.org
References: <20210830201308.143849-1-kkanas@fastmail.com>
 <57f575c2-ba73-a1b1-6074-88b772d1207e@mind.be>
 <61d12e5e-db00-fc4f-4135-72d4aa926a68@fastmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <81d1492a-d3ce-fc45-4227-4b05c0aeb4a0@mind.be>
Date: Wed, 1 Sep 2021 16:59:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <61d12e5e-db00-fc4f-4135-72d4aa926a68@fastmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1]
 package/environment-setup/environment-setup: add zsh
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAwMS8wOS8yMDIxIDE2OjQ4LCBLcnp5c3p0b2YgS2FuYXMgd3JvdGU6Cj4gCj4gCj4gT24g
MDEvMDkvMjAyMSAxNToyNiwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4+Cj4+Cj4+IE9u
IDMwLzA4LzIwMjEgMjI6MTMsIEtyenlzenRvZiBLYW5hcyB3cm90ZToKPj4+IGVudmlyb25tZW50
LXNldHVwIHVzZWQgQkFTSF9TT1VSQ0Ugd2hpY2ggaXMgYmFzaCBzcGVjaWZpYyBhbmQgZW1wdHkK
Pj4+IHZhcmlhYmxlIGZvciB6c2ggKGFuZCBvdGhlciBzaGVsbCdzKS4KPj4+IFVzZSAkMCB3aGlj
aCBzaG91bGQgYmUgd29yayBhY3Jvc3MgbXVsdGlwbGUgc2hlbGxzKHRjc2gsIGRhc2gsIHpzaCkK
Pj4+IEl0IHdvbid0IHdvcmsgaWYgb3RoZXIgc2NyaXB0IGlzIHNvdXJjaW5nIGVudmlyb25tZW50
LXNldHVwLgo+Pgo+PiDCoCBUaGUgZW52aXJvbm1lbnQtc2V0dXAgaXMgc3VwcG9zZWQgdG8gYmUg
c291cmNlJ2QsIHNvIGhvdyBpcyB0aGlzIGV2ZXIgZ29pbmcgdG8KPj4gd29yaz8KPiBUaGlzIHNj
cmlwdCB3aWxsIHdvcmsgd2hlbiBzb3VyY2VkIGludGVyYWN0aXZlbHkgZnJvbSBiYXNoIHNoZWxs
IGR1ZSB0aGUgdGVzdAo+IGZvciAke0JBU0hfU09VUkNFfSBzbyB0aGlzIGJlaGF2aW9yIGlzIG5v
dCBjaGFuZ2VkLgo+IAo+IFdoYXQgSSBtZWFudCBieSB0aGlzIHBhcmFncmFwaCB3YXMgaG93IGRp
ZmZlcmVudCBzaGVsbCdzIHNldCAkMCBhdWdtZW50IHdoZXRoZXIKPiBzY3JpcHQgaXMgc291cmNl
ZCBpbnRlcmFjdGl2ZWx5IG9yIHNvdXJjZWQgZnJvbSBhbm90aGVyIHNjcmlwdCwgZS5nOgo+IGNh
dCA+IGZvby5zaAo+IHNvdXJjZSBlbnZpcm9ubWVudC1zZXR1cAo+IF5ECj4gCj4gQnV0IEkgbWlz
c2VkIGNhc2Ugd2hlbiBlbnZpcm9ubWVudC1zZXR1cCBpcyBzb3VyY2VkIGZyb20gYW5vdGhlciBk
aXJlY3RvcnksCj4gbHVja3kgdGhpcyB3b3JrcyBpbiB6c2ggY2FzZSwgYnV0IG5vdCBpbiBjYXNl
IG9mIGRhc2gsIGtzaC4KPiBTbyB0aGUgZml4IHdvdWxkIGJlIGFwcGxpY2FibGUgdG8genNoIG9u
bHkgKGFjdHVhbGx5IG15IG1haW4gcHVycG9zZSBmb3IgdGhlCj4gcGF0Y2gpLgo+IAo+Pgo+PiDC
oCBJIHRoaW5rIHRoZSBvbmx5IHZpYWJsZSBzb2x1dGlvbiBpcyB0byByZXF1aXJlIGFuIGFyZ3Vt
ZW50IGlmIHNoZWxsIGlzIG5vdAo+PiBiYXNoLgo+IFNvIHlvdSBhcmUgdGhpbmtpbmcgb2YKPiBp
ZiBbICRTSEVMTCAhPSBiYXNoIF0gOyB0aGVuID8KCiBJIHdhcyB0aGlua2luZyBvZiB5b3VyIGlm
IFsgeCIke0JBU0hfU09VUkNFfSIgIT0geCIiIF0KCiBSZWdhcmRzLAogQXJub3V0Cgo+IEkgZG9u
J3Qga25vdyBpZiB0aGF0IHdpbGwgYmUgZWFzeS9wb3J0YWJsZSB0byBkb8KgIGIvYyBydW5uaW5n
LAo+IAo+IHpzaAo+IGJhc2gKPiBlbnZ8Z3JlcCBTSEVMTAo+IFNIRUxMPS9iaW4venNoCj4gWFRF
Uk1fU0hFTEw9L2Jpbi96c2gKPiAKPj4KPj4gwqAgUmVnYXJkcywKPj4gwqAgQXJub3V0Cj4+Cj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEthbmFzIDxra2FuYXNAZmFzdG1haWwuY29t
Pgo+Pj4gLS0tCj4+PiDCoCBwYWNrYWdlL2Vudmlyb25tZW50LXNldHVwL2Vudmlyb25tZW50LXNl
dHVwIHwgNiArKysrKy0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9lbnZpcm9ubWVudC1zZXR1
cC9lbnZpcm9ubWVudC1zZXR1cAo+Pj4gYi9wYWNrYWdlL2Vudmlyb25tZW50LXNldHVwL2Vudmly
b25tZW50LXNldHVwCj4+PiBpbmRleCBlOWJjMzZmZGQwOTMuLjJiNTRlODhkNjY4OSAxMDA2NDQK
Pj4+IC0tLSBhL3BhY2thZ2UvZW52aXJvbm1lbnQtc2V0dXAvZW52aXJvbm1lbnQtc2V0dXAKPj4+
ICsrKyBiL3BhY2thZ2UvZW52aXJvbm1lbnQtc2V0dXAvZW52aXJvbm1lbnQtc2V0dXAKPj4+IEBA
IC0xNiw0ICsxNiw4IEBAIFNvbWUgdGlwczoKPj4+IMKgICogVG8gYnVpbGQgQ01ha2UtYmFzZWQg
cHJvamVjdHMsIHVzZSB0aGUgImNtYWtlIiBhbGlhcwo+Pj4gwqAgwqAgRU9GCj4+PiAtU0RLX1BB
VEg9JChkaXJuYW1lICQocmVhbHBhdGggIiR7QkFTSF9TT1VSQ0VbMF19IikpCj4+PiAraWYgWyB4
IiR7QkFTSF9TT1VSQ0V9IiAhPSB4IiIgXTsgdGhlbgo+Pj4gK8KgwqDCoMKgwqDCoMKgIFNES19Q
QVRIPSQoZGlybmFtZSAkKHJlYWxwYXRoICIke0JBU0hfU09VUkNFWzBdfSIpKQo+Pj4gK2Vsc2UK
Pj4+ICvCoMKgwqAgU0RLX1BBVEg9JChkaXJuYW1lICQocmVhbHBhdGggJDApKQo+Pj4gK2ZpCj4+
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJv
eC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
