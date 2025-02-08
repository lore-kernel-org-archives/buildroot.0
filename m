Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5C4C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 17:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B60AE40236;
	Sat,  8 Feb 2025 17:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCX0R6vajyLe; Sat,  8 Feb 2025 17:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C45404BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C45404BA;
	Sat,  8 Feb 2025 17:02:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BEC66C
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FD0560647
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUw3uy4McVi5 for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 17:02:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94BD6606E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94BD6606E7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94BD6606E7
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:02:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64F1643147;
 Sat,  8 Feb 2025 17:02:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tgoDb-003HNF-1y;
 Sat, 08 Feb 2025 18:02:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Romain Naour <romain.naour@smile.fr>
References: <20241211233144.729270-1-ju.o@free.fr>
 <2ef490d2-3b3a-4054-96e6-5337fde9495f@smile.fr>
 <86f08e24-ed59-4fc6-b802-4449113418bc@smile.fr>
Date: Sat, 08 Feb 2025 18:02:11 +0100
In-Reply-To: <86f08e24-ed59-4fc6-b802-4449113418bc@smile.fr> (Romain Naour via
 buildroot's message of "Wed, 5 Feb 2025 13:05:52 +0100")
Message-ID: <87y0yg9xpo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgfgsehtqhdttddtreejnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepleehuedvleeltefhhffhveekgfekgeeiffegjeehgeekffekhfehueelgfegfefhnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: fix test_atf by
 bumping atf to 2.11
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

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBMZSAwNS8wMi8yMDI1IMOgIDEzOjAzLCBSb21haW4g
TmFvdXIgYSDDqWNyaXTCoDoKID4+IEhlbGxvIEp1bGllbiwgQWxsLAogPj4gCiA+PiBMZSAxMi8x
Mi8yMDI0IMOgIDAwOjMxLCBKdWxpZW4gT2xpdmFpbiBhIMOpY3JpdMKgOgogPj4+IFNpbmNlIGNv
bW1pdCBbMV0sIHRlc3RfYXRmIGlzIGZhaWxpbmcuIFNlZSBbMl0uCiA+Pj4gCiA+Pj4gUGFzc2lu
ZyAtbm8tcGllIHRvIGxkIGRvZXMgbm90IHByb2R1Y2UgdGhlIGJsMzEuZWxmIGZpbGUgKGFuZCBk
b2VzIG5vdAogPj4+IGdlbmVyYXRlIGFuIGVycm9yKS4gVEYtQSAyLjExIHJld29ya2VkIGl0cyBt
YWtlZmlsZXMgYW5kIHN3aXRjaGVkIHRvCiA+Pj4gZ2NjIHRvIGxpbmsgZmlsZXMuIFRoaXMgY29t
bWl0IGZpeGVzIHRoaXMgZmFpbGluZyB0ZXN0IGJ5IHVwZGF0aW5nIHRvCiA+Pj4gdGhpcyBuZXdl
ciBURi1BIHZlcnNpb24uCiA+Pj4gCiA+Pj4gRml4ZXM6IFsyXS4KID4+PiAKID4+PiBbMV0gaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzI0OGMyZDA0
NWU3ODBiMjNlNmVkMTlmZWMxZjI0MjQ2MGFjNDY0ZTMKID4+PiBbMl0gaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy84NjA5MzA3ODkxCiA+PiAKID4+IEkn
bSBvayB3aXRoIHRoaXMgdXBkYXRlIGJ1dCBpcyB0aGUgc2FtZSBpc3N1ZSB3aWxsIGFwcGVhciBh
Z2FpbiB3aXRoIEFURiA8IDIuMTEKID4+IHNlbGVjdGVkIGJ5IHRoZSB1c2VyIGFzIGN1c3RvbSB2
ZXJzaW9uPwoKID4gSSBndWVzcyBJIGNhbiBhcHBseSBpdCBmb3IgdGhlIHNha2Ugb2YgdGhlIENJ
LgoKID4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkNvbW1pdHRlZCB0byAyMDI0LjExLngs
IHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
