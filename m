Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1D9E9A04D
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 23:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 938DE60893;
	Wed, 18 Feb 2026 23:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lECZoujq0nFl; Wed, 18 Feb 2026 23:12:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8362B60B2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771456379;
	bh=zkJTItpbtiQXNvSrYyj7rSXbVdbjQkwZQBdawM3bB3k=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hkcNJk0yj31y0ylnuDx7s3dC0zyJOjYDA8qxQPkaNEBIjTx2npJkiD45DRStydVE1
	 0jJc2my0oHdhtPGYfI2A28AeBHNquwkEE9unK5X03KDD3g63B97dM25k+5ig+ReORd
	 K9vTckQOHdC+hooNZaY3FQ+wG3JKo5HtPQk1DzYLUv96mbtKq8labz3aBhnPS3a3he
	 goz7+6GmxmKE+mwdeRU9BELdV3NYj850oO5koabeTD4xR6kzIbke5LVkCyTAehb+ZY
	 apwkNB10ij+krK7mTQIRSKVzggepfJZgryByaTRVNYrQMAdthM1v+818bu8l9dPDmd
	 yOCapLtBOc1ZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8362B60B2E;
	Wed, 18 Feb 2026 23:12:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 877FD183
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 23:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78C78408F1
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 23:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INlECA9SFFK1 for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 23:12:57 +0000 (UTC)
X-Greylist: delayed 1949 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 18 Feb 2026 23:12:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 14E1A404C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14E1A404C0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14E1A404C0
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 23:12:54 +0000 (UTC)
Received: from 81-197-150-176.elisa-laajakaista.fi ([81.197.150.176]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vsqHg-002FPi-S9; Wed, 18 Feb 2026 23:44:40 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id c7002654;
 Wed, 18 Feb 2026 22:44:40 +0000 (UTC)
Date: Thu, 19 Feb 2026 00:44:40 +0200
Message-ID: <20260219004440.GB317369@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>
In-Reply-To: <87ldhb1cwq.fsf@dell.be.48ers.dk>
References: <20251017131035.224739-1-aperez@igalia.com>
 <cc93ebe7f1b702a71c48e410766eaf54@free.fr> <87ldhb1cwq.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nEMBhb6rlAj5/dxnODA64YHix3U32liui4HUYVjEQaE=; b=mVtM6QLSmds6Bkz/HQu2xsIxcQ
 IXVgb34r5tj910Ny7XcEeArhTMBmH+Kw8Q6iI1HSo+JJyS/dQoAtg78IfwHoJuk/hT5x2yzhwMga7
 Wq+6R1DUJtvLs0NNEUfzR4f/5o3gMgxkkM8MeXtxEViKyem49z30V7cKNOIoG+jbnPpShADeJxtI9
 7N1rHjz4ZNpCVQm4DUAVVDKd7iX33MiR+e9uceaMMiCBiDyF8GKRqUKWuZlL8+EI+kue/UWfMhXiW
 xQbsd8zOXAyR+/fvO94msBppbdbt1y3WTRvz4oTnQmLAUwi0N93Ly5q4SKgGgcIozsTYlRpIgG/q1
 d0+fY8Zw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=mVtM6QLS
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: security bump to version
 2.50.1
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
Content-Type: multipart/mixed; boundary="===============0709189889575443471=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0709189889575443471==
Content-Type: multipart/signed; boundary="/oMhjNCf4QKGdBSf"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--/oMhjNCf4QKGdBSf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAwMiBGZWIgMjAyNiAxNDo0MDo1MyArMDEwMCBQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+IHdyb3RlOgo+ID4+Pj4+ICJKdWxpZW4iID09IEp1bGllbiBPbGl2YWlu
IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6Cj4gCj4gSGkg
QWRyaWFuLAo+IAo+ICA+IEkgbmFpdmVseSB0cmllZCB0byBjb21waWxlIHRoZSBwYWNrYWdlIHdp
dGggdGhpcyBwYXRjaCBvbiB0b3Agb2YgdGhlCj4gID4gbWFzdGVyIGJyYW5jaCBhdCBjb21taXQg
NzA5NWUxMjBhMiB3aXRoIHRoZSBmb2xsb3dpbmcgY29tbWFuZHM6Cj4gCj4gID4gICAgIGNhdCA+
LmNvbmZpZyA8PEVPRgo+ICA+ICAgICBCUjJfYWFyY2g2ND15Cj4gID4gICAgIEJSMl9UT09MQ0hB
SU5fRVhURVJOQUw9eQo+ICA+ICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU49eQo+
ICA+ICAgICBCUjJfUEFDS0FHRV9NRVNBM0Q9eQo+ICA+ICAgICBCUjJfUEFDS0FHRV9NRVNBM0Rf
R0FMTElVTV9EUklWRVJfU09GVFBJUEU9eQo+ICA+ICAgICBCUjJfUEFDS0FHRV9NRVNBM0RfT1BF
TkdMX0VHTD15Cj4gID4gICAgIEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRVM9eQo+ICA+ICAg
ICBCUjJfUEFDS0FHRV9XUEVXRUJLSVQ9eQo+ICA+ICAgICBCUjJfUEFDS0FHRV9XUEVXRUJLSVRf
U0FOREJPWD15Cj4gID4gICAgIEJSMl9QQUNLQUdFX1dQRVdFQktJVF9NVUxUSU1FRElBPXkKPiAg
PiAgICAgQlIyX1BBQ0tBR0VfV1BFV0VCS0lUX01FRElBX1NUUkVBTT15Cj4gID4gICAgIEJSMl9Q
QUNLQUdFX1dQRVdFQktJVF9XRUJEUklWRVI9eQo+ICA+ICAgICBFT0YKPiAgPiAgICAgbWFrZSBv
bGRkZWZjb25maWcKPiAgPiAgICAgbWFrZSB3cGV3ZWJraXQKPiAKPiAgPiBBbmQgaXQgZmFpbGVk
IGF0IGNvbmZpZ3VyZSB0aW1lLCBjb21wbGFpbmluZyBhYm91dCBtaXNzaW5nCj4gID4gZnJlZXR5
cGUgKHRoZW4gZm9udGNvbmZpZykgbGlicmFyaWVzLCB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3I6
Cj4gCj4gID4gQ291bGQgTk9UIGZpbmQgRnJlZXR5cGUgKG1pc3Npbmc6IEZSRUVUWVBFX0xJQlJB
UlkKPiAgPiBGUkVFVFlQRV9JTkNMVURFX0RJUlMpCj4gID4gKFJlcXVpcmVkIGlzIGF0IGxlYXN0
IHZlcnNpb24gIjIuOS4wIikKPiAKPiAgPiBJIGFsc28gdHJpZWQgd2l0aCBCUjJfUEFDS0FHRV9X
UEVXRUJLSVQ9eSBvbmx5ICh3aXRob3V0IHRoZQo+ICA+IHN1Yi1vcHRpb25zKSBhbmQgaXQgZmFp
bHMgdGhlIHNhbWUgd2F5LiBJIGRvbid0IHRoaW5rIHRoZSBpc3N1ZQo+ICA+IGlzIGludHJvZHVj
ZWQgYnkgdGhpcyBwYXRjaCwgYXMgSSBzZWUgdGhlIHNhbWUgaXNzdWUgd2l0aG91dCB0aGlzCj4g
ID4gcGF0Y2guCgpGaXhlZCBieSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
YnVpbGRyb290L3BhdGNoLzIwMjYwMjE4MTk1ODEyLjI5ODMyMDctMS1iZXJuZEBrdWhscy5uZXQv
CiAKPiAgPiBJIHdhcyBub3QgYWJsZSB0byBjb21waWxlIHRoZSBwYWNrYWdlIHdpdGhvdXQgbWFu
dWFsIG1vZGlmaWNhdGlvbnMuCj4gCj4gID4gQ291bGQgeW91IGhhdmUgYSBsb29rIGlmIHlvdSBj
YW4gZml4IHRoaXMgaXNzdWUsIHBsZWFzZT8KPiAKPiBDb3VsZCB5b3UgcGxlYXNlIGhhdmUgYSBs
b29rIGF0IHRoaXMgQWRyaWFuPyBIYXZpbmcgYSB3cGV3ZWJraXQgcGFja2FnZQo+IHdpdGgga25v
d24gc2VjdXJpdHkgaXNzdWVzIHNpbmNlIE9jdG9iZXIgaXMgbm90IGdyZWF0IDooCgpCZXJuZCBo
YXMgYWxzbyBzdWJtaXR0ZWQgYW4gdXBkYXRlIHRvIDIuNTAuNSAodGhlIGN1cnJlbnQgbGF0ZXN0
IHN0YWJsZQpyZWxlYXNlKSBpbiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
YnVpbGRyb290L3BhdGNoLzIwMjYwMjE4MTk1ODEyLjI5ODMyMDctMi1iZXJuZEBrdWhscy5uZXQv
CgpJJ3ZlIGFja2VkIGJvdGggcGF0Y2hlcy4KCkNoZWVycywK4oCUQWRyacOhbgo=

--/oMhjNCf4QKGdBSf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaZZA2AAKCRCRxVnb5MkS
O6SAAJ9B4uEEZOjGLoVZ3mRLF8+ko5vECgCfZ0i4r0tdTF77anrZH1fWmLouBhY=
=k6O2
-----END PGP SIGNATURE-----

--/oMhjNCf4QKGdBSf--

--===============0709189889575443471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0709189889575443471==--
