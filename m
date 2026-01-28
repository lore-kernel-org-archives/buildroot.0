Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE96CD46BF9
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 20:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8780A80ED7;
	Wed, 28 Jan 2026 20:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pE3EGHrxP23; Wed, 28 Jan 2026 20:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D114980F2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769631285;
	bh=nyuTIF7zplOUsC7qo2fiVR7XSic+XeuxAMP37ojnbqY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dqShelKPea7qw9DW+/WVaa5fEm5GnE73wy6LlsxEyd6X0zEVnQlbebqUVWkNl7jA2
	 XUnGVUj6f/YnPWXYdUc8HPRQIvtSfCL3YRqfqTV8ifld//UNgKS4r9/CPN7obKzori
	 DcUwVzUakm8C/MeuBQ3vyA4ZwE+grDwug1hAKUl/fpUKc0xRMUlLrOLfsfnoBJDwVu
	 LlwlCAzDQjQ/5cIkTMuFrxUIglBVNjsmnyAFMywdxTPJmwPvxMfgfe/oOxo/urBNS6
	 GmU8ALpnFL1aS+n05yQNtDcaxlN8WUPrUnjXgEs3St0ShJfDti1YbwdgsYqZQ2U+FR
	 m08Nps34CqE/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D114980F2D;
	Wed, 28 Jan 2026 20:14:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BD8FD3
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 20:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AAD74037B
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 20:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVIK0315HHSM for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 20:14:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 516DE400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 516DE400FC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 516DE400FC
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 20:14:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3AEF613F861;
 Wed, 28 Jan 2026 21:14:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 28 Jan 2026 21:14:39 +0100
MIME-Version: 1.0
Date: Wed, 28 Jan 2026 21:14:39 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260128090645.1023133-1-peter@korsgaard.com>
References: <20260128090645.1023133-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <60bcdcfa0de55717cc9e80f62542d787@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769631280;
 bh=iYDGNBgI4Un636X9sEM4TrbHSGfqVj14qTPM/gDODBo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bBgQhkiYv1yhPPLKNVClPeD+r/YuEQYv0FU3LQNyqYInxzw1yvZxH8/M0UrbLFle1
 Urn6eoYHC/nsvuIJNy2v8DBq2ydm5In70VbN9g77VujF7lCYamdulMK8G5WCnOEcUA
 10PHnnQuynZ4rLes230a6GJn07zc2Gag0s9BP+3BBrpYhyhuBtStH9wY57ZwcihmiQ
 F/jm8cP3C1SwP8EimtMSEkEU56/aEYjsPWhhk+knEOga5ISsvTOerZjUq5Nv9R8YsZ
 DM78P5sPP7613uufq1wmbEJmtgn98jk47MfzpGrdWMz7lkktt1PgJJcauZe4SQFRjs
 s62U8S1+BDu4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bBgQhkiY
Subject: Re: [Buildroot] [PATCH] package/libopenssl: security bump to
 version 3.6.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjgvMDEvMjAyNiAxMDowNiwgUGV0ZXIgS29yc2dhYXJkIHdyb3RlOgo+IEZpeGVzIHRoZSBm
b2xsb3dpbmcgdnVsbmVyYWJpbGl0aWVzOgo+IAo+IENWRS0yMDI1LTExMTg3IC0gSW1wcm9wZXIg
dmFsaWRhdGlvbiBvZiBQQk1BQzEgcGFyYW1ldGVycyBpbiBQS0NTIzEyIAo+IE1BQyB2ZXJpZmlj
YXRpb24uCj4gQ1ZFLTIwMjUtMTU0NjcgLSBTdGFjayBidWZmZXIgb3ZlcmZsb3cgaW4gQ01TIEF1
dGhFbnZlbG9wZWREYXRhIAo+IHBhcnNpbmcuCj4gQ1ZFLTIwMjUtMTU0NjggLSBOVUxMIGRlcmVm
ZXJlbmNlIGluIFNTTF9DSVBIRVJfZmluZCgpIGZ1bmN0aW9uIG9uIAo+IHVua25vd24gY2lwaGVy
IElELgo+IENWRS0yMDI1LTE1NDY5IC0g4oCYb3BlbnNzbCBkZ3N04oCZIG9uZS1zaG90IGNvZGVw
YXRoIHNpbGVudGx5IHRydW5jYXRlcyAKPiBpbnB1dHMgPjE2TUIuCj4gQ1ZFLTIwMjUtNjYxOTkg
LSBUTFMgMS4zIENvbXByZXNzZWRDZXJ0aWZpY2F0ZSBleGNlc3NpdmUgbWVtb3J5IAo+IGFsbG9j
YXRpb24uCj4gQ1ZFLTIwMjUtNjgxNjAgLSBIZWFwIG91dC1vZi1ib3VuZHMgd3JpdGUgaW4gQklP
X2ZfbGluZWJ1ZmZlciBvbiBzaG9ydCAKPiB3cml0ZXMuCj4gQ1ZFLTIwMjUtNjk0MTggLSBVbmF1
dGhlbnRpY2F0ZWQvdW5lbmNyeXB0ZWQgdHJhaWxpbmcgYnl0ZXMgd2l0aCAKPiBsb3ctbGV2ZWwg
T0NCIGZ1bmN0aW9uIGNhbGxzCj4gQ1ZFLTIwMjUtNjk0MTkgLSBPdXQgb2YgYm91bmRzIHdyaXRl
IGluIFBLQ1MxMl9nZXRfZnJpZW5kbHluYW1lKCkgVVRGLTggCj4gY29udmVyc2lvbi4KPiBDVkUt
MjAyNS02OTQyMCAtIE1pc3NpbmcgQVNOMV9UWVBFIHZhbGlkYXRpb24gaW4gCj4gVFNfUkVTUF92
ZXJpZnlfcmVzcG9uc2UoKSBmdW5jdGlvbi4KPiBDVkUtMjAyNS02OTQyMSAtIE5VTEwgUG9pbnRl
ciBEZXJlZmVyZW5jZSBpbiBQS0NTMTJfaXRlbV9kZWNyeXB0X2QyaV9leCAKPiBmdW5jdGlvbgo+
IENWRS0yMDI2LTIyNzk1IC0gTWlzc2luZyBBU04xX1RZUEUgdmFsaWRhdGlvbiBpbiBQS0NTIzEy
IHBhcnNpbmcKPiBDVkUtMjAyNi0yMjc5NiAtIEFTTjFfVFlQRSBUeXBlIENvbmZ1c2lvbiBpbiB0
aGUgCj4gUEtDUzdfZGlnZXN0X2Zyb21fYXR0cmlidXRlcygpIGZ1bmN0aW9uCj4gCj4gRm9yIG1v
cmUgZGV0YWlscywgc2VlIHRoZSBhbm5vdW5jZW1lbnQ6Cj4gaHR0cHM6Ly9vcGVuc3NsLWxpYnJh
cnkub3JnL3Bvc3QvMjAyNi0wMS0yNy1yZWxlYXNlLWFubm91bmNlbWVudC8KPiAKPiBEcm9wIG5v
dyB1cHN0cmVhbWVkIAo+IDAwMDQtU2NvcGUtYWVzX2NmYjEyOF92YWVzX2VuY2RlY193cmFwcGVy
LXRvLXg2NC5wYXRjaDoKPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbnNzbC9vcGVuc3NsL2NvbW1p
dC9mNTI5ZDI2NTkxNTU4ODMwMjZjYzVmZTFlM2E1NjBjMjc0ZGE4NmI5Cj4gCj4gU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgoKQXBwbGllZCB0byBt
YXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
