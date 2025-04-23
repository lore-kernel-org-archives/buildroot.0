Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C280AC369D1
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 15:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A97382060;
	Wed, 23 Apr 2025 15:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-OF3kB2g0of; Wed, 23 Apr 2025 15:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF1481F62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BF1481F62;
	Wed, 23 Apr 2025 15:37:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 086F719F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 15:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E26D381EE2
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 15:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gACb7MIVV6Du for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 15:37:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A722481D9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A722481D9F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A722481D9F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 15:37:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5C8D439AA;
 Wed, 23 Apr 2025 15:37:26 +0000 (UTC)
Date: Wed, 23 Apr 2025 17:37:25 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20250423173725.35e2ccba@windsurf>
In-Reply-To: <da0254de-812c-493b-ae1f-e96e399179ed@mind.be>
References: <20250414141150.994811-1-raphael.melotte@mind.be>
 <20250419160559.3ee73fba@windsurf>
 <da0254de-812c-493b-ae1f-e96e399179ed@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeileejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeehgeehhfeileffgeeigfeuheeifefffeegiedvgeeljeegieelteejffekgfetnecuffhomhgrihhnpehoiihlrggsshdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprhgrphhhrggvlhdrmhgvlhhothhtvgesmhhinhgurdgsvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhor
 hhgpdhrtghpthhtoheprghnghgvlhhordgtohhmphgrghhnuhgttghisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745422647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kwKq5K+4RzRZ325sntXvZVistpWFYCf8j29TWAGvCVs=;
 b=B9LFVKu9UY91BnAQKwGQX09d3vMcxnPkJqz4U4LVYPCpgFb5+V6qZrWtpxOyGzTmoH9X6F
 fzedShI2dwP/NBO7Tdzg3GxFFU9LqntLPwR5UDjCPNfNgL9nZYyn69pHqEzVQaeVio5vm8
 G4cYQI/LaR0OH0PfaRiWk2yY3wbP/xDsoGxkDSVnQR/vRQPayD5CfXXXWfErTeapmrZaN7
 PKlTuUJ3/Ry5mLaXY2882moga6dnZoQr+Hkvk6Ru+Ao2Kc3d16rdwJCw5v7l9GttU+0XrZ
 GMXEhAiCJ4DnAABSg8yCEVZxIcJOb3PaUZIRiELkyV+XebnsopvU2D3q83mRwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B9LFVKu9
Subject: Re: [Buildroot] [PATCH 1/1] package/apparmor: ignore CVE-2016-1585
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFwaGHDq2wsCgpPbiBXZWQsIDIzIEFwciAyMDI1IDE3OjMyOjQ4ICswMjAwClJhcGhh
w6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4gd3JvdGU6Cgo+IE5vLCBJIGhh
dmVuJ3QuCj4gSSd2ZSBtYWRlIHN1Y2ggcmVwb3J0cyBpbiB0aGUgcGFzdCBhbmQgSSBnZXQgdGhl
IGltcHJlc3Npb24gdGhhdAo+IHdoaWxlIHRoZXkgc29tZXRpbWVzIGRvIGdldCBwcm9jZXNzZWQs
IHNvbWV0aW1lcyB0aGV5IGRvbid0IChvciB3aXRoCj4gYSBsb25nIGRlbGF5PykuCgpPbiBteSBz
aWRlLCB0aGV5IGFsd2F5cyByZXBsaWVkLCBidXQgd2l0aCBhIGh1Z2UgZGVsYXkuCgpUaGF0IGJl
aW5nIHNhaWQsIEknbSBzdXJlIHlvdSdyZSBhd2FyZSB0aGF0IGZlZGVyYWwgYWdlbmNpZXMgaW4g
dGhlIFVTCmFyZSB0aGVzZSBkYXlzIGhhdmluZyBzb21lIHNvcnQgb2YgdHJvdWJsZXMgaW4gZ2V0
dGluZyB0aGVpciBmdW5kaW5nLAp3aGljaCBtaWdodCBleHBsYWluIHNvbWUgb2YgdGhlIHNsb3du
ZXNzIDotKQoKPiBUaGF0J3MgYSBnb29kIHBvaW50LCBJIGRvbid0IHRoaW5rIHBrZy1zdGF0cyBy
ZXBvcnRzIHN1Y2ggaXNzdWVzIHdpdGgKPiBvdXIgQ1ZFIGVudHJpZXMgeWV0IHNvIHdlIGhhdmUg
bm8gd2F5IHRvIGZpbmQgYW5kIHJlbW92ZSB0aG9zZQo+IGVudHJpZXMuCj4gCj4gSSBnYXZlIGl0
IGEgcXVpY2sgdHJ5Ogo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWls
ZHJvb3QvcGF0Y2gvMjAyNTA0MjMxNTI5MDYuMTAxNzUyMi0xLXJhcGhhZWwubWVsb3R0ZUBtaW5k
LmJlLwoKU3VwZXIgbmljZSEgT3V0IG9mIGN1cmlvc2l0eSwgZG8gd2UgaGF2ZSBzdGFsZSBlbnRy
aWVzIGFzIG9mIHRvZGF5PwoKQnV0IHdpdGggdGhhdCBpbiBwbGFjZSwgSSB3b3VsZCBkZWZpbml0
ZWx5IGJlIG1vcmUga2VlbiB0byBhY2NlcHQKSUdOT1JFX0NWRVMgZW50cmllcyBmb3IgdGhpbmdz
IHRoYXQgdWx0aW1hdGVseSBzaG91bGQgYmUgZml4ZWQgaW4gTlZEJ3MKZGF0YWJhc2UuCgpCZXN0
IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8s
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5p
bmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
