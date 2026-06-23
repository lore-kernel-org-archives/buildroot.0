Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C4CCD98F0
	for <buildroot@archiver.kernel.org>; Tue, 23 Jun 2026 05:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE3C3607C7;
	Tue, 23 Jun 2026 05:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlvpEyREl89G; Tue, 23 Jun 2026 05:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F102607C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782191854;
	bh=sVHNPzNGvkkDN9KdKTLT74rTRv4A12elVfmJACosyUM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NIUBbbroscQ9Te2bycz02J8WPJL9vW8b1Ut/o2CBe0NoP+/Nn8zfRAOhjvV8HXD7i
	 17nJ1O5QP/RIFaMgMotNdUn1PCleRMHDthgzy60qbMakpFD5Eu9JlgW/EDtowEa9ar
	 jtFsT9OmBF8KEiK/E23pU5g7g2FogaX8LHdDA0WSo3xHjAQArdWayUkfc40Ldzj2HN
	 erXJk1SV42O2efsVZg4Pt2uSbGhp4AbQxH7JgknA9Fcog5liDcc5E8sftjNtyegRut
	 OOpmo+wfxKBwa3h7LoAeShko/CypE3LIg2Uz7TKnS72CdcWps6xIzUS9MD/HrrVwwQ
	 Zw2FO90AwfxYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F102607C3;
	Tue, 23 Jun 2026 05:17:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEDEB157
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 05:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC468407D4
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 05:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ddV25HcXJJRv for <buildroot@buildroot.org>;
 Tue, 23 Jun 2026 05:17:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F5A7407B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F5A7407B2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F5A7407B2
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 05:17:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B40C4A4C06B9
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 07:17:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33940)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wbtVl-000000000bh-3mX3
 for buildroot@buildroot.org; Tue, 23 Jun 2026 05:17:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 23 Jun 2026 07:17:25 +0200
Message-ID: <20260623051725.4526-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782191846;
 bh=piq/qfd1d59Dzc9vyfsDoTjFXktWk0c6xIEc1sQfvds=;
 h=From:To:Subject:Date:From;
 b=Lb/V6ADLXyIVJh/ebwhev9FwGk4eCbXrmOerfZXikJMugBZgnzxeSkoyQQHWB4tLX
 QgtAvjynxnZ9nNx98rOIkK40PbywjVmtlIAbFqTGT4uvr/VDl2Xg0AuY1fiAEksAqG
 9lih/BM6rtYiA/o0w0e5v7bo5Y804nBRFi4OhmET0/H8MiTz395p32yrKC5MtmIKTU
 FvcDct+5sS6RjAj9BQi/VKckvNnWst/yQa+isdZV/9sfwqH/O17B+BBlcxWN1XllhV
 xFhPq2aT6NZvWh7PyPB42Bd5kOx8fcDxq5mMOgeXKr5gRBSklN0G+2ijHFDdGBJ0i+
 3XAv54d3K53uA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Lb/V6ADL
Subject: [Buildroot] [PATCH 1/1] package/kodi: add upstream patch to fix
 build on s390, mark unavailable on m68k
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

QnVpbGQgZXJyb3JzIHdlcmUgZm91bmQgYnkgdGhlIEdpdGxhYiBwaXBlbGluZXMgd2l0aCB0aGVz
ZSBkZWZjb25maWdzOgoKLSBib290bGluLW02OGstNjgwNDAtdWNsaWJjCiAgQ01ha2UgRXJyb3Ig
YXQgY21ha2Uvc2NyaXB0cy9saW51eC9BcmNoU2V0dXAuY21ha2U6NTAgKG1lc3NhZ2UpOgogICAg
VW5rbm93biBDUFU6IG02OGsKCi0gYm9vdGxpbi1zMzkweC16MTMtZ2xpYmMKICBDTWFrZSBFcnJv
ciBhdCBjbWFrZS9zY3JpcHRzL2xpbnV4L0FyY2hTZXR1cC5jbWFrZTo1MCAobWVzc2FnZSk6CiAg
ICBVbmtub3duIENQVTogczM5MHgKCkJhY2twb3J0IGFuIHVwc3RyZWFtIGNvbW1pdCBmcm9tIHRo
ZSB1cGNvbWluZyBQaWVycyBicmFuY2ggdG8gZml4IHRoZQpyZXN0cmljdGlvbiBpbiBBcmNoU2V0
dXAuY21ha2UuCgpUaGlzIGNhdXNlZCBhIGRpZmZlcmVudCBidWlsZCBlcnJvciBvbiBtNjhrIGxh
dGVyIG9uOgoKL2J1aWxkcy9ia3VobHMvYnVpbGRyb290L2JyLXRlc3QtcGtnL2Jvb3RsaW4tbTY4
ay02ODA0MC11Y2xpYmMvYnVpbGQva29kaS0yMS4zLU9tZWdhL3hibWMvdXRpbHMvTWF0aFV0aWxz
Lmg6MTQyOjU6CiBlcnJvcjogdW5rbm93biByZWdpc3RlciBuYW1lIOKAmHN04oCZIGluIOKAmGFz
beKAmQogIDE0MiB8ICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoCgpiZWNhdXNlIG02OGsgaXMg
bm90IHBhcnQgb2YgdGhlIGxpc3Qgb2YgYXJjaHMgdG8gZGlzYWJsZSBhc20gY29kZToKaHR0cHM6
Ly9naXRodWIuY29tL3hibWMveGJtYy9ibG9iL09tZWdhL3hibWMvdXRpbHMvTWF0aFV0aWxzLmgj
TDI2CgpVcHN0cmVhbSByZWplY3RlZCB0byBhZGQgbTY4ayB0aGVyZToKaHR0cHM6Ly9naXRodWIu
Y29tL3hibWMveGJtYy9wdWxsLzIyNTE5Cmh0dHBzOi8vZ2l0aHViLmNvbS94Ym1jL3hibWMvcHVs
bC8yMjM1NyNpc3N1ZWNvbW1lbnQtMTM2ODM1ODQ3MQoKc28gd2UgZGlzYWJsZSBtNjhrIGluIEJS
Ml9QQUNLQUdFX0tPRElfQVJDSF9TVVBQT1JUUy4KClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxz
IDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQpHaXRsYWIgcGlwZWxpbmVzIHBhc3NlZDoKaHR0cHM6Ly9n
aXRsYWIuY29tL2JrdWhscy9idWlsZHJvb3QvLS9jb21taXRzLzg1ZGRkNmI0ZjgxM2U0Y2Q3MTk3
YTYzMDM3YzNjYjI4YjJjMjU2OTEKCiAuLi4wMDYtY21ha2UtU2V0LUFSQ0gtdG8tQ1BVLWJ5LWRl
ZmF1bHQucGF0Y2ggfCA0MSArKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL2tvZGkvQ29uZmln
LmluICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArCiAyIGZpbGVzIGNoYW5nZWQsIDQzIGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2tvZGkvMDAwNi1jbWFrZS1T
ZXQtQVJDSC10by1DUFUtYnktZGVmYXVsdC5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uva29k
aS8wMDA2LWNtYWtlLVNldC1BUkNILXRvLUNQVS1ieS1kZWZhdWx0LnBhdGNoIGIvcGFja2FnZS9r
b2RpLzAwMDYtY21ha2UtU2V0LUFSQ0gtdG8tQ1BVLWJ5LWRlZmF1bHQucGF0Y2gKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYzViYmJlOTYzNgotLS0gL2Rldi9udWxsCisr
KyBiL3BhY2thZ2Uva29kaS8wMDA2LWNtYWtlLVNldC1BUkNILXRvLUNQVS1ieS1kZWZhdWx0LnBh
dGNoCkBAIC0wLDAgKzEsNDEgQEAKK0Zyb20gMTY5NWJhMTIzODAyNzIwNTZmMzY5ZjQzNDc0Nzgz
OWIyYWUzOGQ5MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IGZvc3NkZCA8Zm9zc2Rk
QHB3bmVkLmxpZmU+CitEYXRlOiBTYXQsIDIyIEZlYiAyMDI1IDIwOjU5OjI4ICswMTAwCitTdWJq
ZWN0OiBbUEFUQ0hdIFtjbWFrZV0gU2V0IEFSQ0ggdG8gQ1BVIGJ5IGRlZmF1bHQKKworUmVkdWNl
cyBjb21wbGV4aXR5IG9mIHJlZHVuZGFudCBhcmNoaXRlY3R1cmUgbmFtZXMgYW5kIGFsbG93cyBi
dWlsZGluZworZm9yIG90aGVyIGFyY2hpdGVjdHVyZXMgaW1wbGljaXRseS4KKworVXBzdHJlYW06
IGh0dHBzOi8vZ2l0aHViLmNvbS94Ym1jL3hibWMvY29tbWl0LzE2OTViYTEyMzgwMjcyMDU2ZjM2
OWY0MzQ3NDc4MzliMmFlMzhkOTEKKworU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5k
QGt1aGxzLm5ldD4KKy0tLQorIGNtYWtlL3NjcmlwdHMvbGludXgvQXJjaFNldHVwLmNtYWtlIHwg
MTEgKy0tLS0tLS0tLS0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEwIGRlbGV0
aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvY21ha2Uvc2NyaXB0cy9saW51eC9BcmNoU2V0dXAuY21h
a2UgYi9jbWFrZS9zY3JpcHRzL2xpbnV4L0FyY2hTZXR1cC5jbWFrZQoraW5kZXggYWIxNDIxNzdj
OC4uZjI5YTg3MGExZSAxMDA2NDQKKy0tLSBhL2NtYWtlL3NjcmlwdHMvbGludXgvQXJjaFNldHVw
LmNtYWtlCisrKysgYi9jbWFrZS9zY3JpcHRzL2xpbnV4L0FyY2hTZXR1cC5jbWFrZQorQEAgLTM3
LDE3ICszNyw4IEBAIGVsc2UoKQorICAgZWxzZWlmKENQVSBNQVRDSEVTIGFhcmNoNjQgT1IgQ1BV
IE1BVENIRVMgYXJtNjQpCisgICAgIHNldChBUkNIIGFhcmNoNjQpCisgICAgIHNldChORU9OIFRy
dWUpCistICBlbHNlaWYoQ1BVIE1BVENIRVMgcmlzY3Y2NCkKKy0gICAgc2V0KEFSQ0ggcmlzY3Y2
NCkKKy0gICAgc2V0KE5FT04gRmFsc2UpCistICBlbHNlaWYoQ1BVIE1BVENIRVMgcHBjNjRsZSkK
Ky0gICAgc2V0KEFSQ0ggcHBjNjRsZSkKKy0gICAgc2V0KE5FT04gRmFsc2UpCistICBlbHNlaWYo
Q1BVIE1BVENIRVMgbG9vbmdhcmNoNjQpCistICAgIHNldChBUkNIIGxvb25nYXJjaDY0KQorLSAg
ICBzZXQoTkVPTiBGYWxzZSkKKyAgIGVsc2UoKQorLSAgICBtZXNzYWdlKFNFTkRfRVJST1IgIlVu
a25vd24gQ1BVOiAke0NQVX0iKQorKyAgICBzZXQoQVJDSCAke0NQVX0pCisgICBlbmRpZigpCisg
ZW5kaWYoKQorIAorLS0gCisyLjQ3LjMKKwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9rb2RpL0NvbmZp
Zy5pbiBiL3BhY2thZ2Uva29kaS9Db25maWcuaW4KaW5kZXggNmYyNTZhZGE0My4uMDhhN2NhYWUy
YyAxMDA2NDQKLS0tIGEvcGFja2FnZS9rb2RpL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2tvZGkv
Q29uZmlnLmluCkBAIC00LDYgKzQsOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS09ESV9BUkNIX1NV
UFBPUlRTCiAJZGVmYXVsdCB5IGlmIEJSMl9QQUNLQUdFX0hPU1RfT1BFTkpES19CSU5fQVJDSF9T
VVBQT1JUUwogCSMgaTM4NjogbmVlZHMgc3NlIChzZWUgdXBzdHJlYW0gUFIgMTAzNTEpCiAJZGVw
ZW5kcyBvbiAhKEJSMl9pMzg2ICYmICFCUjJfWDg2X0NQVV9IQVNfU1NFKQorCSMgbTY4ayBub3Qg
c3VwcG9ydGVkIHVwc3RyZWFtCisJZGVwZW5kcyBvbiAhQlIyX202OGsKIAlkZXBlbmRzIG9uIEJS
Ml9VU0VfTU1VICMgbGliY2RpbywgYW5kIG90aGVycwogCiBjb21tZW50ICJrb2RpIG5lZWRzIHB5
dGhvbjMgdy8gLnB5IG1vZHVsZXMsIGEgdUNsaWJjIG9yIGdsaWJjIHRvb2xjaGFpbiB3LyBDKyss
IHRocmVhZHMsIHdjaGFyLCBkeW5hbWljIGxpYnJhcnksIGdjYyA+PSA5LngsIGhvc3QgZ2NjID49
IDkueCIKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
