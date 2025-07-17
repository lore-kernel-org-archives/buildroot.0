Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638C6C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 19:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 357BC41052;
	Thu, 17 Jul 2025 19:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkWrNXuVU8or; Thu, 17 Jul 2025 19:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45B14410C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45B14410C1;
	Thu, 17 Jul 2025 19:58:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DAA9226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DC6F83E6D
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNrBkyFNDs4b for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 19:58:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 137DD80D21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 137DD80D21
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 137DD80D21
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BAA23B977AA4; Thu, 17 Jul 2025 21:58:25 +0200 (CEST)
Message-ID: <0c831f96-9361-4928-a159-babf18248b29@rnout.be>
Date: Thu, 17 Jul 2025 21:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, thomas.perale@mind.be
References: <20250709163650.115228-1-titouan.christophe@mind.be>
 <3e15b9e0-0059-46eb-ac57-3b87140aa96a@rnout.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <3e15b9e0-0059-46eb-ac57-3b87140aa96a@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782305; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=YnnLYhHTHwDvl7gfAdLgUyJiAMfCwmVklvjr8zEiLFo=;
 b=ExApFTdxD5/bSQTZYstrw7xTTlvVdzY5bQRz97X3DWf26/L6X3XGJPFKQ+XWVNDWxFW71J
 rPfEZaix6+mrkClWjKw5Um5qHmKhUTZ+fvumuU8ycyfHM8i2C/QHmHDDM1SdPeZIXR2DxC
 zH550yv8qjg8J6nXo2Zhe1+BuqUfBZRMeyQyqeZ65qbZPzJR5ND8Uxrtqj5kp6FLO/0dBG
 Kc2seOTb2BbStpf3VL8RN3fSg3+ClTq0tsRazrJoGij5nbg60c6sV12Zu9FAmDcGF5k1TO
 jMZB0CDYjrJi4GxiD9dq7wxljfuOjqEKTYOKz+WmJIOR0cgKrK9KfVDVhpFyOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=ExApFTdx
Subject: Re: [Buildroot] [PATCH] package/git: security bump to v2.50.1
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

CgpPbiAxNy8wNy8yMDI1IDIxOjU3LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiAKPiAK
PiBPbiAwOS8wNy8yMDI1IDE4OjM2LCBUaXRvdWFuIENocmlzdG9waGUgdmlhIGJ1aWxkcm9vdCB3
cm90ZToKPj4gUmVhZCB0aGUgYW5ub3VuY2VtZW50OiBodHRwczovL2x3bi5uZXQvbWwvYWxsL3ht
cXE1eGcyd3JkMS5mc2ZAZ2l0c3Rlci5nLwo+Pgo+PiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcg
dnVsbmVyYWJpbGl0aWVzOgo+Pgo+PiAtIENWRS0yMDI1LTI3NjEzIChHaXRrKToKPj4gwqDCoMKg
IFdoZW4gYSB1c2VyIGNsb25lcyBhbiB1bnRydXN0ZWQgcmVwb3NpdG9yeSBhbmQgcnVucyBHaXRr
IHdpdGhvdXQKPj4gwqDCoMKgIGFkZGl0aW9uYWwgY29tbWFuZCBhcmd1bWVudHMsIGFueSB3cml0
YWJsZSBmaWxlIGNhbiBiZSBjcmVhdGVkIGFuZAo+PiDCoMKgwqAgdHJ1bmNhdGVkLiBUaGUgb3B0
aW9uICJTdXBwb3J0IHBlci1maWxlIGVuY29kaW5nIiBtdXN0IGhhdmUgYmVlbgo+PiDCoMKgwqAg
ZW5hYmxlZC4gVGhlIG9wZXJhdGlvbiAiU2hvdyBvcmlnaW4gb2YgdGhpcyBsaW5lIiBpcyBhZmZl
Y3RlZCBhcwo+PiDCoMKgwqAgd2VsbCwgcmVnYXJkbGVzcyBvZiB0aGUgb3B0aW9uIGJlaW5nIGVu
YWJsZWQgb3Igbm90Lgo+PiDCoMKgwqAgaHR0cHM6Ly93d3cuY3ZlLm9yZy9DVkVSZWNvcmQ/aWQ9
Q1ZFLTIwMjUtMjc2MTMKPj4KPj4gLSBDVkUtMjAyNS0yNzYxNCAoR2l0ayk6Cj4+IMKgwqDCoCBB
IEdpdCByZXBvc2l0b3J5IGNhbiBiZSBjcmFmdGVkIGluIHN1Y2ggYSB3YXkgdGhhdCBhIHVzZXIg
d2hvIGhhcwo+PiDCoMKgwqAgY2xvbmVkIHRoZSByZXBvc2l0b3J5IGNhbiBiZSB0cmlja2VkIGlu
dG8gcnVubmluZyBhbnkgc2NyaXB0Cj4+IMKgwqDCoCBzdXBwbGllZCBieSB0aGUgYXR0YWNrZXIg
YnkgaW52b2tpbmcgYGdpdGsgZmlsZW5hbWVgLCB3aGVyZQo+PiDCoMKgwqAgYGZpbGVuYW1lYCBo
YXMgYSBwYXJ0aWN1bGFyIHN0cnVjdHVyZS4KPj4gwqDCoMKgIGh0dHBzOi8vd3d3LmN2ZS5vcmcv
Q1ZFUmVjb3JkP2lkPUNWRS0yMDI1LTI3NjE0Cj4+Cj4+IC0gQ1ZFLTIwMjUtNDY4MzUgKEdpdCBH
VUkpOgo+PiDCoMKgwqAgV2hlbiBhIHVzZXIgY2xvbmVzIGFuIHVudHJ1c3RlZCByZXBvc2l0b3J5
IGFuZCBpcyB0cmlja2VkIGludG8KPj4gwqDCoMKgIGVkaXRpbmcgYSBmaWxlIGxvY2F0ZWQgaW4g
YSBtYWxpY2lvdXNseSBuYW1lZCBkaXJlY3RvcnkgaW4gdGhlCj4+IMKgwqDCoCByZXBvc2l0b3J5
LCB0aGVuIEdpdCBHVUkgY2FuIGNyZWF0ZSBhbmQgb3ZlcndyaXRlIGFueSB3cml0YWJsZQo+PiDC
oMKgwqAgZmlsZS4KPj4gwqDCoMKgIGh0dHBzOi8vd3d3LmN2ZS5vcmcvQ1ZFUmVjb3JkP2lkPUNW
RS0yMDI1LTQ2ODM1Cj4+Cj4+IC0gQ1ZFLTIwMjUtNDgzODQ6Cj4+IMKgwqDCoCBXaGVuIHJlYWRp
bmcgYSBjb25maWcgdmFsdWUsIEdpdCBzdHJpcHMgYW55IHRyYWlsaW5nIGNhcnJpYWdlCj4+IMKg
wqDCoCByZXR1cm4gYW5kIGxpbmUgZmVlZCAoQ1JMRikuIFdoZW4gd3JpdGluZyBhIGNvbmZpZyBl
bnRyeSwgdmFsdWVzCj4+IMKgwqDCoCB3aXRoIGEgdHJhaWxpbmcgQ1IgYXJlIG5vdCBxdW90ZWQs
IGNhdXNpbmcgdGhlIENSIHRvIGJlIGxvc3Qgd2hlbgo+PiDCoMKgwqAgdGhlIGNvbmZpZyBpcyBs
YXRlciByZWFkLsKgIFdoZW4gaW5pdGlhbGl6aW5nIGEgc3VibW9kdWxlLCBpZiB0aGUKPj4gwqDC
oMKgIHN1Ym1vZHVsZSBwYXRoIGNvbnRhaW5zIGEgdHJhaWxpbmcgQ1IsIHRoZSBhbHRlcmVkIHBh
dGggaXMgcmVhZAo+PiDCoMKgwqAgcmVzdWx0aW5nIGluIHRoZSBzdWJtb2R1bGUgYmVpbmcgY2hl
Y2tlZCBvdXQgdG8gYW4gaW5jb3JyZWN0Cj4+IMKgwqDCoCBsb2NhdGlvbi4gSWYgYSBzeW1saW5r
IGV4aXN0cyB0aGF0IHBvaW50cyB0aGUgYWx0ZXJlZCBwYXRoIHRvIHRoZQo+PiDCoMKgwqAgc3Vi
bW9kdWxlIGhvb2tzIGRpcmVjdG9yeSwgYW5kIHRoZSBzdWJtb2R1bGUgY29udGFpbnMgYW4gZXhl
Y3V0YWJsZQo+PiDCoMKgwqAgcG9zdC1jaGVja291dCBob29rLCB0aGUgc2NyaXB0IG1heSBiZSB1
bmludGVudGlvbmFsbHkgZXhlY3V0ZWQKPj4gwqDCoMKgIGFmdGVyIGNoZWNrb3V0Lgo+PiDCoMKg
wqAgaHR0cHM6Ly93d3cuY3ZlLm9yZy9DVkVSZWNvcmQ/aWQ9Q1ZFLTIwMjUtNDgzODQKPj4KPj4g
LSBDVkUtMjAyNS00ODM4NToKPj4gwqDCoMKgIFdoZW4gY2xvbmluZyBhIHJlcG9zaXRvcnkgR2l0
IGtub3dzIHRvIG9wdGlvbmFsbHkgZmV0Y2ggYSBidW5kbGUKPj4gwqDCoMKgIGFkdmVydGlzZWQg
YnkgdGhlIHJlbW90ZSBzZXJ2ZXIsIHdoaWNoIGFsbG93cyB0aGUgc2VydmVyLXNpZGUgdG8KPj4g
wqDCoMKgIG9mZmxvYWQgcGFydHMgb2YgdGhlIGNsb25lIHRvIGEgQ0ROLiBUaGUgR2l0IGNsaWVu
dCBkb2VzIG5vdAo+PiDCoMKgwqAgcGVyZm9ybSBzdWZmaWNpZW50IHZhbGlkYXRpb24gb2YgdGhl
IGFkdmVydGlzZWQgYnVuZGxlcywgd2hpY2gKPj4gwqDCoMKgIGFsbG93cyB0aGUgcmVtb3RlIHNp
ZGUgdG8gcGVyZm9ybSBwcm90b2NvbCBpbmplY3Rpb24uCj4+IMKgwqDCoCBUaGlzIHByb3RvY29s
IGluamVjdGlvbiBjYW4gY2F1c2UgdGhlIGNsaWVudCB0byB3cml0ZSB0aGUgZmV0Y2hlZAo+PiDC
oMKgwqAgYnVuZGxlIHRvIGEgbG9jYXRpb24gY29udHJvbGxlZCBieSB0aGUgYWR2ZXJzYXJ5LiBU
aGUgZmV0Y2hlZAo+PiDCoMKgwqAgY29udGVudCBpcyBmdWxseSBjb250cm9sbGVkIGJ5IHRoZSBz
ZXJ2ZXIsIHdoaWNoIGNhbiBpbiB0aGUgd29yc3QKPj4gwqDCoMKgIGNhc2UgbGVhZCB0byBhcmJp
dHJhcnkgY29kZSBleGVjdXRpb24uCj4+IMKgwqDCoCBodHRwczovL3d3dy5jdmUub3JnL0NWRVJl
Y29yZD9pZD1DVkUtMjAyNS00ODM4NQo+Pgo+PiAtIENWRS0yMDI1LTQ4Mzg2Ogo+PiDCoMKgwqAg
VGhlIHdpbmNyZWQgY3JlZGVudGlhbCBoZWxwZXIgdXNlcyBhIHN0YXRpYyBidWZmZXIgKGB0YXJn
ZXRgKSBhcyBhCj4+IMKgwqDCoCB1bmlxdWUga2V5IGZvciBzdG9yaW5nIGFuZCBjb21wYXJpbmcg
YWdhaW5zdCBpbnRlcm5hbCBzdG9yYWdlLiBUaGlzCj4+IMKgwqDCoCBjcmVkZW50aWFsIGhlbHBl
ciBkb2VzIG5vdCBwcm9wZXJseSBib3VuZHMgY2hlY2sgdGhlIGF2YWlsYWJsZQo+PiDCoMKgwqAg
c3BhY2UgcmVtYWluaW5nIGluIHRoZSBidWZmZXIgYmVmb3JlIGFwcGVuZGluZyB0byBpdCB3aXRo
Cj4+IMKgwqDCoCBgd2NzbmNhdCgpYCwgbGVhZGluZyB0byBwb3RlbnRpYWwgYnVmZmVyIG92ZXJm
bG93cy4KPj4gwqDCoMKgIGh0dHBzOi8vd3d3LmN2ZS5vcmcvQ1ZFUmVjb3JkP2lkPUNWRS0yMDI1
LTQ4Mzg2Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRpdG91YW4gQ2hyaXN0b3BoZSA8dGl0b3Vhbi5j
aHJpc3RvcGhlQG1pbmQuYmU+Cj4gCj4gIMKgQXBwbGllZCB0byAyMDI1LjA1LngsIHRoYW5rcy4K
CiAgR2FoLCBJIG1lYW50IHRoZSAyLjQ5IGJ1bXAgb2YgY291cnNlLgoKPiAKPiAgwqBSZWdhcmRz
LAo+ICDCoEFybm91dAo+IAo+PiAtLS0KPj4gwqAgcGFja2FnZS9naXQvZ2l0Lmhhc2ggfCAyICst
Cj4+IMKgIHBhY2thZ2UvZ2l0L2dpdC5ta8KgwqAgfCAyICstCj4+IMKgIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9naXQvZ2l0Lmhhc2ggYi9wYWNrYWdlL2dpdC9naXQuaGFzaAo+PiBpbmRleCBiMjBmZTJk
ZTBlLi5iYmQyYjRjNzU0IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2dpdC9naXQuaGFzaAo+PiAr
KysgYi9wYWNrYWdlL2dpdC9naXQuaGFzaAo+PiBAQCAtMSw1ICsxLDUgQEAKPj4gwqAgIyBGcm9t
OiBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9zb2Z0d2FyZS9zY20vZ2l0L3NoYTI1NnN1bXMu
YXNjCj4+IC1zaGEyNTbCoCBkZmYzYzAwMGU0MDBhY2UzYTYzYjhhNmY4YjNiNzZiODhlY2ZkZmZk
NDUwNGEwNGFiYTQyNDgzNzJjZGVjMDQ1ICAKPj4gZ2l0LTIuNTAuMC50YXIueHoKPj4gK3NoYTI1
NsKgIDdlM2U2YzM2ZGVjYmQ4ZjFlZWRkMTRkNDJkYjY2NzRiZTAzNjcxYzIyMDQ4NjRiZWZhMmE0
MTc1NmM1YzhmYzQgIAo+PiBnaXQtMi41MC4xLnRhci54ego+PiDCoCAjIExvY2FsbHkgY2FsY3Vs
YXRlZAo+PiDCoCBzaGEyNTbCoCA1YjIxOThkMTY0NWY3Njc1ODVlOGE4OGFjMDQ5OWIwNDQ3MjE2
NGMwZDJkYTIyZTc1ZWNmOTdlZjQ0M2FiMzJlICAKPj4gQ09QWUlORwo+PiDCoCBzaGEyNTbCoCAx
OTIyZjQ1ZDJjNDllMzkwMDMyYzljMGJhNmQ3Y2FjOTA0MDg3ZjdjZWM1MWFmMzBjMmIyYWQwMjJj
ZTBlNzZhICAKPj4gTEdQTC0yLjEKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2l0L2dpdC5tayBi
L3BhY2thZ2UvZ2l0L2dpdC5tawo+PiBpbmRleCA1NjA1OTBiMzNiLi44Y2JkMjc4N2IyIDEwMDY0
NAo+PiAtLS0gYS9wYWNrYWdlL2dpdC9naXQubWsKPj4gKysrIGIvcGFja2FnZS9naXQvZ2l0Lm1r
Cj4+IEBAIC00LDcgKzQsNyBAQAo+PiDCoCAjCj4+ICAgCj4+ICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4+IC1HSVRfVkVSU0lPTiA9IDIuNTAuMAo+PiArR0lUX1ZFUlNJT04gPSAyLjUwLjEKPj4g
wqAgR0lUX1NPVVJDRSA9IGdpdC0kKEdJVF9WRVJTSU9OKS50YXIueHoKPj4gwqAgR0lUX1NJVEUg
PSAkKEJSMl9LRVJORUxfTUlSUk9SKS9zb2Z0d2FyZS9zY20vZ2l0Cj4+IMKgIEdJVF9MSUNFTlNF
ID0gR1BMLTIuMCwgTEdQTC0yLjErCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
