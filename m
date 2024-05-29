Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D3DC25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 14:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 658B540980;
	Wed, 29 May 2024 14:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLEE0LdQOKsp; Wed, 29 May 2024 14:32:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FCBF40928
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FCBF40928;
	Wed, 29 May 2024 14:32:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 681E71D36AF
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 14:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 609FB40928
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 14:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgK9BtIbVWCi for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 14:32:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8AEBB40918
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AEBB40918
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AEBB40918
 for <buildroot@buildroot.org>; Wed, 29 May 2024 14:32:06 +0000 (UTC)
Received: from 202.225.26.77.dynamic.reverse-mundo-r.com ([77.26.225.202]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sCKLR-00DzdT-Hy; Wed, 29 May 2024 16:32:01 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 4a7ae36d;
 Wed, 29 May 2024 14:32:00 +0000 (UTC)
Date: Wed, 29 May 2024 16:31:55 +0200
Message-ID: <20240529163155.GB375910@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87ttihrvm6.fsf@dell.be.48ers.dk>
References: <20240522091608.3659847-1-aperez@igalia.com>
 <20240522091608.3659847-3-aperez@igalia.com> <87ttihrvm6.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tw5AX6VrVQe97nFCluDRmSV1jtDaoHPdPcz+U4rmf8Y=; b=LxoQrKLUzGjV3OSmMH9jeBRW/g
 nqkfNKsSeaw9mGzT0zY4Ly5VGX/j2qGogNfcmEtSAsy8VlUJuuDGOwj7/oNOiLM8IIWtJcQrGbTaE
 84D2n+izQlIPKNejEV8zNDfBYT1JCdTGOSu/ooVlH1c5Yiab8h8iFPMajunPVDef/Ejzkd0wkeBgN
 VhnyL4Dz1S5kUnpw/TUqsg7SFwwpkalZWE8VjIDitMbCoCxzfRWcNUJCXAgo9rAGmtaLZBn5kUmWo
 8RZTqxycPTXZlrxTa2wTbrPUlYAM+bJRb10wz9UpNOFhExeGsqxDOqiyPFIDIPAde/91EzbzhG9me
 c/wytxIg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=LxoQrKLU
Subject: Re: [Buildroot] [PATCH 2/4] package/wpewebkit: security bump to
 version 2.44.2
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1342470780648490831=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1342470780648490831==
Content-Type: multipart/signed; boundary="hN7CaNN7z/2Obhqg"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--hN7CaNN7z/2Obhqg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgUGV0ZXIsIGFsbCwKCk9uIFdlZCwgMjkgTWF5IDIwMjQgMDg6MTY6MTcgKzAyMDAgUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPiA+Pj4+PiAiQWRyaWFuIiA9
PSBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JpdGVzOgo+IAo+
ICA+IFVwZGF0ZSB0byB0aGUgbW9zdCByZWNlbnQgc3RhYmxlIHJlbGVhc2Ugb2YgV1BFIFdlYktp
dC4gQXMgdGhpcyBpcyBhCj4gID4gY2hhbmdlIHRvIGEgbmV3ZXIgcmVsZWFzZSBzZXJpZXMsIHRo
ZXJlIGFyZSBhIGZldyBjaGFuZ2VzIGluIHRoZSBDTWFrZQo+ICA+IGJ1aWxkIG9wdGlvbnMuIERl
cGVuZGVuY2llcyBtb3N0bHkgcmVtYWluIHRoZSBzYW1lLiBUaGUgbWFpbiBjaGFuZ2VzCj4gID4g
YXJlOgo+IAo+ICA+ICAtIFRoZSBuZXcgRU5BQkxFX1dFQl9DT0RFQ1Mgb3B0aW9uIGlzIHNldCBh
bG9uZyB3aXRoIEVOQUJMRV9WSURFTyBhbmQKPiAgPiAgICBFTkFCTEVfV0VCX1JUQyBkZXBlbmRp
bmcgb24gQlIyX1BBQ0tBR0VfV1BFV0VCS0lUX01VTFRJTUVESUEuCj4gID4gIC0gVGhlIG5ldyBV
U0VfTElCQkFDS1RSQUNFIG9wdGlvbiBpcyBzZXQgYWNjb3JkaW5nbHksIGRlcGVuZGluZyBvbgo+
ICA+ICAgIEJSMl9QQUNLQUdFX0xJQkJBQ0tUUkFDRS4KPiAgPiAgLSBXZWJBc3NlbWJseSBkb2Vz
IG5vdCB3b3JrIHdpdGggRU5BQkxFX0NfTE9PUCwgc28gaXQgbmVlZHMgdG8gYmUKPiAgPiAgICBk
aXNhYmxlZCBhbG9uZ3NpZGUgaXQgZm9yIE1JUFNyNiwgQVJNdjUgYW5kIEFSTXY2OyBub3QgdGhh
dCBidWlsZGluZwo+ICA+ICAgIFdlYkFzc2VtYmx5IHN1cHBvcnQgaXMgZW5hYmxlZCBieSBkZWZh
dWx0Lgo+ICA+ICAtIEVOQUJMRV9BQ0NFU1NJQklMSVRZIGhhcyBiZWVuIHJlbW92ZWQsIGluc3Rl
YWQgdGhlIG5ldyBVU0VfQVRLIG9wdGlvbgo+ICA+ICAgIGNhbiBiZSB1c2VkIHRvIHRoZSBzYW1l
IGVmZmVjdC4KPiAgPiAgLSBKUEVHMjAwMCBpcyBubyBsb25nZXIgc3VwcG9ydGVkLCB0aGUgb3Bl
bmpwZWcgZGVwZW5kZW5jeSBpcyByZW1vdmVkLgo+IAo+ICA+IFJlbGVhc2Ugbm90ZXMgYW5kIGFu
bm91bmNlbWVudDoKPiAKPiAgPiAgIC0gaHR0cHM6Ly93cGV3ZWJraXQub3JnL2Jsb2cvMjAyNC13
cGV3ZWJraXQtMi40NC5odG1sCj4gCj4gID4gICAtIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxl
YXNlL3dwZXdlYmtpdC0yLjQ0LjAuaHRtbAo+ICA+ICAgLSBodHRwczovL3dwZXdlYmtpdC5vcmcv
cmVsZWFzZS93cGV3ZWJraXQtMi40NC4xLmh0bWwKPiAgPiAgIC0gaHR0cHM6Ly93cGV3ZWJraXQu
b3JnL3JlbGVhc2Uvd3Bld2Via2l0LTIuNDQuMi5odG1sCj4gCj4gID4gUmVsZXZhbnQgc2VjdXJp
dHkgYWR2aXNvcmllczoKPiAKPiAgPiAgIC0gaHR0cHM6Ly93cGV3ZWJraXQub3JnL3NlY3VyaXR5
L1dTQS0yMDI0LTAwMDIuaHRtbAo+ICA+ICAgLSBodHRwczovL3dwZXdlYmtpdC5vcmcvc2VjdXJp
dHkvV1NBLTIwMjQtMDAwMy5odG1sCj4gCj4gID4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBlcmV6
IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cj4gIAo+ICA+ICBXUEVXRUJLSVRfU0lURSA9
IGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlcwo+ICA+IC1XUEVXRUJLSVRfU09VUkNFID0g
d3Bld2Via2l0LSQoV1BFV0VCS0lUX1ZFUlNJT04pLnRhci54ego+ICA+ICtXUEVXRUJLSVRfU09V
UkNFID0gd3Bld2Via2l0LSQoV1BFV0VCS0lUX1ZFUlNJT04pLnRhci5sego+IAo+IEkga25vdyBv
ZiB0aGUgeHogYmFja2Rvb3IgaXNzdWUsIGJ1dCB3ZSB1c2UgLnh6IGluIGEgTE9UIG9mIHBhY2th
Z2VzIGFuZAo+IHVwc3RyZWFtIHByb3ZpZGVzIC50YXIueHosIHNvIEkgcHJlZmVyIHRvIHVzZSB0
aGF0IGhlcmUgYXMgd2VsbCB0byBub3QKPiBoYXZlIHRvIHB1bGwgaW4gaG9zdC1semlwLgoKWWVz
LCBJJ3ZlIGJlZW4gZm9sbG93aW5nIHRoZSBkaXNjdXNzaW9uLCBhbmQgaG93IEJ1aWxkcm9vdCB3
YXNuJ3QKYWZmZWN0ZWQgZHVlIHRvIGJlaW5nIHNvbWV3aGF0IHNsb3cgcGlja2luZyB1cGRhdGVz
ID0pCgpHb29kIHRvIGtub3cgdGhhdCB5b3UgcHJlZmVyIHRvIGtlZXAgdXNpbmcgLnh6IHBhY2th
Z2VzLCBJIGhhdmUganVzdApzdWJtaXR0ZWQgYSB2ZXJzaW9uIGJ1bXAgdG8gQ29nIGFuZCBrZXB0
IHVzaW5nIC54eiBhcyB3ZWxsIHRoZXJlLgoKPiBDb21taXR0ZWQgd2l0aCB0aGF0IGNoYW5nZWQs
IHRoYW5rcy4KClRoYW5rIHlvdSEKCkNoZWVycywK4oCUQWRyacOhbgo=

--hN7CaNN7z/2Obhqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZlc8WwAKCRCRxVnb5MkS
Owj3AJ9ZBoWJ7I5lJShj2grKkfFS6oVU1QCeP4T0kWP3v45DyPbvV7ozMc1XG2U=
=qgTB
-----END PGP SIGNATURE-----

--hN7CaNN7z/2Obhqg--

--===============1342470780648490831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1342470780648490831==--
