Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF04E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 22:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F482416B2;
	Mon, 16 Dec 2024 22:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zr4Wb-LId5NG; Mon, 16 Dec 2024 22:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDD4B416B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDD4B416B3;
	Mon, 16 Dec 2024 22:36:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7DE4C5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9B8D6116F
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EfHVQzSmKUaP for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 22:36:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8441610C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8441610C2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8441610C2
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:36:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 078D7FF804;
 Mon, 16 Dec 2024 22:36:16 +0000 (UTC)
Date: Mon, 16 Dec 2024 23:36:00 +0100
MIME-Version: 1.0
Message-Id: <20241216-fix_gcc14_libsha1-v3-1-0a2bb34bb5a2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAE+rYGcC/33NwQrCMAyA4VeRnq0sXddVT76HyGhjthXmKu0oy
 ti72+2kIB7/kHyZWaTgKLLTbmaBkovOjznK/Y5hb8aOuLvlZqIQEgQAb92z6RBBNoOzsTfAZV2
 aqq1kQcayfPcIlJc283LN3bs4+fDaXiRYp/+0BBw4HpWsa9CIKM7W+2lw4wH9na1eEp+G+mWI1
 SBbVlqT0kp9G8uyvAHf7qVf+AAAAA==
X-Change-ID: 20241211-fix_gcc14_libsha1-473a5f540eab
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734388577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MLCNLrxX75e4PXEPIgoyWuOFi8xo1zyPsjQChMIoopo=;
 b=HRPAZB/tVX6MckXH27moZqVQcpYOAy0vn0Fdqb2DWFVpczIw6AGakF/SV59gkVEoO9KuES
 JOlpMVjhPNuTLdjcrH623KxPQK79EKH7oRfY2QfnFyrtgSv531ffvjGH8AG1ZZzthBwRyC
 wbL6h5UiuGl5gEKdbXalpyK5rtrpggjV1kN6ZkkJ76gggkOjJv2k2DbDFsS47gUC4pHPYE
 sAa3aFSgX2QDVLRJG0s/DCNP5velekT6SBFvZpSib4M0/ryIbsBmQeBf54bX3VtNK6L6I3
 eon4cyjKG1SGtmT9g33y0W0Q1N3WnhYFMbGLk4I1A/bvq70iqeNhKP5UWH2l9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HRPAZB/t
Subject: [Buildroot] [PATCH v3] package/libsha1: Fix gcc14 compilation in
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
Lmh0bWwKCkZpeGVzOgogICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMv
ODdkYzliYTk2OTBjYmI2YTgyODc1NzM0Y2U5Y2I4ZGJhZjg3OGU0Ni8KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBCb25uZWZpbGxlIDx0aG9tYXMuYm9ubmVmaWxsZUBib290bGluLmNvbT4KLS0tCkNo
YW5nZXMgaW4gdjM6Ci0gUmVmb3JtYXQgcGF0Y2ggZmlsZQotIExpbmsgdG8gdjI6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMTYtZml4X2djYzE0X2xpYnNoYTEtdjItMS1jZWIzNTg4
ZTY4NjZAYm9vdGxpbi5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gUmVnZW5lcmF0ZSB0aGUgcGF0Y2gu
Ci0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIxMS1maXhfZ2Nj
MTRfbGlic2hhMS12MS0xLWM5NjQ3NzE4Y2NjMkBib290bGluLmNvbQotLS0KIC4uLjAxLXRlc3Qt
Zml4LWdjYy0xNC54LWNvbXBpbGUtaW1wbGljaXQtaW50LnBhdGNoIHwgMzkgKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYnNoYTEvMDAwMS10ZXN0LWZpeC1nY2MtMTQueC1jb21waWxlLWltcGxpY2l0
LWludC5wYXRjaCBiL3BhY2thZ2UvbGlic2hhMS8wMDAxLXRlc3QtZml4LWdjYy0xNC54LWNvbXBp
bGUtaW1wbGljaXQtaW50LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjYwM2EyYjc3YThmY2JjNzIzZGEyNmU4
OGM0MjliOWI2YmQ1NmRmMTgKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2xpYnNoYTEvMDAw
MS10ZXN0LWZpeC1nY2MtMTQueC1jb21waWxlLWltcGxpY2l0LWludC5wYXRjaApAQCAtMCwwICsx
LDM5IEBACitGcm9tIGQ0NDlmMjZmNzgyYmU5MWIzODQ3Zjg4ZWQyYmQ5Mzc1ODJhNTc1YjYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdt
eC5uZXQ+CitEYXRlOiBTdW4sIDI1IEF1ZyAyMDI0IDExOjMzOjU5ICswMjAwCitTdWJqZWN0OiBb
UEFUQ0hdIHRlc3Q6IGZpeCBnY2MtMTQueCBjb21waWxlIChpbXBsaWNpdCBpbnQpCitNSU1FLVZl
cnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250
ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK0ZpeGVzOgorCisgIHRlc3QuYzoxNDo4OiBl
cnJvcjogdHlwZSBkZWZhdWx0cyB0byDigJhpbnTigJkgaW4gZGVjbGFyYXRpb24gb2Yg4oCYbnVt
X3Rlc3TigJkgWy1XaW1wbGljaXQtaW50XQorICAgICAxNCB8IHN0YXRpYyBudW1fdGVzdDsKKyAg
ICAgICAgfCAgICAgICAgXn5+fn5+fn4KKworU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIg
PHBzLnJlcG9ydEBnbXgubmV0PgorCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2RvdHRl
ZG1hZy9saWJzaGExL3B1bGwvMQorCitTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgQm9ubmVmaWxsZSA8
dGhvbWFzLmJvbm5lZmlsbGVAYm9vdGxpbi5jb20+CistLS0KKyB0ZXN0LmMgfCAyICstCisgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQg
YS90ZXN0LmMgYi90ZXN0LmMKK2luZGV4IDIxYTY1MjUuLjFlYzg5ZDMgMTAwNjQ0CistLS0gYS90
ZXN0LmMKKysrKyBiL3Rlc3QuYworQEAgLTExLDcgKzExLDcgQEAgc3RhdGljIHZvaWQgcHJpbnRf
aGV4KGNvbnN0IGNoYXIqIGRhdGEsIHNpemVfdCBzaXplKQorICAgICAgICAgcHJpbnRmKCIleCV4
IiwgKCh1bnNpZ25lZCBjaGFyKWRhdGFbaV0pLzE2LCAoKHVuc2lnbmVkIGNoYXIpZGF0YVtpXSkl
MTYpOworIH0KKyAKKy1zdGF0aWMgbnVtX3Rlc3Q7Cisrc3RhdGljIGludCBudW1fdGVzdDsKKyAK
KyBzdGF0aWMgaW50IGRvX3Rlc3QoY29uc3QgY2hhciogZGF0YSwgc2l6ZV90IHNpemUsIGNvbnN0
IGNoYXIqIGV4cGVjdGVkX2Rnc3QpCisgeworLS0gCisyLjQ3LjEKKwoKLS0tCmJhc2UtY29tbWl0
OiBlZmM3YTIwZDVlZjEwOWEzMmM0MjM3ZWFmOTA3ZjY4NTk2OGQzYzQ0CmNoYW5nZS1pZDogMjAy
NDEyMTEtZml4X2djYzE0X2xpYnNoYTEtNDczYTVmNTQwZWFiCgpCZXN0IHJlZ2FyZHMsCi0tIApU
aG9tYXMgQm9ubmVmaWxsZSA8dGhvbWFzLmJvbm5lZmlsbGVAYm9vdGxpbi5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
