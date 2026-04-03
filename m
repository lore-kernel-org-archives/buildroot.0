Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD3DE8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 18:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E94CD412B0;
	Fri,  3 Apr 2026 18:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maKKiv2Ask9M; Fri,  3 Apr 2026 18:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89D52412A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775239889;
	bh=3fUHTAXMDFqeccxem6S4jcc0NTOmiGMPWL06nCFMijc=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HuOa9oC6/KZMUgtsv8+X5+cCAw8H7NCFzTHg0G3/gl6j3t3Lat2X1cH/076/aEj7q
	 6FGxTYVUgTzR9Wk/JMd0dx0YzHlulU9A3wVIUYMSWbOl2z9mR0p8e5S0IEZTPsycmb
	 Em6/Z5TxBUnI7gXVE8TTbtp9PuOV8106ENXYm8p7H6700TM1fNOzXAQAZhrnwxar1E
	 i512K1LBAT4IxX+zgjHPvfGOTyjQiplBvVOJTX1SXHCuRnGqwxJWqAUAe+tB5jMcOe
	 u9YXltdPkbTxqaPXD8nsgo9mCY5KR+kRGE5pxYqxbueL1R++bzTRcTWD+LvESeP994
	 gl0UsGwkdhKPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89D52412A8;
	Fri,  3 Apr 2026 18:11:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D89161F3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA978412A8
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TTlOo30x8IX for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 18:11:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D586241295
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D586241295
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D586241295
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:11:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 40EE44E428D7
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:11:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1116C603C1;
 Fri,  3 Apr 2026 18:11:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9B08D10450104; 
 Fri,  3 Apr 2026 20:11:22 +0200 (CEST)
Mime-Version: 1.0
Date: Fri, 03 Apr 2026 20:11:22 +0200
Message-Id: <DHJQ0N8BR7K0.L3C18D4LRPJA@bootlin.com>
Cc: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 <buildroot@buildroot.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: "Julien Olivain" <ju.o@free.fr>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-openscap_bump-v2-1-dd4242ff402e@bootlin.com>
 <6b1475adada2414a1bdf9321c4352be6@free.fr>
 <23497d25f46611f800f019eebbad6ca3@free.fr>
In-Reply-To: <23497d25f46611f800f019eebbad6ca3@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1775239883; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ihZHiBn2iXEmwQTYK3tBZATIos/oe17bKRcd7w7ts/c=;
 b=DDHpoJhcDESPBpThwbgeNOs32xVoOeq3Ump74JdZGzi2KePRFcG3yYiNraAWJH1MSayLjQ
 4XyD3+4w3ewdyGck2cB66Y+oKkDra0/uJDC0T+vNQ2CKUkMhgf9jGCK+6pAHzwpKc6iyFZ
 gCBz+IHtP6Cn98bHrRYZg7qMVejRjynmx2VWYfuFSiOJA0XkSeM9+qkCVA0bqgY6uFtGXJ
 jfQLkMlqw/opMcKjZb6A1ByqJNk0UGwZ6r4Ll6J/zW5b5D7cIiYRmn7gV8CS931pOmrC/r
 e1Dv0boXFYBZbcx82i2pKtxata8uPBNbG5oagrLfWYJ1Jip1i4CRWvuU8HuwGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DDHpoJhc
Subject: Re: [Buildroot] [PATCH v2] package/openscap: bump to version 1.4.3
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

SGkgSnVsaWVuLAoKT24gRnJpIEFwciAzLCAyMDI2IGF0IDg6MDMgUE0gQ0VTVCwgSnVsaWVuIE9s
aXZhaW4gd3JvdGU6Cj4gT24gMDMvMDQvMjAyNiAxOTo1NiwgSnVsaWVuIE9saXZhaW4gdmlhIGJ1
aWxkcm9vdCB3cm90ZToKPj4gT24gMDMvMDQvMjAyNiAxNDozOCwgQWxleGlzIExvdGhvcsOpIHZp
YSBidWlsZHJvb3Qgd3JvdGU6Cj4+PiBUaGUgY3VzdG9tIHBhdGNoIHRvIGVuZm9yY2UgcHJvamVj
dCBhcyBDIHByb2plY3QgaGFzIGJlZW4gbWVyZ2VkIAo+Pj4gdXBzdHJlYW0KPj4+IHNpbmNlIHRo
ZW4sIGJ1dCBpdCBpcyBub3QgcmVsZWFzZWQgeWV0LiBUaGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBw
YXRjaCAKPj4+IHRvCj4+PiBhcHBseSBpdCBvbiB0b3Agb2YgMS40LjMsIGFuZCB1c2UgdGhlIG9w
cG9ydHVuaXR5IHRvIGZpeCB0aGUgcGF0Y2ggCj4+PiBmaWxlCj4+PiBuYW1lIHRvIG1hdGNoIHRo
ZSBjb21taXQgdGl0bGUuCj4+PiAKPj4+IFNpbmNlIHZlcnNpb24gMS40LjAsIG9wZW5zY2FwIGRl
cGVuZHMgb24gUENSRTIgcmF0aGVyIHRoYW4gUENSRQo+Pj4gCj4+PiBodHRwczovL2dpdGh1Yi5j
b20vT3BlblNDQVAvb3BlbnNjYXAvY29tcGFyZS8xLjMuMTIuLi4xLjQuMwo+Pj4gCj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+
PiAKPj4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4gRm9yIGluZm8sIEkgcmVtb3ZlZCB0aGUK
Pj4gInNlbGVjdCBCUjJfUEFDS0FHRV9QQ1JFX1VURiIgaW4gQ29uZmlnLmluLCB3aGljaCB3YXMg
Z2VuZXJhdGluZyBhCj4+IEtjb25maWcgd2FybmluZy4gVGhpcyBjb21wbGV0ZXMgdGhlIHN3aXRj
aCB0byBwY3JlMi4gU2VlOgo+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9jb21taXQvY2U4ZjkwNWJhYzIxODRiZGZjNDY2YjA3MmQyZTVjYzViYmQxZTE0OQo+
Cj4gRm9yIGluZm8sIEkgYXBwbGllZCB0aGUgdjEgb2YgdGhlIHBhdGNoLiBTb3JyeSBhYm91dCB0
aGF0LgoKTm8gcHJvYmxlbSwgdGhhbmtzIGZvciB0aGUgcHJvbXB0IG1lcmdlLgoKQWxleGlzCj4K
Pj4gQmVzdCByZWdhcmRzLAo+PiAKPj4gSnVsaWVuLgo+Cj4gSnVsaWVuLgoKCgoKLS0gCkFsZXhp
cyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
