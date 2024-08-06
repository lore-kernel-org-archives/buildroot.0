Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A24C3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 10:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBDF140023;
	Tue,  6 Aug 2024 10:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNADYnWniEgS; Tue,  6 Aug 2024 10:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D2E940120
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D2E940120;
	Tue,  6 Aug 2024 10:13:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18EFE1BF288
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 10:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D29D360814
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 10:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILu2lkDVpqab for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 10:13:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC3A160812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC3A160812
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC3A160812
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 10:13:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACFAB6000A;
 Tue,  6 Aug 2024 10:13:36 +0000 (UTC)
Date: Tue, 6 Aug 2024 12:13:35 +0200
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Message-ID: <20240806121335.5571bd76@windsurf>
In-Reply-To: <20240805-z-linker-v1-1-8362e6645f67@gmx.net>
References: <20240805-z-linker-v1-1-8362e6645f67@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722939216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAaDTIhEDpCPo6xe87i7vT6tiokbWeBJhi5pcg+zhB4=;
 b=RXfRTIlKUBJZAghVmw+7uhSYAwFc8/aZBrNLDh+X4JU9r1UIg3cz17eMrXOZ0AXCm7Q7B+
 DSG4PCfraOJwQB8lsNuBk/p78KjBvtHy6v5gflfcwxNvD40lZ98xG6vyWobNQM1gIgzX/j
 QxQp/jXmcx2zdjU3G91iueYzLk1WSJ+B+PEzaRBZkar8npn71XSxUAtyeMbaqp49WtORUJ
 DBgpQh/T7gp3HYsz/PrFK/keZEvCSzdaXjETJj0o5pSr/+JXHlUstQrQoKDUvUjm2TjdvY
 QAqvYEGcDevhzMNANIUXNcRCzDkSE6P2rleYcnO2XxTxu4NuumYPHXb3j2+dpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RXfRTIlK
Subject: Re: [Buildroot] [PATCH] package/Makefile.in: Use "-z text" instead
 of "-Wl, -z, text"
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAwNSBBdWcgMjAyNCAyMzo1Mzo1NiArMDIwMApKLiBOZXVzY2jDpGZlciB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEFmdGVyIHRoZSByZWNl
bnQgYWRkaXRpb24gdG8gLVdsLC16LHRleHQgdG8gVEFSR0VUX0xERkxBR1MgaW4gY2FzZSBvZgo+
IG11c2wtbGliYyBhbmQgZHluYW1pYyBsaW5raW5nLCBpdCB3YXMgZm91bmQgdGhhdCBzb21lIHBh
Y2thZ2VzIHBhc3MKPiBUQVJHRVRfTERGTEFHUyBkaXJlY3RseSB0byBsZCwgYnV0IHRoZSAtV2wg
c3ludGF4IG9ubHkgd29ya3Mgd2l0aAo+IGNvbXBpbGVyIGRyaXZlcnMgKGdjYy9jbGFuZykuIFRo
aXMgY29tbWl0IGNoYW5nZXMgdGhlIGZsYWcgdG8gLXogdGV4dCwKPiB3aGljaCB0aGUgZ2NjIGFu
ZCBjbGFuZyBhbHNvIHVuZGVyc3RhbmQgYW5kIHBhc3MgdG8gdGhlIGxpbmtlci4KPiAKPiBSZXBv
cnRlZC1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0Pgo+
IC0tLQo+IE5vdGU6IFRoaXMgcGF0Y2ggaXMgaW5zcGlyZWQgYnkgZ251LWVmaSwgd2hpY2ggcGFz
c2VzIFRBUkdFVF9MREZMQUdTCj4gZGlyZWN0bHkgdG8gbGQuIFRoaXMgcGFydGljdWxhciBjYXNl
IGlzIHNvbHZlZCBieSB0aGlzIHBhdGNoLCBidXQKPiBnbnUtZWZpIHRoZW4gZmFpbHMgZGlmZmVy
ZW50bHkgKG9uIEFSTSksIHdpdGggZXJyb3JzIHN1Y2ggYXM6CgpBcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
