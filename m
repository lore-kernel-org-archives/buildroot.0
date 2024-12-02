Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D339BD7833D
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 17:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A41C80E0D;
	Mon,  2 Dec 2024 17:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cli7WKGJEIL3; Mon,  2 Dec 2024 17:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F4B4840BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F4B4840BC;
	Mon,  2 Dec 2024 17:41:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 108DF1DAA
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 17:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E399C40AF7
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 17:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gg1ugBxG9Taj for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 17:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4CC440B47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4CC440B47
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4CC440B47
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 17:41:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c998.dip0.t-ipconnect.de [79.214.201.152])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE713A4C3D67;
 Mon,  2 Dec 2024 18:40:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38332)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tIAP5-0000000031f-1Krn;
 Mon, 02 Dec 2024 17:40:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  2 Dec 2024 18:40:08 +0100
Message-Id: <20241202174008.1134667-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202174008.1134667-1-bernd@kuhls.net>
References: <20241202174008.1134667-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1733161211;
 bh=B1siT/1C8s5S+dYoiv0AWK1oosDZL1zJaEUYNeO2BpY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ca1Z+i2vWX0AyVFBakzXvNJBFirFXyBSv4VraCcpe/mcS9m6hOJievdXlsiZ037Od
 kO3bULI9zIHVDlfmUH0nd8N5fMO2BNGQuT//TvMEN229oX6QDGkQCSXEtRbjdHjld4
 6i3ByUdKeWLPRZwKTWOPfMokiFq2CuB7M5OI6nQnqMxtcNv9U7jtXEhjDpZN2MQ2UH
 c9FhpPeE+6noBdK7PKgMjruJ7/rAapVLEFCWmvTU2UNOlitGFiSAU+anWzY+xELDaf
 EXw0fvywarUR3g3rOnNgiopjxBhqgcp9dbICw2xY30v3LVIsI4aSyMk4cPV8hivaHf
 GZvy/VceeHvpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=ca1Z+i2v
Subject: [Buildroot] [PATCH 7/7] package/mesa3d: add option to enable VIRTIO
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
aWcuaW4KaW5kZXggYjQyZTU5M2JlNy4uMDg5Mjg2ZjdjNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9t
ZXNhM2QvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgpAQCAtMzM0LDYg
KzMzNCwxMiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfU1dSQVNU
CiAJaGVscAogCSAgVnVsa2FuIHN3cmFzdCBkcml2ZXIuCiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9N
RVNBM0RfVlVMS0FOX0RSSVZFUl9WSVJUSU8KKwlib29sICJWdWxrYW4gVmlydElPIGRyaXZlciAo
VmVudXMpIgorCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUgorCWhlbHAK
KwkgIFZ1bGthbiBWaXJ0SU8gKHZlbnVzKSBkcml2ZXIuCisKIGNvbW1lbnQgIk9mZi1zY3JlZW4g
UmVuZGVyaW5nIgogCiBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX09TTUVTQV9HQUxMSVVNCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgYi9wYWNrYWdlL21lc2EzZC9tZXNh
M2QubWsKaW5kZXggZDc0NTlkMGYxOS4uYmQ2ZTUzZDhkYSAxMDA2NDQKLS0tIGEvcGFja2FnZS9t
ZXNhM2QvbWVzYTNkLm1rCisrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawpAQCAtMTExLDYg
KzExMSw3IEBAIE1FU0EzRF9HQUxMSVVNX0RSSVZFUlMtJChCUjJfUEFDS0FHRV9NRVNBM0RfR0FM
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
