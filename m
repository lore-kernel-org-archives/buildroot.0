Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEE8CD5BD5
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 05:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 448B1428D4;
	Thu, 28 May 2026 05:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74G3q03Lndh3; Thu, 28 May 2026 05:20:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BA634290F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779945626;
	bh=sNKOpWzft+15doti56gL2MSfCKR5KHPLMqcfQvxTbiI=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dGHIQjy2UAOHduSTSzDLx7QZUb/wBcjIlppBR4sNH0q9iOTMtSWi6P8pzptWCuAFh
	 joqxi7sTZDRvp2eGAJ2HlpVXeKNel6DB3Ns8DWcmC3f0t2iIF31BShVwGEO04dyIvH
	 8Tj/J54T3YpUG119VbYaSd7tDXL+auf0cQmQ+6TwmBmAQWXyTn7H+/QZ6yY0fbZy0n
	 DbWcihKYWmvHbqtc1OHpm7HJq2Mhyp3rma/7vzLLJ9Fn/7KQ3u66AybfjiqO5aaeAf
	 xhEleEtv/EnViTU8YVI8Vk/aZE7eZlwt5asFo3cROMZPOv3cGQoH0fhmj72J7Wheke
	 LHupKGAdqlbNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BA634290F;
	Thu, 28 May 2026 05:20:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0BF92E9
 for <buildroot@buildroot.org>; Thu, 28 May 2026 05:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B298C84A9C
 for <buildroot@buildroot.org>; Thu, 28 May 2026 05:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XWZfSQjpQoB for <buildroot@buildroot.org>;
 Thu, 28 May 2026 05:20:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 400D184A99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 400D184A99
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 400D184A99
 for <buildroot@busybox.net>; Thu, 28 May 2026 05:20:22 +0000 (UTC)
X-CSE-ConnectionGUID: 7HFtqcf5QEmDKUt6PZdegQ==
X-CSE-MsgGUID: SaiHLPxBTGm4LlqQZ4xC3Q==
Received: from unknown (HELO opfedv3rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 28 May 2026 07:20:20 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 07:20:20 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 28 May 2026 07:20:18 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 28 May 2026 07:20:18 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: krLj1hc+TLayZ6VL2o+qDQ==
X-CSE-MsgGUID: yVoiG9/QT3qqi40UxUIApQ==
X-IronPort-AV: E=Sophos;i="6.24,172,1774306800"; d="scan'208";a="428401329"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Thu, 28 May 2026 07:20:18 +0200
To: Francois Perrad <francois.perrad@gadz.org>
CC: <buildroot@busybox.net>
Message-ID: <ahfQknAvd8yk3qJn@yd-6wlzhs3>
References: <20260512184826.330381-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512184826.330381-1-francois.perrad@gadz.org>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX607.corporate.adroot.infra.ftgroup
 (10.115.27.31) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1779945623; x=1811481623;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=HaK0PpXgpvE5LCG/oPL1OwS2VzAw6DZL3ylfs98leXc=;
 b=XIkkhHSa+iZ9rTV0TWq2gfMjTbeb8EDeB/1mvlpKuLOQjKqv8NyVvPLQ
 BDk/xFBtloGygsc65P6RzmdzOa3vpdBKYgwtD64J6RXPvp1sOqQCNutsB
 ZgKQWArKIhEhd7VszHAc1MSO4fu4w4xQvqCyujpjYzR899ZKj+UsY4TEv
 Cjn/VxjU5R0AiwfT55gql+5idl4S/LO2IEPw8Wgi1aEyJ0qKEzCPC6+Mg
 YCkiDMmOLmRS8dca48ZIRcHjlaQi6HYl/YvHicqZez3dsxZJVLPE4ReSm
 FfYfYTWQEGISXc1BbRMDgaKBrCWNHTeMGK8wD9plLdxdv9DM8hONvnl2J
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=XIkkhHSa
Subject: Re: [Buildroot] [PATCH v2] package/opendoas: fix permissions
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI2LTA1LTEyIDIwOjQ4ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMg
UGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+CgpSZXZpZXdlZC1ieTogWWFubiBFLiBN
T1JJTiA8eWFubi5tb3JpbkBvcmFuZ2UuY29tPgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4g
LS0tCj4gIHBhY2thZ2Uvb3BlbmRvYXMvb3BlbmRvYXMubWsgfCA2ICsrKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2Uvb3BlbmRvYXMvb3BlbmRvYXMubWsgYi9wYWNrYWdlL29wZW5kb2FzL29wZW5kb2Fz
Lm1rCj4gaW5kZXggMDY2MjY1MDhmLi40ZjM2ZDIwY2EgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9v
cGVuZG9hcy9vcGVuZG9hcy5tawo+ICsrKyBiL3BhY2thZ2Uvb3BlbmRvYXMvb3BlbmRvYXMubWsK
PiBAQCAtNTAsMTAgKzUwLDE0IEBAIGRlZmluZSBPUEVORE9BU19CVUlMRF9DTURTCj4gIGVuZGVm
Cj4gIAo+ICBkZWZpbmUgT1BFTkRPQVNfSU5TVEFMTF9UQVJHRVRfQ01EUwo+IC0JJChJTlNUQUxM
KSAtRCAtbSAwNzU1ICQoQEQpL2RvYXMgJChUQVJHRVRfRElSKS91c3IvYmluL2RvYXMKPiArCSQo
SU5TVEFMTCkgLUQgJChARCkvZG9hcyAkKFRBUkdFVF9ESVIpL3Vzci9iaW4vZG9hcwo+ICAJJChP
UEVORE9BU19JTlNUQUxMX1BBTV9DT05GKQo+ICBlbmRlZgo+ICAKPiArZGVmaW5lIE9QRU5ET0FT
X1BFUk1JU1NJT05TCj4gKwkvdXNyL2Jpbi9kb2FzIGYgNDc1NSAwIDAgLSAtIC0gLSAtCj4gK2Vu
ZGVmCj4gKwo+ICAjIE5PVEU6IEV2ZW4gdGhvdWdoIHRoaXMgcGFja2FnZSBoYXMgYSAiY29uZmln
dXJlIiBzY3JpcHQsIGl0IGlzIG5vdAo+ICAjIGdlbmVyYXRlZCB1c2luZyBhdXRvdG9vbHMsIHNv
IHdlIGhhdmUgdG8gdXNlIHRoZSBnZW5lcmljIHBhY2thZ2UKPiAgIyBpbmZyYXN0cnVjdHVyZS4K
PiAtLSAKPiAyLjQzLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19f
X19fX18KLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tOiAgICAgICBfICAg
IDotLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgICAgX18vICkgICB8IC8iXCBBU0NJSSBSSUJCT04gfAp8ICAgICAgICAgICAgICAgICB8
IFNvZnR3YXJlICBEZXNpZ25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKfCAr
MzMgNjM4LjQxMS4yNDUgJy0tLS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAgICBgLS0sIHwgIFggIEFH
QUlOU1QgICAgICB8CnwgeWFubi5tb3JpbiAoYXQpIG9yYW5nZS5jb20gICAgICAgICAgIHxfPSIg
ICAgLC0tJyB8IC8gXCBIVE1MIE1BSUwgICAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS06X19fX19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KQ2UgbWVzc2FnZSBldCBz
ZXMgcGllY2VzIGpvaW50ZXMgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNvbmZp
ZGVudGllbGxlcyBvdSBwcml2aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jDQpwYXMgZXRyZSBk
aWZmdXNlcywgZXhwbG9pdGVzIG91IGNvcGllcyBzYW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBh
dmV6IHJlY3UgY2UgbWVzc2FnZSBwYXIgZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWduYWxlcg0KYSBs
J2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4g
TGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlv
biwNCk9yYW5nZSBkZWNsaW5lIHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBl
dGUgYWx0ZXJlLCBkZWZvcm1lIG91IGZhbHNpZmllLiBNZXJjaS4NCg0KVGhpcyBtZXNzYWdlIGFu
ZCBpdHMgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQg
aW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsNCnRoZXkgc2hvdWxkIG5v
dCBiZSBkaXN0cmlidXRlZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLg0K
SWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMuDQpB
cyBlbWFpbHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdl
cyB0aGF0IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuDQpUaGFuayB5
b3UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
