Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F979CA5FA5
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 09:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10F0340D1A;
	Thu,  1 Oct 2026 09:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnLvCah_FqQk; Thu,  1 Oct 2026 09:42:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E955040D1C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790847732;
	b=sgudiUfagQSOQXOzxh+1SVxoB9LwZvsf/txIa3UWsVB5PHlESkvbr7VGPxQyrGGkye7p
	 n5VYbBMFYgC8EVrPtLhxtMfERbIaChSe+AoLefjNSpRxHZC7QmSANiQlHiddEoFOyRMO6
	 hykXOat2iRgABYToksTKUhZGRwbXed3eC/S39uRhzAMYwB6s7AOlxP0KXbksqUkfUuQQ2
	 sD72VxbTq7h8+96urxg7F3WxvREssc/YtN95dy6J53SVbGmEbZV1awLJ9Na1AB/T5bQkl
	 KA/tcClLpz8tma74N0L99jv53lO1mY7oK5D2pxwtWkmlxZyOvvrdcSfAHCRxdci+1PQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790847732;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=6a6urE2+5hLE8WHbATlh2J5QNrxbWNNl3qMxBN1M+xg=;
	b=B24Nxnm1hMfw/A7/lX2P72z0Z5zaPXNNeITwNLNeu+WhW2F5dmZNmCjfKBv74tSW0KBq
	 m6oKHYQgmJyyzTxO0Z883nl/KwWIs+miDiQ0HvXrwdhyWIgnQZ/OdlerHbEzpFT/2vPlG
	 anY2ltbdbRSrrbjov+EAciVshzgf4PyOi7fbaWFoBVNHKirK5MS2iaotTF76zJ0OYnson
	 d0q6gV+89OL9SWGJM3OJx5skgYDi2FrMi1m1iYsKKksC0Rj2ppUbxexOvIoMZ0fdPzmtW
	 RDBaoV78/mngnGPsQWlTy8/SbzmjiAwrDu8hLC2IsrYHfwf82BVr6c+bD7SgKQ9Ljuw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=IwCACQrO;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790847732;
	bh=6a6urE2+5hLE8WHbATlh2J5QNrxbWNNl3qMxBN1M+xg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eg9FMdKA1WzecXh/ezBR2hERheLv0Hyb4GxrBcIZ4Ct0ViA4JOzOfZynpLNb12puL
	 RoWJ1VpVQASPxhS98XbPbm72oYbLCBo3sY8DZly1h0qWNuqnRCyvmyxLl4yhdvW4Zs
	 G3W2u8YCzTiC5HqrnXqXictueRro7/2Riqz2fBnojIOtmmvbwli7z3FkoPmNtXyN+F
	 xqcR+jdH+3RzzJSP/Zs+pA6pYFDv2/S85GkNoKhU4vMEt3Btpu28k9CHDgpT16AMJq
	 bnDltSNvT8RZ8ZohS8xILXutX2PoPJmTrR35LZ/YALxm5MUwDORUU+7rAzKhrRG+zB
	 0J1WZmFSIDrGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E955040D1C;
	Thu,  1 Oct 2026 09:42:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0068234D
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 09:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB1AA40D1C
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 09:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGY-Nz4QkMsK for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 09:42:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 63DF840D1A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790847728;
 b=g2Cs4uNGuYLTuRJms2bDzRdveCpP1/6IkyCIsrTRYVJxly87rX1CrJL/iegCAFFrKMxb
 BlQfLwIn3+oe7r4AIpLOUmZZWdSO3bEH0vR2auuwcXpyJcPeI/zbZUl9Q3CHflz5lesFJ
 pRm/RmFO70odnOWCWSnq/y7XZlqajgnUjzYJsPwyTjsd9ikxCjkicudSYWwMrUVkA+ZEw
 cFPvsYOxzlso8YDbRKsNbF/KEhaSyKw4D7DwzdTYQZYLt2u8+BcocSo6A7yaAXtcO6djS
 UTqwPQGhwsWkUoRKe39Dw4gTDO2rIvsI/C9B1uyOKlQ0U4KHh2+WQenq44/pe/J/OeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790847728;
 h=Received-SPF:DKIM-Signature:Received:Received:Date:Message-ID:From:
 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type;
 bh=OAQL5ejJLEdSFJSoMTEf5Q6dPx3+jRr4a68wM+iwFQA=;
 b=cOJL1ccXl6OAMPTrMWaOyOXoUBPzO+271EYkKZrO9vMhRWkNtFpMibgf+DkS0jvjG2gc
 b2N3XUPVyB/vHDDWthiTAHClU6uVZoA3GOm+0cUVTBafAtDqmlF3yfOcDTtQ25jhPMhi4
 mC/DoolfVtJxm6mkYHjy1XRpfwu+HyR8HWibqRE9wwUtUBYqYjjNmLVKC9HBjgnn8hmPa
 BNekqO6m8NlXFpnWt8hEeLtYeYpjvfRqAdShZ+oc+5/eCsIZ9a86EdzQbIDr+ECaThlx2
 +KV7wl/4tTvjcW7W0LGDJi0nnb2vNKnLZtbfXLxSbtWJFe+9nX3VqZ3Pzx6lE+SAAbA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=igalia.com; 
 dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=IwCACQrO; 
 arc=none smtp.remote-ip=213.97.179.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=IwCACQrO
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63DF840D1A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 09:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Subject:Cc:To:From:Message-ID:Date:
 From:Reply-To; bh=OAQL5ejJLEdSFJSoMTEf5Q6dPx3+jRr4a68wM+iwFQA=; b=IwCACQrOKJg
 dgueDK2zJ+oGbHQ/QOUlhd0ak0+tlsg0yx0w/+1kL0/tV3mwSFBG8gn8vAzYjXnimWqzzimqq3A7L
 WC7dpTzMhE12zp3AffZ1fZFtYkQUrnQqJxXnhVVcKQApTwrz6rrOWLvwt8VVrH9+WkuBl/REjsuVK
 aqzuUv7zoJ+GwFRZlBQKxrxocS2u2kvb4XMKFJBmcp26h+4lAo3enRrdRN9kGTGGl8bxBn4RgrWWU
 52/2149PB0y2ScMiqo+RHWjUYwx7aUhj3UiLUaqsStYQ5LQZ1lbXDgPOzzSf5o0JfW5tuag9PaW8N
 qtw7J6Ml0Jsq+gyjOOvSP6Q==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xCDId-009pZt-BC; Thu, 01 Oct 2026 11:41:59 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 0cba4a9d;
 Thu, 1 Oct 2026 09:41:58 +0000 (UTC)
Date: Thu, 1 Oct 2026 11:41:54 +0200
Message-ID: <20261001114154.GQ546191139491850@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20261001075427.539773-1-thomas.devoogdt@barco.com>
References: <20261001075427.539773-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/webkitgtk: also disable
 internal ccache in the build step
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
Content-Type: multipart/mixed; boundary="===============4587619341633984997=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4587619341633984997==
Content-Type: multipart/signed; boundary="WlD3mlZ4T67mNNfS"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--WlD3mlZ4T67mNNfS
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"; hp="clear"
Date: Thu, 1 Oct 2026 11:41:54 +0200
Message-ID: <20261001114154.GQ546191139491850@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/webkitgtk: also disable internal
 ccache in the build step
In-Reply-To: <20261001075427.539773-1-thomas.devoogdt@barco.com>
References: <20261001075427.539773-1-thomas.devoogdt@barco.com>
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLCBhbGwsCgpUaGFua3MgZm9yIHRoZSBmaXguCgpPbiBUaHUsIDAxIE9jdCAyMDI2
IDA5OjU0OjI2ICswMjAwIFRob21hcyBEZXZvb2dkdCA8dGhvbWFzQGRldm9vZ2R0LmNvbT4gd3Jv
dGU6Cj4gV0tfVVNFX0NDQUNIRT1OTyBpcyBvbmx5IHBhc3NlZCB0byB0aGUgY29uZmlndXJlIHN0
ZXAKPiAoV0VCS0lUR1RLX0NPTkZfRU5WKS4gRHVyaW5nIHRoZSBidWlsZCBzdGVwLCBuaW5qYSBj
YW4gcnVuIGNtYWtlIGFnYWluCj4gKGUuZy4gd2hlbiBhIGNtYWtlIGlucHV0IHN1Y2ggYXMgdG9v
bGNoYWluZmlsZS5jbWFrZSBjaGFuZ2VkKSwgYW5kIHRoYXQKPiBydW4gZG9lcyBub3QgaGF2ZSBX
S19VU0VfQ0NBQ0hFIHNldC4gV2ViS2l0J3MgV2ViS2l0Q0NhY2hlLmNtYWtlIHRoZW4KPiBzZXRz
IGNjYWNoZSBhcyBjb21waWxlciBsYXVuY2hlciBhZ2Fpbi4KPiAKPiBUaGF0IG91dGVyIGNjYWNo
ZSBydW5zIHdpdGhvdXQgdGhlIENDQUNIRV9CQVNFRElSIHRoYXQgdGhlIHRvb2xjaGFpbgo+IHdy
YXBwZXIgc2V0cyBmb3IgaXRzIG93biBjY2FjaGUgY2FsbCwgc28gdGhlIGNhY2hlIGtleXMgYW5k
IG1hbmlmZXN0cwo+IGNvbnRhaW4gYWJzb2x1dGUgcGF0aHMsIGFuZCB0aGUgZW50cmllcyBvbmx5
IG1hdGNoIGluIHRoZSBzYW1lIGNoZWNrb3V0Cj4gZGlyZWN0b3J5Lgo+IAo+IFBhc3MgV0tfVVNF
X0NDQUNIRT1OTyB0byB0aGUgYnVpbGQgc3RlcCB0b28uCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhv
bWFzIERldm9vZ2R0IDx0aG9tYXMuZGV2b29nZHRAYmFyY28uY29tPgoKQWNrZWQtYnk6IEFkcmlh
biBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKPiAtLS0KPiAgcGFja2FnZS93
ZWJraXRndGsvd2Via2l0Z3RrLm1rIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsgYi9w
YWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsKPiBpbmRleCBhMmNlYjUxNmFlNS4uMTRiZThj
MGNiYWEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4gKysr
IGIvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4gQEAgLTIyLDYgKzIyLDcgQEAgV0VC
S0lUR1RLX0NNQUtFX0JBQ0tFTkQgPSBuaW5qYQo+ICAjIEJ1aWxkcm9vdCBhZGRzIHN1cHBvcnQg
Zm9yIGNjYWNoZSB0aHJvdWdoIGl0cwo+ICAjIHRvb2xjaGFpbi13cmFwcGVyLCBzbyB0ZWxsIHdl
YmtpdGd0ayBub3QgdG8gbWVzcyB3aXRoIGl0Lgo+ICBXRUJLSVRHVEtfQ09ORl9FTlYgPSBXS19V
U0VfQ0NBQ0hFPU5PCj4gK1dFQktJVEdUS19CVUlMRF9FTlYgPSBXS19VU0VfQ0NBQ0hFPU5PCj4g
IAo+ICBXRUJLSVRHVEtfQ09ORl9PUFRTID0gXAo+ICAJLURFTkFCTEVfQVBJX1RFU1RTPU9GRiBc
Cj4gLS0gCj4gMi40My4wCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--WlD3mlZ4T67mNNfS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCar4q4gAKCRCRxVnb5MkS
O494AJ4/E7GNq9pTg/P/b4u/NVpF+VPQOgCfdnZnRhwOfZhwkRfpRRgtr9m5los=
=hVDd
-----END PGP SIGNATURE-----

--WlD3mlZ4T67mNNfS--

--===============4587619341633984997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4587619341633984997==--
