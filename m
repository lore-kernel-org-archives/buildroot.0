Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A43C27C6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 23:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EAF741750;
	Fri, 14 Jun 2024 23:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7YHs9z_xSAm; Fri, 14 Jun 2024 23:45:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 133464174D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 133464174D;
	Fri, 14 Jun 2024 23:45:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0ACF1BF31C
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 23:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA395402E2
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 23:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7apP0M77niFw for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 23:45:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 91E5540177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91E5540177
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91E5540177
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 23:45:24 +0000 (UTC)
Received: from [194.157.37.35] (helo=momiji)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sIGbf-003L2D-R8; Sat, 15 Jun 2024 01:45:19 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 5cdc93e7;
 Fri, 14 Jun 2024 23:45:18 +0000 (UTC)
Date: Sat, 15 Jun 2024 02:45:13 +0300
Message-ID: <20240615024513.GB58848@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240208112940.6fa6e89b@windsurf>
References: <20240208095531.99049-1-aperez@igalia.com>
 <20240208112940.6fa6e89b@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3bhlE33WYXWcP6l5m8pW2JknvthB9MEtAG4Jw4gpwOQ=; b=S2aK8b3EfskrspIHM+PH8yGHQN
 Gu40yDkn6A0NAS4n09X3Kom8PwIiDeEIe22tPqSEc6FJynZ+Er7NQJUJrgfU/VpEY2n1+E3/Dbe/0
 iNW8VbUOJNBUr42hKJNeO8w5TWVEGI/8frjx+LEzL3oDENrA+GNE1ti1sfxx+WLibLN1rturXJs/F
 JEcVq+ZtwsNjXEt+G7m7ItPSf2LdUES63Y+2hLyFnq+4jxros/dRreYiNTAwIXeKrhL5dbHPg6clC
 qR1mvgNvtb9EqMuTqCSFugJYvb2LimbFhf9RMi4vfBNWnuKjcywn1KNpVQR2xg+iwYnMILIlSe+Yr
 HIsi/ZMg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=S2aK8b3E
Subject: Re: [Buildroot] [PATCH 0/3] Add support for the WPE WebKit RDK
 backend
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
Content-Type: multipart/mixed; boundary="===============8762453018079003452=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8762453018079003452==
Content-Type: multipart/signed; boundary="LHDQ+fhuWPqNfNul"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--LHDQ+fhuWPqNfNul
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLCBhbGwsCgpPbiBUaHUsIDA4IEZlYiAyMDI0IDExOjI5OjQwICswMTAwIFRob21h
cyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+IEhlbGxv
IEFkcmlhbiwKPiAKPiBPbiBUaHUsICA4IEZlYiAyMDI0IDExOjU1OjI3ICswMjAwCj4gQWRyaWFu
IFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IHdyb3RlOgo+IAo+ID4gVGhpcyBw
YXRjaCBzZXJpZXMgYWxsb3dzIHVzaW5nIHRoZSBSREsgYmFja2VuZCBmb3IgV1BFIFdlYktpdC4g
Q3VycmVudGx5IHRoZQo+ID4gbWFpbiB1c2UgY2FzZSBpcyB0byBydW4gV1BFV2ViS2l0IG9uIFJh
c3BiZXJyeVBpIGJvYXJkcyB1c2luZyBvbiBEaXNwbWFueCB2aWEKPiA+IHRoZSBycGktdXNlcmxh
bmQgRUdML0dMRVMgbGlicmFyaWVzLgo+IAo+IFRoYW5rcyBmb3IgdGhpcyBwYXRjaCBzZXJpZXMh
Cgo6LSkKIAo+IFdlIGhhdmUgc29tZSBvdGhlciBwYXRjaGVzIGluIHBhdGNod29yayByZWxhdGVk
IHRvIHdlYmtpdDoKPiAKPiBTb21lIGZyb20geW91Ogo+IAo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzA0MjMyMTMwMDEuMjk2MTIxNS0x
LWFwZXJlekBpZ2FsaWEuY29tLwo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9idWlsZHJvb3QvcGF0Y2gvMjAyMzA0MjMyMTMyMzMuMjk2MTc3MC0xLWFwZXJlekBpZ2FsaWEu
Y29tLwo+IAo+IEFyZSB0aGV5IHN0aWxsIHZhbGlkL2FwcGxpY2F0aW9uPwoKVGhlc2UgdHdvIGFy
ZSBubyBsb25nZXIgbmVlZGVkIGFmdGVyIHRoZSB1cGRhdGUgdG8gd3Bld2Via2l0IGFuZAp3ZWJr
aXRndGsgMi40NC54CiAKPiBXZSBhbHNvIGhhdmUgdHdpY2UgdGhlIHNhbWUgKD8pIHBhdGNoIGZy
b20gR2l1bGlvOgo+IAo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWls
ZHJvb3QvcGF0Y2gvMjAyMzAyMjExNjE1MjIuMzc0OTgwNC0xLWdpdWxpby5iZW5ldHRpQGJlbmV0
dGllbmdpbmVlcmluZy5jb20vCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2J1aWxkcm9vdC9wYXRjaC8yMDIzMDIyMTE2MTUyMi4zNzQ5ODA0LTItZ2l1bGlvLmJlbmV0dGlA
YmVuZXR0aWVuZ2luZWVyaW5nLmNvbS8KPiAKPiBpcyBpdCByZWxldmFudD8KCkkgdGhpbmsgdGhl
c2UgdHdvIHNob3VsZG4ndCBiZSBuZWVkZWQgYW55bW9yZSwgR2l1bGlvIHNlbnQgYSBQUiB0bwp1
cHN0cmVhbSBXZWJLaXQgd2hpY2ggZW5kZWQgdXAgYmVpbmcgbWVyZ2VkIFsxXSBhbmQgaXQgd2Fz
IGluY2x1ZGVkCmluIHRoZSAyLjQ0LnggcmVsZWFzZXMgYXMgd2VsbC4KCj4gQ291bGQgeW91IGhh
dmUgYSBsb29rIHNvIHdlIGNhbiBob3BlZnVsbHkgY2xlYXIgdXAgdGhlIGJhY2tsb2c/Cj4gVGhh
bmtzIGEgbG90IQoKTXkgYXBvbG9naWVzIGZvciB0YWtpbmcgc28gbG9uZyB0byByZXBseSwgc29t
ZWhvdyBJIG1hbmFnZWQgdG8gbGV0CnRoaXMgc2xpcCBeX14KCkNoZWVycywK4oCUQWRyacOhbgoK
LS0tClsxXSBodHRwczovL2dpdGh1Yi5jb20vV2ViS2l0L1dlYktpdC9jb21taXQvMzYwZjJmOTM4
YmJhNDA2YzBlOWJmZjUyNzEwYTEzYzc0ZWI4ZDFlOQo=

--LHDQ+fhuWPqNfNul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZmzWCQAKCRCRxVnb5MkS
O98bAJwP+DldOvMxRv23VvFR6UlemkohSACfUmdZvLPYS2RN/EukzHYGsSgIzLU=
=L4PH
-----END PGP SIGNATURE-----

--LHDQ+fhuWPqNfNul--

--===============8762453018079003452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8762453018079003452==--
