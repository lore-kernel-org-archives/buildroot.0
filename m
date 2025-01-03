Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677E0E77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 20:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 099D160AE1;
	Fri,  3 Jan 2025 20:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRUf4Xg5cmk8; Fri,  3 Jan 2025 20:17:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 099AB60B2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 099AB60B2E;
	Fri,  3 Jan 2025 20:17:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C315CAF0
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 20:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C45A409D6
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 20:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzZXH2KEIrSm for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 20:17:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBDDE40983
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBDDE40983
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBDDE40983
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 20:17:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 63FBB60004;
 Fri,  3 Jan 2025 20:17:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  3 Jan 2025 21:17:43 +0100
Message-ID: <20250103201747.3749714-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735935469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/xCMHmUAqscyqL7TviEdC/WkBN/tZJllzqwTEE/X5To=;
 b=pRWZhDTg2ff4REDjVcLteporEKJ2fqm3gvHgB2sBHIp5/5j6c7SB8VZ1Xsoq6Udd3KjbOv
 A04zQnJhtB/gImJd/7/mXEyMjq4PcBnO7m8uI6i2jXzEhoZ8w+qaQeS9J6IZsqZRO8CPzx
 kjpCGG2r6HT/fvpAPiJgAoNzTH2C/IDfN4htwEfnxZp0GW+6NgYaTqNaPkCFYFsAaMtpgh
 Sht4fzGGY/5l4heldpVghYXuIrGEzPIXpV+t3iPRQKKnUk34JGWd6hqWbmljRtUPGsGlQn
 rMjsnyox3lglaZt/ocnlYnaulc3rE4v+5UUC6A+bRdipHr0psAAs33JrbGjP4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pRWZhDTg
Subject: [Buildroot] [PATCH 1/2] package/pixman: backport patch to fix
 inlining issue
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cGl4bWFuIGZhaWxzIHRvIGJ1aWxkIHdpdGggLU9nIG9yIC1PMyBkdWUgdG8gZm9yY2VkIGlubGlu
aW5nCnN0YXRlbWVudHM6CgpwaXhtYW4tY29tYmluZS1mbG9hdC5jOjM3MDo1OiBlcnJvcjogaW5s
aW5pbmcgZmFpbGVkIGluIGNhbGwgdG8gJ2Fsd2F5c19pbmxpbmUnICdjb21iaW5lX3NvZnRfbGln
aHRfYyc6IGZ1bmN0aW9uIG5vdCBjb25zaWRlcmVkIGZvciBpbmxpbmluZwoKVGhlIGZpcnN0IG9j
Y3VyZW5jZSBpbiB0aGUgYXV0b2J1aWxkZXJzIGlzIG9uIE1heSAxMiwgMjAyNCwgYnV0IHRoZQpw
cm9ibGVtIGFscmVhZHkgZXhpc3RlZCBiZWZvcmUgYXMgd2UgaGF2ZW4ndCB1cGRhdGVkIHBpeG1h
biBpbiBhIGxvbmcKdGltZS4gVGhlcmVmb3JlLCB0aGUgaXNzdWUgc3RhcnRlZCBvY2N1cnJpbmcg
YmVjYXVzZSB3ZSBzdGFydGVkCnRlc3RpbmcgbW9yZSByYW5kb20gY29uZmlndXJhdGlvbnMuCgpG
aXhlczoKCiAgaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzJmM2RmNzk2
MWIzMTgxZDllZWY3OTg5MzQzOWFlN2ViYmU0NDE1YWQvCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
UGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgotLS0KIC4uLm5lLWZsb2F0
LmMtZml4LWlubGluaW5nLWZhaWxlZC1lcnJvci5wYXRjaCB8IDU2ICsrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9waXhtYW4vMDAwMy1waXhtYW4tY29tYmluZS1mbG9hdC5jLWZpeC1pbmxpbmluZy1m
YWlsZWQtZXJyb3IucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3BpeG1hbi8wMDAzLXBpeG1h
bi1jb21iaW5lLWZsb2F0LmMtZml4LWlubGluaW5nLWZhaWxlZC1lcnJvci5wYXRjaCBiL3BhY2th
Z2UvcGl4bWFuLzAwMDMtcGl4bWFuLWNvbWJpbmUtZmxvYXQuYy1maXgtaW5saW5pbmctZmFpbGVk
LWVycm9yLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjFjNGIx
NTNmYzUKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3BpeG1hbi8wMDAzLXBpeG1hbi1jb21i
aW5lLWZsb2F0LmMtZml4LWlubGluaW5nLWZhaWxlZC1lcnJvci5wYXRjaApAQCAtMCwwICsxLDU2
IEBACitGcm9tIDY0M2YwOThhMzkyMjU5MmM4MmYzZWExOTY2OGExNTk2ZDkyYTNlN2IgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5k
cml2ZXIuY29tPgorRGF0ZTogVHVlLCAxNiBKdWwgMjAyNCAxNTozMToxNiArMDgwMAorU3ViamVj
dDogW1BBVENIXSBwaXhtYW4tY29tYmluZS1mbG9hdC5jOiBmaXggaW5saW5pbmcgZmFpbGVkIGVy
cm9yCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0
PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK1JlZmVyIFsxXSwgYWx3
YXlzLWlubGluZSBpcyBub3Qgc3VnZ2VzdGVkIHRvIGJlIHVzZWQgaWYgeW91IGhhdmUgaW5kaXJl
Y3QKK2NhbGxzLiBzbyByZXBsYWNlIGZvcmNlX2lubGluZSB3aXRoIGlubGluZSB0byBmaXggZXJy
b3IgbGlrZToKK0luIGZ1bmN0aW9uIOKAmGNvbWJpbmVfaW5uZXLigJksCisgICAgaW5saW5lZCBm
cm9tIOKAmGNvbWJpbmVfc29mdF9saWdodF9jYV9mbG9hdOKAmSBhdCAuLi9waXhtYW4vcGl4bWFu
LWNvbWJpbmUtZmxvYXQuYzo2NTU6NTExOgorLi4vcGl4bWFuL3BpeG1hbi1jb21iaW5lLWZsb2F0
LmM6NjU1OjIxMTogZXJyb3I6IGlubGluaW5nIGZhaWxlZCBpbiBjYWxsIHRvIOKAmGFsd2F5c19p
bmxpbmXigJkg4oCYY29tYmluZV9zb2Z0X2xpZ2h0X2PigJk6IGZ1bmN0aW9uIG5vdCBjb25zaWRl
cmVkIGZvciBpbmxpbmluZworCitUZXN0IHdpdGggZ2NjLTkgYW5kIGdjYy0xNCwgYm90aCB3b3Jr
cyB3ZWxsCisKK1sxXSBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9p
ZD0xMTU2NzkKKworU2lnbmVkLW9mZi1ieTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2lu
ZHJpdmVyLmNvbT4KK1Vwc3RyZWFtOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvcGl4
bWFuL3BpeG1hbi8tL2NvbW1pdC82NDNmMDk4YTM5MjI1OTJjODJmM2VhMTk2NjhhMTU5NmQ5MmEz
ZTdiCistLS0KKyBwaXhtYW4vcGl4bWFuLWNvbWJpbmUtZmxvYXQuYyB8IDYgKysrLS0tCisgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdp
dCBhL3BpeG1hbi9waXhtYW4tY29tYmluZS1mbG9hdC5jIGIvcGl4bWFuL3BpeG1hbi1jb21iaW5l
LWZsb2F0LmMKK2luZGV4IGUxZjgwMzAuLjIzMDE2NGYgMTAwNjQ0CistLS0gYS9waXhtYW4vcGl4
bWFuLWNvbWJpbmUtZmxvYXQuYworKysrIGIvcGl4bWFuL3BpeG1hbi1jb21iaW5lLWZsb2F0LmMK
K0BAIC0yNjEsNyArMjYxLDcgQEAgZ2V0X2ZhY3RvciAoY29tYmluZV9mYWN0b3JfdCBmYWN0b3Is
IGZsb2F0IHNhLCBmbG9hdCBkYSkKKyB9CisgCisgI2RlZmluZSBNQUtFX1BEX0NPTUJJTkVSUyhu
YW1lLCBhLCBiKQkJCQkJXAorLSAgICBzdGF0aWMgZmxvYXQgZm9yY2VfaW5saW5lCQkJCQkJXAor
KyAgICBzdGF0aWMgZmxvYXQJCQkJCQkJXAorICAgICBwZF9jb21iaW5lXyAjIyBuYW1lIChmbG9h
dCBzYSwgZmxvYXQgcywgZmxvYXQgZGEsIGZsb2F0IGQpCQlcCisgICAgIHsJCQkJCQkJCQlcCisg
CWNvbnN0IGZsb2F0IGZhID0gZ2V0X2ZhY3RvciAoYSwgc2EsIGRhKTsJCQlcCitAQCAtMzYwLDEz
ICszNjAsMTMgQEAgTUFLRV9QRF9DT01CSU5FUlMgKGNvbmpvaW50X3hvciwJCU9ORV9NSU5VU19E
QV9PVkVSX1NBLAkJT05FX01JTlVTX1NBX09WRVJfREEpCisgICovCisgCisgI2RlZmluZSBNQUtF
X1NFUEFSQUJMRV9QREZfQ09NQklORVJTKG5hbWUpCQkJCVwKKy0gICAgc3RhdGljIGZvcmNlX2lu
bGluZSBmbG9hdAkJCQkJCVwKKysgICAgc3RhdGljIGZsb2F0CQkJCQkJCVwKKyAgICAgY29tYmlu
ZV8gIyMgbmFtZSAjIyBfYSAoZmxvYXQgc2EsIGZsb2F0IHMsIGZsb2F0IGRhLCBmbG9hdCBkKQlc
CisgICAgIHsJCQkJCQkJCQlcCisgCXJldHVybiBkYSArIHNhIC0gZGEgKiBzYTsJCQkJCVwKKyAg
ICAgfQkJCQkJCQkJCVwKKyAgICAgCQkJCQkJCQkJXAorLSAgICBzdGF0aWMgZm9yY2VfaW5saW5l
IGZsb2F0CQkJCQkJXAorKyAgICBzdGF0aWMgZmxvYXQJCQkJCQkJXAorICAgICBjb21iaW5lXyAj
IyBuYW1lICMjIF9jIChmbG9hdCBzYSwgZmxvYXQgcywgZmxvYXQgZGEsIGZsb2F0IGQpCVwKKyAg
ICAgewkJCQkJCQkJCVwKKyAJZmxvYXQgZiA9ICgxIC0gc2EpICogZCArICgxIC0gZGEpICogczsJ
CQkJXAorLS0gCisyLjQ3LjEKKwotLSAKMi40Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
