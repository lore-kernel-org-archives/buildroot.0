Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB52FF512E
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 18:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1418A40C75;
	Tue,  7 Apr 2026 18:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2TrgDu02p5m; Tue,  7 Apr 2026 18:43:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F99340C80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775587389;
	bh=TJXf4sPYzzF8sACyEAnMUynLXDLg4sPtD+Nhj5JgEyk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=D2Cc03dc/msyN4jOkjux0H5jp4T50czlkj5UMux0TZRytPZlqLvdO47NbQGM2GaAM
	 zrvAD6VcKJN11PHwSyzv4qHjeUuxmIboEPt1B/Xxq9GF7+XNHt1j3D1nye2FY4Zexz
	 XufV38qv4WHUdywL3/igzHUxtWIK/+VIAPagSAWJCoqk5AQvoj7dW/yOcQc2M3jTNK
	 lEjGPNFBPROTJBIEDVNvok5RToS31I802MEPcRGHvXRIR8yqGimT9qXw4jylN5+57U
	 x9/2X+f1p9lhaY+SHVSBJCby+2LM/dEBlSFvyqKgxOL1Hfl8LZcUFoF/bZsayYz6fU
	 x4lwl9a/3eDJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F99340C80;
	Tue,  7 Apr 2026 18:43:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79ED41F6
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 18:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68ABE81268
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 18:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRzufbvPpiNI for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 18:43:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D5C0811F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D5C0811F0
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D5C0811F0
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 18:43:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE520B97BBAD; Tue,  7 Apr 2026 20:43:02 +0200 (CEST)
Message-ID: <06d6220f-2982-4c79-9b7d-6940088a95e1@rnout.be>
Date: Tue, 7 Apr 2026 20:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nathan Bloch <nblochn@gmail.com>, buildroot@buildroot.org
References: <20260319104249.22286-1-Nathan.B@solaredge.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260319104249.22286-1-Nathan.B@solaredge.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1775587383; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=2r+CQeF5A0F36LnB/wRzJL8QEBbs6uxcqrjlprRoAm4=;
 b=iSvJtMmIF1BI2goXw2lSny6GwbkskmBcM4GBv8N8z6D8Wu5H4qUT3MDQxlcNYoi8Lgtoeh
 pOjMKfxS6SxbDgIVWekDZq712ACMnE7vYBD6c2ZpYEKlBFRSR5b1p43MvCQU2PTS0kq54D
 OMBU2ajtstK+rZNMN3fY4n0R2GlDViUgOuhQbUvg7TOtM3pyGafHOOtIDqz3zfcfj6gNiK
 BsdZaXd793W24bxY1V3H9d2klxLYCnSYQEfrKpB+w9YJ/GI7FusZvbFQDx7/XQEaT5/9Tf
 kKNiUUXFpSEMhiB76B3YA4R+7UOtAu4JrpOCDak6810KZvm7aaA9FdOvvMcD3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=iSvJtMmI
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

ICBIaSBOYXRoYW4sCgpPbiAxOS8wMy8yMDI2IDExOjQyLCBOYXRoYW4gQmxvY2ggd3JvdGU6Cj4g
RnJvbTogTmF0aGFuIEJsb2NoIDxuYmxvY2huQGdtYWlsLmNvbT4KPiAKPiBUaGUgc3RlcF90aW1l
IGhvb2sgY2FsbHMgZGF0ZSArJXMuJU4gdG8gbWVhc3VyZSBidWlsZCBzdGVwIGVsYXBzZWQgdGlt
ZS4KPiBXaGVuIFNPVVJDRV9EQVRFX0VQT0NIIGlzIHNldCAoZm9yIHJlcHJvZHVjaWJsZSBidWls
ZHMpLCBHTlUgY29yZXV0aWxzIGRhdGUKPiBlbWl0cyAiV2FybmluZzogdXNpbmcgJFNPVVJDRV9E
QVRFX0VQT0NIIGluc3RlYWQgb2YgdHJ1ZSB0aW1lIiBmb3IgZXZlcnkKPiBjYWxsIOKAlCB0d2lj
ZSBwZXIgc3RlcCwgYWNyb3NzIGFsbCBwYWNrYWdlcywgcmVzdWx0aW5nIGluIGh1bmRyZWRzIG9m
IG5vaXN5Cj4gbG9nIGxpbmVzLgoKICBJIHdhcyBnb2luZyB0byBhcHBseSBidXQganVzdCB0byBi
ZSBzdXJlIEkgdGVzdGVkIG15c2VsZiwgYW5kIG15IChGZWRvcmEgNDMpIApHTlUgY29yZXV0aWxz
IGRhdGUgdHVybnMgb3V0IG5vdCB0byBiZWhhdmUgbGlrZSB0aGF0LiBTbyBJIHdlbnQgdG8gdGhl
IGNvcmV1dGlscyAKc291cmNlIGFuZCBzZWFyY2hlZCBmb3IgU09VUkNFX0RBVEVfRVBPQ0ggYW5k
IGZvciAiaW5zdGVhZCBvZiB0cnVlIHRpbWUiLCBhbmQgCmdvdCBubyBoaXRzIChleGNlcHQgZm9y
IHRoZSBleHBlY3RlZCBvbmVzIGZvciBTT1VSQ0VfREFURV9FUE9DSCkuIEl0IGFjdHVhbGx5IApq
dXN0IHVzZXMgdHJ1ZSB0aW1lLiBJIGFsc28gY2hlY2tlZCB1dXRpbHMgYW5kIGdsaWJjIGp1c3Qg
dG8gYmUgc3VyZSwgZm91bmQgCm5vdGhpbmcgdGhlcmUgZWl0aGVyLgoKICBTbyBpdCBsb29rcyBs
aWtlIHlvdSdyZSB1c2luZyBzb21lIHBhdGNoZWQgdmVyc2lvbiBvZiBHTlUgZGF0ZS4gSSdtIG5v
dCBzdXJlIAppZiBpdCB3b3J0aCBwYXRjaGluZyBCdWlsZHJvb3QgdG8gY2F0ZXIgd2l0aCB0aGF0
LCB1bmxlc3MgeW91J3JlIG9uIHNvbWUgcHJldHR5IAptYWluc3RyZWFtIGRpc3Ryby4KCiAgUmVn
YXJkcywKICBBcm5vdXQKCj4gVW5zZXQgU09VUkNFX0RBVEVfRVBPQ0ggaW5saW5lIGZvciB0aGVz
ZSB0aW1pbmctb25seSBjYWxscywgc2luY2UgdGhleQo+IG1lYXN1cmUgcmVhbCBlbGFwc2VkIHRp
bWUgYW5kIGRvIG5vdCBhZmZlY3QgYnVpbGQgcmVwcm9kdWNpYmlsaXR5Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE5hdGhhbiBCbG9jaCA8bmJsb2NobkBnbWFpbC5jb20+Cj4gLS0tCj4gICBwYWNrYWdl
L3BrZy1nZW5lcmljLm1rIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsg
Yi9wYWNrYWdlL3BrZy1nZW5lcmljLm1rCj4gaW5kZXggYTI3NDkzMjAuLmU0YmY2ZGVmIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsKPiArKysgYi9wYWNrYWdlL3BrZy1nZW5l
cmljLm1rCj4gQEAgLTUwLDcgKzUwLDcgQEAgZW5kZWYKPiAgICMgVGltZSBzdGVwcwo+ICAgZGVm
aW5lIHN0ZXBfdGltZQo+ICAgCXByaW50ZiAiJXM6JS01LjVzOiUtMjAuMjBzOiAlc1xuIiAgICAg
ICAgICAgXAo+IC0JICAgICAgICIkJChkYXRlICslcy4lTikiICIkKDEpIiAiJCgyKSIgIiQoMyki
ICBcCj4gKwkgICAgICAgIiQkKFNPVVJDRV9EQVRFX0VQT0NIPSBkYXRlICslcy4lTikiICIkKDEp
IiAiJCgyKSIgIiQoMykiICBcCj4gICAJICAgICAgID4+IiQoQlVJTERfRElSKS9idWlsZC10aW1l
LmxvZyIKPiAgIGVuZGVmCj4gICBHTE9CQUxfSU5TVFJVTUVOVEFUSU9OX0hPT0tTICs9IHN0ZXBf
dGltZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
