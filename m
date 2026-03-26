Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB86106F318
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 10:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9118A40B86;
	Thu, 26 Mar 2026 10:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AO8-4bD-ukXd; Thu, 26 Mar 2026 10:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1CF740B3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774520105;
	bh=dsvziWXfvjlzLo0ORU04FamjStADau39pymmluW8mIs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LrGImhGViknEh17lWC3u39nePOOuopIChSnjYupxpgsxI8vXbDGNQmX5IFC6HG8z4
	 x/4noIBeMqk+X7lGpgw5OLZu5KB5LByKJ1KaX9vvIW7OdMcP3hA4X48ILHucJSlTCg
	 BTh04VBrIKSPjTFs6Za3MH3iHEhN0VTQ2mEK24GQSorEsp257Yy+L04uIBqdoftFly
	 eaj+VvMskPphCs4DFI7VFUbo4W9OuaEjjpJb7ZkOKpUQaK9s36tr2hYc7afrWCqOYo
	 yK6kxJUGoA0rDODKgCHDg1y7ejv5hgvdzsdMO+omODDo60MJH/8H9HtQ6yRFA3PLdj
	 nWMMUn9uCvb7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1CF740B3E;
	Thu, 26 Mar 2026 10:15:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7F4A353
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 10:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9B81814C6
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 10:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQgTTBs_TIIP for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 10:15:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.11.138.130;
 helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C4548814BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4548814BC
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4548814BC
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 10:15:01 +0000 (UTC)
To: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Date: Thu, 26 Mar 2026 11:14:59 +0100
Message-ID: <3936876.kQq0lBPeGt@phil>
In-Reply-To: <d728395d-316b-4ab6-be7e-bba218dcf31a@cherry.de>
References: <20260325150346.414826-1-heiko@sntech.de>
 <d728395d-316b-4ab6-be7e-bba218dcf31a@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=0amiXQtoJIwvvZUQTmTpNLbBN9tMtjLlQrN/kdlM2co=; b=KqoVDX3IULu8sZfmatnH0KjZaI
 I3z8oWtWLxopmQjSxFxnyPLQSEK13zuY3k28zUAlHpn3y7adaA/DFdzw4wqC8u6GZcmFZ157B9JaY
 4XgskXZPpjIK6oQxeRRIL66StVUk9H328AATC7y9l8C4h4OgYNGTanAlIGsk3UfCJTG66/cM6YnJN
 BPEfduE5dNGDvBX++lmADmiZ1IpgmhWSR/kRGha+WRARvo5TAv2fHX+AmoiJ8wszDxCTfqDzfyHcR
 KJZhrmI4IHI6yTvgxumt3ZpFlIDsWQhyvR7TJWNJPBBi/fAbSNDuExihiKGVMAA4BydFWTRAnY2jd
 NCiDgFyQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sntech.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256
 header.s=gloria202408 header.b=KqoVDX3I
Subject: Re: [Buildroot] [PATCH] package/arm-trusted-firmware: add
 ARM_TRUSTED_FIRMWARE_CPE_ID_*
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
From: Heiko Stuebner via buildroot <buildroot@buildroot.org>
Reply-To: Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gTWl0dHdvY2gsIDI1LiBNw6RyeiAyMDI2LCAxOToxMjozMyBNaXR0ZWxldXJvcMOkaXNjaGUg
Tm9ybWFsemVpdCBzY2hyaWViIFF1ZW50aW4gU2NodWx6Ogo+IEhpIEhlaWtvLAo+IAo+IE9uIDMv
MjUvMjYgNDowMyBQTSwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6Cj4gPiBGcm9tOiBIZWlrbyBTdHVl
Ym5lciA8aGVpa28uc3R1ZWJuZXJAY2hlcnJ5LmRlPgo+ID4gCj4gPiBUcnVzdGVkLUZpcm13YXJl
IGhhcyBiZWVuIHVzaW5nIGEgbnVtYmVyIG9mIENQRSBpZGVudGlmaWVycyBpbiB0aGUgcGFzdAo+
ID4gYnV0IGVzcGVjaWFsbHkgYWZ0ZXIgdjIuNCwgdGhlIGNvcnJlY3QgaWRlbnRpZmllciB3b3Vs
ZCBiZSBzaW1pbGFyCj4gPiB0byBjcGU6Mi4zOm86YXJtOnRydXN0ZWRfZmlybXdhcmUtYToyLjEy
OnJjMDoqOio6LToqOio6Kgo+ID4gCj4gPiAgICBodHRwczovL252ZC5uaXN0Lmdvdi9wcm9kdWN0
cy9jcGUvZGV0YWlsLzY1REVDMjMwLTFDRDUtNDBEQi05MDNBLTIyNTM3RDFFNDRGRQo+ID4gCj4g
PiBBZGQgdGhlIHJlbGV2YW50IENQRSBmaWVsZHMgdG8gdGhlIHRydXN0ZWQtZmlybXdhcmUgcGFj
a2FnZS4KPiA+IAo+IAo+IFRoaW5raW5nIGFib3V0IGl0IGEgYml0IG1vcmUsIEkgKip0aGluayoq
IHdlIG1heSB3YW50IHRvIHN0cmlwIGx0cy0gCj4gcHJlZml4IGZvciB0aGUgQ1BFX0lEX1ZFUlNJ
T04uIEkgZG9uJ3Qgc2VlIGFueSB2ZXJzaW9uIHBhc3QgMi40IG9uIE5WRCAKPiBzbyB3ZSBjYW5u
b3QgcmVhbGx5IGtub3cgd2hhdCB0aGV5J2xsIGRvIG9uY2UgdGhleSBuZWVkIHRvIHRhY2tsZSBM
VFNlcywgCj4gYnV0IEkgYW0gYXNzdW1pbmcgdGhleSBhcmUgTk9UIGdvaW5nIHRvIHVzZSB0aGUg
bHRzLSBwcmVmaXg/Cj4gCj4gV2hhdCBkbyB5b3UgdGhpbms/CgpJIHRoaW5rIHlvdSdyZSBxdWl0
ZSByaWdodCA6LSkgLgoKSSBhbHNvIHJlYWxpemVkIEkgbWVzc2VkIHRoZSB2ZXJzaW9uaW5nIGFu
eXdheSBhbmQgZGlkIG5vdCByZW1vdmUKdGhlICJ2IiB0byBtYXRjaCB0aGUgdmVyc2lvbiB1c2Vk
IGluIENQRXMuCgpEb25lIGJvdGggbm93IGluIHYyLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3Ckhl
aWtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
