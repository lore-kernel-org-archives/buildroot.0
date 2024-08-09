Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF25C52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 12:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7839E4105A;
	Fri,  9 Aug 2024 12:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4eZbax-oTN1B; Fri,  9 Aug 2024 12:52:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CF74403A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CF74403A7;
	Fri,  9 Aug 2024 12:52:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 696BB1BF30F
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 12:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56BEE40163
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 12:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPwlhoE-5z1R for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 12:52:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F0454029B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F0454029B
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F0454029B
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 12:52:20 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 14:52:17 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Aug 2024 14:52:17 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 14:52:16 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Fri, 09 Aug 2024 14:52:15 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.09,276,1716242400"; d="scan'208";a="180198392"
Date: Fri, 9 Aug 2024 14:52:15 +0200
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <ZrYQ/31aJt3u4bid@tl-lnx-nyma7486-2>
References: <20240805-z-linker-v1-1-8362e6645f67@gmx.net>
 <ZrXouDfJpbEU85QC@tl-lnx-nyma7486-2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZrXouDfJpbEU85QC@tl-lnx-nyma7486-2>
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX406.corporate.adroot.infra.ftgroup
 (10.115.27.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1723207941; x=1754743941;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=wAcigD9ywK5kxOpRxoD889R9etSAnCDCjb5vTuiQ7zs=;
 b=kwQPbIXz37XZ8dMMllh77NgWpp5yHQurKMYVrPfMAS0PmpnxYhwoYWDB
 v5TWC8bo41N0InY7OrnzGbAnFF9QWwbqAsNgVfQFMwC99ytq3qDsPwCaT
 CjuoZ1fgySKkAqpvM8j3udxZXyBArKALH9dvbX1a4MopMEywI6Esh8HE8
 wOGrMjEOTbxYdIuX7f/3YIboHxYXdkDW3gTtU1AOMnpRFPTgMK5rt/qGQ
 0ueD6ImY8KXeGOIkq5xVPM6r/toMv1TlQRcnY9md0OYIjYiuaG6G05n4I
 nCDaL5DfQvZ+15TbApva96r8GMfNqbb7NVa5blkgevvb33vT9DTrkCVtD
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=kwQPbIXz
Subject: Re: [Buildroot] [PATCH] package/Makefile.in: Use "-z text" instead
 of "-Wl, -z, text"
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Si4sIEFsbCwKCk9uIDIwMjQtMDgtMDkgMTI6MDAgKzAyMDAsIE1PUklOIFlhbm4gSU5OT1YvSVQt
UyBzcGFrZSB0aHVzbHk6Cj4gT24gMjAyNC0wOC0wNSAyMzo1MyArMDIwMCwgSi4gTmV1c2Now6Rm
ZXIgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gPiBBZnRlciB0aGUgcmVjZW50IGFkZGl0
aW9uIHRvIC1XbCwteix0ZXh0IHRvIFRBUkdFVF9MREZMQUdTIGluIGNhc2Ugb2YKPiA+IG11c2wt
bGliYyBhbmQgZHluYW1pYyBsaW5raW5nLCBpdCB3YXMgZm91bmQgdGhhdCBzb21lIHBhY2thZ2Vz
IHBhc3MKPiA+IFRBUkdFVF9MREZMQUdTIGRpcmVjdGx5IHRvIGxkLCBidXQgdGhlIC1XbCBzeW50
YXggb25seSB3b3JrcyB3aXRoCj4gPiBjb21waWxlciBkcml2ZXJzIChnY2MvY2xhbmcpLiBUaGlz
IGNvbW1pdCBjaGFuZ2VzIHRoZSBmbGFnIHRvIC16IHRleHQsCj4gPiB3aGljaCB0aGUgZ2NjIGFu
ZCBjbGFuZyBhbHNvIHVuZGVyc3RhbmQgYW5kIHBhc3MgdG8gdGhlIGxpbmtlci4KWy0tU05JUC0t
XQo+IFllcywgaXQgaXMgY2F1c2luZyBhbiBpc3N1ZSB3aXRoIGdwc2Q6ClstLVNOSVAtLV0KPiBP
ZiBjb3Vyc2UsIEkgc3VzcGVjdCB0aGUgcmVhbCBjdWxwcml0IGlzIG5vdCB0aGlzIGFjdHVhbCBj
aGFuZ2U7IGl0Cj4gcHJvYmFibHkganVzdCB0cmlnZ2VycyBhIGxhdGVudCBpc3N1ZSBpbiB0aGUg
Z3BzZCBidWlsZCBwcm9jZXNzLCB3aGljaAo+IHVzZXMgc2NvbnMsIHNvIG1laC4uLgo+IEknbGwg
dHJ5IHRvIGhhdmUgYSBsb29rLCBidXQgaWYgc29tZW9uZSBlbHNlIGNhbiBhbHNvIGxvb2sgYXQg
aXQsIHRoYXQKPiB3b3VsZCBiZSBuaWNlLiBUaGFua3MhCgpJIG5vdyB3ZW50IHRvIHRoZSBib3R0
b20gb2YgaXQgYW5kIGZvdW5kIHRoZSByZWFsIGN1bHByaXQgKHNjb25zLCBhcyBJCmhhZCB0aG91
Z2h0KS4gSSdtIGEgYml0IGluIGEgcmFiYml0IGhvbGUgbm93LCBidXQgSSBob3BlIHRoYXQgSSBj
YW4gc29vbgpzZW5kIGEgcGF0Y2ggKG9yIG1heWJlIGEgcGF0Y2hzZXQuLi4pIHRvIGZpeCB0aGF0
Li4uCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAg
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
