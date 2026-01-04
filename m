Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CBBC2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A22560729;
	Sun,  4 Jan 2026 10:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRbsClB6t56g; Sun,  4 Jan 2026 10:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A957960708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767523787;
	bh=vPEj3M4aqiaShHZIg/wNPGnn629ND+uAm1G3G90tEFU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DSUYaKRXl/Xa3Sli+kkE7nDpLrfIIybtKRc4GVXKZu7XvEHI2n3jhkzu+QcUaLkwr
	 xRBtkxJMya9DOHgDllW28MaLftv3FYMkECabwRQd6w8KBFgP0E8ULyYwRHUmD1Uk1U
	 9kZ879QBS4X1DY0YCa8B5QaPDS2C7FQhZaWKTzJLD6h7514mNEFcYnswNosghDQXYL
	 98yRi+azYgMBHnS6T+WsJOpRJiJP7DoV0aHlulJpW9KyDWH1r134GmHMpfdcLptEC3
	 3ByMri3NVEl6WkzSF/cpygNxKWZoyfUNJkaBeFHxfoZfXLWV8tYqsva0kAGgGr3DfH
	 A0xKgn5jWG7bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A957960708;
	Sun,  4 Jan 2026 10:49:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C311C249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA179404E7
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yE8Nf1w7DHN for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:49:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E77B404D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E77B404D4
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E77B404D4
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:49:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B78E41A261E;
 Sun,  4 Jan 2026 10:49:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 85F3A6072B;
 Sun,  4 Jan 2026 10:49:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AB73C113B0449; Sun,  4 Jan 2026 11:49:42 +0100 (CET)
Date: Sun, 4 Jan 2026 11:49:41 +0100
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20260104114941.1711f3c4@windsurf>
In-Reply-To: <20251218214636.736781-2-ju.o@free.fr>
References: <20251218214636.736781-1-ju.o@free.fr>
 <20251218214636.736781-2-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767523783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6BLIHVPeOpX8RknOT87zR3wjK2+leyfS9pO3PaJczbI=;
 b=zlyvBtC3FLfgqInJCHpdUsO5stwmQkyZw1uyXcDv86KHBoSkfLdblrCMUXO3Kz9zs8mRna
 z1iHzghmldozc8ceoMalzSEeMi94/c6Fz0syuYY6HIRqwcBH4dodJjX+wn02z9TrOb8+Pl
 evpQlXvM6pyzF0YxwijuamHk9R66tfqSA/IIDCsjwdk3R1+Z4txNXhW0OxL1IIXtEP8PDB
 58qE9Y5QR3AczqJBgIYWtNaAE4R6ly42j3CpWDVHxrRz6KihmCMtHOZVQij9bRlp/YUtTn
 rPxTV1gRLxiR5tkITuLQzxxbiiIPl7ELOPFFYDTluVgWRIp/F5mirI2PtSLYhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zlyvBtC3
Subject: Re: [Buildroot] [PATCH 2/2] package/opus: bump version to 1.6
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

T24gVGh1LCAxOCBEZWMgMjAyNSAyMjo0NjozNiArMDEwMApKdWxpZW4gT2xpdmFpbiB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEZvciByZWxlYXNlIG5v
dGVzLCBzZWU6Cj4gaHR0cHM6Ly9vcHVzLWNvZGVjLm9yZy9yZWxlYXNlL3N0YWJsZS8yMDI1LzEy
LzE1L2xpYm9wdXMtMV82Lmh0bWwKPiAKPiBvcHVzIDEuNiBpbnRyb2R1Y2VkIG9wdGltaXphdGlv
biBmb3IgQXJtIHVzaW5nIE5lb24gaW50cmluc2ljcy4KPiBUaG9zZSBhcmUgbm90IGF2YWlsYWJs
ZSBpbiBzb2Z0LWZsb2F0IEFCSS4gVGhpcyBjb21taXQgZGlzYWJsZXMgdGhlCj4gdXNhZ2Ugb2Yg
aW50cmluc2ljcyBpbiB0aGF0IGNhc2UuCj4gCj4gVGhpcyBjb21taXQgYWxzbyBhZGRzIGFuIHVw
c3RyZWFtIHBhdGNoIHRvIHRoZSBsaWJvcHVzZW5jIHBhY2thZ2UuCj4gSXQgaXMgYmVjYXVzZSBs
aWJvcHVzZW5jIGlzIHVzaW5nIGludGVybmFsIGZ1bmN0aW9ucyBvZiBvcHVzLCB3aGljaAo+IHdl
cmUgcmVuYW1lZCBpbiB1cHN0cmVhbSBjb21taXQgWzFdLiBXaXRob3V0IHRoaXMgcGF0Y2gsIHRo
ZQo+IG9wdXMtdG9vbHMgcGFja2FnZSBmYWlsIHRvIGNvbXBpbGUgd2l0aCBlcnJvcjoKPiAKPiAg
ICAgc3JjL29wdXNlbmMuYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKPiAgICAgLy4uLi9zeXNy
b290L3Vzci9pbmNsdWRlL29wdXMvb3B1c2VuYy5oOjEzNDo2MzogZXJyb3I6IGltcGxpY2l0IGRl
Y2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmF9fb3B1c19jaGVja19pbnTigJk7IGRpZCB5b3UgbWVh
biDigJhvcHVzX2NoZWNrX2ludOKAmT8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25d
Cj4gCj4gWzFdIGh0dHBzOi8vZ2l0bGFiLnhpcGgub3JnL3hpcGgvb3B1cy8tL2NvbW1pdC83ODE3
ZGY3OTA4MzE4ZmIzYTBhZjJhMDFlNGRhMWUyNTY0Mzk2N2QwCj4gCj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KClRoYW5rcywgYXBwbGllZCwgSSdtIGp1c3Qg
bm90IDEwMCUgc3VyZSBvbmUgdGhpbmc6Cgo+ICsjIFdlIGFsc28gZGlzYWJsZSBhc3NlbWJseSBp
biBjYXNlIHdlIGhhdmUgYSBzb2Z0LWZsb2F0IEFCSSAob3B1cyBoYXMKPiArIyBORU9OIGluc3Ry
dWN0aW9ucyB3aGljaCBhcmUgbm90IGF2YWlsYWJsZSBpbiB0aGF0IGNhc2UpLgo+ICtpZmVxICgk
KEJSMl9BUk1fU09GVF9GTE9BVCkseSkKCklmIHRoZSBhc3NlbWJseSBjb2RlIGlzIHVzaW5nIE5F
T04sIHNob3VsZCB3ZSBhbHNvIGNoZWNrIHRoYXQgTkVPTiBpcwphdmFpbGFibGU/CgpUaG9tYXMK
LS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
