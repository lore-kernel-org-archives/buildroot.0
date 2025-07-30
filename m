Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF57C83F26
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 17:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51C6283D1E;
	Wed, 30 Jul 2025 17:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igD8QuGlWjeo; Wed, 30 Jul 2025 17:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6235B83D5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6235B83D5C;
	Wed, 30 Jul 2025 17:19:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CFD113D
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 17:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F3A241200
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 17:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yjrpso8nQvLE for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 17:19:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EE7A411E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE7A411E2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EE7A411E2
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 17:19:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 042F944462;
 Wed, 30 Jul 2025 17:18:59 +0000 (UTC)
Mime-Version: 1.0
Date: Wed, 30 Jul 2025 19:18:59 +0200
Message-Id: <DBPK7ZI4PYVW.WNI5DTRPIL69@bootlin.com>
Cc: <tim.hammer@nav-timing.safrangroup.com>,
 <nicolas.carrier@nav-timing.safrangroup.com>, <buildroot@buildroot.org>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
 <20250730-openscap-v1-1-46e4a32e26da@bootlin.com>
 <20250730185358.61d2f04c@windsurf>
In-Reply-To: <20250730185358.61d2f04c@windsurf>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteelkefhhfetgfevffefheefgedvjedtgfettedtjefghfdvveegheegtdfgudevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhimhdrhhgrmhhmvghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehnrghvq
 dhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753895940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdphHwzkLy4A3Q0xCR0jRMhYCL/P0ZCglOXa6HI0WZ0=;
 b=UK9blZSOr1tu0AYMx8vh4HNTAOzZondfSUYlQH4TFLKLIoi+zXEZfVh/RLMUwL/298kO+l
 dHQadBJaWxiDo1/8pCi5gfe+zWTJpOHooO9R2Hc7Ktvr7PsipjjoKhbxLVT3zFZm9ThLOr
 xkC8QA9Wz7lVijRhc8n+thzNojlhhLrHZQcJPKGZx9ffT2HqRVplBrXLwArqAqGFy/rcXC
 WdPDqafxS9ZHcZlEXCOnZln6IXrb1XUaBHC3/l6P8AJK5uiTNyBhk9gB8OJza/4slB4OiC
 u/xJOAJVRAQZeGve12vS7k3CjoMPEQ/aidmih5DtgupgEvXDy/cy/EQfj+ngKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UK9blZSO
Subject: Re: [Buildroot] [PATCH 1/4] package/libxmlsec1: Add libxmlsec1 used
 by openSCAP
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKdGhhbmtzIGZvciB0aGUgcmV2aWV3ICEKT24gV2VkIEp1bCAzMCwgMjAyNSBh
dCA2OjUzIFBNIENFU1QsIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBI
ZWxsbyBBbGV4aXMsCj4+ICtMSUJYTUxTRUMxX0NPTkZfT1BUUyA9CS0tZGlzYWJsZS1zdGF0aWMg
XAo+PiArCQkJLS1lbmFibGUtY3J5cHRvLWRsPW5vIFwKPj4gKwkJCS0td2l0aC1vcGVuc3NsIFwK
Pj4gKwkJCS0td2l0aC1nbnV0bHM9bm8gXAo+PiArCQkJLS13aXRoLWdjcnlwdD1ubyBcCj4+ICsJ
CQktLXdpdGgtbnNzPW5vCj4KPiBUaGlzIHNob3VsZCBiZSBhIGJpdCBtb3JlIG5pY2VseSBmb3Jt
YXR0ZWQsIGFuZCB1c2UgLS1kaXNhYmxlLy0td2l0aG91dAo+IGluc3RlYWQgb2YgLS1lbmFibGUt
Li49bm8gYW5kIC0td2l0aC0uLi49bm8uIEFsc28sIHlvdSBzaG91bGRuJ3QgcGFzcwo+IC0tZGlz
YWJsZS1zdGF0aWMgdW5sZXNzIHlvdSBoYXZlIGEgdmVyeSBnb29kIHJlYXNvbiB0by4gSW5kZWVk
LAo+IEJ1aWxkcm9vdCBpcyBwYXNzaW5nIC0te2VuYWJsZSxkaXNhYmxlfS17c2hhcmVkLHN0YXRp
Y30gYXV0b21hdGljYWxseQo+IGJhc2VkIG9uIHRoZSBCUjJfU0hBUkVEX0xJQlMvQlIyX1NUQVRJ
Q19MSUJTIHNldHRpbmdzLgo+Cj4gU286Cj4KPiBMSUJYTUxTRUMxX0NPTkZfT1BUUyA9IFwKPiAJ
LS1kaXNhYmxlLWNyeXB0by1kbCBcCj4gCS0td2l0aC1vcGVuc3NsIFwKPiAJLS13aXRob3V0LWdu
dXRscyBcCj4gCS0td2l0aG91dC1nY3J5cHQgXAo+IAktLXdpdGhvdXQtbnNzCgpZZXMsIEkgbXVz
dCBjb25mZXNzIHRoYXQgSSBkaWQgbm90IHRob3JvdWdobHkgcmV2aWV3ZWQgdGhvc2UgY29uZiBv
cHRzCmJlZm9yZSBpbmNsdWRpbmcgdGhlbS4gSSdsbCBnaXZlIGEgdHJ5IHdpdGhvdXQgdGhlIHN0
YXRpYywgcmVtb3ZlIGl0IGlmIG5vdApuZWVkZWQsIGFuZCB1c2UgcHJvcGVyIEJSIG1lY2hhbmlz
bXMgaWYgaXQgaXMgYWN0dWFsbHkgbmVlZGVkLgoKWy4uLl0KCj4+ICtIT1NUX0xJQlhNTFNFQzFf
Q09ORl9PUFRTID0gJChMSUJYTUxTRUMxX0NPTkZfT1BUUykKPgo+IEknbSBub3Qgc3VyZSBJIGxp
a2UgcmUtdXNpbmcgbGlrZSB0aGlzIHRhcmdldCBvcHRpb25zIGZvciB0aGUgaG9zdAo+IHZhcmlh
bnQuIEkgdGhpbmsgSSdkIHByZWZlciB0aGVtIHRvIGJlIGR1cGxpY2F0ZWQuCgpZb3UgcmlnaHQs
IGFuZCB0aGlzIHBhdHRlcm4gYWN0dWFsbHkgYml0IG1lIGluIG9uZSBvZiB0aGUgb3RoZXIgcGFj
a2FnZXMKYnJvdWdodCBpbiB0aGlzIHNlcmllcyAhCgpBbGV4aXMKCgotLSAKQWxleGlzIExvdGhv
csOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6
Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
