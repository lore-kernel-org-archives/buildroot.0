Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D63C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 21:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF13F409CE;
	Tue, 15 Apr 2025 21:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ks03o0oQD9_E; Tue, 15 Apr 2025 21:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D720B40CBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D720B40CBE;
	Tue, 15 Apr 2025 21:07:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B8736B
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B7F9611AE
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2eYATZgBfie for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 21:07:43 +0000 (UTC)
X-Greylist: delayed 49692 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 15 Apr 2025 21:07:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6907460EC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6907460EC4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6907460EC4
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:07:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 426901FCE7;
 Tue, 15 Apr 2025 21:07:40 +0000 (UTC)
Mime-Version: 1.0
Date: Tue, 15 Apr 2025 23:07:39 +0200
Message-Id: <D97IPBMKJNQL.1EF4TZDMMBRCA@bootlin.com>
To: "Julien Olivain" <ju.o@free.fr>
Cc: <buildroot@buildroot.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Francis Laniel"
 <flaniel@linux.microsoft.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250415-bump_pahole-v1-1-6c6df3ff497f@bootlin.com>
 <51a49e9cb3753181d544641efbf14880@free.fr>
In-Reply-To: <51a49e9cb3753181d544641efbf14880@free.fr>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdegheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvfevofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefggfeijefgleekjeehieejfeeffeejjeejhfegheduueehheefiefhtefhfeegtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhin
 hdrtghomhdprhgtphhtthhopehflhgrnhhivghlsehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744751260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ny4uX2IP1ReTw7RKaLbc3L4CAOX/2agCtD6xOhtBKSg=;
 b=Pyr6IClshrst7w3C/m5MtsZIhpT5CsIsrx/dmVvEcnks2v1a6kbx4kJGp5yn4362iyRU6n
 alm9o5rYblQRpf1Ao7t+aRp+JOiIyXTlZFY2iAGMV0bNr/g8rtIx+7QzYKT5AdGWz6ngiE
 B3+PvO+ymtCGBPw/1lmvJTHHQVfKMWVCz1dDsnmAKTX+b7FdHimFsnzZ2Jc3w28pTn12Wq
 HQxqqdei3BqS5TjplFDrp6ZiwYbSiqfdAxCLdYtHZRTbbGMD+J15hsKxwVrmMJMRocm7kC
 1vMCVq+C4RROgITjfEwripGRCxYkiyZyTfBj7Wa7aWBqtI3W7t8E3xBi5gM3Ug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Pyr6ICls
Subject: Re: [Buildroot] [PATCH] package/pahole: bump to version 1.28
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

SGVsbG8gSnVsaWVuLAoKT24gVHVlIEFwciAxNSwgMjAyNSBhdCA3OjIzIFBNIENFU1QsIEp1bGll
biBPbGl2YWluIHdyb3RlOgo+IE9uIDE1LzA0LzIwMjUgMDk6MTksIEFsZXhpcyBMb3Rob3LDqSB2
aWEgYnVpbGRyb290IHdyb3RlOgo+PiBPbiBob3N0cyB3aXRoIGEgcmVjZW50IHZlcnNpb24gb2Yg
Y21ha2UgKGVnOiA0LjAuMCksIGJ1aWxkcyBpbnZvbHZpbmcKPj4gaG9zdC1wYWhvbGUgZmFpbCB3
aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3I6Cj4+IAo+PiBDTWFrZSBEZXByZWNhdGlvbiBXYXJuaW5n
IGF0IENNYWtlTGlzdHMudHh0OjEgKGNtYWtlX21pbmltdW1fcmVxdWlyZWQpOgo+PiAgIENvbXBh
dGliaWxpdHkgd2l0aCBDTWFrZSA8IDMuNSB3aWxsIGJlIHJlbW92ZWQgZnJvbSBhIGZ1dHVyZSB2
ZXJzaW9uIAo+PiBvZgo+PiAgIENNYWtlLgo+PiAKPj4gICBVcGRhdGUgdGhlIFZFUlNJT04gYXJn
dW1lbnQgPG1pbj4gdmFsdWUgb3IgdXNlIGEgLi4uPG1heD4gc3VmZml4IHRvIAo+PiB0ZWxsCj4+
ICAgQ01ha2UgdGhhdCB0aGUgcHJvamVjdCBkb2VzIG5vdCBuZWVkIGNvbXBhdGliaWxpdHkgd2l0
aCBvbGRlciAKPj4gdmVyc2lvbnMuCj4+IAo+PiBUaGUgaXNzdWUgaGFzIGFscmVhZHkgZml4ZWQg
aW4gdGhlIHVwc3RyZWFtIHByb2plY3Qgd2l0aCBjb21taXQKPj4gMTJjYTExMjgxOTEyICgiQ01h
a2VMaXN0cy50eHQ6IFJlcXVpcmUgY21ha2UgMy41IG9yIGhpZ2hlciIpLCB3aGljaCBpcwo+PiBw
YXJ0IG9mIHZlcnNpb24gMS4yOC4KPj4gCj4+IFVwZ3JhZGUgcGFob2xlIHRvIGdldCByaWQgb2Yg
dGhpcyBlcnJvci4KPj4gCj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9kZXZlbC9w
YWhvbGUvcGFob2xlLmdpdC90cmVlL05FV1M/aD12MS4yOAo+PiAKPj4gU2lnbmVkLW9mZi1ieTog
QWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPgo+IEFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCj4KPiBJIGFsc28gYWRkZWQgaW4gdGhlIGNvbW1pdCBsb2cgeW91
ciBleGFtcGxlIGNvbmZpZyB3aGljaAo+IHJlcHJvZHVjZXMgdGhlIGlzc3VlLgoKTmljZSwgdGhh
bmtzLgoKSW4gY2FzZSBpdCBoYXMgc2xpcHBlZCB0aHJvdWdoOiBhcyB0aGUgaXNzdWUgYWxzbyBl
eGlzdHMgb24gdGhlIGN1cnJlbnQKcmVsZWFzZSBicmFuY2gsIGRvIHlvdSB3YW50IG1lIHRvIHNl
bmQgYSBwYXRjaCB0YXJnZXRpbmcgdGhlIDIwMjUuMDIueApicmFuY2ggdG8gYmFja3BvcnQgdGhl
IHVwc3RyZWFtIHBhdGNoIGZpeGluZyB0aGUgaXNzdWUgPyAoYmVjYXVzZSBJIGd1ZXNzCmJ1bXBp
bmcgdGhlIHBhY2thZ2UgdmVyc2lvbiBvbiB0aGUgcmVsZWFzZSBicmFuY2ggaXMgbm90IGFuIG9w
dGlvbiA/KQoKVGhhbmtzLAoKQWxleGlzCj4KPiBCZXN0IHJlZ2FyZHMsCj4KPiBKdWxpZW4uCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgoKCi0tIApBbGV4aXMg
TG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpo
dHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
