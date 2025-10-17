Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62CFCCD184
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 07:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A49160BB8;
	Fri, 17 Oct 2025 07:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FpeY2p_kAPLR; Fri, 17 Oct 2025 07:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3272E60BDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3272E60BDC;
	Fri, 17 Oct 2025 07:38:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0033E1EB1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5E7560BB8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IfKJNcEU8hiQ for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 07:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9C3F60BB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9C3F60BB7
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9C3F60BB7
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:38:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DFE094E41118;
 Fri, 17 Oct 2025 07:38:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B0008606DB;
 Fri, 17 Oct 2025 07:38:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C4018102F231D; 
 Fri, 17 Oct 2025 09:38:15 +0200 (CEST)
Date: Fri, 17 Oct 2025 09:36:27 +0200
MIME-Version: 1.0
Message-Id: <20251017-libldns_drill-v2-1-f5479778848f@bootlin.com>
References: <20251017-libldns_drill-v2-0-f5479778848f@bootlin.com>
In-Reply-To: <20251017-libldns_drill-v2-0-f5479778848f@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, nicolas.carrier@nav-timing.safrangroup.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760686696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=HGdIflKuh4/UTCDYCEvrFUWwFEqTVJvP7RDOOh4kS2g=;
 b=Vdk9OPfQDpvkclg9eygT1PkETxmruLRX6y9efHjVf/Kln9sl9Ib6S1OOd/9G3V7yS/2Fm+
 cpFTteFRj3xUNSzcdT8CFxukft7wawWpoMUUJNYE0FLFUhhmRwpdZL7wXB5QaqiHOEBWWa
 CbnkzbOdRmvvIa2ETbL6wM+wwDpIgd9sEeDSZfcTltkbd2NVuZJQljV7X4YJ3AC0x0LTFz
 NR4DUDb8/SwFKK9Vn1IBf9Fl2s4hJKZs7IVTgDQjawctU/P2pxhDcI3TLaXYVT30j7opTU
 hGGutQpi2dRJkVGbuLd6tNys/sGIHcyy/yxASFnDQ48OYdGJ0TsaQUX9eFTgPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Vdk9OPfQ
Subject: [Buildroot] [PATCH v2 1/2] package/libldns: add an option to build
 and install drill
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

VGhlIGxpYmxkbnMgbGlicmFyeSBhbHNvIGNvbWVzIHdpdGggYSBDTEkgdG9vbCBuYW1lZCBkcmls
bCwgYWxsb3dpbmcgdG8KcGVyZm9ybSBETlMgcmVxdWVzdHMuIERyaWxsIGJ1aWxkIGlzIGN1cnJl
bnRseSBkaXNhYmxlZCBieSBkZWZhdWx0LgoKQWRkIGEgS0NvbmZpZyBvcHRpb24gdG8gYWxsb3cg
YnVpbGRpbmcgYW5kIGluc3RhbGxpbmcgZHJpbGwgdG9vbC4gU2V0CnRoZSBkZWZhdWx0IHZhbHVl
IHRvIG4gdG8gcHJlc2VydmUgdGhlIGN1cnJlbnQgYmVoYXZpb3IuIFNpbWlsYXJseSB0bwpsaW5r
dGVzdCAoc2VlIHRoZSBjb21tZW50IGluIHRoZSAubWspLCBkcmlsbCBmYWlscyB0byBidWlsZCBj
b3JyZWN0bHkgYXMKYSBzdGF0aWMgYmluYXJ5LCBzbyBtYWtlIHRoZSBuZXcgb3B0aW9uIGRlcGVu
ZCBvbiBub24tc3RhdGljIGJ1aWxkLgoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxh
bGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gYWRkIG1pc2lu
ZyBTb0IKLSByZW1vdmUgdW5lY2Vzc2FyeSAiZGVmYXVsdCBuIgotIGZpeCBjb21tZW50IGFib3V0
IG5lZWRlZCB0b29sY2hhaW4gZmVhdHVyZXMKLS0tCiBwYWNrYWdlL2xpYmxkbnMvQ29uZmlnLmlu
ICB8IDEzICsrKysrKysrKysrKysKIHBhY2thZ2UvbGlibGRucy9saWJsZG5zLm1rIHwgIDcgKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJsZG5zL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGlibGRucy9Db25maWcuaW4KaW5kZXgg
Njk2ZmVjOTdiNTk4NTdmYmQ5OWJkY2FhYmFiYTA5ZDQ5Nzc0ZjNhZS4uNjBiMTQ5ZTIwMTk2MjNi
OGI1MjdmNzFmOTQxNWIxNTlkNmU2Mjc1MSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJsZG5zL0Nv
bmZpZy5pbgorKysgYi9wYWNrYWdlL2xpYmxkbnMvQ29uZmlnLmluCkBAIC04LDMgKzgsMTYgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX0xJQkxETlMKIAkgIGV4cGVyaW1lbnRhbCBzb2Z0d2FyZSBmb3Ig
Y3VycmVudCBJbnRlcm5ldCBEcmFmdHMuCiAKIAkgIGh0dHA6Ly93d3cubmxuZXRsYWJzLm5sL3By
b2plY3RzL2xkbnMKKworaWYgQlIyX1BBQ0tBR0VfTElCTEROUworCitjb25maWcgQlIyX1BBQ0tB
R0VfTElCTEROU19EUklMTAorCWJvb2wgImRyaWxsIGJpbmFyeSIKKwlkZXBlbmRzIG9uICFCUjJf
U1RBVElDX0xJQlMKKwloZWxwCisJICBJbnN0YWxsIHRoZSBkcmlsbCBiaW5hcnkKKworY29tbWVu
dCAiZHJpbGwgbmVlZHMgYSB0b29sY2hhaW4gdy8gZHluYW1pYyBsaWJyYXJ5IgorCWRlcGVuZHMg
b24gQlIyX1NUQVRJQ19MSUJTCisKK2VuZGlmICMgQlIyX1BBQ0tBR0VfTElCTEROUwpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9saWJsZG5zL2xpYmxkbnMubWsgYi9wYWNrYWdlL2xpYmxkbnMvbGlibGRu
cy5tawppbmRleCAwNzQwZDA5ZmFiMmZkMTU1OTJjM2Q1NWNkMmMxOTMyNjY0Y2EzMzQ0Li42Y2Vk
NzVhNDRmY2Y1YmY5Yzk1ZTQ0MzE4MTM2MmY5OWM5Mzc1ZWViIDEwMDY0NAotLS0gYS9wYWNrYWdl
L2xpYmxkbnMvbGlibGRucy5taworKysgYi9wYWNrYWdlL2xpYmxkbnMvbGlibGRucy5tawpAQCAt
NDUsNCArNDUsMTEgQEAgZW5kaWYKICMgaW50ZXJlc3RlZCBpbiB0aGUgbGliIHRhcmdldCBhbnl3
YXkKIExJQkxETlNfTUFLRV9PUFRTID0gbGliCiAKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTElCTERO
U19EUklMTCkseSkKK0xJQkxETlNfQ09ORl9PUFRTICs9IC0td2l0aC1kcmlsbAorTElCTEROU19N
QUtFX09QVFMgKz0gZHJpbGwKK2Vsc2UKK0xJQkxETlNfQ09ORl9PUFRTICs9IC0td2l0aG91dC1k
cmlsbAorZW5kaWYKKwogJChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQoKLS0gCjIuNTEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
