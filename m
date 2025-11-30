Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0EED111A8
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 07:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5AA140B83;
	Sun, 30 Nov 2025 07:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dao_XDeUKgja; Sun, 30 Nov 2025 07:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8925340B7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8925340B7B;
	Sun, 30 Nov 2025 07:49:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CC76219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 07:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12F9C607E4
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 07:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHP0D3Df3aU7 for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 07:49:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F0A8E607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0A8E607D9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0A8E607D9
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 07:49:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b593.dip0.t-ipconnect.de [84.161.181.147])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4689BA4C777A;
 Sun, 30 Nov 2025 08:48:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54050)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPcAf-000000003Pt-0M3D;
 Sun, 30 Nov 2025 07:48:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 30 Nov 2025 08:48:34 +0100
Message-ID: <20251130074836.4220-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251130074836.4220-1-bernd@kuhls.net>
References: <20251130074836.4220-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764488918;
 bh=VdRAMbaApc0Jag0AnwxrJHf1KNfNw8/PkUboLpIY3sM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=D1wucPtmgpo5PHovXtxYky0Z1Um0vVKPZ7pKxbBbrlMTpvEc9Jx9g3ewWZa09/OKm
 +gXTq5Vq3jnEU6W7zLxBEXwT/iBPAJXLX0OIR2/Cv4lksnADBWF7/JwEhK8ujldiVe
 xb/MSaDQ3iFeNt3M8iTOr3+61q7HPQTGQn8GVpiDLhlxABNHucUy1n2McMhI8mjK0T
 N66Hpy9tXBvpglb/2x8I6jwY4Uu4kx+ECujazPYOBMAkHqcRzUlLdwk0oLGCx5Y2q5
 wnPmHXH3nMCWbeVU5/0H473FLPE5D0yW1letbhofx1WnJr9iooPEEPDTPjd2+kuqCy
 OGNzS1Zle4O+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=D1wucPtm
Subject: [Buildroot] [PATCH 2/4] package/wireplumber: mark broken on uClibc
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

Li4vbGliL3dwL2xvZy5jOjc4MDo0OTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uIOKAmGdldHRpZOKAmTsKIGRpZCB5b3UgbWVhbiDigJhnZXRnaWTigJk/IFstV2ltcGxp
Y2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogIDc4MCB8ICAgZ19hdXRvZnJlZSBnY2hhciAqdGlk
ID0gZ19zdHJkdXBfcHJpbnRmKCIlZCIsIGdldHRpZCgpKTsKCkR1ZSB0byBidWlsZCBlcnJvcnMg
d2l0aCBwaXBld2lyZSB0aGlzIGVycm9yIHdhcyBub3QgZm91bmQgYnkgdGhlCmF1dG9idWlsZGVy
cy4KClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQogcGFj
a2FnZS93aXJlcGx1bWJlci9Db25maWcuaW4gfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS93aXJlcGx1
bWJlci9Db25maWcuaW4gYi9wYWNrYWdlL3dpcmVwbHVtYmVyL0NvbmZpZy5pbgppbmRleCA2NTI4
YTJlMTAyLi5lNDNmMWVkNTJhIDEwMDY0NAotLS0gYS9wYWNrYWdlL3dpcmVwbHVtYmVyL0NvbmZp
Zy5pbgorKysgYi9wYWNrYWdlL3dpcmVwbHVtYmVyL0NvbmZpZy5pbgpAQCAtNCw2ICs0LDcgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX1dJUkVQTFVNQkVSCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9M
VUFfNV8zIHx8IEJSMl9QQUNLQUdFX0xVQV81XzQKIAlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIg
IyBsaWJnbGliMgogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIGxpYmds
aWIyCisJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9VU0VTX1VDTElCQyAjIGdldHRpZAogCWRl
cGVuZHMgb24gQlIyX1VTRV9NTVUgIyBsaWJnbGliMgogCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJH
TElCMgogCWhlbHAKQEAgLTE1LDggKzE2LDEwIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9XSVJFUExV
TUJFUgogCiAJICBodHRwczovL3BpcGV3aXJlLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy93aXJlcGx1
bWJlci8KIAotY29tbWVudCAid2lyZXBsdW1iZXIgbmVlZHMgYSB0b29sY2hhaW4gdy8gd2NoYXIs
IHRocmVhZHMgYW5kIEx1YSA+PSA1LjMiCitjb21tZW50ICJ3aXJlcGx1bWJlciBuZWVkcyBhIGds
aWJjIG9yIG11c2wgdG9vbGNoYWluIHcvIHdjaGFyLCB0aHJlYWRzIGFuZCBMdWEgPj0gNS4zIgog
CWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUElQRVdJUkUKIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1V
CiAJZGVwZW5kcyBvbiAhQlIyX1VTRV9XQ0hBUiB8fCAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFE
UyB8fCBcCisJCUJSMl9UT09MQ0hBSU5fVVNFU19VQ0xJQkMgfHwgXAogCQkoIUJSMl9QQUNLQUdF
X0xVQV81XzMgJiYgIUJSMl9QQUNLQUdFX0xVQV81XzQpCisKLS0gCjIuNDcuMwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
