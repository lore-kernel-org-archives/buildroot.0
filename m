Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13453E92704
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B528A60768;
	Sat, 27 Dec 2025 15:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PySwPw-Pv-6; Sat, 27 Dec 2025 15:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85C31606CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766848554;
	bh=gOYkIXw1At7hHAVVs9XEP2BwmjGqKn4gLx+JhpzI6B4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mKhrEuW/lGya5JgmSmzbV8nZwExNnIH8FjzGbkF6s2Ovah8b2E9LJF44grznZV4pX
	 pslGb67MJ9zSKNRM2/rvKwIjlEKXCKb5PLsFSxBr0Fit4eJOMc575I4M+WAyaRDhbq
	 jnzIfKHbj2TnNGDqyU+3OnEUqpE8kQ7xpcY1sAy81geXCgKRqfvVrHs/3LzFMXZeEF
	 DtcfAnmwVaiZi7f0EX6Z+zm/yt98sAKKD6ibA+l8jpH1hf56w7jUvdt7/YM+VBt15D
	 TWEeCL0TWNVu0pGxOVbX/jMKS5L95hcOt1mlLtaNo7egK7akvfBAUy9r1rpIO1LRP8
	 pLB1tqDHwH18Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85C31606CC;
	Sat, 27 Dec 2025 15:15:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB5DB119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B17F18087F
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eamuAww1oUxG for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:15:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1E8780840
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1E8780840
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1E8780840
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:15:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8C9CDC1D1A5
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:15:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DD31B60725;
 Sat, 27 Dec 2025 15:15:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 299FA119784FF; Sat, 27 Dec 2025 16:15:47 +0100 (CET)
Date: Sat, 27 Dec 2025 16:15:46 +0100
To: =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org
Message-ID: <20251227161546.4a0386b6@windsurf>
In-Reply-To: <20251217-pixman-aarch64-neon-fix-v2-1-e0889825b157@armadeus.com>
References: <20251217-pixman-aarch64-neon-fix-v2-1-e0889825b157@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766848548; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rCQqpGxMWF87ES6G6pLlg65jM7xrU7HRYLflL+9eDT0=;
 b=jR69TXz2D17Ft9K7iDoHpoaGfNVtuWcR8yzhCoyS59d/gtSq6v5fE90lDKcpY3h0FjEpSK
 oAnn+ZfDL3IXkduO0V4/SXqTXMlb1mo9Y3eggurGQdD3uSpMvB6ANwtrdctVvpkCWkEmbP
 PjcdWQDKGEUz6zTPArCWwoaXBPuxykZeWEb0sP+ClIs6eqIK2qC/y91sQwmzv+tHUBfCbV
 nauO0yJSPvpniEGRkI/d5DS4O19XmTMNr2G0VytzC6jCL0E9MU5QQeNhZstpeDKIkKsmW7
 3gcJ861fkrQGTLvuoxjbmstbGoEhfeTIivIakHHqshSbiDuFTH+rNM9CpbujDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jR69TXz2
Subject: Re: [Buildroot] [PATCH v2] package/pixman: fix NEON support on
 AArch64
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

SGVsbG8gU8OpYmFzdGllbiwKCk9uIFdlZCwgMTcgRGVjIDIwMjUgMTI6NTY6MTMgKzAxMDAKU8Op
YmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPiB3cm90
ZToKCj4gVGhlIHRlc3QgdG8gZW5hYmxlIE5FT04gb24gQUFyY2g2NCBpcyBhcyBmb2xsb3dpbmc6
Cj4gCj4gaWZlcSAoJChCUjJfYWFyY2g2NCkkKEJSMl9BUk1fQ1BVX0hBU19ORU9OKSx5eSkKPiAK
PiBJdCBjYW5ub3QgYmUgdG8gdHJ1ZSBhcyAkKEJSMl9hYXJjaDY0KSBhbmQgJChCUjJfQVJNX0NQ
VV9IQVNfTkVPTikgYXJlCj4gbXV0dWFsbHkgZXhjbHVzaXZlLiBORU9OIGlzIGNvbXB1bHNvcnkg
b24gQUFyY2g2NCBzbyByZW1vdmUKPiAkKEJSMl9BUk1fQ1BVX0hBU19ORU9OKSBmcm9tIHRoZSB0
ZXN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4u
c3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+ICogZml4IGNv
bW1pdCB0aXRsZSAocGFja2FnZS9waXhtYW46IGluc3RlYWQgb2YgcGl4bWFuOikKPiAqIFJlbW92
ZSAiY2hlcnJ5IHBpY2tlZCBmcm9tLi4uIiBsaW5lIGZyb20gdGhlIGNvbW1pdCBsb2cKPiAqIGFk
ZCAiQmFja3BvcnQgdG86IiBub3RlCj4gKiBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjUxMjE3LXBpeG1hbi1hYXJjaDY0LW5lb24tZml4LXYxLTEtM2E2YWE4MjAwOTdl
QGFybWFkZXVzLmNvbQo+IC0tLQo+IEJhY2twb3J0IHRvOiAyMDI1LjExLngsIDIwMjUuMDIueAo+
IC0tLQo+ICBwYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKQXBwbGllZCB0byBtYXN0ZXIgYWZ0ZXIg
c2xpZ2h0bHkgaW1wcm92aW5nIHRoZSBjb21taXQgbWVzc2FnZSB0byBwb2ludAp0byB0aGUgY29t
bWl0IHdoaWNoIGludHJvZHVjZWQgdGhlIHByb2JsZW0uCgpUaGFua3MgYSBsb3QhCgpUaG9tYXMK
LS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
