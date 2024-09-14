Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380D1C02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91FE2403CD;
	Sat, 14 Sep 2024 13:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OE5hvgpVyDf; Sat, 14 Sep 2024 13:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ED0240450
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ED0240450;
	Sat, 14 Sep 2024 13:51:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC69B1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C87D76069C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OawcLmyMs9pY for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D813660672
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D813660672
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D813660672
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:51:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 001D020002;
 Sat, 14 Sep 2024 13:51:49 +0000 (UTC)
Date: Sat, 14 Sep 2024 15:51:49 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240914155149.38787678@bootlin.com>
In-Reply-To: <20240914124337.1200461-6-peter@korsgaard.com>
References: <20240914124337.1200461-1-peter@korsgaard.com>
 <20240914124337.1200461-6-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726321910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rV0tSDxLobGVLJLlPaVRcOZRvwGhjg3lQKKfz7h+qrA=;
 b=N7H9Qge7gD6ajhRtfrm5HQ1r8o35jfWFChKnBpM9NCWD7aaUhiaNB6eELQvFMAUirpRRx7
 oYLYYdcFoAYLIi4ZBkhHWAWJ3Jj6qpbStHQCRSWhTfAC/tsQWLhPV1tDrVqN4x2YejqXFN
 /LDGk49OGr+6SqZ4Riy0oLfFCVWy5DO/yqWlEEuArTFXqcYjre+2D5X/4zZyoPE/+asOTX
 9JeMBiw4n/l0IQl/qQ2oYASTnrXBcAZPVPpV5GZy/fPqtoePrniV5ahPqQvk5tZ8lFZwI2
 4kUnzY3Ux0t9eAJcrG1YoQOiUTH548lGrXiCehP1WFEM6qTX2EZ2WRRsUwcGIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N7H9Qge7
Subject: Re: [Buildroot] [PATCH 06/20] package/lua-augeaus: fix assignment
 typo
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiBTYXQsIDE0IFNlcCAyMDI0IDE0OjQzOjIzICswMjAwClBldGVyIEtvcnNn
YWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cgo+IFNpZ25lZC1vZmYtYnk6IFBldGVy
IEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9sdWEtYXVn
ZWFzL2x1YS1hdWdlYXMubWsgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YS1hdWdlYXMvbHVh
LWF1Z2Vhcy5tayBiL3BhY2thZ2UvbHVhLWF1Z2Vhcy9sdWEtYXVnZWFzLm1rCj4gaW5kZXggOTMw
Y2Y0OWI4Ni4uOGE3ZjJiNWY3YiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1YS1hdWdlYXMvbHVh
LWF1Z2Vhcy5tawo+ICsrKyBiL3BhY2thZ2UvbHVhLWF1Z2Vhcy9sdWEtYXVnZWFzLm1rCj4gQEAg
LTExLDcgKzExLDcgQEAgTFVBX0FVR0VBU19MSUNFTlNFX0ZJTEVTID0gQ09QWVJJR0hUCj4gIExV
QV9BVUdFQVNfREVQRU5ERU5DSUVTID0gbHVhaW50ZXJwcmV0ZXIgYXVnZWFzIGhvc3QtcGtnY29u
Zgo+ICAKPiAgIyBMREZMQUdTPSQoTERGTEFHUykgaXMgcHJlc2VudCB0byBwYXNzIExERkxBR1Mg
ZnJvbSBlbnZpcm9ubWVudCB0byB0aGUgY29tbWFuZAo+IC0jIGxpbmUuIFdpdGggTERGTEFHUyBz
ZXQgaW4gdGhlIGNvbW1hbmQgbGluZSwgcmVsYXRlZCBvcmRpbmFyeSBhc2lnbm1lbnQgcHJlc2Vu
dAo+ICsjIGxpbmUuIFdpdGggTERGTEFHUyBzZXQgaW4gdGhlIGNvbW1hbmQgbGluZSwgcmVsYXRl
ZCBvcmRpbmFyeSBhc3NpZ25tZW50IHByZXNlbnQKPiAgIyBpbiB0aGUgbWFrZWZpbGUgYXJlIGln
bm9yZWQgYW5kIHNvIGx1YS1hdWdlYXMgbWFrZWZpbGUgY2Fubm90IG5vdCBhZGQgJy1ML2xpYicK
PiAgIyB0byB0aGlzIHZhbHVlLgo+ICBMVUFfQVVHRUFTX0NPTkZfT1BUUz0gXAoKVGhhbmtzIGZv
ciB0aGUgcGF0Y2ghCgpBY2tlZC1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxp
bi5jb20+CgpSZWdhcmRzLApIZXJ2w6kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
