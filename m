Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57EFC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 22:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7238040BA4;
	Tue, 30 Jul 2024 22:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9wowGdyDsNo; Tue, 30 Jul 2024 22:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E75440BAF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E75440BAF;
	Tue, 30 Jul 2024 22:04:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF82B1BF5AE
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 22:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94A9380CB9
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 22:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ucSDFh7A8c1E for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 22:04:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63D0580DA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63D0580DA3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63D0580DA3
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 22:04:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D2A820009;
 Tue, 30 Jul 2024 22:04:00 +0000 (UTC)
Date: Wed, 31 Jul 2024 00:03:59 +0200
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>
Message-ID: <20240731000359.270740ba@windsurf>
In-Reply-To: <20240719-ztext-v5-1-ec46696d4ed9@gmx.net>
References: <20240719-ztext-v5-1-ec46696d4ed9@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722377040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rMApUEivtK26H8+XDE4/n522kuI6uX9kotvWbFsI5nw=;
 b=HI2zEWrjgMKa1V5OYIzg7sY1yYXkw+/qB9zA7tHfMIe+sPuGetmcNR/e2la8MdgPibZ823
 QcNSzU9OlVrEfNI6v/loU3vDNbr1XL+SmM+s8Bo6EOjQJDuRKBHCWMxfdktVCyC8MCT9fi
 beXzthBxKFjK+GheTaqMU+W3RhyNuZUuSTeAkl5xSZQibWwcDALKz0c+hlIotBv3ulDaXe
 Se4UqkdwJXbm9LoU0Q0g/SvlJ/0IIe+fmQiJGO84VLnme87SSdxKuf3X9q+yp3niptRiOZ
 ubcmCXfR3wDk4Phc7LR1WRGZ3nHSwSzfQygrkA7yHqFu2DYAnU3DMxcTM21AwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HI2zEWrj
Subject: Re: [Buildroot] [PATCH v5] Config.in: ban textrels on musl
 toolchains
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSiwKCk9uIEZyaSwgMTkgSnVsIDIwMjQgMTc6Mjc6MTkgKzAyMDAKSi4gTmV1c2Now6Rm
ZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiArIyBT
ZWUgYWxzbzogaHR0cHM6Ly93d3cub3BlbndhbGwuY29tL2xpc3RzL211c2wvMjAyMC8wOS8yNS80
Cj4gK2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wpOiQoQlIyX1NUQVRJQ19MSUJTKSx5
OikKPiArVEFSR0VUX0xERkxBR1MgKz0gLVdsLC16LHRleHQKPiArZW5kaWYKClVuZm9ydHVuYXRl
bHksIHRoaXMgY2hhbmdlIGlzIGJyZWFraW5nIHRoZSBidWlsZCBvZiBnbnUtZWZpOgoKICBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9lM2QvZTNkZWM3ZTAzMjNhM2ZjYjA3
MjY5YjNmOWU3M2JlY2FhZmVlZGVjZC9idWlsZC1lbmQubG9nCgpJdCBzZWVtcyBsaWtlIGdudS1l
ZmkgdXNlcyAkKFRBUkdFVF9MREZMQUdTKSBkaXJlY3RseSBhcyBhcmd1bWVudHMgdG8KdGhlIGxp
bmtlciwgbm90IGFzIGFyZ3VtZW50cyB0byBnY2MtdXNlZC1hcy1hLWxpbmtlciwgYW5kIHRoZSBs
aW5rZXIKZG9lc24ndCBrbm93IGFib3V0IC1XbCwteiwtdGV4dC4KClNvLCBlaXRoZXIgd2UgdG8g
Ii16IHRleHQiIHdoaWNoIEkgYmVsaWV2ZSBpcyB1bmRlcnN0b29kIGJ5IGJvdGggZ2NjCmFuZCBs
ZCwgb3Igd2Ugc29tZWhvdyBmaXggZ251LWVmaS4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9u
aSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
