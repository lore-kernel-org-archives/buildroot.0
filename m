Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F9DC87FCB
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 18:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F475613FC;
	Wed, 30 Jul 2025 18:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpFQJdIO7ylB; Wed, 30 Jul 2025 18:09:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E01D613D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E01D613D4;
	Wed, 30 Jul 2025 18:09:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BAFC186
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 18:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 261EC613D4
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 18:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-bI5EUisptq for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 18:09:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E646660EAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E646660EAC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E646660EAC
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 18:09:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36D6C41DE2;
 Wed, 30 Jul 2025 18:09:12 +0000 (UTC)
Mime-Version: 1.0
Date: Wed, 30 Jul 2025 20:09:11 +0200
Message-Id: <DBPLAFAMQCJW.9Q3OD0DZX1BS@bootlin.com>
Cc: <tim.hammer@nav-timing.safrangroup.com>,
 <nicolas.carrier@nav-timing.safrangroup.com>, <buildroot@buildroot.org>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
 <20250730-openscap-v1-4-46e4a32e26da@bootlin.com>
 <20250730191834.6bc7f097@windsurf>
In-Reply-To: <20250730191834.6bc7f097@windsurf>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudevleeiudffkeelgffhkeevkedvledvveehjeekkeekjedtledujeduudfgheffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhimhdrhhgrmhhmvghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehnrghvq
 dhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753898952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6oMro1/uXaPtUP6Yz4u/dA+l2VwalzhA/dVt9VD1fI=;
 b=bj4y4FaQYfvYGVlieZ6/vuHr0uviRc8aKYRRaENLoHOi/3MrnYYv9m+j2WnEZooLy8dJlv
 6RJjeFQUrYsunGvmi1Jlt3Jb9FJNuAJpkXGEKS7PXUJU08ObTQgvfNRSN3s1m8/D8STRBH
 tCmLpHpb9K2myn3WVBH0xP+iet+3jwfDglZ0qWUOeJ2fJSXnIcWX9ukgqdFdKAd1ekk13v
 +3Nsorc/fEdNzcphNM/EYhenGhQwiMPxbpo3BzKG61//uhFVoVpC0OY1TmALUAfgL2wZoq
 qnh+WSHmBcNGFd5Zd414/vV/nxo8qLLGOZYdEQ7zFAGGVBToeD8xrEDbJlXAFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bj4y4FaQ
Subject: Re: [Buildroot] [PATCH 4/4] package/compliance-as-code: add new
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkIEp1bCAzMCwgMjAyNSBhdCA3OjE4IFBNIENFU1QsIFRob21hcyBQZXRhenpvbmkgdmlh
IGJ1aWxkcm9vdCB3cm90ZToKPiBIZWxsbyBBbGV4aXMsCj4KPiBUaGFua3MgZm9yIHRoaXMgcGF0
Y2ggKGFnYWluISkuIFNvbWUgY29tbWVudHMgYmVsb3cuCj4KPiBPbiBXZWQsIDMwIEp1bCAyMDI1
IDE0OjQ3OjE2ICswMjAwCj4gQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGlu
LmNvbT4gd3JvdGU6Cj4KPj4gSW50cm9kdWNlIHRoZSBDb21wbGlhbmNlIEFzIENvZGUgcGFja2Fn
ZS4gVGhpcyBwcm9qZWN0IHByb3ZpZGVzIGRhdGEKPj4gZmlsZXMgY29uc3VtZWQgYnkgdGhlIG9w
ZW5zY2FwIHRvb2wgdG8gZXZhbHVhdGUgYSBob3N0IGNvbXBsaWFuY2UgaW4KPj4gcmVnYXJkIHdp
dGggc2VjdXJpdHkgcG9saWNpZXMuIFRoZSBwYWNrYWdlIGRlcGVuZHMgb24gYm90aCBob3N0LW9w
ZW5zY2FwCj4+IChuZWVkZWQgYXQgYnVpbGQgdGltZSB0byBwcm9jZXNzIHRoZSBpbnB1dCBmaWxl
cyBpbnRvIHVzYWJsZSBmaWxlcykgYW5kCj4+IG9wZW5zY2FwIChuZWVkZWQgb24gdGhlIHRhcmdl
dCwgd2lsbCB1c2UgdGhlIGdlbmVyYXRlZCBmaWxlcyB0byBldmFsdWF0ZQo+PiB0aGUgc3lzdGVt
IGNvbmZpZ3VyYXRpb24pCj4+IAo+PiBUaGUgcHJvamVjdCBpcyBiYXNlZCBvbiBjbWFrZSwgYnV0
IGl0IGFsc28gZXhwb3NlcyBhIHdyYXBwZXIgc2NyaXB0Cj4+IChidWlsZF9wcm9kdWN0KS4gVGhl
IHBhY2thZ2UgdXNlcyB0aGUgY21ha2UgYnVpbGQgc3lzdGVtLCBidXQgZXhwb3NlcyBhCj4+IGZl
dyBLY29uZmlnIG9wdGlvbnMgdG8gcmVwbGljYXRlIHNvbWUgb2YgdGhlIGJ1aWxkX3Byb2R1Y3Qg
b3B0aW9uczoKPj4gLSBCUjJfUEFDS0FHRV9DT01QTElBTkNFX0FTX0NPREVfREFUQVNUUkVBTV9P
TkxZOiByZXBsaWNhdGVzIHRoZSAtZAo+PiAgIG9wdGlvbiwgYnVpbGRpbmcgb25seSB0aGUgZGF0
YXN0cmVhbSBmaWxlcyBpbnN0ZWFkIG9mIGFsbCB0aGUgZmlsZXMKPj4gLSBCUjJfUEFDS0FHRV9D
T01QTElBTkNFX0FTX0NPREVfUFJPRFVDVFM6IGFsbG93IHNlbGVjdGluZyB0aGUKPj4gICBwcm9k
dWN0KHMpIGZvciB3aGljaCB3ZSB3YW50IHRvIGdlbmVyYXRlIHBvbGljaWVzIGZpbGVzLgo+PiAK
Pj4gVGhlIGRlZmF1bHQgaW5zdGFsbCB0YXJnZXQgcHJvdmlkZWQgYnkgdGhlIHByb2plY3QgZXhw
ZWN0cyBhIGZ1bGwgYnVpbGQsCj4+IGFuZCBzbyBpdCB3aWxsIHRyeSB0byBnZW5lcmF0ZSBhbGwg
dGhlIGZpbGVzIGZvciBhbGwgdGhlIHByb2R1Y3RzIHdoZW4KPj4gZXhlY3V0ZWQgKHdoaWNoIGNh
bmNlbHMgdGhlIGJlbmVmaXQgb2YgYmVpbmcgYWJsZSB0byBzZWxlY3Qgb25seSBhCj4+IHNpbmds
ZSBvciBhIGZldyBwcm9kdWN0cyksIHNvIHRoZSBwYWNrYWdlIGRlZmluZXMgYSBjdXN0b20gaW5z
dGFsbAo+PiBjb21tYW5kLgo+Cj4gVmVyeSBuaWNlIGNvbW1pdCBtZXNzYWdlLiBQZXJoYXBzIHRv
byBuaWNlIGFzIGl0IG1ha2VzIG1lIHRoaW5rOiB3aGF0Cj4gYWJvdXQgYSBzdXBwb3J0L3Rlc3Rp
bmcvIHRlc3QgY2FzZSBmb3IgdGhpcyBwYWNrYWdlPwoKVGhhbmtzIGZvciB0aGUgcG9pbnRlciwg
SSB3YXMgbm90IGF3YXJlIG9mIHRob3NlIGludGVncmF0ZWQgdGVzdHMuIEknbGwKdGFrZSBhIGxv
b2sgYXQgaXQgYW5kIGFkZCBzb21lICh3aXRob3V0IGtub3dpbmcgeWV0IHRoZSBmdWxsIHNjb3Bl
IG9mIHRoaXMKZnJhbWV3b3JrLCBJIGd1ZXNzIGl0IHdvdWxkIGJlIG5pY2UgdG8gZ2V0IGF0IGxl
YXN0IGEgbWF0cml4IG9mIHRlc3RzIG9uCnRoZSBkaWZmZXJlbnQgS2NvbmZpZyBvcHRpb25zIGFk
ZGVkIGZvciB0aGlzIHBhY2thZ2UpCgpbLi4uXQoKPj4gK0NPTVBMSUFOQ0VfQVNfQ09ERV9ERVBF
TkRFTkNJRVMgPSBcCj4+ICsJaG9zdC1weXRob24zIFwKPj4gKwlob3N0LW9wZW5zY2FwIFwKPj4g
KwlvcGVuc2NhcCBcCj4+ICsJaG9zdC1weXRob24tamluamEyIFwKPj4gKwlob3N0LXB5dGhvbi1w
eXlhbWwgXAo+PiArCWhvc3QtbGlieHNsdCBcCj4+ICsJaG9zdC1saWJ4bWwyCj4KPiBJIGFzc3Vt
ZSB5b3UgdmVyaWZpZWQgYWxsIHRob3NlIGhvc3QgZGVwZW5kZW5jaWVzIGFyZSBhY3R1YWxseSBu
ZWVkZWQ/CgpZZXMuIEZvciBhbGwgdGhlIHBhY2thZ2VzIGFkZGVkIGluIHRoaXMgc2VyaWVzLCBJ
IHN0YXJ0ZWQgYnkgcGVyZm9ybWluZyBhCm5hdGl2ZSBidWlsZCBpbiBhIG1pbmltYWwgY29udGFp
bmVyLCB0byBkaXN0aW5ndWlzaCB0aGUgbWFuZGF0b3J5CmRlcGVuZGVuY2llcyBmcm9tIHRoZSBv
cHRpb25hbCBvbmVzLiBTbyB0aGlzIGxpc3QgcmVhbGx5IHJlZmxlY3RzIHRoZQptaW5pbWFsIHNl
dCBvZiBuZWVkZWQgZGVwcy4KCj4+ICsKPj4gK0NPTVBMSUFOQ0VfQVNfQ09ERV9DT05GX0VOViA9
IE9QRU5TQ0FQX1JPT1RfRElSPSQoSE9TVF9ESVIpCj4+ICtDT01QTElBTkNFX0FTX0NPREVfU1VQ
UE9SVFNfSU5fU09VUkNFX0JVSUxEID0gTk8KPj4gK0NPTVBMSUFOQ0VfQVNfQ09ERV9NQUtFX09Q
VFMgPSBcCj4+ICsJJChmb3JlYWNoIHAsXAo+PiArCSQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FH
RV9DT01QTElBTkNFX0FTX0NPREVfUFJPRFVDVFMpKSxcCj4+ICsJJChpZiAkKEJSMl9QQUNLQUdF
X0NPTVBMSUFOQ0VfQVNfQ09ERV9EQVRBU1RSRUFNX09OTFkpLCBnZW5lcmF0ZS1zc2ctJChwKS1k
cy54bWwsICQocCkpKQo+Cj4gSG93IGRvZXMgdGhhdCB3b3JrIHdoZW4KPiBCUjJfUEFDS0FHRV9D
T01QTElBTkNFX0FTX0NPREVfREFUQVNUUkVBTV9PTkxZPXkgYW5kCj4gQlIyX1BBQ0tBR0VfQ09N
UExJQU5DRV9BU19DT0RFX1BST0RVQ1RTIGlzIGVtcHR5PyBUaGlzIHdpbGwgbGVhZCB0bwo+IENP
TVBMSUFOQ0VfQVNfQ09ERV9NQUtFX09QVFMgYmVpbmcgZW1wdHksIHNvIEkgZG9uJ3Qgc2VlIGhv
dyB0aGUgYnVpbGQKPiBjYW4gZGlmZmVyZW50aWF0ZSBCUjJfUEFDS0FHRV9DT01QTElBTkNFX0FT
X0NPREVfREFUQVNUUkVBTV9PTkxZPXkgdnMuCj4gQlIyX1BBQ0tBR0VfQ09NUExJQU5DRV9BU19D
T0RFX0RBVEFTVFJFQU1fT05MWSBkaXNhYmxlZC4KCkFoLCBnb29kIGNhdGNoICEgSSBhY2NpZGVu
dGFsbHkgZ290IHJpZCBvZiBhIGJsb2NrIGhlcmUgd2hlbiByZXdvcmtpbmcgdGhpcwpwYXJ0LiBU
aGF0IHNob3VsZCByYXRoZXIgYmU6CgppZmVxKCQoQlIyX1BBQ0tBR0VfQ09NUExJQU5DRV9BU19D
T0RFX0RBVEFTVFJFQU1fT05MWSkseSkKQ09NUExJQU5DRV9BU19DT0RFX01BS0VfT1BUUyA9IC1k
CmVuZGlmCgpDT01QTElBTkNFX0FTX0NPREVfTUFLRV9PUFRTICs9IFwKCSQoZm9yZWFjaCBwLFwK
CSQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9DT01QTElBTkNFX0FTX0NPREVfUFJPRFVDVFMp
KSxcCgkkKGlmICQoQlIyX1BBQ0tBR0VfQ09NUExJQU5DRV9BU19DT0RFX0RBVEFTVFJFQU1fT05M
WSksIGdlbmVyYXRlLXNzZy0kKHApLWRzLnhtbCwgJChwKSkpCgooYW5kIHNvLCArPSBpbnN0ZWFk
IG9mID0gd2hlbiBldmFsdWF0aW5nIHRoZSBwcm9kdWN0cyBzdHJpbmcpCgpBbGV4aXMKCi0tIApB
bGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
