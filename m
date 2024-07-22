Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63AFC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90C3B403E4;
	Mon, 22 Jul 2024 12:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvzHFvK7h2TN; Mon, 22 Jul 2024 12:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B3BD40499
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B3BD40499;
	Mon, 22 Jul 2024 12:48:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABFBF1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A18E605C8
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYeguxg2GLC6 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:48:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BD98605C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD98605C7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BD98605C7
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:48:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 614E81BF20A;
 Mon, 22 Jul 2024 12:48:00 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:47:59 +0200
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Message-ID: <20240722144759.4084dd9b@windsurf>
In-Reply-To: <20240709-tipidee-v2-2-a69a8668005e@gmx.net>
References: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
 <20240709-tipidee-v2-2-a69a8668005e@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721652480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGnIzRy4ps/uifAPgV5XGyXMs3inbKr/mfgfOLs1C+c=;
 b=Sc0/A0it/5T2QXMZPLFTUJypPtBVI0T5mw6zQZ5EtSPDyUoqkeKGTjRiGQobrSvfqfwObg
 Uk5TI2ui8qSgAwGc94BYMBXPoSs65kpgTrA30SmqA9K4d6bSK9EjBcz/WqSi7zyH+T9cuv
 jpTx3tJRxhaH2VT2q/feAV5t0ZucWXzNl2ohQAPbRiQmfz5TM3dVO4llkyJv0EVTzRYUJI
 0L4JOQLwhzTZCrUPNu2hClnkKrlbnCZEmOHklgAlCvxqul1OyD9Riln7aHrrBW7K01oSqB
 OBGiLTqhk4HmxENhmEcjBw39s393LvtMNQcXuyVhdSehcnowzbnx04Lg0/WBBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Sc0/A0it
Subject: Re: [Buildroot] [PATCH v2 2/8] s6: bump to version 2.13.0.1
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

SGVsbG8gSiwKCk9uIFR1ZSwgMDkgSnVsIDIwMjQgMDA6NDU6MzMgKzAyMDAKSi4gTmV1c2Now6Rm
ZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBTaWdu
ZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0Pgo+IC0tLQo+
ICBwYWNrYWdlL3M2L3M2Lmhhc2ggfCAyICstCj4gIHBhY2thZ2UvczYvczYubWsgICB8IDIgKy0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpJIGRv
bid0IGtub3cgZm9yIHN1cmUgaWYgaXQncyByZWxhdGVkIHRvIHRoZSB2ZXJzaW9uIGJ1bXAsIGJ1
dCBvdXIgczYKcnVudGltZSB0ZXN0IGlzIGZhaWxpbmcuIFNlZToKCiAgaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy83MzkxNzkzMTk1CgpbQlJURVNUIyBz
Ni10ZXN0IC1wIHRlc3RwaXBlCi1zaDogczYtdGVzdDogbm90IGZvdW5kCgpDb3VsZCB5b3UgaGF2
ZSBhIGxvb2sgcGVyaGFwcyA/CgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
