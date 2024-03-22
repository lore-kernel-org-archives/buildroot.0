Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D91CC54E71
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 08:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E095140432;
	Fri, 22 Mar 2024 08:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2YJw_gIoQHw; Fri, 22 Mar 2024 08:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8BB5404B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8BB5404B4;
	Fri, 22 Mar 2024 08:23:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA3BD1BF315
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 08:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3F034012E
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 08:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nk6J9Ka4xLle for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 08:23:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65B2740128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65B2740128
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65B2740128
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 08:23:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4B4C4CE1745;
 Fri, 22 Mar 2024 08:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62D3C433C7;
 Fri, 22 Mar 2024 08:23:21 +0000 (UTC)
Message-ID: <a043db624b2d3c57bf6f43c949b63e1b0d1dfbe9.camel@kernel.org>
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>, buildroot@buildroot.org
Date: Fri, 22 Mar 2024 10:22:56 +0200
In-Reply-To: <be88778f-53fc-493b-829a-2434ea0782ef@linux.ibm.com>
References: <20240321182126.24115-1-jarkko@kernel.org>
 <20240321182126.24115-3-jarkko@kernel.org>
 <be88778f-53fc-493b-829a-2434ea0782ef@linux.ibm.com>
User-Agent: Evolution 3.50.3-1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1711095802;
 bh=j9evZqEdLI7mAfMxBGUAuveEcXIk1uRM/Y3LJ9w0qAI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=RdlAb81ZehPsHxN5d1lwoImjhmMOi77cIYjK5a3tLb/E79xflBPMZtsasXdv6ii+8
 1EHqx7tNnsTQdn7krvrOurE40YZsPCofQR7qgIJ043Ayr8okpW5BJOw4u3G3tCcFrS
 2hQuUGM4jP7QDdtYJFAz9LLyS+Ytanfo3VDSB4P01QLUdk6Myp1CmCkqViaSGwDOCe
 ji3rOVSby6SrrgU02ikQZDQfamHQiSV3O5o/52qw8hGtw/jzgEqAxNI5wBxQFUJ6X+
 R6t2aAENlmBuppaoZvk6+38Zx0qsX8WU1p8ten2Agalov2tN+D8qn3x0oAGAQoD41l
 Q2uAuMHziDLsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RdlAb81Z
Subject: Re: [Buildroot] [PATCH RFC 2/2] package/swtpm: add host package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyMDI0LTAzLTIxIGF0IDE2OjMwIC0wNDAwLCBTdGVmYW4gQmVyZ2VyIHdyb3RlOgo+
IAo+IAo+IE9uIDMvMjEvMjQgMTQ6MjEsIEphcmtrbyBTYWtraW5lbiB3cm90ZToKPiA+IEFkZCBz
d3RwbSBhbmQgaXRzIGRlcGVuZGVuY3kgbGlidHBtcyB0byBob3N0IHBhY2thZ2VzLiBUaGVzZSBh
cmUKPiA+IHVzZWZ1bAo+ID4gZm9yIGVtdWxhdGluZyBUUE0gaW4gUUVNVSBlbnZpcm9ubWVudC4K
PiA+IAo+ID4gTGluazogaHR0cHM6Ly9naXRsYWIuY29tL2phcmtrb2pzL2xpbnV4LXRwbWRkLXRl
c3QKPiA+IFNpZ25lZC1vZmYtYnk6IEphcmtrbyBTYWtraW5lbiA8amFya2tvQGtlcm5lbC5vcmc+
Cj4gPiAtLS0KPiAKPiA+ICstLS0KPiA+ICsgY29uZmlndXJlLmFjIHwgMTYgKysrKysrKystLS0t
LS0tLQo+ID4gKyAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+ID4gKwo+ID4gK2RpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKPiA+
ICtpbmRleCA0OWNhZjk2Li40YWNjNzYzIDEwMDY0NAo+ID4gKy0tLSBhL2NvbmZpZ3VyZS5hYwo+
ID4gKysrKyBiL2NvbmZpZ3VyZS5hYwo+ID4gK0BAIC0zOTQsMjAgKzM5NCwyMCBAQCBBU19JRihb
dGVzdCAieCRlbmFibGVfZGVmYXVsdF9wY3JfYmFua3MiICE9Cj4gPiAieCJdLFsKPiA+ICsgcGNy
X2JhbmtfY2hlY2tzCj4gPiArIEFDX1NVQlNUKFtERUZBVUxUX1BDUl9CQU5LU10pCj4gPiArCj4g
PiArLUFDX1BBVEhfUFJPRyhbRVhQRUNUXSwgZXhwZWN0KQo+ID4gKy1pZiB0ZXN0ICJ4JEVYUEVD
VCIgPSAieCI7IHRoZW4KPiA+ICstCUFDX01TR19FUlJPUihbZXhwZWN0IGlzIHJlcXVpcmVkOiBl
eHBlY3QgcGFja2FnZV0pCj4gPiArLWZpCj4gPiArKyMgQUNfUEFUSF9QUk9HKFtFWFBFQ1RdLCBl
eHBlY3QpCj4gPiArKyMgaWYgdGVzdCAieCRFWFBFQ1QiID0gIngiOyB0aGVuCj4gPiArKyPCoAlB
Q19NU0dfRVJST1IoW2V4cGVjdCBpcyByZXF1aXJlZDogZXhwZWN0IHBhY2thZ2VdKQo+ID4gKysj
IGZpCj4gPiArCj4gPiArIEFDX1BBVEhfUFJPRyhbR0FXS10sIGdhd2spCj4gPiArIGlmIHRlc3Qg
IngkR0FXSyIgPSAieCI7IHRoZW4KPiA+ICvCoAlBQ19NU0dfRVJST1IoW2dhd2sgaXMgcmVxdWly
ZWQ6IGdhd2sgcGFja2FnZV0pCj4gPiArIGZpCj4gPiArCj4gPiArLUFDX1BBVEhfUFJPRyhbU09D
QVRdLCBzb2NhdCkKPiA+ICstaWYgdGVzdCAieCRTT0NBVCIgPSAieCI7IHRoZW4KPiA+ICstCUFD
X01TR19FUlJPUihbc29jYXQgaXMgcmVxdWlyZWQ6IHNvY2F0IHBhY2thZ2VdKQo+ID4gKy1maQo+
ID4gKysjIEFDX1BBVEhfUFJPRyhbU09DQVRdLCBzb2NhdCkKPiA+ICsrIyBpZiB0ZXN0ICJ4JFNP
Q0FUIiA9ICJ4IjsgdGhlbgo+ID4gKysjwqAJQUNfTVNHX0VSUk9SKFtzb2NhdCBpcyByZXF1aXJl
ZDogc29jYXQgcGFja2FnZV0pCj4gPiArKyMgZmkKPiAKPiAKPiBzb2NhdCBhbmQgZXhwZWN0IGFy
ZSB1c2VkIGZvciBydW5uaW5nIHRoZSB0ZXN0IGNhc2VzLiBXaGVuIG5vdAo+IHJ1bm5pbmcgCj4g
dGhlIHRlc3RzIHRoZW4gYW4gYWx0ZXJuYXRpdmUgdG8gY29tbWVudGluZyB0aGUgYWJvdmUgb3V0
IG1heSBiZSB0bwo+IGRvIAo+IHRoZSBmb2xsb3dpbmcgYmVmb3JlIHJ1bm5pbmcgYXV0b2dlbi5z
aDoKPiAKPiB0bXBkaXI9JChta3RlbXAgLWQpIHx8IGV4aXQgMQo+IGNwIC91c3IvYmluL3RydWUg
IiR7dG1wZGlyfS9zb2NhdCIKPiBjcCAvdXNyL2Jpbi90cnVlICIke3RtcGRpcn0vZXhwZWN0Igo+
IAo+IFBBVEg9JFBBVEg6JHt0bXBkaXJ9Cj4gLi9hdXRvZ2VuIC0tcHJlZml4PS4uLgo+IHJtIC1y
ZiAiJHt0bXBkaXJ9Igo+IAo+IMKgwqDCoMKgIFN0ZWZhbgoKLi4uIHdoaWNoIHdvdWxkIGJlIG1v
cmUgdGVkaW91cyB0aGFuIHNpbXBseSBjb21tZW50aW5nIHRoZW0gb3V0CmJlY2F1c2UgdGhlbiB5
b3Ugd291bGQgaGF2ZSB0byB0d2VhayB0aGUgYnVpbGQgaXRzZWxmIHdpdGggbWFudWFsCnN0ZXBz
IGluc3RlYWQgb2YgdXNpbmcgYXV0b3Rvb2xzIGJ1aWxkIGNvbW1hbmQuCgpVcCB1bnRpbCB0aGlz
IGlzIGZpeGVkIGluIHRoZSB1cHN0cmVhbSBwcm9qZWN0LCB3ZSBhcmUgYmV0dGVyIG9mZgpzaW1w
bHkgY29tbWVudGluZyB0aGVtIG91dCwgYXMgdGhleSBhcmUgdGVzdCBkZXBlbmRlbmN5LCBub3Qg
YSBidWlsZApkZXBlbmRlbmN5IGZvciBidWlsZGluZyBlLmcuIGluaXRyYW1mcyBpbWFnZSBvciBz
b21lIG90aGVyIHR5cGUgb2YKT1MgaW1hZ2UuCgpCUiwgSmFya2tvCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
