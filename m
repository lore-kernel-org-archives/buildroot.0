Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF20C001CC
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 13:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56BEE405EE;
	Thu, 11 Apr 2024 13:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmsvMpvOpQxq; Thu, 11 Apr 2024 13:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C7B041A3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C7B041A3E;
	Thu, 11 Apr 2024 13:35:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC6121BF3DB
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 13:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A997380E3E
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 13:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9bz1rdFwF6d for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 13:35:15 +0000 (UTC)
X-Greylist: delayed 17152 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 11 Apr 2024 13:35:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D06781256
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D06781256
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D06781256
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 13:35:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DAC8240010;
 Thu, 11 Apr 2024 13:35:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 15:35:05 +0200
Message-ID: <20240411133507.82781-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411133507.82781-1-alexis.lothore@bootlin.com>
References: <20240411133507.82781-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712842512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQPoHwE6OxrUoPsNASviK7oIGNjqVyT7nR7MCwjtDJs=;
 b=SK/9PczidI54T/gQb5TSlomcjPYbr326h6yTw0796B/3Xn7s4Af7PkQeuiBbFHe5rIDHpY
 0leoTidsh8IH5PKNMqC5SS/e3crFYTw4Ok0lyLyRr356fAoeenNN3m5aHplW8zDRuMwBXo
 1euyizoJrh6NJ4gZ1kgVUCVZ1/ZWtA6Nz8oYW9N7D1wCDR6h5Mq1PwCNsRmfhwL5wlhHX4
 FRU0VDBPTLmZu9oPFXcdRdtqkrnclUZueTIkwvATmz/FwPpXY5b/zn3qZQDuVNLPB1Y3hs
 bSC6Tx5+ccCheHK6Wvtrv+/eLwRmgTT72WcdPBD+uRTG/jblsc8rEshjZdfEOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SK/9Pczi
Subject: [Buildroot] [PATCH v2 1/3] package/pppd: revert lock path
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cHBwZCBmYWlscyB0byBzdGFydCBvbiBidWlsZHJvb3QgMjAyNC4wMiwgYmVjYXVzZSBvZiBub24t
ZXhpc3RpbmcgZGlyZWN0b3J5CnBwcGQgaW4gL3Zhci9ydW4KClNpZ25lZC1vZmYtYnk6IEFsZXhp
cyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogLi4uMDA1LVJldmVy
dC1sb2NrLXBhdGgtdG8tdmFyLWxvY2stNDM1LnBhdGNoIHwgNjYgKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3BwcGQvMDAwNS1SZXZlcnQtbG9jay1wYXRoLXRvLXZhci1sb2NrLTQzNS5wYXRjaAoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHBwZC8wMDA1LVJldmVydC1sb2NrLXBhdGgtdG8tdmFyLWxv
Y2stNDM1LnBhdGNoIGIvcGFja2FnZS9wcHBkLzAwMDUtUmV2ZXJ0LWxvY2stcGF0aC10by12YXIt
bG9jay00MzUucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi42
ZjMyMzcxNDQ0NjYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3BwcGQvMDAwNS1SZXZlcnQt
bG9jay1wYXRoLXRvLXZhci1sb2NrLTQzNS5wYXRjaApAQCAtMCwwICsxLDY2IEBACitGcm9tIDUw
YWVjNDg2MjRiNzZkOWViYjhiNDkzMDljM2JmZDM0NjM3NDVhMjYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBEb21pbmlxdWUgTWFydGluZXQgPGFzbWFkZXVzQGNvZGV3cmVjay5vcmc+
CitEYXRlOiBUdWUsIDEwIE9jdCAyMDIzIDEwOjA1OjUwICswOTAwCitTdWJqZWN0OiBbUEFUQ0hd
IFJldmVydCBsb2NrIHBhdGggdG8gL3Zhci9sb2NrICgjNDM1KQorTUlNRS1WZXJzaW9uOiAxLjAK
K0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zl
ci1FbmNvZGluZzogOGJpdAorCitsb2NrIGRpciBjaGFuZ2VkIG9uIGxpbnV4IGZyb20gL3Zhci9s
b2NrIHRvIC9ydW4vcHBwZC9sb2NrIHdpdGgKK3BwcGQtMi41LjAsIHdoaWNoIG1ha2VzIHBwcGQg
ZmFpbCB0byBzdGFydCBpZiB0aGUgZGlzdHJpYnV0aW9uIGRvZXMgbm90CitwcmUtY3JlYXRlIHRo
ZSBkaXJlY3RvcnkuCisKK1RoaXMgcmV2ZXJ0cyBpdCBiYWNrIHRvIC92YXIvbG9jay4KKworVGhl
IHBhdGhzIGZvciBvdGhlciBPUyBzaG91bGQgYmUgaWRlbnRpY2FsIGFzIExPQ0FMU1RBVEVESVIg
c2hvdWxkIGJlCisvdmFyLCBidXQgYWxzbyByZXZlcnQgdGhlbSBiYWNrIGFzIHdlbGwganVzdCBp
biBjYXNlLgorU2luY2UgdGhlIHZhcmlhYmxlIGlzIG5vIGxvbmdlciB1c2VkIHJlbW92ZSBpdCBm
cm9tIG1ha2VmaWxlcy4KKworRml4ZXM6IDY2YThjNzRjM2Y3MyAoIkxldCAuL2NvbmZpZ3VyZSBj
b250cm9sIHRoZSBwYXRocyBmb3IgcHBwZCIpCitGaXhlczogIzQxOQorCitTaWduZWQtb2ZmLWJ5
OiBEb21pbmlxdWUgTWFydGluZXQgPGRvbWluaXF1ZS5tYXJ0aW5ldEBhdG1hcmstdGVjaG5vLmNv
bT4KK0NvLWF1dGhvcmVkLWJ5OiBEb21pbmlxdWUgTWFydGluZXQgPGRvbWluaXF1ZS5tYXJ0aW5l
dEBhdG1hcmstdGVjaG5vLmNvbT4KK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vcHBwLXBy
b2plY3QvcHBwL2NvbW1pdC85OWNiZjVlMjY5OTk0NDgyZWRhZjY0NjI0YmU4YjFjODA2Zjk1ODdj
CitTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4u
Y29tPgorLS0tCisgcHBwZC9NYWtlZmlsZS5hbSB8IDIgKy0KKyBwcHBkL3BhdGhuYW1lcy5oIHwg
NiArKystLS0KKyAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKKworZGlmZiAtLWdpdCBhL3BwcGQvTWFrZWZpbGUuYW0gYi9wcHBkL01ha2VmaWxlLmFtCitp
bmRleCBlNWJlZGYyNmFmOTYuLjdjYjMwMDUzMzIyZSAxMDA2NDQKKy0tLSBhL3BwcGQvTWFrZWZp
bGUuYW0KKysrKyBiL3BwcGQvTWFrZWZpbGUuYW0KK0BAIC04Myw3ICs4Myw3IEBAIHBwcGRfU09V
UkNFUyA9IFwKKyAgICAgdXBhcC5jIFwKKyAgICAgdXRpbHMuYworIAorLXBwcGRfQ1BQRkxBR1Mg
PSAtRFNZU0NPTkZESVI9XCIke3N5c2NvbmZkaXJ9XCIgLURMT0NBTFNUQVRFRElSPVwiJHtsb2Nh
bHN0YXRlZGlyfVwiIC1EUFBQRF9SVU5USU1FX0RJUj0nIkBQUFBEX1JVTlRJTUVfRElSQCInIC1E
UFBQRF9MT0dGSUxFX0RJUj0nIkBQUFBEX0xPR0ZJTEVfRElSQCInCisrcHBwZF9DUFBGTEFHUyA9
IC1EU1lTQ09ORkRJUj1cIiR7c3lzY29uZmRpcn1cIiAtRFBQUERfUlVOVElNRV9ESVI9JyJAUFBQ
RF9SVU5USU1FX0RJUkAiJyAtRFBQUERfTE9HRklMRV9ESVI9JyJAUFBQRF9MT0dGSUxFX0RJUkAi
JworIHBwcGRfTERGTEFHUyA9CisgcHBwZF9MSUJTID0KKyAKK2RpZmYgLS1naXQgYS9wcHBkL3Bh
dGhuYW1lcy5oIGIvcHBwZC9wYXRobmFtZXMuaAoraW5kZXggZGUyZmI2ODg5MDA1Li4xMjYwOWE5
Njk0MjkgMTAwNjQ0CistLS0gYS9wcHBkL3BhdGhuYW1lcy5oCisrKysgYi9wcHBkL3BhdGhuYW1l
cy5oCitAQCAtMTIwLDEyICsxMjAsMTIgQEAKKyAjZGVmaW5lIFBQUF9QQVRIX1BQUERCICAgICAg
ICAgIFBQUF9QQVRIX1ZBUlJVTiAgIi9wcHBkMi50ZGIiCisgCisgI2lmZGVmIF9fbGludXhfXwor
LSNkZWZpbmUgUFBQX1BBVEhfTE9DS0RJUiAgICAgICAgUFBQX1BBVEhfVkFSUlVOICAiL2xvY2si
CisrI2RlZmluZSBQUFBfUEFUSF9MT0NLRElSICAgICAgICAiL3Zhci9sb2NrIgorICNlbHNlCisg
I2lmZGVmIFNWUjQKKy0jZGVmaW5lIFBQUF9QQVRIX0xPQ0tESVIgICAgICAgIExPQ0FMU1RBVEVE
SVIgIi9zcG9vbC9sb2NrcyIKKysjZGVmaW5lIFBQUF9QQVRIX0xPQ0tESVIgICAgICAgICIvdmFy
L3Nwb29sL2xvY2tzIgorICNlbHNlCistI2RlZmluZSBQUFBfUEFUSF9MT0NLRElSICAgICAgICBM
T0NBTFNUQVRFRElSICIvc3Bvb2wvbG9jayIKKysjZGVmaW5lIFBQUF9QQVRIX0xPQ0tESVIgICAg
ICAgICIvdmFyL3Nwb29sL2xvY2siCisgI2VuZGlmCisgI2VuZGlmCisgCistLSAKKzIuNDQuMAor
Ci0tIAoyLjQ0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
