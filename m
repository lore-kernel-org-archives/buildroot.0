Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F2FCA101E
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 14:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58BB16075A;
	Sun,  1 Sep 2024 14:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dX3ywHClXN7h; Sun,  1 Sep 2024 14:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B0E260762
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B0E260762;
	Sun,  1 Sep 2024 14:15:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58A6D1BF2B6
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46F4140499
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQxAenjPUHwe for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 14:15:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4C0D40433
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4C0D40433
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4C0D40433
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 14:15:09 +0000 (UTC)
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sklMB-007zOz-Vf; Sun, 01 Sep 2024 16:15:07 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id c8d69273;
 Sun, 1 Sep 2024 14:15:05 +0000 (UTC)
Date: Sun, 1 Sep 2024 17:15:05 +0300
Message-ID: <20240901171505.GD1275649@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20240829131232.2132854-1-thomas@devoogdt.com>
References: <20240829131232.2132854-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LhN0KnPRWDBwhIG5+d2P6NpkBLfvOfEC0DrNExFStnY=; b=KvvaljH8WtKVbn+Pyz0i2D+wWK
 kCIWRLnqwu6FIG8+71+LKZsDbbt3+S4uNWAvNaOsvpokae5Zw53pjQyQL0LqvEXp4wUyDaXLGeV58
 ji/wcyTJY6MA/1miJ9CY6wHjl682nc80kZ5BCISji9xVHcE7DZ9vROA0eFW+BgRD3yxQL6aC1SLnN
 6M953M8YT87m2ZhRBE1qnNMIr0u6HIUVC5pT81wrOsiTRhJ5BOzRp5WVwvTcqKO+dsSKOgEVKbOXG
 a5SmRqKzdE2T7RdFypFRE+lhD/N5xHp13gHLcaI1c3XPIr9ZeOw/aKeAE+x0HcDCMUULkqcgjWTDF
 9c+a5nyw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=KvvaljH8
Subject: Re: [Buildroot] [PATCH v1] package/libsoup3: bump to 3.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1968716908319514977=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1968716908319514977==
Content-Type: multipart/signed; boundary="ySD2ZauUE7Ppz6kg"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--ySD2ZauUE7Ppz6kg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLAoKVGhhbmtzIGZvciB1cGRhdGluZyB0aGUgbGlic291cDMgdmVyc2lvbiwgcGF0
Y2ggTEdUTS4KCk9uIFRodSwgMjkgQXVnIDIwMjQgMTU6MTI6MjggKzAyMDAgVGhvbWFzIERldm9v
Z2R0IDx0aG9tYXNAZGV2b29nZHQuY29tPiB3cm90ZToKPiBGcm9tOiBUaG9tYXMgRGV2b29nZHQg
PHRob21hcy5kZXZvb2dkdEBiYXJjby5jb20+Cj4gCj4gTmV3czoKPiAgLSBodHRwczovL2Rvd25s
b2FkLmdub21lLm9yZy9zb3VyY2VzL2xpYnNvdXAvMy41L2xpYnNvdXAtMy41LjIubmV3cwo+ICAt
IGh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvbGlic291cC8zLjYvbGlic291cC0z
LjYuMC5uZXdzCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXMuZGV2
b29nZHRAYmFyY28uY29tPgoKQWNrZWQtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJl
ekBpZ2FsaWEuY29tPgoKPiAtLS0KPiAgcGFja2FnZS9saWJzb3VwMy9saWJzb3VwMy5oYXNoIHwg
NCArKy0tCj4gIHBhY2thZ2UvbGlic291cDMvbGlic291cDMubWsgICB8IDQgKystLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9saWJzb3VwMy9saWJzb3VwMy5oYXNoIGIvcGFja2FnZS9saWJzb3VwMy9s
aWJzb3VwMy5oYXNoCj4gaW5kZXggMTM5NzcxYTExZS4uMzdlY2QyZGI4NCAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2xpYnNvdXAzL2xpYnNvdXAzLmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYnNvdXAz
L2xpYnNvdXAzLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyBGcm9tIGh0dHBzOi8vZG93bmxv
YWQuZ25vbWUub3JnL3NvdXJjZXMvbGlic291cC8zLjUvbGlic291cC0zLjUuMS5zaGEyNTZzdW0K
PiAtc2hhMjU2ICBjMWQ3Y2ZiODk4MzJkMzVjMjcxZjM3ZDU0NGYyY2ZlMjFmYTYwYWU5ZmFhZDRh
N2FjNTg5OTZhZTQwMzFmN2JhICBsaWJzb3VwLTMuNS4xLnRhci54ego+ICsjIEZyb20gaHR0cHM6
Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9saWJzb3VwLzMuNi9saWJzb3VwLTMuNi4wLnNo
YTI1NnN1bQo+ICtzaGEyNTYgIDYyOTU5Zjc5MWU4ZTg0NDJmOGMxM2NlZGFjOGM0OTE5ZDc4Zjkx
MjBkNWJiNTMwMWJlNjdhNWU1MzMxOGI0YTMgIGxpYnNvdXAtMy42LjAudGFyLnh6Cj4gICMgTG9j
YWxseSBjYWxjdWxhdGVkCj4gIHNoYTI1NiAgYjc5OTMyMjUxMDRkOTBkZGQ4MDI0ZmQ4MzhmYWYz
MDBiZWE1ZTgzZDkxMjAzZWFiOThlMjk1MTJhY2ViZDY5YyAgQ09QWUlORwo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYnNvdXAzL2xpYnNvdXAzLm1rIGIvcGFja2FnZS9saWJzb3VwMy9saWJzb3Vw
My5tawo+IGluZGV4IGJjM2FlNGQwY2IuLmY4YTdlMjYxNTkgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9saWJzb3VwMy9saWJzb3VwMy5tawo+ICsrKyBiL3BhY2thZ2UvbGlic291cDMvbGlic291cDMu
bWsKPiBAQCAtNCw4ICs0LDggQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAK
PiAtTElCU09VUDNfVkVSU0lPTl9NQUpPUiA9IDMuNQo+IC1MSUJTT1VQM19WRVJTSU9OID0gJChM
SUJTT1VQM19WRVJTSU9OX01BSk9SKS4xCj4gK0xJQlNPVVAzX1ZFUlNJT05fTUFKT1IgPSAzLjYK
PiArTElCU09VUDNfVkVSU0lPTiA9ICQoTElCU09VUDNfVkVSU0lPTl9NQUpPUikuMAo+ICBMSUJT
T1VQM19TT1VSQ0UgPSBsaWJzb3VwLSQoTElCU09VUDNfVkVSU0lPTikudGFyLnh6Cj4gIExJQlNP
VVAzX1NJVEUgPSBodHRwczovL2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2VzL2xpYnNvdXAvJChM
SUJTT1VQM19WRVJTSU9OX01BSk9SKQo+ICBMSUJTT1VQM19MSUNFTlNFID0gTEdQTC0yLjArCj4g
LS0gCj4gMi40My4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKPiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--ySD2ZauUE7Ppz6kg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZtR26QAKCRCRxVnb5MkS
O3trAJ0Y/yiqtbBJvLwl5CF3sucTDm3LjQCfehSAswwP9j9bFO+IMPCIba8MqDI=
=b4GF
-----END PGP SIGNATURE-----

--ySD2ZauUE7Ppz6kg--

--===============1968716908319514977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1968716908319514977==--
