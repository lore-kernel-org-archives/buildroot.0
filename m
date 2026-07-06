Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C14C43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 16:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67D9F40937;
	Mon,  6 Jul 2026 16:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybBrvZ6KuxoL; Mon,  6 Jul 2026 16:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B0FF40932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783353875;
	bh=pnfctBEVXK2cj/YoOHjlPERYo6n9wgJDeUXCxn0UvEM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lBsCGciOxUW/fKJLyJrn7gRMVCqoFyNSe98+ctki+45Q1KUzlN2RyHzGGP4wYC/PT
	 WPmwOjEPP+cQxO9hvZ8ZlTcQX5vZmvDIj7+66I8uO1Zxka5rx+tjJ38cgytCIgklUg
	 2WelmhZ/Wa8le+vfj+VZQ/sNkXqSwCgQ6CZOYzrQOE+rerOzt6GGLldc0VDdVMfxrC
	 QFQLsROASBaACe0qT5TeWlh4buufVE4HzQruE5sxlpI+YJ8DDev34VH8aQMWwCd3Ps
	 XcK6e+SSkl/pPGDsqMxMUBXBAIaD4wvk20Xm0PagPmr/P0wuTZQXr2Z7F41z/MunwW
	 czHTBD0RmDU4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B0FF40932;
	Mon,  6 Jul 2026 16:04:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9764E2A8
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 16:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78320607B2
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 16:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZO8M2VaR3jm for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 16:04:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=nunes.philippe@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 99B4060737
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99B4060737
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99B4060737
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 16:04:33 +0000 (UTC)
Received: from [192.168.109.38] (unknown [213.228.1.188])
 (Authenticated sender: nunes.philippe@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E9A8713F8AD;
 Mon,  6 Jul 2026 18:04:30 +0200 (CEST)
Message-ID: <6de9f250-08a1-4d95-9c83-e2ae0dc36740@free.fr>
Date: Mon, 6 Jul 2026 18:04:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
References: <20260701121937.346945-1-nunes.philippe@free.fr>
 <20260701121937.346945-4-nunes.philippe@free.fr>
 <aktkH6d2PPTgO3XE@L30177.local>
Content-Language: en-US
In-Reply-To: <aktkH6d2PPTgO3XE@L30177.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783353872;
 bh=wv9H8M/6VZLsP8W5uOqjiewQkoUcjjH1h3LhEbsnEk8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kNMhAQ+MoterZp02CJZHjYLJvHQs1PFdhbz3X9hAjJ+EmXkm9esLvj45MDhVvoR/T
 +mn9V/0ELjElGSD9SleAaRUa3GEdgm0P+XHTi4nXy2spZ8eELQ3r1MIUPluMUfNf0i
 3loQ6GVDYeqTp8QYePz+8LUJ/BElPe/y3U1UdFZyB2EOlNNdZciZCY9r3688lw3uN7
 MRfjShYcGjDOYZk/cjn8fNh5Vg1cisQP/FAYfGat/uw1khT6t+Mw/RCUrP5FMT4f6c
 LxPJn9aINBrEFry6GLBerBYuUoMHtbsC/Qim3Pjd6R5tLtfHdqxyBggdnt9y3LQq2D
 3nYkuV3WyewjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kNMhAQ+M
Subject: Re: [Buildroot] [PATCH 3/3] package/qoriq-rcw-c: new package
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
From: Philippe Nunes via buildroot <buildroot@buildroot.org>
Reply-To: Philippe Nunes <nunes.philippe@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwKCk9uIDcvNi8yNiAxMDoxNSwgVmluY2VudCBKYXJkaW4gd3JvdGU6Cj4gSGkg
UGhpbGlwcGUsCj4KPiBUaGFua3MgZm9yIGxlYWRpbmcgYSBCdWlsZHJvb3QgcGFja2FnZSBvbiB0
aGlzIHRvb2wuCj4KPiBTZWUgYmVsb3cgc29tZSBmZXcgY29tbWVudHMsCj4KPiBMZSAwMS8wNy8y
NiAxNDoxOSwgUGhpbGlwcGUgTnVuZXMgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdCA6Cj4+IHFvcmlx
LXJjdy1jIGlzIGEgQyByZWltcGxlbWVudGF0aW9uIG9mIE5YUCdzIHJjdy5weSBDTEkgZm9yIHRo
ZQo+PiBwYmlmb3JtYXQ9MiBRb3JJUSBmYW1pbHkgKExTMTAyOCwgTFMxMDg4LCBMUzIwODgsIExY
MjE2MCkuIEJ1aWx0IG9uCj4+IHRvcCBvZiBsaWJxb3JpcS1yY3csIGl0IGNvbXBpbGVzIGEgLnJj
dyBzb3VyY2UgZmlsZSAocHJlcHJvY2Vzc2VkCj4+IGluLXByb2Nlc3MgdmlhIGxpYm1jcHApIHRv
IHRoZSBiaW5hcnkgUkNXICsgUEJJIGltYWdlIGNvbnN1bWVkIGJ5Cj4+IHRoZSBTb0MgYm9vdHJv
bS4KPj4KPj4gQmV5b25kIHRoZSByY3cucHkgcmVmZXJlbmNlLCBxb3JpcS1yY3ctYyBhZGRzIHR3
byByZWNvdmVyeSBmZWF0dXJlczoKPj4KPj4gICAgLS1kdW1wICAgICAgICByZWFkIHRoZSBsaXZl
IFJDVyBmcm9tIC9kZXYvbWVtIG9uIGEgcnVubmluZyBib2FyZAo+PiAgICAgICAgICAgICAgICAg
IChwb3N0LVBMTC1sb2NrIFJDV1NSIHN0YXRlOyBubyBQQkkgY29tbWFuZHMpCj4+ICAgIC0tZHVt
cC1mbGFzaCAgcmVjb3ZlciB0aGUgUEJMIHByZWFtYmxlICsgUEJJIGNvbW1hbmRzIGZyb20gdGhl
Cj4+ICAgICAgICAgICAgICAgICAgYm9vdHJvbSBzbG90KHMpIGluIE5PUiAvIFNEIC8gZU1NQwo+
IFJpZ2h0LCBidXQgaXQgbWVhbnMgdGhhdCB0aGUgdG9vbCBoYXMgdG8gYmUgY29tcGlsZWQgYW5k
IHJ1biBvbiB0aGUgdGFyZ2V0LAo+IG5vdCB0aGUgaG9zdCBvbmx5LgoKQWNrLiB2MiBhZGRzIEJS
Ml9QQUNLQUdFX1FPUklRX1JDV19DIGFuZCBCUjJfUEFDS0FHRV9MSUJRT1JJUV9SQ1fCoCAodGhl
IAp0YXJnZXQgQ0xJIG5lZWRzIHRoZSB0YXJnZXQgbGlicmFyeSBhdCBydW50aW1lKS4KCj4+ICsr
KyBiL3BhY2thZ2UvcW9yaXEtcmN3LWMvQ29uZmlnLmluLmhvc3QKPj4gQEAgLTAsMCArMSwxOSBA
QAo+PiArY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfUU9SSVFfUkNXX0MKPj4gKwlib29sICJob3N0
IHFvcmlxLXJjdy1jIChDIGltcGxlbWVudGF0aW9uKSIKPj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
SE9TVF9MSUJRT1JJUV9SQ1cKPj4gKwloZWxwCj4+ICsJICBDIENMSSBidWlsdCBvbiB0b3Agb2Yg
bGlicW9yaXEtcmN3IC0tIGEgZmFzdGVyIGRyb3AtaW4KPj4gKwkgIHJlcGxhY2VtZW50IGZvciBO
WFAncyByY3cucHkgZm9yIHRoZSBwYmlmb3JtYXQ9MiBTb0MgZmFtaWx5Cj4+ICsJICAoTFMxMDI4
LCBMUzEwODgsIExTMjA4OCwgTFgyMTYwKS4KPiBUaGUgbWFpbiBiZW5lZml0IChha2EgZmFzdGVy
KSB0byB0aGF0IGl0IGF2b2lkIHB1bGxpbmcvY29tcGlsaW5nCj4gYSBmdWxsIHB5dGhvbiBmcmFt
ZXdvcmsgZm9yIHRoZSBob3N0IG1vZGUsIHNvIHdlIGdldCBhIHF1aWNrIGJ1aWxkLgo+ClJld29y
ZGVkIHRoZSBoZWxwIHRleHQgaW4gdjIgdG8gbWVudGlvbiBhdm9pZGluZyB0aGUgaG9zdCAKUHl0
aG9uwqBkZXBlbmRlbmN5IGV4cGxpY2l0bHkuCgo+PiArCj4+ICsJICBBZGRzIHR3byBjYXBhYmls
aXRpZXMgYmV5b25kIHJjdy5weToKPj4gKwkgICAgLS1kdW1wICAgICAgICAgIHJlYWQgbGl2ZSBS
Q1cgZnJvbSAvZGV2L21lbSBvbiBhIHJ1bm5pbmcKPj4gKwkgICAgICAgICAgICAgICAgICAgIGJv
YXJkIChwb3N0LVBMTC1sb2NrIFJDV1NSIHN0YXRlLCBubyBQQkkpCj4+ICsJICAgIC0tZHVtcC1m
bGFzaCAgICByZWNvdmVyIFBCTCArIFBCSSBmcm9tIHRoZSBib290cm9tIHNsb3QocykKPj4gKwkg
ICAgICAgICAgICAgICAgICAgIGluIE5PUiAvIFNEIC8gZU1NQwo+IE5vLCB0aG9zZSBvcHRpb25z
IGFyZSBub3QgZm9yIHRoZSBob3N0LiBNb3Jlb3ZlciwgdGhlIENvbmZpZy5pbiBkb2VzCj4gbm90
IG5lZWQgdG8gZGV0YWlsIGFsbCB0aGUgcnVudGltZSBvcHRpb25zLgoKRHJvcHBlZCB0aGUgLS1k
dW1wIC8gLS1kdW1wLWZsYXNoIGVudW1lcmF0aW9uIGZyb20gQ29uZmlnLmluIGluIHYyLgoKPj4g
KyMgVGhlIHVwc3RyZWFtIHByb2plY3QgaXMgbmFtZWQgInFvcmlxLXJjdyI7IHRoZSAiLWMiIHN1
ZmZpeCBpbiB0aGUKPj4gKyMgQnVpbGRyb290IHBhY2thZ2UgbmFtZSBkaXN0aW5ndWlzaGVzIGl0
IGZyb20gdGhlIGV4aXN0aW5nCj4+ICsjIGhvc3QtcW9yaXEtcmN3IHBhY2thZ2UgKHdoaWNoIHdy
YXBzIE5YUCdzIHJjdy5weSByZWZlcmVuY2UpLgo+IE5vIG5lZWQgdG8gZHVwbGljYWF0ZSBtYW55
IHRpbWUgdGhlIHNhbWUgaW5mb3JtYXRpb24uCgpSZW1vdmVkIGluIHYyLiBUaGUgIi1jIiBzdWZm
aXggcmF0aW9uYWxlIHN0YXlzIGluIHRoZSBjb21taXQgYm9keSBvbmx5Lgo+PiArUU9SSVFfUkNX
X0NfVkVSU0lPTiA9IDEuMC4xCj4+ICtRT1JJUV9SQ1dfQ19TSVRFID0gJChjYWxsIGdpdGh1Yix2
amFyZGluLHFvcmlxLXJjdyx2JChRT1JJUV9SQ1dfQ19WRVJTSU9OKSkKPj4gK1FPUklRX1JDV19D
X1NPVVJDRSA9IHFvcmlxLXJjdy0kKFFPUklRX1JDV19DX1ZFUlNJT04pLnRhci5nego+PiArCj4+
ICtRT1JJUV9SQ1dfQ19MSUNFTlNFID0gQlNELTMtQ2xhdXNlCj4+ICtRT1JJUV9SQ1dfQ19MSUNF
TlNFX0ZJTEVTID0gTElDRU5TRQo+PiArCj4+ICtIT1NUX1FPUklRX1JDV19DX0RFUEVOREVOQ0lF
UyA9IGhvc3QtbGlicW9yaXEtcmN3Cj4+ICsKPj4gKyMgU2tpcCB0aGUgcGFuZG9jLXJlbmRlcmVk
IG1hbiBwYWdlOiBwYW5kb2MgaXMgYSBoZWF2eSBIYXNrZWxsLQo+PiArIyBydW50aW1lIGJ1aWxk
LXRpbWUgdG9vbCB0eXBpY2FsbHkgYWJzZW50IGZyb20gcGFja2FnZXJzJyBtaW5pbWFsCj4+ICsj
IGltYWdlcywgYW5kIGhvc3QgcGFja2FnZXMgZG9uJ3QgaW5zdGFsbCBtYW4gcGFnZXMgYW55d2F5
LiBUaGUKPj4gKyMgJ21hbicgZmVhdHVyZSBvcHRpb24gbGFuZGVkIHVwc3RyZWFtIGluIHYxLjAu
MS4KPj4gK0hPU1RfUU9SSVFfUkNXX0NfQ09ORl9PUFRTID0gLURtYW49ZGlzYWJsZWQKPiBBIHNo
b3J0IGNvbW1lbnQgc3VjaCBhczoKPj4gKyMgU2tpcCB0aGUgcGFuZG9jLXJlbmRlcmVkIG1hbiBw
YWdlOiBwYW5kb2MgcmVxdWlyZXMgYSBmdWxsIEhhc2tlbGwKCkZpeGVkIGluIHYyIHVzaW5nIHlv
dXIgd29yZGluZy4KClRoYW5rcy4KClBoaWxpcHBlCgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
