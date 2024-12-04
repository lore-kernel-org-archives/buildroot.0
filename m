Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EB8E7716F
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 20:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2018E81A8E;
	Wed,  4 Dec 2024 20:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtLGxRoj07rM; Wed,  4 Dec 2024 20:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32933841AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32933841AF;
	Wed,  4 Dec 2024 20:48:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E78DF1DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D39D4407B6
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSlz6rJq94My for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 20:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55A58407AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55A58407AC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55A58407AC
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:48:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E6E77240005;
 Wed,  4 Dec 2024 20:48:09 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Dec 2024 21:48:01 +0100
Message-ID: <20241204204806.159596-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241204204806.159596-1-thomas.petazzoni@bootlin.com>
References: <20241204204806.159596-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1733345290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFC553uLYns0TBihNUuC2XuUZTdLYxYFvwcJNa21j0s=;
 b=j4ACXm2NVzSdSYC4JNHuIs896ZVfLu7MheM1XIt7ukGv8eNq5Pn3RlHMoY7jSg4ScjlXQC
 ymKmZpRRIPs7xd8tTipcQON778lpgJ0RwO+HRTAMN+5viFXEEjFAcUwFLcVgqv351NUNce
 lWqw6OsL2hjLU1T6cqfGEIvrJGUNi4TE2wketKTh72E8VUH/txm1GtW2zwM6KoB6gdeMtw
 vRZMw9kbwJlx5rzXQczROBpzvkZ5SbetjAAQ/RuBKgzXfRqxujAeGPP/kfaPQTmYlm9irr
 MhcxLXvlpBQdkYRPLdv9njtCZMUn87C62dcCC0LmxkuZYifykca8hCSpjq+2eQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j4ACXm2N
Subject: [Buildroot] [PATCH 2/3] package/android-tools: fix build issue on
 mips64 and powerpc64
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

VGhlIGtlcm5lbCBoZWFkZXJzIG9uIG1pcHM2NCBhbmQgcG93ZXJwYzY0IHdlcmUgaGlzdG9yaWNh
bGx5ICJicm9rZW4iLApkZWZpbmluZyB1NjQgYXMgYW4gInVuc2lnbmVkIGxvbmciIGluc3RlYWQg
b2YgInVuc2lnbmVkIGxvbmcKbG9uZyIuIFRoaXMgaGFzIGJlZW4gZml4ZWQgaW4gdGhlIHVwc3Ry
ZWFtIExpbnV4IGtlcm5lbCBieSBpbnRyb2R1Y2luZwp0aGUgX19TQU5FX1VTRVJTUEFDRV9UWVBF
U19fIGRlZmluaXRpb24uCgpPdXIgY29tbWl0IGEyZTE3OGQ2YjQ1ZGZjNWI4ZDFkNTBmY2JiZmMw
YmVjNWViZjFhZTIgKCJhbmRyb2lkLXRvb2xzOgpkaXNhYmxlIG9uIHNvbWUgYXJjaGl0ZWN0dXJl
IHdpdGggb2xkIGtlcm5lbCBoZWFkZXJzIikgYWxyZWFkeQpkaXNhYmxlZCBidWlsZGluZyBmYXN0
Ym9vdCBvbiBwb3dlcnBjNjQgYW5kIG1pcHM2NCBzeXN0ZW1zIHRoYXQgaGF2ZQp0b28gb2xkIGtl
cm5lbCBoZWFkZXJzLiBIb3dldmVyLCBpdCB0dXJucyBvdXQgdGhhdCBldmVuIHdpdGggdGhlIG5l
dwprZXJuZWwgaGVhZGVycywgdGhlcmUgYXJlIGJ1aWxkIGlzc3VlcyBiZWNhdXNlCl9fU0FORV9V
U0VSU1BBQ0VfVFlQRVNfXyBpc24ndCBkZWZpbmVkIGV2ZXJ5d2hlcmUgaXQgc2hvdWxkIGJlIGlu
IHRoZQphbmRyb2lkLXRvb2xzIGNvZGUgYmFzZS4gVGhlIERlYmlhbiBwYXRjaGUKZGViaWFuL3Bh
dGNoZXMvcHBjNjRlbC1mdGJmcy5wYXRjaCBhZGRzIHNvbWUgZGVmaW5pdGlvbnMsIGJ1dCBpdCdz
Cm1pc3Npbmcgb25lIGZpbGUsIGFuZCBpbiBhbm90aGVyIHRoZSBkZWZpbml0aW9uIGNvbWVzIHRv
byBsYXRlLgoKVGhpcyBjb21taXQgYWRkcyBhbiBleHRyYSBwYXRjaCB0aGF0IGZpeGVzIHRoaXMg
dXAsIGFuZCBtYWtlcyBmYXN0Ym9vdApidWlsZCBwcm9wZXJseSBvbiBtaXBzNjQgYW5kIHBvd2Vy
cGM2NC4KCkZpeGVzOgoKICBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy84
NTI4ZmY4NzZlNjk1Zjc5YmRmZTY0ZjUzMzBkOWQ1MWVlZWY2NmNiLyAocG93ZXJwYzY0KQogIGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzM2YWM2YWY3M2I2MThjMjhkMTYz
NjA5M2RhMzMzZjdlYmQ5ZDZjZmUvIChtaXBzNjQpCgpUaGlzIGlzc3VlIGhhcyBiZWVuIG9jY3Vy
cmluZyBhcyBmYXIgYXMgRmViIDIwMjEsIHdpdGggdGhlIGZpcnN0Cm9jY3VyZW5jZSBhcHBhcmVu
dGx5IGJlaW5nOgoKICBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9kOTUy
MWI0YmZlYWZiMTE0MGMyMTc0NWRiZmUyOGQ0NzZhOWI3MWVjLwoKU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCiAuLi5zLW1h
a2VfZXh0NGZzLmMtZGVmaW5lLV9fU0FORV9VU0VSU1AucGF0Y2ggfCA2OCArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvYW5kcm9pZC10b29scy8wMDE2LWV4dHJhcy1leHQ0X3V0aWxzLW1ha2VfZXh0
NGZzLmMtZGVmaW5lLV9fU0FORV9VU0VSU1AucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2Fu
ZHJvaWQtdG9vbHMvMDAxNi1leHRyYXMtZXh0NF91dGlscy1tYWtlX2V4dDRmcy5jLWRlZmluZS1f
X1NBTkVfVVNFUlNQLnBhdGNoIGIvcGFja2FnZS9hbmRyb2lkLXRvb2xzLzAwMTYtZXh0cmFzLWV4
dDRfdXRpbHMtbWFrZV9leHQ0ZnMuYy1kZWZpbmUtX19TQU5FX1VTRVJTUC5wYXRjaApuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi41ZjM2NTBjYzc3Ci0tLSAvZGV2L251bGwK
KysrIGIvcGFja2FnZS9hbmRyb2lkLXRvb2xzLzAwMTYtZXh0cmFzLWV4dDRfdXRpbHMtbWFrZV9l
eHQ0ZnMuYy1kZWZpbmUtX19TQU5FX1VTRVJTUC5wYXRjaApAQCAtMCwwICsxLDY4IEBACitGcm9t
IDVkYjk1Mjk0MzZmMTNiOGMwNzNhMDMxMGRhM2ExMTA3Zjg0NjQ1ZGEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3Rs
aW4uY29tPgorRGF0ZTogV2VkLCA0IERlYyAyMDI0IDIwOjUxOjIyICswMTAwCitTdWJqZWN0OiBb
UEFUQ0hdIGV4dHJhcy9leHQ0X3V0aWxzL21ha2VfZXh0NGZzLmM6IGRlZmluZQorIF9fU0FORV9V
U0VSU1BBQ0VfVFlQRVNfXworTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9w
bGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitU
aGUgRGViaWFuIHBhdGNoIHBwYzY0ZWwtZnRiZnMucGF0Y2ggaXMgYWxyZWFkeSBkZWZpbmluZwor
X19TQU5FX1VTRVJTUEFDRV9UWVBFU19fIGluIGEgZmV3IGZpbGVzIHRvIHNvbHZlIGEgY29uZmxp
Y3QgYmV0d2Vlbgora2VybmVsIGhlYWRlciBkZWZpbml0aW9ucyBhbmQgbG9jYWwgZGVmaW5pdGlv
biBvZiBzb21lIHR5cGVzLCBvbgorcG93ZXJwYzY0IGFuZCBtaXBzNjQuCisKK0hvd2V2ZXIsIHRo
ZSBEZWJpYW4gcGF0Y2ggbGFja3MgYW4gdXBkYXRlIHRvIGV4dDRfdXRpbHMuYywgYW5kIGhhcyB0
aGUKK2RlZmluaXRpb24gdG9vIGxhdGUgaW4gbWFrZV9leHQ0ZnMuYy4gVGhpcyBjb21taXQgdGhl
cmVmb3JlIGZpeGVzCit0aG9zZSB0d28gcmVtYWluaW5nIGlzc3VlcywgZml4aW5nOgorCitlcnJv
cjogY29uZmxpY3RpbmcgdHlwZXMgZm9yIOKAmHU2NOKAmTsgaGF2ZSDigJhsb25nIHVuc2lnbmVk
IGludOKAmQorCitVcHN0cmVhbTogTi9BLCB3ZSdyZSB0b28gZmFyIGZyb20gdXBzdHJlYW0KK1Np
Z25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5j
b20+CistLS0KKyBleHRyYXMvZXh0NF91dGlscy9leHQ0X3V0aWxzLmMgIHwgNSArKysrLQorIGV4
dHJhcy9leHQ0X3V0aWxzL21ha2VfZXh0NGZzLmMgfCA0ICsrKysKKyAyIGZpbGVzIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvZXh0cmFzL2V4
dDRfdXRpbHMvZXh0NF91dGlscy5jIGIvZXh0cmFzL2V4dDRfdXRpbHMvZXh0NF91dGlscy5jCitp
bmRleCBlOTVmNWNjLi45ZjY4MzZmIDEwMDY0NAorLS0tIGEvZXh0cmFzL2V4dDRfdXRpbHMvZXh0
NF91dGlscy5jCisrKysgYi9leHRyYXMvZXh0NF91dGlscy9leHQ0X3V0aWxzLmMKK0BAIC0xNCw2
ICsxNCwxMCBAQAorICAqIGxpbWl0YXRpb25zIHVuZGVyIHRoZSBMaWNlbnNlLgorICAqLworIAor
KyNpZiBkZWZpbmVkKF9fbGludXhfXykKKysjZGVmaW5lIF9fU0FORV9VU0VSU1BBQ0VfVFlQRVNf
XworKyNlbmRpZgorKworICNpbmNsdWRlICJleHQ0X3V0aWxzLmgiCisgI2luY2x1ZGUgInV1aWQu
aCIKKyAjaW5jbHVkZSAiYWxsb2NhdGUuaCIKK0BAIC0zNiw3ICs0MCw2IEBACisgI2VuZGlmCisg
CisgI2lmIGRlZmluZWQoX19saW51eF9fKQorLSNkZWZpbmUgX19TQU5FX1VTRVJTUEFDRV9UWVBF
U19fCisgI2luY2x1ZGUgPGxpbnV4L2ZzLmg+CisgI2VsaWYgZGVmaW5lZChfX0FQUExFX18pICYm
IGRlZmluZWQoX19NQUNIX18pCisgI2luY2x1ZGUgPHN5cy9kaXNrLmg+CitkaWZmIC0tZ2l0IGEv
ZXh0cmFzL2V4dDRfdXRpbHMvbWFrZV9leHQ0ZnMuYyBiL2V4dHJhcy9leHQ0X3V0aWxzL21ha2Vf
ZXh0NGZzLmMKK2luZGV4IDMxMjRhZWQuLjMzMmEyMTMgMTAwNjQ0CistLS0gYS9leHRyYXMvZXh0
NF91dGlscy9tYWtlX2V4dDRmcy5jCisrKysgYi9leHRyYXMvZXh0NF91dGlscy9tYWtlX2V4dDRm
cy5jCitAQCAtMTQsNiArMTQsMTAgQEAKKyAgKiBsaW1pdGF0aW9ucyB1bmRlciB0aGUgTGljZW5z
ZS4KKyAgKi8KKyAKKysjaWYgZGVmaW5lZChfX2xpbnV4X18pCisrI2RlZmluZSBfX1NBTkVfVVNF
UlNQQUNFX1RZUEVTX18KKysjZW5kaWYKKysKKyAjaW5jbHVkZSAibWFrZV9leHQ0ZnMuaCIKKyAj
aW5jbHVkZSAiZXh0NF91dGlscy5oIgorICNpbmNsdWRlICJhbGxvY2F0ZS5oIgorLS0gCisyLjQ3
LjAKKwotLSAKMi40Ny4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
