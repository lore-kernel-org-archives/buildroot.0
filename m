Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBB6C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F27578002A;
	Wed,  5 Feb 2025 15:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id je5QfP_Za9lp; Wed,  5 Feb 2025 15:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10D24805AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10D24805AA;
	Wed,  5 Feb 2025 15:12:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5252BCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CFAC40A8A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gWYJDRDTeMA for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 26314409BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26314409BD
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26314409BD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:12:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA5F444406;
 Wed,  5 Feb 2025 15:12:26 +0000 (UTC)
Date: Wed, 5 Feb 2025 16:12:25 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, Adam
 Duskett <adam.duskett@amarulasolutions.com>, Daniel Lang <dalang@gmx.at>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Message-ID: <20250205161225.1c79da47@windsurf>
In-Reply-To: <20250118083837.2883279-6-bernd@kuhls.net>
References: <20250118083837.2883279-1-bernd@kuhls.net>
 <20250118083837.2883279-6-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudetueefkeeiveeigeeugeeigfdvveehgffguddtieeuvddtgfelvdegveelieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepsggvrhhnugeskhhuhhhlshdrnhgvthdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepvghrihgtrdhlvgdrsghihhgrnhdruggvvhesfhhrvggvrdhfrhdprhgtphhtthhopegruggrmhdrughushhkvghtthesrghmrghruhhlrghsohhluhhtihhon
 hhsrdgtohhmpdhrtghpthhtohepuggrlhgrnhhgsehgmhigrdgrthdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehvrghlvghnthhinhhkohhrvghnsghlihhtsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738768347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fB9RZU7Za5B01d/ccTvJdUNeDuqalIO1ofV3DV5XsDQ=;
 b=I7E99vuK6iHCThHeglxYT2Mgx69rBsU1Zt7WExSqgvSaoIZn27Zzy6Ps+mSEgloHDvf8cd
 DI2C7Tx6A+MpSTKixNeaw7lTVI+yoc8aRLSQmgXnbmuvLcCxHqkiEJWPkTsC06f7/S/5py
 K7gUWcVgKutcLTa5KJStjZCOHyO5JH7rmXcwFHzfhb6iEvIb6KNBxvqjsEff8rqN1+fUko
 Xv9j/EFFOJfn6T5Z4dfe0z08TdjQXMZ7pj9gElDPE29lilGkQwzx171+akI73ZAvDwx5Nv
 hR4n5kTGFwk8EqI4TPN1JDEUnkNNY3E61k8vmhCeFHKqzSXXigRcrodfo7Oi2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I7E99vuK
Subject: Re: [Buildroot] [PATCH 6/6] package/mesa3d: add option to enable
 VIRTIO vulkan driver
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

T24gU2F0LCAxOCBKYW4gMjAyNSAwOTozODozNyArMDEwMApCZXJuZCBLdWhscyA8YmVybmRAa3Vo
bHMubmV0PiB3cm90ZToKCj4gRnJvbTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8u
b3JnPgo+IAo+IFRoZSBzdXBwb3J0IGZvciBWZW51cyAodGhlIFZ1bGthbiBWaXJ0SU8gZW5jYXBz
dWxhdGlvbikgaW4gTUVTQSBoYXMKPiBiZWVuIHN0YWJsZSBzaW5jZSAyMy4yIHNvIGFkZCBhbiBv
cHRpb24gdG8gZW5hYmxlIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJu
ZEBrdWhscy5uZXQ+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBs
aW5hcm8ub3JnPgo+IE1lc3NhZ2UtSWQ6IDwyMDI0MDgyMjE4MTU0Ni42NDkwMC02LWJlcm5kQGt1
aGxzLm5ldD4KPiAtLS0KPiAgcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluIHwgNiArKysrKysKPiAg
cGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMg
UGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
