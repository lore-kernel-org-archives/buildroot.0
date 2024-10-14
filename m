Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EE9D16279
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 14:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC32B80C06;
	Mon, 14 Oct 2024 14:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKfF4ojnvf2U; Mon, 14 Oct 2024 14:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CB3580BDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CB3580BDF;
	Mon, 14 Oct 2024 14:39:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C2E61BF2BA
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 14:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B275607DB
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 14:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rv50aarCv5U7 for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 14:39:42 +0000 (UTC)
X-Greylist: delayed 609 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 14 Oct 2024 14:39:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4097E607D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4097E607D3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4097E607D3
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 14:39:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E0FE240006;
 Mon, 14 Oct 2024 14:39:40 +0000 (UTC)
Date: Mon, 14 Oct 2024 16:39:39 +0200
To: buildroot@buildroot.org
Message-ID: <20241014163939.1a743bd7@kmaincent-XPS-13-7390>
In-Reply-To: <20241014142923.246809-1-kory.maincent@bootlin.com>
References: <20241014142923.246809-1-kory.maincent@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728916780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLJM7Uuawf3ZZhsczX2Pvcy1w3G5GMxofq3rNK6/zrY=;
 b=O5HnKMfywFnohQTf3+gt5/9aHRfdLRiQPtRrzsReLNLurPWYLmN506UaBifpNIDxgLiCf0
 ltBAjJTDPrn+JAObJUv2coR+i+B3LdcZ1uNMp1ZyrRyf4vFYHFowQUkBxez38nXbGrk+/b
 GQwJqK7kjTneTawoev/kOEAgbkfI8k5qqCg0ATHgdjR0O5ZiDUVbUwMXbmaVCyUuVR7aIa
 kzJs04XpxWRMfV7cfg9Uq0K5yQ7PjuZArEzTWP0OW4HSpfDlKPHKFoa489Fkr8nBPwusTz
 w8vMdtseJNOLZlYGdouiDrPn8FprkRcAdOAaCU5Oh+LBbLLUiP2iGMKB5zV+Uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O5HnKMfy
Subject: Re: [Buildroot] [PATCH v6 0/3] Adds support for TrustedFirmware-M
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, thomas.petazzoni@bootlin.com,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxNCBPY3QgMjAyNCAxNDoyOToxOSArMDAwMApLb3J5IE1haW5jZW50IDxrb3J5Lm1h
aW5jZW50QGJvb3RsaW4uY29tPiB3cm90ZToKCj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZv
ciBUcnVzdGVkRmlybXdhcmUtTSAoVEYtTSkuCj4gaHR0cHM6Ly90cnVzdGVkZmlybXdhcmUtbS5y
ZWFkdGhlZG9jcy5pbwo+IGh0dHBzOi8vZ2l0LnRydXN0ZWRmaXJtd2FyZS5vcmcvVEYtTS90cnVz
dGVkLWZpcm13YXJlLW0uZ2l0Cj4gCj4gVHJ1c3RlZCBGaXJtd2FyZS1NIGltcGxlbWVudHMgdGhl
IFNlY3VyZSBQcm9jZXNzaW5nIEVudmlyb25tZW50IChTUEUpCj4gZm9yIEFybXY4LU0sIEFybXY4
LjEtTSBhcmNoaXRlY3R1cmVzIChlLmcuIHRoZSBDb3J0ZXgtTTMzLCBDb3J0ZXgtTTIzLAo+IENv
cnRleC1NNTUsIENvcnRleC1NODUgcHJvY2Vzc29ycykgb3IgZHVhbC1jb3JlIHBsYXRmb3Jtcy4K
PiAKPiBQYXRjaGVzIDEtMjogQWRkcmVzcyBob3N0IFB5dGhvbiBwYWNrYWdlIGRlcGVuZGVuY2ll
cy4KPiBQYXRjaCAzOiBBZGQgc3VwcG9ydCBmb3IgVEYtTS4KPiAKPiBDaGFuZ2VzIGluIHY1Ogo+
IC0gUmVtb3ZlIHB5dGhvbi1jYm9yMiBob3N0IHN1cHBvcnQgZGVwZW5kZW5jeSB3aGljaCBpcyBh
bHJlYWR5IG1lcmdlZAo+ICAgbWFpbmxpbmUuCj4gLSBVc2UgRVhUUkFfRE9XTkxPQUQgaW5zdGVh
ZCBvZiBzdWJwYWNrYWdlcyBmb3IgM3JkIHBhcnRpZXMuCj4gLSBSZW1vdmUgVEYtTSB0ZXN0cyAz
cmQgcGFydGllcy4KPiAtIE1hZGUgZmV3IEtjb25maWcsIGFuZCBjbWFrZSBjaGFuZ2VzLgoKT29w
cywgc21hbGwgbWlzdGFrZSwgSSB1c2VkIHY2IGluIHRoZSBzdWJqZWN0IGluc3RlYWQgb2YgdjUu
CgpSZWdhcmRzLAotLSAKS8O2cnkgTWFpbmNlbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
