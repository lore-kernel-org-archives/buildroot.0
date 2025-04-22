Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBB1C369D1
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 21:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F05B405FB;
	Tue, 22 Apr 2025 21:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XA1tu4b7AMy; Tue, 22 Apr 2025 21:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94A6640692
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94A6640692;
	Tue, 22 Apr 2025 21:36:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 265DA1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17A7D80D97
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNiydb_qXouy for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 21:36:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08EC080D7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08EC080D7E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08EC080D7E
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:36:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 833621FCE7;
 Tue, 22 Apr 2025 21:36:50 +0000 (UTC)
Date: Tue, 22 Apr 2025 23:36:49 +0200
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Julien
 Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>, Akhilesh Nema
 <nemaakhilesh@gmail.com>
Message-ID: <20250422233649.5574293c@windsurf>
In-Reply-To: <20250328180427.3434693-17-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-17-olteanv@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopeholhhtvggrnhhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegtihhorhhnvghii
 hhorghnrgesghhmrghilhdrtghomhdprhgtphhtthhopeeurhgrnhguohhnrdforghivghrsegtohhllhhinhhsrdgtohhmpdhrtghpthhtohepvhhjrghrughinhesfhhrvggvrdhfrhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepnhgvmhgrrghkhhhilhgvshhhsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745357811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5DjvlRSougMJ2t0rRtk7RERP23oMtuuYjptFq7KWUV8=;
 b=a8B1BkCcUpZ7URcMLUnCX6QYaBWpdxXKw+ms6gJ7p49Lwdkc/XWKt6zDGSmJn/GOH3LqCi
 gboF3NTlX/pS6DKIHEHcUoKtK7Ip9kNm+r6xB4XsbYcJmJvzNGdVa37ZDDOLTg3KE0ECaM
 T9Hbt9Mdi5JkDLMFIYYTXc3D19v5tSVm5jIWwcZiQ3aYqYdlYo9iklmGhGgrTlAAgdhTvb
 NhZD9XKJupoMEdGYaoBhpus+2WPDKndQ8KmHbQXqDOHMI0qYeBz5geE3UROuNJsABcZqDV
 2Jld9QNOEaaF02ThFGX5JpXvQaSVPyM+JBjlbgQxaBbf2UqrvmBAV+Zpx4p7Ew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a8B1BkCc
Subject: Re: [Buildroot] [PATCH v2 16/18] package/qoriq-restool: new package
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

SGVsbG8gVmxhZCwKCk9uIEZyaSwgMjggTWFyIDIwMjUgMjA6MDQ6MjQgKzAyMDAKVmxhZGltaXIg
T2x0ZWFuIDxvbHRlYW52QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEludHJvZHVjZSBhIHBhY2thZ2Ug
Zm9yIHRoZSByZXN0b29sIHByb2dyYW0sIHdoaWNoIHBlcm1pdHMgdGhlIHVzZXIgdG8KPiBtb2Rp
ZnkgdGhlIG5ldHdvcmsgY29uZmlndXJhdGlvbiBvZiB0aGUgRFBBQTIgc3Vic3lzdGVtIGFuZCBj
cmVhdGUgb25lCj4gdGhhdCBpcyBhZGVxdWF0ZSB0byB0aGVpciB1c2UgY2FzZS4KPiAKPiBXZSBp
bnRlZ3JhdGUgdGhlIG1hc3RlciBicmFuY2gsIHdoaWNoIGlzIHRoZSBsZi02LjEyLjMtMS4wLjAg
dGFnIHBsdXMKPiBjb21taXQgMTRhOTA1OGM3NzJiICgibWFucGFnZTogaXQgc2hvdWxkIGJlIG9w
dGlvbmFsIikuIEl0IHdhcyBwb2ludGVkCj4gb3V0IG9uIHByZXZpb3VzIHBhdGNoIHN1Ym1pc3Np
b25zIHRoYXQgdGhlICJtYWtlIGluc3RhbGwiIHRhcmdldCBhbHNvCj4gY29udmVydHMgbWFuIHBh
Z2VzIGZyb20gTWFya2Rvd24gdG8gZ3JvZmYgdXNpbmcgcGFuZG9jLCBhbmQgYXBhcnQgZnJvbQo+
IHRoZSBmYWN0IHRoYXQgQnVpbGRyb290IGRvZXNuJ3Qgd2FudCBtYW5wYWdlcywgcGFuZG9jIGlz
IGFsc28gdG9vIGhlYXZ5Cj4gdG8gZHJhZyBpbnRvIHRoZSBidWlsZCBzeXN0ZW0uIFNvIHRoYXQg
ZmVlZGJhY2sgd2FzIGNvbnNpZGVyZWQgdmFsaWQgYW5kCj4gdGhlIHBhdGNoIGlzIGluY2x1ZGVk
IGhlcmUgdmlhIHVwc3RyZWFtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIE9sdGVhbiA8
b2x0ZWFudkBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFZpbmNlbnQgSmFyZGluIDx2amFyZGlu
QGZyZWUuZnI+Cj4gLS0tCj4gdjEtPnYyOiBpbnRlZ3JhdGUgYSBwYXRjaCBmcm9tIFZpbmNlbnQK
Ckkgd2FudGVkIHRvIGFwcGx5IHRoaXMsIGJ1dCB1bmZvcnR1bmF0ZWx5LCB0aGUgQyBjb2RlIGZh
aWxzIGJhZGx5IHRvCmNvbXBpbGUgb24gQVJNIDMyLWJpdDoKCm1jX3YxMC9mc2xfbWNfY21kLmg6
NTY6NDI6IGVycm9yOiByaWdodCBzaGlmdCBjb3VudCA+PSB3aWR0aCBvZiB0eXBlIFstV2Vycm9y
PXNoaWZ0LWNvdW50LW92ZXJmbG93XQogICA1NiB8ICAgICAgICAgICAgICAgICAoKCh+MFVMKSA8
PCAobCkpICYgKH4wVUwgPj4gKEJJVFNfUEVSX0xPTkcgLSAxIC0gKGgpKSkpCiAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgoKKGxvdHMgb2Ygc2ltaWxh
ciBpc3N1ZXMpCgpkcG1hY19jb21tYW5kcy5jOiBJbiBmdW5jdGlvbiDigJhwcmludF9kcG1hY19j
b3VudGVyc+KAmToKZHBtYWNfY29tbWFuZHMuYzozMzA6MzE6IGVycm9yOiBmb3JtYXQg4oCYJWx1
4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhsb25nIHVuc2lnbmVkIGludOKAmSwgYnV0
IGFyZ3VtZW50IDMgaGFzIHR5cGUg4oCYdWludDY0X3TigJkge2FrYSDigJhsb25nIGxvbmcgdW5z
aWduZWQgaW504oCZfSBbLVdlcnJvcj1mb3JtYXQ9XQogIDMzMCB8ICAgICAgICAgICAgICAgICBw
cmludGYoIiVzOiAlbHVcbiIsIGRwYWEyX21hY19jb3VudGVyc1tpXS5uYW1lLCBjb3VudGVyX3Zh
bHVlKTsKClNlZW1zIGxpa2UgaXQncyBwcm9iYWJseSBuZXZlciBiZWVuIGJ1aWx0IGZvciAzMi1i
aXQgdGFyZ2V0cy4gSWYgeW91Cm9ubHkgdXNlIGl0IG9uIEFSTTY0LCBvbmUgb3B0aW9uIGlzICJk
ZXBlbmRzIG9uIEJSMl9hYXJjaDY0Ii4KT3RoZXJ3aXNlLCB0aG9zZSBpc3N1ZXMgbmVlZCB0byBi
ZSBhZGRyZXNzZWQuCgpNaW5pbWFsIHJlcHJvZHVjZXI6CgpCUjJfYXJtPXkKQlIyX2NvcnRleF9h
OT15CkJSMl9BUk1fRU5BQkxFX1ZGUD15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQpCUjJfVE9P
TENIQUlOX0VYVEVSTkFMX0JPT1RMSU49eQpCUjJfSU5JVF9OT05FPXkKQlIyX1NZU1RFTV9CSU5f
U0hfTk9ORT15CiMgQlIyX1BBQ0tBR0VfQlVTWUJPWCBpcyBub3Qgc2V0CkJSMl9QQUNLQUdFX1FP
UklRX1JFU1RPT0w9eQojIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CgpUaGFua3Mh
CgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
