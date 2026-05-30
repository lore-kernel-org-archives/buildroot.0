Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFAACD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9103861C99;
	Sat, 30 May 2026 14:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ns7HkCAiYfR8; Sat, 30 May 2026 14:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B622361CD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780152395;
	bh=yt3G9hsi8Uz8Kc73vOek0QZWauyiOWnnDn5TCWSyVlg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CG0HYHJJ83yaWtd7ngh43SaBLYoJDgUx07YpUFQJA8KNosabSvvXFOdJY2xZoHiKG
	 kd3znk+RbbGE3gHZZWbqLVkSDS2TJQf1gjjNdIHPu+RUSDfmPcthx25AvUpNb6b5IL
	 qj8UBCSCxbnUTTHlQ5/NYzAyhOEcj4sFvUP7iPA6nP1ZY0DFMsP9afOshxwfvX/y5t
	 4cKZc17amdyUODO1o71KfZEhcziBe2R2Tf7ii33dtpPbHoAIL4PJwnpwlZ5Jw0ZnRF
	 H6B5m8BU0JKA33FPkQQ2wwTtLGgCozk5lVJ/+/84MifKXlR2J6SBj6X3Lq2V4lrqCb
	 5tbJ5u1wWk1Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B622361CD8;
	Sat, 30 May 2026 14:46:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D7CCF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F8AB61CD8
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c05QgT0d_Hhq for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:46:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8EDF161C99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EDF161C99
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EDF161C99
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:46:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F29D7B97C654; Sat, 30 May 2026 16:46:30 +0200 (CEST)
Message-ID: <ebbf4fe0-222f-4408-88ae-8ef86af91e96@rnout.be>
Date: Sat, 30 May 2026 16:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Heiko Stuebner <heiko@sntech.de>, buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260326101033.587997-1-heiko@sntech.de>
 <e41342fb-6354-4ced-a000-ceef2b6ac577@cherry.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <e41342fb-6354-4ced-a000-ceef2b6ac577@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780152391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=a6D7C4/K4/NEzCS3ZeDrmzRTpSnsdzKMDfv0bGh1m8I=;
 b=BwtKapfQlNyG8FuPwQDKM7wtHTIMEOuaGaitlL22NyyceJu5RNV2TGWLO0aTwzLKdesc5h
 GYeoEro9HqRtdbUIkfTBbKE2xrG7jJfTaUnvuh73dwxbGZZWtG26S4mDwrKdRB9W2TeJcb
 LRmSb/CkGN3YKCdOy4/WPW7qHKzWmP+3lb97jLm63i3OKbZXaVCqi62siPU8alx0945M8B
 gZcaW1Pe78a+/rzbKtob8XwuAI+IRS5CMDOTB7vXFrEX6iyB4whQOoMZnfM1Lya53O2SiV
 9Z/FbUTO9ze8kiajGJHkE+GI7ZnSheV35tVPCaqLuJypWFCAIH1iGahSI6mkxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=BwtKapfQ
Subject: Re: [Buildroot] [PATCH v2] package/arm-trusted-firmware: add
 ARM_TRUSTED_FIRMWARE_CPE_ID_*
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

CgpPbiAyNi8wMy8yMDI2IDEyOjM3LCBRdWVudGluIFNjaHVseiB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IEhpIEhlaWtvLAo+IAo+IE9uIDMvMjYvMjYgMTE6MTAgQU0sIEhlaWtvIFN0dWVibmVyIHdy
b3RlOgo+PiBGcm9tOiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAY2hlcnJ5LmRlPgo+
Pgo+PiBUcnVzdGVkLUZpcm13YXJlIGhhcyBiZWVuIHVzaW5nIGEgbnVtYmVyIG9mIENQRSBpZGVu
dGlmaWVycyBpbiB0aGUgcGFzdAo+PiBidXQgZXNwZWNpYWxseSBhZnRlciB2Mi40LCB0aGUgY29y
cmVjdCBpZGVudGlmaWVyIHdvdWxkIGJlIHNpbWlsYXIKPj4gdG8gY3BlOjIuMzpvOmFybTp0cnVz
dGVkX2Zpcm13YXJlLWE6Mi4xMjpyYzA6KjoqOi06KjoqOioKPj4KPj4gwqDCoCBodHRwczovL252
ZC5uaXN0Lmdvdi9wcm9kdWN0cy9jcGUvZGV0YWlsLzY1REVDMjMwLTFDRDUtNDBEQi05MDNBLTIy
NTM3RDFFNDRGRQo+Pgo+PiBBZGQgdGhlIHJlbGV2YW50IENQRSBmaWVsZHMgdG8gdGhlIHRydXN0
ZWQtZmlybXdhcmUgcGFja2FnZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIg
PGhlaWtvLnN0dWVibmVyQGNoZXJyeS5kZT4KPj4gLS0tCj4+IGNoYW5nZXMgaW4gdjI6Cj4+IC0g
cmVtb3ZlIGx0cy0gZnJvbSBsdHMgcmVsZWFzZXMKPj4gLSByZW1vdmUgInYiIGZyb20gdmVyc2lv
biwgdG8gYWN0dWFsbHkgbWF0Y2ggdmVyc2lvbiB1c2VkIGluIENQRXMKPj4KPj4gwqAgYm9vdC9h
cm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5tayB8IDQgKysrKwo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9ib290
L2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLm1rIGIvYm9vdC9hcm0t
IAo+PiB0cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLm1rCj4+IGluZGV4IGI4
MWNlMGQ4MjcuLmMzYzRhNTgxZGEgMTAwNjQ0Cj4+IC0tLSBhL2Jvb3QvYXJtLXRydXN0ZWQtZmly
bXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUubWsKPj4gKysrIGIvYm9vdC9hcm0tdHJ1c3RlZC1m
aXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5tawo+PiBAQCAtNSw2ICs1LDEwIEBACj4+ICAg
Cj4+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+IMKgIEFSTV9UUlVTVEVEX0ZJUk1XQVJFX1ZF
UlNJT04gPSAkKGNhbGwgcXN0cmlwLCAKPj4gJChCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1X
QVJFX1ZFUlNJT04pKQo+PiArQVJNX1RSVVNURURfRklSTVdBUkVfQ1BFX0lEX1BSRUZJWCA9IGNw
ZToyLjM6bwo+PiArQVJNX1RSVVNURURfRklSTVdBUkVfQ1BFX0lEX1ZFTkRPUiA9IGFybQo+PiAr
QVJNX1RSVVNURURfRklSTVdBUkVfQ1BFX0lEX1BST0RVQ1QgPSB0cnVzdGVkX2Zpcm13YXJlLWEK
Pj4gK0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NQRV9JRF9WRVJTSU9OID0gJChzdWJzdCB2LCwkKHN1
YnN0IGx0cy0sLCAKPj4gJChBUk1fVFJVU1RFRF9GSVJNV0FSRV9WRVJTSU9OKSkpCj4gCj4gSSdt
IHdvbmRlcmluZyBpZiBpdCdkIG1ha2Ugc2Vuc2Ugd2UgZG9uJ3QgdG91Y2ggCj4gQVJNX1RSVVNU
RURfRklSTVdBUkVfQ1BFX0lEX1ZFUlNJT04gaWYgaXQgaXNuJ3QgYW55IG9mIHRoZSAKPiBCUjJf
VEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0xBVEVTVF8qLiBXZSBkb24ndCBjYXJlIGFib3V0
IAo+IEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1JFUE9fVkVSU0lPTiBi
ZWNhdXNlIHdlIGNhbm5vdCBrbm93IHdoYXQgCj4gdGhlIHVzZXIncyBuYW1pbmcgc2NoZW1lIGlz
LCBzbyBiZXR0ZXIgbm90IG1lc3Mgd2l0aCBpdC4gVGhlbiBmb3IgCj4gQlIyX1RBUkdFVF9BUk1f
VFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTl9WQUxVRSwgd2UgY2Fubm90IGd1YXJhbnRl
ZSBpdCAKPiBhY3R1YWxseSBtYWtlcyBzZW5zZS4gVGhlcmUgYXJlIGJyYW5jaGVzIGFuZCB0YWdz
IGluIFRGLUEgZ2l0IHJlcG8gd2hpY2ggZG8gaGF2ZSAKPiB2IG9yIGx0cy0gcHJlZml4IGJ1dCBh
bHNvIG90aGVyIG5vbi12ZXJzaW9uIHRoaW5ncyBpbiB0aGVyZSwgZS5nLiBzYW5kYm94L2x0cy0g
Cj4gdjIuMTQuMS0yMDI2MDIwMlQwODUxLCBvciBkZXYvdXBzdHJlYW0uIEkgdGhpbmsgaXQnZCBt
YWtlIHNlbnNlIHRvIG5vdCBkbyAKPiBhbnl0aGluZyBhYm91dCBmb3IgdGhvc2UgdHdvPwoKICBJ
IGRpc2FncmVlIC0gcmVtb3ZpbmcgdGhlIHYgYW5kIGx0cy0gcHJlZml4ZXMgYWx3YXlzIG1ha2Vz
IHNlbnNlLiBUaGUgdmVyc2lvbiAKZG9lc24ndCBiZWNvbWUgbGVzcyBjb3JyZWN0IGZyb20gaXQg
SU1ITy4KCiAgT2gsIGJ1dCBJIG5vdGljZSBub3cgdGhhdCBpdCdzIHVzaW5nIHN1YnN0LCBub3Qg
cGF0c3Vic3QsIHNvIGl0IGRvZXNuJ3QganVzdCAKcmVtb3ZlIGEgcHJlZml4LiBDYXJlIHRvIGZp
eCB0aGF0LCBzb21lb25lPwoKICBBcHBsaWVkIHRvIG1hc3RlciB1bmNoYW5nZWQsIHRoYW5rcy4K
CiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gRXNzZW50aWFsbHkgYSBzaW1wbGUgKE5PVCBURVNU
RUQhKToKPiAKPiAjIEJldHRlciBub3QgdG91Y2ggdXNlcidzIGN1c3RvbSB2ZXJzaW9uCj4gaWZu
ZXEgCj4gKCQoQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fR0lUKSQoQlIy
X1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTikseSkKPiBBUk1fVFJV
U1RFRF9GSVJNV0FSRV9DUEVfSURfVkVSU0lPTiA9ICQoc3Vic3QgdiwsJChzdWJzdCBsdHMtLCwg
Cj4gJChBUk1fVFJVU1RFRF9GSVJNV0FSRV9WRVJTSU9OKSkpCj4gZW5kaWYKPiAKPiBXaGF0IGRv
IHlvdSB0aGluaz8KPiAKPiBDaGVlcnMsCj4gUXVlbnRpbgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
