Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA76AC282C5
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 10:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B3A840B98;
	Mon,  3 Mar 2025 10:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EsfixJJfzGmg; Mon,  3 Mar 2025 10:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B55F40BA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B55F40BA9;
	Mon,  3 Mar 2025 10:33:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 975F3D2
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 10:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8692B40BA9
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 10:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GOPwxCSuMgi for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 10:33:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B6C940B98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B6C940B98
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B6C940B98
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 10:33:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 248AA41B5F;
 Mon,  3 Mar 2025 10:32:58 +0000 (UTC)
Date: Mon, 3 Mar 2025 11:32:56 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Kory Maincent via buildroot <buildroot@buildroot.org>, Marcin Niestroj
 <m.niestroj@grinn-global.com>
Message-ID: <20250303113256.1a326ead@kmaincent-XPS-13-7390>
In-Reply-To: <20250203232422.170fe7b6@windsurf>
References: <20250117155030.3238710-1-kory.maincent@bootlin.com>
 <20250203232422.170fe7b6@windsurf>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmrdhnihgvshhtrhhojhesghhrihhnnhdqghhlohgsrghlrdgtohhmpdhrtghpthhtohepkhhorhihrdhmrghin
 hgtvghnthessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1740997978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BTzsVnhJrJE1u7l7+c0QEdA/OjqhQlM/qWkFEkf36xE=;
 b=Nmz7ZQIzRBaq2y+dJf9ZMkRGl8jRCmEJ6N0+WaYdd1R1f1kSxFPGL1DyjfG1S/Javk1Gmr
 54tU6oKI9qzJaX/6iO/oi0+LJAfbhNSku662mgrbajlQeieuXR9RLOT3rdS4hCf4j+rusn
 iIEdu4CZZ3zfiZm2poEA6Inw6opbiEnIzicyfTEyhZFqUcyhLBM/rhUkQqK5nztghhO41p
 zP55IVI2Ev8wNbFGjhgS2SX3WlHGpeUzRR0N8pYiIVS6p4LHRwzCjOhqc2+R29E6jFOAx6
 wcHwOZvQlFVPQZo9rOwEjDg3pMRDxrm2uBOykfqpk2XdR/F6fOCWu4fDwM9qQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nmz7ZQIz
Subject: Re: [Buildroot] [PATCH] package/murata-cyw-fw: Bump to last revision
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKRm9yZ290IHRvIHJlcGx5IHRvIHlvdXIgcmV2aWV3IHNvcnJ5LgoKT24g
TW9uLCAzIEZlYiAyMDI1IDIzOjI0OjIyICswMTAwClRob21hcyBQZXRhenpvbmkgPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIZWxsbyBLw7ZyeSwKPiAKPiBPbiBGcmks
IDE3IEphbiAyMDI1IDE1OjUwOjMwICswMDAwCj4gS29yeSBNYWluY2VudCB2aWEgYnVpbGRyb290
IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4gCj4gPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9tdXJhdGEtY3l3LWZ3L0NvbmZpZy5pbgo+ID4gYi9wYWNrYWdlL211cmF0YS1jeXctZncv
Q29uZmlnLmluIGluZGV4IDc1MzA0Nzc1MTEuLjhhMjc5NWU4MDYgMTAwNjQ0Cj4gPiAtLS0gYS9w
YWNrYWdlL211cmF0YS1jeXctZncvQ29uZmlnLmluCj4gPiArKysgYi9wYWNrYWdlL211cmF0YS1j
eXctZncvQ29uZmlnLmluCj4gPiBAQCAtMjUsMjAgKzI1LDkgQEAgY29uZmlnIEJSMl9QQUNLQUdF
X01VUkFUQV9DWVdfRldfQ1lXNDMzNjIKPiA+ICAJICBNdXJhdGEgV2lyZWxlc3MgQ1lXNDMzNjIg
KFNOODAwMCkgbW9kdWxlIGZpcm13YXJlIGZpbGVzLgo+ID4gIAo+ID4gIGNvbmZpZyBCUjJfUEFD
S0FHRV9NVVJBVEFfQ1lXX0ZXX0NZVzQzMzkKPiA+IC0JYm9vbCAiQ1lXNDMzOSAoMUNLL1pQKSIK
PiA+ICsJYm9vbCAiQ1lXNDMzOSAoWlApIgo+ID4gIAloZWxwCj4gPiAtCSAgTXVyYXRhIFdpcmVs
ZXNzIENZVzQzMzkgKDFDSy9aUCkgbW9kdWxlIGZpcm13YXJlIGZpbGVzLgo+ID4gLQo+ID4gLWNo
b2ljZQo+ID4gLQlwcm9tcHQgIkNZVzQzMzkgbW9kdWxlIiBpZiBCUjJfUEFDS0FHRV9NVVJBVEFf
Q1lXX0ZXX0NZVzQzMzkKPiA+IC0KPiA+IC1jb25maWcgQlIyX1BBQ0tBR0VfTVVSQVRBX0NZV19G
V19DWVc0MzM5XzFDSwo+ID4gLQlib29sICIxQ0siCj4gPiAtCj4gPiAtY29uZmlnIEJSMl9QQUNL
QUdFX01VUkFUQV9DWVdfRldfQ1lXNDMzOV9aUAo+ID4gLQlib29sICJaUCIgIAo+IAo+IFlvdSdy
ZSBkcm9wcGluZyBzb21lIG9wdGlvbnMgaGVyZSwgc28gd2Ugc2hvdWxkIGNvbnNpZGVyIGJhY2t3
YXJkCj4gY29tcGF0aWJpbGl0eS4gRG9lcyB0aGlzIG5lZWQgQ29uZmlnLmluLmxlZ2FjeSBoYW5k
bGluZz8gV2h5IGFyZSB0aG9zZQo+IG9wdGlvbnMgcmVtb3ZlZD8gKE5vdCBleHBsYWluZWQgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlKQoKVGhlc2UgZmlybXdhcmVzIGFyZSBub3QgYXZhaWxhYmxlIG9u
IHRoZSBsYXN0IHZlcnNpb24gb2YgdGhlIHJlcG8uCkFib3V0IGJhY2t3YXJkIGNvbXBhdGliaWxp
dHkgSSBkb24ndCByZWFsbHkga25vdyBob3cgdG8gZGVhbCB3aXRoIGl0LiBTaG91bGQgd2UKYWRk
IGEgd2F5IHRvIHNlbGVjdCB0aGUgdmVyc2lvbiBvZiB0aGUgcmVwbz8KCj4gPiAgTVVSQVRBX0NZ
V19GV19GSUxFU18kKEJSMl9QQUNLQUdFX01VUkFUQV9DWVdfRldfQ1lXNDMwMTIpICs9IFwKPiA+
IC0JYnJjbWZtYWM0MzAxMi1zZGlvLmJpbiBcCj4gPiAtCWJyY21mbWFjNDMwMTItc2Rpby4xTFYu
Y2xtX2Jsb2IgXAo+ID4gLQlicmNtZm1hYzQzMDEyLXNkaW8uMUxWLnR4dCBcCj4gPiAtCUNZVzQz
MDEyQzAuMUxWLmhjZAo+ID4gKwljeWZtYWM0MzAxMi1zZGlvLmJpbiBcCj4gPiArCWN5Zm1hYzQz
MDEyLXNkaW8uMUxWLmNsbV9ibG9iIFwKPiA+ICsJY3lmbWFjNDMwMTItc2Rpby4xTFYudHh0IFwK
PiA+ICsJQkNNNDMwMTJDMF8wMDMuMDAxLjAxNS4wMzAzLjAyNjcuMUxWLnNBbnQuaGNkICAKPiAK
PiBCdXQgYWxsIHRob3NlIGZpcm13YXJlIGZpbGVzIHRoYXQgaGF2ZSBjaGFuZ2VkIG5hbWUuLi4g
aG93IGRvZXMgdGhhdAo+IHdvcmsgd2l0aCB0aGUga2VybmVsIGxvYWRpbmcgdGhvc2UgZmlybXdh
cmUgZmlsZXM/IFRoZSBmaXJtd2FyZSBmaWxlCj4gbmFtZSBpcyBvZnRlbiBoYXJkY29kZWQgaW4g
dGhlIGRyaXZlciwgbm8/IFNvIGlzIHRoZXJlIHNvbWUgdmVyc2lvbgo+IGRlcGVuZGVuY3kgcmVs
YXRpb25zaGlwIGJldHdlZW4ga2VybmVsIHZlcnNpb24gYW5kIHRoaXMgRlcgdXBkYXRlPwoKTm9y
bWFsbHkgd2l0aCB0aGUgY2hhbmdlcyBvZiBtdXJhdGEtY3l3LWZ3LXN0cmlwLW1vZGVsIGFuZApt
dXJhdGEtY3l3LWZ3LWZpbGUtcmVuYW1lIHZhcmlhYmxlcyBpbiB0aGUgcGF0Y2hlIHRoZXJlIHNo
b3VsZCBub3QgYmUgYW55CmNoYW5nZSBpbiB0aGUgaW5zdGFsbGVkIGZpcm13YXJlIG5hbWVzLiAK
ClJlZ2FyZHMsCi0tIApLw7ZyeSBNYWluY2VudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
a2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
