Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC4DC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 534964030E;
	Thu,  9 May 2024 16:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWoRXXKmuoy4; Thu,  9 May 2024 16:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 100FF41DA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 100FF41DA5;
	Thu,  9 May 2024 16:16:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AD421BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7215D41D7C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lv4VDQFeKdWk for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:16:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2F2241D75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2F2241D75
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2F2241D75
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:16:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB855E0004;
 Thu,  9 May 2024 16:16:02 +0000 (UTC)
Date: Thu, 9 May 2024 18:16:02 +0200
To: Moritz =?UTF-8?B?U3Ryw7xiZQ==?= via buildroot <buildroot@buildroot.org>
Message-ID: <20240509181602.3ce82bb1@windsurf>
In-Reply-To: <fm-32642-2024042316454638a76fed21d3a8dc75-KB_QAw@errorhandling.siemens-energy.com>
References: <fm-32642-2024042316454638a76fed21d3a8dc75-KB_QAw@errorhandling.siemens-energy.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715271363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xGJblZ0KY1hgavnvfQf7Z5f0O2brum4NCk201dPH7Yw=;
 b=jZyvK1D22oJO9nmBKNGd6V1EsS+0LlvlHuQv7HIlcOptg7Vx5ew6iDifMEUc3U5XHO0VWJ
 SeoNI67lxJQaAr8f29OpwiC4ylVXXBn4HLPSy8d8PNcRuanuf4HgmZ1AWaM+zKYJQUKi1a
 W10LqLqcMH832xwtI/dlfgs8yPFc372ia2I5tDRMj936I52LraStGZPYePqhK8cssthfRu
 gC29SCT+51CjI45XnbrQOLXTixw3TAKoQDwAa3MhskGVTUbEE8om3IKTx6smfYjaabiHrW
 HhPzYLF771iS2G75RCiooYdW9+hvzVvw1SATW1r4ZZzCTlqFwMm5ShpgSDsZ2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jZyvK1D2
Subject: Re: [Buildroot] [PATCH 1/1] linux: add Linux 6.1 CIP-Kernel
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Moritz =?UTF-8?B?U3Ryw7xiZQ==?= <moritz.struebe@siemens-energy.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTW9yaXR6LAoKT24gVHVlLCAyMyBBcHIgMjAyNCAxODo0NTozNyArMDIwMApNb3JpdHog
U3Ryw7xiZSB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+
IFRoaXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgNi4xIENJUC1LZXJuZWwuIEFzIHRoZSA1Ljgga2Vy
bmVsIGlzIHBsYW5uZWQKPiB0byBiZSBtZWFpbnRhaW5lZCB1bnRpbCAyMDIzIEkgYWRkZWQgYWRk
aXRpb25hbCBvcHRpb25zIGZvciB0aG9zZQo+IHN0YXJ0aW5nIG5ldyBwcm9qZWN0cy4KPiBBbHNv
IHVwZGF0ZSB0aGUgZG9jdW1lbnRhdGlvbiB0byByZWZsZWN0IHRoZSBjdXJyZW50IEVPTCBkYXRl
IGluc3RlYWQgb2YKPiBqdXN0IHN0YXRpbmcgdGhhdCBpdCB3aWxsIGJlIG1lYWludGFpbmVkIGZv
ciAxMCB5ZWFycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNb3JpdHogU3Ryw7xiZSA8bW9yaXR6LnN0
cnVlYmVAc2llbWVucy1lbmVyZ3kuY29tPgo+IC0tLQo+ICBsaW51eC9Db25maWcuZXh0LmluIHwg
IDIgKysKPiAgbGludXgvQ29uZmlnLmluICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLQo+ICBsaW51eC9saW51eC5oYXNoICAgIHwgIDIgKysKPiAgbGludXgvbGludXgu
bWsgICAgICB8ICAyICstCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKClRoYW5rcyBmb3IgdGhlIHBhdGNoLiBNeSBxdWVzdGlvbiBpcyB3aGF0IGRv
ZXMgdGhlIENJUCA2LjEga2VybmVsCmJyaW5ncyB0aGF0IHRoZSAib2ZmaWNpYWwgc3RhYmxlIDYu
MSIgZG9lc24ndCBicmluZz8gSW5kZWVkIG9mZmljaWFsCjYuMSBpcyBzdGlsbCBtYWludGFpbmVk
IGJ5IEdLSCB1bnRpbCBEZWMgMjAyNi4gSSBkbyB1bmRlcnN0YW5kIHRoZQp2YWx1ZSBvZiBDSVAg
d2hlbiBpdCBwaWNrcyB1cCBtYWludGVuYW5jZSBhZnRlciB0aGUgIm1haW4iIGtlcm5lbApjb21t
dW5pdHkgZ2l2ZXMgdXAsIGJ1dCBmb3Igc29tZXRoaW5nIHN0aWxsIG1haW50YWluZWQ/CgpUaGlz
IHF1ZXN0aW9uIGluIGZhY3QgYWxzbyBhcHBsaWVzIHRvIHRoZSBjdXJyZW50IENJUCA1LjEwIGtl
cm5lbCB3ZQphbHJlYWR5IGhhdmUsIGFzIDUuMTAgaXMgc3RpbGwgbWFpbnRhaW5lZCB1cHN0cmVh
bSwgYWxzbyB1bnRpbCBEZWMgMjAyNi4KCldvdWxkbid0IGl0IG1ha2UgbW9yZSBzZW5zZSB0byBo
YXZlIHRoZSBDSVAgNC40IGtlcm5lbCBpbiBCdWlsZHJvb3QsCmZvciB3aGljaCB0aGVyZSBpcyBu
byBsb25nZXIgYW55IG1haW50ZW5hbmNlIHVwc3RyZWFtLCBhbmQgdGhlcmVmb3JlCmZvciB3aGlj
aCB0aGUgQ0lQIGVmZm9ydCBkb2VzIG1ha2Ugc2Vuc2U/CgpUaGFua3MgYSBsb3QgZm9yIHlvdXIg
ZmVlZGJhY2ssCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
