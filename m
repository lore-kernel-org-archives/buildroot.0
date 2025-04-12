Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96236C369A1
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 12:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CEE78054C;
	Sat, 12 Apr 2025 12:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpVJavLlZb4H; Sat, 12 Apr 2025 12:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC31A8148B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC31A8148B;
	Sat, 12 Apr 2025 12:01:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7796E108
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 12:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68DCE8054C
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 12:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6Jib9UZL0Qd for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 12:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 072EF8148B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 072EF8148B
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 072EF8148B
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 12:01:27 +0000 (UTC)
Received: from [91.116.116.48] (helo=momiji)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u3ZY4-00FZDq-RA; Sat, 12 Apr 2025 14:01:24 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 89a31735;
 Sat, 12 Apr 2025 12:01:10 +0000 (UTC)
Date: Sat, 12 Apr 2025 15:01:06 +0300
Message-ID: <20250412150106.GI2424943@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <c29cf2115e9b79b8d18a79af0bddbea6@free.fr>
References: <20250320172543.2490556-1-aperez@igalia.com>
 <c29cf2115e9b79b8d18a79af0bddbea6@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vhZlQCxA2qNY8+FxvhtWTWoGOH2hz7Hq0eff2fvWtaM=; b=QPmlz/nVPcf0Hs+3+LMhPoFL1J
 0aTC3upzsWufT/IEgEXHW/rQCeIi6R24Iq1sQ+BgAZlwiMOs6v+I+drWKEaqo5RftaMRt81QlBGtG
 fHAV75x800j692BBeQg/fOJ1D4TrVgir+Zx5xRoqaRhNic/EsAHomz0TwP1UJDe5DAW/Xl/0JMd1I
 EZrdRbDhGaJHITkHzHJfnV5NSaNw1tu5HN6a2vBJJcHl4Xx2EwMeiLAdrwHee6eIgSSDU/6Id1HF+
 bwpffsNO/hwXwEzBD3PU2E9b9blRZrzGbz3ehg1PISVRLAA0bCgao2waoNOLOPDYdIpEBACptCMKM
 CLEFItRg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=QPmlz/nV
Subject: Re: [Buildroot] [PATCH 1/1] package/libmanette: bump to version
 0.2.11
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
Content-Type: multipart/mixed; boundary="===============3788069064731858024=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3788069064731858024==
Content-Type: multipart/signed; boundary="qVspykWByexeE7VW"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--qVspykWByexeE7VW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgSnVsaWVuLAoKT24gU2F0LCAxMiBBcHIgMjAyNSAxMjo1NzoyOCArMDIwMCBKdWxpZW4gT2xp
dmFpbiA8anUub0BmcmVlLmZyPiB3cm90ZToKPiBIaSBBZHJpYW4sCj4gCj4gT24gMjAvMDMvMjAy
NSAxODoyNSwgQWRyaWFuIFBlcmV6IGRlIENhc3RybyB3cm90ZToKPiA+IEJ1Z2ZpeCByZWxlYXNl
IHdpdGggYSBudW1iZXIgb2YgZml4ZXMsIGl0IGFsc28gYWRkcyBzdXBwb3J0IGZvciB0aGUKPiA+
IFN0ZWFtIERlY2sgZ2FtZXBhZC4gUmVsZWFzZSBub3RlczoKPiA+IAo+ID4gICAKPiA+IGh0dHBz
Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9saWJtYW5ldHRlLy0vYmxvYi8xYWNiNDY5NDNkNGQ5
NzBhYmU1OTRiNjM0YTA1OGM5M2IzMDIxMjU4L05FV1MKPiA+IAo+ID4gVGhpcyB2ZXJzaW9uIGlu
dHJvZHVjZXMgYSBkZXBlbmRlbmN5IG9uIHRoZSBoaWRhcGkgcGFja2FnZS4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cj4g
Cj4gSSBhcHBsaWVkIHRoaXMgcGF0Y2ggdG8gbWFzdGVyLCB0aGFua3MuCj4gSSBhbHNvIHByb3Bh
Z2F0ZWQgdGhlIG1pc3NpbmcgaGlkYXBpIGRlcGVuZGVuY2llcy4gU2VlOgo+IGh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8zYTNhYjcwZmMyZjRjMjZj
NGQ5NDNkZTAxNzQ4YjBmYTJjMGNkYWNkCgpXb25kZXJmdWwsIHRoYW5rcyEgQnkgbm93IEkgc2hv
dWxkIGJlIGFibGUgdG8gZG8gdGhlIGRlcGVuZGVuY3kKcHJvcGFnYXRpb24gYnkgbXlzZWxmIGNv
cnJlY3RseSwgYnV0IEkga2VlcCBtYWtpbmcgc2lsbHkgbWlzdGFrZXMsCnNvcnJ5IGFib3V0IHRo
YXQuCiAKQ2hlZXJzLArigJRBZHJpw6FuCg==

--qVspykWByexeE7VW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZ/pWAgAKCRCRxVnb5MkS
O4J5AJ9qMaaGqkmLrUT8WDmiOOwqWkJ7nACfeTlxTQ9vzvhvymRhvTW6BeQGv4g=
=p6jw
-----END PGP SIGNATURE-----

--qVspykWByexeE7VW--

--===============3788069064731858024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3788069064731858024==--
