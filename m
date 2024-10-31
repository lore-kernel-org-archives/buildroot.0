Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E284D767FA
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 20:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E122840D1F;
	Thu, 31 Oct 2024 20:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGCkC55Lovw1; Thu, 31 Oct 2024 20:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C06AD40D2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C06AD40D2B;
	Thu, 31 Oct 2024 20:06:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28BB35E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 094CC60D78
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-VgiDYgSaHg for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 20:06:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CFD360B48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CFD360B48
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CFD360B48
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:06:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0A476A4C202C;
 Thu, 31 Oct 2024 21:05:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60236)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t6bPs-000000001WT-1Maw;
 Thu, 31 Oct 2024 20:05:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 21:05:01 +0100
Message-Id: <20241031200501.1107802-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241031200501.1107802-1-bernd@kuhls.net>
References: <20241031200501.1107802-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730405113;
 bh=DbafyXr34WhMx95CXPvrdooZyClRiig/L4I4hNis2BM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tA/lSCiT8hig7E92XSDEuL6Za2NGDtfAMHA7dSje0gZBvX5fFS9X7db/MAzuJU8iZ
 e8wu41sF5Mj3ILqxJa0os0j2U2kjVHelusEWVE6F5s8cE1t5nO3G36POOytJieXSst
 rtjGn31Ra/aqjrA1xC0hg9rwwOMeTxKscDiQsZQW2Sb4ck7Sj5ilPv+scuCYEplc3a
 UttYN1cDa5vAAr5wKaxWsvPNvskO5sArPGdnXXWe16Ad5PqlwghN0IssPCcRbc5i1z
 8/ltj31h8N5YuMUgjRJb8d/fdznWhkE7M1zjM1g823ihnY/J3oa5YTQ+L/rActrGUp
 BUXpDNENRZS1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=tA/lSCiT
Subject: [Buildroot] [PATCH 6/6] package/mesa3d: add option to enable VIRTIO
 vulkan driver
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Daniel Lang <dalang@gmx.at>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKVGhlIHN1cHBvcnQg
Zm9yIFZlbnVzIGluIE1FU0EgaGFzIGJlZW4gc3RhYmxlIHNpbmNlIDIzLjIgc28gYWRkIGFuCm9w
dGlvbiB0byBlbmFibGUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVu
bmVlQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5u
ZXQ+Ci0tLQogcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluIHwgNiArKysrKysKIHBhY2thZ2UvbWVz
YTNkL21lc2EzZC5tayB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4gYi9wYWNrYWdlL21lc2EzZC9Db25m
aWcuaW4KaW5kZXggMzU4NjQ1MWJjNi4uZGZkMzIzZWI1NiAxMDA2NDQKLS0tIGEvcGFja2FnZS9t
ZXNhM2QvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgpAQCAtMzIzLDYg
KzMyMywxMiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfU1dSQVNU
CiAJaGVscAogCSAgVnVsa2FuIHN3cmFzdCBkcml2ZXIuCiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9N
RVNBM0RfVlVMS0FOX0RSSVZFUl9WSVJUSU8KKwlib29sICJWdWxrYW4gVmlydElPIGRyaXZlciAo
VmVudXMpIgorCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUgorCWhlbHAK
KwkgIFZ1bGthbiBWaXJ0SU8gKHZlbnVzKSBkcml2ZXIuCisKIGNvbW1lbnQgIk9mZi1zY3JlZW4g
UmVuZGVyaW5nIgogCiBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX09TTUVTQV9HQUxMSVVNCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgYi9wYWNrYWdlL21lc2EzZC9tZXNh
M2QubWsKaW5kZXggZGMzMTZmYjJlMS4uNDlhOWExZGFmYyAxMDA2NDQKLS0tIGEvcGFja2FnZS9t
ZXNhM2QvbWVzYTNkLm1rCisrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawpAQCAtMTE0LDYg
KzExNCw3IEBAIE1FU0EzRF9HQUxMSVVNX0RSSVZFUlMtJChCUjJfUEFDS0FHRV9NRVNBM0RfR0FM
TElVTV9EUklWRVJfVklSR0wpICAgICs9IHZpcmdsCiBNRVNBM0RfVlVMS0FOX0RSSVZFUlMtJChC
UjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9CUk9BRENPTSkgKz0gYnJvYWRjb20KIE1F
U0EzRF9WVUxLQU5fRFJJVkVSUy0kKEJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX0lO
VEVMKSAgICs9IGludGVsCiBNRVNBM0RfVlVMS0FOX0RSSVZFUlMtJChCUjJfUEFDS0FHRV9NRVNB
M0RfVlVMS0FOX0RSSVZFUl9TV1JBU1QpICs9IHN3cmFzdAorTUVTQTNEX1ZVTEtBTl9EUklWRVJT
LSQoQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfVklSVElPKSArPSB2aXJ0aW8KIAog
aWZlcSAoJChCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVIpLCkKIE1FU0EzRF9DT05G
X09QVFMgKz0gXAotLSAKMi4zOS41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
