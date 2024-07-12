Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FC7C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC92441A8A;
	Fri, 12 Jul 2024 14:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSEXnFj6E60b; Fri, 12 Jul 2024 14:43:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B5BB41B7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B5BB41B7A;
	Fri, 12 Jul 2024 14:43:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99E561BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 834B04116D
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lB7cwoKB00tp for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:43:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 480AB40A12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 480AB40A12
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 480AB40A12
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:43:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59E3320002;
 Fri, 12 Jul 2024 14:43:19 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:43:18 +0200
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <20240712164318.3be89b4d@windsurf>
In-Reply-To: <20240607071359.767329-3-gael.portay@rtone.fr>
References: <20240607071359.767329-1-gael.portay@rtone.fr>
 <20240607071359.767329-3-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720795399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tu2AURfgB+liH2H5AmR/rLkscrErjzydnMTBLmiyFvw=;
 b=Qj/Sn0p0OHrS9QOcNDkg6vZzSCw6AJlCR/mF4HJVAg8eD9LzVjvKqQRh3FDAvLh2gU3yl0
 /iQ/QC5EPan2/4LSgBB7GIyYT27N071UOpSYytceTL1qV2eoA2PRIVvlJAYiJG3Jxkda9j
 gOuoqu6tyVCyF7DJST++d8ds+9ohrY1GNrMM4WVQ50lqMeEvOLDPRoBWFDmdRUlCjYygN4
 rBYETMcm3AjK6Id1TRVmSFBuEiK6psN0pCGMJ085EWNOQEWVfgMI2TFlabakosSjSsnc18
 YYsVLW2NoQjZuC14Cz+dIbepw9/kijt5L1NoLCockOLj4XCy+YbWGmSYlkC6/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qj/Sn0p0
Subject: Re: [Buildroot] [next v2 2/2] package/rpi-firmware: bump version to
 5476720
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>, Athaariq Ardhiansyah <foss@athaariq.my.id>,
 buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAgNyBKdW4gMjAyNCAwOToxMzo1OSArMDIwMApHYcOrbCBQT1JUQVkgPGdhZWwucG9y
dGF5QHJ0b25lLmZyPiB3cm90ZToKCj4gVmVyc2lvbiA1NDc2NzIwIG1hdGNoIHRoZSB3aXRoIGtl
cm5lbCA2LjYuMjguCj4gCj4gU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRh
eUBydG9uZS5mcj4KPiAtLS0KPiAgcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLmhh
c2ggfCAyICstCj4gIHBhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tayAgIHwgMiAr
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENU
TywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
