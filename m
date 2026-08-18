Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F493C5DF7D
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 13:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36668608C9;
	Tue, 18 Aug 2026 13:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQR25QNbAzGs; Tue, 18 Aug 2026 13:23:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C0546086B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787059381;
	bh=sTDM+Bm33+1/kR5QTxYhrQA3AB7Bs7ZoXMSAEHw+W18=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nlpj4TkTueochgM/NHu5xG4ogo8DvG8jz13EIJmWnqmZTeQkpxG92X3TaT7G7yCin
	 7Z0nTYljc2ohq7kKMWLQhMPogyCmhNhLCa2gAvwMPFRrjT8eNTk/RzxmEBb69bbRmC
	 PkRCn71q+b0dFDqWCU91NW2CQBRHqgu1Hzpzl1qzcZU2GjcrP+Y7+DwbwaDaGHOqnZ
	 TGUWigBFObL8UVL0H/WCfoD5C0hhol9SdiDScrGZfhUL3c41oobe8M6aolh3OnZdis
	 L+RXJUeLb8pU5j9dlGGQEmMyLh+NTv+Bm8/hH/yr9xUctK6cy79htczdlo+ImdPoDM
	 84d5755BQOEqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C0546086B;
	Tue, 18 Aug 2026 13:23:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95B5F282
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 13:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81D3F40173
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 13:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrHr9ksb-e6H for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 13:22:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7951540159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7951540159
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7951540159
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 13:22:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3C95C4E412AF;
 Tue, 18 Aug 2026 13:22:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F3C1B60355;
 Tue, 18 Aug 2026 13:22:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AE89D11C7055A; 
 Tue, 18 Aug 2026 15:22:47 +0200 (CEST)
Mime-Version: 1.0
Date: Tue, 18 Aug 2026 15:22:47 +0200
Message-Id: <DKS3OBRX08FC.1Z7R7P4USLDXM@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>, "Adrian Perez de Castro"
 <aperez@igalia.com>, "Bernd Kuhls" <bernd@kuhls.net>, "Daniel Lang"
 <dalang@gmx.at>, "Dick Olsson" <hi@senzilla.io>, "Fabio Urquiza"
 <fabiorush@gmail.com>, "Joseph Kogut" <joseph.kogut@gmail.com>, "Julien
 Olivain" <ju.o@free.fr>, "Romain Naour" <romain.naour@gmail.com>, "Valentin
 Korenblit" <valentinkorenblit@gmail.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260818-host-cmake-at-least-bump-v1-1-02fa0d7dfac5@bootlin.com>
In-Reply-To: <20260818-host-cmake-at-least-bump-v1-1-02fa0d7dfac5@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/cmake: bump host-cmake minimum
 version to 3.26
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlIEF1ZyAxOCwgMjAyNiBhdCAyOjExIFBNIENFU1QsIEFsZXhpcyBMb3Rob3LDqSB3cm90
ZToKClsuLi5dCgo+IEFuZCB3aGlsZSBJJ3ZlIG5vdCBiZWVuIGFibGUgdG8gbWFrZSBfYW55IGNt
YWtlLWJhc2VkIEMrKyBwYWNrYWdlXyBidWlsZAo+IGZhaWwgKHNvIHRoZXJlIGlzIHN0aWxsIG9u
ZSBzdWJ0bGUgZGV0YWlsIEkgYW0gbm90IGdldHRpbmcpLCBJIG1hbmFnZWQKPiB0byBtYWtlIG1h
bnkgcGFja2FnZSBidWlsZCBmYWlsIG9uIHRoaXMgZXhhY3Qgc2FtZSAic3RkbGliLmggbm90IGZv
dW5kIgo+IGVycm9yOgo+ICAgLSBwcm90b2J1Zgo+ICAgLSBnbG9nCj4gICAtIGRidXMtY3h4Cj4g
ICAtIHNkYnVzLWNwcAo+ICAgLSBsb2c0Y3h4Cj4gICAtIHRhZ2xpYgo+ICAgLSBzcWxpdGVjcHAK
PiAgIC0gLi4uCgpBIHNtYWxsIGNsYXJpZmljYXRpb24sIGJlY2F1c2UgbXkgZW5nbGlzaCBtYXkg
YmUgYSBiaXQgYnJva2VuIGhlcmU6IEkKZGlkIG5vdCBtYW5hZ2UgdG8gcmVwcm9kdWNlIHRoZSBp
c3N1ZSBmb3IgX2FsbF8gQysgY21ha2UtYmFzZWQgcGFja2FnZXMsCm9ubHkgZm9yIGEgcGFydCBv
ZiB0aGUgdXBzdHJlYW0gcGFja2FnZXMuIFRoZSBmYWlsdXJlIHRvIHJlcHJvZHVjZSB0aGUKaXNz
dWUgY291bGQgYmUgZXhwbGFpbiBmb3Igc29tZSAoZWc6IG1hbnkgQysrIHByb2plY3RzIGRvIG5v
dCB0cmlnZ2VyCmFueSBidWlsZCwgdGhvc2UgYXJlIHNlbGYtY29udGFpbmVkIGluIGEgc2luZ2xl
IGhlYWRlciwgZWcKanNvbi1mb3ItbW9kZXJuLWNwcCksIGJ1dCBhcyBhbm90aGVyIGV4YW1wbGUs
IHBhaG8tbXF0dC1jcHAgYnVpbGRzIGZpbmUKaW4gbXkgc2V0dXAsIHdoaWxlIEkgd291bGQgaGF2
ZSBleHBlY3RlZCBpdCB0byBmYWlsLgoKPiBBcyB0aGUgaXNzdWUgYWZmZWN0cyBtYW55IHBhY2th
Z2VzLCBhbmQgdGhhdCB0aGUgZmF1bHR5IGNtYWtlIHZlcnNpb24gaXMKPiBzdGlsbCBzaGlwcGVk
IG9uIHNvbWUgc3RhbmRhcmQgZGlzdHJpYnV0aW9ucywgYnVtcCB0aGUgbWluaW1hbCBob3N0LWNt
YWtlCj4gdmVyc2lvbiB0byAzLjI2IHRvIHByZXZlbnQgdGhpcyBpc3N1ZS4KPgo+IFswXSBodHRw
czovL2dpdGxhYi5raXR3YXJlLmNvbS9jbWFrZS9jbWFrZS8tL2NvbW1pdC82MDdiY2NiNGVmZTEK
Pgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxp
bi5jb20+Cj4gLS0tCj4gSGkgQnVpbGRyb290IGNvbW11bml0eSwKPiB0aGlzIHBhdGNoIHByb3Bv
c2VzIGEgcXVpdGUgYWdncmVzc2l2ZSBjbWFrZSBidW1wLCBmb2xsb3dpbmcgYSBxdWl0ZQo+IGxv
bmcgaW52ZXN0aWdhdGlvbi4gV2hpbGUgY21ha2UgMy4yNiBoYXMgYmVlbiBpbiB0aGUgd2lsZCBm
b3IgbW9yZSB0aGFuCj4gMyB5ZWFycywgaXQgaGFzIHNvbWUgbm9uIG5lZ2xpZ2VhYmxlIGNvbnNl
cXVlbmNlcyBmb3IgdXNlcnMgYW5kIENJOgo+IGhvc3QtY21ha2Ugd2lsbCBiZSBzeXN0ZW1hdGlj
YWxseSBidWlsdCBpbiBtb3JlIGNhc2VzIHRoYW4gdG9kYXksCj4gZXh0ZW5kaW5nIHRoZSBidWls
ZCB0aW1lIGluIHRoZSBwcm9jZXNzLiBJZiB0aGF0J3MgYSBuby1nbywgSSBhbSBvcGVuIHRvCj4g
aWRlYXMgYWJvdXQgaG93IHRvIGJldHRlciBoYW5kbGUgdGhpcy4KCkkgYWxzbyBmYWlsZWQgdG8g
bWVudGlvbiB0aGF0IHRoZSBpc3N1ZSBhZmZlY3RzIDIwMjUuMDIueCwgMjAyNi4wNS54IGFuZApt
YXN0ZXIuCgpBbGV4aXMKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
