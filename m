Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4A9C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0AB860017;
	Mon, 26 Aug 2024 16:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdypDFBB16Mz; Mon, 26 Aug 2024 16:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E74166077C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E74166077C;
	Mon, 26 Aug 2024 16:45:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 205811BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DC466077C
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9-RDs5G8mSs for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:45:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0505060017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0505060017
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0505060017
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:45:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39B68240007;
 Mon, 26 Aug 2024 16:45:13 +0000 (UTC)
Date: Mon, 26 Aug 2024 18:45:12 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240826184512.12aca28f@windsurf>
In-Reply-To: <20240824141616.3139902-1-dario.binacchi@amarulasolutions.com>
References: <20240824141616.3139902-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724690713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8DtX8206/0b46Pe9INC4KOSB+DT9+2o92Whk4wZPZvI=;
 b=J9gJfRK1Ht35suvVL6hO1qu6Ki5gQk6wx5K/rxFaTCBPrMjK+GHa73D4QfPmw2TNN4MyJF
 ah0z6y3RDtcCAvgEQPJQnjtlcssRDkajD4MPuhHb69ezqe6/fvid5ux7Cz7PH2XnOnR+dR
 T91dQWHHcxvhCy8Ur9xjCU/fbSblz1ocmN6vT3Pv+OIZRVw6G6YtVZKok6mwKUF0PPTnnk
 40qSxnUpZF4UX9teVUgYD0fySMe0tjSUw/zrP5FKxbTLm1Xnj9dqArQXFoWkegkiGyFzye
 G5yMcvkEo/zo8wjLBm9ZoySVZTWkHENz8XbepLaVrSgjjHed/BrYXM6+HW8rHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J9gJfRK1
Subject: Re: [Buildroot] [PATCH 1/1] package/babeld: bump to version 1.10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAyNCBBdWcgMjAyNCAxNjoxNjoxNiArMDIwMApEYXJpbyBCaW5hY2NoaSA8ZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgoKPiAtIFJlbW92ZWQgdGhlIGRp
c2FtYmlndWF0aW9uIGNvZGU6IHNvdXJjZS1zcGVjaWZpYyByb3V0aW5nIGlzIG5vIGxvbmdlcgo+
ICAgc3VwcG9ydGVkIGZvciBJUHY0LCBhbmQgZm9yIElQdjYgb25seSBvbiBMaW51eCAzLjExIG9y
IGxhdGVyLgo+IC0gRml4ZWQgYW4gaXNzdWUgaGFuZGxpbmcgb2YgcmV0cmFjdGlvbnMgd2l0aCBu
byBuZXh0IGhvcCwgd2hpY2ggY2F1c2VkCj4gICBpbnRlcm9wZXJhYmlsaXR5IHByb2JsZW1zIHdp
dGggQklSRC4gIFRoYW5rcyB0byBGYWJpYW4gQmzDpHNlLgo+IC0gSWYgc2tpcC1rZXJuZWwtc2V0
dXAgaXMgc2V0LCB3ZSBubyBsb25nZXIgZGlzYWJsZSB0aGUgcnBfZmlsdGVyLCB3aGljaAo+ICAg
bWFrZXMgYmFiZWxkIHdvcmsgaW4gY29udGFpbmVycy4gIFRoYW5rcyB0byBNYXJ0aW4gV2VpbmVs
dC4KPiAKPiBGaXhlczoKPiAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
LzI0NDcwNjBjODZhY2YxYmQ4ZDZlZTBiY2Y4ZjliNmFkY2RmYzUwYzkKCkhtbSwgc29ycnkgYnV0
IHdoeSBhIHZlcnNpb24gYnVtcCBpcyBuZWVkZWQgdG8gZml4IGFuIGlzc3VlIGFib3V0IGEKdGFy
YmFsbCBub3QgYmVpbmcgZm91bmQ/CgpUaGlzIGlzIGdlbmVyYWxseSBhIHNpZ24gdGhhdCB1cHN0
cmVhbSBpcyBtb3ZpbmcgdGFyYmFsbHMgYXJvdW5kIGFmdGVyCnRoZXkgYXJlIHJlbGVhc2VkLCB3
aGljaCBtZWFucyB0aGF0IGF0IHNvbWUgcG9pbnQgdGhlIGlzc3VlIHdpbGwgb2NjdXIKYWdhaW4g
d2l0aCBiYWJlbGQgMS4xMC4KCkNvdWxkIHlvdSBjaGVjayB3aGF0IGhhcHBlbmVkIHdpdGggdGhl
IGJhYmVsZCAxLjkuMiB0YXJiYWxsLCBwZXJoYXBzIGJ5CmNvbnRhY3RpbmcgdXBzdHJlYW0/Cgoo
SSBtZWFuIG9mIGNvdXJzZSB3ZSB3aWxsIHdhbnQgdG8gdXBkYXRlIGJhYmVsZCB0byB2ZXJzaW9u
IDEuMTAsIGJ1dAp0aGlzIHNob3VsZCBiZSBkb25lIHNlcGFyYXRlbHkgdGhhbiBmaXhpbmcgdGhl
IGRvd25sb2FkIGlzc3VlKQoKVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBj
by1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
