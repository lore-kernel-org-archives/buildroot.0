Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A131073C85
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 09:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3619C8235B;
	Wed,  8 Apr 2026 09:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vgdh_ifTmdl; Wed,  8 Apr 2026 09:57:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F7FE8230B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775642246;
	bh=yExNRQjPd1eXiOPUTVF/huZgVkyCbtHLq+uZ4o6w58c=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Jio8DSFvYAr4kUO+xQ9WzXLxKJXVM2StmEn02YYtgQZl3y+Hs0zbwiD4vvE4VmvYU
	 ceo0b+0ImwGQv1eglaBRFUH1+k2ZrmgB/pHAz5SYxJvWXQMIvva+BxUOe5ljeYCTMQ
	 jn/RSwpit98kkGu2bQ1rm2uK+3XYfe5DP6ZR+IlhD5KfSo1K5f6rfbyeYdXQj+wMVt
	 qHzjulg9u31xaq4sBzisow4t0W/CO03vUUI+rswFdrNuY/rCetFuD5ksQdYJjwmlou
	 Rqbn5gJnixqOdjagke1alwD6qhWQZrlzmOQgZMIcLOB0s+opK7OnhYl0KRtyEwDWCu
	 YA0t+3Vnca8XA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F7FE8230B;
	Wed,  8 Apr 2026 09:57:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A64B11F6
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 09:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C65540EC6
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 09:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5rNhqB_h4UE for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 09:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C06740EC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C06740EC4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C06740EC4
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 09:57:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 85B20B97BBE0; Wed,  8 Apr 2026 11:57:20 +0200 (CEST)
Message-ID: <e9427dfd-f603-4ace-aa2b-77ea68f8986d@rnout.be>
Date: Wed, 8 Apr 2026 11:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
 Nathan Bloch <nblochn@gmail.com>, buildroot@buildroot.org
References: <20260319104249.22286-1-Nathan.B@solaredge.com>
 <06d6220f-2982-4c79-9b7d-6940088a95e1@rnout.be>
 <9deec371-1edd-4ff0-9678-0caa53aa47f8@green-communications.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <9deec371-1edd-4ff0-9678-0caa53aa47f8@green-communications.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1775642241; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=miG5VdVzzqX5HHolO7o4T1iXFn1js5BYIWUjVvLQabo=;
 b=JdhfZ6xvdCXXZ7/WD1luWF0l6qFjbU6801F/r4jH7Bb1VuzADoBxjfTl85n305zNyBAkWU
 3cqa5eWZEoWhlhq3fbcNdKBu1KMNiAZ3iXd7YgC09oPB3+fh6qSbQsxZrYQbTkSF/Q9B+B
 VZyAW1q55BbBhhme6oM54fPaqdOUzAbi32spVXNUNOQwMCaRxW2Yaf55ZkxNEHjY6h8uB5
 D8YLCLZ9EunJnhvoLnn2BLfEBYUOLsaRYTO4cYyNI644EBWWWx33vPivaJT8kPS6125Pxc
 weVCld+RjWfrScpcmgPFJITqiz8Z/n40x0m5eBOUeCXqg/b8gd6o7jx5GM+m3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=JdhfZ6xv
Subject: Re: [Buildroot] [PATCH] pkg-generic: suppress SOURCE_DATE_EPOCH
 warning in step_time
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8wNC8yMDI2IDExOjI5LCBOaWNvbGFzIENhdmFsbGFyaSB3cm90ZToKPiBPbiA0Lzcv
MjYgMjA6NDIsIEFybm91dCBWYW5kZWNhcHBlbGxlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+IMKg
wqBIaSBOYXRoYW4sCj4+Cj4+IE9uIDE5LzAzLzIwMjYgMTE6NDIsIE5hdGhhbiBCbG9jaCB3cm90
ZToKPj4+IEZyb206IE5hdGhhbiBCbG9jaCA8bmJsb2NobkBnbWFpbC5jb20+Cj4+Pgo+Pj4gVGhl
IHN0ZXBfdGltZSBob29rIGNhbGxzIGRhdGUgKyVzLiVOIHRvIG1lYXN1cmUgYnVpbGQgc3RlcCBl
bGFwc2VkIHRpbWUuCj4+PiBXaGVuIFNPVVJDRV9EQVRFX0VQT0NIIGlzIHNldCAoZm9yIHJlcHJv
ZHVjaWJsZSBidWlsZHMpLCBHTlUgY29yZXV0aWxzIGRhdGUKPj4+IGVtaXRzICJXYXJuaW5nOiB1
c2luZyAkU09VUkNFX0RBVEVfRVBPQ0ggaW5zdGVhZCBvZiB0cnVlIHRpbWUiIGZvciBldmVyeQo+
Pj4gY2FsbCDigJQgdHdpY2UgcGVyIHN0ZXAsIGFjcm9zcyBhbGwgcGFja2FnZXMsIHJlc3VsdGlu
ZyBpbiBodW5kcmVkcyBvZiBub2lzeQo+Pj4gbG9nIGxpbmVzLgo+Pgo+PiDCoMKgSSB3YXMgZ29p
bmcgdG8gYXBwbHkgYnV0IGp1c3QgdG8gYmUgc3VyZSBJIHRlc3RlZCBteXNlbGYsIGFuZCBteSAo
RmVkb3JhIDQzKSAKPj4gR05VIGNvcmV1dGlscyBkYXRlIHR1cm5zIG91dCBub3QgdG8gYmVoYXZl
IGxpa2UgdGhhdC4gU28gSSB3ZW50IHRvIHRoZSAKPj4gY29yZXV0aWxzIHNvdXJjZSBhbmQgc2Vh
cmNoZWQgZm9yIFNPVVJDRV9EQVRFX0VQT0NIIGFuZCBmb3IgImluc3RlYWQgb2YgdHJ1ZSAKPj4g
dGltZSIsIGFuZCBnb3Qgbm8gaGl0cyAoZXhjZXB0IGZvciB0aGUgZXhwZWN0ZWQgb25lcyBmb3Ig
U09VUkNFX0RBVEVfRVBPQ0gpLiAKPj4gSXQgYWN0dWFsbHkganVzdCB1c2VzIHRydWUgdGltZS4g
SSBhbHNvIGNoZWNrZWQgdXV0aWxzIGFuZCBnbGliYyBqdXN0IHRvIGJlIAo+PiBzdXJlLCBmb3Vu
ZCBub3RoaW5nIHRoZXJlIGVpdGhlci4KPj4KPj4gwqDCoFNvIGl0IGxvb2tzIGxpa2UgeW91J3Jl
IHVzaW5nIHNvbWUgcGF0Y2hlZCB2ZXJzaW9uIG9mIEdOVSBkYXRlLiBJJ20gbm90IHN1cmUgCj4+
IGlmIGl0IHdvcnRoIHBhdGNoaW5nIEJ1aWxkcm9vdCB0byBjYXRlciB3aXRoIHRoYXQsIHVubGVz
cyB5b3UncmUgb24gc29tZSAKPj4gcHJldHR5IG1haW5zdHJlYW0gZGlzdHJvLgo+IAo+IFlvdSBu
ZWVkIHRvIGVuYWJsZSBCUjJfUkVQUk9EVUNJQkxFIHRvIGhhdmUgcGFja2FnZS9mYWtlZGF0ZS9m
YWtlZGF0ZSBpbnN0YWxsZWQgCj4gYXMgaG9zdC9iaW4vZGF0ZSB0byBvYmV5IFNPVVJDRV9EQVRF
X0VQT0NILgoKICBEJ29oLCBJIG1pc3NlZCB0aGF0LgoKICBIb3dldmVyLCBob3cgY29tZSBob3N0
L2Jpbi9kYXRlIGdldHMgdXNlZCBpbiB0aGUgdGltaW5nIHN0ZXA/ICQoSE9TVF9ESVIpL2JpbiAK
ZG9lc24ndCBnZXQgZXhwb3J0ZWQgdG8gUEFUSCwgc28gaXQgc2hvdWxkIG9ubHkgZ2V0IHVzZWQg
aW4gdGhlIGFjdHVhbCBidWlsZCBhbmQgCmNvbmZpZ3VyZSBzdGVwcyAod2hpY2ggdXNlIFBBVEg9
JChCUl9QQVRIKSkuCgogIEkgdHJpZWQgaXQgbG9jYWxseSAod2l0aCBCUjJfUkVQUk9EVUNJQkxF
PXkgb2J2aW91c2x5KSBhbmQgSSBkb24ndCBzZWUgdGhpcyBpc3N1ZS4KCiAgUmVnYXJkcywKICBB
cm5vdXQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
