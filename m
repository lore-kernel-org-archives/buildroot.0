Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F34C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10C3E40670;
	Mon,  3 Aug 2026 14:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhypjSRvnEpI; Mon,  3 Aug 2026 14:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56D61405E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785766620;
	bh=bpBEHLpTdAcyshDU4hJKSdvzHT4iQFNIZeiJol8/GM8=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=YOIOTSNkGVfemORds6jy8FvdBp/lpEE+FNrV6XKishhzYPq3HUFOss+uUdcuJF3JM
	 CjTHEMq2WnXCjF9VnwkrQ4CFBXI/Iczf6Fv5vmrlvgtyD1Rye4KE7wBCEcW58RHT/i
	 N1tmeewTdOhhusgoZZEc8cHvPPysurJvAVnBqKcnpOZhFf274YvxmOWtAliXpc2usz
	 axngt437rqzT2xwlGB1kxJQfZN0/ACAWpEd6w8PpTk9k2hAeVpMoqh2IHQk0PUH7mf
	 Q3HR3IaBOj9BBs1bsw2cFFjM68svqhQWmlMijHMUOrPD/MFx3tXzVjrhuVUTYTReU8
	 asknoVnyXMNdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56D61405E6;
	Mon,  3 Aug 2026 14:17:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABF882CE
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A43C405E4
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOKeYP2Hw0Ho for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 14:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FDD8405E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FDD8405E6
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FDD8405E6
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:16:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 284374E410B9
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:16:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E3C9D6029B;
 Mon,  3 Aug 2026 14:16:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B620411C30DC7; 
 Mon,  3 Aug 2026 16:16:52 +0200 (CEST)
Date: Mon, 03 Aug 2026 16:16:46 +0200
MIME-Version: 1.0
Message-Id: <20260803-libxmslxec-bump-v2-1-7b668ecb24e8@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNOw6DMBAFr4K2zkbYIPKpco+IApt12AhjZAMiQ
 tw9NqlTjjRv3gaBPFOAe7aBp4UDuyGCPGWgu2Z4EXIbGWQuq/wiCuxZrTb0K2lUsx1RlKVpq1y
 RMRLiavRkeD2Kz/rHYVZv0lPKJKPjMDn/OS4Xkbz/9UWgwCvJW1OIKlrmoZybeh7O2lmo933/A
 kWFMIDCAAAA
X-Change-ID: 20260713-libxmslxec-bump-144fd60beff2
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1785766613; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=vgkgk8TM5vF5mzcDlJOlE2SqsIWYZdSteQDuAUnO6s0=;
 b=qJBHya0fQb1YF7VxOowXlUkualL73fjjZ0PEolWrdzymxLN44UiSwQuEQnYGTB8MOVWJo/
 yZSjMIKVjYg7BT7tgIVCejQrZgHbm4ZcEoCXEpEc1njMmBt8Oua2CoRwqwiZhQcVMR2Az5
 /1J70VGhZ5z2sXo+bk4XoRnpduU7hn6BVQeqsZSBRaEKUIlnaPuyJaLOU7l+gaCmIaoP7d
 K39A65ORcZn6uKVwi3qSKwa4R7whAZ13UgmYP9s684IWMAkU3l/y23J+4+ZqDyKBhKrBQ4
 aflCORgywK5m9jSYq5PeJPjeeoQWAjUtz4QwPfTGFj+8OpZnRCXKm506Vz84DA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qJBHya0f
Subject: [Buildroot] [PATCH v2] package/libxmlsec1: bump version to 1.3.12
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

VXBkYXRlIGxpYnhtbHNlYyBmcm9tIDEuMy45IHRvIDEuMy4xMi4gVGhlIHBhY2thZ2UgdGhlbiBu
ZWVkcyBhIGZldwphZGp1c3RtZW50czoKLSB0aGVyZSBhcmUgdW5kZWZpbmVkIHJlZmVyZW5jZXMg
dG8geG1sRGVidWdEdW1wRG9jdW1lbnQgKFsxXSk6CgogIHVuaXRfdGVzdHMvdHJhbnNmb3JtX2hl
bHBlcnNfdW5pdF90ZXN0cy5jOjI5MTo5OiBlcnJvcjogaW1wbGljaXQKICBkZWNsYXJhdGlvbiBv
ZiBmdW5jdGlvbiDigJh4bWxEZWJ1Z0R1bXBEb2N1bWVudOKAmQogIFstV2ltcGxpY2l0LWZ1bmN0
aW9uLWRlY2xhcmF0aW9uXQoKVGhpcyBpcyBkdWUgdG8geG1sc2VjMSB1bml0IHRlc3RzIGJlaW5n
IGJ1aWx0IHN5c3RlbWF0aWNhbGx5LCBhbmQKZGVwZW5kaW5nIG9uIGxpYnhtbDIgYmVpbmcgYnVp
bHQgd2l0aCAtLXdpdGgtZGVidWcsIHNvIHBhdGNoCmFwcHMvTWFrZWZpbGUuYW0gYWNjb3JkaW5n
bHkgYXQgYnVpbGQgdGltZSB0byBkaXNhYmxlIHVuaXQgdGVzdHMgYnVpbGQuCgotIHRoZSBidWls
ZCBjYW4gZmFpbCB3aXRoIG9sZGVyIEdDQyB2ZXJzaW9ucyBkdWUgdG8gYW4gdW5pbXBsZW1lbnRl
ZAogIHBhcmFtZXRlciAoWzJdKToKCiAgYWFyY2g2NC1saW51eC1nY2MuYnJfcmVhbDogZXJyb3I6
IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uIFwKICDigJgtV2Zvcm1hdC1vdmVyZmxv
dz0y4oCZOyBkaWQgeW91IG1lYW4g4oCYLVdzdHJpY3Qtb3ZlcmZsb3c94oCZPwoKVGhpcyBmb3Jt
YXQtb3ZlcmZsb3cgcGFyYW1ldGVyIGhhcyBiZWVuIGltcGxlbWVudGVkIGluIEdDQyA3LCBzbyBt
YWtlCnRoZSBwYWNrYWdlIGRlcGVuZCBvbiBHQ0MgPj0gNy4gQW5vdGhlciBzb2x1dGlvbiBjb3Vs
ZCBoYXZlIGJlZW4gdG8KcGFzcyAtLWRpc2FibGUtcGVkYW50aWMgdG8gdGhlIHBhY2thZ2UncyBj
b25maWd1cmUsIGJ1dCB0aGF0IHNvdW5kcyBhCmJpdCBzdHJvbmcganVzdCB0byBkaXNhYmxlIGEg
cGFyYW1ldGVyIHRoYXQgaGFzIGJlZW4gZXhpc2l0aW5nIGZvcgphbG1vc3QgMTAgeWVhcnMuCgot
IHRoZSBidWlsZCBjYW4gZmFpbCBvbiBtaXNzaW5nIGF0b21pY3MgKFszXSk6CgogIFsuLi5dL2Jv
b3RsaW4tbTY4ay01MjA4LXVjbGliYy9ob3N0L29wdC9leHQtdG9vbGNoYWluL202OGstYnVpbGRy
b290LXVjbGludXgtdWNsaWJjL2Jpbi9sZC5yZWFsOgogIFsuLi5dL2Jvb3RsaW4tbTY4ay01MjA4
LXVjbGliYy9ob3N0L2Jpbi8uLi9tNjhrLWJ1aWxkcm9vdC11Y2xpbnV4LXVjbGliYy9zeXNyb290
L3Vzci9saWIvbGliY3J5cHRvLmEobGliY3J5cHRvLWxpYi10aHJlYWRzX3B0aHJlYWQubyk6CiAg
aW4gZnVuY3Rpb24gYENSWVBUT19hdG9taWNfc3RvcmUnOiB0aHJlYWRzX3B0aHJlYWQuYzooLnRl
eHQrMHhjZDIpOgogIHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYXRvbWljX2lzX2xvY2tfZnJl
ZScKClNvIG1ha2UgdGhlIHBhY2thZ2UgZGVwZW5kIG9uIGxpYmF0b21pYwoKWzFdIGh0dHBzOi8v
Z2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9waXBlbGluZXMvMjUyNzUyNzAzNApbMl0g
aHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL2pvYnMvMTQ0NDk2ODE2MTUK
WzNdIGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9qb2JzLzE0NDQ5Njgx
NjIxCgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgpDby1EZXZl
bG9wZWQtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+ClNp
Z25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
Ci0tLQpDaGFuZ2VzIGluIHYyOgotIEFkZCBCZXJuZCdzIFNvQgotIExpbmsgdG8gdjE6IGh0dHBz
Oi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDcxMy1saWJ4bXNseGVjLWJ1bXAtdjEtMS04ZTI5YTMx
NjIwMmZAYm9vdGxpbi5jb20KLS0tClRoaXMgcGF0Y2ggZm9sbG93cyBCZXJuZCBLdWhscycgYXR0
ZW1wdCB0byB1cGdyYWRlIGxpYnhtbHNlYzEgdG8gMS4zLjExCmZyb20gYSBmZXcgbW9udGhzIGFn
bzoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDI2MDUxOTE4NTczMi4xMDI5
NDAyLTEtYmVybmRAa3VobHMubmV0LwoKQmVybmQsIEkgdGhlbiB0b29rIHRoZSBsaWJlcnR5IHRv
IGFkZCB5b3VyIFNvQiBhbmQgQ28tRGV2ZWxvcGVkLWJ5IGZvcgp0aGUgdW5pdCB0ZXN0IGRpc2Fi
bGluZyBwYXJ0LCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhhdCdzIG5vdCBvay4KLS0tCiBwYWNr
YWdlL2xpYnhtbHNlYzEvQ29uZmlnLmluICAgICAgIHwgIDUgKysrKysKIHBhY2thZ2UvbGlieG1s
c2VjMS9saWJ4bWxzZWMxLmhhc2ggfCAgMiArLQogcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNl
YzEubWsgICB8IDEwICsrKysrKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnhtbHNlYzEvQ29uZmln
LmluIGIvcGFja2FnZS9saWJ4bWxzZWMxL0NvbmZpZy5pbgppbmRleCA0YTY4Njg1M2FlMGUuLjc4
MmU2Y2VkN2NlOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJ4bWxzZWMxL0NvbmZpZy5pbgorKysg
Yi9wYWNrYWdlL2xpYnhtbHNlYzEvQ29uZmlnLmluCkBAIC0xLDUgKzEsNyBAQAogY29uZmlnIEJS
Ml9QQUNLQUdFX0xJQlhNTFNFQzEKIAlib29sICJsaWJ4bWxzZWMxIgorCWRlcGVuZHMgb24gQlIy
X1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyAjLVdmb3JtYXQtb3ZlcmZsb3cKKwlkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fSEFTX0FUT01JQwogCXNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOU1NMCiAJ
c2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhNTDIKIAloZWxwCkBAIC0xMCwzICsxMiw2IEBAIGNvbmZp
ZyBCUjJfUEFDS0FHRV9MSUJYTUxTRUMxCiAKIAkgIGh0dHBzOi8vd3d3LmFsZWtzZXkuY29tL3ht
bHNlYy8KIAkgIGh0dHBzOi8vZ2l0aHViLmNvbS9sc2gxMjMveG1sc2VjCisKK2NvbW1lbnQgImxp
YnhtbHNlYzEgbmVlZHMgYSB0b29sY2hhaW4gdy8gZ2NjID49IDciCisJZGVwZW5kcyBvbiAgIUJS
Ml9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX0FUT01JQwpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEuaGFzaCBiL3BhY2thZ2Uv
bGlieG1sc2VjMS9saWJ4bWxzZWMxLmhhc2gKaW5kZXggOWUwZTY3ZTczMjJlLi43ZjM0YzI4OTg0
MWIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLmhhc2gKKysrIGIv
cGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9j
YWxseSBjb21wdXRlZAotc2hhMjU2ICBhNjMxYzhjZDdhNmI4NmU2YWRiOWY1YjkzNWQ0NWE5Y2Y5
NzY4YjNjYjA5MGQ0NjFlOGViOWQwNDNjZjliNjJmICB4bWxzZWMxLTEuMy45LnRhci5negorc2hh
MjU2ICAyNDA0NTE5OWFmMTJkOTNmZTVmZGJiYmY3ZTM4NmU4MjNlNDg0MjA3MWU5NDMyZTJiOTBh
YzEwOGI4ODlhOTIzICB4bWxzZWMxLTEuMy4xMi50YXIuZ3oKIHNoYTI1NiAgZDVlOTM4ODUzNDI1
NjM2MGM2YTAwOWQ0ZjE5YWIyYjhkNmVjMGFhN2ZmMzJhNTFlMjJkODk5ZWQ3YmViNWM0OCAgQ29w
eXJpZ2h0CmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5tayBiL3Bh
Y2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rCmluZGV4IDI5MjIyYmMxNmZmZC4uODhmMGFl
OWZkOTRmIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5taworKysg
Yi9wYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxJQlhNTFNFQzFfVkVSU0lPTiA9IDEuMy45CitMSUJY
TUxTRUMxX1ZFUlNJT04gPSAxLjMuMTIKIExJQlhNTFNFQzFfU09VUkNFID0geG1sc2VjMS0kKExJ
QlhNTFNFQzFfVkVSU0lPTikudGFyLmd6CiBMSUJYTUxTRUMxX1NJVEUgPSBodHRwczovL2dpdGh1
Yi5jb20vbHNoMTIzL3htbHNlYy9yZWxlYXNlcy9kb3dubG9hZC8kKExJQlhNTFNFQzFfVkVSU0lP
TikKIExJQlhNTFNFQzFfTElDRU5TRSA9IE1JVApAQCAtMjIsNiArMjIsMTQgQEAgTElCWE1MU0VD
MV9DT05GX09QVFMgPSBcCiAJLS13aXRob3V0LW5zcyBcCiAJLS1kaXNhYmxlLWRlcwogCisjIHht
bHNlY191bml0X3Rlc3RzIG5lZWRzIHhtbERlYnVnRHVtcERvY3VtZW50KCkgZnJvbSBsaWJ4bWwy
IHdoaWNoIGlzIG5vdAorIyBwcmVzZW50IGluIGJ1aWxkcm9vdCBiZWNhdXNlIGxpYnhtbDIgaXMg
YnVpbGQgd2l0aCAtd2l0aG91dC1kZWJ1ZworZGVmaW5lIExJQlhNTFNFQzFfRElTQUJMRV9VTklU
X1RFU1RTCisJJChTRUQpICdzL25vaW5zdF9QUk9HUkFNUyA9IHhtbHNlY191bml0X3Rlc3RzL25v
aW5zdF9QUk9HUkFNUyA9LycgXAorCQkkKEBEKS9hcHBzL01ha2VmaWxlLmFtCitlbmRlZgorTElC
WE1MU0VDMV9QT1NUX1BBVENIX0hPT0tTICs9IExJQlhNTFNFQzFfRElTQUJMRV9VTklUX1RFU1RT
CisKIEhPU1RfTElCWE1MU0VDMV9DT05GX09QVFMgPSBcCiAJLS1lbmFibGUtY3J5cHRvLWRsPW5v
IFwKIAktLXdpdGgtb3BlbnNzbCBcCgotLS0KYmFzZS1jb21taXQ6IGQyYTY1OTlmN2I4NWJhNjRi
NjU0MmFkYTU2NDU3ZWJhNmUyYmUzNjQKY2hhbmdlLWlkOiAyMDI2MDcxMy1saWJ4bXNseGVjLWJ1
bXAtMTQ0ZmQ2MGJlZmYyCgpCZXN0IHJlZ2FyZHMsCi0tICAKQWxleGlzIExvdGhvcsOpIDxhbGV4
aXMubG90aG9yZUBib290bGluLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
