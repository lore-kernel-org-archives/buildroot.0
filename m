Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A66FC3DA7E
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 16:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9E59401C2;
	Wed, 24 Jul 2024 16:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJJrgBmFzlA8; Wed, 24 Jul 2024 16:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1EF9402F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1EF9402F2;
	Wed, 24 Jul 2024 16:22:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECE5D1BF29C
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA2EA4031B
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTeolseCdByD for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 16:22:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90E4640316
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90E4640316
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90E4640316
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 16:22:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B59E40005;
 Wed, 24 Jul 2024 16:21:59 +0000 (UTC)
Date: Wed, 24 Jul 2024 18:21:58 +0200
To: "=?UTF-8?B?R2HDq2w=?= PORTAY" <gael.portay@gmail.com>
Message-ID: <20240724182158.07c7436b@windsurf>
In-Reply-To: <20240723212011.23048-3-gael.portay@rtone.fr>
References: <20240723212011.23048-1-gael.portay@rtone.fr>
 <20240723212011.23048-3-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721838119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xYsNk49qpJBTEZZetJisxnizVrJPXFQ4wyJr10lj+wk=;
 b=MfiHahymNFt3JYhj/nYWLF/hYPgtU7ME/EuR0Z3GLC7LivSjkQJChbMU5wrSXp9kT2kGEO
 V/r3BZjjXbZqBtVMxrmmACNEQlhpvIi0yMHZ6Eyqh5vqRXW358AGug7YYc6qclyUL7/8Ba
 IvF0HNBhtpBPPq9NC0zQOmxDE7JiXYiVk1fkSUKO3EMHqlw1rMNGs4xJ4paTstzPOaeThk
 adsy29EtbfxdZ0HgHujCSUET1Q8n2sQKW0J1E+X9EWKjG8BUrPZE81xhtG0VmIKxgNrIRf
 rJzunEwIxGUI389zCPdu5LXChiw/gnZOkZhDd7M3fW6iwq3rxfE8szR1/TKXsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MfiHahym
Subject: Re: [Buildroot] [PATCH 2/2] package/rpi-userland: package is
 deprecated
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMyBKdWwgMjAyNCAyMzoyMDoxMSArMDIwMAoiR2HDq2wgUE9SVEFZIiA8Z2FlbC5w
b3J0YXlAZ21haWwuY29tPiB3cm90ZToKCj4gKwkgIEltcG9ydGFudDogVGhlIHBhY2thZ2UgaXMg
YW5jaWVudCBhbmQgZGVwcmVjYXRlZC4KPiArCj4gKwkgIEl0IGxhcmdlbHkgY29udGFpbnMgY29k
ZSB1c2luZyBwcm9wcmlldGFyeSBBUElzIHRvIGludGVyZmFjZQo+ICsJICB0byB0aGUgVmlkZW9D
b3JlIGZpcm13YXJlLiBJdCBoYXMgc2luY2UgbW92ZWQgdG8gc3RhbmRhcmQKPiArCSAgbGludXgg
QVBJcy4KPiArCj4gKwkgIFY0TDIsIERSTS9LTVMgYW5kIE1lc2EgYXJlIHRoZSBBUElzIHlvdSBz
aG91bGQgYmUgdXNpbmcuCgpEb2VzIE1lc2Egbm93IGhhcyBhIGRyaXZlciB0aGF0IHN1cHBvcnRz
IGFsbCBnZW5lcmF0aW9ucyBvZiB0aGUgR1BVcwpmb3VuZCBpbiBSYXNwYmVycnlQaSwgYWxsIHRo
ZSB3YXkgdXAgdG8gdGhlIGZpcnN0IGdlbmVyYXRpb24KUmFzcGJlcnJ5UGkgPwoKVGhhbmtzIQoK
VGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
