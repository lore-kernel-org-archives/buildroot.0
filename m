Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD8CF9D0E2
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 16:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 917BE6F498;
	Tue, 14 Apr 2026 16:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DreNCKd1GPU6; Tue, 14 Apr 2026 16:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D393661BE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776183645;
	bh=6aR6B0QZpBGPcyfRupyvC3T3dWwtLRzpszqKaGlHvA0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W9bDheDWAWW3bz4fsUm3qVfQ0NUNMxdkWwF+ez/0jbw3FT6yu/vkLQIJmcfzVv4H4
	 ygij8N4Y1yaYBfjQameUqzhR3VvitA7+jyiZCj8CSq7bGAUrv6yz67cugv6yTF85YO
	 mL3+5LRjIuOmsL4j3L9x8fnbIbmYu/WPxLKee+pZa82x+eVCr3cRa+RPPIzVfOpuyQ
	 ctS2Za0DPS5iJeB4lNVl2DY6vDcNk5oHGKE4qhzz82nDQMsNHA+aUX8nM4y87/k46x
	 YhSj5nORbgvS+pin8Iy7k6XJ0h3AiEsdQ1HPYCZa/U1Dge41hbDVF5bfVd9ZmJkI4M
	 uYRb14Kmum7nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D393661BE6;
	Tue, 14 Apr 2026 16:20:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D562F237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAF8E403C8
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hoWGlxtEFpYb for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 16:20:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A5D7E40055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5D7E40055
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5D7E40055
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:20:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be9a.dip0.t-ipconnect.de [84.161.190.154])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3F1D6A4C2D47;
 Tue, 14 Apr 2026 18:20:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36316)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCgV2-000000005zN-2VSQ;
 Tue, 14 Apr 2026 16:20:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 14 Apr 2026 18:20:26 +0200
Message-ID: <20260414162028.2141018-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414162028.2141018-1-bernd@kuhls.net>
References: <20260414162028.2141018-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776183629;
 bh=1k7ulJnzrtwpFHkR3pDKl7Ly3lnkBW8CESQV4GwGI0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Pmfvs4jqwGmSPUSH4/8xEzo4zmo9sN5r9/pnwxgVcbkxuhRI1S7yfzEoiuiN87h0l
 Qy37rr1pd5ityKXeZ+rAkcQxEahRW60PH1JiwOiEGznXZHsdercFf2yUbFuFTNo2ta
 OlkZh2vCKAZBrzucePMLf6+nemV8okysbDAH2592iDkUR5zyKme1HQvTqjHbHcJ1JP
 TiH2CLkXsFNllWyswX0/CfpYMVbvSSsJvKJE3oN3hQDrM1Z7T+xQ/IfDDqhmR8h8+u
 fqWSKMtzbP+M6NCjhC4wMFu0yrUHwt3f6wv0kV3vFpZmAG9TdSYIMDoYKzFjUK/B3U
 ts7Jt9mp6fA8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Pmfvs4jq
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
ID0gZ19zdHJkdXBfcHJpbnRmKCIlZCIsIGdldHRpZCgpKTsKClRoZSBwcm9ibGVtIHdhcyBoaWRk
ZW4gYnkgcGlwZXdpcmUgYmVpbmcgYnJva2VuIHdpdGggdUNsaWJjIHNpbmNlIGF0CmxlYXN0IFNl
cCAyMDI0OiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZWU1L2VlNTBj
ODMzMTk0NjgxNGMyZmVjYjBjYTU2Y2E1MWMxYmIwYmM1NTEvCgpQaXBld2lyZSB3YXMgYnVtcGVk
IGZyb20gMC4zLjgxIHRvIDEuMi4yIGluIEF1ZyAyMDI0IHdpdGggYnVpbGRyb290IGNvbW1pdAo5
M2I3MjY5MmMzNmY4MzU3ZTg2NzY1MGY0YjhmYWM5MWRmZjM3NWY1IHdoaWNoIGFmYWljcyBjYXVz
ZWQgYWxsIHVDbGliYwpidWlsZHMgdG8gZmFpbCBkdWUgdG8gbWlzc2luZyB0c3NfdCgpIHdob3Nl
IHVzYWdlIHdhcyBhZGRlZCB0byBwaXBld2lyZSBpbgp2ZXJzaW9uIDEuMS44MSAoaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BpcGV3aXJlL3BpcGV3aXJlLy0vY29tbWl0LwpkZTBkYjQ4
ZjE3YWEzOTE5MTdmZjViNDMwYjdiOWZlMWRhYzQ0M2ZlKSBhbmQgbGF0ZXIgcmVtb3ZlZCB3aXRo
IGh0dHBzOi8vCmdpdGxhYi5mcmVlZGVza3RvcC5vcmcvcGlwZXdpcmUvcGlwZXdpcmUvLS9jb21t
aXQvCjljMTkyODRmN2YwNjJhNTBlMDU5YjA1OTMwNjg0MjliMzQ1YWNmMzQgaW4gdmVyc2lvbiAx
LjMuODEuCgpJbiB3aXJlcGx1bWJlciB0aGUgcmVsZXZhbnQgcGFydCBvZiBjb2RlIHdpdGggZ2V0
dGlkKCkgd2FzIGFkZGVkIGluCnZlcnNpb24gMC41LjkuIEJ1aWxkcm9vdCBidW1wZWQgd2lyZXBs
dW1iZXIgZnJvbSAwLjUuNSBkaXJlY3RseSB0byAwLjUuMTAKd2l0aCBjb21taXQgYzQyYjI2YmI0
NzFhMjYwZTJiYjNkYTc5ODhhZjc3Zjc4YjJiNDI4MC4KClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQogcGFja2FnZS93aXJlcGx1bWJlci9Db25maWcuaW4g
fCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS93aXJlcGx1bWJlci9Db25maWcuaW4gYi9wYWNrYWdlL3dp
cmVwbHVtYmVyL0NvbmZpZy5pbgppbmRleCA2NTI4YTJlMTAyLi5lNDNmMWVkNTJhIDEwMDY0NAot
LS0gYS9wYWNrYWdlL3dpcmVwbHVtYmVyL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3dpcmVwbHVt
YmVyL0NvbmZpZy5pbgpAQCAtNCw2ICs0LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1dJUkVQTFVN
QkVSCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MVUFfNV8zIHx8IEJSMl9QQUNLQUdFX0xVQV81
XzQKIAlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBsaWJnbGliMgogCWRlcGVuZHMgb24gQlIy
X1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIGxpYmdsaWIyCisJZGVwZW5kcyBvbiAhQlIyX1RPT0xD
SEFJTl9VU0VTX1VDTElCQyAjIGdldHRpZAogCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBsaWJn
bGliMgogCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJHTElCMgogCWhlbHAKQEAgLTE1LDggKzE2LDEw
IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9XSVJFUExVTUJFUgogCiAJICBodHRwczovL3BpcGV3aXJl
LnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy93aXJlcGx1bWJlci8KIAotY29tbWVudCAid2lyZXBsdW1i
ZXIgbmVlZHMgYSB0b29sY2hhaW4gdy8gd2NoYXIsIHRocmVhZHMgYW5kIEx1YSA+PSA1LjMiCitj
b21tZW50ICJ3aXJlcGx1bWJlciBuZWVkcyBhIGdsaWJjIG9yIG11c2wgdG9vbGNoYWluIHcvIHdj
aGFyLCB0aHJlYWRzIGFuZCBMdWEgPj0gNS4zIgogCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUElQ
RVdJUkUKIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCiAJZGVwZW5kcyBvbiAhQlIyX1VTRV9XQ0hB
UiB8fCAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB8fCBcCisJCUJSMl9UT09MQ0hBSU5fVVNF
U19VQ0xJQkMgfHwgXAogCQkoIUJSMl9QQUNLQUdFX0xVQV81XzMgJiYgIUJSMl9QQUNLQUdFX0xV
QV81XzQpCisKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
