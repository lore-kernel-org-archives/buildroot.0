Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A667C87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 12:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07CD28317B;
	Thu, 31 Jul 2025 12:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lzlx1Rdpz02x; Thu, 31 Jul 2025 12:34:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 102878462E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 102878462E;
	Thu, 31 Jul 2025 12:34:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1545713D
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 12:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03FF761AFF
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 12:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dcTUwiBcWGAQ for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 12:34:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::235;
 helo=relay15.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB564613E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB564613E5
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB564613E5
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 12:34:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32C844318C;
 Thu, 31 Jul 2025 12:34:02 +0000 (UTC)
Mime-Version: 1.0
Date: Thu, 31 Jul 2025 14:34:01 +0200
Message-Id: <DBQ8SCGP37TS.2V8HRWA7RWPTW@bootlin.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: <tim.hammer@nav-timing.safrangroup.com>,
 <nicolas.carrier@nav-timing.safrangroup.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
 <20250730-openscap-v1-3-46e4a32e26da@bootlin.com>
 <20250730190231.51e0715e@windsurf>
In-Reply-To: <20250730190231.51e0715e@windsurf>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddtkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuieejteevueeigfekfeffteetueelhffguddvfedvkeduuddvvdfgvdejleffleenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhtgihtrddqhihouhdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtihhmrdhhrghmmhgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrv
 hdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753965242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VYzS0xMwzJwxNoGu9I7G82qeP0Ep3eiBqBtV/UWdxyI=;
 b=n5VRaDudv0bhQjsruNj2YeStr5UEgOp1+T7CH8Eqhn8w/2+LgCrGiF/jGM4/CmVSu6/58H
 /uXV6Fm3Lp5ggzfJHMebELpHRhFDBI5p4S+IxeD+O56LtxG3n5K+LCc58nXqI6pplprB37
 s3loJX5t5UNBzOE1ZmfDUbfKJi1WlC/A0IgJwVgTZjrJvNGrh81onrk1Ju3zgy7WqMNTFj
 KvIiazB1f1LwAe6M3GWu40PtECPknMzvGxxJo4N7DJ1RgX7ucFUCxt6nmQHL2Dsq/IVmQR
 WJC/T0rAA6ob89vZn+cwEOHk3PEJ+i4ifUpQirtvT+gIDHupXAiuNXRg2E9RqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n5VRaDud
Subject: Re: [Buildroot] [PATCH 3/4] package/openscap: add openscap package
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

T24gV2VkIEp1bCAzMCwgMjAyNSBhdCA3OjAyIFBNIENFU1QsIFRob21hcyBQZXRhenpvbmkgdmlh
IGJ1aWxkcm9vdCB3cm90ZToKPiBIZWxsbyBBbGV4aXMsCgpbLi4uXQoKPj4gKwkJICAgICAgLURF
TkFCTEVfT1NDQVBfVVRJTD1PTiBcCj4+ICsJCSAgICAgIC1ERU5BQkxFX09TQ0FQX1VUSUxfRE9D
S0VSPU9GRiBcCj4+ICsJCSAgICAgIC1ERU5BQkxFX09TQ0FQX1VUSUxfQ0hST09UPU9GRiBcCj4+
ICsJCSAgICAgIC1ERU5BQkxFX09TQ0FQX1VUSUxfUE9ETUFOPU9GRiBcCj4+ICsJCSAgICAgIC1E
RU5BQkxFX09TQ0FQX1VUSUxfVk09T0ZGIFwKPj4gKwkJICAgICAgLURFTkFCTEVfUFJPQkVTX1dJ
TkRPV1M9T0ZGIFwKPj4gKwkJICAgICAgLURFTkFCTEVfVEVTVFM9T0ZGIFwKPj4gKwkJICAgICAg
LURXSVRIX0NSWVBUTz1nY3J5cHQgXAo+PiArCQkgICAgICAtREVOQUJMRV9QWVRIT04zPU9OCj4K
PiBPbmx5IG9uZSB0YWIgZm9yIHRoZSBpbmRlbnRhdGlvbi4KPgo+IFF1ZXN0aW9uczoKPgo+IC0g
WW91J3JlIHVzaW5nIFdJVEhfQ1JZUFRPPWdjcnlwdCwgYnV0IHlvdSBhbHNvIHNlbGVjdAo+ICAg
QlIyX1BBQ0tBR0VfT1BFTlNTTC4gWW91IG5lZWQgYm90aD8KClNvIGZyb20gdGhlIENNYWtlTGlz
dHMudHh0OgoKZmluZF9wYWNrYWdlKE9wZW5TU0wgUkVRVUlSRUQpClsuLi5dCiMgV0lUSF9DUllQ
VE8Kc2V0KFdJVEhfQ1JZUFRPICJnY3J5cHQiIENBQ0hFIFNUUklORyAiZ2NyeXB0fG5zcyIpCmlm
KCR7V0lUSF9DUllQVE99IFNUUkVRVUFMICJuc3MiKQogICAgICAgIG1lc3NhZ2UoIi0tIFVzaW5n
IE5TUyIpCiAgICAgICAgZmluZF9wYWNrYWdlKE5TUykKZWxzZSgpCiAgICAgICAgbWVzc2FnZSgi
LS0gVXNpbmcgR0NyeXB0IikKICAgICAgICBmaW5kX3BhY2thZ2UoR0NyeXB0KQplbmRpZigpCmlm
KEdDUllQVF9GT1VORCBPUiBOU1NfRk9VTkQpCiAgICAgICAgc2V0KENSWVBUT19GT1VORCBUUlVF
KQplbmRpZigpCgppdCBsb29rcyBsaWtlIGdjcnlwdC9uc3MgaXMgbm90IG1hbmRhdG9yeS4gQnV0
IGlmIEkgdHJ5IHRvIGNvbmZpZ3VyZSBhbmQKcnVuIGEgYnVpbGQgaW4gYW4gZW52aXJvbm1lbnQg
d2l0aG91dCBsaWJnY3J5cHQsIEkgZ290IHNhbWUgbGF0ZSBsaW5rYWdlCmVycm9yLCBhYm91dCBz
b21lIG1pc3NpbmcgY3JhcGlfaW5pdCAobm8sIEkgYW0gbm90IG1ha2luZyB0aGlzIGZ1bmN0aW9u
J3MKbmFtZSB1cC4uLikgYmVpbmcgbWlzc2luZy4gSXQgYXBwZWFycyB0aGF0IHRoZXJlIGFyZSBj
b2RlIHBhdGhzCnByZXByb2Nlc3NlZCBjb25kaXRpb25uYWx5IG9uIGVpdGhlciBsaWJnY3J5cHQg
b3IgbnNzIHByZXNlbmNlLCB3aXRob3V0IGFueQpmYWxsYmFjayBpZiBub25lIGlzIGZvdW5kLiBJ
IGFtIG5vdCBzdXJlIGlmIEkgYW0gZmFjaW5nIHNvbWUgb3B0aW9uYWwKZGVwZW5kZW5jaWVzIHRo
YXQgYXJlIG5vdCAib3B0aW9uYWwgZW5vdWdoIiBpbiB0aGUgY29kZSBiYXNlLCBvciBzb21lIGhh
cmQKZHBlbmRlbmNpZXMgdGhhdCBhcmUgbm90IHN1ZmZpY2llbnRseSBlbmZvcmNlZCBpbiB0aGUg
Y21ha2UgZmlsZXMuIEJ1dCBpbgp0aGUgcHJvamVjdCBjdXJyZW50IHN0YXRlLCB0aGUgc29mdHdh
cmUgZG9lcyBub3QgYnVpbGQgd2l0aG91dCBsaWJnY3J5cHQuCgpJZiBJIHRha2UgYSBmdXJ0aGVy
IGxvb2sgYXQgdGhlIGRldiBkb2MKKGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0NBUC9vcGVuc2Nh
cC9ibG9iL21haW4vZG9jcy9kZXZlbG9wZXIvZGV2ZWxvcGVyLmFkb2MpLAppdCBzZWVtcyB0byBo
aW50IHRoYXQgbGliZ2NyeXB0IGlzIGFjdHVhbGx5IG5lZWRlZCBpbiBhbnkgY2FzZS4KCkknbGwg
cmVtb3ZlIHRoZSBXSVRIX0NSWVBUTz1nY3J5cHQgdGhvdWdoLCBhcyBpdCBpcyB0aGUgZGVmYXVs
dCB2YWx1ZSBpbgpDTWFrZUxpc3RzLnR4dC4KCj4gLSBZb3UncmUgc2V0dGluZyBFTkFCTEVfUFlU
SE9OMz1PTiwgYnV0IHlvdXIgdGFyZ2V0IHBhY2thZ2UgZG9lcyBub3QKPiAgIGRlcGVuZCBvbiBo
b3N0LXB5dGhvbjMgbm9yIHB5dGhvbjMgaW4gdGVybXMgb2YgYnVpbGQgZGVwZW5kZW5jeS4KPiAg
IENvdWxkIHlvdSBjbGFyaWZ5IHdoYXQgdGhpcyBFTkFCTEVfUFlUSE9OMyBvcHRpb24gZG9lcz8K
ClRoYXQncyBhbiBvbWlzc2lvbiBvbiBteSBzaWRlLiBUaGlzIEVOQUJMRV9QWVRIT04zIGFsbG93
cyBidWlsZGluZyBzb21lCmJpbmRpbmdzICh0byB3cml0ZSBzb21lIHB5dGhvbiBhdXRvbWF0aW9u
IHRvb2xzIGJhc2VkIG9uIG9wZW5zY2FwID8pIGlmIHRoZQppbnRlcnByZXRlciBpcyBmb3VuZC4g
SSdsbCByZW1vdmUgaXQuCgo+PiArCj4+ICtIT1NUX09QRU5TQ0FQX0NPTkZfT1BUUyA9IFwKPj4g
KwkJICAgICAgLURFTkFCTEVfT1NDQVBfVVRJTD1PTiBcCj4+ICsJCSAgICAgIC1ERU5BQkxFX09T
Q0FQX1VUSUxfRE9DS0VSPU9GRiBcCj4+ICsJCSAgICAgIC1ERU5BQkxFX09TQ0FQX1VUSUxfQ0hS
T09UPU9GRiBcCj4+ICsJCSAgICAgIC1ERU5BQkxFX09TQ0FQX1VUSUxfUE9ETUFOPU9GRiBcCj4+
ICsJCSAgICAgIC1ERU5BQkxFX09TQ0FQX1VUSUxfVk09T0ZGIFwKPj4gKwkJICAgICAgLURFTkFC
TEVfUFJPQkVTX1dJTkRPV1M9T0ZGIFwKPj4gKwkJICAgICAgLURFTkFCTEVfVEVTVFM9T0ZGIFwK
Pj4gKwkJICAgICAgLURXSVRIX0NSWVBUTz1nY3J5cHQgXAo+PiArCQkgICAgICAtREVOQUJMRV9Q
WVRIT04zPU9OCj4+ICsKPj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfQUNMKSx5KQo+PiArT1BFTlND
QVBfREVQRU5ERU5DSUVTICs9IGFjbAo+PiArZW5kaWYKPgo+IE5vIGV4cGxpY2l0IG9wdGlvbiB0
byBlbmFibGUvZGlzYWJsZSBBQ0wgc3VwcG9ydD8KClVuZm9ydHVuYXRlbHkgbm8sIHRoaXMgaXMg
c2VhcmNoZWQgdW5jb25kaXRpb25hbGx5OgoKZmluZF9wYWNrYWdlKEFDTCkKaWYoQUNMX0ZPVU5E
KQogICAgICAgIGNoZWNrX2xpYnJhcnlfZXhpc3RzKCIke0FDTF9MSUJSQVJZfSIgYWNsX2V4dGVu
ZGVkX2ZpbGUgIiIgSEFWRV9BQ0xfRVhURU5ERURfRklMRSkKICAgICAgICBjaGVja19pbmNsdWRl
X2ZpbGUoYWNsL2xpYmFjbC5oIEhBVkVfQUNMX0xJQkFDTF9IKQogICAgICAgIGNoZWNrX2luY2x1
ZGVfZmlsZShzeXMvYWNsLmggSEFWRV9TWVNfQUNMX0gpCmVuZGlmKCkKCj4+ICsKPj4gK2lmZXEg
KCQoQlIyX1BBQ0tBR0VfTElCQ0FQKSx5KQo+PiArT1BFTlNDQVBfREVQRU5ERU5DSUVTICs9IGxp
YmNhcAo+PiArZW5kaWYKPgo+IFNhbWUgcXVlc3Rpb24uCgpEaXR0bwoKQWxleGlzCgotLSAKQWxl
eGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
