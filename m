Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60F9C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 14:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 276A840650;
	Mon,  3 Aug 2026 14:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhF15ACIs_SF; Mon,  3 Aug 2026 14:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0908140608
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785766000;
	bh=q2y7UyrqxCgxkcag88qh7LiPbPKHQ2RguCwqYe7bHpw=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CVOFDKSQB4pnQTH/Rmnpuuy6Zcp/mJYzN/BFZsCkWIIWnZAu2DXnBPJB5JlqXs7ua
	 qkgJ1VGDZWK52Qtg1Ic5zNfLSVlBjP2dzsikZ+3h8hQ6QxzKV1mBcp/UslwoWaPhvm
	 4q6joQOLPEtOmdRuPkfjlN2vQSiulgtXl7kevaIR9tG5V19FPYJdRoDW2d0yja/C1K
	 l/QZSpy175uBd1XS81Xisk/v1aH+GopZBxrDVDgUcjjTQKDPy+/iQAGd3U6FIo0Bjm
	 aqivitxqezh94MwXou3ruedj8PL7TaobUrSC5gbm38duhj96RjyZLIATO/TSX/I1vu
	 dYTRuGdkVmRGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0908140608;
	Mon,  3 Aug 2026 14:06:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0659C389
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFC6A400DB
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fyiFrXJ-odB for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 14:06:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9C9B400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9C9B400C1
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9C9B400C1
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:06:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9F7EE1A13D2;
 Mon,  3 Aug 2026 14:06:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5EAA26029B;
 Mon,  3 Aug 2026 14:06:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 652E511C30D6A; 
 Mon,  3 Aug 2026 16:06:26 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 03 Aug 2026 16:06:25 +0200
Message-Id: <DKFD7KGFHJ7L.2XTLXLZ4K20B6@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
To: "Fiona Klute" <fiona.klute@gmx.de>, =?utf-8?q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260715-legal-info-localdef-v1-1-5c44106ea59d@bootlin.com>
 <de53fcb2-c43f-49ed-86ed-2c9745d4b6f0@gmx.de>
In-Reply-To: <de53fcb2-c43f-49ed-86ed-2c9745d4b6f0@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1785765989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vOWhzCqxHhOtG1E6KgkOOxShFDEn0i0B6G3sRcnIRHo=;
 b=c1sg+lCsOfdHrMqHVs3/68P7JHMnfi61YdJ+e5zBz8TubYHu4iHfJ8TuwVBt8CKQ3fb21S
 yhfnP/uhqeWdnSEb+Flq4nwXw3Ceqt/rh2rput77j4uxeWAgpHqBtQz0K3mchcqwkYaVfP
 MolfqVXljdSDRImdlkTNy6Ml39D5O7jQxJLTcS5baSW6qPqpmhKC4osws2fe2298vvDs09
 ntTvt9O+gm6Z+9Hz9ck95cE2YpZcQn268BpAOjjAr9FK7HGSn2mi+RX3OUd7I9uRYpc1jX
 i+987GAjN4gKo7yrg01kIJ0U60ToIKl6nma8o3ekTU+NabVuH1ccFEqIwlkafg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=c1sg+lCs
Subject: Re: [Buildroot] [PATCH] package/localedef: add license data
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmlvbmEsCm15IGJhZCBmb3IgdGhlIGxhdGUgcmVwbHksIEkgaGF2ZSBiZWVuIE9vTyBhbmQg
Z290IGJhY2sgdG9kYXkuCgpPbiBNb24gSnVsIDIwLCAyMDI2IGF0IDU6NTIgUE0gQ0VTVCwgRmlv
bmEgS2x1dGUgd3JvdGU6Cj4gSGkgQWxleGlzLAo+Cj4gdGhhbmtzIGZvciB0aGUgcGF0Y2gsIEkg
YnVtcGVkIGludG8gdGhpcyByZWNlbnRseSwgdG9vIQo+Cj4gQW0gMTUuMDcuMjYgdW0gMTQ6MzAg
c2NocmllYiBBbGV4aXMgTG90aG9yw6kgdmlhIGJ1aWxkcm9vdDoKPj4gV2hlbiBydW5uaW5nIGBt
YWtlIGxlZ2FsLWluZm9gIGZvciBhIGJ1aWwgYmFzZWQgb24gZ2xpYmMgYW5kIGNvbmZpZ3VyZWQK
Pj4gdG8gZ2VuZXJhdGUgc29tZSBsb2NhbGUgZGF0YSAoZWc6IEJSMl9HRU5FUkFURV9MT0NBTEU9
IkMuVVRGLTgiKSwgdGhlCj4+IGZvbGxvd2luZyB3YXJuaW5nIGlzIHByaW50ZWQ6Cj4+IAo+PiAg
ICBXQVJOSU5HOiBsb2NhbGVkZWYtMi40My00NS1nZGFlNDI1YjU1NDIwN2Y3YzQ1OTljN2ZhYzcw
N2FkNGMwODU0NTY3NDogXAo+PiAgICBjYW5ub3Qgc2F2ZSBsaWNlbnNlIChIT1NUX0xPQ0FMRURF
Rl9MSUNFTlNFX0ZJTEVTIG5vdCBkZWZpbmVkKQo+PiAKPj4gRGVmaW5lIHRoZSBtaXNzaW5nIExP
Q0FMRURFRl9MSUNFTlNFIGFuZCBMT0NBTEVERUZfTElDRU5TRV9GSUxFUyB0byBnZXQKPj4gcmlk
IG9mIHRoZSB3YXJuaW5nLiBUaGUgaGVhZGVyIGluIGxvY2FsZS9wcm9ncmFtcy9sb2NhbGVkZWYu
YyBzdGF0ZXMKPj4gdGhhdCB0aGUgcHJvZ3JhbSBpcyByZWxlYXNlZCB1bmRlciBHUEwsIHNvIHVz
ZSBHUEx2MiwgYXMgYWxzbyBzdCBzdGF0ZWQKPj4gYnkgZ2xpYmMubWsgaW4gdGhlIGdsaWJjIHBh
Y2thZ2UgaW4gYnVpbGRyb290Lgo+Cj4gWW91J3JlIG9idmlvdXNseSBjb3JyZWN0IGFib3V0IGxv
Y2FsZS9wcm9ncmFtcy9sb2NhbGVkZWYuYywgYnV0IGl0IAo+IGluY2x1ZGVzL2xpbmtzIGFkZGl0
aW9uYWwgcGFydHMgb2YgZ2xpYmMsIGFuZCBpdCdzIG5vdCBvYnZpb3VzIHRvIG1lIAo+IHdoaWNo
LiBEbyB5b3UgaGF2ZSBhIHdheSB0byB2ZXJpZnk/IEFuZCBvZiBjb3Vyc2UgdGhlIHNvdXJjZSBh
cmNoaXZlIAo+IGluY2x1ZGVzIGV2ZXJ5dGhpbmcgYW55d2F5Lgo+Cj4gZ2xpYmMubWsgY3VycmVu
dGx5IGxpc3RzOgo+Cj4gR0xJQkNfTElDRU5TRSA9IEdQTC0yLjArIChwcm9ncmFtcyksIExHUEwt
Mi4xKywgQlNELTMtQ2xhdXNlLCBNSVQgKGxpYnJhcnkpCj4gR0xJQkNfTElDRU5TRV9GSUxFUyA9
IENPUFlJTkd2MiBDT1BZSU5HLkxFU1NFUnYyIExJQ0VOU0VTCj4KPiBTaWRlIG5vdGU6IC91c3Iv
c2hhcmUvZG9jL2xpYmMtYmluL2NvcHlyaWdodCBmcm9tIHRoZSBEZWJpYW4gbGliYy1iaW4gCj4g
cGFja2FnZSAod2hpY2ggaW5jbHVkZXMgbG9jYWxlZGVmKSBtZW50aW9ucyB0aGF0IHN5c2RlcHMv
aHRsL3JhaXNlLmMgaXMgCj4gbGljZW5zZWQgdW5kZXIgTEdQTC0zLjArLCB3aGljaCBpcyBub3Qg
Y3VycmVudGx5IGluIG91ciBsaXN0LiBBcyBmYXIgYXMgCj4gSSB1bmRlcnN0YW5kIGl0J3Mgb25s
eSAqdXNlZCogb24gSHVyZCwgYnV0IGl0J3Mgc3RpbGwgcHJlc2VudCBpbiB0aGUgCj4gc291cmNl
IGFyY2hpdmUuCgpZZWFoLCBteSBwcm9wb3NhbCBtYXkgbm90IGJlIHNwZWNpZmljIGVub3VnaCwg
Y29uc2lkZXJpbmcgdGhlCmludGVybmFsIGRlcGVuZGVuY2llcyBwdWxsZWQgYnkgbG9jYWxlZGVm
LiBUaGUgZXhhY3QgcGFydCBwdWxsZWQgYXJlIG5vdApjbGVhciBmb3IgbWUgbmVpdGhlciwgSSd2
ZSBqdXN0IGJlZW4gYXNzdW1pbmcgdGhhdCB0aGUgbWFpbiBmaWxlIGJlaW5nCkdQTCBpdHNlbGYs
IHdlIGRvIG5vdCBjYXJlIGFib3V0IG90aGVyIGRlcGVuZGVuY2llcywgYXMgR1BMIGlzIHN0cm9u
Z2VyLAphbmQgc28gcGVvcGxlIGJ1aWxkaW5nIGhvc3QtbG9jYWxlZGVmIGluIEJSIG11c3QgY29u
c2lkZXIgR1BMIHJpZ2h0cyBhbmQKb2JsaWdhdGlvbnMgd2hlbiBidWlsZGluZyBpdC4gQnV0IEkg
bWF5IGJlIHdyb25nLCBhbnkgbW9yZSBlZHVjYXRlZCB2aWV3Cm9uIHRoaXMgaXMgd2VsY29tZS4K
Ckkgc2VlIHRoYXQgaW4gdGhlIG1lYW4gdGltZSB5b3UgaGF2ZSBzZW50IGEgc2VyaWVzIHVwZGF0
aW5nIGdsaWJjCmxpY2Vuc2luZyBhbmQgbWlycm9yaW5nIGl0IGZvciBsb2NhbGVkZWYsIEknbSBm
aW5lIHdpdGggaXQgb3ZlcnJpZGluZwptaW5lLCBpZiBpdCBpcyBpbmRlZWQgdGhlIHByb3BlciB3
YXkgb2YgaGFuZGxpbmcgbG9jYWxlZGVmIGxpY2Vuc2luZy4KClRoYW5rcywKCkFsZXhpcwoKPgo+
IEJlc3QgcmVnYXJkcywKPiBGaW9uYQo+Cj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LD
qSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Cj4+IC0tLQo+PiBVcCB0byBteSBrbm93bGVk
Z2UgdGhpcyBwYWNrYWdlIG5ldmVyIGhhZCB0aGUgbmVlZGVkIGxpY2Vuc2UgZGF0YSwgc28KPj4g
YWxsIGN1cnJlbnRseSBtYWludGFpbmVkIHZlcnNpb25zIGFyZSBhZmZlY3RlZCBieSB0aGUgaXNz
dWUuCj4+IC0tLQo+PiAgIHBhY2thZ2UvbG9jYWxlZGVmL2xvY2FsZWRlZi5tayB8IDIgKysKPj4g
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9sb2NhbGVkZWYvbG9jYWxlZGVmLm1rIGIvcGFja2FnZS9sb2NhbGVkZWYvbG9jYWxlZGVm
Lm1rCj4+IGluZGV4IDczMmVkNmQ0YWQxZC4uYWE3ZGJhMmI1MTcwIDEwMDY0NAo+PiAtLS0gYS9w
YWNrYWdlL2xvY2FsZWRlZi9sb2NhbGVkZWYubWsKPj4gKysrIGIvcGFja2FnZS9sb2NhbGVkZWYv
bG9jYWxlZGVmLm1rCj4+IEBAIC0xMSw2ICsxMSw4IEBAIExPQ0FMRURFRl9WRVJTSU9OID0gMi40
My00NS1nZGFlNDI1YjU1NDIwN2Y3YzQ1OTljN2ZhYzcwN2FkNGMwODU0NTY3NAo+PiAgIExPQ0FM
RURFRl9TT1VSQ0UgPSBnbGliYy0kKExPQ0FMRURFRl9WRVJTSU9OKSQoQlJfRk1UX1ZFUlNJT05f
Z2l0KS50YXIuZ3oKPj4gICBMT0NBTEVERUZfU0lURSA9IGh0dHBzOi8vc291cmNld2FyZS5vcmcv
Z2l0L2dsaWJjLmdpdAo+PiAgIExPQ0FMRURFRl9TSVRFX01FVEhPRCA9IGdpdAo+PiArTE9DQUxF
REVGX0xJQ0VOU0UgPSBHUEwtMi4wKwo+PiArTE9DQUxFREVGX0xJQ0VOU0VfRklMRVMgPSBDT1BZ
SU5HdjIKPj4gICBIT1NUX0xPQ0FMRURFRl9ETF9TVUJESVIgPSBnbGliYwo+PiAgIAo+PiAgIEhP
U1RfTE9DQUxFREVGX0RFUEVOREVOQ0lFUyA9IFwKPj4gCj4+IC0tLQo+PiBiYXNlLWNvbW1pdDog
NjQzZjQ4MGY0Mzc5YWZlNTY3N2VjMzk5YzgwMmI4ZDMzNzM0YjYwMQo+PiBjaGFuZ2UtaWQ6IDIw
MjYwNzE1LWxlZ2FsLWluZm8tbG9jYWxkZWYtY2M5Y2FmMWEzZjNhCj4+IAo+PiBCZXN0IHJlZ2Fy
ZHMsCj4+IC0tCj4+IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
Cj4+IAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKCgoK
LS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
