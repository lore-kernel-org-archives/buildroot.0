Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FD5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:08:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2590D611C6
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2590D611C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAE6880AEF;
	Wed, 20 Oct 2021 12:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMylEdKmlxdp; Wed, 20 Oct 2021 12:08:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25E7B80BD3;
	Wed, 20 Oct 2021 12:08:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEB481BF951
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9EA54055F
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FayOzJ1Her_j for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 12:08:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0084401AF
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 12:08:21 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id 5so24658876edw.7
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 05:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mtQm6ZlWD0vgW1ULi1NE4rnlu0LPeFVwA2/zdW6mzWA=;
 b=AC31I9n25k0KvIXy9KatDW32qtQPxwJSgkjHWeiY91uhNxg7NWmLucS/WijxfNMgw7
 NkMVrrhcFmGsMzl0a6RBr/FrWtUjJGtV39RoI+1UWYkGUz66wGlFYZWJg680HlstTIk6
 Xtkt9A7mdTIZ4/V/aMj4pWeWg1DNzdLHjtUeqZdJEI0sFq6AlMlFhp3WCpFxwxMZCety
 +LZXvu5jaAVv39qgNRtRzKvNQmR/xlOlYzxhI+xzP4ivhjWT8hoSr7IvNhlBLhkku+hH
 VuiDedOJOeDAEcaH5yNeSEWsykq1VU5DnBmUvDmfkB8sd8sAhV90tjKN9eIL3rl6OOeX
 WzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mtQm6ZlWD0vgW1ULi1NE4rnlu0LPeFVwA2/zdW6mzWA=;
 b=hkjLVTq3x+Ol3bNssjZwoX6kS6e4X7wkGiX75KGQXPy7ANE+5yRSstqGDbkiOCxFAb
 6aDrS2URFm4tz8M3WML6uPxmMxbpveTCNm1unYU2JLjjjRN4HYKz9E5xbWRneeG4orhf
 FBi1pDJj62M7BDnmtxfV7EYa86y23KX1E9ZxGHe/Tt0tMnUR/HbBF5KBzsX5/bOcfujY
 CpzIJaSSOUbPCxcqY/kFAjFAnRFzL5DtATIMi8KfVBbici+bZgrMHkXUGWmCQ+WO1UvF
 deAMPuZr45MtmvhpeDQYZji9KLxD0iHGt7xPyUa7qDsP2dJwRocfREqwl8tAP6VHv/TU
 HRSw==
X-Gm-Message-State: AOAM531DjJp+0bYdSYdrQYcFtLqjKGvysF5evQXK6Eium4j5CcfZECkC
 cVMVFEg0GzPUg3Bo5/F+1c3chX3ypB861xdb
X-Google-Smtp-Source: ABdhPJwJ/neGgj79DrQAR7LKkP0UpRREFJcaED8XV4Uxa0ysLTzhDwkgLX9Ewjn/DkEWJx0r4a+/Og==
X-Received: by 2002:a17:906:9546:: with SMTP id
 g6mr44718550ejy.448.1634731696199; 
 Wed, 20 Oct 2021 05:08:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z19sm966209ejw.44.2021.10.20.05.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 05:08:15 -0700 (PDT)
Message-ID: <02a0cab6-1ed5-a940-d4f3-371dc281bc41@mind.be>
Date: Wed, 20 Oct 2021 14:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Will Eccles <will@eccles.dev>
References: <20211018203038.32453-1-will@eccles.dev>
 <13c3735c-9fd1-abfd-1b06-1d7ccf2425ff@mind.be>
 <CA+K4yGmg=EYwLTd4_FXnmTihRbdgCBXPntbph2Ghe-_38NByBg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CA+K4yGmg=EYwLTd4_FXnmTihRbdgCBXPntbph2Ghe-_38NByBg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] package/openssh: reset umask when init
 script exits
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8xMC8yMDIxIDIzOjQyLCBXaWxsIEVjY2xlcyB3cm90ZToKPiBIaSBBcm5vdXQsCj4g
Cj4gSW50ZXJlc3RpbmdseSwgSSBoYXZlIHRlc3RlZCB0aGlzIGluIGEgZmV3IGRpZmZlcmVudCB3
YXlzIGFuZCBhY2hpZXZlZCBkaWZmZXJlbnQgCj4gcmVzdWx0cyBlYWNoIHRpbWUuIEkgYWdyZWUg
d2l0aCB5b3UgdGhhdCB0aGUgcGF0Y2ggZG9lcyBub3QgbWFrZSBtdWNoIHNlbnNlLCBidXQgCj4g
b24gdGhlIHN5c3RlbSBJIHdyb3RlIGl0IG9uIChvciByYXRoZXIsIHRoZSBzeXN0ZW0gSSBvcmln
aW5hbGx5IHRlc3RlZCB0aGUgZml4IAo+IG9uLCB3aGljaCB3YXMgb3RoZXJ3aXNlIHVubW9kaWZp
ZWQpLCBpdCBzZWVtZWQgdG8gZml4IHRoZSBwcm9ibGVtLiBUaGUgZXhhY3QgCj4gc3RlcHMgSSBm
b2xsb3dlZCB0byB0ZXN0IHRoaXMgd2VyZToKPiAKPiAxLiBCdWlsZCB0aGUgc3lzdGVtIGltYWdl
IChvZiBjb3Vyc2UpCj4gMi4gTG9naW4gYXMgcm9vdCBhbmQgdGVzdCB0aGF0IHRoZSB1bmFtZSB2
YWx1ZSB3YXMgMDc3IChubyBjb25maWcgZmlsZXMgd2VyZSAKPiBzb3VyY2VkIGJ5IHRoZSBzaGVs
bCwgYXMgbm9uZSB3ZXJlIGluc3RhbGxlZCBvbiB0aGUgc3lzdGVtKQo+IDMuIEFwcGx5IHRoaXMg
cGF0Y2ggdG8gdGhlIFM1MHNzaGQgZmlsZSBhbmQgcmVib290IChub3RoaW5nIGVsc2Ugd2FzIGNo
YW5nZWQgCj4gdGhhdCBJJ20gYXdhcmUgb2Y7IEkgd2FzIGxvZ2dlZCBpbiBmb3IgYWxsIG9mIDEg
bWludXRlIHRvIG1ha2UgdGhlIGNoYW5nZSBhbmQgCj4gcmVib290KQo+IDQuIExvZ2luIGFzIHJv
b3QgYWdhaW4gYW5kIHRlc3QgdGhhdCB0aGUgdW5hbWUgdmFsdWUgd2FzIG5vdyAwMjIgKGFzIEkg
ZXhwZWN0ZWQgCj4gaXQgdG8gYmUpCj4gCgogIEhtLCB0aGlzIHJlbWluZHMgbWU6IEkgYmVsaWV2
ZSB0aGF0IGJ1c3lib3ggYXNoIGRvZXMgc29tZXRoaW5nIHNtYXJ0IHRvIApleGVjdXRlIHNoZWxs
IHNjcmlwdHMuIElJUkMsIGl0IGZvcmsoKXMgYnV0IGRvZXNuJ3QgZXhlYygpLCBpbnN0ZWFkIGRp
cmVjdGx5IApqdW1waW5nIHRvIHRoZSBpbnRlcnByZXRlci4KCiAgVGhhdCBkb2Vzbid0IGFjdHVh
bGx5IGV4cGxhaW4gdGhlIGJlaGF2aW91ciB5b3Ugb2JzZXJ2ZWQsIGJlY2F1c2UgaXQgc2hvdWxk
IApzdGlsbCBub3QgcHJvcGFnYXRlIHRoZSB1bWFzayB0byB0aGUgcGFyZW50IHByb2Nlc3MuLi4g
QW5kIGl0IGRlZmluaXRlbHkgZG9lc24ndCAKZXhwbGFpbiBob3cgdGhhdCBiZWhhdmlvdXIgY291
bGQgc3VkZGVubHkgZGlzYXBwZWFyLi4uCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPiBJIGhhdmUg
bm8gaWRlYSBob3cgdGhpcyBwYXRjaCB3b3VsZCBmaXggdGhlIGlzc3VlLCBhbmQgSSBhZ3JlZSB0
aGF0IGl0IG1ha2VzIG5vIAo+IHNlbnNlLCBidXQgZXZlbiBpbiBhIHNtYWxsIHRlc3QgSSBoYWQg
ZG9uZSBvbiB0aGUgaG9zdCBzeXN0ZW0gSSBoYWQgYWNoaWV2ZWQgCj4gcmVzdWx0cyB3aGljaCBh
cHBlYXJlZCB0byBhZ3JlZSB3aXRoIHRoaXMgcGF0Y2guIE9uIGEgbmV3IHN5c3RlbSAoYnVpbHQg
bWludXRlcyAKPiBhZ28pLCBJIGNhbm5vdCByZXByb2R1Y2UgdGhlIGV4YWN0IHNhbWUgc3RlcHMg
SSB0b29rIGFib3ZlLCB3aGljaCBpcyBxdWl0ZSAKPiBwdXp6bGluZywgYXMgbm90aGluZyBoYXMg
Y2hhbmdlZCAoYXNpZGUgZnJvbSBhIHNpbmdsZSBkZXZpY2UgdHJlZSBvdmVybGF5IEkgCj4gYWRk
ZWQsIHdoaWNoIHNob3VsZCBoYXZlIG5vIHJlbGV2YW5jZSBoZXJlIGF0IGFsbCkuCj4gCj4gID4g
QW5kIHdoZW4geW91IHNvdXJjZSB0aGUgc2NyaXB0LCB0aGUgdHJhcCBkb2Vzbid0IGV2ZW4gdHJp
Z2dlciBhdCB0aGUgZW5kIG9mCj4gID4gdGhlIHNjcmlwdCwgc28gdGhpcyBwYXRjaCBkb2Vzbid0
IGFjdHVhbGx5IHJlc2V0IHRoZSB1bWFzay4KPiAKPiBJIHdyb3RlIHRoZSBzY3JpcHQgdW5kZXIg
dGhlIGFzc3VtcHRpb24gdGhhdCBpdCB3YXMgbmV2ZXIgc291cmNlZCwgc28gSSBkaWRuJ3QgCj4g
ZXZlbiBjb25zaWRlciB0aGlzLiBUaGUgZmlsZSBzaG91bGRuJ3QgZXZlciBiZSBzb3VyY2VkIGFz
IGl0IGRvZXNuJ3QgZW5kIGluIC5zaCAKPiBhbnl3YXkuCj4gCj4gSSBhbSB3aWxsaW5nIHRvIGFj
Y2VwdCB0aGF0IEkgaGFkIHNvbWUgc29ydCBvZiBncmVtbGluIG9uIHRoZSBvcmlnaW5hbCBzeXN0
ZW0gSSAKPiB0ZXN0ZWQgdGhpcyBvbi4gSSBjYW4ndCBzZWVtIHRvIHJlcHJvZHVjZSBpdCBvbiBh
IG5ld2x5LWdlbmVyYXRlZCBpbWFnZSB3aGlsZSAKPiBmb2xsb3dpbmcgcHJlY2lzZWx5IHRoZSBz
YW1lIHN0ZXBzIEkgZGlkIGFib3ZlLiBIb3dldmVyLCB0aGlzIG9ubHkgcmFpc2VzIG1vcmUgCj4g
cXVlc3Rpb25zIGZvciBtZSB0byBpbnZlc3RpZ2F0ZSwgYXMgSSBoYXZlIG5vIGNsdWUgd2hhdCBl
bHNlIGNvdWxkIGhhdmUgY2F1c2VkIAo+IHRoZSBiZWhhdmlvciBJIHNhdyBvbiB0aGUgb3JpZ2lu
YWwgc3lzdGVtLiBJIGFkbWl0IEkgZGlkbid0IHJlYWxseSB0aGluayB0b28gCj4gaGFyZCBhYm91
dCB3aHkgaXQgd291bGQgd29yayB0aGlzIHdheSwgSSBqdXN0IHNvcnQgb2YgYWNjZXB0ZWQgaXQg
YW5kIG1vdmVkIG9uLiAKPiBXaWxsIGludmVzdGlnYXRlIGZ1cnRoZXIgYW5kIHNlZSBpZiBJIGNh
biByZXByb2R1Y2UgaXQgYWdhaW4uCj4gCj4gWW91cnMsCj4gV2lsbCBFY2NsZXMKPiAKPiBPbiBU
dWUsIE9jdCAxOSwgMjAyMSBhdCA0OjI1IFBNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRA
bWluZC5iZSAKPiA8bWFpbHRvOmFybm91dEBtaW5kLmJlPj4gd3JvdGU6Cj4gCj4gICAgICDCoCBI
aSBXaWxsLAo+IAo+ICAgICBPbiAxOC8xMC8yMDIxIDIyOjMwLCBXaWxsIEVjY2xlcyB3cm90ZToK
PiAgICAgID4gUzUwc3NoZCB1cGRhdGVzIHVtYXNrIHRvIDA3NywgYnV0IGRvZXMgbm90IHJlc2V0
IGl0IHdoZW4gaXQgZXhpdHMuIFRoaXMKPiAgICAgID4gcmVzdWx0cyBpbiB0aGUgcm9vdCB1c2Vy
J3MgdW1hc2sgYmVpbmcgY29uZmlndXJlZCBpbmNvcnJlY3RseSAoYXNzdW1pbmcKPiAgICAgID4g
YSBkZWZhdWx0IG9mIDAyMiBvciBvdGhlcndpc2UpLgo+IAo+ICAgICAgwqAgQ2FuIHlvdSBleHBs
YWluIGluIHdoaWNoIGNvbnRleHQgdGhpcyBoYXBwZW5zPwo+IAo+ICAgICAgwqAgTm9ybWFsbHkg
dGhpcyBzY3JpcHQgaXMgZXhlY3V0ZWQgYnkgL2V0Yy9pbml0LmQvcmNTLCB3aGljaCBjb250YWlu
cyB0aGlzCj4gICAgIGNvZGU6Cj4gCj4gICAgICDCoCDCoCDCoCBjYXNlICIkaSIgaW4KPiAgICAg
IMKgIMKgIMKgIMKgIMKgKi5zaCkKPiAgICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIyBTb3VyY2Ug
c2hlbGwgc2NyaXB0IGZvciBzcGVlZC4KPiAgICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKAo+ICAg
ICAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cmFwIC0gSU5UIFFVSVQgVFNUUAo+ICAgICAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzZXQgc3RhcnQKPiAgICAgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgLiAkaQo+ICAgICAgwqAgwqAgwqAgwqAgwqAgwqAgwqApCj4gICAgICDCoCDC
oCDCoCDCoCDCoCDCoCDCoDs7Cj4gICAgICDCoCDCoCDCoCDCoCDCoCopCj4gICAgICDCoCDCoCDC
oCDCoCDCoCDCoCDCoCMgTm8gc2ggZXh0ZW5zaW9uLCBzbyBmb3JrIHN1YnByb2Nlc3MuCj4gICAg
ICDCoCDCoCDCoCDCoCDCoCDCoCDCoCRpIHN0YXJ0Cj4gICAgICDCoCDCoCDCoCDCoCDCoCDCoCDC
oDs7Cj4gCj4gICAgICDCoCBTaW5jZSB0aGUgc2NyaXB0IGRvZXNuJ3QgZW5kIHdpdGggLnNoLCBp
dCB3aWxsIGZvcmssIHNvIHRoZSB1bWFzayBkb2Vzbid0Cj4gICAgICJzdGljayIuCj4gCj4gICAg
ICDCoCBTYW1lIHdoZW4geW91IGV4ZWN1dGUgdGhlIHNjcmlwdCBpbnRlcmFjdGl2ZWx5OiB0aGUg
dW1hc2sgaXNuJ3QgaW5oZXJpdGVkIGJ5Cj4gICAgIHRoZSBwYXJlbnQgc2hlbGwuCj4gCj4gICAg
ICDCoCBBbmQgd2hlbiB5b3Ugc291cmNlIHRoZSBzY3JpcHQsIHRoZSB0cmFwIGRvZXNuJ3QgZXZl
biB0cmlnZ2VyIGF0IHRoZSBlbmQgb2YKPiAgICAgdGhlIHNjcmlwdCwgc28gdGhpcyBwYXRjaCBk
b2Vzbid0IGFjdHVhbGx5IHJlc2V0IHRoZSB1bWFzay4KPiAKPiAKPiAgICAgIMKgIFNvIEkgZG9u
J3QgdW5kZXJzdGFuZCBob3cgaXQncyBwb3NzaWJsZSB0aGF0IHRoaXMgcGF0Y2ggZml4ZXMgeW91
ciBwcm9ibGVtLgo+IAo+IAo+ICAgICAgwqAgUmVnYXJkcywKPiAgICAgIMKgIEFybm91dAo+IAo+
IAo+ICAgICAgPiBUaGlzIHBhdGNoIGFkZHMgYSB0cmFwIHRvIHJlc2V0IHVtYXNrCj4gICAgICA+
IHdoZW4gdGhlIHNjcmlwdCBleGl0cy4gVGhpcyBpcyBjb252ZW5pZW50IG9uIHN5c3RlbXMgd2hl
cmUsIGZvciBleGFtcGxlLAo+ICAgICAgPiBjb25maWdzIHN1Y2ggYXMgL2V0Yy9wcm9maWxlIG1h
eSBub3QgYmUgc291cmNlZCBieSB0aGUgcm9vdCB1c2VyLiBJdCBtYXkKPiAgICAgID4gYWxzbyBw
cmV2ZW50IGlzc3VlcyB3aXRoIG90aGVyIGluaXQgc2NyaXB0cyB3aGljaCBtYXkgaW5oZXJpdCB0
aGlzIHVtYXNrCj4gICAgICA+IHVuaW50ZW50aW9uYWxseSwgbGVhZGluZyB0byBpbXByb3BlciBw
ZXJtaXNzaW9ucyBlbHNld2hlcmUgaW4gdGhlCj4gICAgICA+IHN5c3RlbS4KPiAgICAgID4KPiAg
ICAgID4gU2lnbmVkLW9mZi1ieTogV2lsbCBFY2NsZXMgPHdpbGxAZWNjbGVzLmRldiA8bWFpbHRv
OndpbGxAZWNjbGVzLmRldj4+Cj4gICAgICA+IC0tLQo+ICAgICAgPiBCYWNrcG9ydCB0bzogMjAy
MS4wMi42LCAyMDIxLjA4LjEKPiAgICAgID4gKFRoZXNlIGFyZSB0aGUgcmVsZWFzZXMgb24gYnVp
bGRyb290Lm9yZyA8aHR0cDovL2J1aWxkcm9vdC5vcmc+IGFzIG9mCj4gICAgIHRoaXMgd3JpdGlu
ZywgYnV0IGFzIGZhcgo+ICAgICAgPiBhcyBJIGNhbiB0ZWxsLCBldmVuIHJlbGVhc2VzIGFzIGZh
ciBiYWNrIGFzIDIwMTIgaGF2ZSB0aGUgc2FtZSBwcm9ibGVtLikKPiAgICAgID4gLS0tCj4gICAg
ICA+wqAgwqBwYWNrYWdlL29wZW5zc2gvUzUwc3NoZCB8IDIgKysKPiAgICAgID7CoCDCoDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAgICAgID4KPiAgICAgID4gZGlmZiAtLWdpdCBh
L3BhY2thZ2Uvb3BlbnNzaC9TNTBzc2hkIGIvcGFja2FnZS9vcGVuc3NoL1M1MHNzaGQKPiAgICAg
ID4gaW5kZXggMjJkYTQxZDFjYS4uOTRjZjRjMTRlOCAxMDA2NDQKPiAgICAgID4gLS0tIGEvcGFj
a2FnZS9vcGVuc3NoL1M1MHNzaGQKPiAgICAgID4gKysrIGIvcGFja2FnZS9vcGVuc3NoL1M1MHNz
aGQKPiAgICAgID4gQEAgLTYsNiArNiw4IEBACj4gICAgICA+wqAgwqAjIE1ha2Ugc3VyZSB0aGUg
c3NoLWtleWdlbiBwcm9nYW0gZXhpc3RzCj4gICAgICA+wqAgwqBbIC1mIC91c3IvYmluL3NzaC1r
ZXlnZW4gXSB8fCBleGl0IDAKPiAgICAgID4KPiAgICAgID4gKyMgUmVzZXQgdW5hbWUgYXQgZXhp
dAo+ICAgICAgPiArdHJhcCAidW5hbWUgJCh1bmFtZSkiIEVYSVQKPiAgICAgID7CoCDCoHVtYXNr
IDA3Nwo+ICAgICAgPgo+ICAgICAgPsKgIMKgc3RhcnQoKSB7Cj4gICAgICA+Cj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
