Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E9CC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 08:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52E2D40ABB;
	Wed,  6 Aug 2025 08:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lRNtDmgYBz5; Wed,  6 Aug 2025 08:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F76740A63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F76740A63;
	Wed,  6 Aug 2025 08:57:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EA8631
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 08:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00B676141D
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 08:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgAXWGGsCX0a for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 08:57:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED3A8612EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED3A8612EA
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED3A8612EA
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 08:57:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40C5B43355;
 Wed,  6 Aug 2025 08:57:09 +0000 (UTC)
Date: Wed, 6 Aug 2025 10:57:07 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, Nicolas Carrier
 <nicolas.carrier@nav-timing.safrangroup.com>
Message-ID: <20250806105707.3db4f1e8@windsurf>
In-Reply-To: <20250806-php-lua-v1-1-e1f524fed0a5@bootlin.com>
References: <20250806-php-lua-v1-1-e1f524fed0a5@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedthfehjeegffevteeuteetheekkeevudeuleegfedvkedvueetudduudekgeevnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhot
 hdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754470629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=buiB6V3+oFti3nmyVrwgHEPdU98koNgZyOeAlCETekU=;
 b=OCSKDBokho3D45FDizwOvjOfmW2iPnzrU/Rw3o4OpsJandg6gaXs291iRx+jln9DwTUUTw
 E2i9RPhGNyZuXHN/2oT1cxc7HztAoXnh9sxTMbsD+9XLqJqMS2MI0sFP3SA/QAgXt5aC74
 aKp2f0/ZjdzoykNs11YDQCwyaG2ZTiAXaOfYW2NkGGXNBn+/4nRse4J9P9BiD2LdNI7L9p
 5txM06TndtM7HFVPH+NRytY8+H+ygadAbzAEsBIAP8iaoC7g1UQqOG0QZJ1ikYlfsiKgeZ
 kWbkiIUR2P51vN+y0Oypg72ZdJkbCt+rpPyRjd8nK7uzy5C+FMFPezm0mJjPGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OCSKDBok
Subject: Re: [Buildroot] [PATCH] package/php-lua: fix build with GCC14
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

SGVsbG8gQWxleGlzLAoKT24gV2VkLCAwNiBBdWcgMjAyNSAxMDoxMjo0OSArMDIwMApBbGV4aXMg
TG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gT24gQnVpbGRy
b290IDIwMjUuMDIueCwgcGhwLWx1YSBidWlsZCBmYWlscyBvbiB0aGUgZm9sbG93aW5nIGVycm9y
OgoKQnVpbGRyb290IDIwMjUuMDIueCBpcyBvbmUgdGhpbmcsIGJ1dCBkbyB5b3UgYWxzbyBzZWUg
dGhlIHNhbWUgYnVpbGQKaXNzdWUgb24gbWFzdGVyPwoKU2luY2UgdGhlcmUncyBubyBidWlsZCBm
YWlsdXJlIGluIG91ciBhdXRvYnVpbGRlciAod2hpY2ggaXMga2luZCBvZgpzdXJwcmlzaW5nKSwg
Y291bGQgeW91IGluY2x1ZGUgaW4gdGhlIGNvbW1pdCBsb2cgYSBzbmlwcGV0IG9mIGEKcmVhc29u
YWJseSBtaW5pbWFsIGRlZmNvbmZpZyB0aGF0IGV4aGliaXRzIHRoZSBpc3N1ZT8KCkFsc28sIGRv
IHlvdSBrbm93IHdoYXQgY2F1c2VkIHRoZSBmYWlsdXJlPyBJIHdvdWxkIHN1c3BlY3QgYW4gdXBk
YXRlIG9mClBIUC4KCj4gSSd2ZSB0YWtlbiBhIGxvb2sgYXQgdGhlIG9mZmljaWFsIHVwc3RyZWFt
IHRvIG1ha2UgdGhlIGZpeCBpbnRlZ3JhdGVkIGluCj4gaGVyZSBhcyB3ZWxsLCBidXQgaXQgcmVh
bGx5IGxvb2tzIGxpa2UgYSBkZWFkIGVuZDogdGhlcmUgaGFzIGJlZW4gbm8KPiBhY3Rpdml0eSBm
b3IgNSB5ZWFycywgYW5kIHRoZSBtYWludGFpbmVyIGRvZXMgbm90IHNlZW0gdG8gYW5zd2VyIFBS
cyBvcgo+IGlzc3Vlcy4gVGhlIFBSIGNvbnRhaW5pbmcgdGhlIHR3byBwYXRjaGVzIGludHJvZHVj
ZWQgd2l0aCB0aGUgQlIgcGFja2FnZQo+IGhhcyBub3QgZXZlbiBiZWVuIG1lcmdlZC4gSSBoYXZl
IGJlZW4gdGVtcHRlZCB0byByZXBsYWNlIHRoZSB1cHN0cmVhbQo+IHNvdXJjZSB3aXRoIHRoZSBm
b3JrIGZyb20gd2hpY2ggSSB0b29rIHRoZSBwYXRjaAo+IChodHRwczovL2dpdGh1Yi5jb20vYmFk
b28vcGhwLWx1YSksIHdoaWNoIGxvb2tzIHNsaWdodGx5IGxlc3MgImRlYWQiCj4gKGxhc3QgYWN0
aXZpdHkgMiB5ZWFycyBhZ28sIGFuZCBzb21lIHdvcmsgZG9uZSB0byB1cGRhdGUgdGhlIG1vZHVs
ZQo+IGNvbXBhdGliaWxpdHkgd2l0aCBjdXJyZW50IFBIUCBtYWpvciB2ZXJzaW9uKS4gIEkgZXZl
bnR1YWxseSBjaG9zZSB0bwo+IGtlZXAgdGhlIGN1cnJlbnQgdXBzdHJlYW0gYW5kIGJyaW5nIHRo
aXMgc2luZ2xlIHBhdGNoLCBidXQgcGxlYXNlIGxldCBtZQo+IGtub3cgaWYgY2hhbmdpbmcgdGhl
IHVwc3RyZWFtIHNvdXJjZSB3b3VsZCBiZSBiZXR0ZXIuCgpJdCdzIG9mIGNvdXJzZSBhbm5veWlu
ZyB0byBoYXZlIHVubWFpbnRhaW5lZCB0aGluZ3MgcGFja2FnZWQgaW4KQnVpbGRyb290LiBJIGd1
ZXNzIE5pY29sYXMgaXMgc3RpbGwgdXNpbmcgdGhpcyBzb2Z0d2FyZSBjb21wb25lbnQ/CgpUaG9t
YXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290
bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
