Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC76C433FE
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 00:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AC1260C0B;
	Thu, 17 Nov 2022 00:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AC1260C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0fRebY8SmPK8; Thu, 17 Nov 2022 00:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A137760BE3;
	Thu, 17 Nov 2022 00:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A137760BE3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6D81BF954
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 00:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12EBC41883
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 00:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12EBC41883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Uj_ewa63QJs for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 00:15:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 038014188F
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 038014188F
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 00:15:15 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AH0FBN4071557;
 Wed, 16 Nov 2022 18:15:11 -0600
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AH0FBiP082257
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Nov 2022 18:15:11 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 16
 Nov 2022 18:15:11 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 16 Nov 2022 18:15:11 -0600
Received: from uda0393673 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AH0FBbE034884;
 Wed, 16 Nov 2022 18:15:11 -0600
Received: from a0393673 by uda0393673 with local (Exim 4.95)
 (envelope-from <gadiyar@ti.com>) id 1ovSYh-007MC7-GH;
 Wed, 16 Nov 2022 18:15:11 -0600
To: <buildroot@buildroot.org>
Date: Wed, 16 Nov 2022 18:15:10 -0600
Message-ID: <20221117001511.1753592-3-gadiyar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117001511.1753592-1-gadiyar@ti.com>
References: <20221117001511.1753592-1-gadiyar@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1668644111;
 bh=tealhssAp/5xCPgLf6tR3cFrg/LIaHYqY+Bd/JBwZIE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=kGPGPJnNpRWi4gRuW6Y0/Wy66cQUFvRmLrOo2u8EuKAEmJ6cBAwNQgBjEcpONKzLP
 N6fcm1G0tdg1C6uEpNAWST8V7BBegDPk9I0xXxnQ8SPu71HlVDCFqlgbvJWlTUqmVX
 XcuB8h/ZHr/osJGawf4gC32paKK7l0rHEIl7VhHk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=kGPGPJnN
Subject: [Buildroot] [PATCH v6 2/3] boot/ti-k3-image-gen: add new package
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
From: Anand Gadiyar via buildroot <buildroot@buildroot.org>
Reply-To: Anand Gadiyar <gadiyar@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Andrew Davis <afd@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4KClRoaXMgaXMgdGhlIGltYWdlIGdlbmVy
YXRvciB0aGF0IGJ1aWxkcyB0aGUgZnVsbCBib290IGJpbmFyeSwKdGlib290My5iaW4sIGZvciB0
aGUgUjUgY29yZSBvbiBUSSdzIGszIGRldmljZXMuClRoaXMgcmVxdWlyZXMgdGhlIFI1IHNwbCBv
dXRwdXQgZnJvbSB0aGUgdGktazMtcjUtbG9hZGVyIHBhY2thZ2UuCgpodHRwczovL2dpdC50aS5j
b20vY2dpdC9rMy1pbWFnZS1nZW4vazMtaW1hZ2UtZ2VuCgpTaWduZWQtb2ZmLWJ5OiBYdWFuaGFv
IFNoaSA8eC1zaGlAdGkuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmFuZCBHYWRpeWFyIDxnYWRpeWFy
QHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5l
dHRpZW5naW5lZXJpbmcuY29tPgpBY2tlZC1ieTogQW5kcmV3IERhdmlzIDxhZmRAdGkuY29tPgpD
YzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgpDYzogQnJ5YW4gQnJhdHRs
b2YgPGJiQHRpLmNvbT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAyICsrCiBib290L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAxICsKIGJvb3QvdGktazMtaW1hZ2UtZ2VuL0NvbmZpZy5pbiAgICAgICAgICAgIHwgMzAgKysr
KysrKysrKysrKysrKwogYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLmhhc2gg
fCAgMiArKwogYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLm1rICAgfCA0MiAr
KysrKysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCiBjcmVh
dGUgbW9kZSAxMDA2NDQgYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLmhhc2gK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4u
bWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBjZjFjYjg4MDhi
Li5lNjk5YjZlYzgxIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAg
LTEyOSw2ICsxMjksNyBAQCBGOglwYWNrYWdlL2xpYnhtbHJwYy8KIEY6CXBhY2thZ2UvcHl0aG9u
LWRvY29wdC8KIAogTjoJQW5hbmQgR2FkaXlhciA8Z2FkaXlhckB0aS5jb20+CitGOglib290L3Rp
LWszLWltYWdlLWdlbi8KIEY6CWJvb3QvdGktazMtcjUtbG9hZGVyLwogCiBOOglBbmRyw6kgWndp
bmcgPG5lcnZAZGF3bmNyb3cuZGU+CkBAIC0zMDQ5LDYgKzMwNTAsNyBAQCBOOglXb2pjaWVjaCBO
aXppxYRza2kgPG5pemlha0BzcG94Lm9yZz4KIEY6CXBhY2thZ2UvZnd1cC8KIAogTjoJWHVhbmhh
byBTaGkgPFgxNTAwMDE3N0BnbWFpbC5jb20+CitGOglib290L3RpLWszLWltYWdlLWdlbi8KIEY6
CWJvb3QvdGktazMtcjUtbG9hZGVyLwogCiBOOglZYWlyIEJlbiBBdnJhaGFtIDx5YWlyYmFAcHJv
dG9ubWFpbC5jb20+CmRpZmYgLS1naXQgYS9ib290L0NvbmZpZy5pbiBiL2Jvb3QvQ29uZmlnLmlu
CmluZGV4IGNlMTdiMmRmNmIuLjFiMjViYWNmZWUgMTAwNjQ0Ci0tLSBhL2Jvb3QvQ29uZmlnLmlu
CisrKyBiL2Jvb3QvQ29uZmlnLmluCkBAIC0yMiw2ICsyMiw3IEBAIHNvdXJjZSAiYm9vdC9zNTAw
LWJvb3Rsb2FkZXIvQ29uZmlnLmluIgogc291cmNlICJib290L3NoaW0vQ29uZmlnLmluIgogc291
cmNlICJib290L3N1bjIwaS1kMS1zcGwvQ29uZmlnLmluIgogc291cmNlICJib290L3N5c2xpbnV4
L0NvbmZpZy5pbiIKK3NvdXJjZSAiYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluIgogc291
cmNlICJib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4iCiBzb3VyY2UgImJvb3QvdWJvb3Qv
Q29uZmlnLmluIgogc291cmNlICJib290L3ZleHByZXNzLWZpcm13YXJlL0NvbmZpZy5pbiIKZGlm
ZiAtLWdpdCBhL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL0NvbmZpZy5pbiBiL2Jvb3QvdGktazMtaW1h
Z2UtZ2VuL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4w
MjAxOGYyZjc4Ci0tLSAvZGV2L251bGwKKysrIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmln
LmluCkBAIC0wLDAgKzEsMzAgQEAKK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTgor
CWJvb2wgInRpLWszLWltYWdlLWdlbiIKKwlzZWxlY3QgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FE
RVIKKwloZWxwCisJICBVc2UgVEkncyBrMy1pbWFnZS1nZW4gdG8gYnVpbGQgYSBzZXBhcmF0ZSBi
YXJlIG1ldGFsCisJICBib290IGJpbmFyeSBmcm9tIGEgc2VwYXJhdGUgc3BsLiBDdXJyZW50bHkg
c3VwcG9ydHMKKwkgIHZlcnNpb24gMDguMDUuMDAuMDA0IGFzIGRlZmF1bHQuCisKKwkgIGh0dHBz
Oi8vZ2l0LnRpLmNvbS9jZ2l0L2szLWltYWdlLWdlbi9rMy1pbWFnZS1nZW4vCisKK2lmIEJSMl9U
QVJHRVRfVElfSzNfSU1BR0VfR0VOCitjb25maWcgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5f
U09DCisJc3RyaW5nICJTT0MgdHlwZSBmb3IgaW1hZ2UgZ2VuIgorCWhlbHAKKwkgIFRoZSB0YXJn
ZXQgU29DIG9wdGlvbiBmb3IgaW1hZ2UgZ2VuLgorCSAgRm9yIGV4YW1wbGUsICJhbTY0eCIgZm9y
IEFNNjRYIGJvYXJkcy4KKworY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQ19U
WVBFCisJc3RyaW5nICJTT0Mgc2VjdXJpdHkgdHlwZSBmb3IgaW1hZ2UgZ2VuIgorCWhlbHAKKwkg
IFRoZSBzZWN1cml0eSB0eXBlIG9wdGlvbiBmb3IgaW1hZ2UgZ2VuLgorCSAgT3B0aW9ucyBhcmUg
ImdwIiwgImhzLWZzIiwgb3IgImhzLXNlIi4KKworY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfSU1B
R0VfR0VOX0NPTkZJRworCXN0cmluZyAiQ09ORklHIHR5cGUgZm9yIGltYWdlIGdlbiIKKwloZWxw
CisJICBUaGUgYm9hcmQgY29uZmlnIG9wdGlvbiBmb3IgaW1hZ2UgZ2VuLgorCSAgVXN1YWxseSAi
c2siIG9yICJldm0iLgorZW5kaWYKKwpkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1pbWFnZS1nZW4v
dGktazMtaW1hZ2UtZ2VuLmhhc2ggYi9ib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1n
ZW4uaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44MmM1YjE3MDYw
Ci0tLSAvZGV2L251bGwKKysrIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2Vu
Lmhhc2gKQEAgLTAsMCArMSwyIEBACisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICBkMTNl
OTU1NmJmYmEzMmQxNDA3MWUxNzI1ODk2ODNlNDhmNmZlYTcwNWEwYjA1ZGRkN2ZlOTg0MDAyMDg5
ODg4ICBrMy1pbWFnZS1nZW4tMDguMDUuMDAuMDA0LnRhci5negpkaWZmIC0tZ2l0IGEvYm9vdC90
aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLm1rIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4v
dGktazMtaW1hZ2UtZ2VuLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LjcyMzliOTQ0MjUKLS0tIC9kZXYvbnVsbAorKysgYi9ib290L3RpLWszLWltYWdlLWdlbi90aS1r
My1pbWFnZS1nZW4ubWsKQEAgLTAsMCArMSw0MiBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
KyMKKyMgdGktazMtaW1hZ2UtZ2VuCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitUSV9L
M19JTUFHRV9HRU5fVkVSU0lPTiA9IDA4LjA1LjAwLjAwNAorVElfSzNfSU1BR0VfR0VOX1NJVEUg
PSBodHRwczovL2dpdC50aS5jb20vY2dpdC9rMy1pbWFnZS1nZW4vazMtaW1hZ2UtZ2VuL3NuYXBz
aG90CitUSV9LM19JTUFHRV9HRU5fU09VUkNFID0gazMtaW1hZ2UtZ2VuLSQoVElfSzNfSU1BR0Vf
R0VOX1ZFUlNJT04pLnRhci5negorVElfSzNfSU1BR0VfR0VOX0xJQ0VOU0UgPSBCU0QtMy1DbGF1
c2UKK1RJX0szX0lNQUdFX0dFTl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQorVElfSzNfSU1BR0Vf
R0VOX0lOU1RBTExfSU1BR0VTID0gWUVTCisKKyMgdGktazMtaW1hZ2UtZ2VuIGlzIHVzZWQgdG8g
YnVpbGQgdGlib290My5iaW4sIHVzaW5nIHRoZSByNS11LWJvb3Qtc3BsLmJpbiBmaWxlCisjIGZy
b20gdGhlIHRpLWszLXI1LWxvYWRlciBwYWNrYWdlLiBIZW5jZSB0aGUgZGVwZW5kZW5jeSBvbiB0
aS1rMy1yNS1sb2FkZXIuCitUSV9LM19JTUFHRV9HRU5fREVQRU5ERU5DSUVTID0gaG9zdC1hcm0t
Z251LXRvb2xjaGFpbiB0aS1rMy1yNS1sb2FkZXIKKworIyBUaGUgdGktazMtaW1hZ2UtZ2VuIG1h
a2VmaWxlcyBzZWVtIHRvIG5lZWQgc29tZSBmZWF0dXJlIGZyb20gTWFrZSB2NC4wLAorIyBzaW1p
bGFyIHRvIHUtYm9vdC4gRXhwbGljaXRseSB1c2UgJChCUjJfTUFLRSkgaGVyZSwgYXMgdGhlIGJ1
aWxkCisjIG90aGVyd2lzZSBmYWlscyB3aXRoIHNvbWUgbWlzbGVhZGluZyBlcnJvciBtZXNzYWdl
LgorVElfSzNfSU1BR0VfR0VOX01BS0UgPSAkKEJSMl9NQUtFKQorVElfSzNfSU1BR0VfR0VOX1NP
QyA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TT0MpKQorVElf
SzNfSU1BR0VfR0VOX1NPQ19UWVBFID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfVElfSzNf
SU1BR0VfR0VOX1NPQ19UWVBFKSkKK1RJX0szX0lNQUdFX0dFTl9DT05GSUcgPSAkKGNhbGwgcXN0
cmlwLCQoQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fQ09ORklHKSkKK1RJX0szX0lNQUdFX0dF
Tl9NQUtFX09QVFMgPSBcCisJU09DPSQoVElfSzNfSU1BR0VfR0VOX1NPQykgXAorCVNPQ19UWVBF
PSQoVElfSzNfSU1BR0VfR0VOX1NPQ19UWVBFKSBcCisJQ09ORklHPSQoVElfSzNfSU1BR0VfR0VO
X0NPTkZJRykgXAorCUNST1NTX0NPTVBJTEU9JChIT1NUX0RJUikvYmluL2FybS1ub25lLWVhYmkt
IFwKKwlTQkw9JChCSU5BUklFU19ESVIpL3I1LXUtYm9vdC1zcGwuYmluIFwKKwlPPSQoQklOQVJJ
RVNfRElSKSBcCisJQklOX0RJUj0kKEJJTkFSSUVTX0RJUikKKworZGVmaW5lIFRJX0szX0lNQUdF
X0dFTl9CVUlMRF9DTURTCisJJChUSV9LM19JTUFHRV9HRU5fTUFLRSkgLUMgJChARCkgJChUSV9L
M19JTUFHRV9HRU5fTUFLRV9PUFRTKQorZW5kZWYKKworZGVmaW5lIFRJX0szX0lNQUdFX0dFTl9J
TlNUQUxMX0lNQUdFU19DTURTCisJY3AgJChARCkvdGlib290My5iaW4gJChCSU5BUklFU19ESVIp
CitlbmRlZgorCiskKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQotLSAKMi4zNC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
