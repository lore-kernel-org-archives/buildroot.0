Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133A5CD4F26
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 08:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B666681E87;
	Tue, 12 May 2026 08:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzkydDIQrR6q; Tue, 12 May 2026 08:19:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2AAD81E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778573990;
	bh=hVfKvdOBFiw0koQR1o8B03AC0EzPTVZ+ZhoszEYTh9g=;
	h=From:Date:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Now22ScgX1Z2/oPWJTWa+K5rJlDJtzkW7/KyOKrjA6kIb6usHB/aszKx1ncxHCFuO
	 +pepAPsIzjYDvOQN39uX7XC1OaqDOexNBq3rEkFg1lGvJVT2m0wu9glli4APe9twJW
	 y/cvHLaQ7eXzgmwMNbjzIqlImOVVRDfeGsGyDOhMmgUSiEEf0BIaIzZ9Ze6KdBuIwd
	 QJp+99TZ6gHHgCZCpRkiTRVhk4p27Vg6pNMQ9wygLVEI8M87zfJpp6LrO4+ZCD35j3
	 oCxWbQRQ76mSYL/xwiskucLTgxUhPFrIAcTrB8odq/phk4YOUaaBSXQ5qPLUnBrGnE
	 XmjSWfIima9yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2AAD81E88;
	Tue, 12 May 2026 08:19:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E663215F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 08:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBA8181E88
 for <buildroot@buildroot.org>; Tue, 12 May 2026 08:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NLXVZLw1Xz8 for <buildroot@buildroot.org>;
 Tue, 12 May 2026 08:19:48 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 12 May 2026 08:19:47 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A7E981E87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A7E981E87
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A7E981E87
 for <buildroot@busybox.net>; Tue, 12 May 2026 08:19:47 +0000 (UTC)
X-CSE-ConnectionGUID: IJCDGgEkQMSq2jeKMj/e5Q==
X-CSE-MsgGUID: xOkMvsm9SLOaAkthgpqe8A==
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 12 May 2026 10:12:34 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 10:12:34 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Tue, 12 May 2026 10:12:33 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 12 May 2026 10:12:32 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: jQyGQalmQji8D01RgMpcLQ==
X-CSE-MsgGUID: VwpghI7WQ1q1yJQvpHC1pA==
X-IronPort-AV: E=Sophos;i="6.23,230,1770591600"; d="scan'208";a="422443689"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Tue, 12 May 2026 10:12:32 +0200
To: =?utf-8?B?RnJhbsOnb2lz?= PERRAD <francois.perrad.86@gmail.com>
Message-ID: <agLg8LER0UAV4uWC@yd-6wlzhs3>
References: <20260411080616.670069-1-francois.perrad@gadz.org>
 <87wlxadlw1.fsf@dell.be.48ers.dk>
 <CAMTop88G9F0DGMgQkOQs8X_aVWAaQwneH37BCbS8mp1tR3ZdNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMTop88G9F0DGMgQkOQs8X_aVWAaQwneH37BCbS8mp1tR3ZdNQ@mail.gmail.com>
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: ope16normbx505.corporate.adroot.infra.ftgroup
 (10.115.27.25) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1778573987; x=1810109987;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=XYfWPiOvts1svZn7c5kogm78996hmLqErXnA7Iir6mI=;
 b=ftifdrLacmG8Q//91iDEbRr++FGIuDYA4DjjgxiGtjDfnwXMhw3dJmCE
 BBDGNSbQjJPRTECt5igZS6noGE//8SLGUaoaZSbYWeI2aoyzw3Hl8n9lC
 ufTvIA+nbsxsiEX78wybkP/VGeTD+PNSqK85iHzSM3NXUzE3yn2RKLDmd
 YOMs2zU9niWDoQlJ/vX6kqkCgcXhbK552yWPk3mR1nJMusYVbuLaR2GwF
 azVKeZiB8mkCLpEZ6gy1aOtXVAItgiI9oqVVHw0FM0SB3E7MezbEvTRMw
 z2QDF51ps6WAf2qhVsM/7kqtZoUn8ncUg3ak5m5NZLu9/QKtquU/kBlIQ
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=ftifdrLa
Subject: Re: [Buildroot] [PATCH] package/opendoas: new package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI2LTA1LTEyIDEwOjAyICswMjAwLCBGcmFuw6dvaXMgUEVS
UkFEIHNwYWtlIHRodXNseToKPiBMZSBsdW4uIDExIG1haSAyMDI2IMOgIDE3OjA4LCBQZXRlciBL
b3JzZ2FhcmQgPCBbMV1wZXRlckBrb3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6Cj4gICA+Pj4+PiAi
RnJhbmNvaXMiID09IEZyYW5jb2lzIFBlcnJhZCB2aWEgYnVpbGRyb290IDwgWzJdYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoKPiAgICA+ICtkZWZpbmUgT1BFTkRPQVNfSU5TVEFMTF9U
QVJHRVRfQ01EUwo+ICAgID4gKyAgICAkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChARCkvZG9hcyAk
KFRBUkdFVF9ESVIpL3Vzci9iaW4vZG9hcwo+ICAgID4gKyAgICAkKE9QRU5ET0FTX0lOU1RBTExf
UEFNX0NPTkYpCj4gICAgPiArZW5kZWYKPiAgIEhtbSwgaG93IGRvZXMgdGhpcyB3b3JrPyBEb2Vz
IGl0IG5vdCBuZWVkIHRvIGJlIGluc3RhbGxlZCBzdWlkIHJvb3QgbGlrZQo+ICAgc3Vkbz8KPiBZ
b3UgYXJlIHJpZ2h0Lgo+IFRoZSBtb2RlIG11c3QgYmUgIDA0NzU1LgoKUGxlYXNlLCBkbyBub3Qg
bm90IGNyZWF0ZSBhIHNldC11aWQgZmlsZSBvbiBkaXNrIChpLmUuIGRvIG5vdCB1c2UgbW9kZQo0
NzU1KTsgaW5zdGVhZCwgc2V0IHRoZSBzZXQtdWlkIGJpdCB3aXRoIGEgcGVycm1pc3Npb246Cgog
ICAgZGVmaW5lIE9QRU5ET0FTX1BFUk1JU1NJT05TIAogICAgICAgIC91c3IvYmluL2RvYXMgZiA0
NzU1IDAgMCAtIC0gLSAtIC0KICAgIGVuZGVmCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0g
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX19fX18KLi0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tOiAgICAgICBfICAgIDotLS0tLS0t
LS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgICAg
X18vICkgICB8IC8iXCBBU0NJSSBSSUJCT04gfAp8ICAgICAgICAgICAgICAgICB8IFNvZnR3YXJl
ICBEZXNpZ25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKfCArMzMgNjM4LjQx
MS4yNDUgJy0tLS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAgICBgLS0sIHwgIFggIEFHQUlOU1QgICAg
ICB8CnwgeWFubi5tb3JpbiAoYXQpIG9yYW5nZS5jb20gICAgICAgICAgIHxfPSIgICAgLC0tJyB8
IC8gXCBIVE1MIE1BSUwgICAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS06X19fX19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KQ2UgbWVzc2FnZSBldCBzZXMgcGllY2Vz
IGpvaW50ZXMgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNvbmZpZGVudGllbGxl
cyBvdSBwcml2aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jDQpwYXMgZXRyZSBkaWZmdXNlcywg
ZXhwbG9pdGVzIG91IGNvcGllcyBzYW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBhdmV6IHJlY3Ug
Y2UgbWVzc2FnZSBwYXIgZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWduYWxlcg0KYSBsJ2V4cGVkaXRl
dXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4gTGVzIG1lc3Nh
Z2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwNCk9yYW5n
ZSBkZWNsaW5lIHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBldGUgYWx0ZXJl
LCBkZWZvcm1lIG91IGZhbHNpZmllLiBNZXJjaS4NCg0KVGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0
YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3JtYXRp
b24gdGhhdCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsNCnRoZXkgc2hvdWxkIG5vdCBiZSBkaXN0
cmlidXRlZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLg0KSWYgeW91IGhh
dmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVy
IGFuZCBkZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMuDQpBcyBlbWFpbHMg
bWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0IGhh
dmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuDQpUaGFuayB5b3UuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
