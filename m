Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A757C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:01:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A79AB61212
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A79AB61212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 599A64074C;
	Wed, 20 Oct 2021 12:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SClqDBUbS7On; Wed, 20 Oct 2021 12:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0103404F6;
	Wed, 20 Oct 2021 12:01:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5AD2B1BF2C9
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A7E860C10
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8engkm_ILnAo for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 12:01:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CD6A60784
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 12:01:24 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r4so18269425edi.5
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 05:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=MwHd1uXka4EsS1GuvVN0f/WQpHH3eQg0iG9j3N/xviA=;
 b=FZEeZrG9CURrBXk03S8F9iM5pbOHf6z8GzUgk+m3LN0iA8OWN46NySRe5Dr1zSPIss
 rqHS49Vq2EEK5T+WQUzYgufnT5a+0Zy0dxrIq639Ty5GM2xr/mJNJpNTBUuAUnmBt6Pc
 QYN0tscFXEDAGO8IVUYPc0HXZiYgsqY2Tui2DolxKn/Pk5UKOuigMYVo8dL7NhoJqB0L
 aLpF3B9kBXCrsfWpLxBbc9E9A0SuT1VGD0g2IYnLSZ0Ep51rypvrumc4BoeFlbvOvjyH
 AqfjDM56PPNaq9t5aURnKPkXfF43p+Pi91LFEe3QUJL0mFckBIOLR0Q28AtrrcG7KRby
 So/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MwHd1uXka4EsS1GuvVN0f/WQpHH3eQg0iG9j3N/xviA=;
 b=7d8kTmxcryMifugaxVQC5WNsRlJkmCUI9pvnB5CnKetHMuk9omrzYU4qiMDAwWGYRo
 HeIvcCXcPNgR6f4YHtXdjsuiLS5V8kqX2HZqtsn/aoJ8/655huyMIssppKO1JjUBvdzI
 /uex/Dx6tMFkkqoWj1W1q87+E55pCdB97GFfPkF6vCVWVJrIKFKR61XNVByJnUd2+dHZ
 ZmxMkqKR3oMLqrF2tvcR9rr9nylA+bd50xgC3+URTWIrdA57Q2tuoPB8p6wWYQHIN3aE
 oNbIy9RLYY8jrmaAzUuI9q9H4w+9sQZU4rIJZAjSZXlnX6QdrEy1CIFNMBa9uN56Q63V
 vvyg==
X-Gm-Message-State: AOAM5339VWXryIPy5scN25K1Dp/eQATMLBR7ueTAgImJyE/gZnpdbr9C
 YWLvvuJc3NuA0AKNfvjrhZv/rG5ndJUyrytn
X-Google-Smtp-Source: ABdhPJyze/qSszcp7CrlfVOXyxBmokpsYyLzXYbJfktXITf53I7tltqXFRhWuoQJXgDLcHIMb+X/Zg==
X-Received: by 2002:a17:907:7703:: with SMTP id
 kw3mr46017982ejc.34.1634731270406; 
 Wed, 20 Oct 2021 05:01:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i4sm1075822edt.29.2021.10.20.05.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 05:01:09 -0700 (PDT)
Message-ID: <e9c4ad82-8cdd-9c17-6d77-8ebf2449fb37@mind.be>
Date: Wed, 20 Oct 2021 14:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Steve <sleepy_dog@gmx.de>, buildroot@buildroot.org
References: <trinity-007290bc-de5f-4ff6-86dc-7caa998c06c5-1634729803292@3c-app-gmx-bap28>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <trinity-007290bc-de5f-4ff6-86dc-7caa998c06c5-1634729803292@3c-app-gmx-bap28>
Subject: Re: [Buildroot] openssh - kernel messages upon connection attempts
 (always ending with "connection reset" at the other end)
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

CgpPbiAyMC8xMC8yMDIxIDEzOjM2LCBTdGV2ZSB3cm90ZToKPiBIZWxsbyBhbGwsCj4gCj4gSSBy
ZWNlbnRseSBkb3dubG9hZGVkIGJ1aWxkcm9vdCBhbmQgdXNlZCB0aGUgZGVmYXVsdCBjb25maWcg
Zm9yIFJhc3BlcnJ5UGkzLCAKPiBhbHRlcmVkIHRvIGFkZCBvcGVuc3NoLCBhbW9uZyBhIGNvdXBs
ZSBvdGhlciB0aGluZ3MuCj4gKG5vIGlkZWEgd2hldGhlciB0aGF0IG1hdHRlcnMsIEkgYW0gdXNp
bmcgYSBVU0IgY29ubmVjdGlvbiBmcm9tIHRoZSByYXNwaSAKPiBydW5uaW5nIGdfY2RjIGRyaXZl
ciAoZXRoZXJuZXQgKyBzZXJpYWwgZ2FkZ2V0KSwgYW5kIGFtIHRyeWluZyB0byBzc2ggaW50byBp
dCAKPiBmcm9tIHRoZSBVU0IgaG9zdCBjb21wdXRlciB0aGUgcmFzcGkgaXMgcGx1Z2dlZCBpbnRv
KQo+IAo+IEkgaGF2ZSBmb3VuZCB0aGF0IHJvb3Qgc3NoJ2luZyBpbnRvIHRoZSBtYWNoaW5lIGlz
IG9mZiBieSBkZWZhdWx0LiBTbyBJIGFsdGVyZWQgCj4gdGhlIHNzaGRfY29uZmlnIHRvLCBmb3Ig
bm93LCBzYXkgeWVzIHRvIFBlcm1pdFJvb3RMb2dpbi4gKEknbGwgbG9vayBpbnRvIGhvdyB0byAK
PiBhZGQgYSBub24tcm9vdCB1c2VyIGxhdGVyIC0gYnV0IHRoaXMgaGVyZSAqc2hvdWxkKiBub3Jt
YWxseSB3b3JrLCByaWdodD8gVU5sZXNzIAo+IHNvbWV0aGluZyBpcyBicm9rZW4pCj4gU3RpbGws
IG9uIHRoZSBjb21wdXRlciB0aGF0IHRyaWVzIHRvIFNTSCBpbnRvIHRoZSBidWlsZHJvb3QgcmFz
cGksIEkgZ2V0IAo+ICJjb25uZWN0aW9uIHJlc2V0IiBpbW1lZGlhdGVseS4KPiAKPiBUaGVyZSBp
cyBhIGtlcm5lbCBtZXNzYWdlIGZvciBlYWNoIHN1Y2ggYXR0ZW1wdDoKPiAgwqAgImF1ZGl0OiB0
eXBlPTEzMjYgYXVkaXQgKHRpbWUuLi4pIGF1aWQ9Li4uIHVpZD0xMDAwIGdpZD0xMDAwIHNlcz0u
Li4gcGlkPS4uLiAKPiBjb21tPSJzc2hkIiBleGU9Ii91c3Ivc2Jpbi9zc2hkIiBzaWc9MzEgYXJj
aD00MDAwMDAyOCBzeXNjYWxsPTQxMyBjb21wYXQ9MCAKPiBpcD0uLi4gY29kZT0weDAiCgogIFRo
aXMgY29tZXMgZnJvbSBTRUxpbnV4LiBIb3dldmVyLCB0aGUgcmFzcGJlcnJ5cGkzX2RlZmNvbmZp
ZyBlbmFibGVzIEFwcEFybW9yLCAKbm90IFNFTGludXggKGFuZCBBRkFJSyBBcHBBcm1vciBkb2Vz
bid0IGdpdmUgbWVzc2FnZXMgbGlrZSB0aGlzKS4gU28gc29tZWhvdyB5b3UgCmRpZCBzb21ldGhp
bmcgd2VpcmQgdGhlcmUuLi4KCiAgQW55d2F5LCB0aGUgcHJvYmxlbSBpcyB0aGF0IHlvdXIgQXBw
QXJtb3Igb3IgU0VMaW51eCBzZXR1cCBpcyBub3QgY29ycmVjdCB0byAKYWxsb3cgc3NoZC4KCiAg
VGhlIGh0b3AgcHJvYmxlbSBtaWdodCBiZSB0aGUgc2FtZS4KCiAgUmVnYXJkcywKICBBcm5vdXQK
Cj4gCj4gKHRoZSBkb3RzIHJlcGxhY2UgbnVtYmVycyBJIGd1ZXNzIGFyZSBwb2ludGxlc3MgdG8g
dHlwZSkKPiAKPiBJIHNlYXJjaGVkIGEgYml0IGFyb3VuZCBhbmQgZm91bmQgdGhyZWFkcyBpbiBm
b3J1bXMgd2l0aCBzaW1pbGFyIHNlZW1pbmcgCj4gcHJvYmxlbXMgYnV0IHNvbWV3aGF0IGRpZmZl
cmVudCBudW1iZXJzIGluIHRoZSBtZXNzYWdlLCBjbGFpbXMgb2Ygc29tZSBwcm9ibGVtIAo+IHdp
dGggdGhpcyBzdHVmZiBhbmQgbGliYzYgYW5kIGxpbnV4IHZlcnNpb25zIHByaW9yIHRvIDUuMSwg
d2VsbCBpZiBJICJ1bmFtZSAtYSIgCj4gaGVyZSwgaXQgc2F5cyAiNS4xMC40Ni12NyIsIEkgZ3Vl
c3MgdGhhdCBvbmUgc2hvdWxkIG5vdCBoYXZlICp0aGF0KiBwcm9ibGVtLCAKPiB1bmxlc3MgaXQg
aGFzIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGF0Lgo+IAo+IEFueSBpZGVhcz8KPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
