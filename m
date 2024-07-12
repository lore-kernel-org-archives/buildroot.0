Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA424C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A269141864;
	Fri, 12 Jul 2024 14:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lORlUtnIeMXy; Fri, 12 Jul 2024 14:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 662C641866
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 662C641866;
	Fri, 12 Jul 2024 14:44:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A409F1BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90EBE4043E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXa1n90sJaAz for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:44:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 55B0740185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55B0740185
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55B0740185
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:44:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B411C0003;
 Fri, 12 Jul 2024 14:44:38 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:44:37 +0200
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Message-ID: <20240712164437.1137d0c0@windsurf>
In-Reply-To: <89da691d-0f62-4e00-803d-4bfe49641ffd@mind.be>
References: <20240607071359.767329-1-gael.portay@rtone.fr>
 <20240607071359.767329-3-gael.portay@rtone.fr>
 <89da691d-0f62-4e00-803d-4bfe49641ffd@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720795479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vs4eSS+RgDa1qUSh7xrQVyEcQ8kI253PR6zS2jSmuFM=;
 b=RDnwbGGeOmqyqCwZ0+evLL8tg6m3QI6IO5i9g5Ems50eVPM8CBZiFzIeMR0TMXhXKZISBp
 fwy0KCMm4bE1OwyL2WfEeJITkHj4W9TkAUG+pCwwTX5HqE3QYoDEZ9SRCekofi68XJlQMe
 iZCzoyd2sEjhkOI3guIrBRg+etJaH4RHW+LbG90eiNfUmp3OYSkpy43nQtAyCgOsCB/LvV
 C6H6o0492hyXAdY+EhDP5kwWjz+/MwyShopHVx51C2921paqg6sUio5GROdUtDJHSMLF8X
 iwX95nLGkxHwN8/thasbNZhtHjSw/QEK9e2HdQCVNq7GLEw4EU4x9rBlKu6B8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RDnwbGGe
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
Cc: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>, Athaariq Ardhiansyah <foss@athaariq.my.id>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyMSBKdW4gMjAyNCAyMzo1MToyNCArMDIwMApBcm5vdXQgVmFuZGVjYXBwZWxsZSB2
aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+ICAgRWFybGll
ciwgQXRoYWFyaXEgc2VudCBhIHBhdGNoIFsxXSB0aGF0IHVwZGF0ZXMgdG8gYSBtb3JlIHJlY2Vu
dCB2ZXJzaW9uIGFuZCAKPiBhbHNvIG1vdmVzIHRvIHRoZSBzdGFibGUgYnJhbmNoLiBJIHRoaW5r
IEkgcHJlZmVyIHRoYXQgb25lLgoKSSB3b3VsZCB0ZW5kIHRvIGFncmVlLCBidXQgSSBuZXZlcnRo
ZWxlc3MgYXBwbGllZCB0aGlzIHBhdGNoIGZyb20gR2HDq2wKYmVjYXVzZSBpdCBoYXMgYmVlbiB0
ZXN0ZWQgaW4gY29uanVuY3Rpb24gd2l0aCB0aGUgTGludXgga2VybmVsIHVwZGF0ZSwKd2hpbGUg
dGhlIHBhdGNoIHNlcmllcyBmcm9tIEF0aGFhcmlxIHdhcyBzdGlsbCByZWx5aW5nIG9uIHRoZSAi
b2xkZXIiCmtlcm5lbCwgYW5kIEdhw6tsIG5vdGVkIHRoaXMgZmlybXdhcmUgdXBkYXRlIHdhcyBt
YWRlIHRvIG1hdGNoIHdpdGggdGhlCnVwZGF0ZSB0byB0aGUgNi42LjI4IGtlcm5lbC4KClNvLCBH
YcOrbCwgQXRoYWFyaXEgcGxlYXNlIGNvb3JkaW5hdGUgdG8gc2VuZCBhbiB1cGRhdGUgdG8gcnBp
LWZpcm13YXJlCnRoYXQgdXNlcyB0aGUgc3RhYmxlIGJyYW5jaCwgYW5kIHRoYXQgd29ya3Mgd2l0
aCB0aGUgY3VycmVudCBSUGkga2VybmVsCndlIHVzZS4KClRoYW5rcyEKClRob21hcwotLSAKVGhv
bWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
