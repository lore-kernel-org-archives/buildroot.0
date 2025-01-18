Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A02AC02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 08:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B02E705A5;
	Sat, 18 Jan 2025 08:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hq4HvpiXyIhm; Sat, 18 Jan 2025 08:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F0F970571
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F0F970571;
	Sat, 18 Jan 2025 08:40:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4E3AB89
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 08:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85F5083B1F
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 08:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2ZmoKYw1VXI for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 08:40:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C72FB83B2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C72FB83B2D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C72FB83B2D
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 08:40:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c706.dip0.t-ipconnect.de [79.214.199.6])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7BCAA4C465B;
 Sat, 18 Jan 2025 09:38:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51208)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tZ4Ln-000000001wU-16j4;
 Sat, 18 Jan 2025 08:38:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 09:38:37 +0100
Message-Id: <20250118083837.2883279-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250118083837.2883279-1-bernd@kuhls.net>
References: <20250118083837.2883279-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737189519;
 bh=ThhpPISEWGznXQiaQDc4S1G1/tA9lZYImtlUv6QobmY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MKjEBfGTrcs3OBkYgwNcBOnPB2JrFm/gS5z1FWqmhg8eLsprvVgg+Gza2N9WdG8mO
 1cvkVic26rjjBzjpisYeJmf4h2JENh+Of0U+4Bv2LukRfRkfiDURQG5qQyGnWtSL5j
 tXA19uWyT27NdjAJc3dFSqGa3JgLRwICrDIUclnAYTFPIbTQqYbS2Z31jFu7wvVvjh
 AyKpFXNJFpOLEqVIRsi2c9HzntERwmTdoV7g1151HymxF8bHN6JHW47tTiXM67G50N
 KRhKn9VVn1OlXeheSx++BLeVwl7lNvIFNbXML3SqkB1ma0V0uHslgIuPVNA3GplWqc
 SfKCUHmULsO9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=MKjEBfGT
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>, Daniel Lang <dalang@gmx.at>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKVGhlIHN1cHBvcnQg
Zm9yIFZlbnVzICh0aGUgVnVsa2FuIFZpcnRJTyBlbmNhcHN1bGF0aW9uKSBpbiBNRVNBIGhhcwpi
ZWVuIHN0YWJsZSBzaW5jZSAyMy4yIHNvIGFkZCBhbiBvcHRpb24gdG8gZW5hYmxlIGl0LgoKU2ln
bmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KU2lnbmVkLW9mZi1ieTog
QWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpNZXNzYWdlLUlkOiA8MjAyNDA4
MjIxODE1NDYuNjQ5MDAtNi1iZXJuZEBrdWhscy5uZXQ+Ci0tLQogcGFja2FnZS9tZXNhM2QvQ29u
ZmlnLmluIHwgNiArKysrKysKIHBhY2thZ2UvbWVzYTNkL21lc2EzZC5tayB8IDEgKwogMiBmaWxl
cyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9D
b25maWcuaW4gYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KaW5kZXggMTZiZDE4OWE1NS4uMTI1
YWFlNDZkMyAxMDA2NDQKLS0tIGEvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCisrKyBiL3BhY2th
Z2UvbWVzYTNkL0NvbmZpZy5pbgpAQCAtMzM0LDYgKzMzNCwxMiBAQCBjb25maWcgQlIyX1BBQ0tB
R0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfU1dSQVNUCiAJaGVscAogCSAgVnVsa2FuIHN3cmFzdCBk
cml2ZXIuCiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9WSVJUSU8K
Kwlib29sICJWdWxrYW4gVmlydElPIGRyaXZlciAoVmVudXMpIgorCXNlbGVjdCBCUjJfUEFDS0FH
RV9NRVNBM0RfVlVMS0FOX0RSSVZFUgorCWhlbHAKKwkgIFZ1bGthbiBWaXJ0SU8gKHZlbnVzKSBk
cml2ZXIuCisKIGNvbW1lbnQgIk9mZi1zY3JlZW4gUmVuZGVyaW5nIgogCiBjb25maWcgQlIyX1BB
Q0tBR0VfTUVTQTNEX09TTUVTQV9HQUxMSVVNCmRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9t
ZXNhM2QubWsgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKaW5kZXggYmQ0NmQ0Yjg5My4uODQy
OGQwYTZiNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCisrKyBiL3BhY2th
Z2UvbWVzYTNkL21lc2EzZC5tawpAQCAtMTExLDYgKzExMSw3IEBAIE1FU0EzRF9HQUxMSVVNX0RS
SVZFUlMtJChCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfVklSR0wpICAgICs9IHZp
cmdsCiBNRVNBM0RfVlVMS0FOX0RSSVZFUlMtJChCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RS
SVZFUl9CUk9BRENPTSkgKz0gYnJvYWRjb20KIE1FU0EzRF9WVUxLQU5fRFJJVkVSUy0kKEJSMl9Q
QUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX0lOVEVMKSAgICs9IGludGVsCiBNRVNBM0RfVlVM
S0FOX0RSSVZFUlMtJChCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9TV1JBU1QpICs9
IHN3cmFzdAorTUVTQTNEX1ZVTEtBTl9EUklWRVJTLSQoQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtB
Tl9EUklWRVJfVklSVElPKSArPSB2aXJ0aW8KIAogaWZlcSAoJChCUjJfUEFDS0FHRV9NRVNBM0Rf
R0FMTElVTV9EUklWRVIpLCkKIE1FU0EzRF9DT05GX09QVFMgKz0gXAotLSAKMi4zOS41CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
