Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E77CC46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 10:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B50081390;
	Tue, 26 Dec 2023 10:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B50081390
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7IGRFqceVIqz; Tue, 26 Dec 2023 10:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 931A98138D;
	Tue, 26 Dec 2023 10:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 931A98138D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF7201BF2C5
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 10:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A83858138D
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 10:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A83858138D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RAAVtrqEATcE for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 10:26:29 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED57381371
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 10:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED57381371
Received: from unknown (HELO opfedv3rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2023 11:26:26 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Dec 2023 11:26:26 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 11:26:24 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 26 Dec 2023 11:26:23 +0100
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.04,306,1695679200"; d="scan'208";a="84529712"
Date: Tue, 26 Dec 2023 11:26:23 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZYqqTwOgxBkWh3Bh@tl-lnx-nyma7486-2>
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
 <20231214165420.181703-6-james.hilliard1@gmail.com>
 <20231225212415.3e6b7621@windsurf>
 <CADvTj4qyLnC=L0bn18cE6sNDEw9bWX=785E8ncJek9=G0VQxyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4qyLnC=L0bn18cE6sNDEw9bWX=785E8ncJek9=G0VQxyQ@mail.gmail.com>
X-Originating-IP: [10.115.27.52]
X-ClientProxiedBy: OPE16NORMBX307.corporate.adroot.infra.ftgroup
 (10.115.27.12) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1703586389; x=1735122389;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=AzfI4coC4emkZWw1b2163rxZ1HhS8m6DYBWlWZZOOBg=;
 b=sI3iuN8ZWVi4Z+UQ1Z+0L6b77cMP4eFxZNK8txyzVFtz18jF0pVjqxjR
 hJ6fura32nClPs4DHj3ohWrOZRe5LestlCCLLCoviPGI5fwz5UES5g/LU
 20Txjxnb5NFrUX+g3yQdRXvMZv5pw/cCcOcWsEjM5UWLybCAHjQ6ubQ7Z
 L/Em491HwVYftHopLecHWuAErTfRJ/MD3Czjtnwrmw2pcH0Mtz+o9QaB+
 37/eWRZWfmrE8XkpIDipX5BUE9Qpo6FK8BS++Z241cm+J3Is8KglEpwdN
 KKejNk38EdZrA7TJIv6rnIc0Y70TMHyjZXCd98hzV9EsFk+oKfBAwogRy
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=sI3iuN8Z
Subject: Re: [Buildroot] [PATCH v3 6/8] package/python-fastapi-sessions: new
 package
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjMtMTItMjUgMTc6NDcgLTA3MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBNb24sIERlYyAyNSwgMjAyMyBhdCAxOjI04oCvUE0gVGhvbWFzIFBl
dGF6em9uaQo+IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+IE9uIFRo
dSwgMTQgRGVjIDIwMjMgMDk6NTQ6MTggLTA3MDAKPiA+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5o
aWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGls
bGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPiBJIGFtIGFwcGx5aW5nIHRoaXMg
c2VyaWVzLCBhbmQgSSBoYXZlIGEgZmV3IHF1ZXN0aW9ucyBvbiB0aGlzIHBhdGNoLgo+ID4gVGhl
eSB3b24ndCBwcmV2ZW50IGFwcGx5aW5nIHRoZSBwYXRjaCwgdGhleSBhcmUgbW9yZSBmb3IgbXkK
PiA+IGN1cmlvc2l0eS91bmRlcnN0YW5kaW5nLgpbLS1TTklQLS1dCj4gPiA+ICsgICAgIHNlbGVj
dCBCUjJfUEFDS0FHRV9QWVRIT05fUFlEQU5USUMgIyBydW50aW1lCj4gPiBJIGluZGVlZCBzZWUg
cHlkYW50aWMgaW1wb3J0ZWQgaW4gdHdvIHBsYWNlczoKWy0tU05JUC0tXQo+ID4gSG93ZXZlciwg
aXQncyBub3QgbGlzdGVkIGluIHNldHVwLnB5IG9yIHB5cHJvamVjdC50b21sLCBldmVuIGFzIGFu
Cj4gPiBvcHRpb25hbCBkZXBlbmRlbmN5LiBJcyB0aGlzIGFuIHVwc3RyZWFtICJidWciID8KPiBJ
IHNlZSBpdCBpbiBzZXR1cC5weSBoZXJlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9qb3JkYW5pc2Fh
Y3MvZmFzdGFwaS1zZXNzaW9ucy9ibG9iL2JlNDEyNjkzODAxMWFiZDcwOWZhMThlOWQ5ZmM4YTU0
YzY2YTIxMzAvc2V0dXAucHkjTDEyCgpTbywgaW5kZWVkIGl0IGlzIHZpc2libGUgaW4gc2V0dXAu
cHkgdGhhdCBpcyBvbiBnaXRodWIuIEJ1dCB3aGF0IHdlIGFyZQp1c2luZyBpcyB0aGUgdGFyYmFs
bCB3ZSByZXRyaWV2ZSBmcm9tIFB5UGkgWzBdLiBBbmQgaWYgeW91IGxvb2sgaW4gdGhhdAp0YXJi
YWxsLCB5b3UnbGwgbm90aWNlIGEgZmV3IHRoaW5nczsKCiAxLiBweWRhbnRpYyBpcyBpbmRlZWQg
bmVpdGhlciBpbiBzZXR1cC5weSBub3IgaW4gcHlwcm9qZWN0LnRvbWwsIGFzCiAgICB0aGV5IGFy
ZSBpbiB0aGUgYXJjaGl2ZSBvbiBQeVBpOwoKIDIuIHRoZSBzZXR1cC5weSBmcm9tIFB5UGkgZGlm
ZmVycyBmcm9tIHRoZSBvbmUgb24gR2lodWI7CgpBbHNvLCBsb29raW5nIGF0IHRoZSBnaXRodWIg
cmVwb3NpdG9yeTsKCiAzLiB0aGUgcHJvamVjdCBoYXMgbm90IHRhZyBmb3IgMC4zLjIsIGV2ZW4g
dGhvdWdoIHRoZSBjb21taXQKICAgIGJlNDEyNjkzODAxMSAodXBkYXRlIHZlcnNpb24pIGZyb20g
MjAyMS0wOS0xMSBzZWVtcyB0byBtYXRjaCwgYm90aAogICAgaW4gZGF0ZSBhbmQgY29udGVudDsK
CiA0LiB0aGUgb25seSBjb21taXQgc2luY2UgdGhlbiB3YXMgdG8gbWFyayB0aGUgcHJvamVjdCB1
bnRtYWludGFpbmVkCiAgICBhcyBvZiAyMDIyLTAxLTI3OwoKIDUuIHRoZSByZXBvc2l0b3J5IGhh
cyBiZWVuIG1hcmtlZCAiYXJjaGl2ZWQiIG9uIGdpdGh1YiBhcyBvZgogICAgMjAyMy0xMi0wNiwg
YXMgbm90ZWQgb24gdGhlIHRvcCBiYW5uZXIgb24gdGhlIGdpdGh1YiBicm93c2VyIGZvciB0aGUK
ICAgIHByb2pldDogaHR0cHM6Ly9naXRodWIuY29tL2pvcmRhbmlzYWFjcy9mYXN0YXBpLXNlc3Np
b25zCiAgICAgICAgVGhpcyByZXBvc2l0b3J5IGhhcyBiZWVuIGFyY2hpdmVkIGJ5IHRoZSBvd25l
ciBvbiBEZWMgNiwgMjAyMy4KICAgICAgICBJdCBpcyBub3cgcmVhZC1vbmx5LiAKClNvLCBpdCBt
ZWFucyB0aGF0IHdlIG5vdyB1c2UgYSBwcm9qZWN0IHRoYXQgaXMgdW5tYWludGFpbmVkLCBhbmQg
aGFzCmRpc2NyZXBhbmN5IGJldHdlZW4gd2hhdCBpcyBhdmFpbGFibGUgb24gZ2lodWIgdnMuIHdo
YXQgaXMgcHVjbGlzaGVkIG9uClB5UGkuCgpJcyB0aGVyZSBhIG5ld2VyIHVwc3RyZWFtIGxvY2F0
aW9uLCBvciBzb21lb25lIHdobyBhY3R1YWxseSBmb3JrZWQgdGhlCnByb2plY3QgYW5kIG1haW50
YWlucyBpdCBlbHNld2hlcmU/CgpJZiBub3QsIGlzIGl0IHJlYWxseSBpbnRlcmVzdGluZyBmb3Ig
QnVpbGRyb290IHRvIGhhdmUganVzdCBhZGRlZCBhIG5ldwpwYWNrYWdlIHRoYXQgaXMga25vd24g
dG8gYmUgbW90aGJhbGxlZCwgYW5kIGZvciB3aGljaCB3ZSB3aWxsIG5ldmVyIHNlZQphbnkgZml4
IChzZWN1cml0eSBvciBvdGhlcndpc2UpLCBhbmQgd2hpY2ggaGFzIG5vIHVzZXJzIGluIEJ1aWxk
cm9vdD8KClswXSB0aGlzIGlzIG9uZSBvZiB0aGUgcmVhc29uIEkgZG8gbm90IGxpa2UgdGhhdCB3
ZSB1c2UgYXJjaGl2ZXMKICAgIHB1Ymxpc2hlZCBvbiBQeVBpLCBhbmQgSSB0aGlua3Qgd2Ugc2hv
dWxkIGluc3RlYWQgYmUgdXNpbmcgdGhlCiAgICBwYWNrYWdlcyBmcm9tIHRoZSB0cnVlLCBvZmZp
Y2lhbCBzb3VyY2U6IGFzIHdlIGNhbiBzZWUgYWJvdmUsIHdlCiAgICBoYXZlIG5vIGd1YXJhbnRl
ZSB0aGF0IHdoYXQgaXMgb24gUHlQaSBpcyBpbmRlZWQgd2hhdCB3ZSBjYW4gc2VlCiAgICBvbiB0
aGUgcHVibGljIGZvcmdlLCBhbmQgY2FuIGNhdXNlIHF1aXRlIHNvbWUgZ3JpZXZhbmNlIHdoZW4K
ICAgIGRlYnVnZ2luZyBpc3N1ZXMsIGFzIHRoaXMgcGFja2FnZSBuaWNlbHkgZGVtb250cmF0ZXMu
CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBfX19fX19fX19fX18KLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS0tOiAgICAgICBfICAgIDotLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgICAgX18vICkgICB8IC8iXCBBU0NJSSBSSUJCT04g
fAp8ICAgICAgICAgICAgICAgICB8IFNvZnR3YXJlICBEZXNpZ25lciB8ICBfLyAtIC8nICAgfCBc
IC8gQ0FNUEFJR04gICAgIHwKfCArMzMgNjM4LjQxMS4yNDUgJy0tLS0tLS0tLS0tLS0tLS0tLS0t
OiAoXyAgICBgLS0sIHwgIFggIEFHQUlOU1QgICAgICB8CnwgeWFubi5tb3JpbiAoYXQpIG9yYW5n
ZS5jb20gICAgICAgICAgIHxfPSIgICAgLC0tJyB8IC8gXCBIVE1MIE1BSUwgICAgfAonLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS06X19fX19fL19fX19fOi0tLS0tLS0tLS0t
LS0tLS0tLScKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KQ2UgbWVzc2FnZSBldCBzZXMgcGllY2VzIGpvaW50ZXMgcGV1dmVudCBjb250ZW5pciBk
ZXMgaW5mb3JtYXRpb25zIGNvbmZpZGVudGllbGxlcyBvdSBwcml2aWxlZ2llZXMgZXQgbmUgZG9p
dmVudCBkb25jDQpwYXMgZXRyZSBkaWZmdXNlcywgZXhwbG9pdGVzIG91IGNvcGllcyBzYW5zIGF1
dG9yaXNhdGlvbi4gU2kgdm91cyBhdmV6IHJlY3UgY2UgbWVzc2FnZSBwYXIgZXJyZXVyLCB2ZXVp
bGxleiBsZSBzaWduYWxlcg0KYSBsJ2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVl
IGxlcyBwaWVjZXMgam9pbnRlcy4gTGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3Vz
Y2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwNCk9yYW5nZSBkZWNsaW5lIHRvdXRlIHJlc3BvbnNhYmls
aXRlIHNpIGNlIG1lc3NhZ2UgYSBldGUgYWx0ZXJlLCBkZWZvcm1lIG91IGZhbHNpZmllLiBNZXJj
aS4NCg0KVGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlk
ZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVkIGJ5
IGxhdzsNCnRoZXkgc2hvdWxkIG5vdCBiZSBkaXN0cmlidXRlZCwgdXNlZCBvciBjb3BpZWQgd2l0
aG91dCBhdXRob3Jpc2F0aW9uLg0KSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhpcyBtZXNzYWdlIGFu
ZCBpdHMgYXR0YWNobWVudHMuDQpBcyBlbWFpbHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBu
b3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBv
ciBmYWxzaWZpZWQuDQpUaGFuayB5b3UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
