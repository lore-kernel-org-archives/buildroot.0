Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602661125853
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 15:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A62541EA3;
	Thu, 12 Mar 2026 15:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1vXyq3QVulR; Thu, 12 Mar 2026 15:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D858B41D79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773330929;
	bh=IYvLtvEuH46qcOCsxtjCqFN78rODjbOPSNlYl87f8Wo=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KYIOKRVeQGzGd8QNSnz+NTTUO0NfiSRxU0DKXmARRbKbFiZrdh+ophCyO6qQAU/0m
	 qz6CoqzsD5CMDedSFCKO/CrEwGadV76YR6UPLFhtxYGZk/KMR4y/uqZ/y5H8fdAjPs
	 /tZxTDG/79HL1Qo23L0R9Wd5Z9/i0MuRe4coe6yGc7NV3UsVdkrAt9+fCMx8CM3hXq
	 lyhB0pIOiS47wugnd9GHz/5lk7w9ejqN6MYxmtcH/O2EmFximsOgj6DnLR9i7yRwHB
	 sW9nZ2OKuhynJaxlI6ha7DITSyza7aBnsd+ECREXk6EEnQV1Tl6m8yb52dmdwHNtE4
	 ZYAcsix4zizUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D858B41D79;
	Thu, 12 Mar 2026 15:55:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B28A282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 15:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 006CB61474
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 15:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNhOcwawUEWs for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 15:55:27 +0000 (UTC)
X-Greylist: delayed 333 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 12 Mar 2026 15:55:26 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB1C06E769
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB1C06E769
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB1C06E769
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 15:55:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FA4E165C;
 Thu, 12 Mar 2026 08:49:46 -0700 (PDT)
Received: from debian (X72Y076X74-2.nice.arm.com [10.34.125.7])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09BDC3F694;
 Thu, 12 Mar 2026 08:49:51 -0700 (PDT)
Date: Thu, 12 Mar 2026 16:49:49 +0100
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>
Message-ID: <abLgnUw4NQAuAgAx@debian>
Mail-Followup-To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Dick Olsson <hi@senzilla.io>
References: <20260227215711.1232099-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260227215711.1232099-1-ju.o@free.fr>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: Re: [Buildroot] [PATCH next 1/3] configs/aarch64_efi: switch to
 external toolchain
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBGZWIgMjcsIDIwMjYgYXQgMTA6NTc6MDlQTSArMDEwMCwgSnVsaWVuIE9saXZhaW4g
dmlhIGJ1aWxkcm9vdCB3cm90ZToKCkhpIEp1bGllbiwKClRoYW5rcyBmb3IgcmVmcmVzaGluZyBh
YXJjaDY0LWVmaS4KCkkgdmVyaWZpZWQgdGhhdCB0aGlzIHBhdGNoIHNlcmllcyBkb2VzIGluZGVl
ZCB3b3JrIGZpbmUgb24gQ29tcHVsYWIKSU9ULUdBVEUtaU1YOCAoZU1NQyksIFJPQ0tQcm82NCAo
U0QgY2FyZCksIFFlbXUgdmlydCwgUWVtdSBTQlNBIGFuZCBGVlAgQmFzZQpSZXZDLgoKRmVlbCBm
cmVlIHRvIGFkZCAob3Igbm90KToKCiAgVGVzdGVkLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+CgpCZXN0IHJlZ2FyZHMsClZpbmNlbnQuCgo+IFRoaXMgY29tbWl0
IHN3aXRjaGVzIHRoZSBhYXJjaDY0X2VmaV9kZWZjb25maWcgdG8gYW4gZXh0ZXJuYWwgZ2xpYmMK
PiBzdGFibGUgQm9vdGxpbiB0b29sY2hhaW4sIHRvIGZvbGxvdyByZWNvbW1lbmRhdGlvbiBmcm9t
IFsxXS4KPiAKPiBTaW5jZSBhbiBleHRlcm5hbCB0b29sY2hhaW4gaXMgdXNlZCwgdGhlIGxpbnV4
LWhlYWRlcnMuaGFzaCBjdXN0b20KPiBoYXNoIGZpbGUgaXMgbm8gbG9uZ2VyIG5lZWRlZCBhbmQg
aXMgcmVtb3ZlZC4KPiAKPiBbMV0gaHR0cHM6Ly9lbGludXgub3JnL0J1aWxkcm9vdDpEZXZlbG9w
ZXJEYXlzRUxDRTIwMjQjUnVsZXNfZm9yX2RlZmNvbmZpZ3MKPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IC0tLQo+ICBib2FyZC9hYXJjaDY0LWVmaS9w
YXRjaGVzL2xpbnV4LWhlYWRlcnMvbGludXgtaGVhZGVycy5oYXNoIHwgMSAtCj4gIGNvbmZpZ3Mv
YWFyY2g2NF9lZmlfZGVmY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsr
Ky0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
IGRlbGV0ZSBtb2RlIDEyMDAwMCBib2FyZC9hYXJjaDY0LWVmaS9wYXRjaGVzL2xpbnV4LWhlYWRl
cnMvbGludXgtaGVhZGVycy5oYXNoCj4gCj4gZGlmZiAtLWdpdCBhL2JvYXJkL2FhcmNoNjQtZWZp
L3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2ggYi9ib2FyZC9hYXJjaDY0
LWVmaS9wYXRjaGVzL2xpbnV4LWhlYWRlcnMvbGludXgtaGVhZGVycy5oYXNoCj4gZGVsZXRlZCBm
aWxlIG1vZGUgMTIwMDAwCj4gaW5kZXggNTgwOGQ5MmFmZS4uMDAwMDAwMDAwMAo+IC0tLSBhL2Jv
YXJkL2FhcmNoNjQtZWZpL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2gK
PiArKysgL2Rldi9udWxsCj4gQEAgLTEgKzAsMCBAQAo+IC0uLi9saW51eC9saW51eC5oYXNoCj4g
XCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYWFyY2g2
NF9lZmlfZGVmY29uZmlnIGIvY29uZmlncy9hYXJjaDY0X2VmaV9kZWZjb25maWcKPiBpbmRleCAz
YWE2NDljZjljLi4yYmM2NzQwZWFmIDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3MvYWFyY2g2NF9lZmlf
ZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy9hYXJjaDY0X2VmaV9kZWZjb25maWcKPiBAQCAtMSw1
ICsxLDcgQEAKPiAgQlIyX2FhcmNoNjQ9eQo+IC1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURF
UlNfQ1VTVE9NXzZfMTE9eQo+ICtCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiArQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTF9CT09UTElOPXkKPiArQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElO
X0FBUkNINjRfR0xJQkNfU1RBQkxFPXkKPiAgQlIyX0dMT0JBTF9QQVRDSF9ESVI9ImJvYXJkL2Fh
cmNoNjQtZWZpL3BhdGNoZXMiCj4gIEJSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVM9eQo+
ICBCUjJfUk9PVEZTX0RFVklDRV9DUkVBVElPTl9EWU5BTUlDX0VVREVWPXkKPiAtLSAKPiAyLjUz
LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
