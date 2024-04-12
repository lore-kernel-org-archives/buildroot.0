Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA6FC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 08:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8C89606A2;
	Fri, 12 Apr 2024 08:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z77hz0cEoV-R; Fri, 12 Apr 2024 08:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0381F606E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0381F606E5;
	Fri, 12 Apr 2024 08:06:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 059271BF4E3
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 08:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E729482368
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 08:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAPcgm-YlxN3 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 08:06:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE10E80F89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE10E80F89
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE10E80F89
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 08:06:07 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rvBb2-003oxe-5K; Fri, 12 Apr 2024 09:45:16 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 22a9effb;
 Fri, 12 Apr 2024 07:45:15 +0000 (UTC)
Date: Fri, 12 Apr 2024 10:45:10 +0300
Message-ID: <20240412104510.GB1350651@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20240404013345.GB2557385@igalia.com>
References: <20240401183930.2557159-2-thomas@devoogdt.com>
 <20240403171424.44580-1-thomas@devoogdt.com>
 <20240403171424.44580-2-thomas@devoogdt.com>
 <20240404013345.GB2557385@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=owpTw1ur/2RuNgm2SSJ+oDGEZIl/TnW1sHq8TNj77QA=; b=FbDs7nFPB7s3c3pu0EObUu8fN0
 7r19sb+m85jhKxfNWCczo5gfPZdFdZ/U170yimq8+BgURvyXljdRFsgnXSRfvcmz5JDtFxOHWmXiL
 gu9QAO6bAFJaxG8ntUW34HRP9BT/ql9gwTsyN0i0PjvwoCj2PvL2nemXK265MDbjTXAWMTtgFBn88
 YifhRIZfHc9AvfF5Nwyd4tEId4NMCRIzc4La+yQmJZX0UYLVtXEbo7OEo8jbAHBXikmWxk5I9X2zM
 PTPvYxypCtAep5Ab5AUX7jHma3SjPK4j7VhiRsXAa/Vr+jqPeDjS24AZ9Pp5C9xsVfCcChItGPuYP
 LXeUki0g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=FbDs7nFP
Subject: Re: [Buildroot] [PATCH v2 2/2] package/webkitgtk: bump to 2.44.0
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
Cc: thomas@devoogdt.com, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0058949669215622889=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0058949669215622889==
Content-Type: multipart/signed; boundary="o+mO9awqXWYLc/Ih"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--o+mO9awqXWYLc/Ih
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gYWdhaW4sCgpPbiBUaHUsIDA0IEFwciAyMDI0IDAxOjMzOjQ1ICswMzAwIEFkcmlhbiBQ
ZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKCj4gWW91IGJlYXQgbWUg
dG8gdGhpcyB1cGRhdGUsIHRoYW5rcyBmb3Igc3VibWl0dGluZyB0aGUgcGF0Y2gsIHRoaXMgb25l
IExHVE0uCj4gCj4gT24gV2VkLCAwMyBBcHIgMjAyNCAxOToxNDoyNCArMDIwMCBUaG9tYXMgRGV2
b29nZHQgPHRob21hc0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+ID4gQSBsb3QgaGFzIGJlZW4gY2hh
bmdlZCwgcGxlYXNlIGNvbnN1bHQgdGhlIGFubm91bmNlbWVudCBbMV0sIHdoYXQncyBuZXcgWzJd
LAo+ID4gYW5kIHRoZSBzZWN1cml0eSBhZHZpc29yeSBbM10gZm9yIG1vcmUgZGV0YWlscy4KClF1
aWNrIGhlYWRzIHVwLi4uIFdlIGhhdmUgcmVsZWFzZWQgMi40NC4xIGEgZmV3IGRheXMgYWdvOgoK
ICBodHRwczovL3dlYmtpdGd0ay5vcmcvMjAyNC8wNC8wOS93ZWJraXRndGsyLjQ0LjEtcmVsZWFz
ZWQuaHRtbAoKSnVzdCBpbiBjYXNlIHlvdSBmZWVsIGxpa2UgZG9pbmcgYSB2MyB0aGF0IHRha2Vz
IHRoZSB2ZXJzaW9uIGJ1bXAgdG8gMi40NC4xCmRpcmVjdGx5LiBUaGVyZSBpcyBubyBXU0EgYnV0
IHRoZXJlJ3MgYSBmZXcgYnVpbGQgZml4ZXMgdGhhdCB3b3VsZCBiZSBnb29kIHRvCmhhdmUgaW4g
QnVpbGRyb290IChzcGVjaWFsbHkgdGhlIG9uZSB0aGF0IG1ha2VzIGl0IGJ1aWxkYWJsZSBpbiAz
Mi1iaXQgYXJjaGVzCmFnYWluKS4KCkNoZWVycywK4oCUQWRyacOhbgo=

--o+mO9awqXWYLc/Ih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZhjmhgAKCRCRxVnb5MkS
O3BiAJ997FjxlfVTLx/+Zim5iUsPAUGe5ACdFKPrKQ5zJzWIndrHuPo7TYiZJz0=
=8dm6
-----END PGP SIGNATURE-----

--o+mO9awqXWYLc/Ih--

--===============0058949669215622889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0058949669215622889==--
