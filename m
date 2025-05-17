Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEF7C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 09:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBAC783E15;
	Sat, 17 May 2025 09:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vy45aeA9xaPe; Sat, 17 May 2025 09:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C33083E12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C33083E12;
	Sat, 17 May 2025 09:33:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32C691DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20DC583E12
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JrROQeu2eKr2 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 09:33:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0324081CA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0324081CA3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0324081CA3
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:33:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6C1243349;
 Sat, 17 May 2025 09:33:30 +0000 (UTC)
Date: Sat, 17 May 2025 11:33:30 +0200
To: Mattias =?UTF-8?B?V2Fsc3Ryw7Zt?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>, Jan
 =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>
Message-ID: <20250517113330.1306723e@windsurf>
In-Reply-To: <20250512173506.3179898-2-lazzer@gmail.com>
References: <20250512173506.3179898-1-lazzer@gmail.com>
 <20250512173506.3179898-2-lazzer@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudehvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedthfehjeegffevteeuteetheekkeevudeuleegfedvkedvueetudduudekgeevnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhgriiiivghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtt
 hhopehhvghikhhordhthhhivghrhiesghhmrghilhdrtghomhdprhgtphhtthhopehjrghnrdhkuhhnughrrghtsegtvghsnhgvthdrtgii
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747474411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpupTwS26cTMRMFsUvvFqBCxZymvDbMvzVkF3NcMZQY=;
 b=fsLJAJTq8AOaSk5LdF+v4gW2p5geW0zGHUrE5whwnOe7flkmBdlVdAt64GhLAXjdQLizN4
 Gvo+0nZteS9B8q4IDwDC8ksOS0mKfzUD07TTMbB57MHbUV5DOjjSaBwfYnEZ8wWaUHi9xN
 NWvmu0G6uQlFE9/RZ4NfX62Nhtc1YnAmI3Q5pstGxoRBiUnmsWstbxi8hAcnO50ygqqn67
 GPBGHXH5cgY1YZaRNgxdU96yp9jRjJ9EjaVMi0+JjVjjIPwblm4zVd4EFaERx3mFhCck+x
 YlxuuG1tn6qbKZILokCmU/HZrzuHCpzo6FiSVJjDtsHc5G9BDufpZspaetNcmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fsLJAJTq
Subject: Re: [Buildroot] [PATCH v3 1/6] package/sysrepo: bump to version
 3.6.11
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

SGVsbG8gTWF0dGlhcywKCk9uIE1vbiwgMTIgTWF5IDIwMjUgMTk6MzU6MDEgKzAyMDAKTWF0dGlh
cyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+IHdyb3RlOgoKPiBDaGFuZ2Vsb2c6Cj4gIHNl
dmVyYWwgbW9kZXJhdGUgb3B0aW1pemF0aW9ucyAoQGlyZmFuSGFzbGFuZGVkKQo+ICBzZXNzaW9u
IHB1c2ggb3BlciBkYXRhIGNhY2hlCj4gIGxvdHMgb2YgbWlub3IgYnVnZml4ZXMgYW5kIGltcHJv
dmVtZW50cwo+IAo+IERlcGVuZHMgb24gbGlieWFuZyB2My4xMi4yIGh0dHBzOi8vZ2l0aHViLmNv
bS9DRVNORVQvbGlieWFuZy9yZWxlYXNlcy90YWcvdjMuMTIuMgo+IAo+IFNpZ25lZC1vZmYtYnk6
IE1hdHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21haWwuY29tPgoKVGhhbmtzIGZvciB5b3VyIHBh
dGNoIHNlcmllcy4gSSBoYXZlIGFwcGxpZWQgaXQgYWxsLCBjb3VwbGUgb2YgY29tbWVudHM6Cgot
IEkgc3F1YXNoZWQgeW91ciBwYXRjaGVzIDQvNiBhbmQgNS82IGludG8gdGhlIGxpYm5ldGNvbmYy
IHVwZGF0ZSwKICBiZWNhdXNlIGl0J3MgcmVhbGx5IHBhcnQgb2YgdGhlIHNhbWUgY2hhbmdlCgot
IEkgbWVzc2VkIHVwOiBJIGRpZCBub3QgcmVhbGl6ZSB5b3VyIGhhZCBQQVRDSCA2LzYsIGFuZCBJ
IGZhY2VkIGEKICBuZXRvcGVlcjIgYnVpbGQgZmFpbHVyZSwgc28gSSBidW1wZWQgaXQsIGFuZCBp
dCdzIHJpZ2h0IGFmdGVyIHB1c2hpbmcKICB0aGF0IEkgcmVhbGl6ZWQgeW91ciBzZXJpZXMgZGlk
IGNvbnRhaW4gdGhlIGJ1bXAKCi0gbmV0b3BlZXIyIGRvZXNuJ3QgYnVpbGQgd2hlbiBtYmVkdGxz
IGlzIGVuYWJsZWQgYXMgYSBjcnlwdG8gYmFja2VuZC4KICBVbmZvcnR1bmF0ZWx5LCB0aGVyZSdz
IG5vIHdheSB0byB0ZWxsIGxpYm5ldGNvbmYyIHRvIE5PVCB1c2UgbWJlZHRscwogIHdoZW4gbm90
IGF2YWlsYWJsZS4gQ2FuIHlvdSBsb29rIGludG8gdGhpcywgcmVwcm9kdWNlIHRoZSBpc3N1ZSAo
anVzdAogIGJ1aWxkIHdpdGggbWJlZHRscyBlbmFibGVkKSBhbmQgd29yayB3aXRoIHVwc3RyZWFt
IHRvIGZpeCB0aGUgaXNzdWU/CgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRh
enpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
