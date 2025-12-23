Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F44E6FE41
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 21:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB40260E88;
	Tue, 23 Dec 2025 21:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8H-ayuZxZUBn; Tue, 23 Dec 2025 21:24:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB9E660E8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766525046;
	bh=uhu78c8wu7salt6ncrkXdWHN7PqEekzDvkzIxnT5nOU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mzMbWM6I76zBU/3nXhy5y39xIRs4PDTtH2DM+WUVISCxFCo562Pn//3GyRqxZLl1G
	 IbSihNAnr+unarjTNFauo2c1ZhyJkTY9BW+H4ULtn0kfP7Y9WNKCnzwa5RXMReT0wT
	 wQzZCv93k3n/ccNXchKtwsPTFvIUMdjvO5E5CcaWIoTG+6p/rC00DRdrq2CBffaN2e
	 5fcsZ0mVSBcaUsVCXZzur0IMNvoF389XjsGkr4tr18XzAHi0zvpGE9Y1LwKZzjaKcK
	 +ZSWYd66qSfuUwpv+/JaDthn8SUAeylWLWwMUTf5ULvZoOB0CAc5cGPAzE8H1Ig0Tq
	 Ja9GSHIsSNvDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB9E660E8A;
	Tue, 23 Dec 2025 21:24:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F28EAB9
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3E5582410
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKIb0H3r3tvG for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 21:24:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68526823FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68526823FB
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68526823FB
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:24:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DC7364E41D74;
 Tue, 23 Dec 2025 21:24:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A2D7560716;
 Tue, 23 Dec 2025 21:24:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B3F2110AB0CC3; Tue, 23 Dec 2025 22:23:59 +0100 (CET)
Date: Tue, 23 Dec 2025 22:23:58 +0100
To: Abelino Romo <abelino.romo@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251223222358.51a05729@windsurf>
In-Reply-To: <20241129221324.360497-1-abelino.romo@gmail.com>
References: <20241127052719.3689847-1-abelino.romo@gmail.com>
 <20241129221324.360497-1-abelino.romo@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766525040; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zlqm0jKDnZZThu1wRMqRgylVp+FT8FertE32HfaBB6g=;
 b=P4QpqWuoWHAyELToaOMlLmhl+NEB3DDUK1mTJ0dFYsFgopQFDo6A+JqQLTm4Emm+PrwnLD
 ZkOSKrcZsN4kk5YyRDMwNoBOiUiwsoxpPe4NLlni/lQNGr5wgQcxsLLpwuh1C4ypC8Cn6U
 R3nDobL3iwOtSIodtqi4RAvpdPzaRJbDPBzHk8wC1z8mMKNlfp4DmTQj3yJUZrAXO+pP4Z
 Wue1EGpNQA47lfwEp4HABB9Me2E1o6z//xBKNHgIwZU+bnm/jWzdTMqMmzaBMFn/8hNSNo
 KeM3bLsspvyuKnwMHl9lCGQXBIX/bwKrz+01foPat69Yz1WItG+NiVkdf6LD/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=P4QpqWuo
Subject: Re: [Buildroot] [PATCH v3 2/2] package/tpm2-tss-engine: add version
 1.2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWJlbGlubywKClNvcnJ5IGZvciB0aGUgdmVyeSB2ZXJ5IGxvbmcgZGVsYXkgaW4gZ2V0
dGluZyBiYWNrIHRvIHlvdS4gSSB3YW50ZWQgdG8KYXBwbHkgdGhpcywgYnV0IHVuZm9ydHVuYXRl
bHksIGl0IGNhdXNlcyBhIGJ1aWxkIGZhaWx1cmUgd2hlbgpCUjJfUEFDS0FHRV9UUE0yX1RTU19F
TkdJTkVfRElHRVNUX1NJR04gaXMgZW5hYmxlZDoKCnNyYy90cG0yLXRzcy1lbmdpbmUtZWNjLmM6
IEluIGZ1bmN0aW9uIOKAmGluaXRfZWNj4oCZOgpzcmMvdHBtMi10c3MtZW5naW5lLWVjYy5jOjg2
NDo0NjogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMiBvZiDigJhFVlBfUEtFWV9tZXRoX2dldF9j
b3B54oCZIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdpbmNvbXBhdGlibGUtcG9p
bnRlci10eXBlc10KICA4NjQgfCAgICAgRVZQX1BLRVlfbWV0aF9nZXRfY29weShwa2V5X2VjY19t
ZXRob2RzLCAmZWNkc2FfcGtleV9vcmlnX2NvcHkpOwogICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgogICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKCoqKShFVlBf
UEtFWV9DVFggKiwgRVZQX1BLRVlfQ1RYICopIHtha2EgaW50ICgqKikoc3RydWN0IGV2cF9wa2V5
X2N0eF9zdCAqLCBzdHJ1Y3QgZXZwX3BrZXlfY3R4X3N0ICopfQoKc3JjL3RwbTItdHNzLWVuZ2lu
ZS1lY2MuYzo4Njc6NDY6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDIgb2Yg4oCYRVZQX1BLRVlf
bWV0aF9zZXRfY29weeKAmSBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XaW5jb21w
YXRpYmxlLXBvaW50ZXItdHlwZXNdCiAgODY3IHwgICAgIEVWUF9QS0VZX21ldGhfc2V0X2NvcHko
cGtleV9lY2NfbWV0aG9kcywgZWNkc2FfcGtleV9jb3B5KTsKICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn4KICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8CiAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ICgqKShFVlBfUEtF
WV9DVFggKiwgRVZQX1BLRVlfQ1RYICopIHtha2EgaW50ICgqKShzdHJ1Y3QgZXZwX3BrZXlfY3R4
X3N0ICosIHN0cnVjdCBldnBfcGtleV9jdHhfc3QgKil9CgpldGMuCgpQbGVhc2Ugc2VlIHNvbWUg
bW9yZSBzbWFsbCBjb21tZW50cyBiZWxvdyB0aGF0IEkgaGFkIGZpeGVkIGxvY2FsbHksIGJ1dAp0
aGF0IHdvdWxkIGJlIG5lZWRlZCBmb3IgeW91ciB2NC4KCkZpcnN0LCB0aGUgY29tbWl0IHRpdGxl
IHNob3VsZCBiZSBqdXN0OgoKCXBhY2thZ2UvdHBtMi10c3MtZW5naW5lOiBuZXcgcGFja2FnZQoK
T24gRnJpLCAyOSBOb3YgMjAyNCAxNDoxMzoyNCAtMDgwMApBYmVsaW5vIFJvbW8gPGFiZWxpbm8u
cm9tb0BnbWFpbC5jb20+IHdyb3RlOgoKPiBJbnRyb2R1Y2UgdGhlIFRQTTItVFNTIE9wZW5TU0wg
RW5naW5lIHRvIGVuYWJsZSBUUE0yIGRldmljZSBzdXBwb3J0IGluCj4gZWNvc3lzdGVtcyB0aGF0
IGRvIG5vdCB5ZXQgc3VwcG9ydCBPcGVuU1NMIFByb3ZpZGVycy4gVGhpcyBpcwo+IHBhcnRpY3Vs
YXJseSB1c2VmdWwgaW4gdGhlIEVybGFuZyBzcGFjZSwgd2hlcmUgT3BlblNTTCAzIFByb3ZpZGVy
cyBhcmUKPiBzdGlsbCB1bmRlciBkZXZlbG9wbWVudCBbMV0uCj4gCj4gWzFdIGh0dHBzOi8vZXJs
YW5nZm9ydW1zLmNvbS90L29wZW5zc2wtMy1zdXBwb3J0LWZvci1wcm92aWRlci1kZXByZWNhdGVk
LWVuZ2luZS1yZXBsYWNlbWVudC8yOTU0LzIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBYmVsaW5vIFJv
bW8gPGFiZWxpbm8ucm9tb0BnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyB2MiAtPiB2MzoKPiAg
IC0gVXNlIG1hbnVhbGx5IHVwbG9hZGVkIHRhcmJhbGwgLSB0aGUgYXJ0aWZhY3QgZnJvbSByZWxl
YXNlcy9kb3dubG9hZCBVUkwgLQo+IAkgIGFuZCBub3QgdGhlIGFyY2hpdmUgdGFyYmFsbC4KPiAJ
ICAoc3VnZ2VzdGVkIGJ5IFRob21hcyBQZXRhenpvbmkgaW4gdHBtMi10c3MgcGF0Y2ggdGhyZWFk
KQo+IAo+IAktIFVwZGF0ZWQgU2lnbmVkLU9mZiBmb3JtYXR0aW5nLgo+IAkgIChzdWdnZXN0ZWQg
YnkgVGhvbWFzIFBldGF6em9uaSBpbiB0cG0yLXRzcyBwYXRjaCB0aHJlYWQpCj4gCj4gIHBhY2th
Z2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgLi4uLWRp
c2FibGluZy1vZi1kaWdlc3Qtc2lnbi1vcGVyYXRpb25zLnBhdGNoIHwgNDYgKysrKysrKysrKysr
KysrKysrKwo+ICBwYWNrYWdlL3RwbTItdHNzLWVuZ2luZS9Db25maWcuaW4gICAgICAgICAgICAg
fCAyMSArKysrKysrKysKPiAgcGFja2FnZS90cG0yLXRzcy1lbmdpbmUvdHBtMi10c3MtZW5naW5l
Lmhhc2ggIHwgIDMgKysKPiAgcGFja2FnZS90cG0yLXRzcy1lbmdpbmUvdHBtMi10c3MtZW5naW5l
Lm1rICAgIHwgMzMgKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDEwNCBpbnNlcnRp
b25zKCspCgpQbGVhc2UgYWRkIGFuIGVudHJ5IGluIHRoZSBERVZFTE9QRVJTIGZpbGUuCgoKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS90cG0yLXRzcy1lbmdpbmUvQ29uZmlnLmluIGIvcGFja2FnZS90
cG0yLXRzcy1lbmdpbmUvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwLi4wMGY4YWM3NjMyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvdHBt
Mi10c3MtZW5naW5lL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMjEgQEAKPiArY29uZmlnIEJSMl9Q
QUNLQUdFX1RQTTJfVFNTX0VOR0lORQo+ICsJYm9vbCAidHBtMi10c3MtZW5naW5lIgo+ICsJc2Vs
ZWN0IEJSMl9QQUNLQUdFX1RQTTJfVFNTCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCT1BFTlNT
TF9FTkdJTkVTCj4gKwloZWxwCj4gKwkgIFRoZSB0cG0yLXRzcy1lbmdpbmUgcHJvamVjdCBpbXBs
ZW1lbnRzIGEgY3J5cHRvZ3JhcGhpYyBlbmdpbmUKPiArCSAgZm9yIE9wZW5TU0wgZm9yIFRydXN0
ZWQgUGxhdGZvcm0gTW9kdWxlIChUUE0gMi4wKSB1c2luZyB0aGUKPiArCSAgdHBtMi10c3Mgc29m
dHdhcmUgc3RhY2sgdGhhdCBmb2xsb3dzIHRoZSBUcnVzdGVkIENvbXB1dGluZwo+ICsJICBHcm91
cHMgKFRDRykgVFBNIFNvZnR3YXJlIFN0YWNrIChUU1MgMi4wKS4gSXQgdXNlcyB0aGUKPiArCSAg
RW5oYW5jZWQgU3lzdGVtIEFQSSAoRVNBUEkpIGludGVyZmFjZSBvZiB0aGUgVFNTIDIuMCBmb3IK
PiArCSAgZG93bndhcmRzIGNvbW11bmljYXRpb24uIEl0IHN1cHBvcnRzIFJTQSBkZWNyeXB0aW9u
IGFuZAo+ICsJICBzaWduYXR1cmVzIGFzIHdlbGwgYXMgRUNEU0Egc2lnbmF0dXJlcy4KClBsZWFz
ZSBhZGQ6CgorICAgICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10
c3MtZW5naW5lLwoKCj4gKyMgU2luY2UgdGhlIE9wZW5TU0wgMy4wIEVuZ2luZSBBUElzIGFyZSBk
ZXByZWNhdGVkLCBzdXBwcmVzcyB0aGUgd2FybmluZ3MuCj4gK1RQTTJfVFNTX0VOR0lORV9DRkxB
R1MgPSAkKFRBUkdFVF9DRkxBR1MpIC1Xbm8tZGVwcmVjYXRlZC1kZWNsYXJhdGlvbnMKPiArVFBN
Ml9UU1NfRU5HSU5FX0NPTkZfRU5WICs9IENGTEFHUz0iJChUUE0yX1RTU19FTkdJTkVfQ0ZMQUdT
KSIKCkNoYW5nZSB0aGlzIHRvOgoKKyMgU2luY2UgdGhlIE9wZW5TU0wgMy4wIEVuZ2luZSBBUElz
IGFyZSBkZXByZWNhdGVkLCBzdXBwcmVzcyB0aGUgd2FybmluZ3MuCitUUE0yX1RTU19FTkdJTkVf
Q09ORl9FTlYgPSBcCisgICAgICAgQ0ZMQUdTPSIkKFRBUkdFVF9DRkxBR1MpIC1Xbm8tZGVwcmVj
YXRlZC1kZWNsYXJhdGlvbnMiCgo+ICtkZWZpbmUgVFBNMl9UU1NfRU5HSU5FX0VOR0lORVNESVIK
PiArCSQoUEtHX0NPTkZJR19IT1NUX0JJTkFSWSkgLS12YXJpYWJsZT1lbmdpbmVzZGlyIGxpYmNy
eXB0byBcCj4gKwkJfCB4YXJncyByZWFkbGluayAtZiBcCj4gKwkJfCBzZWQgJ3MlXiQoU1RBR0lO
R19ESVIpJSUnCj4gK2VuZGVmCj4gKwo+ICtUUE0yX1RTU19FTkdJTkVfQ09ORl9PUFRTID0gXAo+
ICsJLS1kaXNhYmxlLWRlZmF1bHRmbGFncyBcCj4gKwktLXdpdGgtZW5naW5lc2Rpcj1gJChUUE0y
X1RTU19FTkdJTkVfRU5HSU5FU0RJUilgCgpUaGlzIHRvOgoKKyMgcGtnLWNvbmZpZyByZXR1cm5z
IGEgbGliY3J5cHRvIGVuZ2luZXNkaXIgcHJlZml4ZWQgd2l0aCB0aGUgc3lzcm9vdCwKKyMgc28g
bGV0J3MgcmlwIGl0IG91dC4KK1RQTTJfVFNTX0VOR0lORV9DT05GX09QVFMgPSBcCisgICAgICAg
LS1kaXNhYmxlLWRlZmF1bHRmbGFncyBcCisgICAgICAgLS13aXRoLWVuZ2luZXNkaXI9YCQoUEtH
X0NPTkZJR19IT1NUX0JJTkFSWSkgLS12YXJpYWJsZSBlbmdpbmVzZGlyIGxpYmNyeXB0byB8IHhh
cmdzIHJlYWRsaW5rIC1mIHwgc2VkICdzJV4kKFNUQUdJTkdfRElSKSUlJ2AKCj4gK2lmbmVxICgk
KEJSMl9QQUNLQUdFX1RQTTJfVFNTX0VOR0lORV9ESUdFU1RfU0lHTikseSkKPiArVFBNMl9UU1Nf
RU5HSU5FX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtZGlnZXN0c2lnbgo+ICtlbmRpZgoKQW5kIHRo
aXMgdG86CgoraWZlcSAoJChCUjJfUEFDS0FHRV9UUE0yX1RTU19FTkdJTkVfRElHRVNUX1NJR04p
LHkpCitUUE0yX1RTU19FTkdJTkVfQ09ORl9PUFRTICs9IC0tZW5hYmxlLWRpZ2VzdHNpZ24KK2Vs
c2UKK1RQTTJfVFNTX0VOR0lORV9DT05GX09QVFMgKz0gLS1kaXNhYmxlLWRpZ2VzdHNpZ24KK2Vu
ZGlmCgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBh
bmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
