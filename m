Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF21C87FCC
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 12:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5F9D613C5;
	Wed, 30 Jul 2025 12:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id he3GJ8K9Ks0J; Wed, 30 Jul 2025 12:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 419C06102E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 419C06102E;
	Wed, 30 Jul 2025 12:47:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A175E13D
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 12:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D999A40736
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 12:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdZDZY1kGcv4 for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 12:47:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65DC7400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65DC7400AF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65DC7400AF
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 12:47:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 695F341C06;
 Wed, 30 Jul 2025 12:47:20 +0000 (UTC)
Date: Wed, 30 Jul 2025 14:47:12 +0200
Message-Id: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFAUimgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyMT3fyC1Lzi5MQCXXNDM7O0pFRDU3PDVCWg8oKi1LTMCrBR0bG1tQC
 636YcWgAAAA==
X-Change-ID: 20250724-openscap-7166fbe1571e
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvffeuhffgteegieetteeiveffhffguefhfffgfeevleeugfelveetheeivdeknecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsggrrhhutghhsehtkhhoshdrtghordhilhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpr
 hgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtihhmrdhhrghmmhgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753879641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qCxK+AF5/+yfbK2Yz8+xrej4cJYRSHEVy6QKaSl+olA=;
 b=DmtZpBrfjisz2AMiYkW3SC1OJVTasQiYLW+PFOkwBNiI5cvWCrq9GkEe5pqEbloV5p4FNR
 dkD/q1+J9prtWMLZB8fpEalHe3aNt7wR8QVNVrsXMibB2KB8TJkGfZvak1op2pnpC2QLEX
 f/Xj1fbeDrl5C0F0mH9zsJMczsLTUc7w3P9i3PJkXv5a9qj0GENEvF+pdy9Mz9FiwN1Qrt
 wry3PV6xv96Cm4u4UGz3l4/6Z/yqGAe9E01+gcchgTIxGo4cCP4w9uODSKUdD26fsL2o5y
 eq7LBUYzMYI8FXe+qlwVaFnIuQHhA8zQnyKQbgZDqQeyWOZD7tdGJSsTGBWO1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DmtZpBrf
Subject: [Buildroot] [PATCH 0/4] package/compliance-as-code: introduce new
 package
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
Cc: tim.hammer@nav-timing.safrangroup.com,
 nicolas.carrier@nav-timing.safrangroup.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCnRoaXMgc2VyaWVzIGJyaW5ncyBpbiBuZXcgcGFja2FnZXMgaW4gb3JkZXIgdG8gZW5h
YmxlIGJ1aWxkaW5nCkNvbXBsaWFuY2UgQXMgQ29kZSBwb2xpY2llcyBbMV0gKENhQykgb24gYSB0
YXJnZXQuIFRoaXMgcHJvamVjdCBhaW1zIHRvCnByb3ZpZGUgc2VjdXJpdHkgcG9saWN5IGNvbnRl
bnQgb24gc3lzdGVtczogdGhpcyBjb250ZW50IGJyaW5ncyBkYXRhCmZpbGVzIGRlc2NyaWJpbmcg
Y2hlY2tzIHN0YW5kYXJkcyBhbmQgYXV0b21hdGlvbnMgZm9yIHN5c3RlbQpjb25maWd1cmF0aW9u
LiAgVGhvc2UgZmlsZXMgY29tZSBpbiB2YXJpb3VzIGZvcm1hdHMgKFhDQ0RGLCBPVkFMLCBTQ0FQ
KS4KVGhpcyBwcm9qZWN0IGlzIHRpZ2h0bHkgY291cGxlZCB0byB0aGUgT3BlblNDQVAgdG9vbCBb
Ml06Ci0gdG8gYnVpbGQgdGhlIGRhdGEgZmlsZXMgdG8gZW1iZWQgb24gdGhlIHRhcmdldCBzeXN0
ZW0KLSBhbmQgdG8gcGVyZm9ybSBhbmFseXNpcyBvbiB0aGUgc3lzdGVtLCBieSBjb25zdW1pbmcg
dGhlIGRhdGEgZmlsZXMKCkNhQyB0aGVuIGRlcGVuZHMgb24gYm90aCBvcGVuc2NhcCBhbmQgaG9z
dC1vcGVuc2NhcC4KVGhlIHNlcmllcyBicmluZ3MgaW4gdGhlIGZvbGxvd2luZyBjb21taXRzOgot
IGNvbW1pdCAxIGJyaW5ncyBsaWJ4bXNlYzEsIG9uZSBvZiBvcGVuc2NhcCBkZXBlbmRlbmNpZXMK
LSBjb21taXQgMiBicmluZ3MgYmFjayBob3N0LWxpYmN1cmwgKHdoaWNoIGhhcyBiZWVuIHN1cHBv
cnRlZCBhbmQgbGF0ZXIKICByZW1vdmVkIGZyb20gQlIsIGFzIHRoZXJlIHdhcyBubyB1c2VyIGFu
eW1vcmUpLCBzaW5jZSBob3N0LW9wZW5zY2FwCiAgbmVlZHMgaG9zdC1saWJjdXJsCi0gY29tbWl0
IDMgYnJpbmdzIG9wZW5zY2FwIHBhY2thZ2UKLSBjb21taXQgNCBicmluZ3MgQ2FDIHBhY2thZ2UK
ClRoZSBuZXcgQ2FDIHBhY2thZ2UgYnJpbmdzIGEgbWluaW1hbCBmZWF0dXJlIHNldCBmb3Igbm93
OiBpdCBvbmx5IGJyaW5ncwp0aGUgc2VjdXJpdHkgcG9saWN5IGRhdGEgZmlsZXMgKGllOiBYTUwg
ZmlsZXMpIG9uIHRoZSB0YXJnZXQuIEl0IGNhbiBiZQpleHRlbmRlZCBsYXRlciBhcyBuZWVkZWQg
dG8gYnJpbmcgaW4gZm9yIGV4YW1wbGUgZ2VuZXJhdGVkIGJhc2ggc2NyaXB0LAphbnNpYmxlIHBs
YXlib29rcywgZXRjLgoKVGVzdGluZyBvdXRwdXQ6CiQgLi91dGlscy90ZXN0LXBrZyAtYyBjYWMu
Y29uZmlnIC1wIGNvbXBsaWFuY2UtYXMtY29kZQogICBib290bGluLWFybXY1LXVjbGliYyBbMS82
XTogT0sKICAgYm9vdGxpbi1hcm12Ny1nbGliYyBbMi82XTogT0sKICAgYm9vdGxpbi1hcm12N20t
dWNsaWJjIFszLzZdOiBTS0lQUEVECiAgIGJvb3RsaW4teDg2LTY0LW11c2wgWzQvNl06IE9LCiAg
IGJyLWFybS1mdWxsLXN0YXRpYyBbNS82XTogU0tJUFBFRAogICBhcm0tYWFyY2g2NCBbNi82XTog
T0sKClsxXSBodHRwczovL2dpdGh1Yi5jb20vQ29tcGxpYW5jZUFzQ29kZS9jb250ZW50ClsyXSBo
dHRwczovL2dpdGh1Yi5jb20vT3BlblNDQVAvb3BlbnNjYXAKClNpZ25lZC1vZmYtYnk6IEFsZXhp
cyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQpBbGV4aXMgTG90aG9y
w6kgKDQpOgogICAgICBwYWNrYWdlL2xpYnhtbHNlYzE6IEFkZCBsaWJ4bWxzZWMxIHVzZWQgYnkg
b3BlblNDQVAKICAgICAgcGFja2FnZS9saWJjdXJsOiBSZWFwcGx5ICJsaWJjdXJsOiBhZGQgaG9z
dCB2YXJpYW50IgogICAgICBwYWNrYWdlL29wZW5zY2FwOiBhZGQgb3BlbnNjYXAgcGFja2FnZQog
ICAgICBwYWNrYWdlL2NvbXBsaWFuY2UtYXMtY29kZTogYWRkIG5ldyBwYWNrYWdlCgogcGFja2Fn
ZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKwogcGFj
a2FnZS9jb21wbGlhbmNlLWFzLWNvZGUvQ29uZmlnLmluICAgICAgICAgICAgICAgfCAzNSArKysr
KysrKysrKysrKysKIHBhY2thZ2UvY29tcGxpYW5jZS1hcy1jb2RlL2NvbXBsaWFuY2UtYXMtY29k
ZS5oYXNoIHwgIDUgKysrCiBwYWNrYWdlL2NvbXBsaWFuY2UtYXMtY29kZS9jb21wbGlhbmNlLWFz
LWNvZGUubWsgICB8IDM0ICsrKysrKysrKysrKysrCiBwYWNrYWdlL2xpYmN1cmwvbGliY3VybC5t
ayAgICAgICAgICAgICAgICAgICAgICAgICB8IDEzICsrKysrKwogcGFja2FnZS9saWJ4bWxzZWMx
L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysrKysKIHBhY2thZ2UvbGli
eG1sc2VjMS9saWJ4bWxzZWMxLmhhc2ggICAgICAgICAgICAgICAgIHwgIDQgKysKIHBhY2thZ2Uv
bGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rICAgICAgICAgICAgICAgICAgIHwgMjggKysrKysrKysr
KysrCiBwYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICB8
IDE4ICsrKysrKysrCiBwYWNrYWdlL29wZW5zY2FwL29wZW5zY2FwLmhhc2ggICAgICAgICAgICAg
ICAgICAgICB8ICA2ICsrKwogcGFja2FnZS9vcGVuc2NhcC9vcGVuc2NhcC5tayAgICAgICAgICAg
ICAgICAgICAgICAgfCA1MiArKysrKysrKysrKysrKysrKysrKysrCiAxMSBmaWxlcyBjaGFuZ2Vk
LCAyMTEgaW5zZXJ0aW9ucygrKQotLS0KYmFzZS1jb21taXQ6IDA0NjEwNDNhNTEzMjJlYmNmN2Nk
ZDkwYjBkMmY5YjU5ZGYxN2JiOWMKY2hhbmdlLWlkOiAyMDI1MDcyNC1vcGVuc2NhcC03MTY2ZmJl
MTU3MWUKCkJlc3QgcmVnYXJkcywKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
