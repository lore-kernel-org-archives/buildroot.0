Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F467C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 08:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4762F80E52;
	Wed,  5 Feb 2025 08:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTeodDnu5nME; Wed,  5 Feb 2025 08:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E26280E22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E26280E22;
	Wed,  5 Feb 2025 08:30:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D476DCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B194141241
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_qIK-RIgkYx for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 08:30:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2C5541238
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2C5541238
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2C5541238
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:30:02 +0000 (UTC)
X-CSE-ConnectionGUID: HLoS2DyFTJi4cHIWI+MywA==
X-CSE-MsgGUID: 1/70dLqYQISmYhZw4fnMQg==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 09:30:00 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Feb 2025 09:29:59 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 5 Feb 2025 09:29:58 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 05 Feb 2025 09:29:57 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: Z/yUm8XYTXSgRP6D5EuZ7A==
X-CSE-MsgGUID: xq6IgT2ASaOT4cimPdk0SQ==
X-IronPort-AV: E=Sophos;i="6.13,260,1732575600"; d="scan'208";a="251409952"
Date: Wed, 5 Feb 2025 09:29:57 +0100
To: Arnout Vandecappelle <arnout@mind.be>
CC: Christian Stewart <christian@aperture.us>, Fiona Klute
 <fiona.klute@gmx.de>, Buildroot Mailing List <buildroot@buildroot.org>,
 Thomas Perale <thomas.perale@mind.be>
Message-ID: <Z6MhhfrgmRrtMhrB@yd-6wlzhs3>
References: <20250204143227.1233163-1-fiona.klute@gmx.de>
 <CA+h8R2odWOyS=7=9LGGkBGHYENiLHtkj76_L2Zvq_PHOFYs9sA@mail.gmail.com>
 <527da78c-270f-4ec6-8a6e-1210456517a5@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <527da78c-270f-4ec6-8a6e-1210456517a5@mind.be>
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX101.corporate.adroot.infra.ftgroup (10.115.26.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738744203; x=1770280203;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=+HpleiufY2SLtrZu91AXs0NceNkZZoGhLZ5aWQ6gfw0=;
 b=XNLTffj7RfdGfgJqwKSA4R4exgW7jIifjTHTdRMuhxEWB5ZyFLbbLDsq
 t0yHeAvhr4iuuh9nBaXDKxA3W5dBFP0ejtnMpXw1INDKlZaMggVj1e7gS
 tV8YuKOQMkY72o5kD3/CVa55/dBBmm9phjMGRWWgY8znzgP/EjlzmIgyz
 HVQMWthXJwpoQoH9Xw1G70X7zpKuSTRWJ7hfvMUbSn+/qrTZblDJ9QsK5
 O7uDfnoL/O2HWqV5489gcRhuZZ7X6ZGg7dxrkfEwz/4TWMUm2/QI6kazx
 q0wVvmymY2s712eqRzZzGxR9fu9bi6Cl+Rj4ERHSRsB6Bc25jmQckHzDx
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=XNLTffj7
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix build with
 toolchain without Gold linker
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJub3V0LCBGaW9uYSwgQ2hyaXN0aWFuLCBBbGwsCgpPbiAyMDI1LTAyLTA1IDA5OjAzICswMTAw
LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSBzcGFrZSB0aHVzbHk6Cj4gT24gMDQvMDIvMjAyNSAyMjoy
MywgQ2hyaXN0aWFuIFN0ZXdhcnQgd3JvdGU6Cj4gPiBPbiBUdWUsIEZlYiA0LCAyMDI1LCA2OjMy
4oCvQU0gRmlvbmEgS2x1dGUgPGZpb25hLmtsdXRlQGdteC5kZQo+ID4gPG1haWx0bzpmaW9uYS5r
bHV0ZUBnbXguZGU+PiB3cm90ZToKWy0tU05JUC0tXQo+ID4gICAgICtpZmVxICgkKEJSMl9hYXJj
aDY0KSx5KQo+ID4gICAgICsjIEdvIGZvcmNlcyB1c2Ugb2YgdGhlIEdvbGQgbGlua2VyIG9uIGFh
cmNoNjQgZHVlIHRvIGEgYnVnIGluIEJGRCB0aGF0Cj4gPiAgICAgKyMgaXMgZml4ZWQgaW4gQmlu
dXRpbHMgPj0gMi40MSAoc28gYWxsIHZlcnNpb25zIHByb3ZpZGVkIGJ5Cj4gPiAgICAgKyMgQnVp
bGRyb290KS4gRm9yY2luZyBHb2xkIHdpbGwgYnJlYWsgd2l0aCB0b29sY2hhaW5zIHRoYXQgZG9u
J3QKPiA+ICAgICArIyBwcm92aWRlIGl0LCBzbyBvdmVycmlkZSB0aGUgZmxhZyBhbmQgdXNlIEJG
RC4KPiA+ICAgICArIyBTZWU6IGh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vaXNzdWVzLzIy
MDQwIDxodHRwczovL2dpdGh1Yi5jb20vCj4gPiAgICAgZ29sYW5nL2dvL2lzc3Vlcy8yMjA0MD4K
PiA+ICAgICArQ09OVEFJTkVSRF9FWFRMREZMQUdTICs9IC1mdXNlLWxkPWJmZAo+ID4gICAgICtp
ZmVxICgkKEJSMl9UT09MQ0hBSU5fVVNFU19NVVNMKSx5KQo+ID4gICAgICsjIEdvIGV4ZSBidWls
ZCB3aXRoIFBJRSBkb2Vzbid0IHdvcmsgd2l0aCBtdXNsLgo+ID4gICAgICsjIFNlZTogaHR0cHM6
Ly9naXRodWIuY29tL2dvbGFuZy9nby9pc3N1ZXMvMTc4NDcgPGh0dHBzOi8vZ2l0aHViLmNvbS8K
PiA+ICAgICBnb2xhbmcvZ28vaXNzdWVzLzE3ODQ3Pgo+ID4gICAgICtDT05UQUlORVJEX0VYVExE
RkxBR1MgKz0gLVdsLC0tbm8tcGllCj4gPiAgICAgK2VuZGlmCj4gPiAgICAgK2VuZGlmClstLVNO
SVAtLV0KPiA+IFRoaXMgbG9va3MgZ29vZCB0byBtZS4gQnV0IHNob3VsZG4ndCB3ZSBhcHBseSB0
aGlzIG1vcmUgZ2VuZXJhbGx5IHRvCj4gPiBnby1zcmMgYW5kIGdvLWJpbj8gSXQncyB0cnVlIGZv
ciBhbGwgR28gcGFja2FnZXMgdGhhdCB3ZSBzaG91bGQgcGFzcwo+ID4gdGhlc2UgZmxhZ3Mgcmln
aHQ/IFdoeSBzcGVjaWZpY2FsbHkgY29udGFpbmVyZD8KWy0tU05JUC0tXQo+ICBZZXMgSSBhZ3Jl
ZSAtIHRoaXMgcGF0Y2ggKGFuZCBZYW5uJ3MgaW5mcmFzdHJ1Y3R1cmUgcGF0Y2ggdGhhdCB0aGlz
IHBhdGNoCj4gZGVwZW5kcyBvbikgc2hvdWxkIGJlIGluIHBrZy1nb2xhbmcgaW5zdGVhZCBvZiBh
biBpbmRpdmlkdWFsIHBhY2thZ2UuCgpOb3Qgc3VyZSBJIGVudGlyZWx5IGdyb2sgdGhhdC4gVGhl
IGNoYW5nZSBJIHN1Ym1pdHRlZCBpcyBpbiBwa2ctZ29sYW5nLAphcyBpdCBpcyBpbmZyYS4KClNv
LCBJIGd1ZXNzIHlvdSBvbmx5IGFjdHVhbGx5IHN1Z2dlc3RlZCBtb3Zpbmcgc2V0dGluZyAtZnVz
ZS1sZD1iZmQgYW5kCi1XbCwtLW5vLXBpZSBmbGFncyBpbnRvIHBrZy1nb2xhbmcsIHJpZ2h0PwoK
V2hlbiBJIGluaXRpYWxseSBuZWVkZWQgLWZ1c2UtbGQ9YmZkIGZvciBmaWxlYmVhdCwgSSBkaWQg
bm90IGZlZWwgdmVyeQpjb25maWRlbnQgdGhhdCB3ZSBzaG91bGQgZG8gaXQgdW5jb25kaXRpb25h
bGx5LiBJbmRlZWQsIG5vbmUgb2YgdGhlCntob3N0LSx9Z29sYW5nLXBhY2thZ2UgcGFja2FnZXMg
d2UgaGFkIGF0IHRoYXQgdGltZSBuZWVkZWQgaXQgYXQgYWxsLiBTbwpJIGNvbmNsdWRlZCB0aGF0
IGZpbGViZWF0IHdhcyBzcGVjaWFsIChpdCB3YXMgYWxyZWFkeSBzcGVjaWFsIGluIGEgZmV3Cm90
aGVyIHJlc3BlY3RzLCBzbyBtZWgpLgoKQW5kIHNpbmNlIEkgYW0gZmFyIGZyb20gYSBnbyBleHBl
cnQsIEkgaGF2ZSBubyBpZGVhIGhvdyBpbXBhY3RmdWwgc3VjaCBhCmNoYW5nZSB3b3VsZCBiZS4g
U28gSSB3YXMgYSBiaXQgc2tlcHRpY2FsIGF0IG1ha2luZyBpdCBwYXJ0IG9mIHRoZSBpbmZyYQpz
byB0aGF0IGl0IGFwcGxpZWQgdG8gYWxsIHBhY2thZ2VzLgoKU3RpbGwgdG9kYXksIG9ubHkgb25l
IHBhY2thZ2UgKGNvbnRhaW5lcmQpIGFjdHVhbGx5IG5lZWRzIGl0OyBpdCBpcwpzdGlsbCBhbiBl
eGNlcHRpb24uIFRodXMgX0lfIGFtIHN0aWxsIGEgbGl0dGxlIGJpdCBza2VwdGljYWwgdGhhdCB0
aGlzCnNob3VsZCBiZSBtb3ZlZCBpbnRvIHRoZSBpbmZyYS4KCkJ1dCBpZiBDaHJpc3RpYW4sIG91
ciBlcmVzaWRlbnQgZ28gZXhwZXJ0LCBzYXlzIHdlIHNob3VsZCBnbyBmb3IgaXQsCnRoZW4gbGV0
J3MgZG8gaXQuCgpTdGlsbCwgSSBiZWxpZXZlIHRoZXJlIHNob3VsZCBiZSBhIHdheSBmb3IgcGFj
a2FnZXMgdG8gYmUgYWJsZSB0byBwYXNzCmFyYml0cmFyeSBleHRsZGZsYWdzLCBhbmQgdGh1cyB0
aGUgdmFyaWFibGUgc2hvdWxkIGJlIGV4cG9zZWQuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoK
LS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX19fX18K
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tOiAgICAgICBfICAgIDotLS0t
LS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwg
ICAgX18vICkgICB8IC8iXCBBU0NJSSBSSUJCT04gfAp8ICAgICAgICAgICAgICAgICB8IFNvZnR3
YXJlICBEZXNpZ25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKfCArMzMgNjM4
LjQxMS4yNDUgJy0tLS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAgICBgLS0sIHwgIFggIEFHQUlOU1Qg
ICAgICB8CnwgeWFubi5tb3JpbiAoYXQpIG9yYW5nZS5jb20gICAgICAgICAgIHxfPSIgICAgLC0t
JyB8IC8gXCBIVE1MIE1BSUwgICAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS06X19fX19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KQ2UgbWVzc2FnZSBldCBzZXMgcGll
Y2VzIGpvaW50ZXMgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNvbmZpZGVudGll
bGxlcyBvdSBwcml2aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jDQpwYXMgZXRyZSBkaWZmdXNl
cywgZXhwbG9pdGVzIG91IGNvcGllcyBzYW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBhdmV6IHJl
Y3UgY2UgbWVzc2FnZSBwYXIgZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWduYWxlcg0KYSBsJ2V4cGVk
aXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4gTGVzIG1l
c3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwNCk9y
YW5nZSBkZWNsaW5lIHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBldGUgYWx0
ZXJlLCBkZWZvcm1lIG91IGZhbHNpZmllLiBNZXJjaS4NCg0KVGhpcyBtZXNzYWdlIGFuZCBpdHMg
YXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3Jt
YXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsNCnRoZXkgc2hvdWxkIG5vdCBiZSBk
aXN0cmlidXRlZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLg0KSWYgeW91
IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2Vu
ZGVyIGFuZCBkZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMuDQpBcyBlbWFp
bHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0
IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuDQpUaGFuayB5b3UuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
