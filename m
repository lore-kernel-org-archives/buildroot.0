Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57944C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 13:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E152D42917;
	Wed, 12 Jan 2022 13:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OwU39wQ3aUFz; Wed, 12 Jan 2022 13:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2292342911;
	Wed, 12 Jan 2022 13:29:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F03971BF3DC
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 13:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD58840A3F
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 13:29:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GWAub4cyxGcf for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 13:29:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6EC040A28
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=evD56MGxbD8vWpbzoP62KnUR+YBAgUsOmy9OO92+VrQ=; b=BkIAq0UFg6duStTkfHkHXHbY6o
 Mt9RH+3VoqeVTr2wAvtygrJDKZg3dbT1fU1S93YEcRmvghN9f0dLITY0tKGJcVBDR6gPHjKT3PSZn
 ELwI1tNlnnIVw7Y9lsbSMvdnJGXWKQRdgwKvNK8UtKdkV9wptBx62NiCGqQiYCWc97ylunnTThvhT
 HbdnjmJoqN6ZL32nfd24au9dv/LWh+qe9EACagIewssPZOOqP8jPJq9rIt8vL1siJBoM1bMIEyJyj
 bK0r76ZhQ0hv5N7VB562NyPiOf/MSdI7HXJ3fX3RLQbuFHUj9sP3h+8bz0QFP9rRFjcNQo+1WgKn+
 eTGBPROw==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n7dhK-000AW2-QK; Wed, 12 Jan 2022 14:29:54 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 0a66b56c;
 Wed, 12 Jan 2022 13:29:44 +0000 (UTC)
Date: Wed, 12 Jan 2022 15:29:40 +0200
Message-ID: <20220112152940.GC1050037@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20220111170918.GV1477939@scaer>
References: <20220111145527.3422053-1-aperez@igalia.com>
 <20220111170918.GV1477939@scaer>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH RFC 1/1] package/wpewebkit: use ninja for
 faster builds
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6036904938905500580=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6036904938905500580==
Content-Type: multipart/signed; boundary="njeOdXVG7IFpc2EL"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--njeOdXVG7IFpc2EL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgWWFubiwgYWxsLAoKT24gVHVlLCAxMSBKYW4gMjAyMiAxODowOToxOCArMDEwMCAiWWFubiBF
LiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiBBZHJpYW4sIEFsbCwK
PiAKPiBPbiAyMDIyLTAxLTExIDE2OjU1ICswMjAwLCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIHNw
YWtlIHRodXNseToKPiA+IEluc3RydWN0IENNYWtlIHRvIHVzZSB0aGUgTmluamEgZ2VuZXJhdG9y
LCBhbmQgb3ZlcnJpZGUgYnVpbGQvaW5zdGFsbAo+ID4gY29tbWFuZHMgdG8gdXNlIE5pbmphIGlu
c3RlYWQsIHdoaWNoIHJlc3VsdHMgaW4gZmFzdGVyIGJ1aWxkcy4gVGhlCj4gPiBob3N0LW5pbmph
IHBhY2thZ2UgaXMgcmVxdWlyZWQgdG8gYnVpbGQgc29tZSBvZiB0aGUgZGVwZW5kZW5jaWVzIHVz
ZWQKPiA+IGJ5IHdwZXdlYmtpdCAoZS5nLiBsaWJlcG94eSkgc28gaW4gcHJhY3RpY2UgdGhpcyBp
cyBub3QgaW50cm9kdWNpbmcKPiA+IGEgbmV3IGhvc3QgZGVwZW5kZW5jeSB0aGF0IHdvdWxkIHNs
b3cgZG93biB0aGUgYnVpbGQuCj4gCj4gQXMgZGlzY3Vzc2VkIG9uIElSQywgd2UgY29uY2x1ZGVk
IHRoYXQgYSBiZXR0ZXIgb3B0aW9uIGlzIHRvIG1ha2UgdGhlCj4gY21ha2UtcGFja2FnZSBpbmZy
YXN0cnVjdHVyZSBpbiBCdWlsZHJvb3QgbmluamEtYXdhcmUsIGFuZCB0aGF0IHlvdSB3ZXJlCj4g
Z29pbmcgdG8gaGF2ZSBhIGxvb2sgYXQgaXQuIFRoYW5rcyEgOi0pCgpIZXJlIGdvZXM6IGh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTI4
MDcyMwoKPiBTbywgSSd2ZSBtYXJrZWQgdGhpcyBwYXRjaCBhcyByZWplY3RlZCBpbiBwYXRjaHdv
cmsuCgpHb29kLCBhcyBzYWlkIG9uIElSQywgSSBhbHNvIGFncmVlIGl0IHdvcnRoIGl0IHRvIHRh
a2UgdGhlIGxvbmcgcm91dGUgYW5kCnRyeSB0byBnZXQgYWxsIENNYWtlIHBhY2thZ2VzIChvciBt
b3N0LCBpZiBhbGwgaXMgbm90IHBvc3NpYmxlKSB3b3JraW5nCndpdGggTmluamEgOikKCkNoZWVy
cywK4oCUQWRyacOhbgo=

--njeOdXVG7IFpc2EL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYd7XxAAKCRCRxVnb5MkS
OxdnAJ9xxwnNC6UeIpY2Sk7burLACYyP8gCdHpcDzt6oEOsJm107LEtzGyJ1ySU=
=0+5l
-----END PGP SIGNATURE-----

--njeOdXVG7IFpc2EL--

--===============6036904938905500580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6036904938905500580==--
