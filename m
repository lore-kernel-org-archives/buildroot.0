Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2F5C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 13:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C925740281;
	Mon,  5 Aug 2024 13:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0FS9Hi2Dtd2; Mon,  5 Aug 2024 13:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6867A40287
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6867A40287;
	Mon,  5 Aug 2024 13:20:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F4A31BF334
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 13:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C09D4054B
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 13:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCKe6cMGjqF7 for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 13:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F08340290
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F08340290
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F08340290
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 13:19:57 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1saxcw-0087AA-Cs; Mon, 05 Aug 2024 15:19:54 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id a4f20cbb;
 Mon, 5 Aug 2024 13:19:52 +0000 (UTC)
Date: Mon, 5 Aug 2024 16:19:48 +0300
Message-ID: <20240805161948.GB3474121@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240712230553.23f75095@windsurf>
References: <20240522091608.3659847-1-aperez@igalia.com>
 <20240522091608.3659847-4-aperez@igalia.com>
 <20240712230553.23f75095@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cRaLAKHm1HKesh9fyWWAW50EJxgyGJojA+orwdrb2g8=; b=aE1laEMvrc/uOcWHPcrok93QAl
 CYMEhgo8LR91ZCBhrn2t24x3qncQDi8QhUGEwfF5lD6iFAXtcNpME2fa3VFS73+wBlEQp8BcUf3Ku
 q1l7H5nrmfrTih4eHhNZp33WR+PDXZtIN8YvERok9YpXv5z6Kit9n3mPKVNCAhorxv1k4m9MJFbFX
 bPMwknKQJ2BeOkuZAWQw+QGvCTBj/5td7rL6PQ+ED4pXcdGhppzu2rxvvKpEm1zYwuYXrxFWiSx1B
 QcOuiL4yMLe7zzhceBdTWeMWPzCp7nLWgxafUeMfcH+b3NwiekSBT+h1GrjOYAQe8iYZneec8IwZU
 NK4djKzQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=aE1laEMv
Subject: Re: [Buildroot] [PATCH 3/4] package/libavif: new package
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
Content-Type: multipart/mixed; boundary="===============1553402883398390185=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1553402883398390185==
Content-Type: multipart/signed; boundary="YkJkcpSni+sbdJWB"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--YkJkcpSni+sbdJWB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8hCgooQ29taW5nIGJhY2sgc2xvd2x5IGZyb20gYmVpbmcgb25lIG1vbnRoIEFGSywgc29y
cnkgZm9yIHRoZSBkZWxheSByZXBseWluZy4pCgpPbiBGcmksIDEyIEp1bCAyMDI0IDIzOjA1OjUz
ICswMjAwIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9v
dC5vcmc+IHdyb3RlOgo+IE9uIFdlZCwgMjIgTWF5IDIwMjQgMTI6MTY6MDYgKzAzMDAKPiBBZHJp
YW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6Cj4gCj4gPiBsaWJh
dmlmIGlzIGFuIGltcGxlbWVudGF0aW9uIG9mIHRoZSBBVjFGIGltYWdlIGZvcm1hdCwgd2hpY2gg
bWF5IGJlIGEKPiA+IGZyb250ZW5kIGZvciBkaWZmZXJlbnQgZW5jb2RlcnMgYW5kIGRlY29kZXJz
LiBBdCB0aGUgbW9tZW50IG9ubHkgZGF2MWQKPiA+IGlzIHBhY2thZ2VkIHNvIHRoYXQgaXMgdGhl
IG9uZSBjb25maWd1cmVkLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUGVyZXogZGUg
Q2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KPiAKPiBUaGFua3MsIGFwcGxpZWQsIHdpdGggb25l
IGNoYW5nZS4gU2VlIGJlbG93Lgo+IAo+ID4gK0xJQkFWSUZfVkVSU0lPTiA9IDEuMC40Cj4gPiAr
TElCQVZJRl9TSVRFID0gJChjYWxsIGdpdGh1YixBT01lZGlhQ29kZWMsbGliYXZpZix2JChMSUJB
VklGX1ZFUlNJT04pKQo+ID4gK0xJQkFWSUZfTElDRU5TRSA9Cj4gCj4gVG9vIGxhenkgdG8gZmln
dXJlIG91dCB0aGUgbGljZW5zZSB0ZXJtcz8gOi0pKQo+IAo+IEkgY2hhbmdlZCB0bzoKPiAKPiAr
TElCQVZJRl9MSUNFTlNFID0gQlNELTItQ2xhdXNlLCBJSkcsIEFwYWNoZS0yLjAKCk91Y2gsIHdo
ZW4gSSBzdGFydGVkIHdyaXRpbmcgdGhlIHBhY2thZ2UgSSB0aG91Z2h0ICJ3aWxsIGZpbGwgdGhp
cyBsYXRlciwKbGV0J3MgZmlndXJlIG91dCBob3cgdG8gYnVpbGQgZmlyc3QiIGFuZCB0aGVuIGNv
bXBsZXRlbHkgZm9yZ290IHRvIHVwZGF0ZQp0aGUgZW1wdHkgdmFyaWFibGUuIFRoYW5rcyEKCk9u
IGEgcmVsYXRlZCBub3RlLCBJIHN1Ym1pdHRlZCBhIHZlcnNpb24gYnVtcCBmb3IgbGliYXZpZiBl
YXJsaWVyIHRvZGF5OgoKICBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L3BhdGNoLzIwMjQwODA1MTE1MjI0LjM0NzM0MzEtMS1hcGVyZXpAaWdhbGlhLmNvbS8K
CgpDaGVlcnMsCuKAlEFkcmnDoW4K

--YkJkcpSni+sbdJWB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZrDRdAAKCRCRxVnb5MkS
O2j4AJ43WD9vNx4iKo72k6V9Nj6scKEdTQCfQpeeaazsg2XbY6i/LfR8S6SmDUU=
=IM9f
-----END PGP SIGNATURE-----

--YkJkcpSni+sbdJWB--

--===============1553402883398390185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1553402883398390185==--
