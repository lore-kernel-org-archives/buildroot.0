Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90E4CA0FE8
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 15:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92420428F0;
	Mon, 25 Aug 2025 15:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfSy6SBKdmRI; Mon, 25 Aug 2025 15:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55F1941F7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55F1941F7B;
	Mon, 25 Aug 2025 15:00:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4331ECA
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 15:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A0BC611EF
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 15:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXDhCvuH616K for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 15:00:12 +0000 (UTC)
X-Greylist: delayed 381 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 25 Aug 2025 15:00:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB32A60E87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB32A60E87
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB32A60E87
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 15:00:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9D8CB4E40BEF;
 Mon, 25 Aug 2025 14:53:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 62216605F1;
 Mon, 25 Aug 2025 14:53:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DFD921C22D3CC; 
 Mon, 25 Aug 2025 16:53:36 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 25 Aug 2025 16:53:35 +0200
Message-Id: <DCBLETOE9LO5.2XZ5QD1LFF31D@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
To: "Romain Naour" <romain.naour@smile.fr>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250811-php-lua-v3-1-f238174c6e4a@bootlin.com>
 <5120138b-60e2-40ba-9f17-ea421c56be14@smile.fr>
In-Reply-To: <5120138b-60e2-40ba-9f17-ea421c56be14@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756133626; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ABsKy/UGJTnfbjML5T0xTFiQn3v/DSxNjNX1gO2P2LQ=;
 b=d7Ccint2KcSEZ1J/HSwUI/tNpezGvVcHgmQ6bWpczRKPSRfpAC8NNBCCo+PqAX9GdumII5
 8ysbV0eGXUXfITYFKlqi4erL6Y8lKK5YkKa3Jbi6JKIzW+F4CR7CH5ioOkhIXMnjusTGpj
 hYk6CTb6DxsKEQkQb4GBlwYWsZKBmyeMDREWySt4ymKeAR1x7Va1iQITuD4rYVKwX+E3kQ
 8VADCi/xKZiHcdqMuEIRDdRftC7gqAGNGL0ATMXceC/01RyRRVxVUaeoTtvaTiKzKgnCyP
 QH5hJzKeV1/6CFj8LW2NST+yC4yLrn9c30eWl8Op0NaNXw86hbVrzAsGMiJxOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=d7Ccint2
Subject: Re: [Buildroot] [PATCH v3] package/php-lua: fix build with
 PHP8/GCC14
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

SGkgUm9tYWluLAoKT24gU3VuIEF1ZyAyNCwgMjAyNSBhdCA1OjM2IFBNIENFU1QsIFJvbWFpbiBO
YW91ciB3cm90ZToKPiBIZWxsbyBBbGV4aXMsIFRob21hcywgQWxsLAo+Cj4gTGUgMTEvMDgvMjAy
NSDDoCAwOTo1MiwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKClsu
Li5dCgo+PiArRnJvbSBkZTEwNjhkNjM0NTE5YWJmMjQ2MWRhYzk0MjdiNWZmMjRiNjYwM2FmIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiArRnJvbTogTWlraGFpbCBHYWxhbmluIDxtaWtoYWls
LmdhbGFuaW5AdGVhbS5idW1ibGUuY29tPgo+PiArRGF0ZTogVHVlLCAyNCBBdWcgMjAyMSAwODoy
ODo0NyArMDEwMAo+PiArU3ViamVjdDogW1BBVENIXSBwaHA4OiBTaWduYXR1cmUgb2Ygd3JpdGVf
cHJvcGVydHkvcmVhZF9wcm9wZXJ0eSB3YXMgY2hhbmdlZAo+PiArIGluIGh0dHBzOi8vZ2l0aHVi
LmNvbS9waHAvcGhwLXNyYy9jb21taXQvOTFlZjQxMjRlNTYKPj4gKwo+PiArVGFrZW4gZnJvbSBo
dHRwczovL2dpdGh1Yi5jb20vYmFkb28vcGhwLWx1YS9wdWxsLzgKPj4gKwo+PiArVXBzdHJlYW06
IG4vYQo+Cj4gSSB1cGRhdGVkIHRoZSBsaW5rIGZvbGxvd2luZyBUaG9tYXMncyByZXBseSBbMV0K
Pgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyNTA4MTMxMjQzNTMu
NDAxNWM0NjZAd2luZHN1cmYvCj4KPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKTXkgYmFk
IGZvciB0aGUgYWJzZW5jZSBvZiByZWFjdGlvbiBvbiBteSBzaWRlLCBJIGhhdmUgYmVlbiBvZmYg
Zm9yIGEgZmV3CmRheXMsIGFuZCB0aGVuIHRyYXZlbGxpbmcgZm9yIGNvbmZlcmVuY2UuIFRoYW5r
cyBmb3IgaGFuZGxpbmcgdGhpcyAhCgpBbGV4aXMKCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+
CgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
