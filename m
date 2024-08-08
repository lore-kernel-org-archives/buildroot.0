Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234E2C52D71
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 19:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFA8D40D13;
	Thu,  8 Aug 2024 19:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C77WIoZHiBB2; Thu,  8 Aug 2024 19:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A83C540D1B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A83C540D1B;
	Thu,  8 Aug 2024 19:56:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9850F1BF2A3
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 844CC40D1B
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UK4q7Irid9c for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 19:56:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A85D40D13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A85D40D13
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A85D40D13
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 19:56:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DF5440002;
 Thu,  8 Aug 2024 19:56:17 +0000 (UTC)
Date: Thu, 8 Aug 2024 21:56:15 +0200
To: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20240808215615.64528ebd@windsurf>
In-Reply-To: <20240808160606.60188-3-salvador.joseluis@gmail.com>
References: <20240807120619.66304f2e@windsurf>
 <20240808160606.60188-3-salvador.joseluis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723146977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yD+/XUEXLGP89O4jjR2YqAS7+b/Dt1dQKTQaYnmSCG4=;
 b=lCUEmgWC+SgKo6pfIwhA0RQ9L4eM7H0IxItsECBFuP9q/O/n3T8LAzeA29BRizV2FBHkqh
 PRNo+Nrg7apGSjyugkILCNTmZeowGru4b8Ff+ICtPUKiRV0GRkNrE6ri6jh59BzQZns5ou
 xEKfYKnSAtYUv8u9wOR3ow1RMVP+SY5PkyyDYlezkDM8WBUn21rMXaaMxm7ordhpuvvVo5
 u8Mm3YnMsMszfy04uFzBf+ILX8CQIfG6POb9PM+sGpWEhxIrnKW+0yem8uVtdIUy9jTcVk
 ciWVZps4tupZmWTQ0P6EQnoMCht9Urknoiq5IrVUOFe3xd8zshxXjwARpKUHuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lCUEmgWC
Subject: Re: [Buildroot] [PATCH v3 1/2] package/zfs: replace wip patch by
 upstream patch
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6khCgpPbiBUaHUsICA4IEF1ZyAyMDI0IDE4OjA2OjA3ICswMjAwCkpvc8OpIEx1
aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPiB3cm90ZToKCj4g
U2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVp
c0BnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyB2MiAtPiB2MzoKPiAgICAgLSBBZGRlZCBTaWdu
ZWQtb2ZmLWJ5IChzdWdnZXN0ZWQgYnkgVGhvbWFzIFBldGF6em9uaSkKPiBDaGFuZ2VzIHYxIC0+
IHYyOgo+ICAgICAtIFJlbW92ZWQgWkZTX0FVVE9SRUNPTkYgKHN1Z2dlc3RlZCBieSBCYXJ1Y2gg
U2lhY2gpCgpUaGFua3MgZm9yIHRoZSBuZXcgaXRlcmF0aW9uLCB3aGljaCBJIGhhdmUgYXBwbGll
ZC4KCkZpcnN0IGNvbW1lbnQ6IHdoZW4geW91IHNlbmQgYSBuZXcgaXRlcmF0aW9uLCBkb24ndCBz
ZW5kIGl0IGFzIGEgcmVwbHkKdG8gdGhlIHByZXZpb3VzIG9uZS4gU2VuZCBpdCBhcyBhIG5ldyB0
aHJlYWQuCgo+ICtTaWduZWQtb2ZmLWJ5OiBUaW5vIFJlaWNoYXJkdCA8bWlsa3ktemZzQG1jbWls
ay5kZT4KPiArU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRv
ci5qb3NlbHVpc0BnbWFpbC5jb20+Cj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bnpmcy96ZnMvcHVsbC8xNjQxMwoKV2hlbiB0aGUgcGF0Y2ggaXMgYWxyZWFkeSBtZXJnZWQgdXBz
dHJlYW0sIHdlIHByZWZlciB0byBoYXZlIGhlcmUgdGhlCmxpbmsgdG8gdGhlIHVwc3RyZWFtIGNv
bW1pdCByYXRoZXIgdGhhbiB0aGUgcHVsbCByZXF1ZXN0LCBzbyBJJ3ZlCnJlcGxhY2VkIHRoaXMg
YnkgdGhlIGxpbmsgdG8gdGhlIGZpbmFsIHVwc3RyZWFtIGNvbW1pdC4KClRoYW5rcyEKClRob21h
cwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3Rs
aW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
