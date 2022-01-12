Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC3CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 16:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4AAD60AD8;
	Wed, 12 Jan 2022 16:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ONY-5LykO2oK; Wed, 12 Jan 2022 16:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 037F260AD4;
	Wed, 12 Jan 2022 16:51:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7E061BF4E3
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 16:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9612683E8B
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 16:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eY0GT7ZqFKTW for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 16:51:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC62683E10
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 16:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AxSpzQ1S374aiDzZz4JpITvBAI3aQrO1g6W/Q+xKwMs=; b=PC3kJqRoc80vCPSWF9VeFnXgcE
 cGqFr7FCXPecrct2mL+vyBMzywdSPsVh08LtzdZQ6Nh6LSec3WQJi6Qs/6BFwLs7cjHSGGkYfdTti
 RTZxBv3rvaGod50zqTRltIuM2OFUvxQ7AaaHylR34WI9pbIVxzD8oxLYnhK2vtOU98rnD+2dL2B7W
 DxAf2CSzyUKiiHzACaMagIXZ/7xzVTUahIQnlB2W4jcfiEOHQ0UivUS8N2kc91L6YAvypOv7kO8K0
 PdJ5hdFi+i9GdMLXPrbqwBtBHRRn7uMwYH/cyOlXVLJsdmDP4SIsLYblVX2m/7BPJKXKHk/te86/W
 LOMAoUFw==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n7gqp-0002kr-Rr; Wed, 12 Jan 2022 17:51:56 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 86f6da54;
 Wed, 12 Jan 2022 16:51:43 +0000 (UTC)
Date: Wed, 12 Jan 2022 18:51:43 +0200
Message-ID: <20220112185143.GE23006@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220112153516.239321c8@windsurf>
References: <20220112132618.2634250-1-aperez@igalia.com>
 <20220112132618.2634250-3-aperez@igalia.com>
 <20220112153516.239321c8@windsurf>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH RFC 2/2] package/pkg-cmake.mk: use ninja
 instead of make
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============9151656976275866290=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============9151656976275866290==
Content-Type: multipart/signed; boundary="WzymZi+5wDRR6KcM"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--WzymZi+5wDRR6KcM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpPbiBXZWQsIDEyIEphbiAyMDIyIDE1OjM1OjE2ICswMTAwIFRob21hcyBQZXRhenpvbmkg
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgogCj4gT24gV2VkLCAxMiBKYW4g
MjAyMiAxNToyNjoxOCArMDIwMAo+IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2Fs
aWEuY29tPiB3cm90ZToKPiAKPiA+IFN3aXRjaCB0byBuaW5qYSBhcyB0aGUgYnVpbGQgdG9vbCBm
b3IgdGhlIENNYWtlIHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUuCj4gPiBOb3RlIHRoYXQgdGhlIGNo
YW5nZXMgbWFrZSBwYWNrYWdlcyB3aGljaCB1c2UgW2hvc3QtXWNtYWtlLXBhY2thZ2UKPiA+IGRl
cGVuZCBvbiBob3N0LW5pbmphLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUGVyZXog
ZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvcGtnLWNt
YWtlLm1rIHwgMjQgKysrKysrKysrKysrKystLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9wa2ctY21ha2UubWsgYi9wYWNrYWdlL3BrZy1jbWFrZS5tawo+ID4gaW5kZXggM2Ix
ZGIzNWZiNi4uNjVmMDA1YTkxNCAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvcGtnLWNtYWtlLm1r
Cj4gPiArKysgYi9wYWNrYWdlL3BrZy1jbWFrZS5tawo+ID4gQEAgLTUxLDExICs1MSw2IEBAIGVu
ZGlmCj4gPiAgCj4gPiAgZGVmaW5lIGlubmVyLWNtYWtlLXBhY2thZ2UKPiA+ICAKPiA+IC0kKDIp
X01BS0UJCQk/PSAkJChNQUtFKQo+ID4gLSQoMilfSU5TVEFMTF9PUFRTCQk/PSBpbnN0YWxsCj4g
PiAtJCgyKV9JTlNUQUxMX1NUQUdJTkdfT1BUUwk/PSBERVNURElSPSQkKFNUQUdJTkdfRElSKSBp
bnN0YWxsL2Zhc3QKPiA+IC0kKDIpX0lOU1RBTExfVEFSR0VUX09QVFMJPz0gREVTVERJUj0kJChU
QVJHRVRfRElSKSBpbnN0YWxsL2Zhc3QKPiAKPiBUaGlzIG1lYW5zIGFuIGF1ZGl0IG9mIGFsbCBj
bWFrZS1wYWNrYWdlIHBhY2thZ2VzIG5lZWQgdG8gYmUgZG9uZSB0bwo+IHNlZSBpZiBhbnkgb2Yg
dGhvc2UgdmFyaWFibGVzIGlzIHVzZWQuCgpJIHdpbGwgYmUgZ29pbmcgdGhyb3VnaCB0aGUgcGFj
a2FnZXMgaW4gdGhlIG5leHQgZGF5cywgZm9yIG5vdyBhIGNvdXBsZQpvZiBub3RlcyBvbiB0aGUg
b25lcyB5b3UgbWVudGlvbmVkIGFscmVhZHksIGJlbG93LgoKPiBJIGNvdWxkIHNwb3Q6Cj4gCj4g
TVVTRVBBQ0tfTUFLRSA9ICQoTUFLRTEpCgpJIGZpeGVkIHRoaXMgbG9jYWxseSB1c2luZzoKCiAg
TVVTRVBBQ0tfTklOSkFfT1BUUyA9IC1qMQoKU2FkbHksIHN3aXRjaGluZyB0byBOaW5qYSBkb2Vz
IG5vdCBmaXggcGFyYWxsZWwgYnVpbGRzIGZvciB0aGlzIHBhY2thZ2UuCgo+IEJ1dCBhbHNvOgo+
IAo+IEhPU1RfTUFSSUFEQl9NQUtFX09QVFMgPSBpbXBvcnRfZXhlY3V0YWJsZXMKClJlcGxhY2lu
ZyB3aXRoIHRoZSBmb2xsb3dpbmcgd29ya3MsIGJlY2F1c2UgdGhlIENNYWtlIE5pbmphIGdlbmVy
YXRvciBhbHNvCnByb2R1Y2VzIHRvcC1sZXZlbCBwaG9ueSB0YXJnZXRzOgoKICBIT1NUX01BUklB
REJfTklOSkFfT1BUUyA9IGltcG9ydF9leGVjdXRhYmxlcwoKQm90aCB0aGVzZSB0d2Vha3MgKGFu
ZCBsaWtlbHkgYSBidW5jaCBtb3JlKSB3aWxsIGJlIHBhcnQgb2YgdjIgb2YgdGhlIHBhdGNoCnNl
dCA6KQogCkNoZWVycywK4oCUQWRyacOhbgo=

--WzymZi+5wDRR6KcM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYd8HHwAKCRCRxVnb5MkS
Ow5FAJ4sZXtvIcNnHqKqz/B8HsrYA5S7jgCfZTltRu6maMEDetkFwPIlpa+GGiU=
=lzEl
-----END PGP SIGNATURE-----

--WzymZi+5wDRR6KcM--

--===============9151656976275866290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9151656976275866290==--
