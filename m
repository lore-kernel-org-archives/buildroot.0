Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA32D1CDC6
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 08:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B5F680D28;
	Tue,  9 Dec 2025 08:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycn-neT_Kr8m; Tue,  9 Dec 2025 08:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A82A680D37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765270465;
	bh=t8P22iDX4DW2m90Ry15tBeuH9f2/0UPytqDvgQHRnnU=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JEINWDuDDlV6JRLkIbb3vTKk4gmnhqJxWnK/Tp1L4Qr7MWy7qMMExL4QaKwmIauGt
	 tvEqLRXyr3p/lBhbUecOchKQlPM2SE/qD34iQ08wEpgO90njbTPCJ4GESIAuQHfl5t
	 SjuR+h2opU7jTsPnmn98FFzmIG+eYZl+h+kzro0OT6fkHdSmmy4prGkuv8dbaAn5tl
	 ebwet4uAkJiz0cvBo1GpkOUiJz604dT2c/GYo+8ohg9W/zeTTeONKEYUS2Mv9xUTS1
	 6401bYUaU49MFc8N4HKwOCw7t9J/Qz4zs6e9+HG898Ce1PSfo65tdIGMzsbiKP7rHm
	 uhjnF8qn/8CBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A82A680D37;
	Tue,  9 Dec 2025 08:54:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D995E197
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBD47611E6
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdA46IoopAOX for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 08:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D912C60B22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D912C60B22
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D912C60B22
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:54:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 98857C180E0;
 Tue,  9 Dec 2025 08:53:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 688D660714;
 Tue,  9 Dec 2025 08:54:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7FC8C11930304; Tue,  9 Dec 2025 09:54:18 +0100 (CET)
Date: Tue, 09 Dec 2025 09:54:11 +0100
MIME-Version: 1.0
Message-Id: <20251209-libldns_drill-v3-1-cce588a002f4@bootlin.com>
References: <20251209-libldns_drill-v3-0-cce588a002f4@bootlin.com>
In-Reply-To: <20251209-libldns_drill-v3-0-cce588a002f4@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, nicolas.carrier@nav-timing.safrangroup.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765270458; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2tXTkqUFO1e/RE/FvrfFaKLRBNRhQLFRmkHnnZmDsTs=;
 b=qYcyQckxzh2vCmU+YRanSZbLGw873O7VuNskmylFB9i/LGwZYe2SPt6T4j905fA/YUz9qw
 6/rbjko2CCPgP5H11VBQLpEnJotaMsqMFL6EgkJQCGSMB+9OEG/Oxg0BBwEtwt3zadJfIH
 5ZHIjxAqO3CHTOvjPpAkxBN2J5OVpD/S3e3EdRqsDxYGFzSAvqpj2WineZxDu+0VfUJm+z
 HG2kWCXxu4NxtztzieIFKuZ7SiMbj88NzfH4Bc+j/WspByBBmRzr6Kx2A5fXCwrpOyGVng
 TSr8STFLJkWdrAdeAsx0plCAWQHVKTcl+YKmOvRke3WzEvGN5frAE9n51LNLzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qYcyQckx
Subject: [Buildroot] [PATCH v3 1/2] package/libldns: add an option to build
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
Njk2ZmVjOTdiNTk4Li42MGIxNDllMjAxOTYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlibGRucy9D
b25maWcuaW4KKysrIGIvcGFja2FnZS9saWJsZG5zL0NvbmZpZy5pbgpAQCAtOCwzICs4LDE2IEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJMRE5TCiAJICBleHBlcmltZW50YWwgc29mdHdhcmUgZm9y
IGN1cnJlbnQgSW50ZXJuZXQgRHJhZnRzLgogCiAJICBodHRwOi8vd3d3Lm5sbmV0bGFicy5ubC9w
cm9qZWN0cy9sZG5zCisKK2lmIEJSMl9QQUNLQUdFX0xJQkxETlMKKworY29uZmlnIEJSMl9QQUNL
QUdFX0xJQkxETlNfRFJJTEwKKwlib29sICJkcmlsbCBiaW5hcnkiCisJZGVwZW5kcyBvbiAhQlIy
X1NUQVRJQ19MSUJTCisJaGVscAorCSAgSW5zdGFsbCB0aGUgZHJpbGwgYmluYXJ5CisKK2NvbW1l
bnQgImRyaWxsIG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSIKKwlkZXBlbmRz
IG9uIEJSMl9TVEFUSUNfTElCUworCitlbmRpZiAjIEJSMl9QQUNLQUdFX0xJQkxETlMKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbGlibGRucy9saWJsZG5zLm1rIGIvcGFja2FnZS9saWJsZG5zL2xpYmxk
bnMubWsKaW5kZXggMDc0MGQwOWZhYjJmLi42Y2VkNzVhNDRmY2YgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvbGlibGRucy9saWJsZG5zLm1rCisrKyBiL3BhY2thZ2UvbGlibGRucy9saWJsZG5zLm1rCkBA
IC00NSw0ICs0NSwxMSBAQCBlbmRpZgogIyBpbnRlcmVzdGVkIGluIHRoZSBsaWIgdGFyZ2V0IGFu
eXdheQogTElCTEROU19NQUtFX09QVFMgPSBsaWIKIAoraWZlcSAoJChCUjJfUEFDS0FHRV9MSUJM
RE5TX0RSSUxMKSx5KQorTElCTEROU19DT05GX09QVFMgKz0gLS13aXRoLWRyaWxsCitMSUJMRE5T
X01BS0VfT1BUUyArPSBkcmlsbAorZWxzZQorTElCTEROU19DT05GX09QVFMgKz0gLS13aXRob3V0
LWRyaWxsCitlbmRpZgorCiAkKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCgotLSAKMi41MS4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
