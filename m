Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590CAC43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 05:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF836816FB;
	Thu,  9 Jul 2026 05:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5SDMMUdbJU1; Thu,  9 Jul 2026 05:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5912E816F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783575287;
	bh=4m5WERhxQI/WXm3jT0m/MuMFj7YPAMHcNgZEQj7H16k=;
	h=From:Date:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oV01Hyb+OT0RsE9krnwdy1En4wXLiOffnEwUlIMO2zCa0MwVtl6PkZQtXJ13Hc3B2
	 HUmgZDPCUTRTn81N5Y7XHy4liuipHS3Fb44SOj3D9GtZougzmUmP/mDBW8eaCayCGb
	 mhHV+k60E5GJBFiv9fJIZ5v5rzwdx9phdVCbuyGv6BGHyuJJWJ7OIqOWG4ExK1YAep
	 7jGe5knfttVbUEIeWYvbPVc0P6Okf6BGvbist9BPwKv2w4EbfaCH0cZj7x6ekBd/Wk
	 PpyZONDr0oQwnTyikeEAy1g3sFEgMOh8somPyCdQqfB8dnt2KLKwij5yCQCvRjpsNf
	 qZN8Y9RnNhohQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5912E816F5;
	Thu,  9 Jul 2026 05:34:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C8E52E5
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 05:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22EBA816F5
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 05:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DU0_dVdCvRF3 for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 05:34:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5D3C816F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5D3C816F1
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5D3C816F1
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 05:34:42 +0000 (UTC)
X-CSE-ConnectionGUID: JeAyef0qR9e/v8GfcToK4g==
X-CSE-MsgGUID: imjwXH1kTMylNbC2HIss9g==
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 09 Jul 2026 07:34:39 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 07:34:40 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43;
 Thu, 9 Jul 2026 07:34:38 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 09 Jul 2026 07:34:37 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: xsa97lMHQQeeTX64Niyoog==
X-CSE-MsgGUID: LJ9NFj0dRO26HZdHtfQmuw==
X-IronPort-AV: E=Sophos;i="6.25,154,1779141600"; d="scan'208";a="444581045"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Thu, 9 Jul 2026 07:34:37 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ak8y7dUp1ueJ7oLy@yd-6wlzhs3>
References: <cb306363cbe59e1e5cdf9d50921e06a23590cd48.1780473097.git.yann.morin@orange.com>
 <akyWylX0rDN1XX6N@yd-6wlzhs3>
 <77b8d847-cf94-4919-bbef-bb934e1fbc9d@smile.fr>
 <c4368489-8d6e-447f-9568-c8f87b0d19e6@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4368489-8d6e-447f-9568-c8f87b0d19e6@smile.fr>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX602.corporate.adroot.infra.ftgroup
 (10.115.26.30) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1783575284; x=1815111284;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=3TxarYwt+/JJAIF3fqGNAqHdZoHiW0Kfbvvoc6kzJ98=;
 b=QBL5OEopKti+zgCvqnjOw14VBy++f1YZIeeKVbHQ/rB4uZJKtFzXth1k
 18QsZo+rE3AAXY0uvCvY4zcmN+opULaoM3wy1li/vrZ0L15VlSaKRAcKX
 njpAq+95JIO4ohrqrJYvjzPGd7j9ioaHY6RkGh101+Isi4MVTuYQk9vn/
 6Ol3ECn8AFBC10GhAs2BHrYhfxxKduoArJbJNHp8oMIxLcXiQHKwcPFrY
 M/PI9862Fr1qsOhEN98tbE1AcKg8/UIxzlu6qAbfIUwdTW7m8cwjcQ5Wq
 rB6f7IDuzuqg6KsEPXKiobRix7yr7Fiu5ECAGz5+VraeJEAexftBZLIwv
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=QBL5OEop
Subject: Re: [Buildroot] [PATCH] support/docker: make the image reproducible
 again
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
Cc: Dowan Gullient <dowan.gullient@smile.fr>,
 Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDI2LTA3LTA4IDIzOjQ4ICswMjAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDA4LzA3LzIwMjYgw6AgMjM6MjksIFJvbWFpbiBOYW91ciBhIMOpY3Jp
dMKgOgo+ID4gTGUgMDcvMDcvMjAyNiDDoCAwODowMywgeWFubi5tb3JpbkBvcmFuZ2UuY29tIGEg
w6ljcml0wqA6Cj4gPj4gT24gMjAyNi0wNi0wMyAwOTo1MSArMDIwMCwgeWFubi5tb3JpbkBvcmFu
Z2UuY29tIHNwYWtlIHRodXNseToKPiA+Pj4gVGhlIERlYmlhbiAxMiBCb29rd29ybSBzbmFwc2hv
dCB3ZSB1c2UsIDIwMjUwMjAzLCB1c2VzIHRoZSBuZXcgZGViODIyCj4gPj4+IGZvcm1hdCBbMF0g
Zm9yIHNvdXJjZSBsaXN0IGZpbGVzOyBpdCBjYXJyaWVzIGEgc291cmNlIGxpc3QgZmlsZSB0aGF0
Cj4gPj4+IHBvaW50cyB0byB0aGUgY3VycmVudCByZXBvc2l0b3J5LCBub3QgdG8gdGhlIHNuYXBz
aG90Lgo+ID4gSSBzdGFydGVkIGEgbG9jYWwgYnVpbGQgaGVyZS4KPiBCdWlsdCBsb2NhbGx5IHdp
dGggc3VjZXNzLCBub3QgeWV0IHB1c2hlZCB0byB0aGUgQ29udGFpbmVyIHJlZ2lzdHJ5Lgo+IEFw
cGxpZWQgdG8gbWFzdGVyLiBUaGFua3MuCgpUaGFua3MhIDotKQoKPiA+IFdlIHdhbnQgdG8gdXBk
YXRlIHRoZSBEb2NrZXIgaW1hZ2UgdG8gRGViaWFuIDEzIChjdXJyZW50IHN0YWJsZSkgc29vbiwg
ZG8geW91Cj4gPiB0aGluayBpdCB3b3J0aCB0byByZWJ1aWx0IGl0IG5vdz8KCldlbGwsIEkgdGhp
bmsgaXQgaXMgYmV0dGVyIHRvIHB1c2ggaXQgbm93LCBiZWNhdXNlIHdlIGhhdmUgbm8gRVRBIGJl
Zm9yZQphbiB1cGdyYWRlIGlzIGNvbWluZyAoYnV0IGdpdmVuIEkgaGF2ZSBhbHJlYWR5IG1vdmVk
IHRvIHRyaXhpZQppbnRlcm5hbGx5LCBJIGNhbiB3b3JrIG9uIHRoYXQgaW4gdGhlIG5lYXIgZnV0
dXJlLi4uKQoKQnV0IHRoYXQgZG9lcyBudG8gcHJldmVudCB1cyBmcm9tIHB1c2hpbmcgYSB0YWcg
dG8gdGhlIHJlcG8gKHlvdSBoYXZlCmJ1aWxkIGl0IGFscmVhZHksIHlvdSBjYW4ganVzdCBwdXNo
IGl0IDstKSApLgoKPiA+IEkgd291bGQgbGlrZSB0byB1c2UgdGhpcyBvcHBvcnRpbml0eSB0byBh
ZGQgYSBuZXcgR2l0bGFiLUNJIGpvYiB0byBidWlsZCB0aGlzCj4gPiBkb2NrZXIgaW1hZ2UgYW5k
IHB1c2ggaXQgZGlyZWN0bHkgaW50byB0aGUgR2l0bGFiIGNvbnRhaW5lciByZWdpc3RyeS4gQXJu
b3V0Cj4gPiBzdWdnZXN0ZWQgdGhpcyBhIHdoaWxlIGFnbyA7LSkKCkZUUiwgdGhhdCdzIHdoYXQg
SSBkbyBmb3Igb3VyIGludGVybmFsIHJlZmVyZW5jZSBpbWFnZS4gVGhlIHRyaWNrIGlzLAp5b3Ug
ZG8gbm90IHdhbnQgdG8gYnVpbGQgdGhlIGltYWdlIGZvciBldmVyeSBwdXNoIGlmIGl0IGhhc24n
dCBjaGFuZ2VkLAphZG4gaWYgaXQgaGFzIGNoYW5nZWQsIHlvdSBkbyBub3Qgd2FudCB0byBwdXNo
IHRoZSBpbWFnZSBpZiBpdHMgdmVyc2lvbgpoYXNuJ3QgY2hhbmdlZCAob3IgeW91J2Qgb3Zlcndy
aXRlIGEgcHJldmlvdXMgaW1hZ2UpLgoKU28sICJJIEhhdmUgQSBTY3JpcHQiKOKEoikgdGhhdCBj
aGVja3MgdGhlIGNvbmRpdGlvbnMuIEkgY2FuIHNlZSB0byBtYWtlCml0IGdlbmVyaWMgZW5vdWdo
IHRvIHVzZSB0aGF0IHVwc3RyZWFtIHRvby4uLiBMZXQncyBzZWUgd2hhdCBJIGNhbiBkby4uLgoK
UmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgX19fX19fX19fX19fCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLTogICAgICAgXyAgICA6LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklO
ICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8ICAgIF9fLyApICAgfCAvIlwgQVNDSUkgUklCQk9OIHwK
fCAgICAgICAgICAgICAgICAgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCAgXy8gLSAvJyAgIHwgXCAv
IENBTVBBSUdOICAgICB8CnwgKzMzIDYzOC40MTEuMjQ1ICctLS0tLS0tLS0tLS0tLS0tLS0tLTog
KF8gICAgYC0tLCB8ICBYICBBR0FJTlNUICAgICAgfAp8IHlhbm4ubW9yaW4gKGF0KSBvcmFuZ2Uu
Y29tICAgICAgICAgICB8Xz0iICAgICwtLScgfCAvIFwgSFRNTCBNQUlMICAgIHwKJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tOl9fX19fXy9fX19fXzotLS0tLS0tLS0tLS0t
LS0tLS0nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCkNlIG1lc3NhZ2UgZXQgc2VzIHBpZWNlcyBqb2ludGVzIHBldXZlbnQgY29udGVuaXIgZGVz
IGluZm9ybWF0aW9ucyBjb25maWRlbnRpZWxsZXMgb3UgcHJpdmlsZWdpZWVzIGV0IG5lIGRvaXZl
bnQgZG9uYw0KcGFzIGV0cmUgZGlmZnVzZXMsIGV4cGxvaXRlcyBvdSBjb3BpZXMgc2FucyBhdXRv
cmlzYXRpb24uIFNpIHZvdXMgYXZleiByZWN1IGNlIG1lc3NhZ2UgcGFyIGVycmV1ciwgdmV1aWxs
ZXogbGUgc2lnbmFsZXINCmEgbCdleHBlZGl0ZXVyIGV0IGxlIGRldHJ1aXJlIGFpbnNpIHF1ZSBs
ZXMgcGllY2VzIGpvaW50ZXMuIExlcyBtZXNzYWdlcyBlbGVjdHJvbmlxdWVzIGV0YW50IHN1c2Nl
cHRpYmxlcyBkJ2FsdGVyYXRpb24sDQpPcmFuZ2UgZGVjbGluZSB0b3V0ZSByZXNwb25zYWJpbGl0
ZSBzaSBjZSBtZXNzYWdlIGEgZXRlIGFsdGVyZSwgZGVmb3JtZSBvdSBmYWxzaWZpZS4gTWVyY2ku
DQoNClRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVu
dGlhbCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHByb3RlY3RlZCBieSBs
YXc7DQp0aGV5IHNob3VsZCBub3QgYmUgZGlzdHJpYnV0ZWQsIHVzZWQgb3IgY29waWVkIHdpdGhv
dXQgYXV0aG9yaXNhdGlvbi4NCklmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJy
b3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQg
aXRzIGF0dGFjaG1lbnRzLg0KQXMgZW1haWxzIG1heSBiZSBhbHRlcmVkLCBPcmFuZ2UgaXMgbm90
IGxpYWJsZSBmb3IgbWVzc2FnZXMgdGhhdCBoYXZlIGJlZW4gbW9kaWZpZWQsIGNoYW5nZWQgb3Ig
ZmFsc2lmaWVkLg0KVGhhbmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
