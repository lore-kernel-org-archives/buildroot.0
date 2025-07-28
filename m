Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186F8C83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 20:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D676C40F62;
	Mon, 28 Jul 2025 20:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkR5nlSfamec; Mon, 28 Jul 2025 20:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3D1440F53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3D1440F53;
	Mon, 28 Jul 2025 20:50:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32269D78
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F67D60C1C
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkjTu5jg7lq0 for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 20:49:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1ED6060C12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ED6060C12
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1ED6060C12
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:49:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8C5544465;
 Mon, 28 Jul 2025 20:49:56 +0000 (UTC)
Date: Mon, 28 Jul 2025 22:49:55 +0200
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Vincent =?UTF-8?B?U3RlaGzDqQ==?=
 <vincent.stehle@laposte.net>, Vincent =?UTF-8?B?U3RlaGzDqQ==?=
 <vincent.stehle@arm.com>
Message-ID: <20250728224955.01eab38a@windsurf>
In-Reply-To: <20250725223613.1401870-1-ju.o@free.fr>
References: <20250725223613.1401870-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelfedujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuffffteejheefjeejleevledvleetjeefveetvdevtddtueeflefhgeehvdffieenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhhurdhosehfrhgvv
 gdrfhhrpdhrtghpthhtohepvhhinhgtvghnthdrshhtvghhlhgvsehlrghpohhsthgvrdhnvghtpdhrtghpthhtohepvhhinhgtvghnthdrshhtvghhlhgvsegrrhhmrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753735796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R61YUyqOx7SUVYih8b7g78Dn1tAu9LHE8UTsuqkAhVI=;
 b=N8KofWKyfZ8zXgPjqLeise6ygrrLfvbGEul+sceAKPc+xQto0n/w6V+H1EZg+w3cfgaXCp
 O5Ekv6PDci+dkh/nxNu+dW+ThH8eSotZPrwX6lkz7EdIpjD3TH7sUNcUguJDIsG5JP3iRu
 6T9L21wgJMzv1yQGOB4fZSsl2N3WuFXjMba158sYJ4gU1rujURqyUp+FyKrBiBh+5MgG8d
 v4tOHZItJaBTlA6NkPGUzD3FLRRFMNWJtzbb0v/elKtPPqLJ85mM7arVpR0kHnfzHdR+cm
 G0WOIY3MSrSkg/5xeEPF5aphYFq30/TZzAsecZPaD0FkypqyYm05FAwBZMM2sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N8KofWKy
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_xen: rename
 TestXen to TestXenAarch64
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

T24gU2F0LCAyNiBKdWwgMjAyNSAwMDozNjoxMyArMDIwMApKdWxpZW4gT2xpdmFpbiB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IENvbW1pdCBbMV0gaW50
cm9kdWNlZCBhbiBBcm12NyB0ZXN0IGNhc2UgZm9yIFhlbiBuYW1lZCBUZXN0WGVuQXJtdjcsCj4g
bmV4dCB0byB0aGUgb3JpZ2luYWwgQWFyY2g2NCB0ZXN0IGNhc2Ugd2hpY2ggd2FzIHNpbXBseSBu
YW1lZCBUZXN0WGVuLgo+IAo+IFRoZSB0ZXN0IGxpc3Qgc2hvd3MsIGZvciBleGFtcGxlIHdpdGgg
dGhlIGNvbW1hbmQKPiAic3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyAtbCI6Cj4gCj4gICAgIHRl
c3RzLnBhY2thZ2UudGVzdF94ZW4uVGVzdFhlbgo+ICAgICB0ZXN0cy5wYWNrYWdlLnRlc3RfeGVu
LlRlc3RYZW5Bcm12Nwo+IAo+IEluIG9yZGVyIHRvIG1ha2UgdGhpcyB0ZXN0IGxpc3QgYSBiaXQg
bW9yZSBleHBsaWNpdCwgdGhpcyBjb21taXQKPiByZW5hbWVzIHRoZSBUZXN0WGVuIHRvIFRlc3RY
ZW5BYXJjaDY0LiBXaXRoIHRoYXQgY2hhbmdlLCB0aGUgbGlzdAo+IGJlY29tZXM6Cj4gCj4gICAg
IHRlc3RzLnBhY2thZ2UudGVzdF94ZW4uVGVzdFhlbkFhcmNoNjQKPiAgICAgdGVzdHMucGFja2Fn
ZS50ZXN0X3hlbi5UZXN0WGVuQXJtdjcKPiAKPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzUzNDY4MjRhODM0ODhmODQwMDA4ZWIyNGY4NDg2
NjQzNWFjMzJhMTIKPiAKPiBDYzogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0u
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+CgpMb29r
cyBnb29kOgoKUmV2aWV3ZWQtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlA
Ym9vdGxpbi5jb20+CgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93
bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
