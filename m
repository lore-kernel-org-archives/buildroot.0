Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C232C5516E
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 18:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 492DA81108;
	Thu, 30 Jul 2026 18:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPlAvGcT9QJe; Thu, 30 Jul 2026 18:15:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5575B81109
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785435308;
	bh=gFkXfNT6HnIu7qaWzW9dHIa77ED3jHNab8Pb5nugCjU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=chBEqBPGwU7eXiQz022qULJbgovpa66j+1+Va7ti4AHdsCHl+USa3BeH5DWz2YMhY
	 2sMs7r+3Ml+uiE6QeApeal2qpk12i+RXA9VB/49qmkUqV2hGS9YC7luQbgnqXs8OsV
	 mRItsJkcVX2fKhJMQYnEsMOSsomE7MQWwsGzFOcvRYe8rtfOPzTorA66AeP/bDfSln
	 WK6MwXefzoFxJ1FCKsGM9v5CGYqxGFSsiCjCoccCTiewhFxBiyr6toYADiciOAgPzN
	 CP06SjSa6AbRl2Yav44Nyy3KQPTC9i7PaGLVjioZVbYWYTHnALtduhm+R9xdPfQUBM
	 Z9OF821j47HzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5575B81109;
	Thu, 30 Jul 2026 18:15:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8760352
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 18:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A7FE60A62
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 18:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZXZk5GSFv-o for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 18:15:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 53DE860A5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53DE860A5C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53DE860A5C
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 18:15:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50ADBB977D96; Thu, 30 Jul 2026 20:14:56 +0200 (CEST)
Message-ID: <638ca326-29a3-499b-b8b0-57c9fc24ca1e@rnout.be>
Date: Thu, 30 Jul 2026 20:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Laszlo Ersek <laszlo.ersek@arm.com>
Cc: Arnout Vandecappelle <arnout@mind.be>,
 Oleg Lyovin <ovlevin@sberdevices.ru>, buildroot@buildroot.org
References: <20260730180627.1224385-1-laszlo.ersek@arm.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260730180627.1224385-1-laszlo.ersek@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1785435298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ejAcnz8on6idT+SNMq0rAo4O+X4y3mLNfxdJ/LdVZq0=;
 b=oKmmc4brBTqqJq0QZdAfgWiwQSA6MCcm4d52X0JSNVOlVZVCTDI+zZ+krklxHUr/ZWFhZn
 yjU+5Rf4a+Me53Zis/EKmWltzkHBUfdyMxkzigVRHRzWpdPXhoSvTy4RwaO/OIb6p46JkF
 woKV79JfkMRPCVcAz7gGzWFsEMaQV5pdMY5KDwkIzm0chTxrhs7IlB6nMWfPmIj4wMtRsX
 WFuTHQtenfve2+4kaW7xoKBKGf8/LsToT4WL0H8dhmTafX7NS215yDmqPQYOtbIP3VNFUy
 YxDoDdRWxSDrMKGh/3TNshbSlJ82RbggELJ7t8+j+Jsbl6G52vb8CbmUde1EwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=oKmmc4br
Subject: Re: [Buildroot] [PATCH] linux/linux.mk: forcibly (re)enable Make
 jobserver
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

CgpPbiAzMC8wNy8yMDI2IDIwOjA2LCBMYXN6bG8gRXJzZWsgd3JvdGU6Cj4gQ29tbWl0IDBiOWVm
Yzk5MWY4YSAowqtsaW51eDogdXNlIEJSMl9NQUtFwrssIDIwMjMtMDQtMTApIHJlcGxhY2VkICQo
TUFLRSkKPiB3aXRoICQoQlIyX01BS0UpIGluIGEgbnVtYmVyIG9mIHJlY2lwZXMuIEFzIGEgY29u
c2VxdWVuY2UsIHRoZSBjaGlsZCBtYWtlCj4gaXMgdW5hYmxlIHRvIGRpc2NvdmVyIHRoZSBqb2Ig
c2VydmVyLCBhbmQgd2UgZ2V0IGEgd2FybmluZyBzdWNoIGFzCj4gCj4+IHdhcm5pbmc6IGpvYnNl
cnZlciB1bmF2YWlsYWJsZTogdXNpbmcgLWoxLiBBZGQgYCsnIHRvIHBhcmVudCBtYWtlIHJ1bGUu
Cj4gCj4gaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9tYWtlL21hbnVhbC9odG1sX25vZGUv
RXJyb3ItTWVzc2FnZXMuaHRtbAo+IGh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvbWFrZS9t
YW51YWwvaHRtbF9ub2RlL01BS0UtVmFyaWFibGUuaHRtbAo+IAo+IEluZm9ybSB0aGUgcGFyZW50
IE1ha2UsIGJ5IHByZWZpeGluZyB0aGUgcmVjaXBlIHdpdGggIisiLCB0aGF0ICQoQlIyX01BS0Up
Cj4gY2FuIGRlYWwgd2l0aCB0aGUgam9iIHNlcnZlci4KPiAKPiBDYzogQXJub3V0IFZhbmRlY2Fw
cGVsbGUgPGFybm91dEBtaW5kLmJlPgo+IENjOiBPbGVnIEx5b3ZpbiA8b3ZsZXZpbkBzYmVyZGV2
aWNlcy5ydT4KPiBDYzogYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBM
YXN6bG8gRXJzZWsgPGxhc3psby5lcnNla0Bhcm0uY29tPgo+IC0tLQo+IAo+IE5vdGVzOgo+ICAg
ICAgQ29tbWl0IDBiOWVmYzk5MWY4YSByZXBsYWNlcyBtdWx0aXBsZSBpbnN0YW5jZXMgb2YgJChN
QUtFKSB3aXRoCj4gICAgICAkKEJSMl9NQUtFKTsgSSdtIG9ubHkgcHJlZml4aW5nIHRoZSBvbmUg
cmVjaXBlIHdpdGggIisiIHRoYXQgc2VlbXMgdG8KPiAgICAgIGNhdXNlIHRoZSBtb3N0IG5vdGlj
ZWFibGUgc2xvd2Rvd24gZm9yIG1lIChieSBtaXNzaW5nIG91dCBvbiBhIHBhcmFsbGVsCj4gICAg
ICBrZXJuZWwgYnVpbGQpLgoKICBBcmUgeW91IHJlYWxseSBzdXJlIHRoaXMgc3BlZWRzIHRoaW5n
cyB1cD8gVGhlIGNvcmUgb2YgdGhlIHdvcmsgc2hvdWxkIGJlIGluIAp0aGUgYG1ha2UgYWxsYCBp
bnZvY2F0aW9uIG9uIGxpbmUgNTQ2LiBBbGwgdGhlIG90aGVyIGludm9jYXRpb25zIHNob3VsZCBi
ZSAKcHJldHR5IG11Y2ggc2VyaWFsLiBJbiBwYXJ0aWN1bGFyIHRoZSByZWJ1aWxkLXdpdGgtaW5p
dHJhbWZzIHNob3VsZCBkbyBub3RoaW5nIAptb3JlIHRoYW4gcmUtbGlua2luZyBhbmQgcmUtY29t
cHJlc3NpbmcgdGhlIGtlcm5lbCBiZWNhdXNlIHRoZSBleGFjdCBzYW1lIApjb21tYW5kIHdhcyBh
bHJlYWR5IGRvbmUgaW4gdGhlIGJ1aWxkIHN0ZXAuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPiAg
IGxpbnV4L2xpbnV4Lm1rIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpbnV4L2xpbnV4Lm1rIGIvbGludXgv
bGludXgubWsKPiBpbmRleCBlNzkwZGFmZjY2MDguLjgwNTgxMDgxYTdlYiAxMDA2NDQKPiAtLS0g
YS9saW51eC9saW51eC5tawo+ICsrKyBiL2xpbnV4L2xpbnV4Lm1rCj4gQEAgLTY5Niw3ICs2OTYs
NyBAQCBsaW51eC1yZWJ1aWxkLXdpdGgtaW5pdHJhbWZzOiByb290ZnMtY3Bpbwo+ICAgbGludXgt
cmVidWlsZC13aXRoLWluaXRyYW1mczoKPiAgIAlAJChjYWxsIE1FU1NBR0UsIlJlYnVpbGRpbmcg
a2VybmVsIHdpdGggaW5pdHJhbWZzIikKPiAgIAkjIEJ1aWxkIHRoZSBrZXJuZWwuCj4gLQkkKExJ
TlVYX01BS0VfRU5WKSAkKEJSMl9NQUtFKSAkKExJTlVYX01BS0VfRkxBR1MpIC1DICQoTElOVVhf
RElSKSAkKExJTlVYX1RBUkdFVF9OQU1FKQo+ICsJKyQoTElOVVhfTUFLRV9FTlYpICQoQlIyX01B
S0UpICQoTElOVVhfTUFLRV9GTEFHUykgLUMgJChMSU5VWF9ESVIpICQoTElOVVhfVEFSR0VUX05B
TUUpCj4gICAJJChMSU5VWF9BUFBFTkRfRFRCKQo+ICAgCSMgQ29weSB0aGUga2VybmVsIGltYWdl
KHMpIHRvIGl0cyh0aGVpcikgZmluYWwgZGVzdGluYXRpb24KPiAgIAkkKGNhbGwgTElOVVhfSU5T
VEFMTF9JTUFHRSwkKEJJTkFSSUVTX0RJUikpCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
