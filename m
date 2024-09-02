Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13DACD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 19:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DE7180EC4;
	Mon,  2 Sep 2024 19:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snYe5m3Pf0Il; Mon,  2 Sep 2024 19:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97B7C80EA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97B7C80EA5;
	Mon,  2 Sep 2024 19:37:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 575FB1BF20B
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 19:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 440B9402DD
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 19:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Cxm3TDQiES2 for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 19:37:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2911D402D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2911D402D9
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2911D402D9
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 19:37:46 +0000 (UTC)
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1slCrv-008SvU-EH; Mon, 02 Sep 2024 21:37:43 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 8add3c09;
 Mon, 2 Sep 2024 19:37:39 +0000 (UTC)
Date: Mon, 2 Sep 2024 22:37:33 +0300
Message-ID: <20240902223733.GB1449890@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <ZtXnPqjYvzyMJfix@landeda>
References: <20240829131232.2132854-2-thomas@devoogdt.com>
 <20240901121122.3113482-1-thomas@devoogdt.com> <ZtXcn-Jkl40CoZ5k@landeda>
 <CACXRmJgZSHFDjdsR8hVF1jE+SU=Ske20F2RLts5zLHjzBY8QVw@mail.gmail.com>
 <ZtXnPqjYvzyMJfix@landeda>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XhR3tJ7oO6QtWoY9OweOLyNzTnjHtcYPKMXnpP+s5j8=; b=gSZLDfVlNbNWB02khScJrIhYAX
 wgNZGfNgylmbRa1nN0FdLwrqkB2O0cvg0F2gbby0BFoZYnajLT5QEDYgZYCNZO0RozkOsdRw9g3/7
 efRNoW5AMSIH2ZX5qemTUJS778MH8Ix0umzN/4EaGD9joOP2RyHCXWa11CsFqQ7cHrDNc3EJszOBQ
 iHFs8u+HA/lFM94Z3ShkHh9MU0WC53rFIp6cfhVFBZl5JnaedsSKHfA+TQtrl2yBpKcquKHJndPjh
 p8lbXlZEghVaQaCrQbgrHwBggAa2UW4C2Fl+J4uJIOneY2R9A7S3lf1js01kOhLDPX5KcCi8Cu5CW
 3lPtW8tA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=gSZLDfVl
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: restore libsoup
 support
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4347080364548755240=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4347080364548755240==
Content-Type: multipart/signed; boundary="UzKMKOZeNduh92o2"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--UzKMKOZeNduh92o2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLCBZYW5uLAoKT24gTW9uLCAwMiBTZXAgMjAyNCAxODoyNjozOCArMDIwMCAiWWFu
biBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiBUaG9tYXMsIEFs
bCwKPiAKPiBPbiAyMDI0LTA5LTAyIDE4OjA2ICswMjAwLCBUaG9tYXMgRGV2b29nZHQgc3Bha2Ug
dGh1c2x5Ogo+ID4gTGlic291cDIgaXMgc3RpbGwgc3VwcG9ydGVkIGJ5IHdlYmtpdGd0aywgc28g
aGF2aW5nIHN1cHBvcnQgbWFrZXMgc2Vuc2UuIEJ1dAo+ID4gZ2l2ZW4gdGhlIGZhY3QgdGhhdCBu
byBjb21wbGFpbiBhcm9zZSBzaW5jZSB0aGUgYnVtcCB0byBsaWJzb3VwMywgSSBkb3VidCB0aGUK
PiA+IHVzYWdlIG9mIGl0LiBTbyBpZiBzb21lb25lIHJlYWxseSBuZWVkIGl0LCB0aGVuIHRoYXQg
cGVyc29uIGNhbiByZXBseSBvbiB0aGlzCj4gPiBwYXRjaCBhcyB3ZWxsIEkgZ3Vlc3MuCj4gCj4g
QWdyZWVkLiBJJ2xsIGxldCB0aGUgcGF0Y2ggcGVuZGluZyBmb3IgYSB3aGlsZSwgYW5kIGlmIG5v
b25lIGNvbXBsYWlucywKPiB3ZSdsbCBkcm9wIGl0IGluIGEgZmV3IGRheXMuCgpXaXRoIG15IFdl
YktpdCBkZXZlbG9wZXIgaGF0IG9uLCBJIHdvdWxkIGFsc28gcmVjb21tZW5kIGtlZXBpbmcgb25s
eSBvbmUKb3B0aW9uLCBhbmQgdXNlIGxpYnNvdXAzID0pCgpOb3csIHRoaW5raW5nIGFzIGEgQnVp
bGRyb290IHVzZXIsIGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSAqc29tZSoKYnJvd3NlciB0aGF0
IHVzZXMgV2ViS2l0R1RLLCBpZiBvbmx5IGZvciB0ZXN0aW5nIHRoaW5ncyBiZWZvcmUgc29tZWJv
ZHkKd291bGQgZ28gb24gYW5kIGRldmVsb3AgdGhlaXIgb3duIHRoaW5nIG9uIHRvcCBvZiBXZWJL
aXRHVEsuIEhvdyBhYm91dAphZGRpbmcgYW4gb3B0aW9uIHRvIHBhc3MgRU5BQkxFX01JTklCUk9X
U0VSPU9OIHRvIENNYWtlIGluIHdlYmtpdGd0ay5taz8KVGhhdCB3b3VsZCBpbnN0YWxsIC91c3Iv
bGliZXhlYy93ZWJraXRndGstNi4wL01pbmlCcm93c2VyLCBhbmQgYQpwb3N0LWluc3RhbGwgaG9v
ayBjb3VsZCBhZGQgYSBzeW1saW5rIHRvIGl0IHVuZGVyIC91c3IvYmluLiBXRFlUPwogCgpDaGVl
cnMsCuKAlEFkcmnDoW4K

--UzKMKOZeNduh92o2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZtYT/QAKCRCRxVnb5MkS
O9DMAJ9v0fz05EbUY9Ckg82gyaVp9UcQGQCfaLDTx3xvHoq25RLPaunyM7NGroU=
=gkSe
-----END PGP SIGNATURE-----

--UzKMKOZeNduh92o2--

--===============4347080364548755240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4347080364548755240==--
