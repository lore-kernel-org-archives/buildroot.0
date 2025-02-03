Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72159C02196
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 11:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27E63605D7;
	Mon,  3 Feb 2025 11:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vw4hpv7vHziw; Mon,  3 Feb 2025 11:42:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37D6760606
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37D6760606;
	Mon,  3 Feb 2025 11:42:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C6E9185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3849C40258
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyITa4ll6loB for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 11:42:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B83D640195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B83D640195
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B83D640195
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:42:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CE581F764;
 Mon,  3 Feb 2025 11:42:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1teuqg-00Ay7H-2E;
 Mon, 03 Feb 2025 12:42:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,  Romain Naour
 <romain.naour@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250106110130.2837398-1-peter@korsgaard.com>
Date: Mon, 03 Feb 2025 12:42:42 +0100
In-Reply-To: <20250106110130.2837398-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 6 Jan 2025 12:01:29 +0100")
Message-ID: <87y0yntft9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgfgsehtqhdttddtreejnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepleehuedvleeltefhhffhveekgfekgeeiffegjeehgeekffekhfehueelgfegfefhnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrp
 hgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] toolchain/toolchain-wrapper.c: do not pass
 linker flags if not linking
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCiA+IEZpeGVzOiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QvLS9pc3N1ZXMvNTUKID4gV2hlbiBnY2Mgc2VlcyBhIGxpbmtlciBvcHRpb24gKC1XbCwuLikg
aXQgZXhlY3V0ZXMgdGhlIGxpbmtlciwgbGVhZGluZyB0bwogPiBjb25mdXNpbmcgZXJyb3IgbWVz
c2FnZXMgaWYgbm8gc291cmNlIGZpbGVzIGFyZSBwcm92aWRlZCwgRS5HLjoKCiA+ICUgZ2NjCiA+
IGdjYzogZmF0YWwgZXJyb3I6IG5vIGlucHV0IGZpbGVzCiA+IGNvbXBpbGF0aW9uIHRlcm1pbmF0
ZWQuCgogPiAlwqBnY2MgLVdsLC16LG5vdwogPiAvdXNyL2Jpbi9sZDoKID4gL3Vzci9saWIvZ2Nj
L3g4Nl82NC1saW51eC1nbnUvMTIvLi4vLi4vLi4veDg2XzY0LWxpbnV4LWdudS9TY3J0MS5vOiBp
bgogPiBmdW5jdGlvbiBgX3N0YXJ0JzoKID4gKC50ZXh0KzB4MTcpOiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBtYWluJwogPiBjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0
dXMKCiA+IEl0IGlzIG5vdCByZWFsbHkgdHJpdmlhbCB0byBkZXRlY3QgaW4gdGhlIHdyYXBwZXIg
aWYgbGlua2luZyB3aWxsIGJlIGRvbmUsCiA+IGJ1dCB3ZSBjYW4gYXQgbGVhc3QgY2hlY2sgaWYg
YW55IG5vbi1vcHRpb24gYXJndW1lbnRzIChFLkcuICBzb3VyY2Uvb2JqZWN0CiA+IGZpbGVzKSBh
cmUgcGFzc2VkIGFuZCBza2lwIHRoZSAtV2wsLi4gb3B0aW9ucyBpZiBub3QuCgogPiAlIC4vaG9z
dC9iaW4vYWFyY2g2NC1saW51eC1nY2MKID4gYWFyY2g2NC1saW51eC1nY2MuYnJfcmVhbDogZmF0
YWwgZXJyb3I6IG5vIGlucHV0IGZpbGVzCiA+IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCgogPiBX
aXRoIHRoaXMgZml4ZWQgd2Ugbm8gbG9uZ2VyIG5lZWQgdGhlIHNwZWNpYWwgY2FzZSBmb3IgLS1o
ZWxwIC12IGZyb20gY29tbWl0CiA+IDk5NTQzMTVmYzViMiAoInRvb2xjaGFpbi90b29sY2hhaW4t
d3JhcHBlcjogbWFrZSBnY2MgLS1oZWxwIC12IHdvcmsKID4gY29ycmVjdGx5IiksIHNvIGRyb3Ag
dGhhdC4KCiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJk
LmNvbT4KCkNvbW1pdHRlZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
