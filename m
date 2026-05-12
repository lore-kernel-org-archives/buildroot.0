Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B5ACD4851
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BD4A60DB2;
	Tue, 12 May 2026 14:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPrvuRG8rVDG; Tue, 12 May 2026 14:16:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 583C160DAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778595379;
	bh=oD8einF9YhHuwKpn4vKySIsC5ehn0+EZZhByTJvepJg=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aoqUWRL2Cc11Xk7b+/oN+X3rwuLHgKy7XWbuJNETxHfJjXFSqdy2pMXsASYp+rcPf
	 ScZPdHVs3DPjwKobIkFp0nnuTy7nAYC9Ockckj1rz5q6i5FKM4ZCdwXDrEKUEYJTsW
	 xAg/SalCn1ZZprz+56ih+4L+VDhkJl7x0KXXmtU3Vh/nAuiSb6yu7WQ3rhTTAXSbM5
	 9eKWWtS0pJDSa/T/4t7VSpP0VCsgtqf79pM2Juo92Tqssvb5Q6QZkRAOt0YiaiqpPj
	 2cRUN+6DG5w+PrCZRI7Mc+K7s+QhiWApPaL0uG3FadkIEsJYabz7QmE34QI7Jnw5SY
	 XKZK6ukmnlG0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 583C160DAA;
	Tue, 12 May 2026 14:16:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 689F015F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A031822C0
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PSOao4p9JjE for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:16:17 +0000 (UTC)
X-Greylist: delayed 431 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 12 May 2026 14:16:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 055B0822BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 055B0822BF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 055B0822BF
 for <buildroot@busybox.net>; Tue, 12 May 2026 14:16:16 +0000 (UTC)
X-CSE-ConnectionGUID: EmnT+M3mRzWqhtt25A8ZpA==
X-CSE-MsgGUID: UuYsRO81TJi9GunsdNHpIA==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 12 May 2026 16:09:03 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 16:09:03 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Tue, 12 May 2026 16:09:01 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 12 May 2026 16:09:01 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: pFFBCjE8T26F8J2wfIaqTw==
X-CSE-MsgGUID: g8fMhlnGQYWLr+kI0Jsvww==
X-IronPort-AV: E=Sophos;i="6.23,231,1770591600"; d="scan'208";a="425480012"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Tue, 12 May 2026 16:09:01 +0200
To: Francois Perrad <francois.perrad@gadz.org>
CC: <buildroot@busybox.net>
Message-ID: <agM0fSNbvT5Ow2pl@yd-6wlzhs3>
References: <20260512103255.311522-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512103255.311522-1-francois.perrad@gadz.org>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX604.corporate.adroot.infra.ftgroup
 (10.115.26.32) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1778595377; x=1810131377;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=4VbHDfXHpb8jhDTd9hMmSuoycvScyzOPT/H7KpJz2K0=;
 b=JHoOjJMSAPHBvVeZtOOT+7X6BaTze1Q+khGbUBjl1PYXZEc15KCHI/mi
 YEa2Tm07S7gairUkjQHRbk85/Voph0xX0Y/Cu+L1owhjCaTax9LMT6m5N
 egNii9hqVxibalvy2lZIzsZi7Gv6XPdBVFtaTRx1ZMEpTYKxE9EZr/1eS
 8SUZIk1vhuraWjeQ1DeylR0yVNlAV/i2zY2JRK2izwgnHKo02+NCgBMLz
 8orNFDQzi/oOjKWjFZIE2sNFZwZUg62D/PK/OLfTFNKVx6ZCVSWd80yip
 xtA5AQXkfuZqhTENxz7tjVQsXs6xujiN+WnM5sUjKBO6cqcch3U+9zS1P
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=JHoOjJMS
Subject: Re: [Buildroot] [PATCH] package/opendoas: fix install mode
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI2LTA1LTEyIDEyOjMyICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMg
UGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+Cj4gLS0tCj4gIHBhY2thZ2Uvb3BlbmRv
YXMvb3BlbmRvYXMubWsgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5kb2FzL29wZW5kb2Fz
Lm1rIGIvcGFja2FnZS9vcGVuZG9hcy9vcGVuZG9hcy5tawo+IGluZGV4IDA2NjI2NTA4Zi4uZjg0
MjFlOGM3IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvb3BlbmRvYXMvb3BlbmRvYXMubWsKPiArKysg
Yi9wYWNrYWdlL29wZW5kb2FzL29wZW5kb2FzLm1rCj4gQEAgLTUwLDcgKzUwLDcgQEAgZGVmaW5l
IE9QRU5ET0FTX0JVSUxEX0NNRFMKPiAgZW5kZWYKPiAgCj4gIGRlZmluZSBPUEVORE9BU19JTlNU
QUxMX1RBUkdFVF9DTURTCj4gLQkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChARCkvZG9hcyAkKFRB
UkdFVF9ESVIpL3Vzci9iaW4vZG9hcwoKQXMgSSBzdWdnZXN0ZWQgZWFybGllciB0b2RheSBbMF06
IGRvIG5vdCBjcmVhdGUgYSBzZXQtdWlkIGZpbGUgb24gZGlzazsKaW5zdGVhZCB1c2UgYV9QRVJN
SVNTSU9OIGZvciB0aGF0OgoKICAgIGRlZmluZSBPUEVORE9BU19QRVJNSVNTSU9OUyAKICAgICAg
ICAvdXNyL2Jpbi9kb2FzIGYgNDc1NSAwIDAgLSAtIC0gLSAtCiAgICBlbmRlZgoKWzBdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC9hZ0xnOExFUjBVQVY0dVdDQHlkLTZ3bHpoczMv
CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiArCSQoSU5TVEFMTCkgLUQgLW0gMDQ3NTUgJChA
RCkvZG9hcyAkKFRBUkdFVF9ESVIpL3Vzci9iaW4vZG9hcwo+ICAJJChPUEVORE9BU19JTlNUQUxM
X1BBTV9DT05GKQo+ICBlbmRlZgo+ICAKPiAtLSAKPiAyLjQzLjAKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBfX19fX19fX19fX18KLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tOiAgICAgICBfICAgIDotLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4g
TU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgICAgX18vICkgICB8IC8iXCBBU0NJSSBSSUJC
T04gfAp8ICAgICAgICAgICAgICAgICB8IFNvZnR3YXJlICBEZXNpZ25lciB8ICBfLyAtIC8nICAg
fCBcIC8gQ0FNUEFJR04gICAgIHwKfCArMzMgNjM4LjQxMS4yNDUgJy0tLS0tLS0tLS0tLS0tLS0t
LS0tOiAoXyAgICBgLS0sIHwgIFggIEFHQUlOU1QgICAgICB8CnwgeWFubi5tb3JpbiAoYXQpIG9y
YW5nZS5jb20gICAgICAgICAgIHxfPSIgICAgLC0tJyB8IC8gXCBIVE1MIE1BSUwgICAgfAonLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS06X19fX19fL19fX19fOi0tLS0tLS0t
LS0tLS0tLS0tLScKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KQ2UgbWVzc2FnZSBldCBzZXMgcGllY2VzIGpvaW50ZXMgcGV1dmVudCBjb250ZW5p
ciBkZXMgaW5mb3JtYXRpb25zIGNvbmZpZGVudGllbGxlcyBvdSBwcml2aWxlZ2llZXMgZXQgbmUg
ZG9pdmVudCBkb25jDQpwYXMgZXRyZSBkaWZmdXNlcywgZXhwbG9pdGVzIG91IGNvcGllcyBzYW5z
IGF1dG9yaXNhdGlvbi4gU2kgdm91cyBhdmV6IHJlY3UgY2UgbWVzc2FnZSBwYXIgZXJyZXVyLCB2
ZXVpbGxleiBsZSBzaWduYWxlcg0KYSBsJ2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kg
cXVlIGxlcyBwaWVjZXMgam9pbnRlcy4gTGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQg
c3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwNCk9yYW5nZSBkZWNsaW5lIHRvdXRlIHJlc3BvbnNh
YmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBldGUgYWx0ZXJlLCBkZWZvcm1lIG91IGZhbHNpZmllLiBN
ZXJjaS4NCg0KVGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29u
ZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVk
IGJ5IGxhdzsNCnRoZXkgc2hvdWxkIG5vdCBiZSBkaXN0cmlidXRlZCwgdXNlZCBvciBjb3BpZWQg
d2l0aG91dCBhdXRob3Jpc2F0aW9uLg0KSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBp
biBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhpcyBtZXNzYWdl
IGFuZCBpdHMgYXR0YWNobWVudHMuDQpBcyBlbWFpbHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBp
cyBub3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hhbmdl
ZCBvciBmYWxzaWZpZWQuDQpUaGFuayB5b3UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
