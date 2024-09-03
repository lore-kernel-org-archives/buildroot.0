Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36702CD3420
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 10:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C34984025F;
	Tue,  3 Sep 2024 10:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZX4mGoPIVRaK; Tue,  3 Sep 2024 10:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8127F402A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8127F402A6;
	Tue,  3 Sep 2024 10:54:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A68861BF263
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 10:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 937F5400F1
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 10:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jf_ZqE_eSAro for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 10:54:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 212D9400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 212D9400C7
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 212D9400C7
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 10:54:36 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1slRBB-008w7C-Ve; Tue, 03 Sep 2024 12:54:33 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id fd38ad53;
 Tue, 3 Sep 2024 10:54:32 +0000 (UTC)
Date: Tue, 3 Sep 2024 13:54:28 +0300
Message-ID: <20240903135428.GB2330919@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <ZtYaX6SSyGWOx6ez@landeda>
References: <20240829131232.2132854-2-thomas@devoogdt.com>
 <20240901121122.3113482-1-thomas@devoogdt.com> <ZtXcn-Jkl40CoZ5k@landeda>
 <CACXRmJgZSHFDjdsR8hVF1jE+SU=Ske20F2RLts5zLHjzBY8QVw@mail.gmail.com>
 <ZtXnPqjYvzyMJfix@landeda> <20240902223733.GB1449890@igalia.com>
 <ZtYaX6SSyGWOx6ez@landeda>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MrE6xNUueNHlQVuzKTqtQdqwyauQ/jrylWl86qQzQFE=; b=UNNOoYrp6ahHc+Nc11JkL/IMKE
 0e5y0sW4nirNKs7x21QJrX/iKRc1c54H0uotkIMQAVsL/BNYLJVi/44vq/+B0ljEOlLtoWfA2WC86
 9A5lZVY2nPkteu9Syqr/udPWdUs9rBugPAICYIQVJcTp0AlFsGpvNGj/OmaCghJzwYoGDrgSKKlF+
 JqMgk4QNBVaDhTcLH57tVtgAewpbric5QXodL1zISr30kKZ/MfejU3d8V8/Zta2VSKzJok6GGcQe7
 OLQU07Xcn1fCjiTnaeYDFyrFnGRE86pUldu+NclolmQI21haQ/Q9zC/xHGVyqjl85IN4BgAqOLRIw
 gPCiFnow==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=UNNOoYrp
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
Content-Type: multipart/mixed; boundary="===============2660236430302284709=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2660236430302284709==
Content-Type: multipart/signed; boundary="+Q0SLsH3hElYu//k"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--+Q0SLsH3hElYu//k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAwMiBTZXAgMjAyNCAyMjowNDo0NyArMDIwMCAiWWFubiBFLiBNT1JJTiIgPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiBBZHJpw6FuLCBBbGwsCj4gCj4gT24gMjAyNC0w
OS0wMiAyMjozNyArMDMwMCwgQWRyaWFuIFBlcmV6IGRlIENhc3RybyBzcGFrZSB0aHVzbHk6Cj4K
PiA+IE5vdywgdGhpbmtpbmcgYXMgYSBCdWlsZHJvb3QgdXNlciwgaXQgd291bGQgYmUgbmljZSB0
byBoYXZlICpzb21lKgo+ID4gYnJvd3NlciB0aGF0IHVzZXMgV2ViS2l0R1RLLCBpZiBvbmx5IGZv
ciB0ZXN0aW5nIHRoaW5ncyBiZWZvcmUgc29tZWJvZHkKPiA+IHdvdWxkIGdvIG9uIGFuZCBkZXZl
bG9wIHRoZWlyIG93biB0aGluZyBvbiB0b3Agb2YgV2ViS2l0R1RLLiBIb3cgYWJvdXQKPiA+IGFk
ZGluZyBhbiBvcHRpb24gdG8gcGFzcyBFTkFCTEVfTUlOSUJST1dTRVI9T04gdG8gQ01ha2UgaW4g
d2Via2l0Z3RrLm1rPwo+ID4gVGhhdCB3b3VsZCBpbnN0YWxsIC91c3IvbGliZXhlYy93ZWJraXRn
dGstNi4wL01pbmlCcm93c2VyLCBhbmQgYQo+ID4gcG9zdC1pbnN0YWxsIGhvb2sgY291bGQgYWRk
IGEgc3ltbGluayB0byBpdCB1bmRlciAvdXNyL2Jpbi4gV0RZVD8KPiAKPiBZZXMsIHBsZWFzZSEK
ClRoZXJlIHdlIGdvOgoKICBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L3BhdGNoLzIwMjQwOTAzMTA1MTA1LjMyODUxNzgtMS1hcGVyZXpAaWdhbGlhLmNvbS8K
IAogTm90ZSB0aGUgc3ltbGluayBpcyB0byAiLi4vbGliZXhlYy93ZWJraXQyZ3RrLTQuMS9NaW5p
QnJvd3NlciI7IHdoZW4gd2UKIG1ha2UgV2ViS2l0R1RLIGJ1aWxkIGFnYWluc3QgR1RLNCB3ZSB3
aWxsIGhhdmUgdG8gY2hhbmdlIGl0IHRvIHJlYWQKICJ3ZWJraXRndGstNi4wIiBpbnN0ZWFkID1d
CgpDaGVlcnMsCuKAlEFkcmnDoW4K

--+Q0SLsH3hElYu//k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZtbq5AAKCRCRxVnb5MkS
O5X3AJ9x/BtmnvPNTubGjY7sZ8a1VYl0zgCffKYpVG+9aECBTuevPB46qKQW3zE=
=RNkT
-----END PGP SIGNATURE-----

--+Q0SLsH3hElYu//k--

--===============2660236430302284709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2660236430302284709==--
