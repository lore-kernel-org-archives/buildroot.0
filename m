Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0F5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:04:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EA866101C
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EA866101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D691B80D2E;
	Mon, 25 Oct 2021 19:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U3Huf9gi4d1R; Mon, 25 Oct 2021 19:04:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B10E80D25;
	Mon, 25 Oct 2021 19:04:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BD651BF309
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFE0060719
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jWwsdyA2MhJO for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:04:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8FD8605AD
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:04:48 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id j10so3658534eds.12
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fBm6pynDw8/Ru8ngSsBC0sVvDMDbxoQtYl91n7BuS4M=;
 b=HF36RGn81Zpwi87zwYWuPzb/yavSv7jph0FGNLxAOP6CDo5JuNv5ZY0a0XY7MP60dw
 jqmDNVrC/egdqZDEJ0J0R4Vf/3+Y6GItztJ42eDmQhOz/RPqGHpmYVT1nsGoQGG6vMst
 3pjO0ae+RAIKB7cpWsOAO1clGbGQTpxZr4wbc9bndYx7xFHR3fTBut9UosKDtwPQSoFg
 0E+VIqtQgRqUVW3Cv+FyR9hF/oOfkaN8qdxRWNzF2LW7RxFzFvAzsOUzQpcR3DWsyCTb
 RsJGqzj+Ib66gnBSRy3hybGnn9ghLe6cm0MRWZjPKXRfx4mIUxasj0zYVqSYhGLu4ScU
 VAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fBm6pynDw8/Ru8ngSsBC0sVvDMDbxoQtYl91n7BuS4M=;
 b=gRyFDBWsN76UX7V5txKMPxvQnGN3un+QO5CfbalSTAphio0dklqrUZhXWUI+Sxp/IN
 8IukmvUK4aJ1RgKcCoUkUsf9oCufowYHxSagnwH//XBnfzO/byz2L/KLBnd9T1naao64
 T4keIt2AVH55wraDDHivvEVfOHfWI2L7d17oorBjCJN78nPFGRtavJEWYMdAgaZ38utt
 satBpqJTOYeUpXi5y6pHHYhqWLg63AIg1Lzf8sltN0z5uD/yzARUMCUqw4dkW54W8RSw
 5k4duEgRVP2pYS0BWh7ZlTMIpu3I4kr80ZzL0HxVkM8ovsGbgPQsw8P/rNbb8Ct9Zaag
 Z6/A==
X-Gm-Message-State: AOAM530Om0u73foXRhcgHBF6rQQ+XhiHNonRHwI2nPhq/+t0XprNIt8m
 Vbfa6avlaXG+KIX0WgHxqhCaJw==
X-Google-Smtp-Source: ABdhPJyU7CxZe9NlKODoJXCuFPZKmqok01ZfATAhou+0+PaXxVmbr/IRRCZzWuzYLWA6r2LRTNF5DQ==
X-Received: by 2002:a17:906:cb84:: with SMTP id
 mf4mr24295214ejb.33.1635188687228; 
 Mon, 25 Oct 2021 12:04:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u16sm7877618ejy.16.2021.10.25.12.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 12:04:46 -0700 (PDT)
Message-ID: <32321bc9-9b5c-7e79-ec42-ecbb7d586225@mind.be>
Date: Mon, 25 Oct 2021 21:04:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211014213025.66942-1-fontaine.fabrice@gmail.com>
 <CAFOYHZBqBW_zGnUkpYyS+WzvZrFSvN=DfFwEhN6PhadS2oqSQA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAFOYHZBqBW_zGnUkpYyS+WzvZrFSvN=DfFwEhN6PhadS2oqSQA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/micropython: depends on
 host-python3
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNS8xMC8yMDIxIDA5OjIyLCBDaHJpcyBQYWNraGFtIHdyb3RlOgo+IAo+IAo+IE9uIEZy
aSwgMTUgT2N0IDIwMjEsIDEwOjMyIEFNIEZhYnJpY2UgRm9udGFpbmUsIDxmb250YWluZS5mYWJy
aWNlQGdtYWlsLmNvbSAKPiA8bWFpbHRvOmZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPj4gd3Jv
dGU6Cj4gCj4gICAgIFJlcGxhY2UgQlIyX1BZVEhPTjNfSE9TVF9ERVBFTkRFTkNZIGJ5IGhvc3Qt
cHl0aG9uMyB0byBhdm9pZCB0aGUKPiAgICAgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFpc2Vk
IHNpbmNlIGJ1bXAgdG8gdmVyc2lvbiAxLjE3IGluIGNvbW1pdAo+ICAgICAzMmIyYTAzNzQ1Nzg1
YWZlYjQ5Njk3OWFhM2MwZjY1NGJjNjA2M2NlOgo+IAo+ICAgICBUcmFjZWJhY2sgKG1vc3QgcmVj
ZW50IGNhbGwgbGFzdCk6Cj4gICAgICDCoCBGaWxlICIuLi9weS9tYWtldmVyc2lvbmhkci5weSIs
IGxpbmUgMTE3LCBpbiA8bW9kdWxlPgo+ICAgICAgwqAgwqAgbWFrZV92ZXJzaW9uX2hlYWRlcihz
eXMuYXJndlsxXSkKPiAgICAgIMKgIEZpbGUgIi4uL3B5L21ha2V2ZXJzaW9uaGRyLnB5IiwgbGlu
ZSA3OSwgaW4gbWFrZV92ZXJzaW9uX2hlYWRlcgo+ICAgICAgwqAgwqAgaW5mbyA9IGdldF92ZXJz
aW9uX2luZm9fZnJvbV9kb2NzX2NvbmYoKQo+ICAgICAgwqAgRmlsZSAiLi4vcHkvbWFrZXZlcnNp
b25oZHIucHkiLCBsaW5lIDY3LCBpbiBnZXRfdmVyc2lvbl9pbmZvX2Zyb21fZG9jc19jb25mCj4g
ICAgICDCoCDCoCBmb3IgbGluZSBpbiBmOgo+ICAgICAgwqAgRmlsZSAiL3Vzci9saWIvcHl0aG9u
My41L2VuY29kaW5ncy9hc2NpaS5weSIsIGxpbmUgMjYsIGluIGRlY29kZQo+ICAgICAgwqAgwqAg
cmV0dXJuIGNvZGVjcy5hc2NpaV9kZWNvZGUoaW5wdXQsIHNlbGYuZXJyb3JzKVswXQo+ICAgICBV
bmljb2RlRGVjb2RlRXJyb3I6ICdhc2NpaScgY29kZWMgY2FuJ3QgZGVjb2RlIGJ5dGUgMHhjMiBp
biBwb3NpdGlvbiAyMTU0Ogo+ICAgICBvcmRpbmFsIG5vdCBpbiByYW5nZSgxMjgpCj4gCj4gICAg
IEluZGVlZCwgdGhpcyBidWlsZCBmYWlsdXJlIGlzIG5vdCByZXByb2R1Y2VkIGJ5IGhvc3QtcHl0
aG9uMyAoaW4gdmVyc2lvbgo+ICAgICAzLjkuNykgc28gaXQgaXMgcHJvYmFibHkgYW4gaXNzdWUg
d2l0aCBweXRob24gMy41ICh3aGljaCBpcyA2LXllYXJzIG9sZCkuCj4gCj4gICAgIEZpeGVzOgo+
ICAgICAgwqAtCj4gICAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzk2
ZjdiODFmNWQxNDcxNWIwYjY2NzNhODAxNmEzMWU5ZTE1NTJkMGIKPiAgICAgPGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzk2ZjdiODFmNWQxNDcxNWIwYjY2NzNhODAxNmEz
MWU5ZTE1NTJkMGI+Cj4gCj4gICAgIFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tCj4gICAgIDxtYWlsdG86Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+Pgo+IAo+IAo+IFRoYW5rcywgSSdkIHNlZW4gdGhlIGZhaWx1cmVzIGJ1dCBiZWVu
IHVuYWJsZSB0byByZXByb2R1Y2UgdGhlbS4gSSBmaWd1cmVkIGl0IAo+IHdhcyBzb21ldGhpbmcg
dG8gZG8gd2l0aCB0aGUgcHl0aG9uIGluc3RhbGxhdGlvbiBvbiB0aGUgYnVpbGRlcnMgYnV0IGhh
ZG4ndCBiZWVuIAo+IGFibGUgdG8gZGlnIGludG8gaXQuCj4gCj4gSXQncyBhIHBpdHkgd2UncmUg
bm93IGZvcmNpbmcgdGhlIGJ1aWxkaW5nIG9mIHB5dGhvbiBidXQgSSBjYW4ndCB0aGluayBvZiBh
IAo+IGJldHRlciBhbHRlcm5hdGl2ZS4KCiAgQSBiZXR0ZXIgYWx0ZXJuYXRpdmUgd291bGQgYmUg
dG8gc2V0IHRoZSBlbmNvZGluZyB0byBVVEYtOC4KCiAgQW5vdGhlciBzb2x1dGlvbiB3b3VsZCBi
ZSB0byBidW1wIHRoZSBtaW5pbXVtIHB5dGhvbjMgdG8gMy42IG9yIHdoYXRldmVyIGlzIApuZWVk
ZWQgdG8gbWFrZSBpdCB3b3JrLgoKICBCdXQgSSBhcHBsaWVkIHRoaXMgcGF0Y2ggdG8gbWFzdGVy
IGFueXdheS4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gUmV2aWV3ZWQtYnk6IENocmlzIFBh
Y2toYW0gPGp1ZGdlLnBhY2toYW1AZ21haWwuY29tIAo+IDxtYWlsdG86anVkZ2UucGFja2hhbUBn
bWFpbC5jb20+Pgo+IAo+ICAgICAtLS0KPiAgICAgIMKgcGFja2FnZS9taWNyb3B5dGhvbi9taWNy
b3B5dGhvbi5tayA8aHR0cDovL21pY3JvcHl0aG9uLm1rPiB8IDIgKy0KPiAgICAgIMKgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gICAgIGRpZmYgLS1n
aXQgYS9wYWNrYWdlL21pY3JvcHl0aG9uL21pY3JvcHl0aG9uLm1rIDxodHRwOi8vbWljcm9weXRo
b24ubWs+Cj4gICAgIGIvcGFja2FnZS9taWNyb3B5dGhvbi9taWNyb3B5dGhvbi5tayA8aHR0cDov
L21pY3JvcHl0aG9uLm1rPgo+ICAgICBpbmRleCAzZDY5ZTE1MmU1Li5jNDljYTIzNDQ5IDEwMDY0
NAo+ICAgICAtLS0gYS9wYWNrYWdlL21pY3JvcHl0aG9uL21pY3JvcHl0aG9uLm1rIDxodHRwOi8v
bWljcm9weXRob24ubWs+Cj4gICAgICsrKyBiL3BhY2thZ2UvbWljcm9weXRob24vbWljcm9weXRo
b24ubWsgPGh0dHA6Ly9taWNyb3B5dGhvbi5taz4KPiAgICAgQEAgLTExLDcgKzExLDcgQEAgTUlD
Uk9QWVRIT05fU0lURSA9ICQoY2FsbAo+ICAgICBnaXRodWIsbWljcm9weXRob24sbWljcm9weXRo
b24sdiQoTUlDUk9QWVRIT05fVkVSU0lPTikKPiAgICAgIMKgIyBhbmQgbW9zdCBvZiB0aGUgY29w
aWVkIGNvZGUgaXMgbm90IHVzZWQgaW4gdGhlIHVuaXggYnVpbGQuCj4gICAgICDCoE1JQ1JPUFlU
SE9OX0xJQ0VOU0UgPSBNSVQsIEJTRC0xLWNsYXVzZSwgQlNELTMtY2xhdXNlLCBabGliCj4gICAg
ICDCoE1JQ1JPUFlUSE9OX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gICAgIC1NSUNST1BZVEhP
Tl9ERVBFTkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYgbGliZmZpICQoQlIyX1BZVEhPTjNfSE9TVF9E
RVBFTkRFTkNZKQo+ICAgICArTUlDUk9QWVRIT05fREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25m
IGxpYmZmaSBob3N0LXB5dGhvbjMKPiAKPiAgICAgIMKgIyBTZXQgR0lUX0RJUiBzbyBwYWNrYWdl
IHdvbid0IHVzZSBidWlsZHJvb3QncyB2ZXJzaW9uIG51bWJlcgo+ICAgICAgwqBNSUNST1BZVEhP
Tl9NQUtFX0VOViA9IFwKPiAgICAgLS0gCj4gICAgIDIuMzMuMAo+IAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
