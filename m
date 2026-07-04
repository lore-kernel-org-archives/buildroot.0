Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAADC43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 10:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C082409DE;
	Sat,  4 Jul 2026 10:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGFnFoEF0FlO; Sat,  4 Jul 2026 10:07:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7714F409D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783159640;
	bh=LlQp68SORBM0kN7/kf23ypIjypMD9cR1CDemCIsohPo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PzGGFaQadekemrubGlnYNYmHqLX/0sQuZpLbAKjT0+eG1XUmVf/EP8n1XYK6LFEOB
	 6eeVPJ5ozQ2DjU/8H9ravgKVII13FnpsPPIhmYuHMoosxgfhjngA8+6CpZsJbWPC+o
	 RtA93M+hMIEK6G/xH4NXFknMRV44OwEe1OBjycpuwu3HdA+STUVe4BQc0YfgaZaMGw
	 IJ1eSL1mcV6hxlXsrZdcrclvHK9fduKKESHvQVMj2BbwRF08pCwEJgc2Xmc4IGqejt
	 sVXxM49AHVi+OHZmWmgAr6KW5CPXzBcSRteq/bSNrrw1QpGY8i45K2WQwqaBQCorLO
	 ml5qP9eCHKP4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7714F409D5;
	Sat,  4 Jul 2026 10:07:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4C34316
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 10:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E25C9409D5
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 10:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zD9k2P2qcQQA for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 10:07:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F712409D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F712409D4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F712409D4
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 10:07:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5D1D3A4C109E;
 Sat,  4 Jul 2026 12:07:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfxH2-0000000062m-31cs;
 Sat, 04 Jul 2026 10:07:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 Jul 2026 12:06:59 +0200
Message-ID: <20260704100700.2336075-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783159621;
 bh=kxCbaATlATDmkR2X5ZV8L25fnghBRG9X1VHDzSjDL4o=;
 h=From:To:Cc:Subject:Date:From;
 b=HRPje2VouxvCTWwdLG9inStu/bpzA1pmGmjuM1cJ6Q2AlIuQXSUJRxw0i0XwTG7VY
 N0gO2wSbpwWgO1UxUpQ33Rrr1huMzSyNjnj94Ou5OFb+ImHr+x5uQrcowN+YgHASGh
 TnU82+R6ojHsraeOHpdM9N1JFPuINhpyHDzYUKb7RROjcdLvjos3XsoM4zG5imAFGE
 dQmgre3Vbm8RLNdJ3F3+QCM4zKQZNseV0+8Z9F+6XGbSuwA5XHzNSUXM0GkeDEF2T+
 3EhtABQr/CKJo2/lDP10c3fHC7uLYdCevrmgfyOkpOiuH8P/TmuG55krtnhnVH13bp
 v01S/bmWShgFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HRPje2Vo
Subject: [Buildroot] [PATCH 1/2] package/libnpupnp: needs gcc >= 7
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

QnVpbGRyb290IGNvbW1pdCAyNzc0NTAyMzQ0ZjM1YjU4N2VhOGYxYTJmNDNlYzIzOThjM2ViZGFk
IGJ1bXBlZCB0aGUKcGFja2FnZSBmcm9tIDQuMi4yIHRvIDYuMi4zLiBVcHN0cmVhbSBhZGRlZCB0
aGUgdXNhZ2Ugb2YKc3RkOjpzY29wZWRfbG9jayBpbiB2ZXJzaW9uIDYuMi4wOgpodHRwczovL2Zy
YW1hZ2l0Lm9yZy9tZWRvYzkyL25wdXBucC8tL2NvbW1pdC9hNzYwYjMyNzhhZWUwNjQwOGQ5ZjUw
ZDBjNTQ5NDJmNWJhOWRmOTg5CgpjYXVzaW5nIGEgYnVpbGQgZXJyb3IgZGV0ZWN0ZWQgYnkgdGhl
IEdpdGxhYiBwaXBlbGluZXMgZm9yIHRoZQpib290bGluLWFhcmNoNjQtZ2xpYmMtb2xkIGRlZmNv
bmZpZzoKCi4uL3NyYy9pbmMvdXBucGFwaS5oOjEzMjoyMjogZXJyb3I6CiDigJhzY29wZWRfbG9j
a+KAmSBpcyBub3QgYSBtZW1iZXIgb2Yg4oCYc3Rk4oCZCgpzY29wZWRfbG9jayB3YXMgaW50cm9k
dWNlZCBpbiBnY2MgNy4xOgpodHRwczovL2djYy5nbnUub3JnL29ubGluZWRvY3MvbGlic3RkYysr
L21hbnVhbC9zdGF0dXMuaHRtbCNzdGF0dXMuaXNvLjIwMTcKCnNvIHdlIHJhaXNlIHRoZSBtaW5p
bXVtIHJlcXVpcmVkIGdjYyB2ZXJzaW9uIGFjY29yZGluZ2x5LgoKU2lnbmVkLW9mZi1ieTogQmVy
bmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tClNlcmllcyBwYXNzZWQgR2l0bGFiIHBpcGVs
aW5lczoKaHR0cHM6Ly9naXRsYWIuY29tL2JrdWhscy9idWlsZHJvb3QvLS9jb21taXRzL2M4ZjUw
MzJlMzQzYmMxM2JlYWYwOTgwMjdiNzQ4NTc1ZmVjZWM1NmMKCiBwYWNrYWdlL2xpYm5wdXBucC9D
b25maWcuaW4gfCA2ICsrKy0tLQogcGFja2FnZS9saWJ1cG5wcC9Db25maWcuaW4gIHwgNiArKyst
LS0KIHBhY2thZ2UvdXBtcGRjbGkvQ29uZmlnLmluICB8IDYgKysrLS0tCiAzIGZpbGVzIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdl
L2xpYm5wdXBucC9Db25maWcuaW4gYi9wYWNrYWdlL2xpYm5wdXBucC9Db25maWcuaW4KaW5kZXgg
Y2VhNWJkNWMwNi4uODQ2YmZlNTIxNyAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJucHVwbnAvQ29u
ZmlnLmluCisrKyBiL3BhY2thZ2UvbGlibnB1cG5wL0NvbmZpZy5pbgpAQCAtMiw3ICsyLDcgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX0xJQk5QVVBOUAogCWJvb2wgImxpYm5wdXBucCIKIAlkZXBlbmRz
IG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUAogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNf
VEhSRUFEUwotCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85ICMgQysr
MTEKKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcgIyBDKysxNwogCXNl
bGVjdCBCUjJfUEFDS0FHRV9FWFBBVAogCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJDVVJMCiAJc2Vs
ZWN0IEJSMl9QQUNLQUdFX0xJQk1JQ1JPSFRUUEQKQEAgLTEzLDYgKzEzLDYgQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX0xJQk5QVVBOUAogCiAJICBodHRwczovL3d3dy5sZXNib25zY29tcHRlcy5jb20v
dXBtcGRjbGkvbGlibnB1cG5wLmh0bWwKIAotY29tbWVudCAibGlibnB1cG5wIG5lZWRzIGEgdG9v
bGNoYWluIHcvIEMrKywgdGhyZWFkcywgZ2NjID49IDQuOSIKK2NvbW1lbnQgImxpYm5wdXBucCBu
ZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyssIHRocmVhZHMsIGdjYyA+PSA3IgogCWRlcGVuZHMgb24g
IUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB8fCBc
Ci0JCSFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkKKwkJIUJSMl9UT09MQ0hBSU5fR0ND
X0FUX0xFQVNUXzcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlidXBucHAvQ29uZmlnLmluIGIvcGFj
a2FnZS9saWJ1cG5wcC9Db25maWcuaW4KaW5kZXggNDFhZmE5MzAwZi4uNjM0NTI3NjIyZCAxMDA2
NDQKLS0tIGEvcGFja2FnZS9saWJ1cG5wcC9Db25maWcuaW4KKysrIGIvcGFja2FnZS9saWJ1cG5w
cC9Db25maWcuaW4KQEAgLTIsNyArMiw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJVUE5QUAog
CWJvb2wgImxpYnVwbnBwIgogCWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQCiAJZGVw
ZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgbGlibnB1cG5wCi0JZGVwZW5kcyBv
biBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkKKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hB
SU5fR0NDX0FUX0xFQVNUXzcgIyBsaWJucHVwbnAKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfRVhQQVQK
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCQ1VSTAogCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJOUFVQ
TlAKQEAgLTEyLDUgKzEyLDUgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJQlVQTlBQCiAKIAkgIGh0
dHA6Ly93d3cubGVzYm9uc2NvbXB0ZXMuY29tL3VwbXBkY2xpLwogCi1jb21tZW50ICJsaWJ1cG5w
cCBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyssIHRocmVhZHMsIGdjYyA+PSA0LjkiCi0JZGVwZW5k
cyBvbiAhQlIyX0lOU1RBTExfTElCU1REQ1BQIHx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURT
IHx8ICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkKK2NvbW1lbnQgImxpYnVwbnBwIG5l
ZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgdGhyZWFkcywgZ2NjID49IDciCisJZGVwZW5kcyBvbiAh
QlIyX0lOU1RBTExfTElCU1REQ1BQIHx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8ICFC
UjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF83CmRpZmYgLS1naXQgYS9wYWNrYWdlL3VwbXBkY2xp
L0NvbmZpZy5pbiBiL3BhY2thZ2UvdXBtcGRjbGkvQ29uZmlnLmluCmluZGV4IDc0ZWI3Njg4MzAu
LjU2MmQyN2RiMzcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdXBtcGRjbGkvQ29uZmlnLmluCisrKyBi
L3BhY2thZ2UvdXBtcGRjbGkvQ29uZmlnLmluCkBAIC0zLDcgKzMsNyBAQCBjb25maWcgQlIyX1BB
Q0tBR0VfVVBNUERDTEkKIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZm9yaygpCiAJZGVwZW5k
cyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAKIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFT
X1RIUkVBRFNfTlBUTAotCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85
ICMgQysrMTEsIGxpYnVwbnBwCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFT
VF83ICMgbGlibnB1cG5wIC0+IGxpYnVwbnBwCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0pTT05DUFAK
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCTUlDUk9IVFRQRAogCXNlbGVjdCBCUjJfUEFDS0FHRV9M
SUJNUERDTElFTlQKQEAgLTE1LDggKzE1LDggQEAgY29uZmlnIEJSMl9QQUNLQUdFX1VQTVBEQ0xJ
CiAKIAkgIGh0dHA6Ly93d3cubGVzYm9uc2NvbXB0ZXMuY29tL3VwbXBkY2xpLwogCi1jb21tZW50
ICJ1cG1wZGNsaSBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyssIE5QVEwsIGdjYyA+PSA0LjkiCitj
b21tZW50ICJ1cG1wZGNsaSBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyssIE5QVEwsIGdjYyA+PSA3
IgogCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKIAlkZXBlbmRzIG9uICFCUjJfSU5TVEFMTF9MSUJT
VERDUFAgfHwgXAogCQkhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEU19OUFRMIHx8IFwKLQkJIUJS
Ml9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOQorCQkhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVB
U1RfNwotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
