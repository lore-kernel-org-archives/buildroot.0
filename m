Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C63BEA3F3A
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 10:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10AA983417;
	Tue, 10 Feb 2026 10:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZIXgnpDiwOB; Tue, 10 Feb 2026 10:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD59D8284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770719364;
	bh=j73qVTx3CdyOwMQ3upbXc52v4b9A7lOu4nw2BjGqhbs=;
	h=From:Date:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bEOCInb3GESxAeM0lQe9iTuVxNv1SkeArXnPO4zUVRGcUyEEWxtjhreGQrR/pT4Mk
	 UQ1fqN0VZVlxXfNc/b+WlwN7Lr7EqlU0qxN9dmNFN9RqpbCKjdRcASUXXXdfgVkESf
	 seXcpMYhVvIm1VLXPwD23TQDVZJGwM4ooUsgvllfsoBAEEcAAJBLJypeIgzYg5xDEA
	 M2ecHvqq4ka0Jbt2xaOQxAvYBgVDJo3NPJbf5o0lFq5FoUN3FAI4pvhKCBvQFQP2Q6
	 TU9uWs8yGQNkDL72CgIs4LG+SZT/zGqLaQyd+zQSSOmH1C54qTNsBsTRWxWHqgEGDf
	 npTwHcwqJuYDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD59D8284B;
	Tue, 10 Feb 2026 10:29:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3D5E1A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 10:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E533D60DC3
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 10:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ziYplsf404k for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 10:29:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 653A760779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 653A760779
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 653A760779
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 10:29:22 +0000 (UTC)
X-CSE-ConnectionGUID: DxNdNeoWTVCcRSR6gKUEjQ==
X-CSE-MsgGUID: 1BsEVBdcSbaHs/KWwW98BA==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 10 Feb 2026 11:29:19 +0100
Received: from unknown (HELO OPE16NORMBX608.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 11:29:19 +0100
Received: from OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] by
 OPE16NORMBX608.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 10 Feb 2026 11:29:19 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Tue, 10 Feb 2026 11:29:17 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 10 Feb 2026 11:29:17 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: bvTsbuqKQRi5FI29yh5NvA==
X-CSE-MsgGUID: 8dqUlUy0SVW6QrTNbLY4gw==
X-IronPort-AV: E=Sophos;i="6.21,202,1763420400"; d="scan'208";a="390527504"
Date: Tue, 10 Feb 2026 11:29:17 +0100
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <aYsIfWMrnwXvDB2b@yd-6wlzhs3>
References: <3c42d6a8803c28ce34156eee659e25875b916075.1770703119.git.yann.morin@orange.com>
 <87tsvpqeqz.fsf@dell.be.48ers.dk> <aYrcaeU2kIm4a7sD@yd-6wlzhs3>
 <8ea6c2c9-ab1e-4262-878c-bbbefa35b554@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ea6c2c9-ab1e-4262-878c-bbbefa35b554@mind.be>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX501.corporate.adroot.infra.ftgroup
 (10.115.26.25) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1770719362; x=1802255362;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=CxPi+iZvEMUg4ylRUOCTgfOsXPKoyHfpGLMiCPeo6P4=;
 b=Qd4bC5lJHOzu5Ms7u0WZlnLN6HhldkEeYSr3UTvLlS42/oTyCgWuQemY
 sk5r7HfqPnZEKCjYptG8qStz/GylDU7g4pC4YOZOZUcFHKw+ArCecQfgj
 24Tfcna52CvTMfc9SAWlcAsHQH4USRI28VMhNgNFZDSvM6uO5k8562Ftr
 VhcdoGs1WIMEuw566G3MR/lYRwVZbjUltqUaeaO41L9PfF/2P61eXc6jx
 pYJrFZ4U2VQLHpwBcsVw0yQrjlyZRt5B0HhqD8eom++7YIe08/QCiQ0bl
 hGMo+N167DfEtDMAqR3L5MGlpdE198ZTctm1BJ8dSdVvDnSURn6vORmCF
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Qd4bC5lJ
Subject: Re: [Buildroot] [PATCH] DEVELOPPERS: adopt mosquitto
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
Cc: Scott
 Fan <fancp2007@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGl0b3VhbiwgQWxsLAoKT24gMjAyNi0wMi0xMCAxMDoyNSArMDEwMCwgVGl0b3VhbiBDaHJpc3Rv
cGhlIHNwYWtlIHRodXNseToKPiBPbiAxMC8wMi8yNiAwODoyMSwgeWFubi5tb3JpbkBvcmFuZ2Uu
Y29tIHdyb3RlOgo+ID4gVGl0b3Vhbjogd2VyZSB5b3Ugd29ya2luZyBvbiBtaWdyYXRpbmcgdG8g
dXNpbmcgY21ha2UsIG9yIHdlcmUgeW91Cj4gPiBwbGFubmluZyBvbiBkb2luZyBqdXN0IHRoZSBi
dW1wIGZpcnN0Pwo+IAo+IEkgZGlkbid0IGxvb2sgaW50byB0aGUgQ01ha2UgY29udmVyc2lvbiB5
ZXQsIGJ1dCBJIGhhZCB0byBsb29rIGludG8KPiBjb21waWxhdGlvbiBpc3N1ZXMsIGFzIHRoZSAy
LjEuKiByZWxlYXNlIGNvbnRhaW5zIG1hbnkgY2hhbmdlcyAoc29tZSBvZgo+IHdoaWNoIHdlcmUg
ZXZlbiB1bnRlc3RlZCB1cHN0cmVhbSwgc2VlCj4gaHR0cHM6Ly9naXRodWIuY29tL2VjbGlwc2Ut
bW9zcXVpdHRvL21vc3F1aXR0by9pc3N1ZXMvMzQ2OSkKClllcywgSSBoYWQgc2VlbiBzdWNoIGZh
aWx1cmVzIHllc3RlcmRheS4gTm93IEl0IFdvcmtz4oSiIDstKQoKPiBVbmZvcnR1bmF0ZWx5LCBG
T1NERU0gZmx1IGp1c3Qga2lja2VkIGluLAoKU29ycnkgdG8gaGVhciB0aGF0LiBHZXQgd2VsbCBz
b29uIQoKSGVyZSwgSSdtIHN0aWxsIGNvdWdoaW5nIGZyb20gYSBsaW5nZXJpbmcgZm9zZGVtaXRl
Li4uCgo+IHNvIEkgaGF2ZW4ndCB0b3VjaGVkIHRoYXQgcGF0Y2gKPiBzaW5jZSBsYXN0IHdlZWsu
IFlvdSBjYW4gZmluZCBteSB3b3JrIGluIHByb2dyZXNzIG92ZXIgdGhlcmU6IGh0dHBzOi8vZ2l0
bGFiLmNvbS9lc3NlbnNpdW0tbWluZC9idWlsZHJvb3QvLS9jb21taXQvMTE0ZGIyODFkYTUyYjM0
MmE5NWQyYWVhNjE5OWJiZjljMmUyMGNkYgo+IC4gQXMgeW91IGNhbiBzZWUsIEkgc3RpbGwgbmVl
ZCB0byByZWRhY3QgdGhlIHBhdGNoZXMgbWVzc2FnZXMsIHNlbmQgdGhlbQo+IHVwc3RyZWFtLCBl
dGMKCk9LLCBJIHNlZSB0aGluZ3MgSSBoYXZlbid0IHlldCBzdHVtYmxlZCB1cG9uLCB3aGlsZSBJ
IGFsc28gaGl0IGEgZmV3Cm90aGVyIHdhbGxzIGFscmVhZHkuCgo+IEF0IHRoZSBtb21lbnQsIGl0
ICJhbG1vc3Qgd29ya3MiOgo+IAo+IHwuL3V0aWxzL3Rlc3QtcGtnIC1wIG1vc3F1aXR0byBib290
bGluLWFybXY1LXVjbGliYyBbMS82XTogT0sKPiBib290bGluLWFybXY3LWdsaWJjIFsyLzZdOiBP
SyBib290bGluLWFybXY3bS11Y2xpYmMgWzMvNl06IEZBSUxFRAo+IGJvb3RsaW4teDg2LTY0LW11
c2wgWzQvNl06IEZBSUxFRCBici1hcm0tZnVsbC1zdGF0aWMgWzUvNl06IEZBSUxFRAo+IGJvb3Rs
aW4tYWFyY2g2NC1nbGliYy1vbGQgWzYvNl06IEZBSUxFRHwKPiAKPiBGb3IgdGhlIHJlbWFpbmlu
ZyBmYWlsdXJlczoKPiAtIElzIGdldHJhbmRvbSgpIHN1cHBvcnRlZCBvbiBtdXNsID8KClllcyBp
dCBpcywgYXQgbGVhc3Qgc2luY2UgMS4wLjIsIDExIHllYXJzIGFnby4gVGhpbmcgaXMsIHRoZSBt
b3NxdWl0dG8KY29kZSBpcy4uLiBub3QgYWNjb3VudGluZyBmb3IgdGhhdCBjYXNlLgoKPiAtIFdl
IG1heSBuZWVkIHRvIGV4Y2x1ZGUgbm8tTU1VIHBsYXRmb3JtcyBmcm9tIG5vdyBvbiAoYXJtdjdt
KSA/IEFzIHRoZXJlCj4gaGFzIGJlZW4gc29tZSByZXdvcmsgaW4gbW9zcXVpdHRvJ3MgbWVtb3J5
IGFsbG9jYXRvcgoKSSB0aGluayBpdCBpcyBhY2NlcHRhYmxlIHRvIGRyb3Agbm9NTVUgYnVpbGRz
Li4uCgo+IC0gT2xkIGdsaWJjIGlzIG5vdCBzdXBwb3J0ZWQgKGJlY2F1c2Ugb2YgZ2V0cmFuZG9t
KCkpCgpOb3Qgc3VyZSBob3cgd2UgY2FuIGNhdHRlciBmb3IgdGhhdCBjYXNlLiBBbmQgYW55d2F5
LCBnZXRyYW5kb20oKSBoYXMKYmVlbiBhdmFpbGFibGUgc2luY2UgZ2xpYmMgMi4yNSwgcmVsZWFz
ZWQgaW4gMjAyMTcuCgpJbiBNb3NxdWl0dG8sIGdldHJhbmRvbSBpcyBvbmx5IHVzZWQgd2hlbiBU
TFMgKG9wZW5zc2wpIGlzIG5vdAphdmFpbGFibGU7IHdoZW4gb3BlbnNzbCBpcyBhdmFpbGFibGUs
IHRoZW4gdGhhdCBnZXRzIHVzZWQuIE1heWJlIHdlIGNhbgppbnN0cnVjdCBwZW9wbGUgdGhhdCBo
YXZlIG9sZCBnbGliYyB0byBlbmFibGUgb3BlbnNzbCBhcyBhIGZhbGxiYWNrLi4uCgo+IEkgaG9w
ZSB0byBtYWtlIHRoaXMgbW92ZSBmb3J3YXJkICJzb29uIiwgb3RoZXJ3aXNlIGZlZWwgZnJlZSB0
byByZXVzZSB0aGUKPiBjb21taXQgSSBqdXN0IGxpbmtlZCBhYm92ZSA7LSkKCldvdWxkIHlvdSBt
aW5kIGlmIEkgaW5qZWN0IHRoZSBpbnRlcmVzdGluZyBiaXRzIGZyb20geW91ciBwYXRjaCBpbnRv
Cm1pbmUsIGFuZCBjcmVkaXQgeW91IGFzIGEgQ28tZGV2ZWxvcHBlZC1ieSA/CgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBfX19fX19fX19fX18KLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tOiAg
ICAgICBfICAgIDotLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgICAgX18vICkgICB8IC8iXCBBU0NJSSBSSUJCT04gfAp8ICAgICAgICAg
ICAgICAgICB8IFNvZnR3YXJlICBEZXNpZ25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04g
ICAgIHwKfCArMzMgNjM4LjQxMS4yNDUgJy0tLS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAgICBgLS0s
IHwgIFggIEFHQUlOU1QgICAgICB8CnwgeWFubi5tb3JpbiAoYXQpIG9yYW5nZS5jb20gICAgICAg
ICAgIHxfPSIgICAgLC0tJyB8IC8gXCBIVE1MIE1BSUwgICAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS06X19fX19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KQ2UgbWVz
c2FnZSBldCBzZXMgcGllY2VzIGpvaW50ZXMgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRp
b25zIGNvbmZpZGVudGllbGxlcyBvdSBwcml2aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jDQpw
YXMgZXRyZSBkaWZmdXNlcywgZXhwbG9pdGVzIG91IGNvcGllcyBzYW5zIGF1dG9yaXNhdGlvbi4g
U2kgdm91cyBhdmV6IHJlY3UgY2UgbWVzc2FnZSBwYXIgZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWdu
YWxlcg0KYSBsJ2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMg
am9pbnRlcy4gTGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQn
YWx0ZXJhdGlvbiwNCk9yYW5nZSBkZWNsaW5lIHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1l
c3NhZ2UgYSBldGUgYWx0ZXJlLCBkZWZvcm1lIG91IGZhbHNpZmllLiBNZXJjaS4NCg0KVGhpcyBt
ZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHBy
aXZpbGVnZWQgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsNCnRoZXkg
c2hvdWxkIG5vdCBiZSBkaXN0cmlidXRlZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jp
c2F0aW9uLg0KSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNo
bWVudHMuDQpBcyBlbWFpbHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZv
ciBtZXNzYWdlcyB0aGF0IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQu
DQpUaGFuayB5b3UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
