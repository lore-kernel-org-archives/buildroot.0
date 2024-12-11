Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC87E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F81883F41;
	Wed, 11 Dec 2024 19:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-LCbKQcoHuI; Wed, 11 Dec 2024 19:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CE48820E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CE48820E9;
	Wed, 11 Dec 2024 19:45:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A292BED7
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8454183EAA
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xV9YrWrzf7q for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:45:22 +0000 (UTC)
X-Greylist: delayed 7344 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 11 Dec 2024 19:45:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE26A820FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE26A820FA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE26A820FA
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:45:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3DDB60005;
 Wed, 11 Dec 2024 19:45:17 +0000 (UTC)
Date: Wed, 11 Dec 2024 20:45:15 +0100
MIME-Version: 1.0
Message-Id: <20241211-fix_gcc14_libsha1-v1-1-c9647718ccc2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMrrWWcC/x2MQQqAIBAAvxJ7TnBNCfpKRKituhAVChFIf086D
 sxMhUKZqcDUVch0c+HzaIB9Bz7ZI5LgrTEoqTQqRBH4WaP3qNedXUkWhR4Ha4LRkqyD1l2ZmvQ
 /5+V9PyhkW+1jAAAA
X-Change-ID: 20241211-fix_gcc14_libsha1-473a5f540eab
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1733946318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o70o8OhLEl5KfpjB9nLq1UKyAGKrv6SaNQHwaeZvSNQ=;
 b=nwxZr/ePd+K+mhjXgleZ6QUNZMw9rqClFezL/jXCvMkxZr/iq9CtAR3sHFjNNFLpgRsaSY
 YPcjZemnKXJ+pfxmd1teQKILQ+NNlmo0Ytznuf81tcSqisYySxC0uFKFO2DGHoatnfx/WC
 afqeLALQHbbFd9RXHc4Zv646GmOaBin4bKymoInzo5zDNpBtnW518bl4esYPJ8sNY7KZDE
 X+ZYXP92QbAzHZG/Y2i33DbL0mS/c3+wdtMlRC6NnSQFbwu0CJn99fMjc86OEc7+DS4fXc
 sgIaoApwNdipyG280gGN8G+au7gGfXW3MDLQ1fGIKXbUcqeSBr/fryOCQfcw/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nwxZr/eP
Subject: [Buildroot] [PATCH] package/libsha1: Fix gcc14 compilation in
 libsha1
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R0NDMTQgcmVtb3ZlZCB0aGUgaW1wbGljaXQgaW50IHN1cHBvcnQuClRoaXMgY29tbWl0IGFkZHMg
YSBwYXRjaCB0byBsaWJzaGExIHRvIGZpeCBhbiBpbXBsaWNpdCBpbnQgZGVjbGFyYXRpb24KYXMg
cmVjb21tZW5kZWQuCgpMaW5rOiBodHRwczovL2djYy5nbnUub3JnL2djYy0xNC9wb3J0aW5nX3Rv
Lmh0bWwKClNpZ25lZC1vZmYtYnk6IFRob21hcyBCb25uZWZpbGxlIDx0aG9tYXMuYm9ubmVmaWxs
ZUBib290bGluLmNvbT4KLS0tCiAuLi4wMS10ZXN0LWZpeC1nY2MtMTQueC1jb21waWxlLWltcGxp
Y2l0LWludC5wYXRjaCB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzaGExLzAwMDEtdGVz
dC1maXgtZ2NjLTE0LngtY29tcGlsZS1pbXBsaWNpdC1pbnQucGF0Y2ggYi9wYWNrYWdlL2xpYnNo
YTEvMDAwMS10ZXN0LWZpeC1nY2MtMTQueC1jb21waWxlLWltcGxpY2l0LWludC5wYXRjaApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwLi5lNzMxNmJhOGZlNTVlNWY1ZTM1YzlhZmE3ZTFkNTUxODViMGFlYjFhCi0tLSAvZGV2
L251bGwKKysrIGIvcGFja2FnZS9saWJzaGExLzAwMDEtdGVzdC1maXgtZ2NjLTE0LngtY29tcGls
ZS1pbXBsaWNpdC1pbnQucGF0Y2gKQEAgLTAsMCArMSwzNyBAQAorRnJvbSAxOTg3YjVmMjY0OGM4
NTUzNmYxOWYxMWE4OGJhODk2OTUzYmQwMjU4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bTogVGhvbWFzIEJvbm5lZmlsbGUgPHRob21hcy5ib25uZWZpbGxlQGJvb3RsaW4uY29tPgorRGF0
ZTogV2VkLCAxMSBEZWMgMjAyNCAyMDoxNzo1NyArMDEwMAorU3ViamVjdDogW1BBVENIXSB0ZXN0
OiBmaXggZ2NjLTE0LnggY29tcGlsZSAoaW1wbGljaXQgaW50KQorTUlNRS1WZXJzaW9uOiAxLjAK
K0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zl
ci1FbmNvZGluZzogOGJpdAorCitGaXhlczoKKworICB0ZXN0LmM6MTQ6ODogZXJyb3I6IHR5cGUg
ZGVmYXVsdHMgdG8g4oCYaW504oCZIGluIGRlY2xhcmF0aW9uIG9mIOKAmG51bV90ZXN04oCZIFst
V2ltcGxpY2l0LWludF0KKyAgICAgMTQgfCBzdGF0aWMgbnVtX3Rlc3Q7CisgICAgICAgIHwgICAg
ICAgIF5+fn5+fn5+CisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vcHNlaWRlcmVyL2xp
YnNoYTEvY29tbWl0L2Q0NDlmMjZmNzgyYmU5MWIzODQ3Zjg4ZWQyYmQ5Mzc1ODJhNTc1YjYKKwor
U2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgorLS0tCisg
dGVzdC5jIHwgMiArLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQorCitkaWZmIC0tZ2l0IGEvdGVzdC5jIGIvdGVzdC5jCitpbmRleCAyMWE2NTI1Li4xZWM4
OWQzIDEwMDY0NAorLS0tIGEvdGVzdC5jCisrKysgYi90ZXN0LmMKK0BAIC0xMSw3ICsxMSw3IEBA
IHN0YXRpYyB2b2lkIHByaW50X2hleChjb25zdCBjaGFyKiBkYXRhLCBzaXplX3Qgc2l6ZSkKKyAg
ICAgICAgIHByaW50ZigiJXgleCIsICgodW5zaWduZWQgY2hhcilkYXRhW2ldKS8xNiwgKCh1bnNp
Z25lZCBjaGFyKWRhdGFbaV0pJTE2KTsKKyB9CisgCistc3RhdGljIG51bV90ZXN0OworK3N0YXRp
YyBpbnQgbnVtX3Rlc3Q7CisgCisgc3RhdGljIGludCBkb190ZXN0KGNvbnN0IGNoYXIqIGRhdGEs
IHNpemVfdCBzaXplLCBjb25zdCBjaGFyKiBleHBlY3RlZF9kZ3N0KQorIHsKKy0tIAorMi40Ny4x
CisKCi0tLQpiYXNlLWNvbW1pdDogZWQ5ZGEwODk0NDljNTM1MTliZTAyMjA0Zjk3YzM0NTJhYmJh
NWNjMwpjaGFuZ2UtaWQ6IDIwMjQxMjExLWZpeF9nY2MxNF9saWJzaGExLTQ3M2E1ZjU0MGVhYgoK
QmVzdCByZWdhcmRzLAotLSAKVGhvbWFzIEJvbm5lZmlsbGUgPHRob21hcy5ib25uZWZpbGxlQGJv
b3RsaW4uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
