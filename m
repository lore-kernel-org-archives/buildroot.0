Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9D9C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8635F83DDF;
	Thu,  9 May 2024 15:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8df4UFtabpvp; Thu,  9 May 2024 15:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95B5D83DE0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95B5D83DE0;
	Thu,  9 May 2024 15:41:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B098B1BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BFF440228
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5R8bovLP-jB for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:41:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E060440224
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E060440224
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E060440224
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:41:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1822B20003;
 Thu,  9 May 2024 15:40:58 +0000 (UTC)
Date: Thu, 9 May 2024 17:40:57 +0200
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Message-ID: <20240509174057.1234e233@windsurf>
In-Reply-To: <20240419-ztext-v1-1-a8d5c2cfcf57@gmx.net>
References: <20240419-ztext-v1-1-a8d5c2cfcf57@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715269259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rfEjSBBlgBEL9k6sWdpoS/ufRZr2a/bSKSR1my5vC0=;
 b=eMsNUxePTWxfnyBo0p5bH3M2f0RIJqTqLeynHbLkn6c5ArK4XUxI79GQ4on4/PBwixyWJi
 HhHJONy2XwfkpBrBfgH0W5KUQLmzTJprvZLr5UBGayd+euHCKT1PyWPfxynMOsD4q0na2w
 y63w6qsSLhPjKE5BFrB/HHmEr2GRXWEvZ8Dy86u0yX0ltngiCge3y3iGO7eAUjNDF1ZzXM
 oSTzwyTOXcD1T/77uyYOBsbpTTaYj2H1Fqgy/811CTQOrO5JDXXAeG0/Gl4lqdKD09RiPE
 m/7mcjJ9kAjBWAsg+rUrtGR/Y0KmSTnyGodkeMoh31zYoa3LBdztafBGlUVtxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eMsNUxeP
Subject: Re: [Buildroot] [PATCH] Config.in: add option to ban textrels
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
Cc: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBGcmksIDE5IEFwciAyMDI0IDE2OjUyOjUwICswMjAwCkouIE5ldXNjaMOkZmVy
IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gSWRlYWxs
eSwgdGhpcyBvcHRpb24gd291bGQgZGVmYXVsdCB0byB5ZXMgd2hlbiBhIG11c2wtYmFzZWQgdG9v
bGNoYWluIGlzCj4gdXNlZCwgYXMgbXVzbCBkb2Vzbid0IHN1cHBvcnQgVEVYVFJFTHNbMV0gYW5k
IHByb2dyYW1zIHdpdGggVEVYVFJFTHMKPiB3aWxsIGNyYXNoIG9uIHN0YXJ0LXVwIHVuZGVyIG11
c2wuCj4gCj4gSG93ZXZlciwgdG8gYXZvaWQgYSBsYXJnZSBidWlsZCBmYWxsb3V0LCBpdCBkZWZh
dWx0cyB0byAibm8iIGZvciBub3cuCj4gQWZ0ZXIgdGhpcyBvcHRpb24gaGFzIGJlZW4gZW5hYmxl
ZCBpbiBidWlsZCB0ZXN0cyBmb3IgYSB3aGlsZSBhbmQgc29tZQo+IG9mIHRoZSBmYWxsb3V0IGhh
cyBiZWVuIGZpeGVkLCB0aGUgZGVmYXVsdCBjYW4gYmUgY2hhbmdlZC4KPiAKPiBbMV06IGh0dHBz
Oi8vd3d3Lm9wZW53YWxsLmNvbS9saXN0cy9tdXNsLzIwMjAvMDkvMjUvNAo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+CgpUaGFua3MgZm9y
IHRoZSBwYXRjaC4gSSBhbSBub3QgZnVsbHkgc3VyZSBJIHRvdGFsbHkgZ3Jhc3AgdGhlIGlzc3Vl
LApidXQgSSdtIHdvbmRlcmluZyBpZiBtYWtpbmcgaXQgYW4gb3B0aW9uIGlzIHJlYWxseSB0aGUg
cmlnaHQgdGhpbmcgdG8KZG8uIElmIGluZGVlZCBURVhUUkVMcyBkb24ndCB3b3JrIHdpdGggbXVz
bCwgdGhlbiB3ZSBzaG91bGQgc2ltcGx5CmRpc2FibGUgdGhlbS4KCk9uZSB0aGluZyBJJ20gbm90
IGVudGlyZWx5IGNsZWFyIGlzIHRoYXQKaHR0cHM6Ly93d3cub3BlbndhbGwuY29tL2xpc3RzL211
c2wvMjAyMC8wOS8yNS80IHN0YXRlcyAiSSByZWNlbnRseQpkaXNjb3ZlcmVkIHRoYXQgbXVzbCBk
b2Vzbid0IHN1cHBvcnQgRFQvREZfVEVYVFJFTCBpbiB0aGUgbWFpbgpleGVjdXRhYmxlIiwgd2hp
bGUgcGFzc2luZyAteiB0ZXh0IHdpbGwgZGlzYWxsb3cgVEVYVFJFTCBldmVyeXdoZXJlLApub3Qg
b25seSAibWFpbiBleGVjdXRhYmxlIiBidXQgYWxzbyBzaGFyZWQgbGlicmFyaWVzLiBJcyB0aGF0
IGludGVuZGVkPwoKRG8geW91IGhhdmUgYW4gaWRlYSBvZiB0aGUgYW1vdW50IG9mIGJyZWFrYWdl
IGVuYWJsaW5nIC16IHRleHQgd291bGQKY2F1c2U/IFdoaWNoIHBhcnRpY3VsYXIgcGFja2FnZS9z
aXR1YXRpb24gZGlkIHlvdSBlbmNvdW50ZXIgdGhhdCB3YXMKdXNpbmcgVEVYVFJFTCBhbmQgc2hv
dWxkbid0IGhhdmUgaW4gb3JkZXIgdG8gYmUgY29tcGF0aWJsZSB3aXRoIG11c2w/CgpUaGFua3Ms
CgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6
Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
