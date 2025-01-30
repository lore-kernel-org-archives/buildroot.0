Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2C5C0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 16:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E61B560DDF;
	Thu, 30 Jan 2025 16:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6kBxFtphfUG; Thu, 30 Jan 2025 16:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E156E60D68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E156E60D68;
	Thu, 30 Jan 2025 16:26:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BCF59128
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 16:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAB0860D68
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 16:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfM4OiQehSS0 for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 16:26:27 +0000 (UTC)
X-Greylist: delayed 880 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 30 Jan 2025 16:26:26 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 918CF60D65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 918CF60D65
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=olivier.benjamin@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 918CF60D65
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 16:26:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF86B443A1;
 Thu, 30 Jan 2025 16:26:22 +0000 (UTC)
Message-ID: <945ed2b3-5533-427c-ba25-3cd33b1aad47@bootlin.com>
Date: Thu, 30 Jan 2025 17:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>,
 buildroot@buildroot.org
Cc: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240731120426.307069-1-gael.portay@rtone.fr>
Content-Language: en-US
In-Reply-To: <20240731120426.307069-1-gael.portay@rtone.fr>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeivdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeggfekveetleevleevudettdeufeeiudethfdutdeihffhueeuieehudektdegueenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiedphhgvlhhopeglkffrggeimedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiegnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepghgrvghlrdhpohhrthgrhiesghhmrghilhdrt
 ghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepghgrvghlrdhpohhrthgrhiesrhhtohhnvgdrfhhrpdhrtghpthhtohepshdrmhgrrhhtihhngeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrhhihrghrrdhkohhshhhkohhuvghisehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: olivier.benjamin@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738254383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mYWaNw8UCtgMbFCIPTgbuycsjud4wFuJrTvx5aC5tj8=;
 b=enoShtE6lbi0ePCIjnfARcd70HpU/XzhgwS/xNl1L0xI1snGcOJCWVKcjCcPOcPydrb4s0
 N3XM2nc9pOzChJC7L3wye0MQwcXQPI/FpzAkpN0Io9vZve67tVxhyXPyDJX2/eDFgwj53x
 MNq+Jh1t7Hq+duJzXnd9gq1WorgvL/W7H3hkKNszzUdECh3VGE538ify1/XOcE3COvmzdo
 bjV+O2XIhDVo02e0fDRBMfwqFXxZUEqPOHOZJj1AfBuYUkdLUhIT38pbTJ01jgcaJI0OHu
 Fx7Qe0uHGU7St+RgfghYrtxEtK5aWCwnfNwEOAgxYa0uLlSBrOUzZKPTCdh9Xg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=enoShtE6
Subject: Re: [Buildroot] [PATCH v3 0/2] rpi-utils replaces rpi-userland
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
From: Olivier Benjamin via buildroot <buildroot@buildroot.org>
Reply-To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiA3LzMxLzI0IDE0OjA0LCBHYcOrbCBQT1JUQVkgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gVGhlIHBhY2thZ2UgcnBpLXVzZXJsYW5kIGhhcyBiZWVuIG1hcmtlZCBhcyBhbmNpZW50IGFu
ZCBkZXByZWNhdGVkWzFdCj4gbmluZS1tb250aCBhZ28uCj4gCj4gVGhpcyBwYXRjaCBzZXJpZXMg
YWRkcyBpdHMgcmVwbGFjaW5nIHBhY2thZ2UgcnBpLXV0aWxzIChmaXJzdCBwYXRjaCksCj4gYW5k
IGl0IGFkZHMgdGhlIG1lc3NhZ2UgaW4gdGhlIHJwaS11c2VybGFuZCBoZWxwIChzZWNvbmQgcGF0
Y2gpLgo+IAo+IFRlbGwgbWUgaWYgdGhlIHBhY2thZ2Ugc2hvdWxkIGdvIGluIHRoZSBsZWdhY3kg
dGhpbmcuCj4gCj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxhbmQv
Y29tbWl0Lzk2YTczMzRhZTlkNWZjOWRiN2FjOTJlNTk4NTIzNzdkZjYzZjE4NDgKPiAKVGhhbmtz
IGEgbG90IGZvciB5b3VyIHdvcmsgb24gdGhpcy4KSSBoYXZlIHJlY2VudGx5IGhpdCB0aGUgc2Ft
ZSBpc3N1ZSwgYW5kIHVzaW5nIHJwaS11c2VybGFuZCBicm9rZSBteSBidWlsZC4KCkkgaGF2ZSB1
c2VkIHlvdXIgcGF0Y2gsIHdoaWNoIHdvcmtlZCB2ZXJ5IHdlbGwgYW5kIHByb3ZpZGVkIHRoZSB0
b29sIEkgCm5lZWRlZCAodmNtYWlsYm94KSB3aXRob3V0IGJyZWFraW5nIG15IGJ1aWxkIGFnYWlu
LgoKUGxlYXNlIGZlZWwgZnJlZSB0byBhZGQgbXkgVGVzdGVkLWJ5LgoKPiBDaGFuZ2VzIHNpbmNl
IHYxOgo+ICAgLSBBZGQgbXlzZWxmIHRvIERFVkVMT1BFUlMgKHJwaS11dGlscykKPiAgIC0gQWRk
IG1pc3NpbmcgZW50cnkgaW4gcGFja2FnZXMvQ29uZmlnLmluIChycGktdXRpbHMpCj4gICAtIEFk
ZCBuZWVkZWQgY29tbWVudCBmb3IgZ2xpYmMvbXVzbCB0b29sY2hhaW5zIHdpdGggZHluYW1pYyBs
aWJyYXJ5Cj4gICAgIChycGktdXRpbHMpCj4gICAtIEFkZCBkZXBlbmRzIG9uICFCUjJfVE9PTENI
QUlOX1VTRVNfVUNMSUJDIChycGktdXRpbHMpCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MjoKPiAgIC0g
UmVtb3ZlIGRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fVVNFU19VQ0xJQkMKPiAKPiBSZWdhcmRz
LAo+IEdhw6tsIFBPUlRBWSAoMik6Cj4gICAgcGFja2FnZS9ycGktdXRpbHM6IG5ldyBwYWNrYWdl
Cj4gICAgcGFja2FnZS9ycGktdXNlcmxhbmQ6IHBhY2thZ2UgaXMgZGVwcmVjYXRlZAo+IAo+ICAg
REVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKysKPiAgIHBhY2thZ2UvQ29u
ZmlnLmluICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAgcGFja2FnZS9ycGktdXNlcmxhbmQvQ29u
ZmlnLmluICAgfCAxMSArKysrKysrKysrKwo+ICAgcGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmlu
ICAgICAgfCAxMiArKysrKysrKysrKysKPiAgIHBhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5o
YXNoIHwgIDMgKysrCj4gICBwYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMubWsgICB8IDE4ICsr
KysrKysrKysrKysrKysrKwo+ICAgNiBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspCj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmluCj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLmhhc2gKPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMubWsKPiAKCi0tIApPbGl2
aWVyIEJlbmphbWluLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
