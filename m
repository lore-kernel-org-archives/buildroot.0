Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5D5C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 16:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF08F60E5D;
	Thu,  9 Nov 2023 16:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF08F60E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gG6ORCbcZECm; Thu,  9 Nov 2023 16:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5F6260F2B;
	Thu,  9 Nov 2023 16:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5F6260F2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B8B01BF40A
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 16:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7431941EDA
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 16:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7431941EDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FqWfKSQ_DHPc for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 16:03:26 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C263941E8A
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 16:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C263941E8A
Received: from unknown (HELO opfedv3rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 17:03:23 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Nov 2023 17:03:22 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 17:03:21 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 09 Nov 2023 17:03:21 +0100
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.03,289,1694728800"; d="scan'208";a="64069128"
Date: Thu, 9 Nov 2023 17:03:21 +0100
To: Jon Henrik =?utf-8?Q?Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Message-ID: <ZU0CyWbfy97yxwCZ@tl-lnx-nyma7486-2>
References: <20231109142009.3490104-1-jonhenrik@qbee.io>
 <20231109142009.3490104-2-jonhenrik@qbee.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109142009.3490104-2-jonhenrik@qbee.io>
X-Originating-IP: [10.115.27.50]
X-ClientProxiedBy: OPE16NORMBX203.corporate.adroot.infra.ftgroup (10.115.26.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1699545806; x=1731081806;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=Bhy+dwvpD3W2WpMLubTqPoxx94RkqdBksqksjhNhipw=;
 b=IS1JwT5hAbroAAP5EKAQ0ouW566rEopByqmN9ANNTACgRe99TeAzJajq
 /6Oq1Pn9sq9OQCnHaGpwL/PgSTHaZvU+KILeUSo3qpWNZ1/8L6GYRse+/
 EQ7XIrYDg1A4Nqe3jwPVvTk023WdGGHauvWhPoTZln2uwK76gKu9UgrCa
 z6TRPEpMw1ZansmVxqPcjQivumOWRZpuoSkcFIdfTfyKa4qkC2geb8Ple
 /a8tiYUABhTj3T3r9oorhf4jeFuJDg9QC2rdmqRUZ2fOBTR/i0Adx2CfM
 oDDx0dMDIfAEXIwmXBjf8DiwK29xYjS8h0FoG2rpdwNoFayhATobhKbXB
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=IS1JwT5h
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: new package
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

Sm9uLCBBbGwsCgpPbiAyMDIzLTExLTA5IDE1OjIwICswMTAwLCBKb24gSGVucmlrIEJqw7hybnN0
YWQgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gVGhpcyBwYXRjaCBhZGQgcWJlZS1hZ2Vu
dCwgYW4gb3BlbiBzb3VyY2UgZGV2aWNlIG1hbmFnZW1lbnQgc29mdHdhcmUKPiBmb3IgTGludXgg
ZGV2aWNlcy4KWy0tU05JUC0tXQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FiZWUtYWdlbnQvcWJl
ZS1hZ2VudC5oYXNoIGIvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQuaGFzaAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYjdlMzExNDA1Zgo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoCj4gQEAgLTAs
MCArMSwyIEBACj4gKyMgTG9jYWxseSBjYWxjdWxhdGVkCj4gK3NoYTI1NiAgZWRjZjMxOWM0Y2Ux
N2U5ODQ0ZGY1OThmYTc5NmFhODczMDNhMWJmMjM4Mjk5ZGJlZWI0MWM5NGZmNWRlNWUxZCAgcWJl
ZS1hZ2VudC0yMDIzLjQ0LnRhci5nego+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FiZWUtYWdlbnQv
cWJlZS1hZ2VudC5tayBiL3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lm1rCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5hZGVkNmI3MmY0Cj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lm1rCj4gQEAgLTAsMCAr
MSw0MiBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgcWJlZS1hZ2VudCBw
YWNrYWdlCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK1FCRUVfQUdFTlRf
VkVSU0lPTiA9IDIwMjMuNDQKPiArUUJFRV9BR0VOVF9TSVRFID0gaHR0cHM6Ly9jZG4ucWJlZS5p
by9zb2Z0d2FyZS9xYmVlLWFnZW50LyQoUUJFRV9BR0VOVF9WRVJTSU9OKS9iaW5hcmllcwo+ICtR
QkVFX0FHRU5UX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCgpUaGVyZSBpcyB0aGUgZ28gc291cmNlIGNv
ZGUgb246CiAgICBodHRwczovL2dpdGh1Yi5jb20vcWJlZS1pby9xYmVlLWFnZW50CgpTbywgd2h5
IGRvIHlvdSBkb3dubG9hZCBhIHByZWJ1aWx0IHBhY2FrZ2U/CldoeSBjYW4ndCB5b3UgdXNlIHRo
ZSBidWlkbHJvb3QgZ28gcGFjYWtnZSBpbmZyYXN0cnVjdHVyZT8KClNlZToKICAgIGh0dHBzOi8v
YnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1sI19pbmZyYXN0cnVjdHVy
ZV9mb3JfZ29fcGFja2FnZXMKCkJhc2ljYWxseSwgdGhhdCB3b3VsZCBsb29rIGxpa2UgKG9taXR0
aW5nIGxpY2Vuc2luZyBhbmQgc3R1ZmYpOgoKICAgIFFCRUVfQUdFTlRfVkVSU0lPTiA9IDIwMjMu
NDQKICAgIFFCRUVfQUdFTlRfU0lURSA9ICQoY2FsbCBnaXRodWIscWJlZS1pbyxxYmVlLWFnZW50
LCQoUUJFRV9BR0VOVF9WRVJTSU9OKSkKCiAgICAkKGV2YWwgJChnb2xhbmctcGFjYWtnZSkpCgpU
aGVuLCBtYXliZSB5b3UgbmVlZCB0byBzcGVjaWZ5IGEgZmV3IG90aGVyIHZhcmlhYmxlcywgc2Vl
IHRoZSBtYW51YWw6CiAgICBRQkVFX0FHRU5UX0dPTU9ECiAgICBRQkVFX0FHRU5UX0JVSUxEX1RB
UkdFVFMKICAgIFFCRUVfQUdFTlRfSU5TVEFMTF9CSU5TCgpSZWdhcmRzLApZYW5uIEUuIE1PUklO
LgoKPiAraWZlcSAoJChCUjJfYXJtKSx5KQo+ICtRQkVFX0FHRU5UX0dPQVJDSCA9IGFybQo+ICtl
bHNlIGlmZXEgKCQoQlIyX2FhcmNoNjQpLHkpCj4gK1FCRUVfQUdFTlRfR09BUkNIID0gYXJtNjQK
PiArZWxzZSBpZmVxICgkKEJSMl9pMzg2KSx5KQo+ICtRQkVFX0FHRU5UX0dPQVJDSCA9IDM4Ngo+
ICtlbHNlIGlmZXEgKCQoQlIyX3g4Nl82NCkseSkKPiArUUJFRV9BR0VOVF9HT0FSQ0ggPSBhbWQ2
NAo+ICtlbmRpZgo+ICsKPiArUUJFRV9BR0VOVF9TVFJJUF9DT01QT05FTlRTID0gMgo+ICsKPiAr
ZGVmaW5lIFFCRUVfQUdFTlRfSU5TVEFMTF9UQVJHRVRfQ01EUwo+ICsJJChJTlNUQUxMKSAtbSAw
NzU1ICQoQEQpL3FiZWUtYWdlbnQtJChRQkVFX0FHRU5UX0dPQVJDSCkgJChUQVJHRVRfRElSKS91
c3IvYmluL3FiZWUtYWdlbnQKPiArCSQoSU5TVEFMTCkgLUQgLW0gMDYwMCAkKEBEKS9zaGFyZS9z
c2wvY2EuY2VydCAkKFRBUkdFVF9ESVIpL2V0Yy9xYmVlL3Bwa2V5cy9jYS5jZXJ0Cj4gK2VuZGVm
Cj4gKwo+ICtkZWZpbmUgUUJFRV9BR0VOVF9JTlNUQUxMX0lOSVRfU1lTVEVNRAo+ICsJJChJTlNU
QUxMKSAtRCAtbSAwNjQ0ICQoQEQpL2luaXQtc2NyaXB0cy9zeXN0ZW1kL3FiZWUtYWdlbnQuc2Vy
dmljZSBcCj4gKwkJJChUQVJHRVRfRElSKS91c3IvbGliL3N5c3RlbWQvc3lzdGVtL3FiZWUtYWdl
bnQuc2VydmljZQo+ICtlbmRlZgo+ICsKPiArZGVmaW5lIFFCRUVfQUdFTlRfSU5TVEFMTF9JTklU
X1NZU1YKPiArCSQoSU5TVEFMTCkgLUQgLW0gNzU1ICQoQEQpL2luaXQtc2NyaXB0cy9zeXN2aW5p
dC9xYmVlLWFnZW50IFwKPiArCQkkKFRBUkdFVF9ESVIpL2V0Yy9pbml0LmQvUzk5cWJlZS1hZ2Vu
dAo+ICtlbmRlZgo+ICsKPiArZGVmaW5lIFFCRUVfQUdFTlRfTElOVVhfQ09ORklHX0ZJWFVQUwo+
ICsJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfVFVOKQo+ICtlbmRlZgo+ICsKPiAr
JChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKPiAtLSAKPiAyLjI1LjEKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBfX19fX19fX19fX18KLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tOiAgICAgICBfICAgIDotLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgICAgX18vICkgICB8IC8iXCBBU0NJSSBS
SUJCT04gfAp8ICAgICAgICAgICAgICAgICB8IFNvZnR3YXJlICBEZXNpZ25lciB8ICBfLyAtIC8n
ICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKfCArMzMgNjM4LjQxMS4yNDUgJy0tLS0tLS0tLS0tLS0t
LS0tLS0tOiAoXyAgICBgLS0sIHwgIFggIEFHQUlOU1QgICAgICB8CnwgeWFubi5tb3JpbiAoYXQp
IG9yYW5nZS5jb20gICAgICAgICAgIHxfPSIgICAgLC0tJyB8IC8gXCBIVE1MIE1BSUwgICAgfAon
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS06X19fX19fL19fX19fOi0tLS0t
LS0tLS0tLS0tLS0tLScKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KQ2UgbWVzc2FnZSBldCBzZXMgcGllY2VzIGpvaW50ZXMgcGV1dmVudCBjb250
ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNvbmZpZGVudGllbGxlcyBvdSBwcml2aWxlZ2llZXMgZXQg
bmUgZG9pdmVudCBkb25jDQpwYXMgZXRyZSBkaWZmdXNlcywgZXhwbG9pdGVzIG91IGNvcGllcyBz
YW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBhdmV6IHJlY3UgY2UgbWVzc2FnZSBwYXIgZXJyZXVy
LCB2ZXVpbGxleiBsZSBzaWduYWxlcg0KYSBsJ2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWlu
c2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4gTGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRh
bnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwNCk9yYW5nZSBkZWNsaW5lIHRvdXRlIHJlc3Bv
bnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBldGUgYWx0ZXJlLCBkZWZvcm1lIG91IGZhbHNpZmll
LiBNZXJjaS4NCg0KVGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4g
Y29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJvdGVj
dGVkIGJ5IGxhdzsNCnRoZXkgc2hvdWxkIG5vdCBiZSBkaXN0cmlidXRlZCwgdXNlZCBvciBjb3Bp
ZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLg0KSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFp
bCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhpcyBtZXNz
YWdlIGFuZCBpdHMgYXR0YWNobWVudHMuDQpBcyBlbWFpbHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5n
ZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hh
bmdlZCBvciBmYWxzaWZpZWQuDQpUaGFuayB5b3UuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
