Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77313C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ABC34180F;
	Fri, 16 May 2025 10:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQxhLBMXsDwW; Fri, 16 May 2025 10:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81C9A4183C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81C9A4183C;
	Fri, 16 May 2025 10:50:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7688E13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BEF460B6D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mdppl6sO8iJ for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:50:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DEAB60AF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DEAB60AF3
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DEAB60AF3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:50:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A1AFF1C0FC0; Fri, 16 May 2025 12:50:11 +0200 (CEST)
Message-ID: <b8e70cc7-310f-447f-a9e3-de3e60bb6b22@rnout.be>
Date: Fri, 16 May 2025 12:50:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>
References: <20250311095831.825806-1-salvador.joseluis@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250311095831.825806-1-salvador.joseluis@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392611; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2Nw108lsoWQNlsLxf26YF64FaBSOurwNTzVzpu5b55c=;
 b=WqpdWipn8zV78FnKpiseglotr0YkIGD168dp6qZRqLuN4/2BNHTXcx8LjRDR7lAwvooFMR
 VamIdIMpKLuEPCN/iH3UJl5rn9mn/ULPoMfDdiAu5PyC+bXSgtlcnTJmbw5OXWSDwc++Y7
 FlrL+hot57bIXudff7Zk8eBsICIDSsZWvMguYBH4RbAAdUZs17kVih5uCDvgVoplQr9gEl
 4knliYV5SYDnIu0+DKkh22poeBTOjuby6qM28qhzegpkdG5Zi6/ux9osUaEIKvstpIXlst
 Frb3lpxqWcZoOUcUWNT985rS4t9GXY5MJh4aoCVgkTUHWg+QpDoyfta/6r2O2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WqpdWipn
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.3.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMS8wMy8yMDI1IDEwOjU4LCBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gd3JvdGU6Cj4g
Rm9yIHJlbGVhc2Ugbm90ZSwgc2VlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9y
ZWxlYXNlcy90YWcvemZzLTIuMy4xCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2
YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+CgogIEFwcGxpZWQgdG8gMjAy
NS4wMi54LCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2FnZS96
ZnMvemZzLmhhc2ggfCA0ICsrLS0KPiAgIHBhY2thZ2UvemZzL3pmcy5tayAgIHwgMiArLQo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5oYXNoIGIvcGFja2FnZS96ZnMvemZzLmhhc2gKPiBp
bmRleCAxODRjZTI3YjBiLi4zNjQwOTYzYmRiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvemZzL3pm
cy5oYXNoCj4gKysrIGIvcGFja2FnZS96ZnMvemZzLmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAt
IyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9yZWxlYXNlcy9kb3dubG9hZC96
ZnMtMi4zLjAvemZzLTIuMy4wLnNoYTI1Ni5hc2MKPiAtc2hhMjU2ICA2ZTg3ODdlYWI1NWYyNGM2
YjljMzE3ZjNmZTliMGRhOWE2NjVlYjM0YzMxZGY4OGZmMzY4ZDlhOTJlOTM1NmE2ICB6ZnMtMi4z
LjAudGFyLmd6Cj4gKyMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFz
ZXMvZG93bmxvYWQvemZzLTIuMy4xL3pmcy0yLjMuMS5zaGEyNTYuYXNjCj4gK3NoYTI1NiAgMDUz
MjMzNzk5Mzg2OTIwYmRjNjM2ZTIyZDBlMTlhOGMyYzNlNjQyZThiZDg0N2ZmODdlMTA4ZjhiYjFm
OTAwNiAgemZzLTIuMy4xLnRhci5nego+ICAgCj4gICAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZXM6
Cj4gICBzaGEyNTYgIDFmZmI3MGMzM2M0Zjc5ZjA0ZTk0N2ZhY2M1Yzc4NTFmMjg5NjA5MjU2YWFj
YjQ3ZmMxMTVmNzAwNDI3ZDk1MjAgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMv
emZzLm1rIGIvcGFja2FnZS96ZnMvemZzLm1rCj4gaW5kZXggNGJiMzJjMmFlOS4uYjJlZGViMTI2
OCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3pmcy96ZnMubWsKPiArKysgYi9wYWNrYWdlL3pmcy96
ZnMubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gICAKPiAtWkZTX1ZFUlNJT04gPSAyLjMuMAo+ICtaRlNfVkVSU0lPTiA9IDIuMy4xCj4gICBa
RlNfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9yZWxlYXNlcy9kb3dubG9h
ZC96ZnMtJChaRlNfVkVSU0lPTikKPiAgIFpGU19TRUxJTlVYX01PRFVMRVMgPSB6ZnMKPiAgIFpG
U19MSUNFTlNFID0gQ0RETAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
