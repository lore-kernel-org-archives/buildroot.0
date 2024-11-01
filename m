Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6041AE6F093
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 22:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B2B46072B;
	Fri,  1 Nov 2024 22:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeiQ7dTSS7ZT; Fri,  1 Nov 2024 22:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F5D760784
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F5D760784;
	Fri,  1 Nov 2024 22:55:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A62B4979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74C3780BB5
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8bANlquLuFn for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 22:55:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B39A780BAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B39A780BAA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B39A780BAA
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:55:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0255.dip0.t-ipconnect.de [91.58.2.85])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B2F61A4C244E;
 Fri,  1 Nov 2024 23:54:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34926)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t70XB-000000005lU-0goW;
 Fri, 01 Nov 2024 22:54:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 23:54:23 +0100
Message-Id: <20241101225423.278060-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241101225423.278060-1-bernd@kuhls.net>
References: <20241101225423.278060-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730501665;
 bh=6uNw1lrTmUF8Pw1NIFxdnqnfOAdgq4hhGhkJfaiOuoY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qHd0ZIXjX9PePFaFTkHMvqYFNf8H4Dx7ZngN7zIIk8nujLihK07GSqYhOPNA0/glB
 /kK/Iy4AXCW53Hik1Sx48wfB8D8rjUwAgt395PU07hRXwTC/7QicnBe2Jy3K4i2s10
 iD0UXrGl5T2i5ftIk7jvJ69tU1UNrGrKSwDoNDbsuGpWW1oacG+aAAS62JHiuQ6Pog
 HTOdbU2vJkjQj1D9M6XoSMVBH6xzAvIoM5vbq9i7UbqzvAWTAwk5uIYTli6b7Nq6O9
 4f132AXv/NiRapOeDDhoBLvlHgSgm2NaYAkxpKtcFK5h+KRqKy9ev8ILqH4CA/VOFn
 91AI2xXTO3FNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=qHd0ZIXj
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
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
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
aWcuaW4KaW5kZXggMzYzOGU3NjQzYy4uODcwMjNlNjI1ZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9t
ZXNhM2QvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgpAQCAtMzMzLDYg
KzMzMywxMiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfU1dSQVNU
CiAJaGVscAogCSAgVnVsa2FuIHN3cmFzdCBkcml2ZXIuCiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9N
RVNBM0RfVlVMS0FOX0RSSVZFUl9WSVJUSU8KKwlib29sICJWdWxrYW4gVmlydElPIGRyaXZlciAo
VmVudXMpIgorCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUgorCWhlbHAK
KwkgIFZ1bGthbiBWaXJ0SU8gKHZlbnVzKSBkcml2ZXIuCisKIGNvbW1lbnQgIk9mZi1zY3JlZW4g
UmVuZGVyaW5nIgogCiBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX09TTUVTQV9HQUxMSVVNCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgYi9wYWNrYWdlL21lc2EzZC9tZXNh
M2QubWsKaW5kZXggM2QxOTkzMGM4Zi4uOGI0YjIxN2EyNyAxMDA2NDQKLS0tIGEvcGFja2FnZS9t
ZXNhM2QvbWVzYTNkLm1rCisrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawpAQCAtMTE1LDYg
KzExNSw3IEBAIE1FU0EzRF9HQUxMSVVNX0RSSVZFUlMtJChCUjJfUEFDS0FHRV9NRVNBM0RfR0FM
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
