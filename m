Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B640C88E73
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 08:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1B9B40577;
	Tue, 15 Sep 2026 08:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJAwCKtEd8fr; Tue, 15 Sep 2026 08:01:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C1C884056C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789459307;
	b=KXSjhDYazQrk98B+YU4RRlZxdsVTM+6UoxcBbwd1tu4cOxRAG7cK27lNm4F2kGcuE42e
	 xKNp7S5bMHWKYhzXtDdv8DpizzL5lqJ6VIH6wMikDGQuAnoy/m1p7V7miumdI1KFZYRTH
	 8ox18lgQC1HOb5KBBckHhjXGMBticPlTWZR1zlz+TPDdAIhm08Hk3t/7eOzYW4GaiJ3fE
	 9O1VhDJh2R1tPK1glENhIf4ZIWeCSUWfp2l73cJdOd0mzOB+kr5XtczRttKlqrUWH9xPt
	 HfpWWUi7fLx6WbUjvvVzO3wTQSqHEd4t4SbwqwHZO/QyhOYeTEuyB/AqNvijIKoXUxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789459307;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=2XTD5zRW4st32dqM3gn3ID8lXpzInSaljCOO0T0tMOc=;
	b=BXZ0OF2ImSQEamLQQiQU3/5WyB0V9Fczy0ftPBvG2hrTLqC65hR4Fe24yT+N4cGKxrXI
	 apcRyjc303W9JgZsDRhx9uw+rbi5F5UIvkJoMcUWbXPFMiJIGfQHeib9GVmcWViBhuf/Y
	 e+OlxA0Q35LAYANtiw+smyu/K/z5h40hIJhUpTrjJ4IHKjzpRezwoxEjhvwa8lUTfUT4q
	 W3X+4quwn21HX606hrGnJCq8FYym4PAIBavwvKC0ENtcJ97rVXwmpAe1SHysP74ygvI8Q
	 /5ddaDgRQPqGhEQSPhJiNi8teWoVYHvSQ3M/ewjwCyMejINWhFFuyCxTLSJaryQl5mw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=JrgPnuKO;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789459307;
	bh=2XTD5zRW4st32dqM3gn3ID8lXpzInSaljCOO0T0tMOc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sLIQpZYXv+JBQnXZLSwNUcckpBx0ixlOqfBL7KHHww//L/1qUtshTuCXv6sxPVmFb
	 q9eFjZBQyKFj6Y9pi/x7AZwn60dHXO8BUpIbca/0n4yKyV/5wTdJMYJesaUtYSOtJ1
	 ABugKZeYoDGrVPxjUcNFN3rSj3oJUd5/957ql6hHKcvFRt8rQFPtQN9URUUZjXzaOQ
	 vpKrDZNtXox14vRjSVliEEBbmGKezsDYcifa3w89HJRlCD7mHpZHNE2Bo7UrtY5jXh
	 js94mQJ+caXFLntwZbt1eVBf4w+6jUzc/t09bNuzFuHzpUr94KlGus1NgLupWUlMqp
	 p26z0OufjptUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1C884056C;
	Tue, 15 Sep 2026 08:01:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A56E02E3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 08:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B0E14056A
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 08:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VA9_f8cka1X9 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 08:01:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0BEC54050A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789459303;
 b=oaQ/USTPTEy3vhOeLDtoZBYt5yo1ZvzdNPcgPmK0EMl2MrXl0gksEs81w3zWb07z16w0
 90IQfr44i89ROKGIswoJsHGyS2DjhcIC6WW+h6uRClLUWoiR3TxzcZJI7kXCUqiEOOkK2
 jg2DvE/N1BsXIBqJpnqAogQQTkVJjee6JTqEgMOdQ7/hSAZp9hnQOpTmdR1GRN56+PeQo
 PyuE661J3ho4hbqt+1VaxkXvUfA4wshOVGEv8HP2wsUBqMJb8pUO+r0S7eg2wG1LSfiH2
 UZr0NJpUrTSNCMsnW+DsTU/TJwtVrHxj8Qf6ZIiwUmRN8yH8kzIwtzL5MTr76JTEJNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789459303;
 h=Received-SPF:DKIM-Signature:Received:Received:Date:Message-ID:From:
 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type;
 bh=cCMRfVneX59ATXosEyo8RZCvybeaL8NbIDAflV9mffI=;
 b=buQMVgGFhASXuaLxbm9GCb8eOhIQ/qtkhjFdVf+UBLcXUfHCp2zWBgsQLQNT2cxuAvmP
 dkibHUeGiTboW8tYQlZqbXYc/UoPI9XLKMARqG+CxMBkuICYXGpQdEUTnP6FTm2GjcqyB
 UOoj2zVFclw8p6DG3Q043Hs9qUUA3rPt3CyxVCeQIU9f3L1qDSljxUOK6aVooJYRczWtQ
 wO8DPVdWmt2vTXUBkmkUzpy+ewFzjX9zLL+H4tK3aFXPgYbsLaCbjidiqlIBi9j4SOBob
 3zV5yM8aGlJRU3XtnLHajMijNgTPhbs8pKX0onLTzcaHm1m8l82aKV9GfyA3GBQM5mg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=igalia.com; 
 dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=JrgPnuKO; 
 arc=none smtp.remote-ip=213.97.179.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=JrgPnuKO
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BEC54050A
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 08:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Subject:Cc:To:From:Message-ID:Date:
 From:Reply-To; bh=cCMRfVneX59ATXosEyo8RZCvybeaL8NbIDAflV9mffI=; b=JrgPnuKOutg
 OxZAoDl3rA9D9pltIwxIPqamYs0fk6HJGPpmfckXVz5qs8gN4L5WeuqvBO5SY3mTWfDWEcsXT6tnQ
 UzxxLM5woLUC68ni9bkAPc6cg9E7fYkiYgdCfRppvhbc+nVrK5em9AFD2jZoQ3pZF7JnOFiI3mLnu
 v8s/A/rOsRl6JJVKSrYaxpiQ1rfXnbJxRcYFQ0jaDmM0UWOlpMQV7iuH1RdQbbmqM3lB2ZIh18Gwb
 /+ide0S855Mr0DJXPMmrRWIQmE7qRTv7RWoK4MUoM2375x3I5SaaePS/Qz5G2gN6COXt9vnVGlZRK
 uNPWRAJYHtXaaJmEOqmOnDQ==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x6O6d-002JDI-Iz; Tue, 15 Sep 2026 10:01:31 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id c0ba0e9e;
 Tue, 15 Sep 2026 08:01:30 +0000 (UTC)
Date: Tue, 15 Sep 2026 10:01:26 +0200
Message-ID: <20260915100126.GG925528998395952@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff via buildroot <buildroot@buildroot.org>,
 buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francois Perrad <francois.perrad@gadz.org>
In-Reply-To: <20260915074215.620475-2-buildroot@heine.tech>
References: <20260915074215.620475-2-buildroot@heine.tech>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: propagate gst1-libav
 architecture dependency
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
Content-Type: multipart/mixed; boundary="===============1239712509489900990=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1239712509489900990==
Content-Type: multipart/signed; boundary="lBG4T/ofh3ggKMWg"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--lBG4T/ofh3ggKMWg
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"; hp="clear"
Date: Tue, 15 Sep 2026 10:01:26 +0200
Message-ID: <20260915100126.GG925528998395952@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff via buildroot <buildroot@buildroot.org>,
 buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francois Perrad <francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: propagate gst1-libav
 architecture dependency
In-Reply-To: <20260915074215.620475-2-buildroot@heine.tech>
References: <20260915074215.620475-2-buildroot@heine.tech>
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gTWljaGFlbCwKCk9uIFR1ZSwgMTUgU2VwIDIwMjYgMDk6NDI6MTIgKzAyMDAgTWljaGFl
bCBOb3N0aG9mZiB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6
Cj4gQlIyX1BBQ0tBR0VfV1BFV0VCS0lUX01VTFRJTUVESUEgc2VsZWN0cyBCUjJfUEFDS0FHRV9H
U1QxX0xJQkFWLCB3aGljaAo+IGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfRkZNUEVHX0FSQ0hfU1VQ
UE9SVFMsIGJ1dCBkb2Vzbid0IHByb3BhZ2F0ZQo+IHRoaXMgZGVwZW5kZW5jeS4gSW4gcHJhY3Rp
Y2UsIHRoZXJlIGlzIG5vIGlzc3VlLCBhcyB3ZWJraXRndGsgaXMgb25seQo+IGF2YWlsYWJsZSBv
biBhIHN1YnNldCBvZiBDUFUgYXJjaGl0ZWN0dXJlcywgd2hpbGUKPiBCUjJfUEFDS0FHRV9GRk1Q
RUdfQVJDSF9TVVBQT1JUUyBtYWtlcyBmZm1wZWcgYXZhaWxhYmxlIG9uIHByZXR0eSBtdWNoCj4g
YWxsIENQVSBhcmNoaXRlY3R1cmVzLCBleGNlcHQgQ29ydGV4LU0sIG02OGsgY29sZGZpcmUsIGFu
ZCBzb21lCj4gc3BlY2lmaWMgY2FzZXMgb2YgT3BlblJJU0MsIHdoaWNoIGFyZSBub3Qgc3VwcG9y
dGVkIGJ5IHdlYmtpdGd0ay4KPiAKPiBCdXQgZm9yIHRoZSBzYWtlIG9mIGhhdmluZyBjb3JyZWN0
IGRlcGVuZGVuY3kgcHJvcGFnYXRpb24sIGxldCdzIGZpeAo+IHRoaXMuCj4gCj4gVGhlIG90aGVy
IHBhY2thZ2VzIHNlbGVjdGVkIGJ5IEJSMl9QQUNLQUdFX1dQRVdFQktJVF9NVUxUSU1FRElBIGhh
dmUKPiBkZXBlbmRlbmNpZXMgdGhhdCBhcmUgYWxyZWFkeSBoYW5kbGVkIGF0IHRoZSB0b3AtbGV2
ZWwKPiBCUjJfUEFDS0FHRV9XUEVXRUJLSVQgb3B0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1p
Y2hhZWwgTm9zdGhvZmYgPGJ1aWxkcm9vdEBoZWluZS50ZWNoPgo+IENDOiBUaG9tYXMgUGV0YXp6
b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKQWNrZWQtYnk6IEFkcmlhbiBQZXJl
eiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgogCj4gLS0tCj4gCj4gdGhpcyBpcyBhIDE6
MSBjb3B5IG9mIGRhOTA2NTU2MzcxY2EzNzI4YjA1ZWE0ZjMzNDAyODkxMjg4Y2MwMjcgd2hpY2gg
ZG9lcwo+IHRoZSBzYW1lIGZvciB3ZWJraXRndGsuCj4gCj4gLS0tCj4gIHBhY2thZ2Uvd3Bld2Vi
a2l0L0NvbmZpZy5pbiB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93cGV3ZWJraXQvQ29uZmlnLmluIGIvcGFja2FnZS93cGV3
ZWJraXQvQ29uZmlnLmluCj4gaW5kZXggMDNlOWVhZjU5ZS4uNGE3NDdhMjJjOSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3dwZXdlYmtpdC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3dwZXdlYmtp
dC9Db25maWcuaW4KPiBAQCAtODcsNiArODcsNyBAQCBjb21tZW50ICJzYW5kYm94aW5nIHN1cHBv
cnRzIG5lZWRzIGEgdG9vbGNoYWluIHcvIGhlYWRlcnMgPj0gMy4xNyIKPiAgCj4gIGNvbmZpZyBC
UjJfUEFDS0FHRV9XUEVXRUJLSVRfTVVMVElNRURJQQo+ICAJYm9vbCAibXVsdGltZWRpYSBzdXBw
b3J0Igo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9GRk1QRUdfQVJDSF9TVVBQT1JUUyAjIGdz
dDEtbGliYXYKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9HU1RSRUFNRVIxCj4gIAlzZWxlY3QgQlIy
X1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0dTVDFfUExV
R0lOU19CQURfUExVR0lOX0RFQlVHVVRJTFMKPiAtLSAKPiAyLjQzLjAKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--lBG4T/ofh3ggKMWg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaqj7VgAKCRCRxVnb5MkS
OxvxAJ9V3niXIzOAaLePWi0GkVKzfne5fQCfXLSdYgnT/gz1Wbg5QS0f7dUL54Y=
=bzuk
-----END PGP SIGNATURE-----

--lBG4T/ofh3ggKMWg--

--===============1239712509489900990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1239712509489900990==--
