Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9C8C47DB3
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 21:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDCDC614EC;
	Wed, 31 Jan 2024 21:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDCDC614EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SM1tdquFfUzL; Wed, 31 Jan 2024 21:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D8D614E4;
	Wed, 31 Jan 2024 21:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17D8D614E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AE6E1BF4DB
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 21:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 735F642033
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 21:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 735F642033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6UycBkjg8w8K for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 21:15:31 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E660A42015
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 21:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E660A42015
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rVHvb-00CGNr-AI; Wed, 31 Jan 2024 22:15:27 +0100
Received: from localhost (momiji.home [local])
 by momiji.home (OpenSMTPD) with ESMTPA id a57e448d;
 Wed, 31 Jan 2024 21:15:24 +0000 (UTC)
Date: Wed, 31 Jan 2024 23:15:19 +0200
Message-ID: <20240131231519.GB24603@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20240131204704.2099316-1-fontaine.fabrice@gmail.com>
References: <20240131204704.2099316-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vL4ko2xYJ59J+yMoxWae2Xfotyhyztrw4I7Wr7ChNFE=; b=rCnH0UFqpZmNjWgHSzOfDfINl/
 H57v4oAMR+5tSw+AdCOOX5F9XQs+BZ88rDVbP/IWjPNHuoa/9PxmtIT76n7ire13k6XGAVqPnnX42
 Cg6rQN3maBigSJ0Ihv86/49DeYVEQm9cuYuqBkHX5G7Acd63ilJmslsBhN1yQEDQWzmwuPF89Wxvb
 xY6clCMvtfbKpD6RDHydZcfzjlGzDp1Yx22bzzRXNplFxiwy/uy8wluw7ElzFLqKIpSiPNUxLtqUB
 rBcWIHlh44uWvFRd8vEveCMl93U/djIIPxI0FXvuF4y2NYFvYz/Yn7xuK8yDNJOLJhq1YsIjOisTF
 JPbm7WhA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=rCnH0UFq
Subject: Re: [Buildroot] [PATCH 1/1] package/libpsl: fix legal info
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8698635499185359260=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8698635499185359260==
Content-Type: multipart/signed; boundary="sbijIdmcb+SSjksd"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--sbijIdmcb+SSjksd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gV2VkLCAzMSBKYW4gMjAyNCAyMTo0NzowNCArMDEwMCBGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cj4gQ29tbWl0IDg2MzEzMWNhZDlmZWMwYTU0
YTRiNDI4MWY1ZmEzY2Q1ZWQ4ZWE0NjIgZm9yZ290IHRvIHVwZGF0ZSBoYXNoIG9mCj4gQ09QWUlO
RyAodXBkYXRlIGluIHllYXIgd2l0aDoKPiBodHRwczovL2dpdGh1Yi5jb20vcm9ja2RhYm9vdC9s
aWJwc2wvY29tbWl0LzgwYzE3Y2MyMzc4NjEzMThhNjgwYWUxNzA5OTVkNDRhMTEwMjlkYWQpCj4g
Cj4gRml4ZXM6Cj4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMmIw
OWNhODhhMDhmZGJhOGNhNzUxNTM2ODhlZDVkZDkzNjJjNzUyMAoKQWhoaCwgZ29vZCBjYXRjaCwg
dGhhbmtzIQoKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJy
aWNlQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVy
ZXpAaWdhbGlhLmNvbT4KCj4gLS0tCj4gIHBhY2thZ2UvbGlicHNsL2xpYnBzbC5oYXNoIHwgMiAr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJwc2wvbGlicHNsLmhhc2ggYi9wYWNrYWdlL2xpYnBzbC9s
aWJwc2wuaGFzaAo+IGluZGV4IGQ4MDBiYTZhNzcuLmNhZjc2MGM0OTYgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9saWJwc2wvbGlicHNsLmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYnBzbC9saWJwc2wu
aGFzaAo+IEBAIC0yLDUgKzIsNSBAQAo+ICBzaGEyNTYgIDFkY2M5Y2VhZThiMTI4ZjNjMGIzZjY1
NGRlY2QwZTFlODkxYWZjNmZmODEwOThmMjI3ZWYyNjA0NDlkYWUyMDggIGxpYnBzbC0wLjIxLjUu
dGFyLmd6Cj4gIAo+ICAjIEhhc2hlcyBmb3IgbGljZW5zZSBmaWxlczoKPiAtc2hhMjU2ICA3NzZj
ZDExZDU0ZjBlYTNlNWVmZGQyNWZmMWEwZDk1MmExNzQ0MjE1YmI1ODU4ZWE3YWViOTE4MDhlNzBj
OWY3ICBDT1BZSU5HCj4gK3NoYTI1NiAgMzIyMzkyZTYwMDFiMmIzYjBmY2E3MDVkYzlmMTFmMjZl
MTI0NDExODhlY2RlNTBlYjFkMjI5MDk5ODBiMjkyNSAgQ09QWUlORwo+ICBzaGEyNTYgIDFkN2Y1
Mjc0N2E5MTY5NzUxY2RmMjY0MWE4Mjk5YzAwOThlOWVjZGY5NDI5Mjk2ZmZkNTViZGIxNGM5ZWQ1
YjMgIHNyYy9MSUNFTlNFLmNocm9taXVtCj4gLS0gCj4gMi40My4wCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--sbijIdmcb+SSjksd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZbq4ZwAKCRCRxVnb5MkS
O7qGAJ4p1ndMl0K7PyJ0b4ZeXfoUXCgq6wCeNFbVnkXUeWWdIaxBKE6DqgldWyk=
=bWjs
-----END PGP SIGNATURE-----

--sbijIdmcb+SSjksd--

--===============8698635499185359260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8698635499185359260==--
