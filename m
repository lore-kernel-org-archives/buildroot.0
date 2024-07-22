Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A20AC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D92A40437;
	Mon, 22 Jul 2024 12:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XevUlYofISBF; Mon, 22 Jul 2024 12:08:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B781C40640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B781C40640;
	Mon, 22 Jul 2024 12:08:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E69C1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 783AD4025F
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8pPDDkEl1hk for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:08:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 226FD4024A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 226FD4024A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 226FD4024A
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:08:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DA87FF80C;
 Mon, 22 Jul 2024 12:08:33 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:08:32 +0200
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20240722140832.40e3ea1d@windsurf>
In-Reply-To: <20240722093710.1903540-1-vincent.stehle@arm.com>
References: <20240722093710.1903540-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721650113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g/AOzvZ4fPQy5cZFHvCWjX5KoB/KZPPX/W5gH/PbGwU=;
 b=kJuQ4pEgD5ny14QcENqOXUrv2NZ0PdsJf4f26PQf93Aa5609kPY6kfUWlFKFgaHt8mXYeR
 NufQw0sHd5zjVcrRc+6vG5P08t15/YNx/+pesild9nvrdSULnUOC67f0tabEkPClOUJYme
 lZM1rCanq2VQa/nN3OkeGBXIcgLvopqbEVE18+rNKOIWFEW5+hKTzUXRsU2aWnmHQiUArm
 CBjPysKX800NsomQQ154+rbOqqd2fAk1AZScvJTPDGYObriFI6taBQuOR1o1Ey0r45IeO5
 rzEJRu1P+e5HY3tDRGCcTj8VKk3fYA1/rvNJmZM9EylM3uKis9HM7VCQ2bOvQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kJuQ4pEg
Subject: Re: [Buildroot] [PATCH] configs/qemu_arm_ebbr: linux needs
 host-openssl
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAyMiBKdWwgMjAyNCAxMTozNzoxMCArMDIwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiBUaGUga2VybmVsIGJ1aWxkIG5lZWRzIGhvc3Qt
b3BlbnNzbDsgYWRkIGl0IHRvIHRoZSBjb25maWd1cmF0aW9uLgo+IAo+IEluIHByYWN0aWNlIHRo
ZSBkb2N1bWVudGVkIGJ1aWxkIHJlY2lwZSB3b3JrcyBmaW5lIGFuZCB0aGUgYnVpbGQgZmFpbHVy
ZXMKPiBjYW4gb25seSBiZSBzZWVuIHdpdGggaGlnaGx5IHBhcmFsbGVsIGJ1aWxkcyB1c2luZyBw
ZXItcGFja2FnZSBkaXJlY3Rvcmllcy4KPiAKPiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgY29t
cGlsYXRpb24gZXJyb3I6Cj4gCj4gICBjZXJ0cy9leHRyYWN0LWNlcnQuYzoyMToxMDogZmF0YWwg
ZXJyb3I6IG9wZW5zc2wvYmlvLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiAKPiBGaXhl
czogNzExNWFiMzkxODlhNmM2NjA3NDUyNjdkOGJmMGJmNDFjZjhiM2RiNwo+IFNpZ25lZC1vZmYt
Ynk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IC0tLQo+ICBjb25maWdzL3FlbXVfYXJt
X2ViYnJfZGVmY29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoK
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwg
Q1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6
Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
