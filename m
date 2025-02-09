Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD94C02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 11:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9991280DCF;
	Sun,  9 Feb 2025 11:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sd07lHHcQ4VQ; Sun,  9 Feb 2025 11:45:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98FCA80DD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98FCA80DD1;
	Sun,  9 Feb 2025 11:45:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80E50C2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 11:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FF424012E
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 11:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2u752fLCq66 for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 11:45:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8D0A400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8D0A400E7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8D0A400E7
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 11:45:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cb83.dip0.t-ipconnect.de [79.214.203.131])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 15137A4C1154;
 Sun,  9 Feb 2025 12:45:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49658)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1th5ko-000000008Se-01kl;
 Sun, 09 Feb 2025 11:45:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sun,  9 Feb 2025 12:45:37 +0100
Message-Id: <20250209114537.795259-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1739101538;
 bh=iKMiisqTgDv6SYbhSFGg//mdiRqR1z8nXKK1exJ0MXw=;
 h=From:To:Cc:Subject:Date:From;
 b=MIN7kzRNpZ0pZ3hLlnW7Ay8ES6GSBQCgpFvzkHB67j9NDPtQ//kOIZbWoCClanrkR
 GpeXxYsbYcicyvpdxynJw7dB4DDIbF2vaYoEaR7+c/rhRLZ9qEbHZA4xmBhYMjHC5n
 jDyG7Mm0/Wxoe2Wtb1D2WgZRNakK+7kRehUtwUJ9U0M8gGueAeMuoLiSvV2PHCuihY
 BYCBuC8UvmPrYwjqdGkywW/NW860kuE8FrmNOrt1Rd8Dn3z2y7PI4swMwdZk6RLTHl
 Mmr4co6nOyD4vntCoNWULnwc6aGHZ4LtNMgBSXVDqemfs7Lla0w8H4Yg0PYoCx5jrg
 mlgpGYZKCg9bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=MIN7kzRN
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: fix armv5te build with
 binutils 2.43
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

VGhlIGJ1aWxkIGVycm9yIG9jY3VycyBzaW5jZSBiaW51dGlscyAyLjQzIHdhcyBhZGRlZCB0byBi
dWlsZHJvb3Qgd2l0aApjb21taXQgODAwYTAzM2Y3ODE4YTc3OTlkNDk5N2FiYTI4YjlmOGY1OTk5
ODcxYgoKRml4ZXM6Cmh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9iNWEv
YjVhNzgyZGI1NzRkZmFiN2FlNjFlMjUyOTFjMDViMTUzN2M0NGM5MS8KClNpZ25lZC1vZmYtYnk6
IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQogLi4ubHBkc3BfYXJtdjV0ZS1maXgt
bGFiZWwtZm9ybWF0LXRvLXdvLnBhdGNoIHwgNjMgKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Zm
bXBlZy8wMDA4LWxpYmF2Y29kZWMtYXJtLW1scGRzcF9hcm12NXRlLWZpeC1sYWJlbC1mb3JtYXQt
dG8td28ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZmbXBlZy8wMDA4LWxpYmF2Y29kZWMt
YXJtLW1scGRzcF9hcm12NXRlLWZpeC1sYWJlbC1mb3JtYXQtdG8td28ucGF0Y2ggYi9wYWNrYWdl
L2ZmbXBlZy8wMDA4LWxpYmF2Y29kZWMtYXJtLW1scGRzcF9hcm12NXRlLWZpeC1sYWJlbC1mb3Jt
YXQtdG8td28ucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMTc4
ZmZiYzMzYgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZmZtcGVnLzAwMDgtbGliYXZjb2Rl
Yy1hcm0tbWxwZHNwX2FybXY1dGUtZml4LWxhYmVsLWZvcm1hdC10by13by5wYXRjaApAQCAtMCww
ICsxLDYzIEBACitGcm9tIDRjNjg4ODQ1YTUwZjdkY2UzYWY5YWZlYmU2MGYwZjdhNDkzYzRmMDcg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25A
YXJtLmNvbT4KK0RhdGU6IEZyaSwgOSBBdWcgMjAyNCAxMTozMjowMCArMDEwMAorU3ViamVjdDog
W1BBVENIXSBsaWJhdmNvZGVjL2FybS9tbHBkc3BfYXJtdjV0ZTogZml4IGxhYmVsIGZvcm1hdCB0
byB3b3JrIHdpdGgKKyBiaW51dGlscyAyLjQzCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1U
eXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PXV0ZjgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKKworYmludXRpbHMgMi40MyBoYXMgc3RyaWN0ZXIgdmFsaWRhdGlvbiBmb3IgbGFiZWxz
WzFdIGFuZCByZXN1bHRzIGluIGVycm9ycword2hlbiBidWlsZGluZyBmZm1wZWcgZm9yIGFybXY1
OgorCitzcmMvbGliYXZjb2RlYy9hcm0vbWxwZHNwX2FybXY1dGUuUzoyMzI6IEVycm9yOiBqdW5r
IGF0IGVuZCBvZiBsaW5lLCBmaXJzdCB1bnJlY29nbml6ZWQgY2hhcmFjdGVyIGlzIGAwJworCitS
ZW1vdmUgdGhlIGxlYWRpbmcgemVybyBpbiB0aGUgIjAxIiBsYWJlbCB0byByZXNvbHZlIHRoaXMg
ZXJyb3IuCisKK1sxXSBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1iaW51dGlscy1nZGIu
Z2l0O2E9Y29tbWl0O2g9MjI2NzQ5ZDVhNmZmMGQ1YzYwN2Q2NDI4ZDZjODFlMWU3ZTdhOTk0Ygor
CitTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KK1NpZ25l
ZC1vZmYtYnk6IE1hcnRpbiBTdG9yc2rDg8K2IDxtYXJ0aW5AbWFydGluLnN0PgorKGNoZXJyeSBw
aWNrZWQgZnJvbSBjb21taXQgNjU0YmQ0NzcxNmM0ZjM2NzE5ZmIwZjNmN2ZkODM4NmQ1ZWQwYjkx
NikKKworVXBzdHJlYW06IGh0dHA6Ly9naXQudmlkZW9sYW4ub3JnLz9wPWZmbXBlZy5naXQ7YT1j
b21taXQ7aD00YzY4ODg0NWE1MGY3ZGNlM2FmOWFmZWJlNjBmMGY3YTQ5M2M0ZjA3CisKK1NpZ25l
ZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CistLS0KKyBsaWJhdmNvZGVj
L2FybS9tbHBkc3BfYXJtdjV0ZS5TIHwgNiArKystLS0KKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvbGliYXZjb2RlYy9hcm0v
bWxwZHNwX2FybXY1dGUuUyBiL2xpYmF2Y29kZWMvYXJtL21scGRzcF9hcm12NXRlLlMKK2luZGV4
IDRmOWFhNDg1ZmQuLmQzMTU2ODYxMWMgMTAwNjQ0CistLS0gYS9saWJhdmNvZGVjL2FybS9tbHBk
c3BfYXJtdjV0ZS5TCisrKysgYi9saWJhdmNvZGVjL2FybS9tbHBkc3BfYXJtdjV0ZS5TCitAQCAt
MjI5LDcgKzIyOSw3IEBAIEEgLmVuZGlmCisgICAuZW5kaWYKKyAKKyAgICAgICAgIC8vIEJlZ2lu
IGxvb3AKKy0wMToKKysxOgorICAgLmlmIFRPVEFMX1RBUFMgPT0gMAorICAgICAgICAgLy8gVGhp
bmdzIHNpbXBsaWZ5IGEgbG90IGluIHRoaXMgY2FzZQorICAgICAgICAgLy8gSW4gZmFjdCB0aGlz
IGNvdWxkIGJlIHBpcGVsaW5lZCBmdXJ0aGVyIGlmIGl0J3Mgd29ydGggaXQuLi4KK0BAIC0yNDEs
NyArMjQxLDcgQEAgQSAuZW5kaWYKKyAgICAgICAgIHN0ciAgICAgU1QwLCBbUFNULCAjLTRdIQor
ICAgICAgICAgc3RyICAgICBTVDAsIFtQU1QsICM0ICogKE1BWF9CTE9DS1NJWkUgKyBNQVhfRklS
X09SREVSKV0KKyAgICAgICAgIHN0ciAgICAgU1QwLCBbUFNBTVBdLCAjNCAqIE1BWF9DSEFOTkVM
UworLSAgICAgICAgYm5lICAgICAwMWIKKysgICAgICAgIGJuZSAgICAgMWIKKyAgIC5lbHNlCisg
ICAgIC5pZiBcZmlyX3RhcHMgJiAxCisgICAgICAgLnNldCBMT0FEX1JFRywgMQorQEAgLTMzMyw3
ICszMzMsNyBAQCBUICAgICAgIG9yciAgICAgQUMwLCBBQzAsIEFDMQorICAgICAgICAgc3RyICAg
ICBTVDMsIFtQU1QsICMtNF0hCisgICAgICAgICBzdHIgICAgIFNUMiwgW1BTVCwgIzQgKiAoTUFY
X0JMT0NLU0laRSArIE1BWF9GSVJfT1JERVIpXQorICAgICAgICAgc3RyICAgICBTVDMsIFtQU0FN
UF0sICM0ICogTUFYX0NIQU5ORUxTCistICAgICAgICBibmUgICAgIDAxYgorKyAgICAgICAgYm5l
ICAgICAxYgorICAgLmVuZGlmCisgICAgICAgICBiICAgICAgIDk5ZgorIAorLS0gCisyLjMwLjIK
KwotLSAKMi4zOS41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
