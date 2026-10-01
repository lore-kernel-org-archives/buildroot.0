Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD86DCA5FA5
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 09:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42E674085B;
	Thu,  1 Oct 2026 09:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CD9cMR-ukuzf; Thu,  1 Oct 2026 09:42:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 568C24083D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790847760;
	b=Mg7LUbb11atT8p86NlD1ahwHnoQSfuSJ/xCcrPq0Y6K9Mlr3GkcwENUmvjz2Av07SacB
	 JTr36VGCVCVPkSqi6Lkv58Si/Q43Th+A0Hz65bS9052VeCMvbPRD5LrunHj6YklKL7ddw
	 yGsNoCKQHDIBW/jGtuz4Lvn1/GjQGTHXdUvv5uK5As+JMEt9cZlH9JerU4KaoOXSDU7Aa
	 WG+n6NzCLKtsZlXfYL9lTDSaZatstt/h6puvVUcn8zRrxlCFLMcN3Ngd6DFvXrTOtHZzX
	 C9iWbsp2l3ljaPjW3CTgz7soPi4xQxKnN6HtVOt/7dUhoOZj2AS1DLnNnxHNIEuI9VQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790847760;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=uXHsjJiCrbQ7w3PSuoLJR3DGUGp+0/VnK16iB/BB4qE=;
	b=sFu4mo7mMMVKYeFblwo9Q+clOjJZrNzxLMcXolfxSTmeVQEgn9kuz0oq82by6FVhhR4M
	 QJbicVmZbzTcc2sxw3CX9MKMEe2+D8IVm1rsvMxW9eFZmUn88rvTnPVJq39dpt5aQOuC+
	 3uOyEj7/+4DoqLsaaLbhajMOnWdbjoP1OgDD/ZM3mq550GFWo0oHOv2mqSuRS3f49hV6S
	 XR0U518GIgVu/F/N2jlHMBAsquMgT0ICmo+Tj6doG5gB1u2oOu7KBSLeURzFywKLigzz/
	 AwigRx6BnMeqBygJg3i/ZJLCe520jLuBtDDFZuP9y93yvGagw61voNZnmosPgUzCkPA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790847760;
	bh=uXHsjJiCrbQ7w3PSuoLJR3DGUGp+0/VnK16iB/BB4qE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bqqLfqDAffx4qLlDsJ1bJe3WExop0SG2QddQZ0Tw6EkZdF4MZIwlfCDP0tACl8iQ2
	 4KAGVkBsDVb/xwwX5AffN/PLXshlg6m9VnsZMYauHoMWUdCUmHSDXlppV9gMSK97Tw
	 9CoXOpXPaYPiBemVNfGlx7vMcKzrf8f+I1NGX0D1kZWqQ2qkEVrDLfb8HGxhDXwff5
	 XIrOg132sT8RXLHCj15cbXWyTZW0OHIj1Pg0pNTLyQQsNjAW9RyiZilRv+/wtYp7qM
	 qTa3QaO68npPGCofRqVyP4iUTsNt/JWaUGUw4zwc/iioSHFKxBF3oZG6ozooRe088l
	 RaF//WWinDoPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 568C24083D;
	Thu,  1 Oct 2026 09:42:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E502A4C2
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 09:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D14A7404FC
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 09:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8stbjp4lI7P for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 09:42:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CD6E7404F8
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790847755;
 b=iZHYLEB23HqqiqtDMIsptn3vn9218LIWlKHqjrViAyQwdxVa4Lbd2HK70M7e1plWPS+H
 P6oN/QLQrUFMuMDcqSOpnlO2vSSNiYYW0QcUapRgU3CBjZUJ+2sU3AYy1ENCkU1DN0qVK
 EWPCRX6v1zMdQ62zqH4O9juefGhCWApg+YxYJgJfZXg9X7EAyi/9kwU025WEL1+t3YEBg
 /4Eq+Ss8thxibshTOZTM3/1KE5nfYAtEReS08W3BIKmBpTXha1AAYtaS6DgZARavJMudB
 Wyw2OrRbf4YL1KDAnDLBVwsqwlxavl8/my8MeD7O0SPbyM9GfnmQwsbGvupuCOphMRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790847755;
 h=Received-SPF:DKIM-Signature:Received:Received:Date:Message-ID:From:
 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type;
 bh=IID57G+UW76v231htGvzmQq6o/nV6+is2kgIuuVXJrI=;
 b=caxPhNRLOcCawmE2d84Y+ja52s9uZnP8XuDmYgVHuDcn9PoeNmEiUKff+9Y4AvRz+wFI
 4wRdX6pp4dij6buyJWvcGgF6gxEdC9IMaod5DOSlNWPtelVxS3CeLr07c5g2T+GTYfuln
 sASsqbhwPciyKDnlyiQFnARm3Z2JxW9MgY82GJIwNuinjoZfukKNgjwoOSrBgFrGxv1oo
 RuKLH6bJWxrkDwPCpYc08SYac0Nj+3F24RoUzOg/BpiMhExoAt9HibVkjlwngqjSwkEsm
 jderRNL5qppRKT2S60O/csKDYrNwyt706F2yInZXTncF+NznyzmTrOS9Q8PArv306Lw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=igalia.com; 
 dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=N7a+iR3d; 
 arc=none smtp.remote-ip=213.97.179.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=N7a+iR3d
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD6E7404F8
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 09:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Subject:Cc:To:From:Message-ID:Date:
 From:Reply-To; bh=IID57G+UW76v231htGvzmQq6o/nV6+is2kgIuuVXJrI=; b=N7a+iR3dDQo
 UvyP9Quu+yhK1nJuoxDwhXnAqqwslgRtNsvaiqYzSHBfx0IgopHhfPysT2S8WBj/e4MEDxttvEA1K
 5Hrm9Wp8E5t4FVPJ7KwYguCatb1waSyJ7dOoBqkz0ioti0J3DjZxcKl2lhOWjS1/DwIj6RdBxcPfT
 mm/29P3mYf0LK/+uMpiJoOjdbM0PILTpoo9fJehjfBBo8blaPNxET7hWQGE2Ss8AbLfPo6/0uAdAN
 A3FsjMlS6Y9zLB8VxbMcBGxVAx0e5c1W6dFyKCchIazZDbdvOfo7U+gplAUoLVK6XYNAmtUCqwNwZ
 4BFCVdXEWdOXeu1jwFqDf9A==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xCDJ9-009paK-SB; Thu, 01 Oct 2026 11:42:31 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 5f7a773e;
 Thu, 1 Oct 2026 09:42:31 +0000 (UTC)
Date: Thu, 1 Oct 2026 11:42:31 +0200
Message-ID: <20261001114231.GI147375695642345@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20261001075427.539773-2-thomas.devoogdt@barco.com>
References: <20261001075427.539773-1-thomas.devoogdt@barco.com>
 <20261001075427.539773-2-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/wpewebkit: also disable
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
Content-Type: multipart/mixed; boundary="===============0548292439515714793=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0548292439515714793==
Content-Type: multipart/signed; boundary="8tZOtg3WDqlGdMLi"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--8tZOtg3WDqlGdMLi
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"; hp="clear"
Date: Thu, 1 Oct 2026 11:42:31 +0200
Message-ID: <20261001114231.GI147375695642345@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/wpewebkit: also disable internal
 ccache in the build step
In-Reply-To: <20261001075427.539773-2-thomas.devoogdt@barco.com>
References: <20261001075427.539773-1-thomas.devoogdt@barco.com>
 <20261001075427.539773-2-thomas.devoogdt@barco.com>
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLCBhbGwsCgpUaGFua3MgZm9yIHRoZSBmaXguCgpPbiBUaHUsIDAxIE9jdCAyMDI2
IDA5OjU0OjI3ICswMjAwIFRob21hcyBEZXZvb2dkdCA8dGhvbWFzQGRldm9vZ2R0LmNvbT4gd3Jv
dGU6Cj4gV0tfVVNFX0NDQUNIRT1OTyBpcyBvbmx5IHBhc3NlZCB0byB0aGUgY29uZmlndXJlIHN0
ZXAKPiAoV1BFV0VCS0lUX0NPTkZfRU5WKS4gRHVyaW5nIHRoZSBidWlsZCBzdGVwLCBuaW5qYSBj
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
cGV3ZWJraXQvd3Bld2Via2l0Lm1rIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsgYi9w
YWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsKPiBpbmRleCAxZjVmNGFhNWU2NC4uYzQyNGEz
YzRiOTIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93cGV3ZWJraXQvd3Bld2Via2l0Lm1rCj4gKysr
IGIvcGFja2FnZS93cGV3ZWJraXQvd3Bld2Via2l0Lm1rCj4gQEAgLTI0LDYgKzI0LDcgQEAgV1BF
V0VCS0lUX0NNQUtFX0JBQ0tFTkQgPSBuaW5qYQo+ICAjIEJ1aWxkcm9vdCBhZGRzIHN1cHBvcnQg
Zm9yIGNjYWNoZSB0aHJvdWdoIGl0cwo+ICAjIHRvb2xjaGFpbi13cmFwcGVyLCBzbyB0ZWxsIHdw
ZXdlYmtpdCBub3QgdG8gbWVzcyB3aXRoIGl0Lgo+ICBXUEVXRUJLSVRfQ09ORl9FTlYgPSBXS19V
U0VfQ0NBQ0hFPU5PCj4gK1dQRVdFQktJVF9CVUlMRF9FTlYgPSBXS19VU0VfQ0NBQ0hFPU5PCj4g
IAo+ICBXUEVXRUJLSVRfQ09ORl9PUFRTID0gXAo+ICAJLURQT1JUPVdQRSBcCj4gLS0gCj4gMi40
My4wCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--8tZOtg3WDqlGdMLi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCar4rBwAKCRCRxVnb5MkS
OyMvAJ9QXiteHJliJpBGU/ZhavFFw/kF3ACcCRVJsBAHhxSjWWnxAfdHV5lMvA0=
=Wm6m
-----END PGP SIGNATURE-----

--8tZOtg3WDqlGdMLi--

--===============0548292439515714793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0548292439515714793==--
