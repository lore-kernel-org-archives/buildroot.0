Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51741C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E75A44062F;
	Sun, 18 May 2025 12:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrHngaXtXp5X; Sun, 18 May 2025 12:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 020F2403DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 020F2403DB;
	Sun, 18 May 2025 12:18:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4968E1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EE2D80D1D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuYK8c2uTTmU for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:18:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8C2380EB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8C2380EB5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8C2380EB5
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:18:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B552643A0B;
 Sun, 18 May 2025 12:18:39 +0000 (UTC)
Date: Sun, 18 May 2025 14:18:38 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>, David
 GOUARIN <dgouarin@gmail.com>
Message-ID: <20250518141838.3ed5cad6@windsurf>
In-Reply-To: <20250414104614.973244-1-raphael.melotte@mind.be>
References: <20250414104614.973244-1-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -105
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddqhedmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgleegveettdfgieekudehtdevuefggeelieejheekudelgeegkeetvedvtdehueenucffohhmrghinhepmhgrrhgtrdhinhhfohdpnhhishhtrdhgohhvpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlu
 ghrohhothdrohhrghdprhgtphhtthhopehrrghphhgrvghlrdhmvghlohhtthgvsehmihhnugdrsggvpdhrtghpthhtohepughgohhurghrihhnsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747570720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PaH0pyEhG0z2aYjUPT5JPXz4PKawcv9o/6T7Pe5pGbw=;
 b=l4owWPCh+tb+fQelytvJN1dAYn0C4kF7kGuCsiukC2yC3m1HIixMIABlLmDfbz5KNK30gf
 +5k7hOa1QYUgfRnq4Ab+Ae7uky8zzo92yDWYascqtVHsnt9qINWbz4t49zngdu/+9HX76H
 qIuSMrT/gEo6PIcsCcJwSMwnqB1mRAMCWiGCvg+sdQhijjw4xKCAOUEMDeB9Y4Qe69mp8M
 Gcd5V33UZXwIL1OBCW3+ZZgM09/dGRoMI+4tbxKoUMIAQvWm5Fk1J/RC58mC5FpE0Y8k76
 dw45FUvK5aAAL429LG6q5BsANZbvZiTlKRuDvmYKq3ZoeupcxeN9xsiS7hNhaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l4owWPCh
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: ignore
 CVE-2002-0318 and CVE-2011-4966
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFwaGHDq2wsCgpPbiBNb24sIDE0IEFwciAyMDI1IDEyOjQ2OjEyICswMjAwClJhcGhh
w6tsIE3DqWxvdHRlIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90
ZToKCj4gQ1ZFLTIwMDItMDMxOCBoYXMgYmVlbiBtaXRpZ2F0ZWQgYnkgYWRkaW5nIGEgbmV3IGNv
bmZpZyBvcHRpb24gaW4KPiBmcmVlcmFkaXVzLXNlcnZlciBjb21taXQgZjBmNzYyZDE0MzkzMzZm
ZmY5YzhiOTAyOTEzNjRkZGZmNTgzZjY5OCwKPiB3aGljaCBpcyBwYXJ0IG9mIHJlbGVhc2VfMF81
XzAgb253YXJkcy4KPiBTZWUgYWxzbyB0aGUgb3JpZ2luYWwgcmVwb3J0IChbMV0pLgo+IFRoZSBO
VkQgZGF0YWJhc2UncyBDUEUgY29uZmlndXJhdGlvbiBkb2Vzbid0IGhhdmUgYW4gYXNzb2NpYXRl
ZAo+IHZlcnNpb24gbnVtYmVyLCB3aGljaCBpcyB3aHkgb3VyIENWRSBjaGVjayBzdGlsbCByZXBv
cnRzIGl0Lgo+IAo+IEZvciBDVkUtMjAxMS00OTY2LCB0aGUgQ1ZFIGRlc2NyaXB0aW9uIChzZWUg
WzJdKSBtZW50aW9ucyB0aGUgaXNzdWUgaXMKPiBmaXhlZCBpbiB2ZXJzaW9uIDIuMi4wIG9ud2Fy
ZHMsIGJ1dCB0aGUgQ1BFIGFnYWluIGRvZXNuJ3QgdXNlIGEKPiB2ZXJzaW9uIG51bWJlci4KPiAK
PiBUbyByZWR1Y2UgdGhlIG5vaXNlIGluIHRoZSBsaXN0IG9mIENWRXMgdGhhdCBwa2ctc3RhdHMg
cmVwb3J0cywgaWdub3JlCj4gdGhlbS4KPiAKPiBGV0lXLCB5b2N0by9vZSBhbHNvIGlnbm9yZXMg
dGhlbSAoc2VlIFszXSkuCj4gCj4gWzFdOiBodHRwczovL21hcmMuaW5mby8/bD1idWd0cmFxJm09
MTAxNDQwMTEzNDEwMDgzJnc9MiMyCj4gWzJdOiBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2Rl
dGFpbC9DVkUtMjAxMS00OTY2Cj4gWzNdIGh0dHBzOi8vcGF0Y2h3b3JrLnlvY3RvcHJvamVjdC5v
cmcvcHJvamVjdC9vZS9wYXRjaC8yMDIyMDcxNTEzMzUxNS4xNDI5OC0xLWRhdmlkZS5nYXJkZW5h
bEBodWF3ZWkuY29tLwo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBo
YWVsLm1lbG90dGVAbWluZC5iZT4KClRoYW5rcyBSYXBoYcOrbCwgSSBhcHBsaWVkIHlvdXIgcGF0
Y2gsIGJ1dCBhZnRlciBjaGFuZ2luZyBpdCBhIGJpdCwgc2VlCmJlbG93LgoKPiArIyBUaGUgTlZE
IGRhdGFiYXNlIGRvZXNuJ3QgaGF2ZSBhIHZlcnNpb24gbnVtYmVyIGNvbmZpZ3VyZWQgZm9yIHRo
ZQo+ICsjIGZvbGxvd2luZyBDVkVzCgpUaGUgTlZEIGRhdGFiYXNlIGRvZXNuJ3QgcmVhbGx5ICJj
b25maWd1cmUiIGFueXRoaW5nLCBzbyB0aGUgd29yZAoiY29uZmlndXJlIiBoZXJlIGlzIGEgYml0
IG1pc2xlYWRpbmcuCgpBbmQgYWN0dWFsbHksIHdlIHRyeSB0byBoYXZlIGEgbGl0dGxlIGJpdCBt
b3JlIGluZm9ybWF0aW9uIGF0dGFjaGVkIHRvCmVhY2ggaWdub3JlZCBDVkUsIHNvIEkndmUgY2hh
bmdlZCB5b3VyIHBhdGNoIHRvOgoKKyMgTWl0aWdhdGVkIHVwc3RyZWFtIHNpbmNlIHZlcnNpb24g
MC41LjAsIE5WRCBkYXRhYmFzZSBlbnRyeSBub3QKKyMgdXAtdG8tZGF0ZQorRlJFRVJBRElVU19T
RVJWRVJfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMDItMDMxOAorCisjIEZpeGVkIGluIDIuMi4wLCBO
VkQgZGF0YWJhc2UgZW50cnkgbm90IHVwLXRvLWRhdGUKK0ZSRUVSQURJVVNfU0VSVkVSX0lHTk9S
RV9DVkVTICs9IENWRS0yMDExLTQ5NjYKCndoaWNoIEkgYmVsaWV2ZSBpcyBzbGlnaHRseSBtb3Jl
IGRlc2NyaXB0aXZlLgoKVGhhbmtzIGEgbG90IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25p
LCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
