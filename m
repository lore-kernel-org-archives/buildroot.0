Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF02CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68303606F0;
	Mon,  1 Jun 2026 20:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9rlmsNtPRng; Mon,  1 Jun 2026 20:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F607606EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780344806;
	bh=I0dqQIodZG9Jx3X6Bd9qjyuWvMhSC2Vqk/rJelw1Vig=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s9LzLOUaIsI04AE//sjphTV0DWPV7X91gQLB1oOFezFG/AU2wsWVfdcbVH3rNjxcL
	 Y94xMQ2kaSGndXA+1tC10uXYHYjcn+4vz+JTioYn9B6+YMRZpWj99/5nJCzsSRG6e/
	 8MqBtYaDqvTs8LArX3DzYgTUDFj9a/g02WVhWkrThrJGmEWNDziw1MwQu9rkS3J3aX
	 B2Y0tGCF+qGIiyq3ecTut7HwDKDEGNAL09ndGtkPs8fNQjfOrKMyLNXicwfquXwnd4
	 4MhI+hrj5TlwASGao9auK0EN9duBV5SA+cnh9DL7FtRgDxUxucs0bcPRNjf/jKIn1R
	 BN/358oNYIisA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F607606EF;
	Mon,  1 Jun 2026 20:13:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 90E64223
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76FD5606EF
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWLpHBT7Uk2X for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:13:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 77E2A606ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77E2A606ED
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77E2A606ED
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:13:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50512B97C39F; Mon,  1 Jun 2026 22:13:21 +0200 (CEST)
Message-ID: <96202b93-324c-4514-ac99-2381e50088fb@rnout.be>
Date: Mon, 1 Jun 2026 22:13:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Guillaume Chaye <guillaume.chaye@zeetim.com>
References: <20260531143820.2967481-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260531143820.2967481-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780344802; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=hGZFmA3T5pmeONZa7HJ3qAPMss0X6W5tx8VHRVqTI/4=;
 b=ZE0CSuEjZ+2S6LmHiQyzicuubxNFzOBsxaB5gyKOgPXHGxhkFkgwmIqCFrF7ieDCjHyV59
 VCLa5NkOXdXf8FJSHgk2xccp0rqclGveHFse+SPhEFK6vyaESwawxLlGcPVU+1f1FFjsNs
 gVnn/dyJJRlpwK3CZ2ZQ7DDoKeWk5LCdKYwjUcjcFVCowDkZmqm/4G2LFl+pgFtBXr5BxK
 YYbeBrrFD7Mj4alwyV8MGN/QkR0wFnWyLxwRD2tqTEi8uyXXQCOQN0s5Cb6Rur+85IpXwW
 GAe9dqAnb5RBr1HuedVdGoe5hdbGWspcCy2anQL34A/XEOs7wCo5dKZ4e/Q+wA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=ZE0CSuEj
Subject: Re: [Buildroot] [PATCH/next 1/3] package/sane-backends: bump
 version to 1.4.0
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

CgpPbiAzMS8wNS8yMDI2IDE2OjM4LCBCZXJuZCBLdWhscyB3cm90ZToKPiBodHRwczovL2dpdGxh
Yi5jb20vc2FuZS1wcm9qZWN0L2JhY2tlbmRzLy0vcmVsZWFzZXMvMS4yLjEKPiBodHRwczovL2dp
dGxhYi5jb20vc2FuZS1wcm9qZWN0L2JhY2tlbmRzLy0vcmVsZWFzZXMvMS4zLjEKPiBodHRwczov
L2dpdGxhYi5jb20vc2FuZS1wcm9qZWN0L2JhY2tlbmRzLy0vcmVsZWFzZXMvMS40LjAKPiAKPiBS
ZW1vdmVkIHBhdGNoIHdoaWNoIGlzIGluY2x1ZGVkIGluIHRoaXMgcmVsZWFzZS4KPiAKPiBBZGRl
ZCBzaGEyNTYgdGFyYmFsbCBwcm92aWRlZCBieSB1cHN0cmVhbS4KPiAKPiBBZGRlZCBidWlsZCBm
aXggZm9yIG1pY3JvYmxhemVlbC9taXBzZWwvcG93ZXJwYyB3aGVuIHVzZWQgd2l0aCB1Q2xpYmMK
PiB0byBmaXggYSBidWlsZCBlcnJvciBkZXRlY3RlZCBieSB0aGUgR2l0bGFiIHBpcGVsaW5lczoK
CiAgVGhlIGZpeCB3YXMgZmFpcmx5IHdlaXJkIHNvIEkgZG9jdW1lbnRlZCBpdCBiZXR0ZXI6Cgog
ICAgIEZpeCB0aGlzIGJ5IGRpc2FibGluZyB0aGF0IGJhY2tlbmQgdW5kZXIgdGhvc2UgY29uZGl0
aW9ucy4gVGhlIHByb3BlcgogICAgIHdheSB0byBkbyB0aGF0IHdvdWxkIGJlIHRvIHBhdGNoIGNv
bmZpZ3VyZS5hYyB0byBhZGQgYW4gb3B0aW9uIHRvCiAgICAgZXhjbHVkZSBzcGVjaWZpYyBiYWNr
ZW5kcywgYW5kIHRoZW4gZ2l2ZSB0aGUgY29ycmVzcG9uZGluZyBDT05GX09QVC4KICAgICBIb3dl
dmVyLCB0aGF0J3MgcXVpdGUgYSBjb21wbGV4IHBhdGNoIGZvciBzdWNoIGEgY29ybmVyIGNhc2Us
IHNvIGluc3RlYWQKICAgICBzaW1wbHkgcGF0Y2ggY29uZmlndXJlIHRvIHJlbW92ZSB0aGUgdW1h
eF9wcCBiYWNrZW5kIGZyb20gQUxMX0JBQ0tFTkRTLgogICAgIFdlIG9ubHkgd2FudCB0byBkbyB0
aGlzIGNvbmRpdGlvbmFsbHksIHNvIGRvIGl0IHdpdGggc2VkIGluIGEgcG9zdC1wYXRjaAogICAg
IGhvb2sgcmF0aGVyIHRoYW4gd2l0aCBhIHBhdGNoLgoKPiAKPiB1bWF4X3BwX2xvdy5jOiBJbiBm
dW5jdGlvbiDigJhzYW5laV91bWF4X3BwX2luaXRQb3J04oCZOgo+IHVtYXhfcHBfbG93LmM6ODM1
Ojc6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnaW9wbCcKPiAgIFst
V2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgIDgzNSB8ICAgaWYgKGlvcGwgKDMp
ICE9IDApCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1
bHRzLzM2NC8zNjRiZmEyOWY5ZGYxNjA3OWRkMTBiZTYyOGRkZWZjZjgwZjU4MWY5Lwo+IAo+IFNp
Z25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gLS0tCgoKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9zYW5lLWJhY2tlbmRzL3NhbmUtYmFja2VuZHMubWsgYi9wYWNrYWdl
L3NhbmUtYmFja2VuZHMvc2FuZS1iYWNrZW5kcy5tawo+IGluZGV4IGZlODllNzc0N2QuLmJmOTIx
Njc5MDIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zYW5lLWJhY2tlbmRzL3NhbmUtYmFja2VuZHMu
bWsKPiArKysgYi9wYWNrYWdlL3NhbmUtYmFja2VuZHMvc2FuZS1iYWNrZW5kcy5tawo+IEBAIC00
LDkgKzQsOSBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+IC1TQU5F
X0JBQ0tFTkRTX1ZFUlNJT04gPSAxLjEuMQo+ICtTQU5FX0JBQ0tFTkRTX1ZFUlNJT04gPSAxLjQu
MAo+ICAgU0FORV9CQUNLRU5EU19TSVRFID0gXAo+IC0JaHR0cHM6Ly9naXRsYWIuY29tL3NhbmUt
cHJvamVjdC9iYWNrZW5kcy91cGxvYWRzLzdkMzBmYWI0ZTExNTAyOWQ5MTAyN2I2YTU4ZDY0YjQz
Cj4gKwlodHRwczovL2dpdGxhYi5jb20vLS9wcm9qZWN0LzQyOTAwOC91cGxvYWRzLzg0M2MxNTY0
MjBlMjExODU5ZTk3NGY3OGY2NGMzZWEzCj4gICBTQU5FX0JBQ0tFTkRTX0NPTkZJR19TQ1JJUFRT
ID0gc2FuZS1jb25maWcKPiAgIFNBTkVfQkFDS0VORFNfTElDRU5TRSA9IEdQTC0yLjArCj4gICBT
QU5FX0JBQ0tFTkRTX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gQEAgLTgxLDYgKzgxLDE1IEBA
IGVuZGVmCj4gICAKPiAgIFNBTkVfQkFDS0VORFNfUE9TVF9DT05GSUdVUkVfSE9PS1MgKz0gU0FO
RV9CQUNLRU5EU19ESVNBQkxFX0RPQ1MKPiAgIAo+ICsjIHVDbGliYyBkb2VzIG5vdCBwcm92aWRl
IGlvcGwoKSBvbiB0aGVzZSBwbGF0Zm9ybXM6Cj4gKyMgdW1heF9wcF9sb3cuYzo4MzU6NzogZXJy
b3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdpb3BsJwo+ICtkZWZpbmUgU0FO
RV9CQUNLRU5EU19ESVNBQkxFX1VNQVhfUFAKCiAgV2Ugbm9ybWFsbHkgcHV0IHRoZSBob29rIGNv
ZGUgaXRzZWxmIHdpdGhpbiB0aGUgY29uZGl0aW9uLiBUaGlzIGhhcyB0aGUgYWRkZWQgCmFkdmFu
dGFnZSBvZiBwdXR0aW5nIHRoZSAib24gdGhlc2UgcGxhdGZvcm1zIiBjbG9zZXIgdG8gdGhlIGxp
c3Qgb2YgcGxhdGZvcm1zLgoKPiArCSQoU0VEKSAncy91bWF4X3BwIC8vJyAkKEBEKS9jb25maWd1
cmUKPiArZW5kZWYKPiAraWZlcSAoJChCUjJfbWljcm9ibGF6ZWVsKSQoQlIyX21pcHNlbCkkKEJS
Ml9wb3dlcnBjKSQoQlIyX1RPT0xDSEFJTl9VU0VTX1VDTElCQykseXkpCj4gK1NBTkVfQkFDS0VO
RFNfUE9TVF9FWFRSQUNUX0hPT0tTICs9IFNBTkVfQkFDS0VORFNfRElTQUJMRV9VTUFYX1BQCgog
IFNob3VsZCBiZSBhIHBvc3QtcGF0Y2ggaW5zdGVhZCBvZiBhIHBvc3QtZXh0cmFjdCBob29rLgoK
CiAgSSBhcHBsaWVkIHRoaXMgdG8gbmV4dCwgbm90IG1hc3RlciwgZXZlbiB0aG91Z2ggaXQgZml4
ZXMgc29tZSBhdXRvYnVpbGQgCmVycm9ycy4gSSBoYXZlIHRoZSBpbXByZXNzaW9uIHRoYXQgdGhl
IGF1dG9idWlsZCBlcnJvcnMgYXJlIG1vcmUgY29ybmVyIGNhc2VzIAooZS5nLiBHQ0MgMTUsIHdo
aWNoIGlzIHN0aWxsICJibGVlZGluZyBlZGdlIiBpbiBtYXN0ZXIpIGFuZCB0aGV5IGhhdmUgYmVl
biAKaGFwcGVuaW5nIGZvciBhIHZlcnkgbG9uZyB0aW1lIGFscmVhZHkgYW55d2F5LiBBbHNvIHRo
ZSBidW1wIGlzIG5vdCBmdWxseSAKc3RyYWlnaGZvcndhcmQuCgoKICBOb3RlIGFnYWluIHRoYXQg
aXQncyBhbm5veWluZyBmb3IgdXMgdG8gbWl4IHBhdGNoZXMgZm9yIG5leHQgYW5kIG1hc3RlciBp
biBhIApzaW5nbGUgc2VyaWVzLgoKICBSZWdhcmRzLAogIEFybm91dAoKCgo+ICtlbmRpZgo+ICsK
PiAgIGRlZmluZSBTQU5FX0JBQ0tFTkRTX1VTRVJTCj4gICAJc2FuZWQgLTEgc2FuZWQgLTEgKiAv
ZXRjL3NhbmUuZCAtIC0gU2FuZWQgVXNlcgo+ICAgZW5kZWYKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
