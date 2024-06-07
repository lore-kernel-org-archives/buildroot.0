Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF51C27C55
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 07:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3C4B42585;
	Fri,  7 Jun 2024 07:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4QI4h3HCUG4; Fri,  7 Jun 2024 07:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 803C74257B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 803C74257B;
	Fri,  7 Jun 2024 07:20:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4AE61BF4D6
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 07:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D25B6614EE
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 07:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OPzxAKtSW2zh for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 07:20:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7ADA2614E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ADA2614E8
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7ADA2614E8
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 07:20:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52bbf73f334so160258e87.2
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 00:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717744807; x=1718349607;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JKxEsI2dkL9bQIu0OyZxnzEhNLojgJ3nP5f8YbX4N7w=;
 b=FENEy4E8TI9DlF/ItMENrobpUNZXWrh4CEmtTF/b40B4XB99TLrxeo7VaCDYwXw9ss
 C7avxxF2ZFcvDNMS1rfZCnXcFZE8dC4nMM+DYED+P2yBdTRIU86qMt3Eck3fKnBfWkle
 ZjPInDxoV+r5psAY7E6xxsZHNJl/4GGnf3xRVaoFeuaSVJgZ23/3qkviVk7dLBWw1oIk
 HkOY9mebykB8OOnmtEbU8mhghQzjY00KLdCs5qq8nkS0MTqP/wfw58Gh+3zoqhZpKpqi
 KvHPTiLBYzE/eiC/b+JBR517QyDZjooVUVMlEQMtgOsW1ZiMdar8ZvWtdhyaip7MeveB
 v/AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj+CbbmHeln2rjFHPALpoB09kT5Rtxm6zbVO9p1Os1/PaDF4uZXDWvmHwOT6TErfe8KoCGMr0gvcyFNbsANAbC61UeJxHMNw==
X-Gm-Message-State: AOJu0YzjHvpPPtCZsTBel0pyWvSHvc/KMM2pGga8sIJtIglKt4PfD2DQ
 W3OcZzFKIhBayP49qGKwOnwEYvlHblkBCLQn3xHcJu1Obb+eIgNAs4U3UHohxhQ=
X-Google-Smtp-Source: AGHT+IFde58OknOm/HHW0X7UtFwXldOdrN3v2pBRvLQcXIv+f9+Rrft7AarY7MDRqARZ4R3PUOt6Ug==
X-Received: by 2002:ac2:58f5:0:b0:52b:8d83:b861 with SMTP id
 2adb3069b0e04-52bb9fd3e2dmr938121e87.65.1717744807036; 
 Fri, 07 Jun 2024 00:20:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c1aa1desm44414705e9.11.2024.06.07.00.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 00:20:06 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 07 Jun 2024 09:20:06 +0200
Message-Id: <D1TLPQ2S848C.3UTS7VB4VB2CI@rtone.fr>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>
To: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>, "Athaariq
 Ardhiansyah" <foss@athaariq.my.id>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
X-Mailer: aerc 0.17.0
References: <20240427020431.415608-1-gael.portay@rtone.fr>
 <ZmHF4fZb6N9kZ8OR@landeda>
 <8cc5e464-b748-4b81-8b2d-74417b5a3f8d@athaariq.my.id>
 <D1TL4FV7LWLX.3HU142WOJPYGA@rtone.fr>
In-Reply-To: <D1TL4FV7LWLX.3HU142WOJPYGA@rtone.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1717744807; x=1718349607; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JKxEsI2dkL9bQIu0OyZxnzEhNLojgJ3nP5f8YbX4N7w=;
 b=I38V4b9hNibNfP+AD4moQbcWEm4+P0Ng75loQ7En0xD7qdH1LAXjIlEaYHpKwzON2e
 +1LECxF7TXujNHowVNc0AP3igXRXQEF14QikeDUmBhExinQxlR9gpqc4d0tpe61tgqn8
 99B94k95aHd68qmrx/z9NXY2S3YDAByFgZyPk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=rtone.fr header.i=@rtone.fr header.a=rsa-sha256
 header.s=google header.b=I38V4b9h
Subject: Re: [Buildroot] [RESEND PATCH v3 1/1] configs: add raspberrypi 5
 defconfig
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpIEp1biA3LCAyMDI0IGF0IDg6NTIgQU0gQ0VTVCwgR2HDq2wgUE9SVEFZIHdyb3RlOgo+
IFlvdSBtYXkgY29uc2lkZXIgdGhlc2UgcGF0Y2ggc2VyaWVbMV0gdGhhdCBidW1wcyB0aGUga2Vy
bmVsIHRvIDYuNi4yODsKPiBpdCBuZWVkcyBhIHJlYmFzZSBhbmQgYW4gdXBkYXRlIGZvciB0aGUg
cGk1Lgo+Cj4gWzFdOiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRy
b290L2NvdmVyLzIwMjQwNDI3MDE0MDUzLjQxMDc4OS0xLWdhZWwucG9ydGF5QHJ0b25lLmZyLwoK
VG8gbGV0IHlvdSBrbm93LCBJIGhhdmUgc2VudCBhIHYyWzFdLgoKQWxzbywgSSBoYXZlIHRoaXMg
YXR0ZW1wdCB0byBhdm9pZCBoYXZpbmcgdG8ga2VlcCBzeW5jIHRoZSBwYWNrYWdlCnJwaS1maXJt
d2FyZSBhbmQgdGhlIGxpbnV4LXJhc3BiZXJyeSB0cmVlIChmb3IgdGhlIGR0Ym8pWzJdLgoKWzFd
OiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nl
cmllcz00MDk5NDQKWzJdOiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L2NvdmVyLzIwMjQwNDEyMTQwOTQ1LjE2MjY1NzktMS1nYWVsLnBvcnRheUBydG9uZS5m
ci8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
