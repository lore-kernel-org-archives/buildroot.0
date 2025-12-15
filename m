Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A8AD5B87A
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 23:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F60380E36;
	Mon, 15 Dec 2025 23:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zagS_FpXAQZF; Mon, 15 Dec 2025 23:46:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4384281947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765842376;
	bh=Hchu+6m84doiNK28JKsxjkKQYYwMXnqNZMD6kQKHasU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I7OldkC/9oEo76eIPYHDZfTnxc90ClV5dS4deqTfHBf/Q4UT2pwKjP2AgAMwViMZa
	 M1x/i0ndOKoY3lliQOOBWO7W8P7QQz5TOG7rd6fR45dW07xXBL/ULnbKTe578zF7nk
	 hl4D3fAQJR/99Vh1Eo1eRELAJbMindoitdp9hchhWKk+c/OiLs21zSulTRAgfa5Bev
	 oBkT1Eq5I9i/N4uiRgdO1ipW7uoQGdq2BWA6vRU3AoHeB4HNzrYigETbi9H9vBxeBt
	 pJJo9DXpN4NTqRXh6uAkBn78kNivxoI39FE6pGaIyyCmTGyJVXVtC71DTXRnoJmf7F
	 ppZMcUYQBtUsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4384281947;
	Mon, 15 Dec 2025 23:46:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7CA9117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 23:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD4F460F2C
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 23:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IVMbx6jNk_j for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 23:46:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B82860E52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B82860E52
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B82860E52
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 23:46:13 +0000 (UTC)
Received: from 81-197-150-176.elisa-laajakaista.fi ([81.197.150.176]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vVIGZ-00DAAG-8R; Tue, 16 Dec 2025 00:46:11 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 917368eb;
 Mon, 15 Dec 2025 23:46:10 +0000 (UTC)
Date: Tue, 16 Dec 2025 01:46:10 +0200
Message-ID: <20251216014610.GD378927@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20251215225837.1257574-2-thomas.petazzoni@bootlin.com>
References: <20251215225837.1257574-1-thomas.petazzoni@bootlin.com>
 <20251215225837.1257574-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kFW2+S0TZcb5jd60onfyT22p0779zi4VEZlTGmP2EL0=; b=GpnlsoosBVjFDuO5mNcw7wyRnA
 oYnCIIEWxEQPC/Ij2nEmpYrMbYT2KOXWNcuETO7MNLwLoO5oooE0DOWYrHordIG2ZWtzZDENoR8Gd
 YewOLviwLhmtnADyhCZeCVA2+s7gDAtSKgQN/v2cqPyfL6dQhsw63eZTZ3lDfxgsjnhYoN5ve/+vg
 sRbcWN/izgADx5RjxKLHpF2L27Tr19N++zqJCV3xtTD53lJI7NFPuqC1cmxnDfeb5BWUbTqcdT6AU
 q2LVoGnviQYO9tw4f78YtjWlaF8e0uAxXlLOS6JNveHa3aBaVGZjl7xYy83oTLRjMJnYLuI8tXqqR
 npvwB9yQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Gpnlsoos
Subject: Re: [Buildroot] [PATCH 2/2] package/sway: properly propagate
 wlroots dependencies
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
Content-Type: multipart/mixed; boundary="===============2566390847899637284=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2566390847899637284==
Content-Type: multipart/signed; boundary="34BLUYw01Of7rMqB"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--34BLUYw01Of7rMqB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAxNSBEZWMgMjAyNSAyMzo1ODozNiArMDEwMCBUaG9tYXMgUGV0YXp6b25pIHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPiBDb21taXQgMDBmYjNh
NTdjYmFlZGI4ZGY0M2Y3NWYwZTg5MTQyM2MxZWY3ZDhjNiBhZGRlZCBhIHdscm9vdHMgLT4KPiBs
aWJnYm0gZGVwZW5kZW5jeSwgYnV0IGZvcmdvdCB0byBwcm9wYWdhdGUgaXQgdG8gcGFja2FnZS9z
d2F5Lgo+IAo+IENjOiBSYXBoYWVsIFBhdmxpZGlzIDxyYXBoYWVsLnBhdmxpZGlzQGdtYWlsLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJv
b3RsaW4uY29tPgoKUmV2aWV3ZWQtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBp
Z2FsaWEuY29tPgoKPiAtLS0KPiAgcGFja2FnZS9zd2F5L0NvbmZpZy5pbiB8IDYgKysrKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2Uvc3dheS9Db25maWcuaW4gYi9wYWNrYWdlL3N3YXkvQ29uZmlnLmlu
Cj4gaW5kZXggMWY0YjQ5N2FmMy4uMWU0YzhiZmQzZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N3
YXkvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9zd2F5L0NvbmZpZy5pbgo+IEBAIC01LDYgKzUs
NyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfU1dBWQo+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlO
X0hBU19USFJFQURTICMgcGFuZ28sIHdscm9vdHMKPiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0Vf
SEFTX0xJQkVHTCAjIHdscm9vdHMKPiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX0xJQkdM
RVMgIyB3bHJvb3RzCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19MSUJHQk0gIyB3bHJv
b3RzCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19VREVWICMgd2xyb290cwo+ICAJZGVw
ZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19TWU5DXzQgIyBqc29uLWMsIHBhbmdvCj4gIAlkZXBl
bmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBwYW5nbwo+IEBAIC01MywxMSArNTQsMTIgQEAgY29uZmln
IEJSMl9QQUNLQUdFX1NXQVlfU1dBWU5BRwo+ICAKPiAgZW5kaWYgIyBCUjJfUEFDS0FHRV9TV0FZ
Cj4gIAo+IC1jb21tZW50ICJzd2F5IG5lZWRzIHN5c3RlbWQsIHVkZXYsIEVHTCBhbmQgT3BlbkdM
IEVTIHN1cHBvcnQiCj4gK2NvbW1lbnQgInN3YXkgbmVlZHMgc3lzdGVtZCwgdWRldiwgRUdMLCBP
cGVuR0wgRVMgYW5kIEdCTSBzdXBwb3J0Igo+ICAJZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfU1lT
VEVNRCB8fCBcCj4gIAkJIUJSMl9QQUNLQUdFX0hBU19VREVWIHx8IFwKPiAgCQkhQlIyX1BBQ0tB
R0VfSEFTX0xJQkVHTCB8fCBcCj4gLQkJIUJSMl9QQUNLQUdFX0hBU19MSUJHTEVTCj4gKwkJIUJS
Ml9QQUNLQUdFX0hBU19MSUJHTEVTIHx8IFwKPiArCQkhQlIyX1BBQ0tBR0VfSEFTX0xJQkdCTQo+
ICAKPiAgY29tbWVudCAic3dheSBuZWVkcyBhIHRvb2xjaGFpbiB3LyB3Y2hhciwgdGhyZWFkcywg
QysrLCBkeW5hbWljIGxpYnJhcnksIGdjYyA+PSA0LjkiCj4gIAlkZXBlbmRzIG9uIEJSMl9VU0Vf
TU1VCj4gLS0gCj4gMi41Mi4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKPiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--34BLUYw01Of7rMqB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaUCdwgAKCRCRxVnb5MkS
O9JDAJ9oUEZqZj/K4+BRL/Ozy5m9EppPkACfaZnTdBKAz4zZM+pJBOp4ut9kh1M=
=G/Wj
-----END PGP SIGNATURE-----

--34BLUYw01Of7rMqB--

--===============2566390847899637284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2566390847899637284==--
